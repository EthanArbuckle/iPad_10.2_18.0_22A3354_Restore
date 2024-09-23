unint64_t sub_1BA29DC9C()
{
  unint64_t result;

  result = qword_1EF27FB50;
  if (!qword_1EF27FB50)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA790, &type metadata for FeedGroupAdData.Article.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FB50);
  }
  return result;
}

unint64_t sub_1BA29DCE0()
{
  unint64_t result;

  result = qword_1EF27FB58;
  if (!qword_1EF27FB58)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for FeedGroupAdData.AdjacentPosition, &type metadata for FeedGroupAdData.AdjacentPosition);
    atomic_store(result, (unint64_t *)&qword_1EF27FB58);
  }
  return result;
}

uint64_t FeedGroupAdData.Article.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;

  v32 = a2;
  sub_1BA236F78(0, &qword_1EF27FB60, (uint64_t (*)(void))sub_1BA29DC9C, (uint64_t)&type metadata for FeedGroupAdData.Article.CodingKeys, MEMORY[0x1E0DED048]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v26 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA29DC9C();
  sub_1BA2C2744();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v31 = a1;
  v9 = v6;
  v39 = 0;
  v10 = v5;
  v11 = sub_1BA2C2600();
  v13 = v12;
  v38 = 1;
  swift_bridgeObjectRetain();
  v14 = sub_1BA2C2600();
  v30 = v15;
  v16 = v14;
  v37 = 2;
  swift_bridgeObjectRetain();
  v29 = 0;
  v27 = sub_1BA2C25E8();
  v18 = v17;
  sub_1BA229250(0, (unint64_t *)&qword_1ED5B2B70);
  v36 = 3;
  sub_1BA29E108(&qword_1EF27E9D0, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEAF40]);
  swift_bridgeObjectRetain();
  sub_1BA2C2630();
  v28 = v18;
  v26 = v16;
  v20 = v33;
  v34 = 4;
  sub_1BA29E174();
  swift_bridgeObjectRetain();
  sub_1BA2C2630();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v8, v10);
  v21 = v35;
  v22 = (uint64_t)v31;
  v23 = v32;
  *v32 = v11;
  v23[1] = v13;
  v24 = v30;
  v23[2] = v26;
  v23[3] = v24;
  v25 = v28;
  v23[4] = v27;
  v23[5] = v25;
  v23[6] = v20;
  *((_BYTE *)v23 + 56) = v21;
  __swift_destroy_boxed_opaque_existential_1(v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA29E108(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    sub_1BA229250(255, (unint64_t *)&qword_1ED5B2B70);
    v8 = a2;
    result = MEMORY[0x1BCCD93D0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BA29E174()
{
  unint64_t result;

  result = qword_1EF27FB68;
  if (!qword_1EF27FB68)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for FeedGroupAdData.AdjacentPosition, &type metadata for FeedGroupAdData.AdjacentPosition);
    atomic_store(result, (unint64_t *)&qword_1EF27FB68);
  }
  return result;
}

uint64_t sub_1BA29E1B8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return FeedGroupAdData.Article.init(from:)(a1, a2);
}

uint64_t sub_1BA29E1CC(_QWORD *a1)
{
  return FeedGroupAdData.Article.encode(to:)(a1);
}

uint64_t FeedGroupAdData.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FeedGroupAdData.adCategories.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeedGroupAdData.adKeywords.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeedGroupAdData.languages.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeedGroupAdData.contentProviderID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t FeedGroupAdData.channelIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FeedGroupAdData.adjacentArticles.getter()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall FeedGroupAdData.init(identifier:adCategories:adKeywords:languages:contentProviderID:channelIdentifier:adjacentArticles:)(NewsAds::FeedGroupAdData *__return_ptr retstr, Swift::String identifier, Swift::OpaquePointer adCategories, Swift::OpaquePointer adKeywords, Swift::OpaquePointer languages, Swift::Int contentProviderID, Swift::String_optional channelIdentifier, Swift::OpaquePointer adjacentArticles)
{
  retstr->identifier = identifier;
  retstr->adCategories = adCategories;
  retstr->adKeywords = adKeywords;
  retstr->languages = languages;
  retstr->contentProviderID = contentProviderID;
  retstr->channelIdentifier = channelIdentifier;
  retstr->adjacentArticles = adjacentArticles;
}

uint64_t sub_1BA29E27C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA29E2B4 + 4 * byte_1BA2CA1D9[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_1BA29E2B4()
{
  return 0x6F67657461436461;
}

uint64_t sub_1BA29E2D4()
{
  return 0x726F7779654B6461;
}

uint64_t sub_1BA29E2EC()
{
  return 0x65676175676E616CLL;
}

unint64_t sub_1BA29E308()
{
  return 0xD000000000000011;
}

unint64_t sub_1BA29E330()
{
  return 0xD000000000000010;
}

uint64_t sub_1BA29E350()
{
  unsigned __int8 *v0;

  return sub_1BA29E27C(*v0);
}

uint64_t sub_1BA29E358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA29F960(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BA29E37C(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_1BA29E388()
{
  sub_1BA29E6A0();
  return sub_1BA2C275C();
}

uint64_t sub_1BA29E3B0()
{
  sub_1BA29E6A0();
  return sub_1BA2C2768();
}

uint64_t FeedGroupAdData.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;

  sub_1BA236F78(0, &qword_1EF27FB70, (uint64_t (*)(void))sub_1BA29E6A0, (uint64_t)&type metadata for FeedGroupAdData.CodingKeys, MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v15 - v6;
  v8 = v1[2];
  v21 = v1[3];
  v22 = v8;
  v9 = v1[4];
  v19 = v1[5];
  v20 = v9;
  v10 = v1[7];
  v17 = v1[6];
  v18 = v10;
  v16 = v1[8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA29E6A0();
  sub_1BA2C2750();
  LOBYTE(v25) = 0;
  v11 = v23;
  sub_1BA2C2654();
  if (!v11)
  {
    v13 = v20;
    v12 = v21;
    v25 = v22;
    v24 = 1;
    sub_1BA229250(0, (unint64_t *)&qword_1ED5B2B70);
    sub_1BA29E108(&qword_1EF27E9C0, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEAF10]);
    sub_1BA2C2684();
    v25 = v12;
    v24 = 2;
    sub_1BA2C2684();
    v25 = v13;
    v24 = 3;
    sub_1BA2C2684();
    LOBYTE(v25) = 4;
    sub_1BA2C2678();
    LOBYTE(v25) = 5;
    sub_1BA2C263C();
    v25 = v16;
    v24 = 6;
    sub_1BA229250(0, &qword_1EF27FB80);
    sub_1BA29ECA4(&qword_1EF27FB88, (uint64_t (*)(void))sub_1BA29E6E4, MEMORY[0x1E0DEAF10]);
    sub_1BA2C2684();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BA29E6A0()
{
  unint64_t result;

  result = qword_1EF27FB78;
  if (!qword_1EF27FB78)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA740, &type metadata for FeedGroupAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FB78);
  }
  return result;
}

unint64_t sub_1BA29E6E4()
{
  unint64_t result;

  result = qword_1EF27FB90;
  if (!qword_1EF27FB90)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for FeedGroupAdData.Article, &type metadata for FeedGroupAdData.Article);
    atomic_store(result, (unint64_t *)&qword_1EF27FB90);
  }
  return result;
}

uint64_t FeedGroupAdData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v37 = a2;
  sub_1BA236F78(0, &qword_1EF27FB98, (uint64_t (*)(void))sub_1BA29E6A0, (uint64_t)&type metadata for FeedGroupAdData.CodingKeys, MEMORY[0x1E0DED048]);
  v38 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v29 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA29E6A0();
  sub_1BA2C2744();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v35 = a1;
  v36 = v5;
  LOBYTE(v40) = 0;
  v8 = v38;
  v9 = v7;
  v10 = sub_1BA2C2600();
  v12 = v11;
  sub_1BA229250(0, (unint64_t *)&qword_1ED5B2B70);
  v39 = 1;
  sub_1BA29E108(&qword_1EF27E9D0, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEAF40]);
  swift_bridgeObjectRetain();
  sub_1BA2C2630();
  v39 = 2;
  v13 = v40;
  swift_bridgeObjectRetain();
  sub_1BA2C2630();
  v34 = v13;
  v15 = v40;
  v39 = 3;
  swift_bridgeObjectRetain();
  sub_1BA2C2630();
  v33 = v15;
  v16 = v40;
  LOBYTE(v40) = 4;
  swift_bridgeObjectRetain();
  v17 = sub_1BA2C2624();
  v18 = v36;
  v31 = v17;
  v32 = v16;
  LOBYTE(v40) = 5;
  v29[0] = sub_1BA2C25E8();
  v29[1] = 0;
  v20 = v19;
  sub_1BA229250(0, &qword_1EF27FB80);
  v39 = 6;
  sub_1BA29ECA4(&qword_1EF27FBA0, (uint64_t (*)(void))sub_1BA29ED18, MEMORY[0x1E0DEAF40]);
  v30 = v20;
  swift_bridgeObjectRetain();
  sub_1BA2C2630();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v8);
  v21 = v40;
  swift_bridgeObjectRetain();
  v22 = v34;
  swift_bridgeObjectRetain();
  v23 = v10;
  v24 = v33;
  swift_bridgeObjectRetain();
  v25 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v26 = v37;
  *v37 = v23;
  v26[1] = v12;
  v26[2] = v22;
  v26[3] = v24;
  v28 = v30;
  v27 = v31;
  v26[4] = v25;
  v26[5] = v27;
  v26[6] = v29[0];
  v26[7] = v28;
  v26[8] = v21;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA29ECA4(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_1BA229250(255, &qword_1EF27FB80);
    v8 = v7;
    v9 = a2();
    result = MEMORY[0x1BCCD93D0](a3, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BA29ED18()
{
  unint64_t result;

  result = qword_1EF27FBA8;
  if (!qword_1EF27FBA8)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for FeedGroupAdData.Article, &type metadata for FeedGroupAdData.Article);
    atomic_store(result, (unint64_t *)&qword_1EF27FBA8);
  }
  return result;
}

uint64_t sub_1BA29ED5C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return FeedGroupAdData.init(from:)(a1, a2);
}

uint64_t sub_1BA29ED70(_QWORD *a1)
{
  return FeedGroupAdData.encode(to:)(a1);
}

uint64_t sub_1BA29ED84(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0x3B)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_1BA29ED9C()
{
  unint64_t result;

  result = qword_1EF27FBB0;
  if (!qword_1EF27FBB0)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for FeedGroupAdData.AdjacentPosition, &type metadata for FeedGroupAdData.AdjacentPosition);
    atomic_store(result, (unint64_t *)&qword_1EF27FBB0);
  }
  return result;
}

_QWORD *assignWithCopy for FeedGroupAdData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FeedGroupAdData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t storeEnumTagSinglePayload for FeedGroupAdData.AdjacentPosition(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1BA29EF7C + 4 * byte_1BA2CA25B[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BA29EFB0 + 4 * byte_1BA2CA256[v4]))();
}

uint64_t sub_1BA29EFB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA29EFB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA29EFC0);
  return result;
}

uint64_t sub_1BA29EFCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA29EFD4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BA29EFD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA29EFE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t initializeWithCopy for FeedGroupAdData.Article(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FeedGroupAdData.Article(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for FeedGroupAdData.Article(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedGroupAdData.Article(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedGroupAdData.Article(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_1BA29F20C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for FeedGroupAdData.Kind(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FeedGroupAdData.Kind(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedGroupAdData.Kind(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFC4 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483589);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 58;
  if (v4 >= 0x3C)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FeedGroupAdData.Kind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFC5)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483589;
    if (a3 >= 0x7FFFFFC5)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFC5)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 58;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for FeedGroupAdData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1BA29F448 + 4 * byte_1BA2CA265[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1BA29F47C + 4 * byte_1BA2CA260[v4]))();
}

uint64_t sub_1BA29F47C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA29F484(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA29F48CLL);
  return result;
}

uint64_t sub_1BA29F498(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA29F4A0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1BA29F4A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA29F4AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeedGroupAdData.CodingKeys()
{
  return &type metadata for FeedGroupAdData.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for FeedGroupAdData.Article.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1BA29F514 + 4 * byte_1BA2CA26F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1BA29F548 + 4 * byte_1BA2CA26A[v4]))();
}

uint64_t sub_1BA29F548(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA29F550(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA29F558);
  return result;
}

uint64_t sub_1BA29F564(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA29F56CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1BA29F570(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA29F578(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeedGroupAdData.Article.CodingKeys()
{
  return &type metadata for FeedGroupAdData.Article.CodingKeys;
}

unint64_t sub_1BA29F598()
{
  unint64_t result;

  result = qword_1EF27FBB8;
  if (!qword_1EF27FBB8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA660, &type metadata for FeedGroupAdData.Article.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FBB8);
  }
  return result;
}

unint64_t sub_1BA29F5E0()
{
  unint64_t result;

  result = qword_1EF27FBC0;
  if (!qword_1EF27FBC0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA718, &type metadata for FeedGroupAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FBC0);
  }
  return result;
}

unint64_t sub_1BA29F628()
{
  unint64_t result;

  result = qword_1EF27FBC8;
  if (!qword_1EF27FBC8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA688, &type metadata for FeedGroupAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FBC8);
  }
  return result;
}

unint64_t sub_1BA29F670()
{
  unint64_t result;

  result = qword_1EF27FBD0;
  if (!qword_1EF27FBD0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA6B0, &type metadata for FeedGroupAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FBD0);
  }
  return result;
}

unint64_t sub_1BA29F6B8()
{
  unint64_t result;

  result = qword_1EF27FBD8;
  if (!qword_1EF27FBD8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA5D0, &type metadata for FeedGroupAdData.Article.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FBD8);
  }
  return result;
}

unint64_t sub_1BA29F700()
{
  unint64_t result;

  result = qword_1EF27FBE0;
  if (!qword_1EF27FBE0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CA5F8, &type metadata for FeedGroupAdData.Article.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FBE0);
  }
  return result;
}

uint64_t sub_1BA29F744(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xE800000000000000 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7364726F7779656BLL && a2 == 0xE800000000000000 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001BA2CD340)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_1BA29F960(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F67657461436461 && a2 == 0xEC00000073656972 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F7779654B6461 && a2 == 0xEA00000000007364 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xE900000000000073 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BA2CE080 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BA2D1950 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001BA2D1970)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

unint64_t sub_1BA29FC54()
{
  unint64_t result;

  result = qword_1EF27FBE8;
  if (!qword_1EF27FBE8)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for FeedGroupAdData.AdjacentPosition, &type metadata for FeedGroupAdData.AdjacentPosition);
    atomic_store(result, (unint64_t *)&qword_1EF27FBE8);
  }
  return result;
}

uint64_t static SponsorshipAdInfo.Fulfilled.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_1BA2A01AC(a1, a2, (void (*)(uint64_t, _QWORD *))sub_1BA2A0EB8, (void (*)(_QWORD *))sub_1BA2A02EC) & 1;
}

uint64_t sub_1BA29FCC0(uint64_t a1, uint64_t a2)
{
  return sub_1BA2A01AC(a1, a2, (void (*)(uint64_t, _QWORD *))sub_1BA2A0EB8, (void (*)(_QWORD *))sub_1BA2A02EC) & 1;
}

uint64_t SponsorshipAdInfo.Unfilled.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SponsorshipAdInfo.Unfilled.placementIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SponsorshipAdInfo.Unfilled.backingTagIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SponsorshipAdInfo.Unfilled.journal.getter()
{
  return swift_retain();
}

uint64_t static SponsorshipAdInfo.Unfilled.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_1BA2A01AC(a1, a2, (void (*)(uint64_t, _QWORD *))sub_1BA2A0E84, (void (*)(_QWORD *))sub_1BA2A02C0) & 1;
}

uint64_t sub_1BA29FD9C(uint64_t a1, uint64_t a2)
{
  return sub_1BA2A01AC(a1, a2, (void (*)(uint64_t, _QWORD *))sub_1BA2A0E84, (void (*)(_QWORD *))sub_1BA2A02C0) & 1;
}

uint64_t SponsorshipAdInfo.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD v3[6];
  uint64_t v4;
  _OWORD v5[6];
  uint64_t v6;
  char v7;

  sub_1BA2A028C(v0, (uint64_t)v5);
  v3[4] = v5[4];
  v3[5] = v5[5];
  v4 = v6;
  v3[0] = v5[0];
  v3[1] = v5[1];
  v3[2] = v5[2];
  v3[3] = v5[3];
  v1 = *(_QWORD *)&v5[0];
  if ((v7 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BA2A02C0((uint64_t)v3);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1BA2A02EC((uint64_t)v3);
  }
  return v1;
}

uint64_t SponsorshipAdInfo.placementIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD v3[6];
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;

  sub_1BA2A028C(v0, (uint64_t)&v5);
  v3[4] = v9;
  v3[5] = v10;
  v4 = v11;
  v3[0] = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  v1 = v6;
  if ((v12 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BA2A02C0((uint64_t)v3);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1BA2A02EC((uint64_t)v3);
  }
  return v1;
}

uint64_t SponsorshipAdInfo.backingTagIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD v3[6];
  uint64_t v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  char v11;

  sub_1BA2A028C(v0, (uint64_t)v5);
  v3[2] = v6;
  v3[3] = v7;
  v3[4] = v8;
  v3[5] = v9;
  v4 = v10;
  v3[0] = v5[0];
  v3[1] = v5[1];
  v1 = v6;
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BA2A02C0((uint64_t)v3);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1BA2A02EC((uint64_t)v3);
  }
  return v1;
}

uint64_t SponsorshipAdInfo.journal.getter()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD v3[6];
  uint64_t v4;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  sub_1BA2A028C(v0, (uint64_t)v5);
  v3[4] = v7;
  v3[5] = v8;
  v4 = v9;
  v3[0] = v5[0];
  v3[1] = v5[1];
  v3[2] = v5[2];
  v3[3] = v6;
  v1 = v6;
  if ((v10 & 1) != 0)
  {
    swift_retain();
    sub_1BA2A02C0((uint64_t)v3);
  }
  else
  {
    swift_retain();
    sub_1BA2A02EC((uint64_t)v3);
  }
  return v1;
}

void __swiftcall SponsorshipAdInfo.metricsView()(UIView_optional *__return_ptr retstr)
{
  uint64_t v1;
  __int128 v2;
  void (*v3)(id, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(id, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[3];
  _OWORD v16[3];
  id v17;
  _OWORD v18[5];
  __int128 v19;
  void *v20;
  char v21;

  sub_1BA2A028C(v1, (uint64_t)v18);
  v16[1] = v18[4];
  v16[2] = v19;
  v17 = v20;
  v15[0] = v18[0];
  v15[1] = v18[1];
  v15[2] = v18[2];
  v16[0] = v18[3];
  v2 = v19;
  if ((v21 & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)v16 + 1, v19);
    v3 = *(void (**)(id, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*((_QWORD *)&v2 + 1) + 16);
    v4 = v17;
    v3(v4, v2, *((_QWORD *)&v2 + 1), v5, v6, v7, v8);

    sub_1BA2A02C0((uint64_t)v15);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)v16 + 1, v19);
    v9 = *(void (**)(id, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*((_QWORD *)&v2 + 1) + 16);
    v10 = v17;
    v9(v10, v2, *((_QWORD *)&v2 + 1), v11, v12, v13, v14);

    sub_1BA2A02EC((uint64_t)v15);
  }
}

uint64_t sub_1BA2A01AC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, _QWORD *), void (*a4)(_QWORD *))
{
  char v9;
  char v10;
  _QWORD v12[13];
  _QWORD v13[13];

  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24))
  {
    a3(a1, v13);
    a3(a2, v12);
  }
  else
  {
    v9 = sub_1BA2C26A8();
    a3(a1, v13);
    a3(a2, v12);
    v10 = 0;
    if ((v9 & 1) == 0)
      goto LABEL_12;
  }
  if (v13[0] == v12[0] && v13[1] == v12[1])
    v10 = 1;
  else
    v10 = sub_1BA2C26A8();
LABEL_12:
  a4(v13);
  a4(v12);
  return v10 & 1;
}

uint64_t sub_1BA2A028C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SponsorshipAdInfo(a2, a1);
  return a2;
}

uint64_t sub_1BA2A02C0(uint64_t a1)
{
  destroy for SponsorshipAdInfo.Fulfilled(a1, &type metadata for SponsorshipAdInfo.Unfilled);
  return a1;
}

uint64_t sub_1BA2A02EC(uint64_t a1)
{
  destroy for SponsorshipAdInfo.Fulfilled(a1, &type metadata for SponsorshipAdInfo.Fulfilled);
  return a1;
}

uint64_t _s7NewsAds17SponsorshipAdInfoO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  char v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[16];
  __int128 v20;
  _BYTE v21[112];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  char v29;

  sub_1BA2A028C(a1, (uint64_t)v21);
  sub_1BA2A028C(a2, (uint64_t)&v22);
  if ((v21[104] & 1) != 0)
  {
    sub_1BA2A028C((uint64_t)v21, (uint64_t)v19);
    if (v29 == 1)
    {
      v16 = v26;
      v17 = v27;
      v18 = v28;
      v12 = v22;
      v13 = v23;
      v14 = v24;
      v15 = v25;
      if (v20 == v23)
      {
        sub_1BA2A0E84((uint64_t)v19, (uint64_t)&v10);
        sub_1BA2A0E84((uint64_t)&v12, (uint64_t)&v8);
        goto LABEL_12;
      }
      v3 = sub_1BA2C26A8();
      sub_1BA2A0E84((uint64_t)v19, (uint64_t)&v10);
      sub_1BA2A0E84((uint64_t)&v12, (uint64_t)&v8);
      if ((v3 & 1) != 0)
      {
LABEL_12:
        if (v10 == v8 && v11 == v9)
        {
          sub_1BA2A02C0((uint64_t)&v10);
          sub_1BA2A02C0((uint64_t)&v8);
          sub_1BA2A02C0((uint64_t)&v12);
          sub_1BA2A02C0((uint64_t)v19);
LABEL_22:
          sub_1BA23A710((uint64_t)v21);
          return 1;
        }
        v5 = sub_1BA2C26A8();
        sub_1BA2A02C0((uint64_t)&v10);
        sub_1BA2A02C0((uint64_t)&v8);
        sub_1BA2A02C0((uint64_t)&v12);
        sub_1BA2A02C0((uint64_t)v19);
        if ((v5 & 1) != 0)
          goto LABEL_22;
        goto LABEL_25;
      }
      sub_1BA2A02C0((uint64_t)&v10);
      sub_1BA2A02C0((uint64_t)&v8);
      sub_1BA2A02C0((uint64_t)&v12);
      sub_1BA2A02C0((uint64_t)v19);
LABEL_25:
      sub_1BA23A710((uint64_t)v21);
      return 0;
    }
    sub_1BA2A02C0((uint64_t)v19);
  }
  else
  {
    sub_1BA2A028C((uint64_t)v21, (uint64_t)v19);
    if ((v29 & 1) == 0)
    {
      v16 = v26;
      v17 = v27;
      v18 = v28;
      v12 = v22;
      v13 = v23;
      v14 = v24;
      v15 = v25;
      if (v20 == v23)
      {
        sub_1BA2A0EB8((uint64_t)v19, (uint64_t)&v10);
        sub_1BA2A0EB8((uint64_t)&v12, (uint64_t)&v8);
      }
      else
      {
        v4 = sub_1BA2C26A8();
        sub_1BA2A0EB8((uint64_t)v19, (uint64_t)&v10);
        sub_1BA2A0EB8((uint64_t)&v12, (uint64_t)&v8);
        if ((v4 & 1) == 0)
        {
          sub_1BA2A02EC((uint64_t)&v10);
          sub_1BA2A02EC((uint64_t)&v8);
          sub_1BA2A02EC((uint64_t)&v12);
          sub_1BA2A02EC((uint64_t)v19);
          goto LABEL_25;
        }
      }
      if (v10 == v8 && v11 == v9)
      {
        sub_1BA2A02EC((uint64_t)&v10);
        sub_1BA2A02EC((uint64_t)&v8);
        sub_1BA2A02EC((uint64_t)&v12);
        sub_1BA2A02EC((uint64_t)v19);
        goto LABEL_22;
      }
      v6 = sub_1BA2C26A8();
      sub_1BA2A02EC((uint64_t)&v10);
      sub_1BA2A02EC((uint64_t)&v8);
      sub_1BA2A02EC((uint64_t)&v12);
      sub_1BA2A02EC((uint64_t)v19);
      if ((v6 & 1) != 0)
        goto LABEL_22;
      goto LABEL_25;
    }
    sub_1BA2A02EC((uint64_t)v19);
  }
  sub_1BA2A0DE8((uint64_t)v21);
  return 0;
}

void destroy for SponsorshipAdInfo(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);

}

uint64_t initializeWithCopy for SponsorshipAdInfo(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  char v12;
  id v13;

  v4 = *(unsigned __int8 *)(a2 + 104);
  if (v4 >= 2)
    v4 = *(_DWORD *)a2 + 2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v8;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  if (v4 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v10(a1 + 56, a2 + 56, v9);
    v11 = *(void **)(a2 + 96);
    *(_QWORD *)(a1 + 96) = v11;
    v12 = 1;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v10(a1 + 56, a2 + 56, v9);
    v12 = 0;
    v11 = *(void **)(a2 + 96);
    *(_QWORD *)(a1 + 96) = v11;
  }
  v13 = v11;
  *(_BYTE *)(a1 + 104) = v12;
  return a1;
}

uint64_t assignWithCopy for SponsorshipAdInfo(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void *v7;
  char v8;
  id v9;

  if (a1 != a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);

    v4 = *(unsigned __int8 *)(a2 + 104);
    if (v4 >= 2)
      v4 = *(_DWORD *)a2 + 2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    v5 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 80) = v5;
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
    if (v4 == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      v6(a1 + 56, a2 + 56, v5);
      v7 = *(void **)(a2 + 96);
      *(_QWORD *)(a1 + 96) = v7;
      v8 = 1;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      v6(a1 + 56, a2 + 56, v5);
      v8 = 0;
      v7 = *(void **)(a2 + 96);
      *(_QWORD *)(a1 + 96) = v7;
    }
    *(_BYTE *)(a1 + 104) = v8;
    v9 = v7;
  }
  return a1;
}

__n128 __swift_memcpy105_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(__int128 *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for SponsorshipAdInfo(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (a1 != a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);

    v4 = *(unsigned __int8 *)(a2 + 104);
    if (v4 >= 2)
      v4 = *(_DWORD *)a2 + 2;
    v5 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v5;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
    *(_BYTE *)(a1 + 104) = v4 == 1;
  }
  return a1;
}

uint64_t sub_1BA2A0A48(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 104);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_1BA2A0A64(uint64_t result, unsigned int a2)
{
  unsigned int v2;

  if (a2 > 1)
  {
    v2 = a2 - 2;
    *(_QWORD *)(result + 96) = 0;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    LOBYTE(a2) = 2;
    *(_DWORD *)result = v2;
  }
  *(_BYTE *)(result + 104) = a2;
  return result;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

ValueMetadata *type metadata accessor for SponsorshipAdInfo.Fulfilled()
{
  return &type metadata for SponsorshipAdInfo.Fulfilled;
}

void _s7NewsAds17SponsorshipAdInfoO9FulfilledVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);

}

uint64_t _s7NewsAds17SponsorshipAdInfoO9FulfilledVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  id v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a2 + 56;
  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v8;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v10(a1 + 56, v7, v9);
  v11 = *(void **)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v11;
  v12 = v11;
  return a1;
}

_QWORD *_s7NewsAds17SponsorshipAdInfoO9FulfilledVwca_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  v4 = (void *)a2[12];
  v5 = (void *)a1[12];
  a1[12] = v4;
  v6 = v4;

  return a1;
}

uint64_t _s7NewsAds17SponsorshipAdInfoO9FulfilledVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 96);
  v8 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;

  return a1;
}

uint64_t _s7NewsAds17SponsorshipAdInfoO9FulfilledVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1BA2A0D80(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SponsorshipAdInfo.Unfilled()
{
  return &type metadata for SponsorshipAdInfo.Unfilled;
}

uint64_t sub_1BA2A0DE8(uint64_t a1)
{
  uint64_t v2;

  sub_1BA2A0E24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BA2A0E24()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF27FBF0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF27FBF0);
  }
}

uint64_t sub_1BA2A0E84(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SponsorshipAdInfo.Fulfilled(a2, a1, &type metadata for SponsorshipAdInfo.Unfilled);
  return a2;
}

uint64_t sub_1BA2A0EB8(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SponsorshipAdInfo.Fulfilled(a2, a1, &type metadata for SponsorshipAdInfo.Fulfilled);
  return a2;
}

uint64_t sub_1BA2A0EFC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BA23616C((uint64_t (*)(_QWORD))type metadata accessor for VideoAdTracker, (uint64_t)&off_1E71FA340, a1);
}

uint64_t sub_1BA2A0F10(uint64_t a1)
{
  uint64_t v1;
  __int128 v3[2];

  sub_1BA22068C(a1, (uint64_t)v3);
  type metadata accessor for AdsModuleStartupTask();
  v1 = swift_allocObject();
  sub_1BA21D3D4(v3, v1 + 16);
  *(_BYTE *)(v1 + 56) = 0;
  return v1;
}

uint64_t sub_1BA2A0F64(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  sub_1BA236DDC(0, &qword_1EF27F038, &qword_1EF27F040, (uint64_t)&type metadata for AdPreviewQueue.AdPreviewWrapper, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD))MEMORY[0x1E0DECD58]);
  v36 = a2;
  v6 = sub_1BA2C25AC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BA2C2720();
    sub_1BA2C21A4();
    result = sub_1BA2C2738();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BA2A1294(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  sub_1BA22E0D4(0, &qword_1EF27FBF8);
  v42 = a2;
  v6 = sub_1BA2C25AC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BA2C2720();
    sub_1BA2C21A4();
    result = sub_1BA2C2738();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BA2A15C4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v3 = v2;
  v5 = *v2;
  sub_1BA22E0D4(0, &qword_1ED5B0EF8);
  v44 = a2;
  v6 = sub_1BA2C25AC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v43 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v41 = v2;
  v42 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_22;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v42)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v43 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v42)
        goto LABEL_34;
      v24 = *(_QWORD *)(v43 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v42)
        {
LABEL_34:
          swift_release();
          v3 = v41;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = *(_QWORD *)(v43 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v13 >= v42)
              goto LABEL_34;
            v24 = *(_QWORD *)(v43 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v13 = v25;
      }
    }
LABEL_21:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v5 + 56) + 72 * v21;
    if ((v44 & 1) != 0)
    {
      v45 = *(_OWORD *)v29;
      v30 = *(_OWORD *)(v29 + 16);
      v31 = *(_OWORD *)(v29 + 32);
      v32 = *(_OWORD *)(v29 + 48);
      v49 = *(_QWORD *)(v29 + 64);
      v47 = v31;
      v48 = v32;
      v46 = v30;
    }
    else
    {
      sub_1BA27FA20(v29, (uint64_t)&v45);
      swift_bridgeObjectRetain();
    }
    sub_1BA2C2720();
    sub_1BA2C21A4();
    result = sub_1BA2C2738();
    v33 = -1 << *(_BYTE *)(v7 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v11 + 8 * (v34 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v11 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v11 + 8 * v35);
      }
      while (v39 == -1);
      v14 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v28;
    v15[1] = v27;
    v16 = *(_QWORD *)(v7 + 56) + 72 * v14;
    *(_OWORD *)v16 = v45;
    v17 = v46;
    v18 = v47;
    v19 = v48;
    *(_QWORD *)(v16 + 64) = v49;
    *(_OWORD *)(v16 + 32) = v18;
    *(_OWORD *)(v16 + 48) = v19;
    *(_OWORD *)(v16 + 16) = v17;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v41;
  v23 = (_QWORD *)(v5 + 64);
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v40 = 1 << *(_BYTE *)(v5 + 32);
  if (v40 >= 64)
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v40;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BA2A1924(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  _QWORD *v30;
  char v31;

  v3 = v2;
  v5 = *v2;
  sub_1BA2663C4();
  v31 = a2;
  result = sub_1BA2C25AC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v30 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v29 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v15 = v14 | (v8 << 6);
      }
      else
      {
        v16 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v16 >= v29)
          goto LABEL_35;
        v17 = v30[v16];
        ++v8;
        if (!v17)
        {
          v8 = v16 + 1;
          if (v16 + 1 >= v29)
            goto LABEL_35;
          v17 = v30[v8];
          if (!v17)
          {
            v18 = v16 + 2;
            if (v18 >= v29)
            {
LABEL_35:
              if ((v31 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_42;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v30 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v17 = v30[v18];
            if (!v17)
            {
              while (1)
              {
                v8 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_44;
                if (v8 >= v29)
                  goto LABEL_35;
                v17 = v30[v8];
                ++v18;
                if (v17)
                  goto LABEL_21;
              }
            }
            v8 = v18;
          }
        }
LABEL_21:
        v11 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v8 << 6);
      }
      v19 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v15);
      v20 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v15);
      if ((v31 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_1BA2C2720();
      if (v19 >> 6 <= 1)
        sub_1BA2C272C();
      sub_1BA2C272C();
      result = sub_1BA2C2738();
      v21 = -1 << *(_BYTE *)(v7 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v12 + 8 * v23);
        }
        while (v27 == -1);
        v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v13) = v19;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v13) = v20;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_42:
  *v3 = v7;
  return result;
}

uint64_t sub_1BA2A1C2C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  __int128 v40;

  v3 = v2;
  v5 = *v2;
  sub_1BA266130();
  v39 = a2;
  v6 = sub_1BA2C25AC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v2;
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v38 + 8 * v23);
    ++v14;
    if (!v25)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v11)
        goto LABEL_33;
      v25 = *(_QWORD *)(v38 + 8 * v14);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v37;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v14 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v25 = *(_QWORD *)(v38 + 8 * v14);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v14 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v40 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v31);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v35 = (id)v40;
    }
    sub_1BA2C2720();
    sub_1BA2C21A4();
    result = sub_1BA2C2738();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v17 == v28;
        if (v17 == v28)
          v17 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 16 * v18;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v19);
    *v20 = v34;
    v20[1] = v33;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + v19) = v40;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v37;
  v24 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_1BA2A1F40()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_1BA236DDC(0, &qword_1EF27F038, &qword_1EF27F040, (uint64_t)&type metadata for AdPreviewQueue.AdPreviewWrapper, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD))MEMORY[0x1E0DECD58]);
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BA2A2110()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_1BA22E0D4(0, &qword_1EF27FBF8);
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BA2A22D4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  sub_1BA22DBBC();
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_1BA22068C(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1BA21D3D4(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1BA2A24B8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  sub_1BA221E00();
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = (void *)swift_retain();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BA2A2654()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  _OWORD v30[4];
  uint64_t v31;

  v1 = v0;
  sub_1BA22E0D4(0, &qword_1ED5B0EF8);
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v29 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 72 * v15;
    sub_1BA27FA20(*(_QWORD *)(v2 + 56) + 72 * v15, (uint64_t)v30);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    v22 = *(_QWORD *)(v4 + 56) + v20;
    *(_OWORD *)v22 = v30[0];
    v23 = v30[1];
    v24 = v30[2];
    v25 = v30[3];
    *(_QWORD *)(v22 + 64) = v31;
    *(_OWORD *)(v22 + 32) = v24;
    *(_OWORD *)(v22 + 48) = v25;
    *(_OWORD *)(v22 + 16) = v23;
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v29;
    goto LABEL_28;
  }
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1BA2A2864()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  sub_1BA2663C4();
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BA2A2A00()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  sub_1BA22E0D4(0, &qword_1ED5B2C48);
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_1BA2605C4(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1BA22E0C4(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1BA2A2BF4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  sub_1BA266130();
  v2 = *v0;
  v3 = sub_1BA2C25A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    result = (id)v24;
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BA2A2DB0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t dispatch thunk of PromotedContentContextWrapperType.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PromotedContentContextWrapperType.prewarm<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

id sub_1BA2A2DE4()
{
  id *v0;

  return *v0;
}

uint64_t sub_1BA2A2DEC(uint64_t a1)
{
  uint64_t v2;

  sub_1BA22053C(0, &qword_1ED5B22F8, (uint64_t (*)(uint64_t))sub_1BA22FF64, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for PromotedContentContextWrapper()
{
  return &type metadata for PromotedContentContextWrapper;
}

id DebugJournalSummaryView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *DebugJournalSummaryView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  objc_class *ObjectType;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  objc_super v41;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifierLabel;
  v12 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v13 = v4;
  *(_QWORD *)&v5[v11] = objc_msgSend(v12, sel_init);
  v14 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifier;
  *(_QWORD *)&v13[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v15 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifierLabel;
  *(_QWORD *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v16 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifier;
  *(_QWORD *)&v13[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v17 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusLabel;
  *(_QWORD *)&v13[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v18 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_status;
  *(_QWORD *)&v13[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v19 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusIndicator;
  *(_QWORD *)&v13[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v20 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_moreDetailsButton;
  v21 = (void *)objc_opt_self();
  *(_QWORD *)&v13[v20] = objc_msgSend(v21, sel_buttonWithType_, 0);
  v22 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapMoreDetails;
  sub_1BA2A3288();
  v24 = v23;
  *(_QWORD *)&v13[v22] = objc_msgSend(objc_allocWithZone(v23), sel_init);
  v25 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_buttonSeparator;
  *(_QWORD *)&v13[v25] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v26 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton;
  *(_QWORD *)&v13[v26] = objc_msgSend(v21, sel_buttonWithType_, 0);
  v27 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapReportIssue;
  *(_QWORD *)&v13[v27] = objc_msgSend(objc_allocWithZone(v24), sel_init);
  v28 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_topSeparator;
  *(_QWORD *)&v13[v28] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v29 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_bottomSeparator;
  *(_QWORD *)&v13[v29] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);

  v41.receiver = v13;
  v41.super_class = ObjectType;
  v30 = (char *)objc_msgSendSuper2(&v41, sel_initWithFrame_, a1, a2, a3, a4);
  v31 = *(_QWORD *)&v30[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifierLabel];
  v32 = v30;
  objc_msgSend(v32, sel_addSubview_, v31);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifier]);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifierLabel]);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifier]);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusLabel]);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_status]);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusIndicator]);
  v33 = *(void **)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_moreDetailsButton];
  objc_msgSend(v32, sel_addSubview_, v33);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_buttonSeparator]);
  v34 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton;
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton]);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_topSeparator]);
  objc_msgSend(v32, sel_addSubview_, *(_QWORD *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_bottomSeparator]);
  v35 = *(id *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapMoreDetails];
  v36 = v33;
  sub_1BA2C1FAC();

  v37 = *(void **)&v32[v34];
  v38 = *(id *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapReportIssue];
  v39 = v37;
  sub_1BA2C1FAC();

  return v32;
}

void sub_1BA2A3288()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5B14C8)
  {
    v0 = sub_1BA2C1FB8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5B14C8);
  }
}

id DebugJournalSummaryView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DebugJournalSummaryView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s7NewsAds23DebugJournalSummaryViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifierLabel;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v2 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifier;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v3 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifierLabel;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v4 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifier;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v5 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusLabel;
  *(_QWORD *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v6 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_status;
  *(_QWORD *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v7 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusIndicator;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v8 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_moreDetailsButton;
  v9 = (void *)objc_opt_self();
  *(_QWORD *)&v0[v8] = objc_msgSend(v9, sel_buttonWithType_, 0);
  v10 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapMoreDetails;
  sub_1BA2A3288();
  v12 = v11;
  *(_QWORD *)&v0[v10] = objc_msgSend(objc_allocWithZone(v11), sel_init);
  v13 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_buttonSeparator;
  *(_QWORD *)&v0[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v14 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton;
  *(_QWORD *)&v0[v14] = objc_msgSend(v9, sel_buttonWithType_, 0);
  v15 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapReportIssue;
  *(_QWORD *)&v0[v15] = objc_msgSend(objc_allocWithZone(v12), sel_init);
  v16 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_topSeparator;
  *(_QWORD *)&v0[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v17 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_bottomSeparator;
  *(_QWORD *)&v0[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);

  sub_1BA2C257C();
  __break(1u);
}

uint64_t type metadata accessor for DebugJournalSummaryView()
{
  return objc_opt_self();
}

uint64_t ANFComponentAdData.metadata.getter()
{
  return swift_bridgeObjectRetain();
}

NewsAds::ANFComponentAdData __swiftcall ANFComponentAdData.init(metadata:)(NewsAds::ANFComponentAdData metadata)
{
  NewsAds::ANFComponentAdData *v1;

  v1->metadata._rawValue = metadata.metadata._rawValue;
  return metadata;
}

uint64_t sub_1BA2A36F4@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  return ANFComponentAdData.init(from:)(a1, a2);
}

uint64_t ANFComponentAdData.init(from:)@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  unint64_t *v18;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  id v23[5];

  v23[4] = *(id *)MEMORY[0x1E0C80C00];
  sub_1BA2A3E3C(0, &qword_1EF27FC98, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v20 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2A3968();
  sub_1BA2C2744();
  if (!v2)
  {
    sub_1BA2A39AC();
    sub_1BA2C2630();
    v21 = a2;
    v11 = v23[0];
    v10 = v23[1];
    v12 = (void *)objc_opt_self();
    v13 = (void *)sub_1BA2C13DC();
    v23[0] = 0;
    v14 = objc_msgSend(v12, sel_JSONObjectWithData_options_error_, v13, 0, v23);

    if (v14)
    {
      v15 = v23[0];
      sub_1BA2C2468();
      swift_unknownObjectRelease();
      sub_1BA2A3DD4();
      if (swift_dynamicCast())
        v16 = v22;
      else
        v16 = sub_1BA2349C0(MEMORY[0x1E0DEE9D8]);
      sub_1BA24E030((uint64_t)v11, (unint64_t)v10);
      v18 = v21;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      *v18 = v16;
    }
    else
    {
      v17 = v23[0];
      sub_1BA2C137C();

      swift_willThrow();
      sub_1BA24E030((uint64_t)v11, (unint64_t)v10);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1BA2A3968()
{
  unint64_t result;

  result = qword_1EF27FCA0;
  if (!qword_1EF27FCA0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAB10, &type metadata for ANFComponentAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FCA0);
  }
  return result;
}

unint64_t sub_1BA2A39AC()
{
  unint64_t result;

  result = qword_1EF27FCA8;
  if (!qword_1EF27FCA8)
  {
    result = MEMORY[0x1BCCD93D0](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF27FCA8);
  }
  return result;
}

uint64_t sub_1BA2A39F0(_QWORD *a1)
{
  return ANFComponentAdData.encode(to:)(a1);
}

uint64_t ANFComponentAdData.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v17[3];

  v17[2] = *(id *)MEMORY[0x1E0C80C00];
  sub_1BA2A3E3C(0, &qword_1EF27FCB8, MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v17[-1] - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2A3968();
  sub_1BA2C2750();
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_1BA2C20C0();
  v17[0] = 0;
  v9 = objc_msgSend(v7, sel_dataWithJSONObject_options_error_, v8, 0, v17);

  v10 = v17[0];
  if (v9)
  {
    v11 = (void *)sub_1BA2C13E8();
    v13 = v12;

    v17[0] = v11;
    v17[1] = v13;
    sub_1BA2A3E98();
    sub_1BA2C2684();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_1BA24E030((uint64_t)v11, (unint64_t)v13);
  }
  else
  {
    v15 = v10;
    sub_1BA2C137C();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_1BA2A3BF8()
{
  sub_1BA2C2720();
  sub_1BA2C21A4();
  return sub_1BA2C2738();
}

uint64_t sub_1BA2A3C48()
{
  return sub_1BA2C21A4();
}

uint64_t sub_1BA2A3C60()
{
  sub_1BA2C2720();
  sub_1BA2C21A4();
  return sub_1BA2C2738();
}

uint64_t sub_1BA2A3CAC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BA2C25DC();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1BA2A3CFC(_QWORD *a1@<X8>)
{
  *a1 = 0x617461646174656DLL;
  a1[1] = 0xE800000000000000;
}

uint64_t sub_1BA2A3D18()
{
  return 0x617461646174656DLL;
}

uint64_t sub_1BA2A3D30@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BA2C25DC();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_1BA2A3D84()
{
  sub_1BA2A3968();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2A3DAC()
{
  sub_1BA2A3968();
  return sub_1BA2C2768();
}

void sub_1BA2A3DD4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF27FCB0)
  {
    v0 = sub_1BA2C20E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF27FCB0);
  }
}

void sub_1BA2A3E3C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2A3968();
    v7 = a3(a1, &type metadata for ANFComponentAdData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BA2A3E98()
{
  unint64_t result;

  result = qword_1EF27FCC0;
  if (!qword_1EF27FCC0)
  {
    result = MEMORY[0x1BCCD93D0](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF27FCC0);
  }
  return result;
}

unint64_t sub_1BA2A3EDC(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA285320();
  result = sub_1BA28405C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for ANFComponentAdData()
{
  return &type metadata for ANFComponentAdData;
}

uint64_t storeEnumTagSinglePayload for ANFComponentAdData.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA2A3F58 + 4 * byte_1BA2CA980[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA2A3F78 + 4 * byte_1BA2CA985[v4]))();
}

_BYTE *sub_1BA2A3F58(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA2A3F78(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2A3F80(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2A3F88(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2A3F90(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2A3F98(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ANFComponentAdData.CodingKeys()
{
  return &type metadata for ANFComponentAdData.CodingKeys;
}

unint64_t sub_1BA2A3FB8()
{
  unint64_t result;

  result = qword_1EF27FCC8;
  if (!qword_1EF27FCC8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAAE8, &type metadata for ANFComponentAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FCC8);
  }
  return result;
}

unint64_t sub_1BA2A4000()
{
  unint64_t result;

  result = qword_1EF27FCD0;
  if (!qword_1EF27FCD0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAA20, &type metadata for ANFComponentAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FCD0);
  }
  return result;
}

unint64_t sub_1BA2A4048()
{
  unint64_t result;

  result = qword_1EF27FCD8;
  if (!qword_1EF27FCD8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAA48, &type metadata for ANFComponentAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FCD8);
  }
  return result;
}

_QWORD *InterstitialAdViewManager.__allocating_init(adManager:adRequestStore:journal:)(__int128 *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = (_QWORD *)swift_allocObject();
  v6[9] = sub_1BA2C20A8();
  sub_1BA21D3D4(a1, (uint64_t)(v6 + 2));
  v6[7] = a2;
  v6[8] = a3;
  return v6;
}

_QWORD *InterstitialAdViewManager.init(adManager:adRequestStore:journal:)(__int128 *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[9] = sub_1BA2C20A8();
  sub_1BA21D3D4(a1, (uint64_t)(v3 + 2));
  v3[7] = a2;
  v3[8] = a3;
  return v3;
}

void InterstitialAdViewManager.generateInsertion(for:placementIdentifier:size:contentFetched:)()
{
  type metadata accessor for InterstitialViewInsertion();
}

void sub_1BA2A41C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = sub_1BA2C1940();
  *(_QWORD *)(v13 - 184) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v13 - 176) = v14;
  MEMORY[0x1E0C80A78](v14);
  *(_QWORD *)(v13 - 192) = (char *)&a9 - v15;
  *(_QWORD *)(v13 - 136) = v9;
  *(_QWORD *)(v13 - 128) = v10;
  *(_QWORD *)(v13 - 120) = v11;
  *(_QWORD *)(v13 - 112) = v12;
  type metadata accessor for AdRequest();
}

void sub_1BA2A4214()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  _BYTE v14[112];

  v2 = sub_1BA2C245C();
  *(_QWORD *)(v1 - 216) = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x1E0C80A78](v2);
  *(_QWORD *)(v1 - 200) = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = MEMORY[0x1E0C80A78](v3);
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1BA2C2084();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)&v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BA21D258();
  *v9 = sub_1BA2C23D8();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF740], v6);
  v10 = sub_1BA2C209C();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    *(_QWORD *)(v1 - 224) = v2;
    if (qword_1ED5B2DB0 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v11 = (void *)qword_1ED5B2888;
  sub_1BA22D5D8();
  v12 = swift_allocObject();
  *(_OWORD *)(v1 - 240) = xmmword_1BA2C37D0;
  *(_OWORD *)(v12 + 16) = xmmword_1BA2C37D0;
  *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v12 + 64) = sub_1BA2291C8();
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v1 - 168);
  *(_QWORD *)(v12 + 40) = v0;
  v13 = v11;
  swift_bridgeObjectRetain();
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  *(_BYTE *)(v1 - 136) = 0;
  AdRequestStore.request(for:behavior:)();
}

unint64_t sub_1BA2A4618()
{
  unint64_t result;

  result = qword_1EF27FCE0;
  if (!qword_1EF27FCE0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2C66B4, &type metadata for InterstitialAdError);
    atomic_store(result, (unint64_t *)&qword_1EF27FCE0);
  }
  return result;
}

void InterstitialAdViewManager.generateInsertion(for:request:size:contentFetched:)()
{
  type metadata accessor for InterstitialViewInsertion();
}

void sub_1BA2A46B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = sub_1BA2C1940();
  *(_QWORD *)(v13 - 288) = v14;
  *(_QWORD *)(v13 - 296) = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  *(_QWORD *)(v13 - 304) = (char *)&a9 - v15;
  *(_QWORD *)(v13 - 200) = v12;
  *(_QWORD *)(v13 - 136) = v12;
  *(_QWORD *)(v13 - 128) = v10;
  *(_QWORD *)(v13 - 184) = v9;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v11;
  type metadata accessor for AdRequest();
}

uint64_t sub_1BA2A4720(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  uint64_t (*v61)(void (*)(), char *, uint64_t, uint64_t, double, double);
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  _BYTE v66[96];

  v9 = sub_1BA2C245C();
  *(_QWORD *)(v5 - 312) = v9;
  *(_QWORD *)(v5 - 320) = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x1E0C80A78](v9);
  *(_QWORD *)(v5 - 328) = &v66[-v11];
  v12 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v5 - 240) = v12;
  *(_QWORD *)(v5 - 368) = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v10);
  *(_QWORD *)(v5 - 360) = &v66[-v13];
  v14 = *(_QWORD *)(v1 + 88);
  v15 = sub_1BA2C245C();
  v16 = MEMORY[0x1E0C80A78](v15);
  *(_QWORD *)(v5 - 376) = &v66[-v17];
  *(_QWORD *)(v5 - 264) = *(_QWORD *)(v14 - 8);
  v18 = MEMORY[0x1E0C80A78](v16);
  *(_QWORD *)(v5 - 272) = &v66[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = MEMORY[0x1E0C80A78](v18);
  *(_QWORD *)(v5 - 208) = &v66[-v21];
  MEMORY[0x1E0C80A78](v20);
  *(_QWORD *)(v5 - 280) = &v66[-v22];
  *(_QWORD *)(v5 - 232) = a1;
  v23 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v5 - 176) = v2;
  *(_QWORD *)(v5 - 192) = v3;
  *(_QWORD *)(v5 - 168) = v23(v2, v3);
  v25 = v24;
  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v26 = (void *)qword_1ED5B2888;
  sub_1BA22D5D8();
  *(_QWORD *)(v5 - 336) = v27;
  v28 = swift_allocObject();
  *(_OWORD *)(v5 - 352) = xmmword_1BA2C37C0;
  *(_OWORD *)(v28 + 16) = xmmword_1BA2C37C0;
  v29 = *v4;
  v30 = v4[1];
  v31 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v28 + 56) = MEMORY[0x1E0DEA968];
  v32 = sub_1BA2291C8();
  *(_QWORD *)(v28 + 32) = v29;
  *(_QWORD *)(v28 + 40) = v30;
  *(_QWORD *)(v28 + 96) = v31;
  *(_QWORD *)(v28 + 104) = v32;
  v33 = *(_QWORD *)(v5 - 168);
  *(_QWORD *)(v28 + 64) = v32;
  *(_QWORD *)(v28 + 72) = v33;
  *(_QWORD *)(v28 + 80) = v25;
  v34 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  v35 = *(_QWORD **)(v5 - 256);
  v36 = v35[5];
  v37 = v35[6];
  __swift_project_boxed_opaque_existential_1(v35 + 2, v36);
  v38 = *(void (**)(uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 24);
  v39 = *(_QWORD *)(v1 + 112);
  v40 = *(_QWORD *)(v39 + 8);
  v41 = *(_QWORD *)(v5 - 200);
  v42 = *(_QWORD *)(v5 - 248);
  *(_QWORD *)(v5 - 248) = v4;
  v38(v42, v4, v41, v14, *(_QWORD *)(v5 - 176), *(_QWORD *)(v5 - 184), v40, *(_QWORD *)(v5 - 192), v36, v37);
  v43 = v25;
  v44 = v14;
  v45 = *(_QWORD *)(v5 - 264);
  v46 = *(_QWORD *)(v5 - 280);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v45 + 32))(v46, *(_QWORD *)(v5 - 208), v44);
  v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
  v48 = *(_QWORD *)(v5 - 376);
  v47(v48, v46, v44);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 56))(v48, 0, 1, v44);
  *(_QWORD *)(v5 - 160) = *(_QWORD *)(v5 - 168);
  *(_QWORD *)(v5 - 152) = v43;
  swift_beginAccess();
  sub_1BA2C20E4();
  swift_bridgeObjectRetain();
  sub_1BA2C20FC();
  swift_endAccess();
  v47(*(_QWORD *)(v5 - 272), v46, v44);
  v49 = swift_allocObject();
  swift_weakInit();
  v50 = *(_QWORD *)(v5 - 240);
  v51 = *(_QWORD *)(v5 - 360);
  v52 = *(_QWORD *)(v5 - 232);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v50 + 16))(v51, *(_QWORD *)(v5 - 248), v52);
  v53 = (*(unsigned __int8 *)(v50 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  v54 = (*(_QWORD *)(v5 - 368) + v53 + 7) & 0xFFFFFFFFFFFFFFF8;
  v55 = (char *)swift_allocObject();
  *((_QWORD *)v55 + 2) = *(_QWORD *)(v5 - 200);
  *((_QWORD *)v55 + 3) = v44;
  v56 = *(_QWORD *)(v5 - 168);
  v57 = *(_QWORD *)(v5 - 184);
  *((_QWORD *)v55 + 4) = *(_QWORD *)(v5 - 176);
  *((_QWORD *)v55 + 5) = v57;
  v58 = *(_QWORD *)(v5 - 192);
  *((_QWORD *)v55 + 6) = v39;
  *((_QWORD *)v55 + 7) = v58;
  v59 = *(_QWORD *)(v5 - 224);
  *((_QWORD *)v55 + 8) = v49;
  *((_QWORD *)v55 + 9) = v59;
  *((_QWORD *)v55 + 10) = *(_QWORD *)(v5 - 216);
  *((_QWORD *)v55 + 11) = v56;
  *((_QWORD *)v55 + 12) = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(&v55[v53], v51, v52);
  v60 = (double *)&v55[v54];
  *v60 = v7;
  v60[1] = v6;
  v61 = *(uint64_t (**)(void (*)(), char *, uint64_t, uint64_t, double, double))(v39 + 16);
  swift_retain();
  swift_retain();
  v62 = *(_QWORD *)(v5 - 272);
  v63 = v61(sub_1BA2A52EC, v55, v44, v39, v7, v6);
  swift_release();
  v64 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 264) + 8);
  v64(v62, v44);
  v64(*(_QWORD *)(v5 - 280), v44);
  swift_release();
  return v63;
}

uint64_t sub_1BA2A4DD4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1BA2A4DF8()
{
  type metadata accessor for AdRequest();
}

void sub_1BA2A4E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v13 - 248) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v13 - 240) = a1;
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v13 - 232) = (char *)&a9 - v14;
  v15 = sub_1BA2C245C();
  MEMORY[0x1E0C80A78](v15);
  *(_QWORD *)(v13 - 192) = v10;
  *(_QWORD *)(v13 - 184) = v9;
  *(_QWORD *)(v13 - 176) = v12;
  *(_QWORD *)(v13 - 168) = v11;
  type metadata accessor for InterstitialViewInsertion();
}

uint64_t sub_1BA2A4ED8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  _BYTE *v16;
  id v17;
  uint64_t v19;

  v6 = sub_1BA2C1940();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v19 - v8);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v11 = Strong;
    *(_QWORD *)(v5 - 256) = v2;
    *(_QWORD *)(v5 - 264) = v4;
    if ((*(_DWORD *)(v5 - 200) & 1) == 0)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 56))(v3, 1, 1, v0);
      v12 = *(_QWORD *)(v5 - 224);
      *(_QWORD *)(v5 - 144) = *(_QWORD *)(v5 - 216);
      *(_QWORD *)(v5 - 136) = v12;
      swift_beginAccess();
      *(_QWORD *)(v5 - 200) = v7;
      v13 = *(_QWORD *)(v5 - 208);
      sub_1BA2A55E0(v1);
      sub_1BA2C20E4();
      swift_bridgeObjectRetain();
      sub_1BA2C20FC();
      swift_endAccess();
      *(_QWORD *)(v5 - 272) = *(_QWORD *)(v11 + 64);
      ObjectType = swift_getObjectType();
      *(_QWORD *)(v5 - 192) = v1;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(ObjectType, v13);
      *(_OWORD *)(v5 - 192) = 0u;
      *(_OWORD *)(v5 - 176) = 0u;
      *(_BYTE *)(v5 - 160) = 1;
      Journal.addFulfilledEntry(request:placementIdentifier:contentIdentifier:layout:)();
    }
    *v9 = (uint64_t)v1;
    swift_storeEnumTagMultiPayload();
    sub_1BA2A55E0(v1);
    v17 = v1;
    (*(void (**)(uint64_t *))(v5 - 264))(v9);
    swift_release();
    sub_1BA2A55EC(v1);
  }
  else
  {
    sub_1BA2A4618();
    v15 = swift_allocError();
    *v16 = 0;
    *v9 = v15;
    swift_storeEnumTagMultiPayload();
    v4(v9);
  }
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_1BA2A51CC()
{
  type metadata accessor for AdRequest();
}

uint64_t sub_1BA2A520C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v7 = (v6 + 104) & ~v6;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2 + v7 + *(int *)(a1 + 52), v3);
  type metadata accessor for AdContext(0, v3, v4, v8);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v2 + v7 + *(int *)(a1 + 56), v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1BA2A52EC()
{
  type metadata accessor for AdRequest();
}

void sub_1BA2A5338()
{
  sub_1BA2A4DF8();
}

void InterstitialAdViewManager.view(for:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v1 = *v0;
  v2 = sub_1BA2C2084();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BA21D258();
  *v5 = sub_1BA2C23D8();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v6 = sub_1BA2C209C();
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) != 0)
  {
    if (qword_1ED5B2DB0 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  sub_1BA22D5D8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BA2C37C0;
  v7 = *(_QWORD *)(v1 + 120);
  v8 = *(_QWORD *)(v1 + 80);
  v9 = *(_OWORD *)(v1 + 96);
  v10 = v7;
  type metadata accessor for InterstitialViewInsertion();
}

uint64_t InterstitialAdViewManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InterstitialAdViewManager.__deallocating_deinit()
{
  InterstitialAdViewManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for InterstitialAdViewManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InterstitialAdViewManager.__allocating_init(adManager:adRequestStore:journal:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

id sub_1BA2A55E0(id a1)
{
  return a1;
}

void sub_1BA2A55EC(id a1)
{

}

NewsAds::CampaignAdData __swiftcall CampaignAdData.init(campaignData:)(NewsAds::CampaignAdData campaignData)
{
  NewsAds::CampaignAdData *v1;

  *v1 = campaignData;
  return campaignData;
}

uint64_t sub_1BA2A5600()
{
  sub_1BA2A5744();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2A5628()
{
  sub_1BA2A5744();
  return sub_1BA2C2768();
}

uint64_t CampaignAdData.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BA2A58AC(0, &qword_1EF27FCE8, MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2A5744();
  sub_1BA2C2750();
  sub_1BA2C2654();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1BA2A5744()
{
  unint64_t result;

  result = qword_1EF27FCF0;
  if (!qword_1EF27FCF0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAD14, &type metadata for CampaignAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FCF0);
  }
  return result;
}

uint64_t CampaignAdData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  sub_1BA2A58AC(0, &qword_1EF27FCF8, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v14 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2A5744();
  sub_1BA2C2744();
  if (!v2)
  {
    v10 = sub_1BA2C2600();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BA2A58AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2A5744();
    v7 = a3(a1, &type metadata for CampaignAdData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BA2A5908(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA285364();
  result = sub_1BA2840A0();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BA2A5934@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return CampaignAdData.init(from:)(a1, a2);
}

uint64_t sub_1BA2A5948(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BA2A58AC(0, &qword_1EF27FCE8, MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2A5744();
  sub_1BA2C2750();
  sub_1BA2C2654();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

ValueMetadata *type metadata accessor for CampaignAdData()
{
  return &type metadata for CampaignAdData;
}

uint64_t storeEnumTagSinglePayload for CampaignAdData.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA2A5A8C + 4 * byte_1BA2CABC8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA2A5AAC + 4 * byte_1BA2CABCD[v4]))();
}

_BYTE *sub_1BA2A5A8C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA2A5AAC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2A5AB4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2A5ABC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2A5AC4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2A5ACC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CampaignAdData.CodingKeys()
{
  return &type metadata for CampaignAdData.CodingKeys;
}

unint64_t sub_1BA2A5AEC()
{
  unint64_t result;

  result = qword_1EF27FD00;
  if (!qword_1EF27FD00)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CACEC, &type metadata for CampaignAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FD00);
  }
  return result;
}

unint64_t sub_1BA2A5B34()
{
  unint64_t result;

  result = qword_1EF27FD08;
  if (!qword_1EF27FD08)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAC5C, &type metadata for CampaignAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FD08);
  }
  return result;
}

unint64_t sub_1BA2A5B7C()
{
  unint64_t result;

  result = qword_1EF27FD10;
  if (!qword_1EF27FD10)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAC84, &type metadata for CampaignAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FD10);
  }
  return result;
}

char *ArticleBannerAdProvider.adView(for:placementIdentifier:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  id v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  uint64_t v29;
  float v30;
  float v31;

  v11 = sub_1BA2C1460();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v6[7] + 16) == 1)
  {
    sub_1BA2C1454();
    v15 = sub_1BA2C143C();
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    swift_retain();
    sub_1BA2C1574();
    swift_release();
    v18 = v31;
    swift_retain();
    sub_1BA2C1574();
    swift_release();
    v19 = v30;
    swift_retain();
    sub_1BA2C1574();
    swift_release();
    BYTE6(v29) = HIBYTE(v29);
    v20 = objc_allocWithZone((Class)type metadata accessor for DebugBannerAdView());
    return sub_1BA23AC38(v15, v17, (char *)&v29 + 6, v18, v19, a5, a6);
  }
  else
  {
    v22 = v6[5];
    v23 = v6[6];
    __swift_project_boxed_opaque_existential_1(v6 + 2, v22);
    v24 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
    swift_bridgeObjectRetain();
    v25 = (void *)v24(v22, v23);
    v26 = objc_msgSend(v25, sel_promotedContentViewOfType_size_startsCollapsed_, 0, 1, a5, a6);

    v27 = objc_allocWithZone((Class)type metadata accessor for BannerAdMetricsView());
    v21 = sub_1BA27B468(a1, a2, v26);

  }
  return v21;
}

uint64_t ArticleBannerAdProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t ArticleBannerAdProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

char *sub_1BA2A5E0C(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return ArticleBannerAdProvider.adView(for:placementIdentifier:)(a1, a2, a3, a4, a5, a6);
}

uint64_t method lookup function for ArticleBannerAdProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BA2A5E38()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1BA2C1334();
  MEMORY[0x1E0C80A78](v0);
  sub_1BA2C1364();
  swift_allocObject();
  sub_1BA2C1358();
  sub_1BA2C1328();
  sub_1BA2C1340();
  v1 = sub_1BA2C134C();
  swift_release();
  return v1;
}

uint64_t InterstitialAdMetricsView.contentIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id InterstitialAdMetricsView.onLongPress.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress);
}

id InterstitialAdMetricsView.onCollapse.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  return *v1;
}

void InterstitialAdMetricsView.onCollapse.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*InterstitialAdMetricsView.onCollapse.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id InterstitialAdMetricsView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void InterstitialAdMetricsView.init(coder:)()
{
  char *v0;
  uint64_t v1;
  objc_class *v2;
  objc_class *v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress;
  sub_1BA2A6A28(0, (unint64_t *)&qword_1ED5B14C8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DBC348]);
  v3 = v2;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(v2), sel_init);
  v4 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone(v3), sel_init);

  sub_1BA2C257C();
  __break(1u);
}

Swift::Void __swiftcall InterstitialAdMetricsView.layoutSubviews()()
{
  char *v0;
  void *v1;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

Swift::Void __swiftcall InterstitialAdMetricsView.missedOpportunity()()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView), sel_promotedContentInfo);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)sub_1BA2C1A24();

    objc_msgSend(v3, sel_missedOpportunity);
    swift_unknownObjectRelease();
  }
}

id InterstitialAdMetricsView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void InterstitialAdMetricsView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id InterstitialAdMetricsView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BA2A64A0()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1BA2A64DC()
{
  _QWORD *v0;

  return *(id *)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress);
}

id sub_1BA2A64F0()
{
  _QWORD *v0;
  id *v1;

  v1 = (id *)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  return *v1;
}

id sub_1BA2A6538()
{
  _QWORD *v0;
  id result;
  void *v2;
  void *v3;

  result = objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView), sel_promotedContentInfo);
  if (result)
  {
    v2 = result;
    v3 = (void *)sub_1BA2C1A24();

    objc_msgSend(v3, sel_missedOpportunity);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

id sub_1BA2A6600(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  objc_class *v10;
  id v11;
  char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v30;
  objc_class *ObjectType;
  objc_super v32;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BA2A6A28(0, &qword_1ED5B14C0, MEMORY[0x1E0DBC320]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v30 - v6;
  v8 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress;
  sub_1BA2A6A28(0, (unint64_t *)&qword_1ED5B14C8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DBC348]);
  v10 = v9;
  v11 = objc_allocWithZone(v9);
  v12 = v1;
  *(_QWORD *)&v1[v8] = objc_msgSend(v11, sel_init);
  v13 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse;
  *(_QWORD *)&v12[v13] = objc_msgSend(objc_allocWithZone(v10), sel_init);
  v14 = objc_msgSend(a1, sel_promotedContentInfo);
  if (v14)
  {
    v15 = v14;
    v16 = sub_1BA2C1A00();
    v18 = v17;

  }
  else
  {
    v16 = 0;
    v18 = 0xE000000000000000;
  }
  v19 = (uint64_t *)&v12[OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier];
  *v19 = v16;
  v19[1] = v18;
  *(_QWORD *)&v12[OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView] = a1;
  v20 = a1;

  objc_msgSend(v20, sel_frame);
  v32.receiver = v12;
  v32.super_class = ObjectType;
  v21 = objc_msgSendSuper2(&v32, sel_initWithFrame_);
  v22 = (void *)objc_opt_self();
  v23 = v21;
  v24 = objc_msgSend(v22, sel_clearColor);
  objc_msgSend(v23, sel_setBackgroundColor_, v24);

  v25 = v20;
  v26 = objc_msgSend(v22, sel_clearColor);
  objc_msgSend(v25, sel_setBackgroundColor_, v26);

  v27 = v23;
  sub_1BA2C1E38();
  objc_msgSend(v27, sel_bounds);
  objc_msgSend(v25, sel_setFrame_);
  objc_msgSend(v27, sel_addSubview_, v25);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DBC318], v4);
  v28 = v27;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v28;
}

void _s7NewsAds25InterstitialAdMetricsViewC07metricsF9Collapsedyy17PromotedContentUI0eF0CF_0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id *v6;
  id v7;

  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v1 = (void *)qword_1ED5B2888;
  sub_1BA22D5D8();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BA2C37D0;
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier + 8);
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v2 + 64) = sub_1BA2291C8();
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v3;
  v5 = v1;
  swift_bridgeObjectRetain();
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  v6 = (id *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  v7 = *v6;
  MEMORY[0x1BCCD874C]();

}

uint64_t dispatch thunk of InterstitialAdViewType.contentIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of InterstitialAdViewType.onLongPress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of InterstitialAdViewType.onCollapse.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of InterstitialAdViewType.missedOpportunity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t type metadata accessor for InterstitialAdMetricsView()
{
  return objc_opt_self();
}

uint64_t method lookup function for InterstitialAdMetricsView()
{
  return swift_lookUpClassMethod();
}

void sub_1BA2A6A28(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x1E0DEE9C0] + 8);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t InterstitialAdPlacement.desiredPlacement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BA2C1AC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t InterstitialAdPlacement.placementIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InterstitialAdPlacement() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InterstitialAdPlacement.insertionType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for InterstitialAdPlacement();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 24));
  return result;
}

double InterstitialAdPlacement.boundingSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for InterstitialAdPlacement() + 28));
}

uint64_t InterstitialAdPlacement.init(placementIdentifier:boundingSize:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;
  double *v15;

  v10 = (int *)type metadata accessor for InterstitialAdPlacement();
  *((_BYTE *)a3 + v10[6]) = 0;
  *a3 = 1;
  v11 = *MEMORY[0x1E0D81E70];
  v12 = sub_1BA2C1AC0();
  result = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(a3, v11, v12);
  v14 = (_QWORD *)((char *)a3 + v10[5]);
  *v14 = a1;
  v14[1] = a2;
  v15 = (double *)((char *)a3 + v10[7]);
  *v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t sub_1BA2A6BE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BA2A6C14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BA2C1AC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

double sub_1BA2A6C4C(uint64_t a1)
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1 + 28));
}

_QWORD *initializeBufferWithCopyOfBuffer for InterstitialAdPlacement(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BA2C1AC0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for InterstitialAdPlacement(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BA2C1AC0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = sub_1BA2C1AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_1BA2C1AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

uint64_t initializeWithTake for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1BA2C1AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1BA2C1AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for InterstitialAdPlacement()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2A6F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1BA2C1AC0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for InterstitialAdPlacement()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2A6FF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1BA2C1AC0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

_QWORD *sub_1BA2A7070()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t *boxed_opaque_existential_2;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  uint64_t v52;
  unsigned int v53;
  _QWORD *v54;
  _QWORD v55[3];
  uint64_t v56;
  uint64_t v57;
  __int128 v58[2];
  char v59;

  v1 = sub_1BA2C1EE0();
  v52 = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x1E0C80A78](v1);
  v50 = (uint64_t *)((char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (uint64_t *)((char *)&v47 - v5);
  MEMORY[0x1E0C80A78](v4);
  v54 = (uint64_t *)((char *)&v47 - v7);
  v8 = v0[14];
  v10 = v0[16];
  v9 = v0[17];
  v11 = *(_QWORD *)(v9 + 16);
  if (v11)
  {
    v48 = v0[14];
    v49 = v10;
    v12 = v9 + 32;
    v53 = *MEMORY[0x1E0DB79C8];
    v47 = v9;
    swift_bridgeObjectRetain();
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v51 = 0x80000001BA2D1E30;
    v14 = v52;
    do
    {
      sub_1BA2A861C(v12, (uint64_t)v58);
      if ((v59 & 1) != 0)
      {
        v15 = *(_QWORD *)&v58[0];
        v16 = (_QWORD *)swift_allocObject();
        v55[0] = v15;
        v17 = sub_1BA25F984();
        swift_bridgeObjectRelease();
        sub_1BA22920C(0, &qword_1EF27FD68, (uint64_t)&type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
        v16[5] = v18;
        v19 = sub_1BA2A87C0((unint64_t *)&unk_1EF280420, &qword_1EF27FD68, (uint64_t)&type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry, (uint64_t (*)(void))sub_1BA2A867C);
        v16[2] = v17;
        v16[6] = v19;
        v16[7] = 0xD00000000000001BLL;
        v16[8] = v51;
        *v6 = v16;
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(v14 + 104))(v6, v53, v1);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = (_QWORD *)sub_1BA23F740(0, v13[2] + 1, 1, v13);
        v21 = v13[2];
        v20 = v13[3];
        if (v21 >= v20 >> 1)
          v13 = (_QWORD *)sub_1BA23F740(v20 > 1, v21 + 1, 1, v13);
        v13[2] = v21 + 1;
        (*(void (**)(unint64_t, _QWORD *, uint64_t))(v14 + 32))((unint64_t)v13+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v21, v6, v1);
      }
      else
      {
        sub_1BA21D3D4(v58, (uint64_t)v55);
        v22 = (uint64_t *)swift_allocObject();
        v23 = v1;
        v24 = v56;
        v25 = v57;
        v26 = __swift_project_boxed_opaque_existential_1(v55, v56);
        v22[5] = v24;
        v27 = *(_QWORD *)(v25 + 32);
        v1 = v23;
        v14 = v52;
        v22[6] = v27;
        boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2(v22 + 2);
        (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(boxed_opaque_existential_2, v26, v24);
        v22[7] = 0x65746E6F632D6461;
        v22[8] = 0xEA00000000007478;
        *v54 = v22;
        (*(void (**)(void))(v14 + 104))();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = (_QWORD *)sub_1BA23F740(0, v13[2] + 1, 1, v13);
        v30 = v13[2];
        v29 = v13[3];
        if (v30 >= v29 >> 1)
          v13 = (_QWORD *)sub_1BA23F740(v29 > 1, v30 + 1, 1, v13);
        v13[2] = v30 + 1;
        (*(void (**)(unint64_t, _QWORD *, uint64_t))(v14 + 32))((unint64_t)v13+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v30, v54, v1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
      }
      v12 += 48;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    v8 = v48;
    v10 = v49;
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  sub_1BA2A86C0(0, &qword_1EF27E990, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_1BA2C37D0;
  *(_QWORD *)(v31 + 32) = v8;
  v32 = *(_QWORD *)(v10 + 16);
  if (v32)
  {
    v54 = (_QWORD *)v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33 = 0;
    v34 = 144;
    do
    {
      v35 = v33 + 1;
      v36 = v10;
      v37 = *(_QWORD *)(v10 + v34);
      v38 = *(_QWORD *)(v31 + 24);
      swift_bridgeObjectRetain();
      if (v33 + 1 >= v38 >> 1)
        v31 = (uint64_t)sub_1BA23F8D8((_QWORD *)(v38 > 1), v33 + 2, 1, (_QWORD *)v31);
      *(_QWORD *)(v31 + 16) = v33 + 2;
      *(_QWORD *)(v31 + 8 * v33 + 40) = v37;
      v34 += 144;
      ++v33;
      v10 = v36;
    }
    while (v32 != v35);
    swift_bridgeObjectRelease();
    v1 = (uint64_t)v54;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v39 = v52;
  v40 = (_QWORD *)swift_allocObject();
  sub_1BA2A86C0(0, &qword_1EF27FD78, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  v40[5] = v41;
  v42 = sub_1BA2A8730();
  v40[2] = v31;
  v40[6] = v42;
  v40[7] = 0x6E72756F6A2D6461;
  v40[8] = 0xEA00000000006C61;
  v43 = v50;
  *v50 = v40;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v39 + 104))(v43, *MEMORY[0x1E0DB79C8], v1);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = (_QWORD *)sub_1BA23F740(0, v13[2] + 1, 1, v13);
  v45 = v13[2];
  v44 = v13[3];
  if (v45 >= v44 >> 1)
    v13 = (_QWORD *)sub_1BA23F740(v44 > 1, v45 + 1, 1, v13);
  v13[2] = v45 + 1;
  (*(void (**)(unint64_t, _QWORD *, uint64_t))(v39 + 32))((unint64_t)v13+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(_QWORD *)(v39 + 72) * v45, v43, v1);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t DebugJournal.Summary.placementIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.Summary.contentIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.Detail.label.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.Detail.value.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BA2A76DC()
{
  _BYTE *v0;

  if (*v0)
    return 0x65756C6176;
  else
    return 0x6C6562616CLL;
}

uint64_t sub_1BA2A7708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA2A853C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA2A772C()
{
  sub_1BA2A78B0();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2A7754()
{
  sub_1BA2A78B0();
  return sub_1BA2C2768();
}

uint64_t DebugJournal.Detail.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  char v12;
  char v13;

  sub_1BA2A7A9C(0, &qword_1EF27FD38, MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v11 - v6;
  v8 = *(_QWORD *)(v1 + 16);
  v11[1] = *(_QWORD *)(v1 + 24);
  v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2A78B0();
  sub_1BA2C2750();
  v13 = 0;
  v9 = v11[3];
  sub_1BA2C2654();
  if (!v9)
  {
    v12 = 1;
    sub_1BA2C2654();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BA2A78B0()
{
  unint64_t result;

  result = qword_1EF27FD40;
  if (!qword_1EF27FD40)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CB0A4, &type metadata for DebugJournal.Detail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FD40);
  }
  return result;
}

uint64_t DebugJournal.Detail.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v19;
  char v20;
  char v21;

  sub_1BA2A7A9C(0, &qword_1EF27FD48, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v19 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2A78B0();
  sub_1BA2C2744();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v21 = 0;
  v10 = sub_1BA2C2600();
  v12 = v11;
  v20 = 1;
  swift_bridgeObjectRetain();
  v13 = sub_1BA2C2600();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17 = v13;
  v16(v9, v6);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v17;
  a2[3] = v15;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BA2A7A9C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2A78B0();
    v7 = a3(a1, &type metadata for DebugJournal.Detail.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BA2A7AF8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return DebugJournal.Detail.init(from:)(a1, a2);
}

uint64_t sub_1BA2A7B0C(_QWORD *a1)
{
  return DebugJournal.Detail.encode(to:)(a1);
}

uint64_t DebugJournal.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.details.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DebugJournal.additionalDetails.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DebugJournal.historicalJournals.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *initializeWithCopy for DebugJournal(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[6];
  v8 = a2[7];
  v9 = a2[8];
  v10 = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA22C6F4(v7);
  a1[6] = v7;
  a1[7] = v8;
  a1[8] = v9;
  a1[9] = v10;
  v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  v13 = a2[15];
  a1[14] = a2[14];
  a1[15] = v13;
  v15 = a2[16];
  v14 = a2[17];
  a1[16] = v15;
  a1[17] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DebugJournal(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[6];
  v5 = a2[7];
  v6 = a2[8];
  v7 = a2[9];
  sub_1BA22C6F4(v4);
  v8 = a1[6];
  a1[6] = v4;
  a1[7] = v5;
  a1[8] = v6;
  a1[9] = v7;
  sub_1BA22C4F0(v8);
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[16] = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[17] = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for DebugJournal(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v8;
  sub_1BA22C4F0(v7);
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugJournal(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 144))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DebugJournal(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 144) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 144) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

_QWORD *initializeWithCopy for DebugJournal.Summary(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[6];
  v8 = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA22C6F4(v5);
  a1[4] = v5;
  a1[5] = v6;
  a1[6] = v7;
  a1[7] = v8;
  return a1;
}

_QWORD *assignWithCopy for DebugJournal.Summary(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[4];
  v5 = a2[5];
  v7 = a2[6];
  v6 = a2[7];
  sub_1BA22C6F4(v4);
  v8 = a1[4];
  a1[4] = v4;
  a1[5] = v5;
  a1[6] = v7;
  a1[7] = v6;
  sub_1BA22C4F0(v8);
  return a1;
}

uint64_t assignWithTake for DebugJournal.Summary(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  sub_1BA22C4F0(v6);
  return a1;
}

ValueMetadata *type metadata accessor for DebugJournal.Detail()
{
  return &type metadata for DebugJournal.Detail;
}

uint64_t initializeWithCopy for DebugJournal.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  char v4;
  __int128 v5;

  v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  if (v3 == 1)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    swift_bridgeObjectRetain();
    v4 = 1;
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t))(v5 - 8))(a1);
    v4 = 0;
  }
  *(_BYTE *)(a1 + 40) = v4;
  return a1;
}

uint64_t assignWithCopy for DebugJournal.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      swift_bridgeObjectRelease();
    else
      __swift_destroy_boxed_opaque_existential_1(a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 40) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(_BYTE *)(a1 + 40) = 0;
    }
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DebugJournal.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  char v6;
  __int128 v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      swift_bridgeObjectRelease();
    else
      __swift_destroy_boxed_opaque_existential_1(a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v6 = 1;
    }
    else
    {
      v6 = 0;
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    }
    *(_BYTE *)(a1 + 40) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugJournal.Action(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DebugJournal.Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA2A8344(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_1BA2A8360(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DebugJournal.Action()
{
  return &type metadata for DebugJournal.Action;
}

uint64_t storeEnumTagSinglePayload for DebugJournal.Detail.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1BA2A83E4 + 4 * byte_1BA2CAF35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA2A8418 + 4 * byte_1BA2CAF30[v4]))();
}

uint64_t sub_1BA2A8418(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2A8420(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA2A8428);
  return result;
}

uint64_t sub_1BA2A8434(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA2A843CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA2A8440(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2A8448(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DebugJournal.Detail.CodingKeys()
{
  return &type metadata for DebugJournal.Detail.CodingKeys;
}

unint64_t sub_1BA2A8468()
{
  unint64_t result;

  result = qword_1EF27FD50;
  if (!qword_1EF27FD50)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CB07C, &type metadata for DebugJournal.Detail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FD50);
  }
  return result;
}

unint64_t sub_1BA2A84B0()
{
  unint64_t result;

  result = qword_1EF27FD58;
  if (!qword_1EF27FD58)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CAFEC, &type metadata for DebugJournal.Detail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FD58);
  }
  return result;
}

unint64_t sub_1BA2A84F8()
{
  unint64_t result;

  result = qword_1EF27FD60;
  if (!qword_1EF27FD60)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CB014, &type metadata for DebugJournal.Detail.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF27FD60);
  }
  return result;
}

uint64_t sub_1BA2A853C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1BA2A861C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DebugJournal.Action(a2, a1);
  return a2;
}

uint64_t sub_1BA2A8650()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1BA2A867C()
{
  unint64_t result;

  result = qword_1EF27FD70;
  if (!qword_1EF27FD70)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2C6408, &type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry);
    atomic_store(result, (unint64_t *)&qword_1EF27FD70);
  }
  return result;
}

void sub_1BA2A86C0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_1BA22920C(255, &qword_1EF27E998, (uint64_t)&type metadata for DebugJournal.Detail, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BA2A8730()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_1EF27FD80;
  if (!qword_1EF27FD80)
  {
    sub_1BA2A86C0(255, &qword_1EF27FD78, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    v2 = v1;
    v3 = sub_1BA2A87C0(&qword_1EF27FD88, &qword_1EF27E998, (uint64_t)&type metadata for DebugJournal.Detail, (uint64_t (*)(void))sub_1BA2A882C);
    result = MEMORY[0x1BCCD93D0](MEMORY[0x1E0DEAF10], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_1EF27FD80);
  }
  return result;
}

uint64_t sub_1BA2A87C0(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_1BA22920C(255, a2, a3, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v8 = v7;
    v9 = a4();
    result = MEMORY[0x1BCCD93D0](MEMORY[0x1E0DEAF10], v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BA2A882C()
{
  unint64_t result;

  result = qword_1EF27FD90;
  if (!qword_1EF27FD90)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for DebugJournal.Detail, &type metadata for DebugJournal.Detail);
    atomic_store(result, (unint64_t *)&qword_1EF27FD90);
  }
  return result;
}

double sub_1BA2A8870(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_1BA2A888C(uint64_t a1)
{
  sub_1BA2A88E4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return a1;
}

uint64_t sub_1BA2A88E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BA22C4F0(a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void BannerAdViewManager.__allocating_init(adManager:requestStore:layoutStore:journal:host:)()
{
  swift_allocObject();
  BannerAdViewManager.init(adManager:requestStore:layoutStore:journal:host:)();
}

uint64_t sub_1BA2A8A04()
{
  uint64_t v0;

  return v0;
}

void BannerAdViewManager.view(for:model:size:position:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[25];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v17 = a1;
  v2 = *(_QWORD **)v1;
  v11[16] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 104) - 8);
  v3 = MEMORY[0x1E0C80A78](a1);
  v11[15] = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[8] = v4;
  v5 = MEMORY[0x1E0C80A78](v3);
  v11[13] = (char *)v11 - v6;
  v16 = v2[11];
  v11[6] = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v5);
  v11[18] = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2[12];
  v9 = v2[14];
  v10 = v2[16];
  v12 = v2[10];
  v13 = v8;
  v18 = v12;
  v19 = v8;
  v14 = v9;
  v15 = v10;
  v20 = v9;
  v21 = v10;
  type metadata accessor for AdRequest();
}

uint64_t sub_1BA2A8B2C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  _BYTE v62[96];

  v7 = sub_1BA2C245C();
  v1[30] = *(_QWORD *)(v7 - 8);
  v1[31] = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  v1[10] = &v62[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x1E0C80A78](v8);
  v1[32] = &v62[-v11];
  v1[38] = a1;
  v12 = *(_QWORD *)(a1 - 8);
  v13 = MEMORY[0x1E0C80A78](v10);
  v1[14] = &v62[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x1E0C80A78](v13);
  v1[12] = &v62[-v16];
  v1[7] = v17;
  MEMORY[0x1E0C80A78](v15);
  v1[33] = &v62[-v18];
  v19 = sub_1BA2C2084();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v22 = (uint64_t *)&v62[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BA21D258();
  *v22 = sub_1BA2C23D8();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v20 + 104))(v22, *MEMORY[0x1E0DEF740], v19);
  LOBYTE(a1) = sub_1BA2C209C();
  (*(void (**)(uint64_t *, uint64_t))(v20 + 8))(v22, v19);
  if ((a1 & 1) == 0)
  {
    __break(1u);
LABEL_17:
    swift_once();
LABEL_10:
    v42 = (void *)qword_1ED5B2888;
    sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v1[19] = v43;
    v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_1BA2C3840;
    v45 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v44 + 56) = MEMORY[0x1E0DEA968];
    v46 = sub_1BA2291C8();
    *(_QWORD *)(v44 + 32) = v1[39];
    *(_QWORD *)(v44 + 40) = v19;
    v47 = v1[37];
    v48 = *(_QWORD *)(v47 + 16);
    v49 = *(_QWORD *)(v47 + 24);
    *(_QWORD *)(v44 + 96) = v45;
    *(_QWORD *)(v44 + 104) = v46;
    *(_QWORD *)(v44 + 64) = v46;
    *(_QWORD *)(v44 + 72) = v48;
    v1[20] = v48;
    v1[21] = v49;
    *(_QWORD *)(v44 + 80) = v49;
    v50 = v2[14];
    v51 = v2[15];
    v52 = v2[16];
    v53 = v2[17];
    v1[35] = v2;
    v1[36] = v46;
    v1[23] = v50;
    v1[24] = v51;
    v1[5] = v52;
    v1[22] = v53;
    if (v53)
    {
      v1[46] = v50;
      v1[47] = v51;
      swift_bridgeObjectRetain();
      v54 = v42;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BA2C21C8();
      sub_1BA2C21C8();
      sub_1BA2C21C8();
      v55 = v1[46];
      v51 = v1[47];
    }
    else
    {
      v56 = v50;
      swift_bridgeObjectRetain();
      v57 = v42;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v55 = v56;
    }
    v58 = v1[36];
    *(_QWORD *)(v44 + 136) = v45;
    *(_QWORD *)(v44 + 144) = v58;
    *(_QWORD *)(v44 + 112) = v55;
    *(_QWORD *)(v44 + 120) = v51;
    sub_1BA2C239C();
    sub_1BA2C1EB0();

    swift_bridgeObjectRelease();
    *((_BYTE *)v1 + 368) = 0;
    AdRequestStore.request(for:behavior:)();
  }
  v23 = *(_QWORD *)(v5 + 136);
  v24 = *(void (**)(uint64_t))(v23 + 8);
  v1[17] = v4;
  v1[11] = v23;
  v24(v3);
  v25 = v1[46];
  v19 = v1[47];
  swift_bridgeObjectRetain();
  sub_1BA228114((uint64_t)(v1 + 46));
  swift_beginAccess();
  v26 = v2[19];
  v27 = *(_QWORD *)(v26 + 16);
  v1[39] = v25;
  if (!v27)
  {
LABEL_9:
    v1[34] = v12;
    v1[3] = v2 + 19;
    v1[4] = v3;
    swift_endAccess();
    if (qword_1ED5B2DB0 == -1)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  v28 = sub_1BA229E28(v25, v19);
  if ((v29 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v30 = *(_QWORD *)(v26 + 56) + 16 * v28;
  v31 = *(void **)v30;
  v1[31] = *(_QWORD *)(v30 + 8);
  swift_endAccess();
  v1[32] = v31;
  swift_bridgeObjectRelease();
  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v32 = (void *)qword_1ED5B2888;
  sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1BA2C3840;
  v34 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v33 + 56) = MEMORY[0x1E0DEA968];
  v35 = sub_1BA2291C8();
  *(_QWORD *)(v33 + 32) = v1[39];
  *(_QWORD *)(v33 + 40) = v19;
  v36 = v1[37];
  v37 = *(_QWORD *)(v36 + 16);
  v38 = *(_QWORD *)(v36 + 24);
  *(_QWORD *)(v33 + 96) = v34;
  *(_QWORD *)(v33 + 104) = v35;
  *(_QWORD *)(v33 + 64) = v35;
  *(_QWORD *)(v33 + 72) = v37;
  *(_QWORD *)(v33 + 80) = v38;
  v40 = v2[14];
  v39 = v2[15];
  if (v2[17])
  {
    v1[46] = v40;
    v1[47] = v39;
    v41 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BA2C21C8();
    sub_1BA2C21C8();
    sub_1BA2C21C8();
    v40 = v1[46];
    v39 = v1[47];
  }
  else
  {
    v59 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v60 = v1[32];
  *(_QWORD *)(v33 + 136) = v34;
  *(_QWORD *)(v33 + 144) = v35;
  *(_QWORD *)(v33 + 112) = v40;
  *(_QWORD *)(v33 + 120) = v39;
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  return v60;
}

void sub_1BA2A9A5C()
{
  type metadata accessor for AdRequest();
}

uint64_t sub_1BA2A9AF0(uint64_t a1)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t result;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFTimeInterval v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t ObjectType;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double (*v76)(uint64_t, uint64_t);
  uint64_t v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;

  v10 = sub_1BA2C245C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v93 - v12;
  v14 = *v2;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v16 = (_QWORD *)result;
    *(_QWORD *)(v5 - 352) = v11;
    swift_beginAccess();
    v17 = MEMORY[0x1BCCD9544](v3 + 16);
    if (v17)
    {
      v18 = (void *)v17;
      if (v14)
      {
        v19 = *(_QWORD *)(v3 + 24);
        *(_QWORD *)(v5 - 360) = v10;
        *(_QWORD *)(v5 - 368) = v4;
        *(_QWORD *)(v5 - 376) = v13;
        *(_QWORD *)(v5 - 384) = a1;
        *(_QWORD *)(v5 - 392) = v19;
        if (v14 != (void *)1)
        {
          if (v14 == (void *)2)
          {
            v20 = *(_QWORD *)(v5 - 328);
            if (qword_1ED5B2DB0 != -1)
              swift_once();
            *(_QWORD *)(v5 - 400) = (id)qword_1ED5B2888;
            *(_DWORD *)(v5 - 408) = sub_1BA2C2390();
            sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
            v21 = swift_allocObject();
            *(_OWORD *)(v21 + 16) = xmmword_1BA2C3840;
            v22 = MEMORY[0x1E0DEA968];
            *(_QWORD *)(v21 + 56) = MEMORY[0x1E0DEA968];
            v23 = sub_1BA2291C8();
            v24 = *(_QWORD *)(v5 - 344);
            *(_QWORD *)(v21 + 32) = v20;
            *(_QWORD *)(v21 + 40) = v24;
            v25 = *(_QWORD *)(v1 + 16);
            v26 = *(_QWORD *)(v1 + 24);
            *(_QWORD *)(v21 + 96) = v22;
            *(_QWORD *)(v21 + 104) = v23;
            *(_QWORD *)(v21 + 64) = v23;
            *(_QWORD *)(v21 + 72) = v25;
            *(_QWORD *)(v21 + 80) = v26;
            v28 = v16[14];
            v27 = v16[15];
            if (v16[17])
            {
              *(_QWORD *)(v5 - 272) = v28;
              *(_QWORD *)(v5 - 264) = v27;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              sub_1BA2C21C8();
              sub_1BA2C21C8();
              sub_1BA2C21C8();
              v28 = *(_QWORD *)(v5 - 272);
              v27 = *(_QWORD *)(v5 - 264);
            }
            else
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
            }
            *(_QWORD *)(v21 + 136) = MEMORY[0x1E0DEA968];
            *(_QWORD *)(v21 + 144) = v23;
            *(_QWORD *)(v21 + 112) = v28;
            *(_QWORD *)(v21 + 120) = v27;
            v65 = *(void **)(v5 - 400);
            sub_1BA2C1EB0();

            swift_bridgeObjectRelease();
            ObjectType = swift_getObjectType();
            objc_msgSend(v18, sel_frame);
            v68 = v67;
            v70 = v69;
            *(_QWORD *)(v5 - 272) = v18;
            (*(void (**)(uint64_t))(*(_QWORD *)(v5 - 392) + 8))(ObjectType);
            *(_QWORD *)(v5 - 272) = v7;
            *(_QWORD *)(v5 - 264) = v6;
            *(_QWORD *)(v5 - 256) = v68;
            *(_QWORD *)(v5 - 248) = v70;
            *(_BYTE *)(v5 - 240) = 0;
            Journal.addCollapsedEntry(request:placementIdentifier:contentIdentifier:layout:)();
          }
          v51 = v14;
          v52 = *(_QWORD *)(v5 - 328);
          if (qword_1ED5B2DB0 != -1)
            swift_once();
          v53 = (id)qword_1ED5B2888;
          *(_DWORD *)(v5 - 400) = sub_1BA2C2390();
          sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
          v54 = swift_allocObject();
          *(_OWORD *)(v54 + 16) = xmmword_1BA2C4620;
          v55 = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v54 + 56) = MEMORY[0x1E0DEA968];
          v56 = sub_1BA2291C8();
          v57 = *(_QWORD *)(v5 - 344);
          *(_QWORD *)(v54 + 32) = v52;
          *(_QWORD *)(v54 + 40) = v57;
          v58 = *(_QWORD *)(v1 + 16);
          v59 = *(_QWORD *)(v1 + 24);
          *(_QWORD *)(v54 + 96) = v55;
          *(_QWORD *)(v54 + 104) = v56;
          *(_QWORD *)(v54 + 64) = v56;
          *(_QWORD *)(v54 + 72) = v58;
          *(_QWORD *)(v54 + 80) = v59;
          *(_QWORD *)(v5 - 272) = 0;
          *(_QWORD *)(v5 - 264) = 0xE000000000000000;
          *(_QWORD *)(v5 - 312) = v14;
          sub_1BA222948(0, (unint64_t *)&qword_1ED5B2CD0);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1BA2C2570();
          v60 = *(_QWORD *)(v5 - 272);
          v61 = *(_QWORD *)(v5 - 264);
          *(_QWORD *)(v54 + 136) = v55;
          *(_QWORD *)(v54 + 144) = v56;
          *(_QWORD *)(v54 + 112) = v60;
          *(_QWORD *)(v54 + 120) = v61;
          v63 = v16[14];
          v62 = v16[15];
          if (v16[17])
          {
            *(_QWORD *)(v5 - 272) = v63;
            *(_QWORD *)(v5 - 264) = v62;
            swift_bridgeObjectRetain();
            sub_1BA2C21C8();
            sub_1BA2C21C8();
            sub_1BA2C21C8();
            v63 = *(_QWORD *)(v5 - 272);
            v64 = *(_QWORD *)(v5 - 264);
          }
          else
          {
            v64 = swift_bridgeObjectRetain();
          }
          *(_QWORD *)(v54 + 176) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v54 + 184) = v56;
          *(_QWORD *)(v54 + 152) = v63;
          *(_QWORD *)(v54 + 160) = v64;
          sub_1BA2C1EB0();

          swift_bridgeObjectRelease();
          v88 = *(_QWORD *)(v5 - 384);
          v89 = *(_QWORD *)(v88 - 8);
          v90 = *(_QWORD *)(v5 - 376);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v89 + 16))(v90, *(_QWORD *)(v5 - 336), v88);
          v91 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v89 + 56);
          *(_QWORD *)(v5 - 400) = v91;
          v91(v90, 0, 1, v88);
          v92 = swift_getObjectType();
          *(_QWORD *)(v5 - 272) = v18;
          (*(void (**)(uint64_t))(*(_QWORD *)(v5 - 392) + 8))(v92);
          Journal.addFailedEntry(error:request:placementIdentifier:contentIdentifier:)();
        }
        v30 = *(uint64_t **)(v5 - 336);
        if (qword_1ED5B2DB0 != -1)
          swift_once();
        v31 = (void *)qword_1ED5B2888;
        sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
        *(_QWORD *)(v5 - 408) = v32;
        v33 = swift_allocObject();
        *(_OWORD *)(v33 + 16) = xmmword_1BA2C39C0;
        v34 = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v33 + 56) = MEMORY[0x1E0DEA968];
        v35 = sub_1BA2291C8();
        v36 = *(_QWORD *)(v5 - 344);
        *(_QWORD *)(v33 + 32) = *(_QWORD *)(v5 - 328);
        *(_QWORD *)(v33 + 40) = v36;
        v37 = *(_QWORD *)(v1 + 16);
        v38 = *(_QWORD *)(v1 + 24);
        *(_QWORD *)(v33 + 96) = v34;
        *(_QWORD *)(v33 + 104) = v35;
        *(_QWORD *)(v33 + 64) = v35;
        *(_QWORD *)(v33 + 72) = v37;
        *(_QWORD *)(v5 - 424) = v37;
        *(_QWORD *)(v33 + 80) = v38;
        v39 = *v30;
        v40 = v30[1];
        *(_QWORD *)(v33 + 136) = v34;
        *(_QWORD *)(v33 + 144) = v35;
        *(_QWORD *)(v33 + 112) = v39;
        *(_QWORD *)(v33 + 120) = v40;
        *(_QWORD *)(v5 - 272) = 0;
        *(_QWORD *)(v5 - 264) = 0xE000000000000000;
        *(_QWORD *)(v5 - 400) = swift_getObjectType();
        v41 = v31;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v5 - 416) = v38;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        objc_msgSend(v18, sel_frame);
        *(_QWORD *)(v5 - 312) = v42;
        *(_QWORD *)(v5 - 304) = v43;
        type metadata accessor for CGSize(0);
        sub_1BA2C2570();
        v44 = *(_QWORD *)(v5 - 272);
        v45 = *(_QWORD *)(v5 - 264);
        *(_QWORD *)(v33 + 176) = v34;
        *(_QWORD *)(v33 + 184) = v35;
        *(_QWORD *)(v33 + 152) = v44;
        *(_QWORD *)(v33 + 160) = v45;
        v46 = CACurrentMediaTime();
        v47 = MEMORY[0x1E0DEB100];
        *(_QWORD *)(v33 + 216) = MEMORY[0x1E0DEB070];
        *(_QWORD *)(v33 + 224) = v47;
        *(CFTimeInterval *)(v33 + 192) = (v46 - v8) * 1000.0;
        v49 = v16[14];
        v48 = v16[15];
        if (v16[17])
        {
          *(_QWORD *)(v5 - 272) = v49;
          *(_QWORD *)(v5 - 264) = v48;
          swift_bridgeObjectRetain();
          sub_1BA2C21C8();
          sub_1BA2C21C8();
          sub_1BA2C21C8();
          v49 = *(_QWORD *)(v5 - 272);
          v50 = *(_QWORD *)(v5 - 264);
        }
        else
        {
          v50 = swift_bridgeObjectRetain();
        }
        *(_QWORD *)(v33 + 256) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v33 + 264) = v35;
        *(_QWORD *)(v33 + 232) = v49;
        *(_QWORD *)(v33 + 240) = v50;
        sub_1BA2C239C();
        sub_1BA2C1EB0();

        swift_bridgeObjectRelease();
        objc_msgSend(v18, sel_frame);
        v72 = v71;
        v74 = v73;
        *(_QWORD *)(v5 - 272) = v18;
        v75 = *(_QWORD *)(v5 - 392);
        v76 = *(double (**)(uint64_t, uint64_t))(v75 + 40);
        v77 = *(_QWORD *)(v5 - 400);
        v78 = v76(v77, v75);
        *(_QWORD *)(v5 - 272) = v18;
        v76(v77, v75);
        v80 = v79;
        v81 = v16[11];
        v82 = v16[12];
        __swift_project_boxed_opaque_existential_1(v16 + 8, v81);
        *(_QWORD *)(v5 - 272) = v72;
        *(_QWORD *)(v5 - 264) = v74;
        *(double *)(v5 - 256) = v78;
        *(_QWORD *)(v5 - 248) = v80;
        (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v82 + 16))(v5 - 272, *(_QWORD *)(v5 - 328), *(_QWORD *)(v5 - 344), v81, v82);
        objc_msgSend(v18, sel_frame);
        v84 = v83;
        v86 = v85;
        *(_QWORD *)(v5 - 272) = v18;
        v87 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
        *(_QWORD *)(v5 - 432) = v87;
        v87(v77, v75);
        *(_QWORD *)(v5 - 272) = v7;
        *(_QWORD *)(v5 - 264) = v6;
        *(_QWORD *)(v5 - 256) = v84;
        *(_QWORD *)(v5 - 248) = v86;
        *(_BYTE *)(v5 - 240) = 0;
        Journal.addFulfilledEntry(request:placementIdentifier:contentIdentifier:layout:)();
      }
      v29 = *(_QWORD *)(a1 - 8);
      (*(void (**)(char *, _QWORD, uint64_t))(v29 + 16))(v13, *(_QWORD *)(v5 - 336), a1);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v13, 0, 1, a1);
      *(_QWORD *)(v5 - 272) = 1;
      *(_OWORD *)(v5 - 264) = 0u;
      *(_OWORD *)(v5 - 248) = 0u;
      *(_OWORD *)(v5 - 232) = 0u;
      *(_OWORD *)(v5 - 216) = 0u;
      *(_QWORD *)(v5 - 200) = 0;
      *(_BYTE *)(v5 - 192) = 2;
      sub_1BA2AA9B0();
    }
    return swift_release();
  }
  return result;
}

void sub_1BA2AA9B0()
{
  type metadata accessor for AdRequest();
}

void sub_1BA2AAA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = sub_1BA2C245C();
  v9[6] = v15;
  v9[2] = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v9[1] = (char *)&a9 - v16;
  v17 = *(_QWORD *)(v13 + 104);
  v9[5] = v13;
  v18 = *(_QWORD *)(v13 + 136);
  v9[62] = v17;
  v9[63] = v12;
  v9[11] = v12;
  v9[13] = v11;
  v9[14] = v10;
  v9[64] = v11;
  v9[65] = v18;
  v9[9] = v14;
  v9[66] = v14;
  v9[67] = v10;
  type metadata accessor for BannerAdUpdate();
}

void sub_1BA2AAA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);

  v9[12] = a1;
  v9[10] = *(_QWORD *)(a1 - 8);
  v14 = MEMORY[0x1E0C80A78](a1);
  v9[16] = (char *)&a9 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  *v9 = (char *)&a9 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v18 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v9[8] = v13;
  v18(v10, v11);
  swift_bridgeObjectRetain();
  sub_1BA228114((uint64_t)(v9 + 31));
  sub_1BA2283EC(v9[15], (uint64_t)(v9 + 20));
  v9[3] = v18;
  v9[4] = v12;
  v18(v10, v11);
  swift_bridgeObjectRetain();
  sub_1BA228114((uint64_t)(v9 + 62));
  Journal.createDebugJournal(for:)();
}

void sub_1BA2AAB84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;

  swift_bridgeObjectRelease();
  v0[62] = v1;
  v0[63] = v7;
  sub_1BA2205FC((uint64_t)(v0 + 20), (uint64_t)(v0 + 64));
  v9 = *(_OWORD *)(v8 - 168);
  *(_OWORD *)(v0 + 85) = *(_OWORD *)(v8 - 152);
  v10 = *(_OWORD *)(v8 - 120);
  *(_OWORD *)(v0 + 87) = *(_OWORD *)(v8 - 136);
  *(_OWORD *)(v0 + 89) = v10;
  *(_OWORD *)(v0 + 91) = *(_OWORD *)(v8 - 104);
  v11 = *(_OWORD *)(v8 - 232);
  *(_OWORD *)(v0 + 77) = *(_OWORD *)(v8 - 216);
  v12 = *(_OWORD *)(v8 - 184);
  *(_OWORD *)(v0 + 79) = *(_OWORD *)(v8 - 200);
  *(_OWORD *)(v0 + 81) = v12;
  *(_OWORD *)(v0 + 83) = v9;
  *(_OWORD *)(v0 + 75) = v11;
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v5 + 16))(v0 + 62, v2, v5);
  v0[8] = v3;
  v13 = *v0;
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*v0, v4, v2);
  v14 = v0[1];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[2] + 16))(v14, v0[7], v0[6]);
  swift_retain();
  v15 = (uint64_t *)v0[16];
  v0[17] = v2;
  BannerAdUpdate.init(model:request:journal:)(v13, v14, v6, v2, v5, v15);
}

void sub_1BA2AAC54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v3 = (void *)qword_1ED5B2888;
  sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2C3840;
  v5 = v3;
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = v2;
  (*(void (**)(_QWORD, uint64_t))(v0 + 24))(*(_QWORD *)(v0 + 136), v2);
  v7 = *(_QWORD *)(v0 + 248);
  v6 = *(_QWORD *)(v0 + 256);
  swift_bridgeObjectRetain();
  sub_1BA228114(v0 + 248);
  v8 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEA968];
  v9 = sub_1BA2291C8();
  *(_QWORD *)(v4 + 64) = v9;
  *(_QWORD *)(v4 + 32) = v7;
  *(_QWORD *)(v4 + 40) = v6;
  v10 = BannerAdState.description.getter();
  *(_QWORD *)(v4 + 96) = v8;
  *(_QWORD *)(v4 + 104) = v9;
  *(_QWORD *)(v4 + 72) = v10;
  *(_QWORD *)(v4 + 80) = v11;
  v12 = *(_QWORD **)(v0 + 32);
  v14 = v12[14];
  v13 = v12[15];
  if (v12[17])
  {
    *(_QWORD *)(v0 + 160) = v14;
    *(_QWORD *)(v0 + 168) = v13;
    swift_bridgeObjectRetain();
    sub_1BA2C21C8();
    sub_1BA2C21C8();
    sub_1BA2C21C8();
    v14 = *(_QWORD *)(v0 + 160);
    v15 = *(_QWORD *)(v0 + 168);
  }
  else
  {
    v15 = swift_bridgeObjectRetain();
  }
  *(_QWORD *)(v4 + 136) = v8;
  *(_QWORD *)(v4 + 144) = v9;
  *(_QWORD *)(v4 + 112) = v14;
  *(_QWORD *)(v4 + 120) = v15;
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v0 + 32) = &v24;
  v16 = v12[18];
  *(_QWORD *)(v0 + 152) = v16;
  MEMORY[0x1E0C80A78](v16);
  v17 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 120) = *(_QWORD *)(v17 + 88);
  v18 = *(_QWORD *)(v0 + 88);
  v19 = *(_QWORD *)(v0 + 104);
  v20 = *(_QWORD *)(v0 + 112);
  v23 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v17 + 120);
  v21 = *(_QWORD *)(v0 + 72);
  v22 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 248) = v23;
  *(_QWORD *)(v0 + 256) = v18;
  *(_QWORD *)(v0 + 264) = v19;
  *(_QWORD *)(v0 + 272) = v22;
  *(_QWORD *)(v0 + 280) = v21;
  *(_QWORD *)(v0 + 288) = v20;
  type metadata accessor for DisposableObserver();
}

uint64_t BannerAdViewManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  Swift::String v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 152);
  v2 = v1 + 64;
  v3 = 1 << *(_BYTE *)(v1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v6)
      goto LABEL_25;
    v16 = *(_QWORD *)(v2 + 8 * v15);
    ++v8;
    if (!v16)
    {
      v8 = v15 + 1;
      if (v15 + 1 >= v6)
        goto LABEL_25;
      v16 = *(_QWORD *)(v2 + 8 * v8);
      if (!v16)
      {
        v8 = v15 + 2;
        if (v15 + 2 >= v6)
          goto LABEL_25;
        v16 = *(_QWORD *)(v2 + 8 * v8);
        if (!v16)
        {
          v8 = v15 + 3;
          if (v15 + 3 >= v6)
            goto LABEL_25;
          v16 = *(_QWORD *)(v2 + 8 * v8);
          if (!v16)
          {
            v8 = v15 + 4;
            if (v15 + 4 >= v6)
              goto LABEL_25;
            v16 = *(_QWORD *)(v2 + 8 * v8);
            if (!v16)
              break;
          }
        }
      }
    }
LABEL_24:
    v5 = (v16 - 1) & v16;
    v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v10);
    v13 = *v11;
    v12 = (void *)v11[1];
    swift_bridgeObjectRetain();
    v14._countAndFlagsBits = v13;
    v14._object = v12;
    Journal.removeEntries(for:)(v14);
    result = swift_bridgeObjectRelease();
  }
  v17 = v15 + 5;
  if (v17 >= v6)
  {
LABEL_25:
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v0;
  }
  v16 = *(_QWORD *)(v2 + 8 * v17);
  if (v16)
  {
    v8 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    v8 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v8 >= v6)
      goto LABEL_25;
    v16 = *(_QWORD *)(v2 + 8 * v8);
    ++v17;
    if (v16)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t BannerAdViewManager.__deallocating_deinit()
{
  BannerAdViewManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA2AB1A8()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1BA2AB1B4()
{
  uint64_t v0;

  swift_release();
  sub_1BA2AB510(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t sub_1BA2AB1E0()
{
  return sub_1BA2AB1A8();
}

uint64_t sub_1BA2AB200()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BA2AB224()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1BA2AB248()
{
  type metadata accessor for AdRequest();
}

uint64_t sub_1BA2AB2A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v10 = (v5 + v7 + v9) & ~v9;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2 + v5, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v2 + v10 + *(int *)(a1 + 52), v4);
  type metadata accessor for AdContext(0, v4, v13, v11);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v2 + v10 + *(int *)(a1 + 56), v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1BA2AB3C0()
{
  type metadata accessor for AdRequest();
}

void sub_1BA2AB418()
{
  sub_1BA2A9A5C();
}

uint64_t sub_1BA2AB4A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA2AB4C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = *a1;
  return v2(&v4);
}

uint64_t method lookup function for BannerAdViewManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BannerAdViewManager.__allocating_init(adManager:requestStore:layoutStore:journal:host:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_1BA2AB510(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

BOOL sub_1BA2AB534(_QWORD *a1)
{
  uint64_t v1;

  v1 = MEMORY[0x1BCCD9544](*a1 + 32);
  if (v1)
    swift_unknownObjectRelease();
  return v1 != 0;
}

uint64_t sub_1BA2AB578(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = *(_QWORD *)(v1 + 80);
  v3 = *(void (**)(uint64_t))(*(_QWORD *)a1 + 16);
  swift_retain();
  v3(v2);
  return swift_release();
}

uint64_t destroy for AdContextError()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s7NewsAds14AdContextErrorOwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AdContextError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AdContextError(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AdContextError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdContextError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

NewsAds::AdStatusCondition __swiftcall AdStatusCondition.withState(_:)(NewsAds::AdStatusCondition::State a1)
{
  uint64_t v1;
  _QWORD *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NewsAds::AdStatusCondition::State v7;
  NewsAds::AdStatusCondition result;

  v3 = *(_BYTE *)a1;
  v4 = v2[1];
  *(_QWORD *)v1 = *v2;
  *(_QWORD *)(v1 + 8) = v4;
  *(_BYTE *)(v1 + 16) = v3;
  v5 = swift_bridgeObjectRetain();
  result.identifier._object = v6;
  result.identifier._countAndFlagsBits = v5;
  result.state = v7;
  return result;
}

uint64_t AdStatusCondition.State.hash(into:)()
{
  return sub_1BA2C272C();
}

BOOL static AdStatusCondition.State.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AdStatusCondition.State.hashValue.getter()
{
  sub_1BA2C2720();
  sub_1BA2C272C();
  return sub_1BA2C2738();
}

uint64_t AdStatusCondition.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void AdStatusCondition.state.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

NewsAds::AdStatusCondition __swiftcall AdStatusCondition.init(identifier:state:)(Swift::String identifier, NewsAds::AdStatusCondition::State state)
{
  uint64_t v2;
  char v3;
  NewsAds::AdStatusCondition result;

  v3 = *(_BYTE *)state;
  *(Swift::String *)v2 = identifier;
  *(_BYTE *)(v2 + 16) = v3;
  result.identifier = identifier;
  result.state = state;
  return result;
}

uint64_t static AdStatusCondition.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 ^ v3 ^ 1u;
  v5 = sub_1BA2C26A8();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 ^ v3 ^ 1u;
  return result;
}

unint64_t sub_1BA2AB89C()
{
  unint64_t result;

  result = qword_1EF27FD98;
  if (!qword_1EF27FD98)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for AdStatusCondition.State, &type metadata for AdStatusCondition.State);
    atomic_store(result, (unint64_t *)&qword_1EF27FD98);
  }
  return result;
}

uint64_t sub_1BA2AB8E0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 ^ v3 ^ 1u;
  v5 = sub_1BA2C26A8();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 ^ v3 ^ 1u;
  return result;
}

uint64_t sub_1BA2AB940(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AdStatusCondition(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AdStatusCondition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdStatusCondition(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdStatusCondition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AdStatusCondition()
{
  return &type metadata for AdStatusCondition;
}

uint64_t storeEnumTagSinglePayload for AdStatusCondition.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1BA2ABAE8 + 4 * byte_1BA2CB295[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA2ABB1C + 4 * asc_1BA2CB290[v4]))();
}

uint64_t sub_1BA2ABB1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2ABB24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA2ABB2CLL);
  return result;
}

uint64_t sub_1BA2ABB38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA2ABB40);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA2ABB44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2ABB4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AdStatusCondition.State()
{
  return &type metadata for AdStatusCondition.State;
}

uint64_t dispatch thunk of AdPlacementSizeProviding.boundingSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for InterstitialAdViewLayoutAttributes()
{
  return &type metadata for InterstitialAdViewLayoutAttributes;
}

double sub_1BA2ABB80()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t sub_1BA2ABB88()
{
  return sub_1BA2C1F4C();
}

void DebugJournalSummaryViewLayoutOptions.init(boundingSize:screenScale:layoutMargins:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
  a1[6] = a8;
}

uint64_t DebugJournalSummaryViewLayoutOptions.Embedded.init(layoutOptions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DebugJournalSummaryViewLayoutOptions()
{
  return &type metadata for DebugJournalSummaryViewLayoutOptions;
}

uint64_t initializeBufferWithCopyOfBuffer for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BA2C167C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions.Embedded()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2ABE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions.Embedded()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2ABE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA2C167C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DebugJournalSummaryViewLayoutOptions.Embedded()
{
  uint64_t result;

  result = qword_1EF27FDF8;
  if (!qword_1EF27FDF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BA2ABEC8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BA2C167C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t PrerollAdPlacement.placementIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrerollAdPlacement.desiredPlacement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PrerollAdPlacement() + 20);
  v4 = sub_1BA2C1AC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

double PrerollAdPlacement.boundingSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for PrerollAdPlacement() + 24));
}

uint64_t PrerollAdPlacement.insertionType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for PrerollAdPlacement();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t PrerollAdPlacement.init(placementIdentifier:boundingSize:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  int *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  double *v15;

  v10 = (int *)type metadata accessor for PrerollAdPlacement();
  v11 = (_QWORD *)((char *)a3 + v10[5]);
  *v11 = 1;
  v12 = *MEMORY[0x1E0D81E80];
  v13 = sub_1BA2C1AC0();
  result = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v11, v12, v13);
  *((_BYTE *)a3 + v10[7]) = 0;
  *a3 = a1;
  a3[1] = a2;
  v15 = (double *)((char *)a3 + v10[6]);
  *v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t getEnumTagSinglePayload for PrerollAdPlacement()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2AC0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1BA2C1AC0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for PrerollAdPlacement()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2AC130(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1BA2C1AC0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

id PrerollAd.metricsView.getter()
{
  id *v0;

  return *v0;
}

uint64_t PrerollAd.contentIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrerollAd.placement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for PrerollAd() + 24);
  return sub_1BA27A66C(v3, a1);
}

uint64_t type metadata accessor for PrerollAd()
{
  uint64_t result;

  result = qword_1EF27FE88;
  if (!qword_1EF27FE88)
    return swift_getSingletonMetadata();
  return result;
}

char *initializeBufferWithCopyOfBuffer for PrerollAd(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  char *v18;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v6;
    v7 = *(int *)(a3 + 24);
    v8 = &a1[v7];
    v9 = (uint64_t)a2 + v7;
    v10 = *(uint64_t *)((char *)a2 + v7 + 8);
    *(_QWORD *)v8 = *(char **)((char *)a2 + v7);
    *((_QWORD *)v8 + 1) = v10;
    v11 = (int *)type metadata accessor for PrerollAdPlacement();
    v12 = v11[5];
    v18 = &v8[v12];
    v13 = v9 + v12;
    v14 = sub_1BA2C1AC0();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v18, v13, v14);
    *(_OWORD *)&v8[v11[6]] = *(_OWORD *)(v9 + v11[6]);
    v8[v11[7]] = *(_BYTE *)(v9 + v11[7]);
  }
  return v5;
}

uint64_t destroy for PrerollAd(id *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = (char *)a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  v5 = &v4[*(int *)(type metadata accessor for PrerollAdPlacement() + 20)];
  v6 = sub_1BA2C1AC0();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

_QWORD *initializeWithCopy for PrerollAd(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  id v15;
  char *v17;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = a2 + v6;
  v9 = *(_QWORD *)(a2 + v6 + 8);
  *v7 = *(_QWORD *)(a2 + v6);
  v7[1] = v9;
  v10 = (int *)type metadata accessor for PrerollAdPlacement();
  v11 = v10[5];
  v17 = (char *)v7 + v11;
  v12 = v8 + v11;
  v13 = sub_1BA2C1AC0();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v17, v12, v13);
  *(_OWORD *)((char *)v7 + v10[6]) = *(_OWORD *)(v8 + v10[6]);
  *((_BYTE *)v7 + v10[7]) = *(_BYTE *)(v8 + v10[7]);
  return a1;
}

uint64_t assignWithCopy for PrerollAd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 24);
  v10 = (_QWORD *)(a1 + v9);
  v11 = a2 + v9;
  *v10 = *(_QWORD *)(a2 + v9);
  v10[1] = *(_QWORD *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for PrerollAdPlacement();
  v13 = v12[5];
  v14 = (char *)v10 + v13;
  v15 = v11 + v13;
  v16 = sub_1BA2C1AC0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = v12[6];
  v18 = (_QWORD *)((char *)v10 + v17);
  v19 = (_QWORD *)(v11 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  *((_BYTE *)v10 + v12[7]) = *(_BYTE *)(v11 + v12[7]);
  return a1;
}

uint64_t initializeWithTake for PrerollAd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  *(_OWORD *)(a1 + v4) = *(_OWORD *)(a2 + v4);
  v7 = (int *)type metadata accessor for PrerollAdPlacement();
  v8 = v7[5];
  v9 = v5 + v8;
  v10 = v6 + v8;
  v11 = sub_1BA2C1AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)(v5 + v7[6]) = *(_OWORD *)(v6 + v7[6]);
  *(_BYTE *)(v5 + v7[7]) = *(_BYTE *)(v6 + v7[7]);
  return a1;
}

uint64_t assignWithTake for PrerollAd(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (char *)a2 + v8;
  v11 = *(_QWORD *)((char *)a2 + v8 + 8);
  *v9 = *(_QWORD *)((char *)a2 + v8);
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for PrerollAdPlacement();
  v13 = v12[5];
  v14 = (char *)v9 + v13;
  v15 = &v10[v13];
  v16 = sub_1BA2C1AC0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  *(_OWORD *)((char *)v9 + v12[6]) = *(_OWORD *)&v10[v12[6]];
  *((_BYTE *)v9 + v12[7]) = v10[v12[7]];
  return a1;
}

uint64_t getEnumTagSinglePayload for PrerollAd()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2AC6F0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for PrerollAdPlacement();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for PrerollAd()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1BA2AC778(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for PrerollAdPlacement();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_1BA2AC7EC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PrerollAdPlacement();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BA2AC86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  __int128 v6;
  __int128 v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  _OWORD v11[4];
  uint64_t v12;

  if (*(_QWORD *)(a1 + 24))
  {
    v6 = *(_OWORD *)(a1 + 48);
    v11[2] = *(_OWORD *)(a1 + 32);
    v11[3] = v6;
    v12 = *(_QWORD *)(a1 + 64);
    v7 = *(_OWORD *)(a1 + 16);
    v11[0] = *(_OWORD *)a1;
    v11[1] = v7;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_1BA288434((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BA2AE6DC(a1, (unint64_t *)&unk_1ED5B0F50);
    sub_1BA2AD978(a2, a3, (uint64_t)v11);
    swift_bridgeObjectRelease();
    return sub_1BA2AE6DC((uint64_t)v11, (unint64_t *)&unk_1ED5B0F50);
  }
}

uint64_t AdManager.__allocating_init(previewQueue:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  AdManager.init(previewQueue:)(a1);
  return v2;
}

uint64_t AdRequest.identifier.getter()
{
  uint64_t v0;

  v0 = sub_1BA2AE110();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1BA2AC9D0()
{
  uint64_t v0;

  v0 = sub_1BA2AE110();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t AdManager.enabled.getter()
{
  unsigned __int8 v1;

  swift_retain();
  sub_1BA2C1574();
  swift_release();
  return v1;
}

uint64_t AdManager.adProvider<A, B, C>(for:request:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *a1;
  swift_retain();
  sub_1BA2C1574();
  swift_release();
  if (v18 == 1)
  {
    v5 = a1[2];
    v4 = a1[3];
    swift_beginAccess();
    v6 = *(_QWORD *)(v1 + 104);
    if (*(_QWORD *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      v7 = sub_1BA229E28(v5, v4);
      if ((v8 & 1) != 0)
      {
        sub_1BA2605C4(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v16);
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
    }
    swift_endAccess();
    if (*((_QWORD *)&v17 + 1))
    {
      v10 = *(_QWORD *)(v3 + 96);
      v11 = *(_QWORD *)(v3 + 104);
      v12 = *(_QWORD *)(v3 + 128);
      v18 = *(_QWORD *)(v3 + 88);
      *(_QWORD *)&v19 = v10;
      *((_QWORD *)&v19 + 1) = v11;
      v20 = *(_OWORD *)(v3 + 112);
      v22 = v12;
      v21 = v12;
      type metadata accessor for Ad();
    }
    sub_1BA2AE6DC((uint64_t)&v16, (unint64_t *)&unk_1ED5B2FD0);
    if (qword_1ED5B2DB0 != -1)
      swift_once();
    v13 = (id)qword_1ED5B2888;
    sub_1BA2C2390();
    sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BA2C37C0;
    v14 = *(_QWORD *)(v3 + 128);
    v18 = *(_QWORD *)(v3 + 88);
    v19 = *(_OWORD *)(v3 + 104);
    *(_QWORD *)&v20 = v14;
    type metadata accessor for AdRequest();
  }
  sub_1BA2AE118();
  swift_allocError();
  *v9 = 2;
  return swift_willThrow();
}

uint64_t AdManager.adProvider<A, B, C>(for:context:placement:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v5 = (_QWORD *)*a1;
  swift_retain();
  sub_1BA2C1574();
  swift_release();
  if (v28 == 1)
  {
    v34 = a2;
    v7 = a1[2];
    v6 = a1[3];
    swift_beginAccess();
    v8 = *(_QWORD *)(v2 + 104);
    if (*(_QWORD *)(v8 + 16))
    {
      swift_bridgeObjectRetain();
      v9 = sub_1BA229E28(v7, v6);
      if ((v10 & 1) != 0)
      {
        sub_1BA2605C4(*(_QWORD *)(v8 + 56) + 32 * v9, (uint64_t)&v26);
      }
      else
      {
        v26 = 0u;
        v27 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
    }
    swift_endAccess();
    if (*((_QWORD *)&v27 + 1))
    {
      v12 = v5[12];
      v13 = v5[13];
      v14 = v5[14];
      v15 = v5[15];
      v16 = v5[16];
      v28 = v5[11];
      v29 = v12;
      v30 = v13;
      v31 = v14;
      v32 = v15;
      v33 = v16;
      type metadata accessor for Ad();
    }
    sub_1BA2AE6DC((uint64_t)&v26, (unint64_t *)&unk_1ED5B2FD0);
    if (qword_1ED5B2DB0 != -1)
      swift_once();
    v17 = (id)qword_1ED5B2888;
    sub_1BA2C2390();
    sub_1BA2228E8(0, (unint64_t *)&qword_1ED5B2CC0, (unint64_t *)&qword_1ED5B2CD8, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1BA2C37C0;
    v19 = (*(uint64_t (**)(_QWORD))(v5[16] + 8))(v5[13]);
    v21 = v20;
    v22 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
    v23 = sub_1BA2291C8();
    *(_QWORD *)(v18 + 32) = v19;
    *(_QWORD *)(v18 + 40) = v21;
    *(_QWORD *)(v18 + 96) = v22;
    *(_QWORD *)(v18 + 104) = v23;
    *(_QWORD *)(v18 + 64) = v23;
    *(_QWORD *)(v18 + 72) = v7;
    *(_QWORD *)(v18 + 80) = v6;
    swift_bridgeObjectRetain();
    sub_1BA2C1EB0();

    swift_bridgeObjectRelease();
    v11 = 0;
  }
  else
  {
    v11 = 2;
  }
  sub_1BA2AE118();
  swift_allocError();
  *v24 = v11;
  return swift_willThrow();
}

uint64_t AdManager.deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t AdManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA2AD6D0()
{
  unsigned __int8 v1;

  swift_retain();
  sub_1BA2C1574();
  swift_release();
  return v1;
}

uint64_t sub_1BA2AD714(uint64_t *a1)
{
  return AdManager.adProvider<A, B, C>(for:request:)(a1);
}

uint64_t sub_1BA2AD734(_QWORD *a1, uint64_t a2)
{
  return AdManager.adProvider<A, B, C>(for:context:placement:)(a1, a2);
}

void sub_1BA2AD754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedConformanceWitness;
  _QWORD v16[8];

  v16[0] = a2;
  v16[1] = a3;
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v14 + 16))((char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v16[2] = a6;
  v16[3] = a5;
  v16[4] = a7;
  v16[5] = a9;
  v16[6] = AssociatedConformanceWitness;
  v16[7] = a10;
  type metadata accessor for Ad();
}

uint64_t sub_1BA2AD810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_dynamicCast();
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 24))(*(_QWORD *)(v6 - 128), *(_QWORD *)(v6 - 144), v2, v1, v5, v4, v0, v3);
  return swift_release();
}

double sub_1BA2AD880@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1BA229E28(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BA2A22D4();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1BA21D3D4((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_1BA2ADB74(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

double sub_1BA2AD978@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  double result;
  uint64_t v16;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1BA229E28(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v16 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BA2A2654();
      v11 = v16;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56) + 72 * v8;
    v13 = *(_OWORD *)(v12 + 48);
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v12 + 32);
    *(_OWORD *)(a3 + 48) = v13;
    *(_QWORD *)(a3 + 64) = *(_QWORD *)(v12 + 64);
    v14 = *(_OWORD *)(v12 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v12;
    *(_OWORD *)(a3 + 16) = v14;
    sub_1BA2ADD5C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 64) = 0;
    result = 0.0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

double sub_1BA2ADA84@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1BA229E28(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BA2A2A00();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1BA22E0C4((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1BA2ADF3C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_1BA2ADB74(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1BA2C248C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1BA2C2720();
        swift_bridgeObjectRetain();
        sub_1BA2C21A4();
        v11 = sub_1BA2C2738();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1BA2ADD5C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  const void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1BA2C248C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1BA2C2720();
        swift_bridgeObjectRetain();
        sub_1BA2C21A4();
        v9 = sub_1BA2C2738();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          result = v14 + 72 * v3;
          v15 = (const void *)(v14 + 72 * v6);
          if (v3 != v6 || (v3 = v6, result >= (unint64_t)v15 + 72))
          {
            result = (unint64_t)memmove((void *)result, v15, 0x48uLL);
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1BA2ADF3C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1BA2C248C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1BA2C2720();
        swift_bridgeObjectRetain();
        sub_1BA2C21A4();
        v10 = sub_1BA2C2738();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1BA2AE110()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

unint64_t sub_1BA2AE118()
{
  unint64_t result;

  result = qword_1EF27FEC8;
  if (!qword_1EF27FEC8)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for AdManagerError, &type metadata for AdManagerError);
    atomic_store(result, (unint64_t *)&qword_1EF27FEC8);
  }
  return result;
}

uint64_t dispatch thunk of AdRequestType.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t *sub_1BA2AE164(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v29;

  v5 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = v7 & 0xF8 | 7;
  v9 = *(_QWORD *)(v6 + 64) + 7;
  v10 = *(_QWORD *)(v4 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8 + v11;
  v13 = *(_QWORD *)(v10 + 64) + 7;
  v14 = ((v13 + ((v12 + (((v7 & 0xF8) + 23) & ~v8)) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 16;
  v15 = (*(_DWORD *)(v10 + 80) | v7) & 0x100000;
  if ((v11 | v8) != 7 || v15 != 0 || v14 > 0x18)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + (((v11 | v8) + 16) & ~(v11 | v8)));
    swift_retain();
  }
  else
  {
    v29 = ~v11;
    v19 = a2[1];
    *a1 = *a2;
    a1[1] = v19;
    v20 = ((unint64_t)a1 + v8 + 16) & ~v8;
    v21 = ((unint64_t)a2 + v8 + 16) & ~v8;
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v22(v20, v21, v5);
    *(_QWORD *)((v9 + v20) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v9 + v21) & 0xFFFFFFFFFFFFF8);
    v23 = (v20 + v12) & v29;
    v24 = (v21 + v12) & v29;
    v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    swift_bridgeObjectRetain();
    v25(v23, v24, v4);
    v26 = (_QWORD *)((v13 + v23) & 0xFFFFFFFFFFFFFFF8);
    v27 = (_QWORD *)((v13 + v24) & 0xFFFFFFFFFFFFFFF8);
    *v26 = *v27;
    v26[1] = v27[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *sub_1BA2AE2E8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8;
  v8 = v7 + 23;
  v9 = (unint64_t)a1 + v7 + 23;
  v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  v11 = v9 & v10;
  v12 = ((unint64_t)a2 + v8) & v10;
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(v9 & v10, v12);
  v13 = *(_QWORD *)(v6 + 64) + 7;
  *(_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + v15 + 8;
  v17 = (v16 + v11) & ~v15;
  v18 = (v16 + v12) & ~v15;
  (*(void (**)(unint64_t, unint64_t))(v14 + 24))(v17, v18);
  v19 = *(_QWORD *)(v14 + 64) + 7;
  v20 = (_QWORD *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  v21 = (_QWORD *)((v19 + v18) & 0xFFFFFFFFFFFFFFF8);
  *v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1BA2AE41C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  *a1 = *a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  v7 = v6 + 23;
  v8 = (unint64_t)a1 + v6 + 23;
  v9 = ~v6 & 0xFFFFFFFFFFFFFFF8;
  v10 = v8 & v9;
  v11 = ((unint64_t)a2 + v7) & v9;
  (*(void (**)(unint64_t, unint64_t))(v5 + 32))(v8 & v9, v11);
  v12 = *(_QWORD *)(v5 + 64) + 7;
  *(_QWORD *)((v12 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v12 + v11) & 0xFFFFFFFFFFFFF8);
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + v14 + 8;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(unint64_t, unint64_t))(v13 + 32))(v16, v17);
  *(_OWORD *)((*(_QWORD *)(v13 + 64) + 7 + v16) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v13 + 64) + 7 + v17) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_1BA2AE50C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  v9 = v8 + 23;
  v10 = (unint64_t)a1 + v8 + 23;
  v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  v12 = v10 & v11;
  v13 = ((unint64_t)a2 + v9) & v11;
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(v10 & v11, v13);
  v14 = *(_QWORD *)(v7 + 64) + 7;
  *(_QWORD *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v14 + v13) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  v15 = v14 & 0xFFFFFFFFFFFFFFF8;
  v16 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = v15 + v17 + 8;
  v19 = (v18 + v12) & ~v17;
  v20 = (v18 + v13) & ~v17;
  (*(void (**)(uint64_t, uint64_t))(v16 + 40))(v19, v20);
  v21 = *(_QWORD *)(v16 + 64) + 7;
  v22 = (_QWORD *)((v21 + v19) & 0xFFFFFFFFFFFFFFF8);
  v23 = (_QWORD *)((v21 + v20) & 0xFFFFFFFFFFFFFFF8);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t dispatch thunk of AdManagerType.enabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AdManagerType.createRequest<A, B, C>(for:context:placement:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a11 + 16))(a1, a2, a3);
}

uint64_t dispatch thunk of AdManagerType.adProvider<A, B, C>(for:request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 24))(a1, a2);
}

uint64_t dispatch thunk of AdManagerType.adProvider<A, B, C>(for:context:placement:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a11 + 32))(a1, a2, a3);
}

uint64_t dispatch thunk of AdManagerType.register<A, B, C, D>(factory:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(void))(a11 + 40))();
}

uint64_t method lookup function for AdManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AdManager.__allocating_init(previewQueue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1BA2AE6DC(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;

  sub_1BA24A1EC(0, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BA2AE718()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 48) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 48) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 48) - 8) + 80)));
  return swift_deallocObject();
}

void sub_1BA2AE770(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2[6];
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  sub_1BA2AD754(a1, a2, (uint64_t)v2 + ((v4 + 80) & ~v4), v2[2], v2[3], v2[4], v2[5], v3, v2[7], v2[8]);
}

_OWORD *sub_1BA2AE7BC(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t dispatch thunk of AdContextType.init(provider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_1BA2AE7EC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;

  sub_1BA26C864();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v32 - v16;
  v18 = *a3;
  if (a2)
  {
    objc_msgSend(a2, sel_time);
    *(_QWORD *)a6 = v19;
    *(_BYTE *)(a6 + 8) = 0;
    objc_msgSend(a2, sel_duration);
  }
  else
  {
    *(_QWORD *)a6 = 0;
    *(_BYTE *)(a6 + 8) = 1;
    v20 = 0;
  }
  *(_QWORD *)(a6 + 16) = v20;
  v21 = (_QWORD *)(a1 + *(int *)(type metadata accessor for PrerollAd() + 24));
  v22 = v21[1];
  *(_QWORD *)(a6 + 24) = *v21;
  *(_QWORD *)(a6 + 32) = v22;
  v23 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a6 + 40) = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a6 + 48) = v23;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = objc_msgSend(a2, sel_videoURL);
    if (v24)
    {
      v25 = v24;
      sub_1BA2C13C4();

      swift_unknownObjectRelease();
      sub_1BA2AF5B8(a1);
      v26 = sub_1BA2C13D0();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v15, 0, 1, v26);
    }
    else
    {
      swift_unknownObjectRelease();
      sub_1BA2AF5B8(a1);
      v28 = sub_1BA2C13D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v15, 1, 1, v28);
    }
    sub_1BA2AF5F4((uint64_t)v15, (uint64_t)v17);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BA2AF5B8(a1);
    v27 = sub_1BA2C13D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v17, 1, 1, v27);
  }
  v29 = (int *)type metadata accessor for VideoAdPlaybackState();
  result = sub_1BA2AF5F4((uint64_t)v17, a6 + v29[8]);
  v31 = a6 + v29[9];
  *(_QWORD *)v31 = a4;
  *(_BYTE *)(v31 + 8) = a5 & 1;
  *(_BYTE *)(a6 + v29[10]) = v18;
  return result;
}

BOOL static VideoAdPlaybackState.LoadState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t VideoAdPlaybackState.LoadState.hash(into:)()
{
  return sub_1BA2C272C();
}

uint64_t VideoAdPlaybackState.LoadState.hashValue.getter()
{
  sub_1BA2C2720();
  sub_1BA2C272C();
  return sub_1BA2C2738();
}

uint64_t VideoAdPlaybackState.position.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

double VideoAdPlaybackState.duration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t VideoAdPlaybackState.placementIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VideoAdPlaybackState.contentIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VideoAdPlaybackState.videoURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for VideoAdPlaybackState() + 32);
  return sub_1BA2AEB70(v3, a1);
}

uint64_t type metadata accessor for VideoAdPlaybackState()
{
  uint64_t result;

  result = qword_1EF27FF30;
  if (!qword_1EF27FF30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BA2AEB70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA26C864();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t VideoAdPlaybackState.loadTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for VideoAdPlaybackState() + 36));
}

uint64_t VideoAdPlaybackState.loadState.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for VideoAdPlaybackState();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 40));
  return result;
}

unint64_t sub_1BA2AEC10()
{
  unint64_t result;

  result = qword_1EF27FED0;
  if (!qword_1EF27FED0)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for VideoAdPlaybackState.LoadState, &type metadata for VideoAdPlaybackState.LoadState);
    atomic_store(result, (unint64_t *)&qword_1EF27FED0);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for VideoAdPlaybackState(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    v8 = a3[8];
    v9 = (void *)(a1 + v8);
    v10 = (char *)a2 + v8;
    *(_QWORD *)(a1 + 48) = a2[6];
    v11 = sub_1BA2C13D0();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_1BA26C864();
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[9];
    v17 = a3[10];
    v18 = (char *)v4 + v16;
    v19 = (uint64_t)a2 + v16;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = *(_BYTE *)(v19 + 8);
    *((_BYTE *)v4 + v17) = *((_BYTE *)a2 + v17);
  }
  return v4;
}

uint64_t destroy for VideoAdPlaybackState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_1BA2C13D0();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for VideoAdPlaybackState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = a3[8];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v10 = sub_1BA2C13D0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    sub_1BA26C864();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[9];
  v15 = a3[10];
  v16 = a1 + v14;
  v17 = a2 + v14;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  return a1;
}

uint64_t assignWithCopy for VideoAdPlaybackState(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;

  v6 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a3[8];
  v8 = (void *)(a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = sub_1BA2C13D0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1BA26C864();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[9];
  v17 = a1 + v16;
  v18 = (uint64_t *)((char *)a2 + v16);
  v19 = *v18;
  *(_BYTE *)(v17 + 8) = *((_BYTE *)v18 + 8);
  *(_QWORD *)v17 = v19;
  *(_BYTE *)(a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  return a1;
}

uint64_t initializeWithTake for VideoAdPlaybackState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v6 = a3[8];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_1BA2C13D0();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_1BA26C864();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[9];
  v13 = a3[10];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for VideoAdPlaybackState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  v8 = a3[8];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_1BA2C13D0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    sub_1BA26C864();
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = a3[9];
  v18 = a3[10];
  v19 = a1 + v17;
  v20 = a2 + v17;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoAdPlaybackState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2AF358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    sub_1BA26C864();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for VideoAdPlaybackState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA2AF3E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 32) = (a2 - 1);
  }
  else
  {
    sub_1BA26C864();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

void sub_1BA2AF454()
{
  unint64_t v0;

  sub_1BA26C864();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t storeEnumTagSinglePayload for VideoAdPlaybackState.LoadState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1BA2AF538 + 4 * byte_1BA2CB6E5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1BA2AF56C + 4 * asc_1BA2CB6E0[v4]))();
}

uint64_t sub_1BA2AF56C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2AF574(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA2AF57CLL);
  return result;
}

uint64_t sub_1BA2AF588(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA2AF590);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1BA2AF594(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2AF59C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VideoAdPlaybackState.LoadState()
{
  return &type metadata for VideoAdPlaybackState.LoadState;
}

uint64_t sub_1BA2AF5B8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PrerollAd();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BA2AF5F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA26C864();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1BA2AF644(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1BA2C1E20();
  return sub_1BA265EE0;
}

uint64_t (*sub_1BA2AF690(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1BA2C1E50();
  return sub_1BA265EE0;
}

uint64_t dispatch thunk of MetricsViewType.privacyMarkerView.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MetricsViewType.readyDelegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MetricsViewType.readyDelegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of MetricsViewType.readyDelegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of MetricsViewType.interactionPresentationDelegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of MetricsViewType.interactionPresentationDelegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of MetricsViewType.interactionPresentationDelegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_1BA2AF70C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InterstitialAdViewLayoutAttributesFactory()
{
  return objc_opt_self();
}

uint64_t AdPolicyEnvironments.layout.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

__n128 AdPolicyEnvironments.viewport.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 48) = v3;
  v4 = *(_OWORD *)(v1 + 88);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 72);
  *(_OWORD *)(a1 + 80) = v4;
  result = *(__n128 *)(v1 + 104);
  *(__n128 *)(a1 + 96) = result;
  return result;
}

void __swiftcall AdPolicyEnvironments.init(layout:viewport:)(NewsAds::AdPolicyEnvironments *__return_ptr retstr, NewsAds::AdPolicyLayoutEnvironment layout, NewsAds::AdPolicyViewportEnvironment *viewport)
{
  CGPoint contentOffset;
  CGSize size;
  __int128 v5;

  contentOffset = viewport->contentOffset;
  retstr->viewport.viewportSize = viewport->viewportSize;
  retstr->viewport.contentOffset = contentOffset;
  size = viewport->bounds.size;
  retstr->viewport.bounds.origin = viewport->bounds.origin;
  retstr->viewport.bounds.size = size;
  v5 = *(_OWORD *)&viewport->adjustedContentInset.top;
  retstr->viewport.contentSize = viewport->contentSize;
  retstr->layout.content._rawValue = *(void **)layout.content._rawValue;
  *(_OWORD *)&retstr->viewport.adjustedContentInset.top = v5;
  *(_OWORD *)&retstr->viewport.adjustedContentInset.bottom = *(_OWORD *)&viewport->adjustedContentInset.bottom;
}

uint64_t destroy for AdPolicyEnvironments()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AdPolicyEnvironments(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AdPolicyEnvironments(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for AdPolicyEnvironments(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdPolicyEnvironments(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdPolicyEnvironments(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AdPolicyEnvironments()
{
  return &type metadata for AdPolicyEnvironments;
}

uint64_t sub_1BA2AFA38()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v3[2];

  if (*(_QWORD *)(v0 + 56))
  {
    v1 = *(_QWORD *)(v0 + 56);
  }
  else
  {
    sub_1BA22068C(v0 + 16, (uint64_t)v3);
    type metadata accessor for DebugNativeAdProvider();
    v1 = swift_allocObject();
    if (qword_1ED5B34F8 != -1)
      swift_once();
    sub_1BA2B0604(0, (unint64_t *)&qword_1ED5B35B8);
    swift_allocObject();
    swift_retain();
    *(_QWORD *)(v1 + 16) = sub_1BA2C158C();
    sub_1BA2B0604(0, &qword_1EF280028);
    swift_allocObject();
    swift_retain();
    *(_QWORD *)(v1 + 24) = sub_1BA2C158C();
    sub_1BA21D3D4(v3, v1 + 32);
    *(_QWORD *)(v0 + 56) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t NativeAdProvider.fetchNativeAdInfo(request:journal:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1BA24A9F0();
  if (qword_1ED5B34F8 != -1)
    swift_once();
  if ((sub_1BA2C152C() & 1) != 0)
  {
    sub_1BA2AFA38();
    v4 = sub_1BA24A34C(a1, a2);
  }
  else
  {
    swift_allocObject();
    v5 = swift_weakInit();
    MEMORY[0x1E0C80A78](v5);
    sub_1BA22053C(0, &qword_1ED5B14A0, type metadata accessor for NativeAdInfo, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DB4D08]);
    swift_allocObject();
    v4 = sub_1BA2C1988();
  }
  swift_release();
  return v4;
}

uint64_t sub_1BA2AFD04()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1BA2AFD28(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *Strong;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  void (*v30)(_QWORD);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v42 = a1;
  v43 = a6;
  v14 = sub_1BA24A9F0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x1E0C80A78](v14);
  swift_beginAccess();
  Strong = (_QWORD *)swift_weakLoadStrong();
  if (Strong)
  {
    v39 = a9;
    v40 = a3;
    v41 = a8;
    v18 = a2;
    v20 = Strong[5];
    v19 = Strong[6];
    __swift_project_boxed_opaque_existential_1(Strong + 2, v20);
    v21 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v20, v19);
    v22 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v22, sel_bounds);
    v24 = v23;
    v26 = v25;

    v27 = swift_allocObject();
    swift_weakInit();
    sub_1BA2B064C(a9, (uint64_t)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    v28 = (*(unsigned __int8 *)(v15 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v29 = (_QWORD *)swift_allocObject();
    v30 = v40;
    v29[2] = v27;
    v29[3] = v30;
    v31 = v43;
    v29[4] = a4;
    v29[5] = v31;
    v32 = v42;
    v29[6] = a7;
    v29[7] = v32;
    v33 = (uint64_t)v29 + v28;
    v34 = v41;
    v29[8] = v18;
    v29[9] = v34;
    sub_1BA2B08B0((uint64_t)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v33);
    aBlock[4] = sub_1BA2B08F4;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BA25237C;
    aBlock[3] = &block_descriptor_9;
    v35 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_nativePromotedContentWithSize_contentFetched_, v35, v24, v26);
    _Block_release(v35);
    swift_release();

  }
  else
  {
    v36 = sub_1BA2C173C();
    sub_1BA23A428();
    v37 = (void *)swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x1E0DB3590], v36);
    a3(v37);

  }
}

void sub_1BA2AFFD8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t *v4;

  sub_1BA2AFD28(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5], v4[6]);
}

void sub_1BA2B0004(void *a1, uint64_t a2, void (*a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(_QWORD *), uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t Strong;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(_QWORD *);
  uint64_t v94;
  __int128 v95;
  ValueMetadata *v96;
  _UNKNOWN **v97;

  v94 = a5;
  v15 = type metadata accessor for NativeAdInfo(0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (uint64_t *)((char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v19 = (_QWORD *)Strong;
    v90 = a9;
    v20 = sub_1BA2C19F4();
    v92 = a8;
    v93 = a7;
    v91 = v15;
    if (v20)
    {
      v21 = (void *)v20;
      v89 = a10;
      if (qword_1ED5B2DB0 != -1)
        swift_once();
      v22 = (void *)qword_1ED5B2888;
      sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1BA2C37C0;
      v24 = v22;
      v25 = sub_1BA2C1A00();
      v27 = v26;
      v28 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v23 + 56) = MEMORY[0x1E0DEA968];
      v29 = sub_1BA2291C8();
      *(_QWORD *)(v23 + 32) = v25;
      *(_QWORD *)(v23 + 40) = v27;
      *(_QWORD *)(v23 + 96) = v28;
      *(_QWORD *)(v23 + 104) = v29;
      v30 = v94;
      *(_QWORD *)(v23 + 64) = v29;
      *(_QWORD *)(v23 + 72) = v30;
      *(_QWORD *)(v23 + 80) = a6;
      swift_bridgeObjectRetain();
      sub_1BA2C239C();
      sub_1BA2C1EB0();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v31 = sub_1BA2C1AF0();
      v87 = v32;
      v88 = v31;
      v33 = sub_1BA2C1AE4();
      v85 = v34;
      v86 = v33;
      v35 = sub_1BA2C1ACC();
      v83 = v36;
      v84 = v35;
      v82 = sub_1BA2C1AD8();
      v81 = v37;
      v38 = v21;
      v39 = sub_1BA2C19D0();
      v41 = v40;

      v96 = &type metadata for NativeAdContentInfo;
      v97 = &protocol witness table for NativeAdContentInfo;
      v42 = (_QWORD *)swift_allocObject();
      *(_QWORD *)&v95 = v42;
      v43 = a1;
      v44 = sub_1BA2C1A00();
      v46 = v45;
      v47 = sub_1BA2C1A24();
      v42[2] = v44;
      v42[3] = v46;
      v42[4] = v47;
      v42[5] = v43;
      v48 = v19[5];
      v49 = v19[6];
      __swift_project_boxed_opaque_existential_1(v19 + 2, v48);
      v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8))(v48, v49);
      v51 = (int *)type metadata accessor for NativeAdInfo.Fulfilled(0);
      sub_1BA2B064C(v89, (uint64_t)v17 + v51[11]);
      *v17 = v94;
      v17[1] = a6;
      v52 = v85;
      v17[2] = v86;
      v17[3] = v52;
      v53 = v83;
      v17[6] = v84;
      v17[7] = v53;
      v54 = v81;
      v17[8] = v82;
      v17[9] = v54;
      v17[10] = v39;
      v17[11] = v41;
      v55 = (uint64_t)v17 + v51[12];
      v56 = v87;
      v17[4] = v88;
      v17[5] = v56;
      sub_1BA21D3D4(&v95, v55);
      *(_QWORD *)((char *)v17 + v51[13]) = v50;
      v17[12] = v90;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      v93(v17);

    }
    else
    {
      if (qword_1ED5B2DB0 != -1)
        swift_once();
      v60 = (void *)qword_1ED5B2888;
      sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v61 = swift_allocObject();
      *(_OWORD *)(v61 + 16) = xmmword_1BA2C3840;
      v62 = v60;
      v63 = sub_1BA2C1A00();
      v65 = v64;
      v66 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v61 + 56) = MEMORY[0x1E0DEA968];
      v67 = sub_1BA2291C8();
      *(_QWORD *)(v61 + 64) = v67;
      *(_QWORD *)(v61 + 32) = v63;
      *(_QWORD *)(v61 + 40) = v65;
      objc_msgSend(a1, sel_unfilledReason);
      v68 = sub_1BA2C1A90();
      *(_QWORD *)(v61 + 96) = v66;
      *(_QWORD *)(v61 + 104) = v67;
      *(_QWORD *)(v61 + 72) = v68;
      *(_QWORD *)(v61 + 80) = v69;
      *(_QWORD *)(v61 + 136) = v66;
      *(_QWORD *)(v61 + 144) = v67;
      v70 = v94;
      *(_QWORD *)(v61 + 112) = v94;
      *(_QWORD *)(v61 + 120) = a6;
      swift_bridgeObjectRetain();
      sub_1BA2C239C();
      sub_1BA2C1EB0();

      swift_bridgeObjectRelease();
      v96 = &type metadata for NativeAdContentInfo;
      v97 = &protocol witness table for NativeAdContentInfo;
      v71 = (_QWORD *)swift_allocObject();
      *(_QWORD *)&v95 = v71;
      swift_bridgeObjectRetain();
      v72 = a1;
      v73 = sub_1BA2C1A00();
      v75 = v74;
      v76 = sub_1BA2C1A24();
      v71[2] = v73;
      v71[3] = v75;
      v71[4] = v76;
      v71[5] = v72;
      v77 = v19[5];
      v78 = v19[6];
      __swift_project_boxed_opaque_existential_1(v19 + 2, v77);
      v79 = (*(uint64_t (**)(uint64_t, uint64_t))(v78 + 8))(v77, v78);
      *v17 = v70;
      v17[1] = a6;
      v17[2] = v73;
      v17[3] = v75;
      sub_1BA22068C((uint64_t)&v95, (uint64_t)(v17 + 5));
      v17[10] = v79;
      v17[4] = v90;
      swift_retain();
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v95);
      swift_storeEnumTagMultiPayload();
      v93(v17);
    }
    swift_release();
    sub_1BA24AADC((uint64_t)v17);
  }
  else
  {
    v57 = sub_1BA2C173C();
    sub_1BA23A428();
    v58 = (void *)swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v57 - 8) + 104))(v59, *MEMORY[0x1E0DB3590], v57);
    a3(v58);

  }
}

uint64_t NativeAdProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t NativeAdProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA2B05D0(uint64_t a1, uint64_t a2)
{
  return NativeAdProvider.fetchNativeAdInfo(request:journal:)(a1, a2);
}

uint64_t dispatch thunk of NativeAdProviderType.fetchNativeAdInfo(request:journal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for NativeAdProvider()
{
  return swift_lookUpClassMethod();
}

void sub_1BA2B0604(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BA2C1580();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_1BA2B064C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA24A9F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BA2B0690()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  char *v4;
  char *v5;
  uint64_t v6;

  v1 = sub_1BA24A9F0();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = (_QWORD *)(v0 + v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + v2 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3[26])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v3[35])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3[49])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v3[59])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v4 = (char *)v3 + *(int *)(v1 + 56);
  swift_bridgeObjectRelease();
  v5 = &v4[*(int *)(type metadata accessor for NativeAdPlacement() + 20)];
  v6 = sub_1BA2C1AC0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA2B08B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BA24A9F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BA2B08F4(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_1BA24A9F0() - 8) + 80);
  sub_1BA2B0004(a1, *(_QWORD *)(v1 + 16), *(void (**)(void *))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(void (**)(_QWORD *))(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), v1 + ((v3 + 80) & ~v3));
}

uint64_t sub_1BA2B0950()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t PreviewInterstitialAdContext.init(provider:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;

  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for AppAdData, v5, (uint64_t)&type metadata for AppAdData, v6);
  if (!v2)
  {
    v7 = a1[3];
    v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for UserAdData, v7, (uint64_t)&type metadata for UserAdData, v8);
    *(_BYTE *)a2 = v11;
    *(_QWORD *)(a2 + 8) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1BA2B0A58()
{
  _BYTE *v0;

  if (*v0)
    return 0x6174614472657375;
  else
    return 0x61746144707061;
}

uint64_t sub_1BA2B0A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA2B1298(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA2B0AB8()
{
  sub_1BA2B0C60();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2B0AE0()
{
  sub_1BA2B0C60();
  return sub_1BA2C2768();
}

uint64_t PreviewInterstitialAdContext.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  _QWORD v11[2];
  char v12;
  char v13;
  char v14;

  sub_1BA2B0E2C(0, &qword_1EF280030, MEMORY[0x1E0DED170]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v11 - v7;
  v9 = *v1;
  v11[0] = *((_QWORD *)v1 + 1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B0C60();
  sub_1BA2C2750();
  v14 = v9;
  v13 = 0;
  sub_1BA234CD4();
  sub_1BA2C2684();
  if (!v2)
  {
    v11[1] = v11[0];
    v12 = 1;
    sub_1BA236AC4();
    sub_1BA2C2684();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1BA2B0C60()
{
  unint64_t result;

  result = qword_1EF280038;
  if (!qword_1EF280038)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBAE0, &type metadata for PreviewInterstitialAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280038);
  }
  return result;
}

uint64_t PreviewInterstitialAdContext.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v12;
  _QWORD v13[2];
  char v14;
  char v15;
  char v16;

  sub_1BA2B0E2C(0, &qword_1EF280040, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B0C60();
  sub_1BA2C2744();
  if (!v2)
  {
    v15 = 0;
    sub_1BA234C90();
    sub_1BA2C2630();
    v10 = v16;
    v14 = 1;
    sub_1BA236A80();
    sub_1BA2C2630();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v12 = v13[1];
    *(_BYTE *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BA2B0E2C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2B0C60();
    v7 = a3(a1, &type metadata for PreviewInterstitialAdContext.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BA2B0E88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewInterstitialAdContext.init(provider:)(a1, a2);
}

uint64_t sub_1BA2B0E9C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewInterstitialAdContext.init(from:)(a1, a2);
}

uint64_t sub_1BA2B0EB0(_QWORD *a1)
{
  return PreviewInterstitialAdContext.encode(to:)(a1);
}

id PreviewInterstitialAdContext.newsSupplementalContext.getter()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone((Class)sub_1BA2C1DC0()), sel_init);
  sub_1BA2C1DB4();
  sub_1BA2C1C94();
  swift_bridgeObjectRetain_n();
  sub_1BA2C1D00();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PreviewInterstitialAdContext.currentPromotableContentDepiction.getter()
{
  return sub_1BA2B0F80(0);
}

uint64_t PreviewInterstitialAdContext.nextPromotableContentDepiction.getter()
{
  return sub_1BA2B0F80(151);
}

uint64_t sub_1BA2B0F80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 8);
  sub_1BA2C19E8();
  v5 = v3;
  swift_bridgeObjectRetain();
  return sub_1BA26D650(a1, &v5, 103);
}

uint64_t sub_1BA2B0FDC(uint64_t a1, uint64_t a2)
{
  return sub_1BA2B0FEC(a1, a2, 0);
}

uint64_t sub_1BA2B0FE4(uint64_t a1, uint64_t a2)
{
  return sub_1BA2B0FEC(a1, a2, 151);
}

uint64_t sub_1BA2B0FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;

  v5 = *(_QWORD *)(v3 + 8);
  sub_1BA2C19E8();
  v7 = v5;
  swift_bridgeObjectRetain();
  return sub_1BA26D650(a3, &v7, 103);
}

uint64_t initializeBufferWithCopyOfBuffer for PreviewInterstitialAdContext(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewInterstitialAdContext(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewInterstitialAdContext(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t storeEnumTagSinglePayload for PreviewInterstitialAdContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1BA2B1140 + 4 * byte_1BA2CB965[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA2B1174 + 4 * byte_1BA2CB960[v4]))();
}

uint64_t sub_1BA2B1174(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2B117C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA2B1184);
  return result;
}

uint64_t sub_1BA2B1190(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA2B1198);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA2B119C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2B11A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewInterstitialAdContext.CodingKeys()
{
  return &type metadata for PreviewInterstitialAdContext.CodingKeys;
}

unint64_t sub_1BA2B11C4()
{
  unint64_t result;

  result = qword_1EF280048;
  if (!qword_1EF280048)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBAB8, &type metadata for PreviewInterstitialAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280048);
  }
  return result;
}

unint64_t sub_1BA2B120C()
{
  unint64_t result;

  result = qword_1EF280050;
  if (!qword_1EF280050)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBA28, &type metadata for PreviewInterstitialAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280050);
  }
  return result;
}

unint64_t sub_1BA2B1254()
{
  unint64_t result;

  result = qword_1EF280058;
  if (!qword_1EF280058)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBA50, &type metadata for PreviewInterstitialAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280058);
  }
  return result;
}

uint64_t sub_1BA2B1298(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x61746144707061 && a2 == 0xE700000000000000;
  if (v2 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6174614472657375 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t type metadata accessor for Localized()
{
  return objc_opt_self();
}

NewsAds::SponsoredBannerAdData __swiftcall SponsoredBannerAdData.init(backingTagIdentifier:adKeywords:)(Swift::String backingTagIdentifier, Swift::OpaquePointer adKeywords)
{
  uint64_t v2;
  NewsAds::SponsoredBannerAdData result;

  *(Swift::String *)v2 = backingTagIdentifier;
  *(Swift::OpaquePointer *)(v2 + 16) = adKeywords;
  result.backingTagIdentifier = backingTagIdentifier;
  result.adKeywords = adKeywords;
  return result;
}

uint64_t sub_1BA2B13B8()
{
  _BYTE *v0;

  if (*v0)
    return 0x726F7779654B6461;
  else
    return 0xD000000000000014;
}

uint64_t sub_1BA2B13FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA2B1BA0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA2B1420()
{
  sub_1BA2B15DC();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2B1448()
{
  sub_1BA2B15DC();
  return sub_1BA2C2768();
}

uint64_t SponsoredBannerAdData.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  char v14;
  char v15;

  sub_1BA2B1804(0, &qword_1EF2800F8, MEMORY[0x1E0DED170]);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v13 - v6;
  v13[0] = *(_QWORD *)(v1 + 16);
  v8 = a1[3];
  v9 = a1;
  v11 = v10;
  __swift_project_boxed_opaque_existential_1(v9, v8);
  sub_1BA2B15DC();
  sub_1BA2C2750();
  v15 = 0;
  sub_1BA2C2654();
  if (!v2)
  {
    v13[1] = v13[0];
    v14 = 1;
    sub_1BA234914();
    sub_1BA2407DC(&qword_1EF27E9C0, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEAF10]);
    sub_1BA2C2684();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v11);
}

unint64_t sub_1BA2B15DC()
{
  unint64_t result;

  result = qword_1EF280100;
  if (!qword_1EF280100)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBD3C, &type metadata for SponsoredBannerAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280100);
  }
  return result;
}

uint64_t SponsoredBannerAdData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  char v16;
  char v17;

  sub_1BA2B1804(0, &qword_1EF280108, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v15 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B15DC();
  sub_1BA2C2744();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = 0;
  v10 = sub_1BA2C2600();
  v12 = v11;
  sub_1BA234914();
  v16 = 1;
  sub_1BA2407DC(&qword_1EF27E9D0, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEAF40]);
  swift_bridgeObjectRetain();
  sub_1BA2C2630();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = v15[1];
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BA2B1804(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2B15DC();
    v7 = a3(a1, &type metadata for SponsoredBannerAdData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BA2B1860@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return SponsoredBannerAdData.init(from:)(a1, a2);
}

uint64_t sub_1BA2B1874(_QWORD *a1)
{
  return SponsoredBannerAdData.encode(to:)(a1);
}

void SponsoredBannerAdData.init(tag:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;

  v4 = objc_msgSend(a1, sel_identifier);
  v5 = sub_1BA2C2150();
  v7 = v6;

  v8 = objc_msgSend(a1, sel_iAdKeywords);
  if (v8)
  {
    v9 = v8;
    v10 = sub_1BA2C227C();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();
    v10 = MEMORY[0x1E0DEE9D8];
  }
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v10;
}

unint64_t sub_1BA2B1938(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA2B1964();
  result = sub_1BA2B19A8();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1BA2B1964()
{
  unint64_t result;

  result = qword_1ED5B1000;
  if (!qword_1ED5B1000)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for SponsoredBannerAdData, &type metadata for SponsoredBannerAdData);
    atomic_store(result, (unint64_t *)&qword_1ED5B1000);
  }
  return result;
}

unint64_t sub_1BA2B19A8()
{
  unint64_t result;

  result = qword_1ED5B1060;
  if (!qword_1ED5B1060)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for SponsoredBannerAdData, &type metadata for SponsoredBannerAdData);
    atomic_store(result, (unint64_t *)&qword_1ED5B1060);
  }
  return result;
}

ValueMetadata *type metadata accessor for SponsoredBannerAdData()
{
  return &type metadata for SponsoredBannerAdData;
}

uint64_t storeEnumTagSinglePayload for SponsoredBannerAdData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1BA2B1A48 + 4 * byte_1BA2CBBE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA2B1A7C + 4 * asc_1BA2CBBE0[v4]))();
}

uint64_t sub_1BA2B1A7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2B1A84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA2B1A8CLL);
  return result;
}

uint64_t sub_1BA2B1A98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA2B1AA0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA2B1AA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2B1AAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SponsoredBannerAdData.CodingKeys()
{
  return &type metadata for SponsoredBannerAdData.CodingKeys;
}

unint64_t sub_1BA2B1ACC()
{
  unint64_t result;

  result = qword_1EF280110;
  if (!qword_1EF280110)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBD14, &type metadata for SponsoredBannerAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280110);
  }
  return result;
}

unint64_t sub_1BA2B1B14()
{
  unint64_t result;

  result = qword_1EF280118;
  if (!qword_1EF280118)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBC84, &type metadata for SponsoredBannerAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280118);
  }
  return result;
}

unint64_t sub_1BA2B1B5C()
{
  unint64_t result;

  result = qword_1EF280120;
  if (!qword_1EF280120)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CBCAC, &type metadata for SponsoredBannerAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280120);
  }
  return result;
}

uint64_t sub_1BA2B1BA0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000014 && a2 == 0x80000001BA2D28C0 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F7779654B6461 && a2 == 0xEA00000000007364)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t dispatch thunk of AdPolicyViewportEnvironmentProviderType.viewportEnvironment()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for DebugSponsorshipAdContentInfo()
{
  return &type metadata for DebugSponsorshipAdContentInfo;
}

void __swiftcall AdPolicyFailure.init(placement:failureType:recoverable:description:additionalInfo:)(NewsAds::AdPolicyFailure *__return_ptr retstr, NewsAds::AdPolicyPlacement placement, NewsAds::AdPolicyFailureType failureType, Swift::Bool recoverable, Swift::String description, Swift::OpaquePointer additionalInfo)
{
  void *v6;
  NewsAds::AdPolicyFailureType v7;

  v6 = *(void **)(placement.placementIdentifier._countAndFlagsBits + 8);
  v7 = *(_BYTE *)placement.placementIdentifier._object;
  retstr->placement.placementIdentifier._countAndFlagsBits = *(_QWORD *)placement.placementIdentifier._countAndFlagsBits;
  retstr->placement.placementIdentifier._object = v6;
  retstr->placement.position = *(CGPoint *)(placement.placementIdentifier._countAndFlagsBits + 16);
  retstr->failureType = v7;
  retstr->recoverable = failureType;
  retstr->description._countAndFlagsBits = recoverable;
  *(Swift::String *)&retstr->description._object = description;
}

uint64_t AdPolicyFailure.placement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

void AdPolicyFailure.failureType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

uint64_t AdPolicyFailure.recoverable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t AdPolicyFailure.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AdPolicyFailure.additionalInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for AdPolicyFailure()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AdPolicyFailure(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AdPolicyFailure(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AdPolicyFailure(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AdPolicyFailure.Info()
{
  return &type metadata for AdPolicyFailure.Info;
}

uint64_t NativeAdProviderFactory.createAdProvider<A, B>(for:context:)(uint64_t a1, uint64_t a2)
{
  return sub_1BA2B1F80(a2);
}

uint64_t NativeAdProviderFactory.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t NativeAdProviderFactory.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1BA2B1F44@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_1BA2B1F80(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1BA2B1F80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  __int128 v6[2];

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  type metadata accessor for NativeAdProvider();
  sub_1BA22068C(a1, (uint64_t)v6);
  v3 = swift_allocObject();
  sub_1BA21D3D4(v6, v3 + 16);
  v4 = sub_1BA2C1754();
  result = swift_release();
  if (v4)
    return v4;
  __break(1u);
  return result;
}

_UNKNOWN **sub_1BA2B203C()
{
  return &protocol witness table for NativeAdProvider;
}

uint64_t method lookup function for NativeAdProviderFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BA2B2054()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

void sub_1BA2B2078()
{
  type metadata accessor for AdRequest();
}

void sub_1BA2B20CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = sub_1BA2C245C();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&a9 - v18;
  *(_QWORD *)(v15 - 112) = 0x8000000000000018;
  *(_QWORD *)(v15 - 104) = 0;
  *(_QWORD *)(v15 - 96) = 0;
  *(_QWORD *)(v15 - 88) = 0;
  v20 = v14 + *(int *)(a1 + 52);
  *(_QWORD *)(v15 - 120) = *(_QWORD *)(v20 + *(int *)(type metadata accessor for AdContext(0, v10, v13, v21) + 36));
  *(_OWORD *)(v15 - 160) = 0u;
  *(_OWORD *)(v15 - 144) = 0u;
  *(_BYTE *)(v15 - 128) = 1;
  v22 = *(_QWORD *)(a1 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v19, v14, a1);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, a1);
  v23 = *(_QWORD *)(v15 - 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA233490(*(_QWORD *)(v15 - 176), v11, (__int128 *)(v15 - 112), *(_QWORD *)(v15 - 168), v23, (uint64_t *)(v15 - 120), (__int128 *)(v15 - 160), (uint64_t)v19, *(uint64_t **)(v15 - 184), v10, v9, v13, v12);
}

void sub_1BA2B21E8()
{
  sub_1BA2B256C();
}

void sub_1BA2B2218(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v22 = a4;
  v18 = a2;
  v19 = a3;
  v16 = a7;
  v17 = a1;
  v13 = type metadata accessor for AdContext(0, a5, a8, a3);
  v12[3] = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v12[2] = (char *)v12 - v11;
  v20 = a5;
  v21 = a6;
  v23 = a5;
  v24 = a6;
  v14 = a8;
  v15 = a9;
  v25 = a8;
  v26 = a9;
  type metadata accessor for AdRequest();
}

void sub_1BA2B22C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  id v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(uint64_t, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  id v34;
  void (*v35)(char *, uint64_t);
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v13 = sub_1BA2C245C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  *(_QWORD *)(v11 - 264) = (char *)&a9 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&a9 - v17;
  v19 = v9;
  sub_1BA260CB8((char *)v9, (_QWORD *)(v11 - 176));
  v21 = *(_QWORD *)(v11 - 176);
  v20 = *(_QWORD *)(v11 - 168);
  v22 = *(_QWORD *)(v11 - 160);
  v23 = *(_QWORD *)(v11 - 152);
  *(_QWORD *)(v11 - 120) = v21 | 0x4000000000000000;
  *(_QWORD *)(v11 - 112) = v20;
  *(_QWORD *)(v11 - 104) = v22;
  *(_QWORD *)(v11 - 96) = v23;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  *(_QWORD *)(v11 - 256) = v10;
  v24(v18, v10, v13);
  v25 = *(_QWORD *)(a1 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v18, 1, a1) == 1)
  {
    v26 = (id)v21;
    v27 = *(void (**)(char *, uint64_t))(v14 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27(v18, v13);
    v28 = 0;
  }
  else
  {
    v29 = &v18[*(int *)(a1 + 52)];
    v30 = *(_QWORD *)(v11 - 280);
    v31 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 16);
    *(_QWORD *)(v11 - 296) = v24;
    v32 = *(_QWORD *)(v11 - 288);
    v33 = *(_QWORD *)(v11 - 272);
    v31(v32, v29, v33);
    v34 = (id)v21;
    v35 = *(void (**)(char *, uint64_t))(v25 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35(v18, a1);
    v28 = *(_QWORD *)(v32 + *(int *)(v33 + 36));
    v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    swift_bridgeObjectRetain();
    v37 = v32;
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v11 - 296);
    v36(v37, v33);
  }
  *(_QWORD *)(v11 - 128) = v28;
  *(_OWORD *)(v11 - 176) = 0u;
  *(_OWORD *)(v11 - 160) = 0u;
  *(_BYTE *)(v11 - 144) = 1;
  v38 = *(_QWORD *)(v11 - 264);
  v24((char *)v38, *(_QWORD *)(v11 - 256), v13);
  v39 = *(_QWORD *)(v11 - 184);
  swift_bridgeObjectRetain();
  v40 = *(_QWORD *)(v11 - 216);
  swift_bridgeObjectRetain();
  sub_1BA233490(*(_QWORD *)(v11 - 224), v40, (__int128 *)(v11 - 120), *(_QWORD *)(v11 - 208), v39, (uint64_t *)(v11 - 128), (__int128 *)(v11 - 176), v38, *(uint64_t **)(v11 - 232), *(_QWORD *)(v11 - 200), *(_QWORD *)(v11 - 192), *(_QWORD *)(v11 - 248), *(_QWORD *)(v11 - 240));
}

uint64_t sub_1BA2B24D0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BA2B250C()
{
  sub_1BA2B256C();
}

void sub_1BA2B253C()
{
  sub_1BA2B256C();
}

void sub_1BA2B256C()
{
  type metadata accessor for AdRequest();
}

void sub_1BA2B25C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v16 = sub_1BA2C245C();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&a9 - v17;
  *(_OWORD *)(v14 - 240) = *(_OWORD *)v11;
  v19 = *(_QWORD *)(v11 + 16);
  v20 = *(_QWORD *)(v11 + 24);
  v21 = *(_BYTE *)(v11 + 32);
  *(_QWORD *)(v14 - 120) = v9;
  *(_QWORD *)(v14 - 112) = 0;
  *(_QWORD *)(v14 - 104) = 0;
  *(_QWORD *)(v14 - 96) = 0;
  v22 = v13 + *(int *)(a1 + 52);
  *(_QWORD *)(v14 - 128) = *(_QWORD *)(v22 + *(int *)(type metadata accessor for AdContext(0, v10, v12, v23) + 36));
  *(_OWORD *)(v14 - 168) = *(_OWORD *)(v14 - 240);
  *(_QWORD *)(v14 - 152) = v19;
  *(_QWORD *)(v14 - 144) = v20;
  *(_BYTE *)(v14 - 136) = v21;
  v24 = *(_QWORD *)(a1 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v18, v13, a1);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v18, 0, 1, a1);
  v25 = *(_QWORD *)(v14 - 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = *(_QWORD *)(v14 - 208);
  swift_bridgeObjectRetain();
  sub_1BA233490(*(_QWORD *)(v14 - 184), v25, (__int128 *)(v14 - 120), *(_QWORD *)(v14 - 176), v26, (uint64_t *)(v14 - 128), (__int128 *)(v14 - 168), (uint64_t)v18, *(uint64_t **)(v14 - 192), v10, *(_QWORD *)(v14 - 200), v12, *(_QWORD *)(v14 - 216));
}

uint64_t JournalEntry.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalEntry.placementIdentifier.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t JournalEntry.contentIdentifier.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 64));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t JournalEntry.contextBuilderSnapshot.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_QWORD *)(v2 + *(int *)(a1 + 68));
  return swift_bridgeObjectRetain();
}

_QWORD *sub_1BA2B2798(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  unint64_t v47;
  unint64_t v48;
  __int128 v49;
  __int128 v50;
  _QWORD *v51;
  _QWORD *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  void (*v60)(unint64_t, unint64_t, uint64_t);
  unint64_t v61;
  unint64_t v62;
  void (*v63)(unint64_t, unint64_t, uint64_t);
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  unint64_t __n;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;

  v6 = sub_1BA2C1424();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v11 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(a3 + 24);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v14 = v13 & 0xF8;
  v15 = v14 | 7;
  v16 = *(_QWORD *)(v10 - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = v17 | v14 | 7;
  if (*(_DWORD *)(v12 + 84) <= 0x7FFFFFFFu)
    v19 = 0x7FFFFFFF;
  else
    v19 = *(_DWORD *)(v12 + 84);
  v20 = *(_QWORD *)(v12 + 64) + 7;
  v21 = v9 + 7;
  v22 = v18 + 33;
  if ((v18 | v8) == 7
    && ((v13 | *(_DWORD *)(v7 + 80) | *(_DWORD *)(v16 + 80)) & 0x100000) == 0
    && ((*(_QWORD *)(v16 + 64) + 7 + (((v20 & 0xFFFFFFFFFFFFFFF8) + v17 + 8 + ((v14 + 23) & ~v15)) & ~v17)) & 0xFFFFFFFFFFFFFFF8)
     + 16
     + ((v18
       + 33
       + ((((((((((v9 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v18) <= 0x18)
  {
    __n = ((*(_QWORD *)(v16 + 64) + 7 + (((v20 & 0xFFFFFFFFFFFFFFF8) + v17 + 8 + ((v14 + 23) & ~v15)) & ~v17)) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    v73 = (v20 & 0xFFFFFFFFFFFFFFF8) + v17 + 8;
    v67 = *(_QWORD *)(v12 + 64) + 7;
    v68 = *(_QWORD *)(v16 + 64) + 7;
    v74 = v11;
    v75 = v10;
    v27 = ~v8;
    v76 = ~v18;
    v78 = ~v15;
    v79 = v14 + 23;
    v71 = ~v17;
    v69 = *(_DWORD *)(v16 + 84);
    v70 = v19;
    if (v69 <= v19)
      v28 = v19;
    else
      v28 = *(_DWORD *)(v16 + 84);
    v77 = v28;
    v29 = a2[1];
    *a1 = *a2;
    a1[1] = v29;
    v80 = a1;
    v30 = (char *)a1 + v8;
    v31 = (char *)a2 + v8;
    v32 = (unint64_t)(v30 + 16) & v27;
    v33 = (unint64_t)(v31 + 16) & v27;
    v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    swift_bridgeObjectRetain();
    v34(v32, v33, v6);
    v35 = (_QWORD *)((v21 + v32) & 0xFFFFFFFFFFFFFFF8);
    v36 = (_QWORD *)((v21 + v33) & 0xFFFFFFFFFFFFFFF8);
    *v35 = *v36;
    v35[1] = v36[1];
    v37 = (_QWORD *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
    v38 = (unint64_t *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
    v39 = *v38;
    v40 = v38[1];
    v41 = v38[2];
    v42 = v38[3];
    swift_bridgeObjectRetain();
    sub_1BA22C6F4(v39);
    *v37 = v39;
    v37[1] = v40;
    v37[2] = v41;
    v37[3] = v42;
    v43 = (_QWORD *)(((unint64_t)v37 + 39) & 0xFFFFFFFFFFFFFFF8);
    v44 = (_QWORD *)(((unint64_t)v38 + 39) & 0xFFFFFFFFFFFFFFF8);
    *v43 = *v44;
    v43[1] = v44[1];
    v45 = (_QWORD *)(((unint64_t)v43 + 23) & 0xFFFFFFFFFFFFF8);
    v46 = (_QWORD *)(((unint64_t)v44 + 23) & 0xFFFFFFFFFFFFF8);
    *v45 = *v46;
    v47 = ((unint64_t)v45 + 15) & 0xFFFFFFFFFFFFFFF8;
    v48 = ((unint64_t)v46 + 15) & 0xFFFFFFFFFFFFFFF8;
    v49 = *(_OWORD *)v48;
    v50 = *(_OWORD *)(v48 + 16);
    *(_BYTE *)(v47 + 32) = *(_BYTE *)(v48 + 32);
    *(_OWORD *)v47 = v49;
    *(_OWORD *)(v47 + 16) = v50;
    v51 = (_QWORD *)((v22 + v47) & v76);
    v52 = (_QWORD *)((v22 + v48) & v76);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v77 == 0x7FFFFFFF)
    {
      v53 = v52[1];
      if (v53 >= 0xFFFFFFFF)
        LODWORD(v53) = -1;
      v26 = v80;
      v55 = v78;
      v54 = v79;
      if ((_DWORD)v53 != -1)
        goto LABEL_20;
    }
    else
    {
      v55 = v78;
      v54 = v79;
      v56 = ((unint64_t)v52 + v79) & v78;
      if (v70 >= v69)
        v57 = (*(uint64_t (**)(unint64_t))(v12 + 48))(v56);
      else
        v57 = (*(uint64_t (**)(unint64_t))(v16 + 48))((v73 + v56) & v71);
      v26 = v80;
      if (v57)
      {
LABEL_20:
        memcpy(v51, v52, __n);
        return v26;
      }
    }
    *v51 = *v52;
    v51[1] = v52[1];
    v58 = ((unint64_t)v51 + v54) & v55;
    v59 = ((unint64_t)v52 + v54) & v55;
    v60 = *(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16);
    swift_bridgeObjectRetain();
    v60(v58, v59, v74);
    *(_QWORD *)((v67 + v58) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v67 + v59) & 0xFFFFFFFFFFFFF8);
    v61 = (v73 + v58) & v71;
    v62 = (v73 + v59) & v71;
    v63 = *(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 16);
    swift_bridgeObjectRetain();
    v63(v61, v62, v75);
    v64 = (_QWORD *)((v68 + v61) & 0xFFFFFFFFFFFFFFF8);
    v65 = (_QWORD *)((v68 + v62) & 0xFFFFFFFFFFFFFFF8);
    *v64 = *v65;
    v64[1] = v65[1];
    swift_bridgeObjectRetain();
    return v26;
  }
  v25 = *a2;
  *a1 = *a2;
  v26 = (_QWORD *)(v25 + (((v18 | v8) + 16) & ~(v18 | v8)));
  swift_retain();
  return v26;
}

_QWORD *sub_1BA2B2B68(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  unint64_t v45;
  int v46;
  size_t v47;
  void *v48;
  const void *v49;
  unint64_t v50;
  uint64_t (*v51)(unint64_t, uint64_t, uint64_t);
  uint64_t (*v52)(unint64_t, uint64_t, uint64_t);
  unint64_t v53;
  unint64_t v54;
  void (*v55)(unint64_t, unint64_t, uint64_t);
  unint64_t v56;
  unint64_t v57;
  void (*v58)(unint64_t, unint64_t, uint64_t);
  _QWORD *v59;
  _QWORD *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  int v67;
  uint64_t v68;
  int v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = sub_1BA2C1424();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v9, v10, v6);
  v11 = *(_QWORD *)(v7 + 64) + 7;
  v12 = (_QWORD *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = (unint64_t *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  v15 = (unint64_t *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  v16 = *v15;
  v17 = v15[1];
  v18 = v15[2];
  v19 = v15[3];
  sub_1BA22C6F4(*v15);
  v20 = *v14;
  *v14 = v16;
  v14[1] = v17;
  v14[2] = v18;
  v14[3] = v19;
  sub_1BA22C4F0(v20);
  v21 = (_QWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  v22 = (_QWORD *)(((unint64_t)v15 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = (_QWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  v24 = ((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFF8;
  v25 = *(_QWORD *)v24;
  v24 += 15;
  *v23 = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26 = ((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  v27 = *(_OWORD *)(v24 & 0xFFFFFFFFFFFFFFF8);
  v28 = *(_OWORD *)((v24 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(_BYTE *)(v26 + 32) = *(_BYTE *)((v24 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(_OWORD *)v26 = v27;
  *(_OWORD *)(v26 + 16) = v28;
  v73 = *(_QWORD *)(a3 + 16);
  v29 = *(_QWORD *)(v73 - 8);
  v30 = *(unsigned int *)(v29 + 84);
  v31 = *(_DWORD *)(v29 + 80) & 0xF8;
  v32 = v31 | 7;
  v76 = *(_QWORD *)(a3 + 24);
  v33 = *(_QWORD *)(v76 - 8);
  v34 = *(unsigned __int8 *)(v33 + 80);
  v35 = v34 | v31 | 7;
  v36 = (_QWORD *)((v35 + 33 + v26) & ~v35);
  v37 = (_QWORD *)((v35 + 33 + (v24 & 0xFFFFFFFFFFFFFFF8)) & ~v35);
  if (v30 <= 0x7FFFFFFF)
    v38 = 0x7FFFFFFF;
  else
    v38 = *(_DWORD *)(v29 + 84);
  v39 = *(unsigned int *)(v33 + 84);
  if (v39 <= v38)
    v40 = v38;
  else
    v40 = *(_DWORD *)(v33 + 84);
  v41 = ~v32;
  v42 = v31 + 23;
  v72 = *(_QWORD *)(v29 + 64) + 7;
  v74 = (v72 & 0xFFFFFFFFFFFFFFF8) + v34 + 8;
  v75 = ~v34;
  v43 = *(_QWORD *)(v33 + 64) + 7;
  v44 = ((v43 + ((v74 + ((v31 + 23) & ~v32)) & ~v34)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v40 != 0x7FFFFFFF)
  {
    v71 = ((v43 + ((v74 + ((v31 + 23) & ~v32)) & ~v34)) & 0xFFFFFFFFFFFFFFF8) + 16;
    v50 = ((unint64_t)v36 + v42) & v41;
    v70 = ((unint64_t)v37 + v42) & v41;
    if (v38 >= v39)
    {
      v52 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v29 + 48);
      v69 = v52(v50, v30, v73);
      v46 = v52(v70, v30, v73);
      v44 = v71;
      if (v69)
        goto LABEL_17;
    }
    else
    {
      v68 = ~v32;
      v51 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v33 + 48);
      v67 = v51((v74 + v50) & v75, v39, v76);
      v46 = v51((v74 + v70) & v75, v39, v76);
      v41 = v68;
      v44 = v71;
      if (v67)
        goto LABEL_17;
    }
LABEL_11:
    if (!v46)
    {
      *v36 = *v37;
      v36[1] = v37[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v61 = ((unint64_t)v36 + v42) & v41;
      v62 = ((unint64_t)v37 + v42) & v41;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v29 + 24))(v61, v62, v73);
      *(_QWORD *)((v72 + v61) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v72 + v62) & 0xFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v63 = (v74 + v62) & v75;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v33 + 24))((v74 + v61) & v75, v63, v76);
      v64 = (_QWORD *)((v43 + ((v74 + v61) & v75)) & 0xFFFFFFFFFFFFFFF8);
      v65 = (_QWORD *)((v43 + v63) & 0xFFFFFFFFFFFFFFF8);
      *v64 = *v65;
      v64[1] = v65[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    v47 = v44;
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v29 + 8))(((unint64_t)v36 + v42) & v41, v73);
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v33 + 8))((v74 + (((unint64_t)v36 + v42) & v41)) & v75, v76);
    swift_bridgeObjectRelease();
    v48 = v36;
    v49 = v37;
    v44 = v47;
    goto LABEL_19;
  }
  v45 = v37[1];
  if (v45 >= 0xFFFFFFFF)
    LODWORD(v45) = -1;
  v46 = v45 + 1;
  if (v36[1] >= 0xFFFFFFFFuLL)
    goto LABEL_11;
LABEL_17:
  if (!v46)
  {
    *v36 = *v37;
    v36[1] = v37[1];
    v53 = ((unint64_t)v36 + v42) & v41;
    v54 = ((unint64_t)v37 + v42) & v41;
    v55 = *(void (**)(unint64_t, unint64_t, uint64_t))(v29 + 16);
    swift_bridgeObjectRetain();
    v55(v53, v54, v73);
    *(_QWORD *)((v72 + v53) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v72 + v54) & 0xFFFFFFFFFFFFF8);
    v56 = (v74 + v53) & v75;
    v57 = (v74 + v54) & v75;
    v58 = *(void (**)(unint64_t, unint64_t, uint64_t))(v33 + 16);
    swift_bridgeObjectRetain();
    v58(v56, v57, v76);
    v59 = (_QWORD *)((v43 + v56) & 0xFFFFFFFFFFFFFFF8);
    v60 = (_QWORD *)((v43 + v57) & 0xFFFFFFFFFFFFFFF8);
    *v59 = *v60;
    v59[1] = v60[1];
    swift_bridgeObjectRetain();
    return a1;
  }
  v48 = v36;
  v49 = v37;
LABEL_19:
  memcpy(v48, v49, v44);
  return a1;
}

_OWORD *sub_1BA2B3064(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  _OWORD *v17;
  _OWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  _QWORD *v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _OWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _OWORD *v54;

  *a1 = *a2;
  v6 = sub_1BA2C1424();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v54 = a1;
  v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v9, v10, v6);
  v11 = *(_QWORD *)(v7 + 64) + 7;
  v12 = (_OWORD *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_OWORD *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  v14 = (_OWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_OWORD *)(((unint64_t)v15 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v17 = *v18;
  v19 = (_QWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFF8);
  v20 = (_QWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFF8);
  *v20 = *v19;
  v21 = ((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  v22 = ((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8;
  v23 = *(_OWORD *)v22;
  v24 = *(_OWORD *)(v22 + 16);
  *(_BYTE *)(v21 + 32) = *(_BYTE *)(v22 + 32);
  *(_OWORD *)v21 = v23;
  *(_OWORD *)(v21 + 16) = v24;
  v25 = *(_QWORD *)(a3 + 24);
  v26 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  v28 = v27 | 7;
  v29 = *(_QWORD *)(v25 - 8);
  v30 = *(unsigned __int8 *)(v29 + 80);
  v31 = v30 | v27 | 7;
  v32 = (_OWORD *)((v31 + 33 + v21) & ~v31);
  v33 = (_QWORD *)((v31 + 33 + v22) & ~v31);
  if (*(_DWORD *)(v26 + 84) <= 0x7FFFFFFFu)
    v34 = 0x7FFFFFFF;
  else
    v34 = *(_DWORD *)(v26 + 84);
  v35 = *(unsigned int *)(v29 + 84);
  if (v35 <= v34)
    v36 = v34;
  else
    v36 = *(_DWORD *)(v29 + 84);
  v37 = ~v28;
  v38 = v27 + 23;
  v39 = *(_QWORD *)(v26 + 64) + 7;
  v40 = (v39 & 0xFFFFFFFFFFFFFFF8) + v30 + 8;
  v41 = *(_QWORD *)(v29 + 64);
  v52 = *(_QWORD *)(a3 + 16);
  v53 = *(_QWORD *)(a3 + 24);
  v51 = ~v30;
  if (v36 == 0x7FFFFFFF)
  {
    v42 = v33[1];
    if (v42 >= 0xFFFFFFFF)
      LODWORD(v42) = -1;
    v43 = v41 + 7;
    if ((_DWORD)v42 != -1)
      goto LABEL_11;
LABEL_16:
    *v32 = *(_OWORD *)v33;
    v46 = ((unint64_t)v32 + v38) & v37;
    v47 = ((unint64_t)v33 + v38) & v37;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v26 + 32))(v46, v47, v52);
    *(_QWORD *)((v39 + v46) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v39 + v47) & 0xFFFFFFFFFFFFF8);
    v48 = (v40 + v47) & v51;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v29 + 32))((v40 + v46) & v51, v48, v53);
    *(_OWORD *)((v43 + ((v40 + v46) & v51)) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((v43 + v48) & 0xFFFFFFFFFFFFF8);
    return v54;
  }
  v50 = v32;
  v44 = ((unint64_t)v33 + v38) & v37;
  if (v34 >= v35)
    v45 = (*(uint64_t (**)(unint64_t))(v26 + 48))(v44);
  else
    v45 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v29 + 48))((v40 + v44) & ~v30, v35, v25);
  v32 = v50;
  v37 = ~v28;
  v43 = v41 + 7;
  if (!v45)
    goto LABEL_16;
LABEL_11:
  memcpy(v32, v33, ((v43 + ((v40 + (v38 & ~v28)) & ~v30)) & 0xFFFFFFFFFFFFFFF8) + 16);
  return v54;
}

_QWORD *sub_1BA2B32FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  _OWORD *v16;
  unint64_t v17;
  __int128 v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  unsigned int v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  unint64_t v43;
  int v44;
  size_t v45;
  void *v46;
  const void *v47;
  unint64_t v48;
  uint64_t (*v49)(unint64_t, uint64_t, uint64_t);
  uint64_t (*v50)(unint64_t, uint64_t, uint64_t);
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  int v60;
  _QWORD *v61;
  int v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = sub_1BA2C1424();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v10, v11, v7);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (_QWORD *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRelease();
  v15 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  v16 = (_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v17 = *(_QWORD *)v15;
  v18 = v16[1];
  *(_OWORD *)v15 = *v16;
  *(_OWORD *)(v15 + 16) = v18;
  sub_1BA22C4F0(v17);
  v19 = (_QWORD *)((v15 + 39) & 0xFFFFFFFFFFFFFFF8);
  v20 = (_QWORD *)(((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRelease();
  v21 = (_QWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  v22 = ((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFF8;
  v23 = *(_QWORD *)v22;
  v22 += 15;
  *v21 = v23;
  swift_bridgeObjectRelease();
  v24 = ((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = *(_OWORD *)(v22 & 0xFFFFFFFFFFFFFFF8);
  v26 = *(_OWORD *)((v22 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(_BYTE *)(v24 + 32) = *(_BYTE *)((v22 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(_OWORD *)v24 = v25;
  *(_OWORD *)(v24 + 16) = v26;
  v67 = *(_QWORD *)(a3 + 16);
  v27 = *(_QWORD *)(v67 - 8);
  v28 = *(unsigned int *)(v27 + 84);
  v29 = *(_DWORD *)(v27 + 80) & 0xF8;
  v30 = v29 | 7;
  v69 = *(_QWORD *)(a3 + 24);
  v31 = *(_QWORD *)(v69 - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v32 | v29 | 7;
  v34 = (_QWORD *)((v33 + 33 + v24) & ~v33);
  v35 = (_QWORD *)((v33 + 33 + (v22 & 0xFFFFFFFFFFFFFFF8)) & ~v33);
  if (v28 <= 0x7FFFFFFF)
    v36 = 0x7FFFFFFF;
  else
    v36 = *(_DWORD *)(v27 + 84);
  v37 = *(unsigned int *)(v31 + 84);
  if (v37 <= v36)
    v38 = v36;
  else
    v38 = *(_DWORD *)(v31 + 84);
  v39 = ~v30;
  v40 = v29 + 23;
  v65 = *(_QWORD *)(v27 + 64) + 7;
  v68 = ~v32;
  v66 = (v65 & 0xFFFFFFFFFFFFFFF8) + v32 + 8;
  v41 = *(_QWORD *)(v31 + 64) + 7;
  v42 = ((v41 + ((v66 + ((v29 + 23) & ~v30)) & ~v32)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v38 != 0x7FFFFFFF)
  {
    v64 = ((v41 + ((v66 + ((v29 + 23) & ~v30)) & ~v32)) & 0xFFFFFFFFFFFFFFF8) + 16;
    v48 = ((unint64_t)v34 + v40) & v39;
    v63 = ((unint64_t)v35 + v40) & v39;
    if (v36 >= v37)
    {
      v50 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v27 + 48);
      v62 = v50(v48, v28, v67);
      v44 = v50(v63, v28, v67);
      v42 = v64;
      if (v62)
        goto LABEL_17;
    }
    else
    {
      v61 = v35;
      v49 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v31 + 48);
      v60 = v49((v66 + v48) & v68, v37, v69);
      v44 = v49((v66 + v63) & v68, v37, v69);
      v35 = v61;
      v42 = v64;
      if (v60)
        goto LABEL_17;
    }
LABEL_11:
    if (!v44)
    {
      *v34 = *v35;
      v34[1] = v35[1];
      swift_bridgeObjectRelease();
      v54 = ((unint64_t)v34 + v40) & v39;
      v55 = ((unint64_t)v35 + v40) & v39;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 40))(v54, v55, v67);
      *(_QWORD *)((v65 + v54) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v65 + v55) & 0xFFFFFFFFFFFFF8);
      swift_bridgeObjectRelease();
      v56 = (v66 + v55) & v68;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v31 + 40))((v66 + v54) & v68, v56, v69);
      v57 = (_QWORD *)((v41 + ((v66 + v54) & v68)) & 0xFFFFFFFFFFFFFFF8);
      v58 = (_QWORD *)((v41 + v56) & 0xFFFFFFFFFFFFFFF8);
      *v57 = *v58;
      v57[1] = v58[1];
      swift_bridgeObjectRelease();
      return a1;
    }
    v45 = v42;
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v27 + 8))(((unint64_t)v34 + v40) & v39, v67);
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v31 + 8))((v66 + (((unint64_t)v34 + v40) & v39)) & v68, v69);
    swift_bridgeObjectRelease();
    v46 = v34;
    v47 = v35;
    v42 = v45;
    goto LABEL_19;
  }
  v43 = v35[1];
  if (v43 >= 0xFFFFFFFF)
    LODWORD(v43) = -1;
  v44 = v43 + 1;
  if (v34[1] >= 0xFFFFFFFFuLL)
    goto LABEL_11;
LABEL_17:
  if (!v44)
  {
    *(_OWORD *)v34 = *(_OWORD *)v35;
    v51 = ((unint64_t)v34 + v40) & v39;
    v52 = ((unint64_t)v35 + v40) & v39;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 32))(v51, v52, v67);
    *(_QWORD *)((v65 + v51) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v65 + v52) & 0xFFFFFFFFFFFFF8);
    v53 = (v66 + v52) & v68;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v31 + 32))((v66 + v51) & v68, v53, v69);
    *(_OWORD *)((v41 + ((v66 + v51) & v68)) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((v41 + v53) & 0xFFFFFFFFFFFFF8);
    return a1;
  }
  v46 = v34;
  v47 = v35;
LABEL_19:
  memcpy(v46, v47, v42);
  return a1;
}

void ArticlePrerollAdContext.appData.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t ArticlePrerollAdContext.userData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.articleData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_BYTE *)(v1 + 32);
  v4 = *(_BYTE *)(v1 + 33);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 48);
  v7 = *(_QWORD *)(v1 + 56);
  v8 = *(_QWORD *)(v1 + 64);
  v10 = *(_QWORD *)(v1 + 72);
  v9 = *(_QWORD *)(v1 + 80);
  v11 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 17) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.channelData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(v1 + 96);
  v2 = *(_QWORD *)(v1 + 104);
  v4 = *(_BYTE *)(v1 + 112);
  v5 = *(_QWORD *)(v1 + 120);
  v6 = *(_QWORD *)(v1 + 128);
  v7 = *(_QWORD *)(v1 + 136);
  v8 = *(_QWORD *)(v1 + 144);
  v9 = *(_QWORD *)(v1 + 152);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

double ArticlePrerollAdContext.videoData.getter@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 160);
  *a1 = result;
  return result;
}

void ArticlePrerollAdContext.placementData.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 168);
}

uint64_t ArticlePrerollAdContext.issueData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int16 v3;

  v2 = *(_QWORD *)(v1 + 184);
  v3 = *(_WORD *)(v1 + 192);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 176);
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.sectionData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 208);
  *a1 = *(_QWORD *)(v1 + 200);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.feedData.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = v1[27];
  v3 = v1[28];
  v4 = v1[29];
  v5 = v1[30];
  v6 = v1[31];
  v7 = v1[32];
  v8 = v1[33];
  v9 = v1[34];
  v10 = v1[35];
  v11 = v1[36];
  v12 = v1[37];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  a1[9] = v11;
  a1[10] = v12;
  return sub_1BA282048(v2, v3);
}

uint64_t ArticlePrerollAdContext.groupData.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = v1[38];
  v3 = v1[39];
  v4 = v1[40];
  v5 = v1[41];
  v6 = v1[42];
  v7 = v1[43];
  v8 = v1[44];
  v9 = v1[45];
  v10 = v1[46];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  return sub_1BA2820FC(v2, v3);
}

void ArticlePrerollAdContext.referralData.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 376);
}

uint64_t ArticlePrerollAdContext.anfDocumentData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 384);
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.anfComponentData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 392);
  return swift_bridgeObjectRetain();
}

_QWORD *ArticlePrerollAdContext.init(provider:)@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  void *__dst;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD __src[50];
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  _BYTE v100[7];
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  _BYTE v108[7];
  uint64_t v109;
  uint64_t v110;
  __int16 v111;
  int v112;
  __int16 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char v136;
  _BYTE v137[7];
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _BYTE v141[11];
  __int16 v142;
  _BYTE v143[7];
  _BYTE v144[11];
  __int16 v145;
  _DWORD v146[3];

  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for AppAdData, v5, (uint64_t)&type metadata for AppAdData, v6);
  if (v2)
    return (_QWORD *)__swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for UserAdData, v7, (uint64_t)&type metadata for UserAdData, v8);
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  swift_bridgeObjectRetain();
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for ArticleAdData, v9, (uint64_t)&type metadata for ArticleAdData, v10);
  v73 = v85;
  v47 = v85;
  __dst = a2;
  v46 = v85;
  v44 = BYTE1(v87);
  v45 = v87;
  v42 = v93;
  v43 = v88;
  v11 = a1[3];
  v82 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  swift_bridgeObjectRetain();
  v72 = v86;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for ChannelAdData, v11, (uint64_t)&type metadata for ChannelAdData, v82);
  v68 = v90;
  v69 = v94;
  v70 = v91;
  v71 = v89;
  v67 = v92;
  v40 = v85;
  v39 = v87;
  v38 = v88;
  v12 = v91;
  v13 = a1[3];
  v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for VideoAdData, v13, (uint64_t)&type metadata for VideoAdData, v14);
  v65 = v86;
  v66 = v89;
  v37 = v90;
  v83 = v92;
  v15 = v85;
  v16 = a1[3];
  v17 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v16);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for PlacementAdData, v16, (uint64_t)&type metadata for PlacementAdData, v17);
  v18 = a1[3];
  v19 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v18);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for IssueAdData, v18, (uint64_t)&type metadata for IssueAdData, v19);
  v36 = v85;
  v35 = v85;
  v34 = v87;
  v20 = a1[3];
  v21 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v20);
  swift_bridgeObjectRetain();
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for SectionAdData, v20, (uint64_t)&type metadata for SectionAdData, v21);
  v64 = v86;
  v22 = a1[3];
  v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  swift_bridgeObjectRetain();
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for FeedAdData, v22, (uint64_t)&type metadata for FeedAdData, v23);
  v63 = v86;
  v33 = v85;
  v59 = v85;
  v60 = v87;
  v56 = v86;
  v57 = v88;
  v58 = v90;
  v61 = v89;
  v62 = v91;
  v24 = a1[3];
  v77 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v24);
  v55 = v95;
  v80 = v93;
  v81 = v94;
  v79 = v92;
  sub_1BA282048(v85, v86);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for FeedGroupAdData, v24, (uint64_t)&type metadata for FeedGroupAdData, v77);
  v53 = v86;
  v54 = v87;
  v78 = v88;
  v31 = a1[3];
  v48 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v31);
  v50 = v93;
  v51 = v92;
  v52 = v85;
  v74 = v89;
  v75 = v91;
  v76 = v90;
  sub_1BA2820FC(v85, v86);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for ReferralAdData, v31, (uint64_t)&type metadata for ReferralAdData, v48);
  v25 = v85;
  v26 = a1[3];
  v27 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v26);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for ANFDocumentAdData, v26, (uint64_t)&type metadata for ANFDocumentAdData, v27);
  v28 = a1[3];
  v29 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v28);
  v49 = v85;
  swift_bridgeObjectRetain();
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for ANFComponentAdData, v28, (uint64_t)&type metadata for ANFComponentAdData, v29);
  v32 = v140;
  LOBYTE(__src[0]) = v85;
  __src[1] = v85;
  __src[2] = v85;
  __src[3] = v86;
  LOWORD(__src[4]) = v87;
  __src[5] = v88;
  __src[6] = v89;
  __src[7] = v90;
  __src[8] = v91;
  __src[9] = v92;
  __src[10] = v93;
  __src[11] = v94;
  __src[12] = v85;
  __src[13] = v86;
  LOBYTE(__src[14]) = v87;
  __src[15] = v88;
  __src[16] = v89;
  __src[17] = v90;
  __src[18] = v91;
  __src[19] = v92;
  __src[20] = v85;
  LOBYTE(__src[21]) = v85;
  __src[22] = v85;
  __src[23] = v86;
  LOWORD(__src[24]) = v87;
  __src[25] = v85;
  __src[26] = v86;
  __src[27] = v85;
  __src[28] = v86;
  __src[29] = v87;
  __src[30] = v88;
  __src[31] = v89;
  __src[32] = v90;
  __src[33] = v91;
  __src[34] = v92;
  __src[35] = v93;
  __src[36] = v94;
  __src[37] = v95;
  __src[38] = v85;
  __src[39] = v86;
  __src[40] = v87;
  __src[41] = v88;
  __src[42] = v89;
  __src[43] = v90;
  __src[44] = v91;
  __src[45] = v92;
  __src[46] = v93;
  LOBYTE(__src[47]) = v85;
  __src[48] = v85;
  __src[49] = v140;
  sub_1BA2B499C(__src);
  swift_bridgeObjectRelease();
  sub_1BA283218(v52, v53);
  sub_1BA283288(v59, v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(__dst, __src, 0x190uLL);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v85) = v47;
  v86 = v73;
  v87 = v46;
  v88 = v72;
  LOBYTE(v89) = v45;
  BYTE1(v89) = v44;
  v90 = v43;
  v91 = v71;
  v92 = v68;
  v93 = v70;
  v94 = v67;
  v95 = v42;
  v96 = v69;
  v97 = v40;
  v98 = v65;
  v99 = v39;
  v101 = v38;
  v102 = v66;
  v103 = v37;
  v104 = v12;
  v105 = v83;
  *(_DWORD *)((char *)&v85 + 1) = v146[0];
  HIDWORD(v85) = *(_DWORD *)((char *)v146 + 3);
  *(_DWORD *)((char *)&v89 + 2) = *(_DWORD *)&v144[7];
  HIWORD(v89) = v145;
  *(_DWORD *)v100 = *(_DWORD *)v144;
  *(_DWORD *)&v100[3] = *(_DWORD *)&v144[3];
  v106 = v15;
  v107 = v36;
  *(_DWORD *)v108 = *(_DWORD *)v143;
  *(_DWORD *)&v108[3] = *(_DWORD *)&v143[3];
  v109 = v35;
  v110 = v64;
  v111 = v34;
  v113 = v142;
  v112 = *(_DWORD *)&v141[7];
  v114 = v33;
  v115 = v63;
  v116 = v59;
  v117 = v56;
  v118 = v60;
  v119 = v57;
  v120 = v61;
  v121 = v58;
  v122 = v62;
  v123 = v79;
  v124 = v80;
  v125 = v81;
  v126 = v55;
  v127 = v52;
  v128 = v53;
  v129 = v54;
  v130 = v78;
  v131 = v74;
  v132 = v76;
  v133 = v75;
  v134 = v51;
  v135 = v50;
  v136 = v25;
  *(_DWORD *)v137 = *(_DWORD *)v141;
  *(_DWORD *)&v137[3] = *(_DWORD *)&v141[3];
  v138 = v49;
  v139 = v32;
  return sub_1BA2B4B58(&v85);
}

_QWORD *sub_1BA2B499C(_QWORD *a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1[28];
  v4 = a1[27];
  v5 = a1[39];
  v6 = a1[38];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA282048(v4, v3);
  sub_1BA2820FC(v6, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1BA2B4B58(_QWORD *a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1[28];
  v4 = a1[27];
  v5 = a1[39];
  v6 = a1[38];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BA283288(v4, v3);
  sub_1BA283218(v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BA2B4D00(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA2B4D34 + 4 * byte_1BA2CBF70[a1]))(0x61746144707061, 0xE700000000000000);
}

uint64_t sub_1BA2B4D34()
{
  return 0x6174614472657375;
}

uint64_t sub_1BA2B4E04()
{
  return 0x6C61727265666572;
}

uint64_t sub_1BA2B4E24()
{
  return 0x6D75636F44666E61;
}

unint64_t sub_1BA2B4E48()
{
  return 0xD000000000000010;
}

uint64_t sub_1BA2B4E64()
{
  unsigned __int8 *v0;

  return sub_1BA2B4D00(*v0);
}

uint64_t sub_1BA2B4E6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA2B7E60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA2B4E90()
{
  sub_1BA2B5690();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2B4EB8()
{
  sub_1BA2B5690();
  return sub_1BA2C2768();
}

uint64_t ArticlePrerollAdContext.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  __int128 v59;
  __int128 v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;

  sub_1BA2B6824(0, &qword_1EF280128, MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v19 - v6;
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v63 = *((_QWORD *)v1 + 2);
  v64 = v9;
  v62 = *((_QWORD *)v1 + 3);
  v61 = v1[32];
  v58 = v1[33];
  v57 = *((_QWORD *)v1 + 5);
  v10 = *((_OWORD *)v1 + 3);
  v59 = *((_OWORD *)v1 + 4);
  v60 = v10;
  v56 = *((_QWORD *)v1 + 10);
  v55 = *((_QWORD *)v1 + 11);
  v48 = *((_QWORD *)v1 + 12);
  v49 = *((_QWORD *)v1 + 13);
  v50 = v1[112];
  v53 = *((_QWORD *)v1 + 15);
  v52 = *((_QWORD *)v1 + 16);
  v51 = *((_QWORD *)v1 + 17);
  v54 = *((_OWORD *)v1 + 9);
  v11 = *((_QWORD *)v1 + 20);
  v47 = v1[168];
  v44 = *((_QWORD *)v1 + 22);
  v45 = *((_QWORD *)v1 + 23);
  v46 = *((unsigned __int16 *)v1 + 96);
  v42 = *((_QWORD *)v1 + 25);
  v43 = *((_QWORD *)v1 + 26);
  v31 = *((_QWORD *)v1 + 27);
  v32 = *((_QWORD *)v1 + 28);
  v41 = *((_QWORD *)v1 + 29);
  v40 = *((_QWORD *)v1 + 30);
  v39 = *((_QWORD *)v1 + 31);
  v38 = *((_QWORD *)v1 + 32);
  v37 = *((_QWORD *)v1 + 33);
  v36 = *((_QWORD *)v1 + 34);
  v35 = *((_QWORD *)v1 + 35);
  v34 = *((_QWORD *)v1 + 36);
  v33 = *((_QWORD *)v1 + 37);
  v22 = *((_QWORD *)v1 + 38);
  v23 = *((_QWORD *)v1 + 39);
  v30 = *((_QWORD *)v1 + 40);
  v29 = *((_QWORD *)v1 + 41);
  v28 = *((_QWORD *)v1 + 42);
  v27 = *((_QWORD *)v1 + 43);
  v26 = *((_QWORD *)v1 + 44);
  v25 = *((_QWORD *)v1 + 45);
  v24 = *((_QWORD *)v1 + 46);
  v21 = v1[376];
  v12 = *((_QWORD *)v1 + 49);
  v20 = *((_QWORD *)v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B5690();
  v13 = v4;
  sub_1BA2C2750();
  LOBYTE(v66) = v8;
  v75 = 0;
  sub_1BA234CD4();
  v14 = v65;
  sub_1BA2C2684();
  if (v14)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v15 = v61;
  v17 = v62;
  v16 = v63;
  v65 = v12;
  v66 = v64;
  v75 = 1;
  sub_1BA236AC4();
  sub_1BA2C2684();
  v66 = v16;
  v67 = v17;
  LOBYTE(v68) = v15;
  BYTE1(v68) = v58;
  v69 = v57;
  v70 = v60;
  v71 = v59;
  v72 = v56;
  v73 = v55;
  v75 = 2;
  sub_1BA240AE4();
  sub_1BA2C2684();
  v66 = v48;
  v67 = v49;
  LOBYTE(v68) = v50;
  v69 = v53;
  *(_QWORD *)&v70 = v52;
  *((_QWORD *)&v70 + 1) = v51;
  v71 = v54;
  v75 = 3;
  sub_1BA2461F8();
  sub_1BA2C2684();
  v66 = v11;
  v75 = 4;
  sub_1BA238EE0();
  sub_1BA2C2684();
  LOBYTE(v66) = v47;
  v75 = 5;
  sub_1BA23D110();
  sub_1BA2C2684();
  v66 = v44;
  v67 = v45;
  LOWORD(v68) = v46;
  v75 = 6;
  sub_1BA24623C();
  sub_1BA2C2648();
  v66 = v42;
  v67 = v43;
  v75 = 7;
  sub_1BA246280();
  sub_1BA2C2648();
  v66 = v31;
  v67 = v32;
  v68 = v41;
  v69 = v40;
  *(_QWORD *)&v70 = v39;
  *((_QWORD *)&v70 + 1) = v38;
  *(_QWORD *)&v71 = v37;
  *((_QWORD *)&v71 + 1) = v36;
  v72 = v35;
  v73 = v34;
  v74 = v33;
  v75 = 8;
  sub_1BA236B90();
  sub_1BA2C2648();
  v66 = v22;
  v67 = v23;
  v68 = v30;
  v69 = v29;
  *(_QWORD *)&v70 = v28;
  *((_QWORD *)&v70 + 1) = v27;
  *(_QWORD *)&v71 = v26;
  *((_QWORD *)&v71 + 1) = v25;
  v72 = v24;
  v75 = 9;
  sub_1BA23667C();
  sub_1BA2C2648();
  LOBYTE(v66) = v21;
  v75 = 10;
  sub_1BA23D154();
  sub_1BA2C2648();
  v66 = v20;
  v75 = 11;
  sub_1BA259544();
  sub_1BA2C2648();
  v66 = v65;
  v75 = 12;
  sub_1BA28405C();
  sub_1BA2C2648();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v13);
}

unint64_t sub_1BA2B5690()
{
  unint64_t result;

  result = qword_1EF280130;
  if (!qword_1EF280130)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC13C, &type metadata for ArticlePrerollAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280130);
  }
  return result;
}

_QWORD *ArticlePrerollAdContext.init(from:)@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  _QWORD v89[50];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  _BYTE v105[7];
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  _BYTE v113[7];
  uint64_t v114;
  uint64_t v115;
  __int16 v116;
  int v117;
  __int16 v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  _BYTE v142[7];
  uint64_t v143;
  uint64_t v144;
  char v145;
  uint64_t v146;
  _BYTE v147[11];
  __int16 v148;
  _BYTE v149[7];
  _BYTE v150[11];
  __int16 v151;
  _DWORD v152[3];

  sub_1BA2B6824(0, &qword_1EF280138, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v36 - v8;
  v10 = a1[3];
  v88 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_1BA2B5690();
  sub_1BA2C2744();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
    return (_QWORD *)v84;
  }
  else
  {
    v53 = a2;
    LOBYTE(v89[0]) = 0;
    sub_1BA234C90();
    sub_1BA2C2630();
    v11 = v90;
    LOBYTE(v89[0]) = 1;
    sub_1BA236A80();
    sub_1BA2C2630();
    v12 = v90;
    LOBYTE(v89[0]) = 2;
    sub_1BA240AA0();
    swift_bridgeObjectRetain();
    sub_1BA2C2630();
    v77 = v12;
    v52 = v90;
    v13 = v91;
    v50 = v92;
    v51 = v11;
    v49 = BYTE1(v92);
    v14 = v94;
    v75 = v96;
    v76 = v95;
    v15 = v97;
    v47 = v98;
    v48 = v93;
    v16 = v99;
    LOBYTE(v89[0]) = 3;
    sub_1BA24739C();
    v74 = v13;
    swift_bridgeObjectRetain();
    v72 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v73 = v16;
    swift_bridgeObjectRetain();
    sub_1BA2C2630();
    v71 = v15;
    v46 = v90;
    v17 = v91;
    v45 = v92;
    v18 = v94;
    v43 = v95;
    v44 = v93;
    v19 = v96;
    v20 = v97;
    LOBYTE(v89[0]) = 4;
    sub_1BA238E9C();
    v70 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BA2C2630();
    v68 = v20;
    v69 = v18;
    v67 = v19;
    v21 = v90;
    LOBYTE(v89[0]) = 5;
    sub_1BA23D610();
    sub_1BA2C2630();
    v42 = v90;
    LOBYTE(v89[0]) = 6;
    sub_1BA2473E0();
    sub_1BA2C25F4();
    v41 = v90;
    v22 = v91;
    v40 = (unsigned __int16)v92;
    LOBYTE(v89[0]) = 7;
    sub_1BA247424();
    swift_bridgeObjectRetain();
    sub_1BA2C25F4();
    v66 = v22;
    v23 = v90;
    v24 = v91;
    LOBYTE(v89[0]) = 8;
    sub_1BA236B4C();
    swift_bridgeObjectRetain();
    sub_1BA2C25F4();
    v87 = v24;
    v25 = v46;
    LOBYTE(v89[0]) = 9;
    v65 = v100;
    v64 = v99;
    v63 = v98;
    v55 = v90;
    v56 = v91;
    v57 = v92;
    v58 = v93;
    v59 = v94;
    v60 = v95;
    v61 = v96;
    v62 = v97;
    sub_1BA282048(v90, v91);
    sub_1BA236638();
    sub_1BA2C25F4();
    LOBYTE(v89[0]) = 10;
    v78 = v98;
    v84 = v90;
    v85 = v94;
    v80 = v91;
    v81 = v92;
    v82 = v93;
    v83 = v95;
    v86 = v96;
    v79 = v97;
    sub_1BA2820FC(v90, v91);
    sub_1BA23D654();
    sub_1BA2C25F4();
    v39 = v90;
    LOBYTE(v89[0]) = 11;
    sub_1BA259500();
    sub_1BA2C25F4();
    v26 = v90;
    v145 = 12;
    sub_1BA285320();
    v54 = v26;
    swift_bridgeObjectRetain();
    sub_1BA2C25F4();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v38 = v146;
    LOBYTE(v89[0]) = v51;
    v89[1] = v77;
    v89[2] = v52;
    v89[3] = v74;
    LOBYTE(v89[4]) = v50;
    BYTE1(v89[4]) = v49;
    v89[5] = v48;
    v89[6] = v72;
    v89[7] = v76;
    v89[8] = v75;
    v89[9] = v71;
    v89[10] = v47;
    v89[11] = v73;
    v89[12] = v25;
    v89[13] = v70;
    LOBYTE(v89[14]) = v45;
    v89[15] = v44;
    v89[16] = v69;
    v89[17] = v43;
    v89[18] = v67;
    v89[19] = v68;
    v89[20] = v21;
    LOBYTE(v89[21]) = v42;
    v89[22] = v41;
    v89[23] = v66;
    LOWORD(v89[24]) = v40;
    v37 = v23;
    v89[25] = v23;
    v89[26] = v87;
    v89[27] = v55;
    v89[28] = v56;
    v89[29] = v57;
    v89[30] = v58;
    v89[31] = v59;
    v89[32] = v60;
    v89[33] = v61;
    v89[34] = v62;
    v89[35] = v63;
    v89[36] = v64;
    v89[37] = v65;
    v89[38] = v84;
    v27 = v80;
    v89[39] = v80;
    v89[40] = v81;
    v89[41] = v82;
    v89[42] = v85;
    v89[43] = v83;
    v89[44] = v86;
    v89[45] = v79;
    v89[46] = v78;
    LOBYTE(v89[47]) = v39;
    v89[48] = v54;
    v89[49] = v146;
    sub_1BA2B499C(v89);
    swift_bridgeObjectRelease();
    sub_1BA283218(v84, v27);
    sub_1BA283288(v55, v56);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v28 = v76;
    swift_bridgeObjectRelease();
    v29 = v72;
    swift_bridgeObjectRelease();
    v30 = v74;
    swift_bridgeObjectRelease();
    v31 = v68;
    swift_bridgeObjectRelease();
    v32 = v67;
    swift_bridgeObjectRelease();
    v33 = v69;
    swift_bridgeObjectRelease();
    v34 = v70;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v53, v89, 0x190uLL);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
    LOBYTE(v90) = v51;
    v91 = v77;
    v92 = v52;
    v93 = v30;
    LOBYTE(v94) = v50;
    BYTE1(v94) = v49;
    v95 = v48;
    v96 = v29;
    v97 = v28;
    v98 = v75;
    v99 = v71;
    v100 = v47;
    v101 = v73;
    v102 = v46;
    v103 = v34;
    v104 = v45;
    v106 = v44;
    v107 = v33;
    v108 = v43;
    v109 = v32;
    v110 = v31;
    *(_DWORD *)((char *)&v90 + 1) = v152[0];
    HIDWORD(v90) = *(_DWORD *)((char *)v152 + 3);
    *(_DWORD *)((char *)&v94 + 2) = *(_DWORD *)&v150[7];
    HIWORD(v94) = v151;
    *(_DWORD *)v105 = *(_DWORD *)v150;
    *(_DWORD *)&v105[3] = *(_DWORD *)&v150[3];
    v111 = v21;
    v112 = v42;
    *(_DWORD *)v113 = *(_DWORD *)v149;
    *(_DWORD *)&v113[3] = *(_DWORD *)&v149[3];
    v114 = v41;
    v115 = v66;
    v116 = v40;
    v118 = v148;
    v117 = *(_DWORD *)&v147[7];
    v119 = v37;
    v120 = v87;
    v121 = v55;
    v122 = v56;
    v123 = v57;
    v124 = v58;
    v125 = v59;
    v126 = v60;
    v127 = v61;
    v128 = v62;
    v129 = v63;
    v130 = v64;
    v131 = v65;
    v132 = v84;
    v133 = v80;
    v134 = v81;
    v135 = v82;
    v136 = v85;
    v137 = v83;
    v138 = v86;
    v139 = v79;
    v140 = v78;
    v141 = v39;
    *(_DWORD *)v142 = *(_DWORD *)v147;
    *(_DWORD *)&v142[3] = *(_DWORD *)&v147[3];
    v143 = v54;
    v144 = v38;
    return sub_1BA2B4B58(&v90);
  }
}

void sub_1BA2B6824(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2B5690();
    v7 = a3(a1, &type metadata for ArticlePrerollAdContext.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

_QWORD *sub_1BA2B6880@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  return ArticlePrerollAdContext.init(provider:)(a1, a2);
}

_QWORD *sub_1BA2B6894@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  return ArticlePrerollAdContext.init(from:)(a1, a2);
}

uint64_t sub_1BA2B68A8(_QWORD *a1)
{
  return ArticlePrerollAdContext.encode(to:)(a1);
}

void ArticlePrerollAdContext.newsSupplementalContext.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[9];

  v19 = *(unsigned __int8 *)(v0 + 32);
  v20 = *(_QWORD *)(v0 + 16);
  v11 = *(unsigned __int8 *)(v0 + 33);
  v1 = *(_QWORD *)(v0 + 48);
  v17 = *(_QWORD *)(v0 + 40);
  v18 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v15 = *(_QWORD *)(v0 + 96);
  v16 = *(_QWORD *)(v0 + 80);
  v34 = *(_QWORD *)(v0 + 88);
  v35 = *(_QWORD *)(v0 + 104);
  v14 = *(unsigned __int8 *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 144);
  v12 = *(_QWORD *)(v0 + 136);
  v13 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 152);
  v24 = *(_QWORD *)(v0 + 224);
  v25 = *(_QWORD *)(v0 + 216);
  v23 = *(_QWORD *)(v0 + 240);
  v21 = *(_QWORD *)(v0 + 184);
  v22 = *(_QWORD *)(v0 + 248);
  v37 = *(_QWORD *)(v0 + 256);
  v38 = *(_QWORD *)(v0 + 208);
  v36 = *(_QWORD *)(v0 + 264);
  v33 = *(_QWORD *)(v0 + 280);
  v31 = *(_QWORD *)(v0 + 272);
  v32 = *(_QWORD *)(v0 + 288);
  v26 = *(_QWORD *)(v0 + 232);
  v27 = *(_QWORD *)(v0 + 312);
  v10 = *(_QWORD *)(v0 + 304);
  v9 = *(_QWORD *)(v0 + 344);
  v29 = *(_QWORD *)(v0 + 368);
  v30 = *(_QWORD *)(v0 + 296);
  v28 = *(unsigned __int8 *)(v0 + 376);
  objc_msgSend(objc_allocWithZone((Class)sub_1BA2C1DC0()), sel_init);
  sub_1BA2C1DB4();
  sub_1BA2C1C94();
  swift_bridgeObjectRetain_n();
  sub_1BA2C1D00();
  swift_bridgeObjectRelease();
  v8 = 256;
  if (!v11)
    v8 = 0;
  v39 = v20;
  v40 = v18;
  v41 = v8 | v19;
  v42 = v17;
  v43 = v1;
  v44 = v2;
  v45 = v3;
  v46 = v4;
  v47 = v16;
  v48 = v34;
  v50[0] = v15;
  v50[1] = v35;
  v50[2] = v14;
  v50[3] = v13;
  v50[4] = v5;
  v50[5] = v12;
  v50[6] = v6;
  v50[7] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA26F958((uint64_t)&v39, v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
    swift_bridgeObjectRetain_n();
    sub_1BA2C1C4C();
    sub_1BA2C1CB8();
    sub_1BA2C1CE8();
    swift_bridgeObjectRelease();
  }
  if (v38 && v24)
  {
    if ((v23 & 1) != 0 || v26 >= 1)
      swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BA282048(v25, v24);
    sub_1BA2C1D0C();
    sub_1BA283288(v25, v24);
    swift_bridgeObjectRelease();
  }
  v39 = v25;
  v40 = v24;
  v41 = v26;
  v42 = v23;
  v43 = v22;
  v44 = v37;
  v45 = v36;
  v46 = v31;
  v47 = v33;
  v48 = v32;
  v49 = v30;
  sub_1BA282048(v25, v24);
  sub_1BA2338F8((uint64_t)&v39);
  sub_1BA283288(v25, v24);
  if (v27)
  {
    swift_bridgeObjectRetain();
    sub_1BA2820FC(v10, v27);
    sub_1BA2C1BEC();
    swift_bridgeObjectRetain();
    sub_1BA2C1C10();
    swift_bridgeObjectRetain();
    sub_1BA2C1C1C();
    swift_bridgeObjectRetain();
    sub_1BA2C1B80();
    objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v9, v29, v32, v30);
    sub_1BA2C1C40();
    sub_1BA283218(v10, v27);
    __asm { BR              X9 }
  }
  __asm { BR              X9 }
}

uint64_t sub_1BA2B6E38()
{
  uint64_t v0;
  double v1;
  uint64_t v3;
  uint64_t v4;

  sub_1BA2C1C64();
  sub_1BA23DAE0();
  sub_1BA2C2438();
  sub_1BA2C1D54();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v1);
  sub_1BA2C1C7C();
  if (v3)
  {
    swift_bridgeObjectRetain_n();
    sub_1BA2C1D84();
    swift_bridgeObjectRelease();
  }
  if (v4)
  {
    swift_bridgeObjectRetain_n();
    sub_1BA2C1CC4();
    swift_bridgeObjectRelease();
  }
  return v0;
}

uint64_t ArticlePrerollAdContext.currentPromotableContentDepiction.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15[2];
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v13 = *(_BYTE *)(v0 + 33);
  v5 = *(_QWORD *)(v0 + 48);
  v12 = *(_QWORD *)(v0 + 40);
  v7 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 64);
  v9 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 88);
  sub_1BA2C19E8();
  v14 = v1;
  v15[0] = v2;
  v15[1] = v3;
  v16 = v4;
  v17 = v13;
  v18 = v12;
  v19 = v5;
  v20 = v7;
  v21 = v6;
  v22 = v9;
  v23 = v8;
  v24 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1BA26D49C(0, v15, &v14, 104);
}

uint64_t destroy for ArticlePrerollAdContext(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 224))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(a1 + 312))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ArticlePrerollAdContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v9 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v9;
  v10 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v10;
  v11 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v11;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v12 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v12;
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  v13 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = v13;
  v28 = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v28)
  {
    v21 = *(_OWORD *)(a2 + 264);
    *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
    *(_OWORD *)(a1 + 264) = v21;
    *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
    v22 = *(_OWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
    *(_OWORD *)(a1 + 232) = v22;
    v17 = *(_QWORD *)(a2 + 312);
    if (v17)
      goto LABEL_3;
LABEL_5:
    v23 = *(_OWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 352) = v23;
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    v24 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 320) = v24;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v28;
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 240) = *(_BYTE *)(a2 + 240);
  v14 = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = v14;
  v15 = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = v15;
  v16 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = v16;
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = *(_QWORD *)(a2 + 312);
  if (!v17)
    goto LABEL_5;
LABEL_3:
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v17;
  v18 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v18;
  v19 = *(_QWORD *)(a2 + 344);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 344) = v19;
  v20 = *(_QWORD *)(a2 + 360);
  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  *(_QWORD *)(a1 + 360) = v20;
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_6:
  *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
  v25 = *(_QWORD *)(a2 + 384);
  v26 = *(_QWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 384) = v25;
  *(_QWORD *)(a1 + 392) = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ArticlePrerollAdContext(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_BYTE *)(a1 + 193) = *(_BYTE *)(a2 + 193);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 216);
  v5 = (_OWORD *)(a2 + 216);
  v6 = *(_QWORD *)(a2 + 224);
  if (*(_QWORD *)(a1 + 224))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
      *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
      *(_BYTE *)(a1 + 240) = *(_BYTE *)(a2 + 240);
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
      *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
      *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1BA257D78(a1 + 216);
      v7 = *(_OWORD *)(a2 + 232);
      *v4 = *v5;
      *(_OWORD *)(a1 + 232) = v7;
      v9 = *(_OWORD *)(a2 + 264);
      v8 = *(_OWORD *)(a2 + 280);
      v10 = *(_OWORD *)(a2 + 248);
      *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
      *(_OWORD *)(a1 + 264) = v9;
      *(_OWORD *)(a1 + 280) = v8;
      *(_OWORD *)(a1 + 248) = v10;
    }
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
    *(_BYTE *)(a1 + 240) = *(_BYTE *)(a2 + 240);
    *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 232);
    *v4 = *v5;
    *(_OWORD *)(a1 + 232) = v11;
    v12 = *(_OWORD *)(a2 + 248);
    v13 = *(_OWORD *)(a2 + 264);
    v14 = *(_OWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
    *(_OWORD *)(a1 + 264) = v13;
    *(_OWORD *)(a1 + 280) = v14;
    *(_OWORD *)(a1 + 248) = v12;
  }
  v15 = (_OWORD *)(a1 + 304);
  v16 = (_OWORD *)(a2 + 304);
  v17 = *(_QWORD *)(a2 + 312);
  if (*(_QWORD *)(a1 + 312))
  {
    if (v17)
    {
      *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
      *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
      *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
      *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1BA257DAC(a1 + 304);
      *v15 = *v16;
      v19 = *(_OWORD *)(a2 + 336);
      v18 = *(_OWORD *)(a2 + 352);
      v20 = *(_OWORD *)(a2 + 320);
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v19;
      *(_OWORD *)(a1 + 352) = v18;
      *(_OWORD *)(a1 + 320) = v20;
    }
  }
  else if (v17)
  {
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *v15 = *v16;
    v21 = *(_OWORD *)(a2 + 320);
    v22 = *(_OWORD *)(a2 + 336);
    v23 = *(_OWORD *)(a2 + 352);
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    *(_OWORD *)(a1 + 336) = v22;
    *(_OWORD *)(a1 + 352) = v23;
    *(_OWORD *)(a1 + 320) = v21;
  }
  *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy400_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x190uLL);
}

uint64_t assignWithTake for ArticlePrerollAdContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v8 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v10 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_BYTE *)(a1 + 193) = *(_BYTE *)(a2 + 193);
  v11 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = v11;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 224))
  {
    v12 = *(_QWORD *)(a2 + 224);
    if (v12)
    {
      *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
      *(_QWORD *)(a1 + 224) = v12;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
      *(_BYTE *)(a1 + 240) = *(_BYTE *)(a2 + 240);
      v13 = *(_QWORD *)(a2 + 256);
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
      *(_QWORD *)(a1 + 256) = v13;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
      swift_bridgeObjectRelease();
      v14 = *(_QWORD *)(a2 + 288);
      *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
      *(_QWORD *)(a1 + 288) = v14;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_1BA257D78(a1 + 216);
  }
  v15 = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 264) = v15;
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  v16 = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = v16;
LABEL_6:
  if (!*(_QWORD *)(a1 + 312))
  {
LABEL_10:
    v18 = *(_OWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 352) = v18;
    *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
    v19 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 320) = v19;
    goto LABEL_11;
  }
  v17 = *(_QWORD *)(a2 + 312);
  if (!v17)
  {
    sub_1BA257DAC(a1 + 304);
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v17;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  swift_bridgeObjectRelease();
LABEL_11:
  *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticlePrerollAdContext(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 400))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticlePrerollAdContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 392) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 400) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 400) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ArticlePrerollAdContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_1BA2B7D08 + 4 * byte_1BA2CBF8C[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1BA2B7D3C + 4 * byte_1BA2CBF87[v4]))();
}

uint64_t sub_1BA2B7D3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2B7D44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA2B7D4CLL);
  return result;
}

uint64_t sub_1BA2B7D58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA2B7D60);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_1BA2B7D64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2B7D6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArticlePrerollAdContext.CodingKeys()
{
  return &type metadata for ArticlePrerollAdContext.CodingKeys;
}

unint64_t sub_1BA2B7D8C()
{
  unint64_t result;

  result = qword_1EF280140;
  if (!qword_1EF280140)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC114, &type metadata for ArticlePrerollAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280140);
  }
  return result;
}

unint64_t sub_1BA2B7DD4()
{
  unint64_t result;

  result = qword_1EF280148;
  if (!qword_1EF280148)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC084, &type metadata for ArticlePrerollAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280148);
  }
  return result;
}

unint64_t sub_1BA2B7E1C()
{
  unint64_t result;

  result = qword_1EF280150;
  if (!qword_1EF280150)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC0AC, &type metadata for ArticlePrerollAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280150);
  }
  return result;
}

uint64_t sub_1BA2B7E60(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x61746144707061 && a2 == 0xE700000000000000;
  if (v2 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6174614472657375 && a2 == 0xE800000000000000 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x44656C6369747261 && a2 == 0xEB00000000617461 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x446C656E6E616863 && a2 == 0xEB00000000617461 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7461446F65646976 && a2 == 0xE900000000000061 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E656D6563616C70 && a2 == 0xED00006174614474 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7461446575737369 && a2 == 0xE900000000000061 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x446E6F6974636573 && a2 == 0xEB00000000617461 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6174614464656566 && a2 == 0xE800000000000000 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x74614470756F7267 && a2 == 0xE900000000000061 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6C61727265666572 && a2 == 0xEC00000061746144 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6D75636F44666E61 && a2 == 0xEF61746144746E65 || (sub_1BA2C26A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001BA2D0660)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    v6 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 12;
    else
      return 13;
  }
}

uint64_t sub_1BA2B8444(uint64_t *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  __int128 v22;
  ValueMetadata *v23;
  _UNKNOWN **v24;
  _QWORD v25[7];
  _QWORD v26[6];
  char v27;

  v3 = v2;
  v6 = (uint64_t *)((char *)a1 + *(int *)(sub_1BA239904() + 56));
  v8 = *v6;
  v7 = v6[1];
  v9 = a1[6];
  v21 = a1[5];
  v11 = *a1;
  v10 = a1[1];
  type metadata accessor for DebugLifecycleMetricsHelper();
  v12 = swift_allocObject();
  v23 = &type metadata for DebugSponsorshipAdContentInfo;
  v24 = &off_1E71FE5F0;
  v13 = swift_allocObject();
  *(_QWORD *)&v22 = v13;
  *(_QWORD *)(v13 + 16) = v11;
  *(_QWORD *)(v13 + 24) = v10;
  *(_QWORD *)(v13 + 32) = v12;
  *(_WORD *)(v13 + 40) = 0;
  *(_BYTE *)(v13 + 42) = 0;
  *(_OWORD *)(v13 + 48) = xmmword_1BA2C4C30;
  v14 = v3[6];
  v15 = v3[7];
  __swift_project_boxed_opaque_existential_1(v3 + 3, v14);
  v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  v17 = v16(v14, v15);
  v25[0] = v8;
  v25[1] = v7;
  v25[2] = v8;
  v25[3] = v7;
  v25[4] = v21;
  v25[5] = v9;
  v25[6] = a2;
  sub_1BA21D3D4(&v22, (uint64_t)v26);
  v26[5] = v17;
  v27 = 0;
  swift_retain();
  sub_1BA2C1574();
  v18 = swift_release();
  if (*(float *)&v22 <= 0.0)
  {
    sub_1BA2A028C((uint64_t)v25, (uint64_t)&v22);
    sub_1BA23A240();
    swift_allocObject();
    v19 = sub_1BA2C197C();
  }
  else
  {
    MEMORY[0x1E0C80A78](v18);
    sub_1BA23A240();
    swift_allocObject();
    v19 = sub_1BA2C1988();
  }
  sub_1BA23A710((uint64_t)v25);
  return v19;
}

uint64_t sub_1BA2B8668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];
  __int128 v32[7];

  v25 = a6;
  v27 = a2;
  v26 = a1;
  v6 = sub_1BA2C2030();
  v30 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_1BA2C2060();
  v28 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BA2C2078();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v24 - v16;
  sub_1BA21D258();
  v18 = (void *)sub_1BA2C23D8();
  sub_1BA2C206C();
  swift_retain();
  sub_1BA2C1574();
  swift_release();
  MEMORY[0x1BCCD8848](v15, *(float *)v32);
  v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v15, v11);
  sub_1BA2A028C(v25, (uint64_t)v32);
  v20 = swift_allocObject();
  v21 = v27;
  *(_QWORD *)(v20 + 16) = v26;
  *(_QWORD *)(v20 + 24) = v21;
  sub_1BA2B8A64(v32, v20 + 32);
  aBlock[4] = sub_1BA2B8AA0;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BA223CC0;
  aBlock[3] = &block_descriptor_10;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1BA2C2048();
  *(_QWORD *)&v32[0] = MEMORY[0x1E0DEE9D8];
  sub_1BA221230((unint64_t *)&qword_1ED5B2B40, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BA224004();
  sub_1BA221230((unint64_t *)&qword_1ED5B2B68, (uint64_t (*)(uint64_t))sub_1BA224004, MEMORY[0x1E0DEAF38]);
  sub_1BA2C2480();
  MEMORY[0x1BCCD8B78](v17, v10, v8, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v29);
  return ((uint64_t (*)(char *, uint64_t))v19)(v17, v11);
}

uint64_t sub_1BA2B8970()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DebugSponsorshipAdProvider()
{
  return objc_opt_self();
}

uint64_t sub_1BA2B89BC(uint64_t *a1, uint64_t a2)
{
  return sub_1BA2B8444(a1, a2);
}

uint64_t sub_1BA2B89DC()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA2B8A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1BA2B8668(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_1BA2B8A10()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);

  return swift_deallocObject();
}

uint64_t sub_1BA2B8A64(__int128 *a1, uint64_t a2)
{
  __swift_memcpy105_8(a2, a1);
  return a2;
}

uint64_t sub_1BA2B8AA0()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + 32);
}

uint64_t dispatch thunk of AdProviderFactoryType.createAdProvider<A, B>(for:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t DebugAdContentInfo.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugAdContentInfo.metricsHelper.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t DebugAdContentInfo.isDownloadable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t DebugAdContentInfo.isDownloadable.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.isDownloadable.modify())()
{
  return nullsub_1;
}

uint64_t DebugAdContentInfo.isInteractive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t DebugAdContentInfo.isInteractive.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.isInteractive.modify())()
{
  return nullsub_1;
}

uint64_t DebugAdContentInfo.isVideo.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 26);
}

uint64_t DebugAdContentInfo.isVideo.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 26) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.isVideo.modify())()
{
  return nullsub_1;
}

uint64_t DebugAdContentInfo.unfilledReason.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t DebugAdContentInfo.unfilledReason.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.unfilledReason.modify())()
{
  return nullsub_1;
}

uint64_t initializeWithCopy for DebugAdContentInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DebugAdContentInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DebugAdContentInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugAdContentInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DebugAdContentInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugAdContentInfo()
{
  return &type metadata for DebugAdContentInfo;
}

void sub_1BA2B8D74(uint64_t a1, char a2)
{
  sub_1BA2C2720();
  __asm { BR              X10 }
}

uint64_t sub_1BA2B8DB8()
{
  sub_1BA2C21A4();
  swift_bridgeObjectRelease();
  return sub_1BA2C2738();
}

void sub_1BA2B8E94(uint64_t a1, char a2)
{
  sub_1BA2C2720();
  __asm { BR              X10 }
}

uint64_t sub_1BA2B8EEC()
{
  sub_1BA2C21A4();
  swift_bridgeObjectRelease();
  return sub_1BA2C2738();
}

NewsAds::CreativeType_optional __swiftcall CreativeType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  NewsAds::CreativeType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA2C25DC();
  result.value = swift_bridgeObjectRelease();
  v5 = 8;
  if (v3 < 8)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CreativeType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA2B902C + 4 * byte_1BA2CC367[*v0]))(7958113, 0xE300000000000000);
}

uint64_t sub_1BA2B902C()
{
  return 0x656E6E6142796E61;
}

uint64_t sub_1BA2B904C()
{
  return 0x647261646E617473;
}

uint64_t sub_1BA2B9064()
{
  return 0x656C62756F64;
}

uint64_t sub_1BA2B9078()
{
  return 0x656772616CLL;
}

uint64_t sub_1BA2B908C()
{
  return 0x65526D756964656DLL;
}

uint64_t sub_1BA2B90B0()
{
  return 0x65766974616ELL;
}

uint64_t sub_1BA2B90C4()
{
  return 0x65726F736E6F7073;
}

void sub_1BA2B90E0(char *a1)
{
  sub_1BA26E2D8(*a1);
}

void sub_1BA2B90EC()
{
  char *v0;

  sub_1BA2B8D74(0, *v0);
}

void sub_1BA2B90F8(uint64_t a1)
{
  char *v1;

  sub_1BA2B9A58(a1, *v1);
}

void sub_1BA2B9100(uint64_t a1)
{
  char *v1;

  sub_1BA2B8D74(a1, *v1);
}

NewsAds::CreativeType_optional sub_1BA2B9108(Swift::String *a1)
{
  return CreativeType.init(rawValue:)(*a1);
}

uint64_t sub_1BA2B9114()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1BA2B913C + 4 * byte_1BA2CC36F[*v0]))();
}

void sub_1BA2B913C(_QWORD *a1@<X8>)
{
  *a1 = 0x656E6E6142796E61;
  a1[1] = 0xE900000000000072;
}

void sub_1BA2B9160(_QWORD *a1@<X8>)
{
  *a1 = 0x647261646E617473;
  a1[1] = 0xE800000000000000;
}

void sub_1BA2B917C(_QWORD *a1@<X8>)
{
  *a1 = 0x656C62756F64;
  a1[1] = 0xE600000000000000;
}

void sub_1BA2B9194(_QWORD *a1@<X8>)
{
  *a1 = 0x656772616CLL;
  a1[1] = 0xE500000000000000;
}

void sub_1BA2B91AC(_QWORD *a1@<X8>)
{
  *a1 = 0x65526D756964656DLL;
  a1[1] = 0xEF656C676E617463;
}

void sub_1BA2B91D4(_QWORD *a1@<X8>)
{
  *a1 = 0x65766974616ELL;
  a1[1] = 0xE600000000000000;
}

void sub_1BA2B91EC(_QWORD *a1@<X8>)
{
  *a1 = 0x65726F736E6F7073;
  a1[1] = 0xE900000000000064;
}

uint64_t sub_1BA2B920C()
{
  sub_1BA2B9924();
  return sub_1BA2C2258();
}

uint64_t sub_1BA2B9268()
{
  sub_1BA2B9924();
  return sub_1BA2C2228();
}

void CreativeAdData.creativeType.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_1BA2B92C0()
{
  return 0x6576697461657263;
}

uint64_t sub_1BA2B92E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6576697461657263 && a2 == 0xEC00000065707954)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1BA2C26A8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1BA2B938C()
{
  sub_1BA2B94E0();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2B93B4()
{
  sub_1BA2B94E0();
  return sub_1BA2C2768();
}

uint64_t CreativeAdData.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v10;
  char v11;

  sub_1BA2B96A0(0, &qword_1EF280200, MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v10 - v6;
  v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B94E0();
  sub_1BA2C2750();
  v11 = v8;
  sub_1BA2B9524();
  sub_1BA2C2684();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BA2B94E0()
{
  unint64_t result;

  result = qword_1EF280208;
  if (!qword_1EF280208)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC5F4, &type metadata for CreativeAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280208);
  }
  return result;
}

unint64_t sub_1BA2B9524()
{
  unint64_t result;

  result = qword_1EF280210;
  if (!qword_1EF280210)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for CreativeType, &type metadata for CreativeType);
    atomic_store(result, (unint64_t *)&qword_1EF280210);
  }
  return result;
}

uint64_t CreativeAdData.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  char v12;

  sub_1BA2B96A0(0, &qword_1EF280218, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v11 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B94E0();
  sub_1BA2C2744();
  if (!v2)
  {
    sub_1BA2B96FC();
    sub_1BA2C2630();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BA2B96A0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2B94E0();
    v7 = a3(a1, &type metadata for CreativeAdData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BA2B96FC()
{
  unint64_t result;

  result = qword_1EF280220;
  if (!qword_1EF280220)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for CreativeType, &type metadata for CreativeType);
    atomic_store(result, (unint64_t *)&qword_1EF280220);
  }
  return result;
}

unint64_t sub_1BA2B9744()
{
  unint64_t result;

  result = qword_1EF280228;
  if (!qword_1EF280228)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for CreativeType, &type metadata for CreativeType);
    atomic_store(result, (unint64_t *)&qword_1EF280228);
  }
  return result;
}

uint64_t sub_1BA2B9788@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return CreativeAdData.init(from:)(a1, a2);
}

uint64_t sub_1BA2B979C(_QWORD *a1)
{
  return CreativeAdData.encode(to:)(a1);
}

uint64_t storeEnumTagSinglePayload for CreativeAdData.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA2B97F0 + 4 * byte_1BA2CC381[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA2B9810 + 4 * byte_1BA2CC386[v4]))();
}

_BYTE *sub_1BA2B97F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA2B9810(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2B9818(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2B9820(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2B9828(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2B9830(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CreativeAdData.CodingKeys()
{
  return &type metadata for CreativeAdData.CodingKeys;
}

unint64_t sub_1BA2B9850()
{
  unint64_t result;

  result = qword_1EF280230;
  if (!qword_1EF280230)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC5CC, &type metadata for CreativeAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280230);
  }
  return result;
}

unint64_t sub_1BA2B9898()
{
  unint64_t result;

  result = qword_1EF280238;
  if (!qword_1EF280238)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC53C, &type metadata for CreativeAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280238);
  }
  return result;
}

unint64_t sub_1BA2B98E0()
{
  unint64_t result;

  result = qword_1EF280240;
  if (!qword_1EF280240)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC564, &type metadata for CreativeAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280240);
  }
  return result;
}

unint64_t sub_1BA2B9924()
{
  unint64_t result;

  result = qword_1EF280248;
  if (!qword_1EF280248)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for CreativeType, &type metadata for CreativeType);
    atomic_store(result, (unint64_t *)&qword_1EF280248);
  }
  return result;
}

void sub_1BA2B9968(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1BA2B99A8()
{
  sub_1BA2C21A4();
  return swift_bridgeObjectRelease();
}

void sub_1BA2B9A58(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1BA2B9A90()
{
  sub_1BA2C21A4();
  return swift_bridgeObjectRelease();
}

uint64_t AppAdData.ContentEnvironment.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA2B9B88 + 4 * byte_1BA2CC661[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_1BA2B9B88()
{
  return 0x69746375646F7270;
}

uint64_t sub_1BA2B9BA4()
{
  return 0x676E6967617473;
}

uint64_t sub_1BA2B9BB8()
{
  return 24945;
}

uint64_t sub_1BA2B9BC4()
{
  return 1953719668;
}

uint64_t sub_1BA2B9BD4()
{
  return 0x6C65766564;
}

uint64_t sub_1BA2B9BE8()
{
  return 0x786F62646E6173;
}

uint64_t sub_1BA2B9BFC()
{
  return 0x316F6D6564;
}

uint64_t sub_1BA2B9C10()
{
  return 0x326F6D6564;
}

NewsAds::AppAdData::ContentEnvironment_optional __swiftcall AppAdData.ContentEnvironment.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  NewsAds::AppAdData::ContentEnvironment_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA2C25DC();
  result.value = swift_bridgeObjectRelease();
  v5 = 9;
  if (v3 < 9)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1BA2B9C7C(char *a1)
{
  sub_1BA26D7C8(*a1);
}

uint64_t sub_1BA2B9C88()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1BA2C2720();
  sub_1BA2B9968((uint64_t)v3, v1);
  return sub_1BA2C2738();
}

void sub_1BA2B9CCC(uint64_t a1)
{
  char *v1;

  sub_1BA2B9968(a1, *v1);
}

uint64_t sub_1BA2B9CD4()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1BA2C2720();
  sub_1BA2B9968((uint64_t)v3, v1);
  return sub_1BA2C2738();
}

NewsAds::AppAdData::ContentEnvironment_optional sub_1BA2B9D14(Swift::String *a1)
{
  return AppAdData.ContentEnvironment.init(rawValue:)(*a1);
}

uint64_t sub_1BA2B9D20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AppAdData.ContentEnvironment.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BA2B9D44()
{
  sub_1BA2BA458();
  return sub_1BA2C2258();
}

uint64_t sub_1BA2B9DA0()
{
  sub_1BA2BA458();
  return sub_1BA2C2228();
}

void AppAdData.contentEnvironment.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

unint64_t sub_1BA2B9DF8()
{
  return 0xD000000000000012;
}

uint64_t sub_1BA2B9E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA2BA3D4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1BA2B9E3C()
{
  sub_1BA2B9F90();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2B9E64()
{
  sub_1BA2B9F90();
  return sub_1BA2C2768();
}

uint64_t AppAdData.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v10;
  char v11;

  sub_1BA2BA150(0, &qword_1EF280250, MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v10 - v6;
  v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B9F90();
  sub_1BA2C2750();
  v11 = v8;
  sub_1BA2B9FD4();
  sub_1BA2C2684();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BA2B9F90()
{
  unint64_t result;

  result = qword_1EF280258;
  if (!qword_1EF280258)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC8FC, &type metadata for AppAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280258);
  }
  return result;
}

unint64_t sub_1BA2B9FD4()
{
  unint64_t result;

  result = qword_1EF280260;
  if (!qword_1EF280260)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for AppAdData.ContentEnvironment, &type metadata for AppAdData.ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_1EF280260);
  }
  return result;
}

uint64_t AppAdData.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  char v12;

  sub_1BA2BA150(0, &qword_1EF280268, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v11 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2B9F90();
  sub_1BA2C2744();
  if (!v2)
  {
    sub_1BA2BA1AC();
    sub_1BA2C2630();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BA2BA150(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2B9F90();
    v7 = a3(a1, &type metadata for AppAdData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BA2BA1AC()
{
  unint64_t result;

  result = qword_1EF280270;
  if (!qword_1EF280270)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for AppAdData.ContentEnvironment, &type metadata for AppAdData.ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_1EF280270);
  }
  return result;
}

unint64_t sub_1BA2BA1F4()
{
  unint64_t result;

  result = qword_1EF280278;
  if (!qword_1EF280278)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for AppAdData.ContentEnvironment, &type metadata for AppAdData.ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_1EF280278);
  }
  return result;
}

uint64_t sub_1BA2BA238@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return AppAdData.init(from:)(a1, a2);
}

uint64_t sub_1BA2BA24C(_QWORD *a1)
{
  return AppAdData.encode(to:)(a1);
}

uint64_t storeEnumTagSinglePayload for AppAdData.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA2BA2A0 + 4 * byte_1BA2CC674[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA2BA2C0 + 4 * byte_1BA2CC679[v4]))();
}

_BYTE *sub_1BA2BA2A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA2BA2C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2BA2C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2BA2D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2BA2D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2BA2E0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AppAdData.CodingKeys()
{
  return &type metadata for AppAdData.CodingKeys;
}

unint64_t sub_1BA2BA300()
{
  unint64_t result;

  result = qword_1EF280280;
  if (!qword_1EF280280)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC8D4, &type metadata for AppAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280280);
  }
  return result;
}

unint64_t sub_1BA2BA348()
{
  unint64_t result;

  result = qword_1EF280288;
  if (!qword_1EF280288)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC844, &type metadata for AppAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280288);
  }
  return result;
}

unint64_t sub_1BA2BA390()
{
  unint64_t result;

  result = qword_1EF280290;
  if (!qword_1EF280290)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CC86C, &type metadata for AppAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF280290);
  }
  return result;
}

uint64_t sub_1BA2BA3D4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000012 && a2 == 0x80000001BA2D2940)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_1BA2BA458()
{
  unint64_t result;

  result = qword_1EF280298;
  if (!qword_1EF280298)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for AppAdData.ContentEnvironment, &type metadata for AppAdData.ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_1EF280298);
  }
  return result;
}

uint64_t sub_1BA2BA49C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = v0;
  *(_BYTE *)(v0 + 16) = 1;
  if (qword_1ED5B2D30 != -1)
    swift_once();
  sub_1BA23A368();
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v0 + 24) = sub_1BA2C158C();
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v0 + 32) = sub_1BA2C158C();
  sub_1BA281150();
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v0 + 40) = sub_1BA2C158C();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  v2 = sub_1BA2C1538();
  swift_release_n();
  *(_BYTE *)(v1 + 16) = v2 & 1;
  return v1;
}

uint64_t sub_1BA2BA610(char a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(result + 16) = a1 & 1;
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for DebugBannerAdProvider()
{
  return objc_opt_self();
}

uint64_t sub_1BA2BA684()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BA2BA6A8(char a1)
{
  return sub_1BA2BA610(a1);
}

uint64_t sub_1BA2BA6B0(uint64_t a1)
{
  return sub_1BA2BA73C(a1, (uint64_t)&unk_1E71FF148, (uint64_t)sub_1BA2BAD38, (uint64_t)&block_descriptor_11);
}

void sub_1BA2BA6CC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_1BA2BA720(uint64_t a1)
{
  return sub_1BA2BA73C(a1, (uint64_t)&unk_1E71FF1E8, (uint64_t)sub_1BA2BAD80, (uint64_t)&block_descriptor_12);
}

uint64_t sub_1BA2BA73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v21 = a3;
  v22 = a4;
  v6 = sub_1BA2C2030();
  v26 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BA2C2060();
  v24 = *(_QWORD *)(v9 - 8);
  v25 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BA2C1460();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v23 = *(_QWORD *)(v4 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v16 + v15, (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  aBlock[4] = v21;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BA223CC0;
  aBlock[3] = v22;
  v17 = _Block_copy(aBlock);
  sub_1BA2C2048();
  v27 = MEMORY[0x1E0DEE9D8];
  v18 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1BA221230((unint64_t *)&qword_1ED5B2B40, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2B60, v18, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BA234968((unint64_t *)&qword_1ED5B2B68, (unint64_t *)&qword_1ED5B2B60, v18);
  sub_1BA2C2480();
  MEMORY[0x1BCCD8B9C](0, v11, v8, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
  return swift_release();
}

void sub_1BA2BA99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  SEL *v17;
  _QWORD aBlock[6];

  v17 = a5;
  v8 = sub_1BA2C1460();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v11 = (void *)objc_opt_self();
  v12 = (void *)sub_1BA2C1448();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = a3;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BA2BA6CC;
  aBlock[3] = a4;
  v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v11, *v17, v12, v15);
  _Block_release(v15);

}

void sub_1BA2BAAEC(void *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a1)
  {
    v2 = a1;
    if (qword_1ED5B0F20 != -1)
      swift_once();
    v3 = (id)qword_1ED5B0E40;
    sub_1BA2C2390();
    sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1BA2C37C0;
    v5 = sub_1BA2C143C();
    v7 = v6;
    v8 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEA968];
    v9 = sub_1BA2291C8();
    *(_QWORD *)(v4 + 64) = v9;
    *(_QWORD *)(v4 + 32) = v5;
    *(_QWORD *)(v4 + 40) = v7;
    swift_getErrorValue();
    v10 = sub_1BA2C26E4();
    *(_QWORD *)(v4 + 96) = v8;
    *(_QWORD *)(v4 + 104) = v9;
    *(_QWORD *)(v4 + 72) = v10;
    *(_QWORD *)(v4 + 80) = v11;
    sub_1BA2C1EB0();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1ED5B0F20 != -1)
      swift_once();
    v12 = (void *)qword_1ED5B0E40;
    sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1BA2C37D0;
    v14 = v12;
    v15 = sub_1BA2C143C();
    v17 = v16;
    *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v13 + 64) = sub_1BA2291C8();
    *(_QWORD *)(v13 + 32) = v15;
    *(_QWORD *)(v13 + 40) = v17;
    sub_1BA2C239C();
    sub_1BA2C1EB0();

    swift_bridgeObjectRelease();
  }
}

void sub_1BA2BAD38()
{
  sub_1BA2BADA4((uint64_t)&unk_1E71FF198, (uint64_t)sub_1BA2BAD60, (uint64_t)&block_descriptor_6, (SEL *)&selRef_setStatusCondition_completionHandler_);
}

void sub_1BA2BAD60(void *a1)
{
  sub_1BA2BAE8C(a1);
}

void sub_1BA2BAD80()
{
  sub_1BA2BADA4((uint64_t)&unk_1E71FF238, (uint64_t)sub_1BA2BAE70, (uint64_t)&block_descriptor_18, (SEL *)&selRef_clearStatusCondition_completionHandler_);
}

void sub_1BA2BADA4(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  uint64_t v9;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_1BA2C1460() - 8) + 80);
  sub_1BA2BA99C(v4 + ((v9 + 16) & ~v9), a1, a2, a3, a4);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1BA2C1460();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_1BA2BAE70(void *a1)
{
  sub_1BA2BAE8C(a1);
}

void sub_1BA2BAE8C(void *a1)
{
  sub_1BA2C1460();
  sub_1BA2BAAEC(a1);
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackReadyToStart()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  double v3;
  float v4;
  double v5;
  double v6;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v1)
  {
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper), sel_mediaLoaded);
    v2 = *(void **)(v0 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata);
    objc_msgSend(v2, sel_naturalSize);
    v4 = v3;
    objc_msgSend(v2, sel_naturalSize);
    *(float *)&v5 = v5;
    *(float *)&v6 = v4;
    objc_msgSend(v1, sel_videoChosenWithVideoWidth_videoHeight_, v6, v5);
  }
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackStarted()()
{
  sub_1BA2BB2E4((SEL *)&selRef_mediaStarted);
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackPaused()()
{
  sub_1BA2BB270((SEL *)&selRef_mediaPausedAtPosition_);
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackResumed()()
{
  sub_1BA2BB270((SEL *)&selRef_mediaPlayedAtPosition_);
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackFinished()()
{
  sub_1BA2BB2E4((SEL *)&selRef_mediaFinished);
}

void VideoAdProviderMetricsHelper.playbackFailedWithError(_:)(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_diagnosticMetricsHelper);
  if (a1)
  {
    swift_getErrorValue();
    sub_1BA2C26E4();
  }
  v3 = (void *)sub_1BA2C212C();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_mediaPlaybackFailedWithReason_, v3);

}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.enteredFullscreen()()
{
  sub_1BA2BB09C((SEL *)&selRef_mediaExpandedAtPosition_fullScreen_, 1);
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.exitedFullscreen()()
{
  sub_1BA2BB09C((SEL *)&selRef_mediaContractedAtPosition_fullScreen_, 0);
}

SEL *sub_1BA2BB09C(SEL *result, char a2)
{
  uint64_t v2;
  void *v3;
  SEL *v5;

  v3 = *(void **)(v2 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v3)
  {
    v5 = result;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
    return (SEL *)objc_msgSend(v3, *v5, a2 & 1);
  }
  return result;
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.muteStateChanged(_:)(Swift::Bool a1)
{
  uint64_t v1;
  void *v2;

  if (!a1)
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_volume);
  v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v2)
  {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
    objc_msgSend(v2, sel_mediaVolumeChangedAtPosition_volume_);
  }
}

id VideoAdProviderMetricsHelper.playbackPassed(quartile:)(id result)
{
  uint64_t v1;
  uint64_t v2;

  if (result == (id)3)
  {
    result = *(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (!result)
      return result;
    v2 = 75;
    return objc_msgSend(result, sel_mediaProgress_, v2);
  }
  if (result == (id)2)
  {
    result = *(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (!result)
      return result;
    v2 = 50;
    return objc_msgSend(result, sel_mediaProgress_, v2);
  }
  if (result == (id)1)
  {
    result = *(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (result)
    {
      v2 = 25;
      return objc_msgSend(result, sel_mediaProgress_, v2);
    }
  }
  return result;
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.tapped(toToggleControlVisibility:)(Swift::Bool toToggleControlVisibility)
{
  uint64_t v1;
  void *v2;

  if (!toToggleControlVisibility)
  {
    v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (v2)
    {
      objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
      objc_msgSend(v2, sel_mediaShowControlsAtPosition_);
    }
  }
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.skipped()()
{
  sub_1BA2BB270((SEL *)&selRef_mediaSkippedAtPosition_);
}

SEL *sub_1BA2BB270(SEL *result)
{
  uint64_t v1;
  void *v2;
  SEL *v3;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v2)
  {
    v3 = result;
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
    return (SEL *)objc_msgSend(v2, *v3);
  }
  return result;
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.willUnload()()
{
  sub_1BA2BB2E4((SEL *)&selRef_mediaUserExitedArticle);
}

SEL *sub_1BA2BB2E4(SEL *result)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper))
    return (SEL *)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper), *result);
  return result;
}

id VideoAdProviderMetricsHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void VideoAdProviderMetricsHelper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id VideoAdProviderMetricsHelper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VideoAdProviderMetricsHelper()
{
  return objc_opt_self();
}

uint64_t method lookup function for VideoAdProviderMetricsHelper()
{
  return swift_lookUpClassMethod();
}

void sub_1BA2BB574(char *a1, uint64_t a2, SEL *a3, char a4)
{
  void *v4;
  void *v7;
  char *v8;

  v4 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper];
  if (v4)
  {
    v7 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata];
    v8 = a1;
    objc_msgSend(v7, sel_time);
    objc_msgSend(v4, *a3, a4 & 1);

  }
}

void sub_1BA2BB708(char *a1, uint64_t a2, SEL *a3)
{
  void *v3;
  void *v5;
  char *v6;

  v3 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper];
  if (v3)
  {
    v5 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata];
    v6 = a1;
    objc_msgSend(v5, sel_time);
    objc_msgSend(v3, *a3);

  }
}

id sub_1BA2BB79C(uint64_t a1, uint64_t a2, SEL *a3)
{
  id result;

  result = *(id *)(a1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (result)
    return objc_msgSend(result, *a3);
  return result;
}

uint64_t VideoAdProviderFactory.prerollAdRequester.getter@<X0>(uint64_t a1@<X8>)
{
  char *v1;

  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1)
                                                                            + 0x58)
                                                                - 8)
                                                    + 16))(a1, &v1[*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1) + 0x90)]);
}

void VideoAdProviderFactory.__allocating_init(adManager:adRequestStore:journal:appConfigurationManager:prerollAdRequester:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  objc_class *v6;
  id v12;

  v6 = v5;
  v12 = objc_allocWithZone(v6);
  sub_1BA2BC2D4(a1, a2, a3, a4, a5);
}

uint64_t sub_1BA2BB83C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))(v2);
  return a1;
}

void sub_1BA2BB86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[9];
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _UNKNOWN **v28;

  v18 = a4;
  v14[8] = a3;
  v22 = a1;
  v5 = *MEMORY[0x1E0DEEDD8] & *v4;
  v6 = type metadata accessor for PrerollAdPlacement();
  v7 = MEMORY[0x1E0C80A78](v6);
  v17 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v19 = (char *)v14 - v9;
  v15 = type metadata accessor for PrerollAd();
  v10 = MEMORY[0x1E0C80A78](v15);
  v16 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v20 = (char *)v14 - v12;
  v21 = v6;
  v13 = *(_QWORD *)(v5 + 96);
  v24 = *(_QWORD *)(v5 + 80);
  v25 = v24;
  v26 = v6;
  v23 = v13;
  v27 = v13;
  v28 = &protocol witness table for PrerollAdPlacement;
  type metadata accessor for AdRequest();
}

void sub_1BA2BB998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = sub_1BA2C245C();
  v12 = MEMORY[0x1E0C80A78](v11);
  *(_QWORD *)(v10 - 208) = (char *)&a9 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  MEMORY[0x1E0C80A78](v14);
  *(_QWORD *)(v10 - 152) = v9;
  *(_BYTE *)(v10 - 144) = 0;
  AdRequestStore.request(for:behavior:)();
}

uint64_t sub_1BA2BBA48()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t *, uint64_t, uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD, uint64_t *, _QWORD, uint64_t, _QWORD, _QWORD, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v28;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  _QWORD *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  id v44;

  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v6, 1, v4) != 1)
  {
    *(_QWORD *)(v9 - 288) = v8;
    *(_QWORD *)(v9 - 280) = v7;
    *(_QWORD *)(v9 - 240) = v2;
    *(_QWORD *)(v9 - 264) = v3;
    v15 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32);
    *(_QWORD *)(v9 - 272) = v4;
    v15(v0, v6, v4);
    if (qword_1ED5B2DB0 != -1)
      swift_once();
    v16 = (id)qword_1ED5B2888;
    sub_1BA2C2384();
    sub_1BA22D5D8();
    v18 = v17;
    v19 = swift_allocObject();
    *(_OWORD *)(v9 - 320) = xmmword_1BA2C37C0;
    *(_OWORD *)(v19 + 16) = xmmword_1BA2C37C0;
    v20 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v19 + 56) = MEMORY[0x1E0DEA968];
    v21 = sub_1BA2291C8();
    *(_QWORD *)(v9 - 296) = v1;
    *(_QWORD *)(v19 + 32) = v1;
    *(_QWORD *)(v19 + 40) = v5;
    v22 = *v0;
    v23 = v0[1];
    *(_QWORD *)(v19 + 96) = v20;
    *(_QWORD *)(v19 + 104) = v21;
    *(_QWORD *)(v19 + 64) = v21;
    *(_QWORD *)(v19 + 72) = v22;
    *(_QWORD *)(v19 + 80) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BA2C1EB0();

    swift_bridgeObjectRelease();
    v24 = (_QWORD *)(*(_QWORD *)(v9 - 240) + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v9 - 240)) + 0x70));
    v25 = v24[3];
    v26 = v24[4];
    __swift_project_boxed_opaque_existential_1(v24, v25);
    v27 = *(void (**)(_QWORD, uint64_t *, _QWORD, uint64_t, _QWORD, _QWORD, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v26 + 24);
    v28 = type metadata accessor for PrerollAdProvider();
    v27(*(_QWORD *)(v9 - 176), v0, *(_QWORD *)(v9 - 160), v28, *(_QWORD *)(v9 - 184), *(_QWORD *)(v9 - 168), &protocol witness table for PrerollAdProvider, &protocol witness table for PrerollAdPlacement, v25, v26);
    *(_QWORD *)(v9 - 184) = v18;
    *(_QWORD *)(v9 - 208) = v21;
    v30 = *(_QWORD **)(v9 - 144);
    v31 = *(_QWORD *)(v9 - 200);
    sub_1BA24AA98(*(_QWORD *)(v9 - 152), v31, (uint64_t (*)(_QWORD))type metadata accessor for PrerollAdPlacement);
    v32 = v30[5];
    v33 = v30[6];
    *(_QWORD *)(v9 - 176) = v30;
    __swift_project_boxed_opaque_existential_1(v30 + 2, v32);
    v34 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(v32, v33);
    v35 = objc_msgSend(v34, sel_promotedContentVideo);

    v36 = *(_QWORD **)(v9 - 192);
    sub_1BA24AA98(v31, (uint64_t)v36 + *(int *)(*(_QWORD *)(v9 - 248) + 24), (uint64_t (*)(_QWORD))type metadata accessor for PrerollAdPlacement);
    *v36 = v35;
    v37 = v35;
    v38 = objc_msgSend(v37, sel_promotedContentInfo);
    if (v38)
    {
      v39 = v38;
      v40 = sub_1BA2C1A00();
      v42 = v41;

    }
    else
    {

      v40 = 0;
      v42 = 0xE000000000000000;
    }
    sub_1BA258A50(*(_QWORD *)(v9 - 200), (uint64_t (*)(_QWORD))type metadata accessor for PrerollAdPlacement);
    v43 = *(_QWORD *)(v9 - 192);
    *(_QWORD *)(v43 + 8) = v40;
    *(_QWORD *)(v43 + 16) = v42;
    type metadata accessor for VideoAdInteractionPresentationHandler();
    *(_QWORD *)(v9 - 200) = swift_allocObject();
    swift_unknownObjectUnownedInit();
    v44 = *(id *)v43;
    swift_retain();
    sub_1BA2C1E68();

    Journal.addRequestedEntry(request:placementIdentifier:contentIdentifier:)();
  }
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v10 = (id)qword_1ED5B2888;
  sub_1BA2C2390();
  sub_1BA22D5D8();
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1BA2C37D0;
  v12 = *(uint64_t **)(v9 - 152);
  v14 = *v12;
  v13 = v12[1];
  *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v11 + 64) = sub_1BA2291C8();
  *(_QWORD *)(v11 + 32) = v14;
  *(_QWORD *)(v11 + 40) = v13;
  swift_bridgeObjectRetain();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  return 0;
}

id VideoAdProviderFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void VideoAdProviderFactory.init()()
{
  sub_1BA2BC3E8();
}

void sub_1BA2BC1B4()
{
  sub_1BA2BC3E8();
}

void VideoAdProviderFactory.__deallocating_deinit()
{
  type metadata accessor for VideoAdProviderFactory();
}

id sub_1BA2BC208(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

uint64_t sub_1BA2BC228(char *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = *MEMORY[0x1E0DEEDD8] & *(_QWORD *)a1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[*(_QWORD *)(v3 + 0x70)]);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 88) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1) + 0x90)]);
}

void sub_1BA2BC2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  _QWORD *v10;
  uint64_t v11;

  v10 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v11 = *MEMORY[0x1E0DEEDD8] & *(_QWORD *)v5;
  sub_1BA22068C(a1, (uint64_t)&v5[*(_QWORD *)(v11 + 0x70)]);
  *(_QWORD *)&v5[*(_QWORD *)((*v10 & *(_QWORD *)v5) + 0x78)] = a2;
  *(_QWORD *)&v5[*(_QWORD *)((*v10 & *(_QWORD *)v5) + 0x80)] = a3;
  *(_QWORD *)&v5[*(_QWORD *)((*v10 & *(_QWORD *)v5) + 0x88)] = a4;
  (*(void (**)(char *, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v11 + 88) - 8) + 16))(&v5[*(_QWORD *)((*v10 & *(_QWORD *)v5) + 0x90)], a5, *(_QWORD *)(v11 + 88));
  type metadata accessor for VideoAdProviderFactory();
}

id sub_1BA2BC3A8(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  void *v24;
  id v25;
  objc_super v27;

  v27.receiver = v24;
  v27.super_class = a1;
  v25 = -[objc_class init](&v27, sel_init);
  __swift_destroy_boxed_opaque_existential_1(v23);
  return v25;
}

void sub_1BA2BC3E8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t method lookup function for VideoAdProviderFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VideoAdProviderFactory.__allocating_init(adManager:adRequestStore:journal:appConfigurationManager:prerollAdRequester:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of VideoAdProviderFactory.createVideoAdProvider(for:placement:videoPlayerViewController:videoAdTracker:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t InterstitialAdData.articlesSeenSinceLastInterstitial.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

NewsAds::InterstitialAdData __swiftcall InterstitialAdData.init(articlesSeenSinceLastInterstitial:)(NewsAds::InterstitialAdData articlesSeenSinceLastInterstitial)
{
  NewsAds::InterstitialAdData *v1;

  v1->articlesSeenSinceLastInterstitial = articlesSeenSinceLastInterstitial.articlesSeenSinceLastInterstitial;
  return articlesSeenSinceLastInterstitial;
}

unint64_t sub_1BA2BC454()
{
  return 0xD000000000000021;
}

uint64_t sub_1BA2BC470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA2BCA4C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1BA2BC498()
{
  sub_1BA2BC5D8();
  return sub_1BA2C275C();
}

uint64_t sub_1BA2BC4C0()
{
  sub_1BA2BC5D8();
  return sub_1BA2C2768();
}

uint64_t InterstitialAdData.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BA2BC73C(0, &qword_1EF2803A0, MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2BC5D8();
  sub_1BA2C2750();
  sub_1BA2C2678();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1BA2BC5D8()
{
  unint64_t result;

  result = qword_1EF2803A8;
  if (!qword_1EF2803A8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CCC78, &type metadata for InterstitialAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF2803A8);
  }
  return result;
}

uint64_t InterstitialAdData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  sub_1BA2BC73C(0, &qword_1EF2803B0, MEMORY[0x1E0DED048]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v12 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2BC5D8();
  sub_1BA2C2744();
  if (!v2)
  {
    v10 = sub_1BA2C2624();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BA2BC73C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA2BC5D8();
    v7 = a3(a1, &type metadata for InterstitialAdData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BA2BC798(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA29B8F0();
  result = sub_1BA29A80C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BA2BC7C4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return InterstitialAdData.init(from:)(a1, a2);
}

uint64_t sub_1BA2BC7D8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1BA2BC73C(0, &qword_1EF2803A0, MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2BC5D8();
  sub_1BA2C2750();
  sub_1BA2C2678();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

ValueMetadata *type metadata accessor for InterstitialAdData()
{
  return &type metadata for InterstitialAdData;
}

uint64_t storeEnumTagSinglePayload for InterstitialAdData.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA2BC918 + 4 * byte_1BA2CCB20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA2BC938 + 4 * byte_1BA2CCB25[v4]))();
}

_BYTE *sub_1BA2BC918(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA2BC938(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2BC940(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2BC948(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2BC950(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2BC958(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for InterstitialAdData.CodingKeys()
{
  return &type metadata for InterstitialAdData.CodingKeys;
}

unint64_t sub_1BA2BC978()
{
  unint64_t result;

  result = qword_1EF2803B8;
  if (!qword_1EF2803B8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CCC50, &type metadata for InterstitialAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF2803B8);
  }
  return result;
}

unint64_t sub_1BA2BC9C0()
{
  unint64_t result;

  result = qword_1EF2803C0;
  if (!qword_1EF2803C0)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CCBC0, &type metadata for InterstitialAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF2803C0);
  }
  return result;
}

unint64_t sub_1BA2BCA08()
{
  unint64_t result;

  result = qword_1EF2803C8;
  if (!qword_1EF2803C8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CCBE8, &type metadata for InterstitialAdData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF2803C8);
  }
  return result;
}

uint64_t sub_1BA2BCA4C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000021 && a2 == 0x80000001BA2D2D80)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1BA2C26A8();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1BA2BCAD0(uint64_t a1, unsigned __int8 *a2)
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  v3 = *a2;
  v4 = (void *)objc_opt_self();
  v5 = MEMORY[0x1E0DEA968];
  v6 = (void *)sub_1BA2C2270();
  objc_msgSend(v4, sel_addClientToSegments_replaceExisting_privateSegment_, v6, 1, v3 ^ 1u);

  if (qword_1ED5B0F18 != -1)
    swift_once();
  v7 = (void *)qword_1ED5B0E38;
  sub_1BA22D5D8();
  v8 = swift_allocObject();
  v9 = (_QWORD *)v8;
  *(_OWORD *)(v8 + 16) = xmmword_1BA2C37C0;
  v10 = v3 == 0;
  if (v3)
    v11 = 0x63696C627570;
  else
    v11 = 0x65746176697270;
  if (v10)
    v12 = 0xE700000000000000;
  else
    v12 = 0xE600000000000000;
  *(_QWORD *)(v8 + 56) = v5;
  *(_QWORD *)(v8 + 64) = sub_1BA2291C8();
  v9[4] = v11;
  v9[5] = v12;
  sub_1BA234914();
  v9[12] = v13;
  v9[13] = sub_1BA24BCDC();
  v9[9] = a1;
  v14 = v7;
  swift_bridgeObjectRetain();
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA2BCC38(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA243568();
  result = sub_1BA2C176C();
  if (v4)
  {
    type metadata accessor for PrerollAdProvider();
    v2 = swift_allocObject();
    sub_1BA21D3D4(&v3, v2 + 16);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BA2BCCC0()
{
  type metadata accessor for ArticleBannerAdProvider();
  sub_1BA2C1844();
  swift_release();
  type metadata accessor for FeedBannerAdProvider();
  sub_1BA2C1844();
  swift_release();
  type metadata accessor for InterstitialAdProvider();
  sub_1BA2C1844();
  swift_release();
  type metadata accessor for NativeAdProvider();
  sub_1BA2C1844();
  swift_release();
  type metadata accessor for SponsorshipAdProvider();
  sub_1BA2C1844();
  return swift_release();
}

uint64_t sub_1BA2BCDA0(_QWORD *a1)
{
  return sub_1BA2BCDB8(a1, (void (*)(_QWORD))type metadata accessor for ArticleBannerAdProvider);
}

uint64_t sub_1BA2BCDAC(_QWORD *a1)
{
  return sub_1BA2BCDB8(a1, (void (*)(_QWORD))type metadata accessor for FeedBannerAdProvider);
}

uint64_t sub_1BA2BCDB8(_QWORD *a1, void (*a2)(_QWORD))
{
  uint64_t result;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA243568();
  result = sub_1BA2C176C();
  if (v6)
  {
    a2(0);
    v4 = swift_allocObject();
    type metadata accessor for DebugBannerAdProvider();
    swift_allocObject();
    *(_QWORD *)(v4 + 56) = sub_1BA2BA49C();
    sub_1BA21D3D4(&v5, v4 + 16);
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BA2BCE64(_QWORD *a1)
{
  return sub_1BA2BCE7C(a1, (void (*)(_QWORD))type metadata accessor for InterstitialAdProvider);
}

uint64_t sub_1BA2BCE70(_QWORD *a1)
{
  return sub_1BA2BCE7C(a1, (void (*)(_QWORD))type metadata accessor for NativeAdProvider);
}

uint64_t sub_1BA2BCE7C(_QWORD *a1, void (*a2)(_QWORD))
{
  uint64_t result;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA243568();
  result = sub_1BA2C176C();
  if (v6)
  {
    a2(0);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 56) = 0;
    sub_1BA21D3D4(&v5, v4 + 16);
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BA2BCF0C(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA243568();
  result = sub_1BA2C176C();
  if (v4)
  {
    type metadata accessor for SponsorshipAdProvider();
    v2 = swift_allocObject();
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_QWORD *)(v2 + 88) = 0;
    sub_1BA21D3D4(&v3, v2 + 16);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t AdPlacementPolicyValidator.__allocating_init(layoutEnvironmentProvider:viewportEnvironmentProvider:)(__int128 *a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  AdPlacementPolicyValidator.init(layoutEnvironmentProvider:viewportEnvironmentProvider:)(a1, a2);
  return v4;
}

uint64_t AdPlacementPolicyValidator.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t AdPlacementPolicyValidator.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_1BA2BD070(uint64_t *a1)
{
  return AdPlacementPolicyValidator.validatePlacement(_:)(a1);
}

uint64_t AdPlacementPolicyValidator.validatePlacement(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;

  v2 = *a1;
  v1 = a1[1];
  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v3 = (void *)qword_1ED5B2888;
  sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2C37C0;
  v5 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEA968];
  v6 = sub_1BA2291C8();
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 32) = v2;
  *(_QWORD *)(v4 + 40) = v1;
  type metadata accessor for CGPoint(0);
  v7 = v3;
  swift_bridgeObjectRetain();
  sub_1BA2C2570();
  *(_QWORD *)(v4 + 96) = v5;
  *(_QWORD *)(v4 + 104) = v6;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0xE000000000000000;
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  if (qword_1ED5B2D50 != -1)
    swift_once();
  sub_1BA223FC4(&qword_1ED5B24D8, v8, (uint64_t (*)(uint64_t))type metadata accessor for AdPlacementPolicyValidator, (uint64_t)&protocol conformance descriptor for AdPlacementPolicyValidator);
  sub_1BA2C14FC();
  sub_1BA22920C(0, (unint64_t *)&qword_1ED5B14B8, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DB4D08]);
  swift_allocObject();
  return sub_1BA2C197C();
}

uint64_t sub_1BA2BD354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, double a9, double a10)
{
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, _QWORD);
  _QWORD **v23;
  _QWORD *v24;
  _QWORD *v25;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t result;
  void (*v31)(uint64_t);
  uint64_t v32;
  _QWORD v33[4];

  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a1;
  *(_QWORD *)(v20 + 24) = a2;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a5;
  *(_QWORD *)(v21 + 24) = a6;
  *(_QWORD *)(v21 + 32) = a7;
  *(double *)(v21 + 40) = a9;
  *(double *)(v21 + 48) = a10;
  *(_QWORD *)(v21 + 56) = a3;
  *(_QWORD *)(v21 + 64) = a4;
  *(_QWORD *)(v21 + 72) = sub_1BA24E1D0;
  *(_QWORD *)(v21 + 80) = v20;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v22 = (void (*)(_QWORD *, _QWORD))sub_1BA2C1910();
  v24 = v23;
  v25 = *v23;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v24 = v25;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v25 = sub_1BA23FA98(0, v25[2] + 1, 1, v25);
    *v24 = v25;
  }
  v28 = v25[2];
  v27 = v25[3];
  if (v28 >= v27 >> 1)
  {
    v25 = sub_1BA23FA98((_QWORD *)(v27 > 1), v28 + 1, 1, v25);
    *v24 = v25;
  }
  v25[2] = v28 + 1;
  v29 = &v25[2 * v28];
  v29[4] = sub_1BA2BDF10;
  v29[5] = v21;
  v22(v33, 0);
  result = swift_release();
  if ((a8 & 1) != 0)
  {
    swift_retain();
    sub_1BA2C191C();
    swift_release();
    if (*(_QWORD *)(v33[0] + 16))
    {
      v31 = *(void (**)(uint64_t))(v33[0] + 32);
      swift_retain();
      v32 = swift_bridgeObjectRelease();
      v31(v32);
      return swift_release();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1BA2BD53C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1BA2BD354(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_BYTE *)(v4 + 56), *(double *)(v4 + 40), *(double *)(v4 + 48));
}

uint64_t sub_1BA2BD550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  sub_1BA2BDF40();
  sub_1BA2C19A0();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  *(double *)(v17 + 32) = a8;
  *(double *)(v17 + 40) = a9;
  *(_QWORD *)(v17 + 48) = a4;
  *(_QWORD *)(v17 + 56) = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  v18 = (void *)sub_1BA2C18F8();
  sub_1BA2C1964();
  swift_release();
  swift_release();

  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a1;
  *(_QWORD *)(v19 + 24) = a2;
  *(_QWORD *)(v19 + 32) = a3;
  *(double *)(v19 + 40) = a8;
  *(double *)(v19 + 48) = a9;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_1BA2BE00C;
  *(_QWORD *)(v20 + 24) = v19;
  sub_1BA22920C(0, &qword_1ED5B2B58, (uint64_t)&type metadata for AdPolicyFailure, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BA2C1958();
  swift_release();
  swift_release();
  sub_1BA21D258();
  v21 = (void *)sub_1BA2C23D8();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a2;
  *(_QWORD *)(v22 + 24) = a3;
  *(double *)(v22 + 32) = a8;
  *(double *)(v22 + 40) = a9;
  *(_QWORD *)(v22 + 48) = a4;
  *(_QWORD *)(v22 + 56) = a5;
  *(_QWORD *)(v22 + 64) = a6;
  *(_QWORD *)(v22 + 72) = a7;
  *(_QWORD *)(v22 + 80) = a1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1BA2C1958();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1BA2BD78C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = a1[5];
  v3 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  v4 = a1 + 7;
  v6 = a1[10];
  v5 = a1[11];
  __swift_project_boxed_opaque_existential_1(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v5);
  v7 = (void *)sub_1BA2C18F8();
  v8 = sub_1BA2C18EC();
  swift_release();
  swift_release();

  return v8;
}

void sub_1BA2BD840(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *))
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v7 = (void *)qword_1ED5B2888;
  sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BA2C37C0;
  v9 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
  v10 = sub_1BA2291C8();
  *(_QWORD *)(v8 + 64) = v10;
  *(_QWORD *)(v8 + 32) = a2;
  *(_QWORD *)(v8 + 40) = a3;
  swift_getErrorValue();
  v11 = v7;
  swift_bridgeObjectRetain();
  v12 = sub_1BA2C26E4();
  *(_QWORD *)(v8 + 96) = v9;
  *(_QWORD *)(v8 + 104) = v10;
  *(_QWORD *)(v8 + 72) = v12;
  *(_QWORD *)(v8 + 80) = v13;
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  sub_1BA2BE0E0();
  v14 = (void *)swift_allocError();
  *(_QWORD *)v15 = a1;
  *(_QWORD *)(v15 + 8) = 0;
  *(_BYTE *)(v15 + 16) = 0;
  v16 = a1;
  a4(v14);

}

char *sub_1BA2BD9D8(uint64_t *a1, __int128 *a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v11 = a2[1];
  v18 = *a2;
  v19 = v11;
  v12 = a2[3];
  v20 = a2[2];
  v21 = v12;
  v13 = a2[5];
  v22 = a2[4];
  v23 = v13;
  v17 = *a1;
  v24 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = swift_bridgeObjectRetain();
  v15 = sub_1BA24BB24(v14, a6, a7, (uint64_t)&v17, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1BA2BDAA0(uint64_t *a1, uint64_t a2, void *a3, void (*a4)(void *), uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  void (**v12)(uint64_t);
  void (*v13)(uint64_t);
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *, _QWORD);
  void (*v31)(uint64_t);
  uint64_t v32;
  _QWORD v36[6];

  v7 = a3;
  v8 = a2;
  v9 = *a1;
  v10 = *(_QWORD *)(*a1 + 16);
  if (!v10)
  {
    v13 = a6;
    if (qword_1ED5B2DB0 != -1)
      goto LABEL_18;
    goto LABEL_10;
  }
  v36[5] = v6;
  v36[0] = MEMORY[0x1E0DEE9D8];
  sub_1BA24B61C(0, v10, 0);
  v11 = v36[0];
  v12 = (void (**)(uint64_t))(v9 + 80);
  do
  {
    v8 = (uint64_t)*(v12 - 1);
    v13 = *v12;
    v36[0] = v11;
    v15 = *(_QWORD *)(v11 + 16);
    v14 = *(_QWORD *)(v11 + 24);
    swift_bridgeObjectRetain();
    if (v15 >= v14 >> 1)
    {
      sub_1BA24B61C((char *)(v14 > 1), v15 + 1, 1);
      v11 = v36[0];
    }
    *(_QWORD *)(v11 + 16) = v15 + 1;
    v16 = v11 + 16 * v15;
    *(_QWORD *)(v16 + 32) = v8;
    *(_QWORD *)(v16 + 40) = v13;
    v12 += 8;
    --v10;
  }
  while (v10);
  if (qword_1ED5B2DB0 != -1)
    swift_once();
  v7 = (id)qword_1ED5B2888;
  sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1BA2C37C0;
  v18 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v17 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v17 + 64) = sub_1BA2291C8();
  *(_QWORD *)(v17 + 32) = a2;
  *(_QWORD *)(v17 + 40) = a3;
  sub_1BA22920C(0, (unint64_t *)&qword_1ED5B2B70, v18, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  *(_QWORD *)(v17 + 96) = v19;
  *(_QWORD *)(v17 + 104) = sub_1BA24BCDC();
  *(_QWORD *)(v17 + 72) = v11;
  v20 = v7;
  swift_bridgeObjectRetain();
  sub_1BA2C239C();
  sub_1BA2C1EB0();

  swift_bridgeObjectRelease();
  sub_1BA2BE0E0();
  v21 = (void *)swift_allocError();
  *(_QWORD *)v22 = v9;
  *(_QWORD *)(v22 + 8) = 0;
  *(_BYTE *)(v22 + 16) = 1;
  swift_bridgeObjectRetain();
  a4(v21);

  while (1)
  {
    swift_retain();
    sub_1BA2C191C();
    swift_release();
    v26 = *(_QWORD *)(v36[0] + 16);
    result = swift_bridgeObjectRelease();
    if (!v26)
      break;
    swift_retain();
    v28 = sub_1BA2C1910();
    if (*(_QWORD *)(*(_QWORD *)v29 + 16))
    {
      v30 = (void (*)(_QWORD *, _QWORD))v28;
      sub_1BA2BE124(0, 1);
      v30(v36, 0);
      swift_release();
      swift_retain();
      sub_1BA2C191C();
      swift_release();
      if (!*(_QWORD *)(v36[0] + 16))
        return swift_bridgeObjectRelease();
      v31 = *(void (**)(uint64_t))(v36[0] + 32);
      swift_retain();
      v32 = swift_bridgeObjectRelease();
      v31(v32);
      return swift_release();
    }
    __break(1u);
LABEL_18:
    swift_once();
LABEL_10:
    v23 = (void *)qword_1ED5B2888;
    sub_1BA22053C(0, (unint64_t *)&qword_1ED5B2CC0, (uint64_t (*)(uint64_t))sub_1BA2395A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1BA2C37D0;
    *(_QWORD *)(v24 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v24 + 64) = sub_1BA2291C8();
    *(_QWORD *)(v24 + 32) = v8;
    *(_QWORD *)(v24 + 40) = v7;
    swift_bridgeObjectRetain();
    v7 = v23;
    sub_1BA2C239C();
    sub_1BA2C1EB0();

    v25 = swift_bridgeObjectRelease();
    v13(v25);
  }
  return result;
}

uint64_t sub_1BA2BDE8C()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

uint64_t dispatch thunk of AdPlacementPolicyValidatorType.validatePlacement(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t method lookup function for AdPlacementPolicyValidator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AdPlacementPolicyValidator.__allocating_init(layoutEnvironmentProvider:viewportEnvironmentProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1BA2BDED4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA2BDF10()
{
  uint64_t v0;

  return sub_1BA2BD550(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_1BA2BDF28()
{
  _QWORD *v0;

  return sub_1BA2BD78C(v0);
}

void sub_1BA2BDF40()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED5B23B0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED5B23B0);
  }
}

uint64_t sub_1BA2BDFA4()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1BA2BDFD0(void *a1)
{
  uint64_t v1;

  sub_1BA2BD840(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(void *))(v1 + 48));
}

uint64_t sub_1BA2BDFE0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

char *sub_1BA2BE00C(uint64_t *a1, __int128 *a2)
{
  uint64_t v2;

  return sub_1BA2BD9D8(a1, a2, *(double *)(v2 + 40), *(double *)(v2 + 48), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_1BA2BE01C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA2BE040@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(a1, a1 + 8);
  *a2 = result;
  return result;
}

uint64_t sub_1BA2BE07C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA2BE0B8(uint64_t *a1)
{
  uint64_t v1;

  return sub_1BA2BDAA0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(void *))(v1 + 48), *(_QWORD *)(v1 + 56), *(void (**)(uint64_t))(v1 + 64));
}

unint64_t sub_1BA2BE0E0()
{
  unint64_t result;

  result = qword_1ED5B1958;
  if (!qword_1ED5B1958)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for AdPolicyErrors, &type metadata for AdPolicyErrors);
    atomic_store(result, (unint64_t *)&qword_1ED5B1958);
  }
  return result;
}

uint64_t sub_1BA2BE124(uint64_t result, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_1BA23FA98(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  sub_1BA2346CC();
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_19;
  v12 = v4[2];
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_25;
  v15 = (char *)&v4[2 * a2 + 4];
  if (v6 != a2 || &v4[2 * v6 + 4] >= (_QWORD *)&v15[16 * v14])
    result = (uint64_t)memmove(&v4[2 * v6 + 4], v15, 16 * v14);
  v16 = v4[2];
  v13 = __OFADD__(v16, v8);
  v17 = v16 - v7;
  if (!v13)
  {
    v4[2] = v17;
LABEL_19:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

id DebugJournalViewController.__allocating_init(commandCenter:journal:presentationOptions:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  id v10;

  v9 = objc_allocWithZone(v4);
  v10 = sub_1BA2C090C(a1, a2, a3, a4);
  swift_unknownObjectRelease();
  return v10;
}

uint64_t static DebugJournalViewController.PresentationOptions.== infix(_:_:)()
{
  return 1;
}

uint64_t DebugJournalViewController.PresentationOptions.hash(into:)()
{
  return sub_1BA2C272C();
}

uint64_t DebugJournalViewController.PresentationOptions.hashValue.getter()
{
  sub_1BA2C2720();
  sub_1BA2C272C();
  return sub_1BA2C2738();
}

unint64_t sub_1BA2BE314@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1BA2C0D28(*a1);
  *a2 = result;
  return result;
}

void sub_1BA2BE33C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_1BA2BE348(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E71F5188;
}

uint64_t DebugJournalViewController.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

id DebugJournalViewController.init(commandCenter:journal:presentationOptions:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  id v4;

  v4 = sub_1BA2C090C(a1, a2, a3, a4);
  swift_unknownObjectRelease();
  return v4;
}

Swift::Void __swiftcall DebugJournalViewController.viewDidLoad()()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v1 = v0;
  v9.receiver = v0;
  v9.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  v2 = *(void **)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
  objc_msgSend(v2, sel_setDataSource_, v1);
  objc_msgSend(v2, sel_setDelegate_, v1);
  sub_1BA21DEE0(0, &qword_1EF2803E0);
  sub_1BA2C2378();
  type metadata accessor for DebugJournalValueTableViewCell();
  sub_1BA2C2378();
  type metadata accessor for DebugJournalSubtitleTableViewCell();
  sub_1BA2C2378();
  v3 = objc_msgSend(v1, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, v2);

    objc_msgSend(v2, sel_reloadData);
    v5 = objc_msgSend(v1, sel_navigationItem);
    v6 = (void *)sub_1BA2C212C();
    objc_msgSend(v5, sel_setTitle_, v6);

    v7 = objc_msgSend(v1, sel_navigationItem);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 0, v1, sel_handleDone);
    objc_msgSend(v7, sel_setRightBarButtonItem_, v8);

  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall DebugJournalViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  void *v17;
  void (*v18)(char *, char *, uint64_t);
  void *v19;
  objc_super v20;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BA22053C(0, &qword_1EF2803F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v20 - v6;
  v8 = sub_1BA2C14C0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v20 - v13;
  v20.receiver = v2;
  v20.super_class = ObjectType;
  objc_msgSendSuper2(&v20, sel_viewDidAppear_, a1);
  v15 = *(void **)&v2[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
  v16 = objc_msgSend(v15, sel_indexPathForSelectedRow);
  if (v16)
  {
    v17 = v16;
    sub_1BA2C149C();

    v18 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v18(v7, v12, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v18(v14, v7, v8);
      v19 = (void *)sub_1BA2C1490();
      objc_msgSend(v15, sel_deselectRowAtIndexPath_animated_, v19, 1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1BA2C1158((uint64_t)v7, (uint64_t)&qword_1EF2803F0, (uint64_t)MEMORY[0x1E0CB1658], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BA22053C);
}

Swift::Void __swiftcall DebugJournalViewController.viewDidLayoutSubviews()()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_viewDidLayoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
  v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_bounds);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
  }
  else
  {
    __break(1u);
  }
}

id DebugJournalViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1BA2C212C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void DebugJournalViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA2BEBD4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

void DebugJournalViewController.tableView(_:didSelectRowAt:)()
{
  void *v0;
  void *v1;
  unint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_1BA2C14B4();
  v3 = v1;
  v4 = sub_1BA2C0A88((uint64_t)&unk_1E71F51B0);

  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v2 < *(_QWORD *)(v4 + 16))
  {
    v5 = *(unsigned __int8 *)(v4 + v2 + 32);
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  __break(1u);
  JUMPOUT(0x1BA2BF1F4);
}

uint64_t sub_1BA2BF218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;

  v1 = v0;
  v28 = sub_1BA2C1F40();
  v27 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v3 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1BA2C1EEC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1BA22053C(0, (unint64_t *)&unk_1EF280570, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB74E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v26 - v10;
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DBC2A8];
  sub_1BA22053C(0, &qword_1EF27F898, (uint64_t (*)(uint64_t))MEMORY[0x1E0DBC2A8], v8);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v26 - v14;
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter);
  v26[2] = *(_QWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter + 8);
  v26[1] = v16;
  v26[0] = swift_getObjectType();
  sub_1BA22053C(0, &qword_1EF280580, v12, MEMORY[0x1E0DBC428]);
  sub_1BA2C1FD0();
  if (qword_1EF27E388 != -1)
    swift_once();
  v17 = sub_1BA2C1EC8();
  v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1EF27EE80);
  v19 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v11, v18, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v17);
  v20 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112);
  v35 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 96);
  v36 = v20;
  v37 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128);
  v21 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 48);
  v31 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 32);
  v32 = v21;
  v22 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 80);
  v33 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 64);
  v34 = v22;
  v23 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v30 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 16);
  v29 = v23;
  sub_1BA2A7070();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DB7E20], v4);
  sub_1BA2C1F64();
  v24 = sub_1BA2C1F70();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v15, 0, 1, v24);
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v3, *MEMORY[0x1E0DB9EF8], v28);
  *((_QWORD *)&v30 + 1) = &_s7NewsAds7TrackerVN_0;
  *(_QWORD *)&v31 = sub_1BA2C1114();
  v38 = 0u;
  v39 = 0u;
  v40 = 1;
  sub_1BA2C1F34();
  swift_allocObject();
  sub_1BA2C1F28();
  sub_1BA2C1EF8();
  sub_1BA2C1158((uint64_t)v15, (uint64_t)&qword_1EF27F898, (uint64_t)MEMORY[0x1E0DBC2A8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BA22053C);
  swift_release();
  return swift_release();
}

void sub_1BA2BF620()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSString *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  char *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *boxed_opaque_existential_2;
  unint64_t v49;
  unint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD *v55;
  void *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  char *v69;
  uint64_t v70;
  int v71;
  void (*v72)(char *, char *, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;

  v1 = v0;
  v70 = sub_1BA2C13D0();
  v2 = *(_QWORD *)(v70 - 8);
  v3 = MEMORY[0x1E0C80A78](v70);
  v60 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v59 = (char *)&v55 - v5;
  sub_1BA22053C(0, (unint64_t *)&qword_1EF280590, v6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v55 - v8;
  v10 = sub_1BA2C1EE0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v55 - v15;
  v17 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 96];
  v18 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112];
  v19 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 64];
  v83 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 80];
  v84 = v17;
  v20 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128];
  v85 = v18;
  v86 = v20;
  v21 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 48];
  v80 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 32];
  v81 = v21;
  v82 = v19;
  v22 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 16];
  v78 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal];
  v79 = v22;
  v23 = sub_1BA2A7070();
  v24 = v23[2];
  v25 = MEMORY[0x1E0DEE9B8];
  if (!v24)
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  v57 = v9;
  v58 = v2;
  v56 = v1;
  v26 = (char *)v23 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v73 = *(_QWORD *)(v11 + 72);
  v72 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v71 = *MEMORY[0x1E0DB79E0];
  v68 = *MEMORY[0x1E0DB79C8];
  v55 = v23;
  swift_bridgeObjectRetain();
  v64 = 0;
  v27 = (char *)MEMORY[0x1E0DEE9D8];
  v67 = v25 + 8;
  v69 = v16;
  v63 = v11;
  do
  {
    v28 = v72;
    v72(v16, v26, v10);
    v28(v14, v16, v10);
    v29 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v14, v10);
    if (v29 == v71)
    {
      (*(void (**)(char *, uint64_t))(v11 + 96))(v14, v10);
      *((_QWORD *)&v77 + 1) = v70;
      __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v76);
      v16 = v69;
      sub_1BA2C13A0();
      swift_release();
      goto LABEL_18;
    }
    if (v29 != v68)
    {
      v77 = 0u;
      v76 = 0u;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      goto LABEL_18;
    }
    (*(void (**)(char *, uint64_t))(v11 + 96))(v14, v10);
    v30 = *(_QWORD *)v14;
    v31 = *(_QWORD *)(*(_QWORD *)v14 + 56);
    v32 = *(_QWORD *)(*(_QWORD *)v14 + 64);
    sub_1BA22068C(*(_QWORD *)v14 + 16, (uint64_t)&v78);
    __swift_project_boxed_opaque_existential_1(&v78, *((uint64_t *)&v79 + 1));
    v33 = sub_1BA2A5E38();
    if (v34 >> 60 != 15)
    {
      v61 = v30;
      v74 = v31;
      v75 = v32;
      v66 = v33;
      v65 = v34;
      swift_bridgeObjectRetain();
      sub_1BA2C21C8();
      v62 = v74;
      v35 = v75;
      v36 = NSTemporaryDirectory();
      sub_1BA2C2150();

      v37 = v60;
      sub_1BA2C13A0();
      swift_bridgeObjectRelease();
      v38 = v59;
      v62 = v35;
      sub_1BA2C13B8();
      v39 = v58;
      v40 = *(void (**)(char *, uint64_t))(v58 + 8);
      v41 = v37;
      v42 = v38;
      v40(v41, v70);
      v43 = v64;
      sub_1BA2C13F4();
      if (v43)
      {
        v40(v42, v70);

        v64 = 0;
        v44 = 1;
        v45 = (uint64_t)v57;
      }
      else
      {
        v64 = 0;
        v45 = (uint64_t)v57;
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v57, v42, v70);
        v44 = 0;
      }
      v46 = v70;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v45, v44, 1, v70);
      swift_bridgeObjectRelease();
      sub_1BA24E01C(v66, v65);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v45, 1, v46) != 1)
      {
        v47 = v70;
        *((_QWORD *)&v77 + 1) = v70;
        boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v76);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v39 + 32))(boxed_opaque_existential_2, v45, v47);
        v11 = v63;
        goto LABEL_17;
      }
      sub_1BA2C1158(v45, (uint64_t)&qword_1EF280590, (uint64_t)MEMORY[0x1E0CAFFF8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BA22053C);
    }
    v11 = v63;
    v77 = 0u;
    v76 = 0u;
LABEL_17:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
    swift_release();
    v16 = v69;
LABEL_18:
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    if (*((_QWORD *)&v77 + 1))
    {
      sub_1BA22E0C4(&v76, &v78);
      sub_1BA22E0C4(&v78, &v76);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v27 = sub_1BA23FBC8(0, *((_QWORD *)v27 + 2) + 1, 1, v27);
      v50 = *((_QWORD *)v27 + 2);
      v49 = *((_QWORD *)v27 + 3);
      if (v50 >= v49 >> 1)
        v27 = sub_1BA23FBC8((char *)(v49 > 1), v50 + 1, 1, v27);
      *((_QWORD *)v27 + 2) = v50 + 1;
      sub_1BA22E0C4(&v76, &v27[32 * v50 + 32]);
    }
    else
    {
      sub_1BA2C1158((uint64_t)&v76, (uint64_t)&unk_1ED5B2FD0, v67, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BA22920C);
    }
    v26 += v73;
    --v24;
  }
  while (v24);
  swift_bridgeObjectRelease_n();
  v1 = v56;
LABEL_26:
  v51 = objc_allocWithZone(MEMORY[0x1E0CEA2D8]);
  v52 = (void *)sub_1BA2C2270();
  swift_bridgeObjectRelease();
  sub_1BA21DEE0(0, &qword_1EF2805A0);
  v53 = (void *)sub_1BA2C2270();
  v54 = objc_msgSend(v51, sel_initWithActivityItems_applicationActivities_, v52, v53);

  objc_msgSend(v1, sel_presentViewController_animated_completion_, v54, 1, 0);
}

Swift::Int __swiftcall DebugJournalViewController.numberOfSections(in:)(UITableView *in)
{
  void *v1;
  id v2;
  uint64_t v3;
  Swift::Int v4;

  v2 = v1;
  v3 = sub_1BA2C0A88((uint64_t)&unk_1E71F51D8);

  v4 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRelease();
  return v4;
}

Swift::Int __swiftcall DebugJournalViewController.tableView(_:numberOfRowsInSection:)(UITableView *_, Swift::Int numberOfRowsInSection)
{
  Swift::Int result;

  sub_1BA2C0D38(numberOfRowsInSection);
  return result;
}

Swift::String_optional __swiftcall DebugJournalViewController.tableView(_:titleForHeaderInSection:)(UITableView *_, Swift::Int titleForHeaderInSection)
{
  uint64_t v2;
  void *v3;
  Swift::String_optional result;

  sub_1BA2C0E4C(titleForHeaderInSection);
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

void DebugJournalViewController.tableView(_:cellForRowAt:)()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0;
  v2 = sub_1BA2C2024();
  v3 = MEMORY[0x1E0C80A78](v2);
  v4 = MEMORY[0x1E0C80A78](v3);
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1BA2C14B4();
  v6 = v1;
  v7 = sub_1BA2C0A88((uint64_t)&unk_1E71F51B0);

  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v5 < *(_QWORD *)(v7 + 16))
  {
    v8 = *(unsigned __int8 *)(v7 + v5 + 32);
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  __break(1u);
  JUMPOUT(0x1BA2C06D0);
}

id sub_1BA2C0828(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  objc_class *ObjectType;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1BA2C2150();
    a4 = (void *)sub_1BA2C212C();
    swift_bridgeObjectRelease();
  }
  v11.receiver = a1;
  v11.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_, a5, a4);

  return v9;
}

id sub_1BA2C090C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_class *ObjectType;
  objc_super v24;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = *a3;
  v10 = a3[1];
  v12 = OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView;
  v13 = objc_allocWithZone(MEMORY[0x1E0DC3D48]);
  v14 = v5;
  *(_QWORD *)&v5[v12] = objc_msgSend(v13, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
  v15 = &v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_identifier];
  *(_QWORD *)v15 = v11;
  *((_QWORD *)v15 + 1) = v10;
  v16 = &v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter];
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;
  v17 = &v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal];
  *(_QWORD *)v17 = v11;
  *((_QWORD *)v17 + 1) = v10;
  v18 = *((_OWORD *)a3 + 4);
  *((_OWORD *)v17 + 3) = *((_OWORD *)a3 + 3);
  *((_OWORD *)v17 + 4) = v18;
  v19 = *((_OWORD *)a3 + 2);
  *((_OWORD *)v17 + 1) = *((_OWORD *)a3 + 1);
  *((_OWORD *)v17 + 2) = v19;
  v20 = *((_OWORD *)a3 + 8);
  *((_OWORD *)v17 + 7) = *((_OWORD *)a3 + 7);
  *((_OWORD *)v17 + 8) = v20;
  v21 = *((_OWORD *)a3 + 6);
  *((_OWORD *)v17 + 5) = *((_OWORD *)a3 + 5);
  *((_OWORD *)v17 + 6) = v21;
  *(_QWORD *)&v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_presentationOptions] = a4;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();

  v24.receiver = v14;
  v24.super_class = ObjectType;
  return objc_msgSendSuper2(&v24, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for DebugJournalValueTableViewCell()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for DebugJournalSubtitleTableViewCell()
{
  return objc_opt_self();
}

uint64_t sub_1BA2C0A88(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    __asm { BR              X11 }
  return MEMORY[0x1E0DEE9D8];
}

unint64_t sub_1BA2C0C68()
{
  unint64_t result;

  result = qword_1EF280418;
  if (!qword_1EF280418)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2C6430, &type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry);
    atomic_store(result, (unint64_t *)&qword_1EF280418);
  }
  return result;
}

uint64_t sub_1BA2C0CAC(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_1BA22920C(255, &qword_1EF27FD68, (uint64_t)&type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v8 = v7;
    v9 = a2();
    result = MEMORY[0x1BCCD93D0](a3, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BA2C0D28(unint64_t result)
{
  if (result >= 5)
    return 5;
  return result;
}

void sub_1BA2C0D38(unint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1;
  v4 = sub_1BA2C0A88((uint64_t)&unk_1E71F51B0);

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v4 + 16) > a1)
  {
    v5 = *(unsigned __int8 *)(v4 + a1 + 32);
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  __break(1u);
  JUMPOUT(0x1BA2C0E38);
}

void sub_1BA2C0E4C(unint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1;
  v4 = sub_1BA2C0A88((uint64_t)&unk_1E71F51B0);

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v4 + 16) > a1)
  {
    v5 = *(unsigned __int8 *)(v4 + a1 + 32);
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  __break(1u);
  JUMPOUT(0x1BA2C0FB4);
}

uint64_t sub_1BA2C0FC8(uint64_t a1)
{
  destroy for DebugJournal.Action(a1);
  return a1;
}

unint64_t sub_1BA2C1000()
{
  unint64_t result;

  result = qword_1EF280430;
  if (!qword_1EF280430)
  {
    result = MEMORY[0x1BCCD93D0](&protocol conformance descriptor for DebugJournalViewController.PresentationOptions, &type metadata for DebugJournalViewController.PresentationOptions);
    atomic_store(result, (unint64_t *)&qword_1EF280430);
  }
  return result;
}

uint64_t type metadata accessor for DebugJournalViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for DebugJournalViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DebugJournalViewController.__allocating_init(commandCenter:journal:presentationOptions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t storeEnumTagSinglePayload for DebugJournalViewController.PresentationOptions(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA2C10B8 + 4 * byte_1BA2CCE30[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA2C10D8 + 4 * byte_1BA2CCE35[v4]))();
}

_BYTE *sub_1BA2C10B8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA2C10D8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2C10E0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2C10E8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA2C10F0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA2C10F8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DebugJournalViewController.PresentationOptions()
{
  return &type metadata for DebugJournalViewController.PresentationOptions;
}

unint64_t sub_1BA2C1114()
{
  unint64_t result;

  result = qword_1EF280588;
  if (!qword_1EF280588)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CD05C, &_s7NewsAds7TrackerVN_0);
    atomic_store(result, (unint64_t *)&qword_1EF280588);
  }
  return result;
}

uint64_t sub_1BA2C1158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t storeEnumTagSinglePayload for DebugJournalViewController.Section(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1BA2C11EC + 4 * byte_1BA2CCE3F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1BA2C1220 + 4 * byte_1BA2CCE3A[v4]))();
}

uint64_t sub_1BA2C1220(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2C1228(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA2C1230);
  return result;
}

uint64_t sub_1BA2C123C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA2C1244);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1BA2C1248(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA2C1250(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DebugJournalViewController.Section()
{
  return &type metadata for DebugJournalViewController.Section;
}

ValueMetadata *_s7NewsAds7TrackerVMa_0()
{
  return &_s7NewsAds7TrackerVN_0;
}

unint64_t sub_1BA2C1280()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2805A8;
  if (!qword_1EF2805A8)
  {
    sub_1BA22920C(255, &qword_1EF2805B0, (uint64_t)&type metadata for DebugJournalViewController.Section, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCD93D0](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2805A8);
  }
  return result;
}

unint64_t sub_1BA2C12E4()
{
  unint64_t result;

  result = qword_1EF2805B8;
  if (!qword_1EF2805B8)
  {
    result = MEMORY[0x1BCCD93D0](&unk_1BA2CD034, &type metadata for DebugJournalViewController.Section);
    atomic_store(result, (unint64_t *)&qword_1EF2805B8);
  }
  return result;
}

uint64_t sub_1BA2C1328()
{
  return MEMORY[0x1E0CAE0D0]();
}

uint64_t sub_1BA2C1334()
{
  return MEMORY[0x1E0CAE0E0]();
}

uint64_t sub_1BA2C1340()
{
  return MEMORY[0x1E0CAE108]();
}

uint64_t sub_1BA2C134C()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1BA2C1358()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1BA2C1364()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1BA2C1370()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1BA2C137C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BA2C1388()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1BA2C1394()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1BA2C13A0()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1BA2C13AC()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BA2C13B8()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1BA2C13C4()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BA2C13D0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BA2C13DC()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BA2C13E8()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BA2C13F4()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1BA2C1400()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BA2C140C()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1BA2C1418()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1BA2C1424()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BA2C1430()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1BA2C143C()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BA2C1448()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1BA2C1454()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BA2C1460()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BA2C146C()
{
  return MEMORY[0x1E0CB0A98]();
}

uint64_t sub_1BA2C1478()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1BA2C1484()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1BA2C1490()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1BA2C149C()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1BA2C14A8()
{
  return MEMORY[0x1E0DC1A48]();
}

uint64_t sub_1BA2C14B4()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_1BA2C14C0()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1BA2C14CC()
{
  return MEMORY[0x1E0DB5488]();
}

uint64_t sub_1BA2C14D8()
{
  return MEMORY[0x1E0DB5490]();
}

uint64_t sub_1BA2C14E4()
{
  return MEMORY[0x1E0DB54B0]();
}

uint64_t sub_1BA2C14F0()
{
  return MEMORY[0x1E0DB54B8]();
}

uint64_t sub_1BA2C14FC()
{
  return MEMORY[0x1E0DB54C0]();
}

uint64_t sub_1BA2C1508()
{
  return MEMORY[0x1E0DB54C8]();
}

uint64_t sub_1BA2C1514()
{
  return MEMORY[0x1E0DB54F8]();
}

uint64_t sub_1BA2C1520()
{
  return MEMORY[0x1E0DB5518]();
}

uint64_t sub_1BA2C152C()
{
  return MEMORY[0x1E0DB5520]();
}

uint64_t sub_1BA2C1538()
{
  return MEMORY[0x1E0DB5528]();
}

uint64_t sub_1BA2C1544()
{
  return MEMORY[0x1E0DB5548]();
}

uint64_t sub_1BA2C1550()
{
  return MEMORY[0x1E0DB55A8]();
}

uint64_t sub_1BA2C155C()
{
  return MEMORY[0x1E0DB5600]();
}

uint64_t sub_1BA2C1568()
{
  return MEMORY[0x1E0DB5610]();
}

uint64_t sub_1BA2C1574()
{
  return MEMORY[0x1E0DB5628]();
}

uint64_t sub_1BA2C1580()
{
  return MEMORY[0x1E0DB5648]();
}

uint64_t sub_1BA2C158C()
{
  return MEMORY[0x1E0DB5658]();
}

uint64_t sub_1BA2C1598()
{
  return MEMORY[0x1E0DB5720]();
}

uint64_t sub_1BA2C15A4()
{
  return MEMORY[0x1E0DB5750]();
}

uint64_t sub_1BA2C15B0()
{
  return MEMORY[0x1E0DB5758]();
}

uint64_t sub_1BA2C15BC()
{
  return MEMORY[0x1E0DB5768]();
}

uint64_t sub_1BA2C15C8()
{
  return MEMORY[0x1E0DB5778]();
}

uint64_t sub_1BA2C15D4()
{
  return MEMORY[0x1E0DB5788]();
}

uint64_t sub_1BA2C15E0()
{
  return MEMORY[0x1E0DB5798]();
}

uint64_t sub_1BA2C15EC()
{
  return MEMORY[0x1E0DB57A8]();
}

uint64_t sub_1BA2C15F8()
{
  return MEMORY[0x1E0DB57B0]();
}

uint64_t sub_1BA2C1604()
{
  return MEMORY[0x1E0DB57C8]();
}

uint64_t sub_1BA2C1610()
{
  return MEMORY[0x1E0DB57F0]();
}

uint64_t sub_1BA2C161C()
{
  return MEMORY[0x1E0DB5808]();
}

uint64_t sub_1BA2C1628()
{
  return MEMORY[0x1E0DB5818]();
}

uint64_t sub_1BA2C1634()
{
  return MEMORY[0x1E0DB5858]();
}

uint64_t sub_1BA2C1640()
{
  return MEMORY[0x1E0DB5860]();
}

uint64_t sub_1BA2C164C()
{
  return MEMORY[0x1E0DB5870]();
}

uint64_t sub_1BA2C1658()
{
  return MEMORY[0x1E0DB5890]();
}

uint64_t sub_1BA2C1664()
{
  return MEMORY[0x1E0DB5E18]();
}

uint64_t sub_1BA2C1670()
{
  return MEMORY[0x1E0DB5E30]();
}

uint64_t sub_1BA2C167C()
{
  return MEMORY[0x1E0DB5E78]();
}

uint64_t sub_1BA2C1688()
{
  return MEMORY[0x1E0DB6040]();
}

uint64_t sub_1BA2C1694()
{
  return MEMORY[0x1E0DB6048]();
}

uint64_t sub_1BA2C16A0()
{
  return MEMORY[0x1E0DB6050]();
}

uint64_t sub_1BA2C16AC()
{
  return MEMORY[0x1E0DB60E0]();
}

uint64_t sub_1BA2C16B8()
{
  return MEMORY[0x1E0DB3058]();
}

uint64_t sub_1BA2C16C4()
{
  return MEMORY[0x1E0DB3068]();
}

uint64_t sub_1BA2C16D0()
{
  return MEMORY[0x1E0DB3070]();
}

uint64_t sub_1BA2C16DC()
{
  return MEMORY[0x1E0DB3090]();
}

uint64_t sub_1BA2C16E8()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1BA2C16F4()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1BA2C1700()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1BA2C170C()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1BA2C1718()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1BA2C1724()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1BA2C1730()
{
  return MEMORY[0x1E0DB3330]();
}

uint64_t sub_1BA2C173C()
{
  return MEMORY[0x1E0DB35A0]();
}

uint64_t sub_1BA2C1748()
{
  return MEMORY[0x1E0DB35D0]();
}

uint64_t sub_1BA2C1754()
{
  return MEMORY[0x1E0DB35D8]();
}

uint64_t sub_1BA2C1760()
{
  return MEMORY[0x1E0DB35E8]();
}

uint64_t sub_1BA2C176C()
{
  return MEMORY[0x1E0DB35F0]();
}

uint64_t sub_1BA2C1778()
{
  return MEMORY[0x1E0DB36F0]();
}

uint64_t sub_1BA2C1784()
{
  return MEMORY[0x1E0DB38A8]();
}

uint64_t sub_1BA2C1790()
{
  return MEMORY[0x1E0DB38B0]();
}

uint64_t sub_1BA2C179C()
{
  return MEMORY[0x1E0DB38B8]();
}

uint64_t sub_1BA2C17A8()
{
  return MEMORY[0x1E0DB38F8]();
}

uint64_t sub_1BA2C17B4()
{
  return MEMORY[0x1E0DB3908]();
}

uint64_t sub_1BA2C17C0()
{
  return MEMORY[0x1E0DB3910]();
}

uint64_t sub_1BA2C17CC()
{
  return MEMORY[0x1E0DB3918]();
}

uint64_t sub_1BA2C17D8()
{
  return MEMORY[0x1E0DB3930]();
}

uint64_t sub_1BA2C17E4()
{
  return MEMORY[0x1E0DB39C0]();
}

uint64_t sub_1BA2C17F0()
{
  return MEMORY[0x1E0DB39D0]();
}

uint64_t sub_1BA2C17FC()
{
  return MEMORY[0x1E0DB39D8]();
}

uint64_t sub_1BA2C1808()
{
  return MEMORY[0x1E0DB3AB8]();
}

uint64_t sub_1BA2C1814()
{
  return MEMORY[0x1E0DB3AC8]();
}

uint64_t sub_1BA2C1820()
{
  return MEMORY[0x1E0DB4100]();
}

uint64_t sub_1BA2C182C()
{
  return MEMORY[0x1E0DB4120]();
}

uint64_t sub_1BA2C1838()
{
  return MEMORY[0x1E0DB43A8]();
}

uint64_t sub_1BA2C1844()
{
  return MEMORY[0x1E0DB43B0]();
}

uint64_t sub_1BA2C1850()
{
  return MEMORY[0x1E0DB43B8]();
}

uint64_t sub_1BA2C185C()
{
  return MEMORY[0x1E0DB45C8]();
}

uint64_t sub_1BA2C1868()
{
  return MEMORY[0x1E0DB45D0]();
}

uint64_t sub_1BA2C1874()
{
  return MEMORY[0x1E0DB46B8]();
}

uint64_t sub_1BA2C1880()
{
  return MEMORY[0x1E0DB4928]();
}

uint64_t sub_1BA2C188C()
{
  return MEMORY[0x1E0DB4988]();
}

uint64_t sub_1BA2C1898()
{
  return MEMORY[0x1E0DB49A8]();
}

uint64_t sub_1BA2C18A4()
{
  return MEMORY[0x1E0DB49B0]();
}

uint64_t sub_1BA2C18B0()
{
  return MEMORY[0x1E0DB49B8]();
}

uint64_t sub_1BA2C18BC()
{
  return MEMORY[0x1E0DB49C0]();
}

uint64_t sub_1BA2C18C8()
{
  return MEMORY[0x1E0DB49E8]();
}

uint64_t sub_1BA2C18D4()
{
  return MEMORY[0x1E0DB49F0]();
}

uint64_t sub_1BA2C18E0()
{
  return MEMORY[0x1E0DB4A20]();
}

uint64_t sub_1BA2C18EC()
{
  return MEMORY[0x1E0DB4AA8]();
}

uint64_t sub_1BA2C18F8()
{
  return MEMORY[0x1E0DB4AB8]();
}

uint64_t sub_1BA2C1904()
{
  return MEMORY[0x1E0DB4AC8]();
}

uint64_t sub_1BA2C1910()
{
  return MEMORY[0x1E0DB4AD0]();
}

uint64_t sub_1BA2C191C()
{
  return MEMORY[0x1E0DB4AD8]();
}

uint64_t sub_1BA2C1928()
{
  return MEMORY[0x1E0DB4AE0]();
}

uint64_t sub_1BA2C1934()
{
  return MEMORY[0x1E0DB4AE8]();
}

uint64_t sub_1BA2C1940()
{
  return MEMORY[0x1E0DB4B70]();
}

uint64_t sub_1BA2C194C()
{
  return MEMORY[0x1E0DB4BF8]();
}

uint64_t sub_1BA2C1958()
{
  return MEMORY[0x1E0DB4C00]();
}

uint64_t sub_1BA2C1964()
{
  return MEMORY[0x1E0DB4C30]();
}

uint64_t sub_1BA2C1970()
{
  return MEMORY[0x1E0DB4C48]();
}

uint64_t sub_1BA2C197C()
{
  return MEMORY[0x1E0DB4C58]();
}

uint64_t sub_1BA2C1988()
{
  return MEMORY[0x1E0DB4CC0]();
}

uint64_t sub_1BA2C1994()
{
  return MEMORY[0x1E0DB4D08]();
}

uint64_t sub_1BA2C19A0()
{
  return MEMORY[0x1E0DB4E88]();
}

uint64_t sub_1BA2C19AC()
{
  return MEMORY[0x1E0DB4EC0]();
}

uint64_t sub_1BA2C19B8()
{
  return MEMORY[0x1E0DB5038]();
}

uint64_t sub_1BA2C19C4()
{
  return MEMORY[0x1E0DB50E8]();
}

uint64_t sub_1BA2C19D0()
{
  return MEMORY[0x1E0D81A90]();
}

uint64_t sub_1BA2C19DC()
{
  return MEMORY[0x1E0D81AC8]();
}

uint64_t sub_1BA2C19E8()
{
  return MEMORY[0x1E0D81AD0]();
}

uint64_t sub_1BA2C19F4()
{
  return MEMORY[0x1E0D81B28]();
}

uint64_t sub_1BA2C1A00()
{
  return MEMORY[0x1E0D81B38]();
}

uint64_t sub_1BA2C1A0C()
{
  return MEMORY[0x1E0D81B40]();
}

uint64_t sub_1BA2C1A18()
{
  return MEMORY[0x1E0D81B48]();
}

uint64_t sub_1BA2C1A24()
{
  return MEMORY[0x1E0D81B50]();
}

uint64_t sub_1BA2C1A30()
{
  return MEMORY[0x1E0D81B58]();
}

uint64_t sub_1BA2C1A3C()
{
  return MEMORY[0x1E0D81B60]();
}

uint64_t sub_1BA2C1A48()
{
  return MEMORY[0x1E0D81B70]();
}

uint64_t sub_1BA2C1A54()
{
  return MEMORY[0x1E0D81B98]();
}

uint64_t sub_1BA2C1A60()
{
  return MEMORY[0x1E0D81C80]();
}

uint64_t sub_1BA2C1A6C()
{
  return MEMORY[0x1E0D81C88]();
}

uint64_t sub_1BA2C1A78()
{
  return MEMORY[0x1E0D81C90]();
}

uint64_t sub_1BA2C1A84()
{
  return MEMORY[0x1E0D81C98]();
}

uint64_t sub_1BA2C1A90()
{
  return MEMORY[0x1E0D81CD0]();
}

uint64_t sub_1BA2C1A9C()
{
  return MEMORY[0x1E0D81CD8]();
}

uint64_t sub_1BA2C1AA8()
{
  return MEMORY[0x1E0D81CE0]();
}

uint64_t sub_1BA2C1AB4()
{
  return MEMORY[0x1E0D81CF0]();
}

uint64_t sub_1BA2C1AC0()
{
  return MEMORY[0x1E0D81E98]();
}

uint64_t sub_1BA2C1ACC()
{
  return MEMORY[0x1E0D81EC0]();
}

uint64_t sub_1BA2C1AD8()
{
  return MEMORY[0x1E0D81EC8]();
}

uint64_t sub_1BA2C1AE4()
{
  return MEMORY[0x1E0D81ED0]();
}

uint64_t sub_1BA2C1AF0()
{
  return MEMORY[0x1E0D81ED8]();
}

uint64_t sub_1BA2C1AFC()
{
  return MEMORY[0x1E0D81F18]();
}

uint64_t sub_1BA2C1B08()
{
  return MEMORY[0x1E0D81F20]();
}

uint64_t sub_1BA2C1B14()
{
  return MEMORY[0x1E0D81F28]();
}

uint64_t sub_1BA2C1B20()
{
  return MEMORY[0x1E0D81F30]();
}

uint64_t sub_1BA2C1B2C()
{
  return MEMORY[0x1E0D81F60]();
}

uint64_t sub_1BA2C1B38()
{
  return MEMORY[0x1E0D81F68]();
}

uint64_t sub_1BA2C1B44()
{
  return MEMORY[0x1E0D81F88]();
}

uint64_t sub_1BA2C1B50()
{
  return MEMORY[0x1E0D81F90]();
}

uint64_t sub_1BA2C1B5C()
{
  return MEMORY[0x1E0D81FA0]();
}

uint64_t sub_1BA2C1B68()
{
  return MEMORY[0x1E0D81FA8]();
}

uint64_t sub_1BA2C1B74()
{
  return MEMORY[0x1E0D81FB0]();
}

uint64_t sub_1BA2C1B80()
{
  return MEMORY[0x1E0D81FB8]();
}

uint64_t sub_1BA2C1B8C()
{
  return MEMORY[0x1E0D81FC0]();
}

uint64_t sub_1BA2C1B98()
{
  return MEMORY[0x1E0D81FC8]();
}

uint64_t sub_1BA2C1BA4()
{
  return MEMORY[0x1E0D81FD0]();
}

uint64_t sub_1BA2C1BB0()
{
  return MEMORY[0x1E0D81FD8]();
}

uint64_t sub_1BA2C1BBC()
{
  return MEMORY[0x1E0D81FE0]();
}

uint64_t sub_1BA2C1BC8()
{
  return MEMORY[0x1E0D81FE8]();
}

uint64_t sub_1BA2C1BD4()
{
  return MEMORY[0x1E0D81FF0]();
}

uint64_t sub_1BA2C1BE0()
{
  return MEMORY[0x1E0D81FF8]();
}

uint64_t sub_1BA2C1BEC()
{
  return MEMORY[0x1E0D82000]();
}

uint64_t sub_1BA2C1BF8()
{
  return MEMORY[0x1E0D82008]();
}

uint64_t sub_1BA2C1C04()
{
  return MEMORY[0x1E0D82010]();
}

uint64_t sub_1BA2C1C10()
{
  return MEMORY[0x1E0D82018]();
}

uint64_t sub_1BA2C1C1C()
{
  return MEMORY[0x1E0D82020]();
}

uint64_t sub_1BA2C1C28()
{
  return MEMORY[0x1E0D82028]();
}

uint64_t sub_1BA2C1C34()
{
  return MEMORY[0x1E0D82030]();
}

uint64_t sub_1BA2C1C40()
{
  return MEMORY[0x1E0D82038]();
}

uint64_t sub_1BA2C1C4C()
{
  return MEMORY[0x1E0D82040]();
}

uint64_t sub_1BA2C1C58()
{
  return MEMORY[0x1E0D82048]();
}

uint64_t sub_1BA2C1C64()
{
  return MEMORY[0x1E0D82050]();
}

uint64_t sub_1BA2C1C70()
{
  return MEMORY[0x1E0D82058]();
}

uint64_t sub_1BA2C1C7C()
{
  return MEMORY[0x1E0D82060]();
}

uint64_t sub_1BA2C1C88()
{
  return MEMORY[0x1E0D82068]();
}

uint64_t sub_1BA2C1C94()
{
  return MEMORY[0x1E0D82070]();
}

uint64_t sub_1BA2C1CA0()
{
  return MEMORY[0x1E0D82078]();
}

uint64_t sub_1BA2C1CAC()
{
  return MEMORY[0x1E0D82080]();
}

uint64_t sub_1BA2C1CB8()
{
  return MEMORY[0x1E0D82088]();
}

uint64_t sub_1BA2C1CC4()
{
  return MEMORY[0x1E0D82090]();
}

uint64_t sub_1BA2C1CD0()
{
  return MEMORY[0x1E0D82098]();
}

uint64_t sub_1BA2C1CDC()
{
  return MEMORY[0x1E0D820A0]();
}

uint64_t sub_1BA2C1CE8()
{
  return MEMORY[0x1E0D820A8]();
}

uint64_t sub_1BA2C1CF4()
{
  return MEMORY[0x1E0D820B0]();
}

uint64_t sub_1BA2C1D00()
{
  return MEMORY[0x1E0D820C0]();
}

uint64_t sub_1BA2C1D0C()
{
  return MEMORY[0x1E0D820C8]();
}

uint64_t sub_1BA2C1D18()
{
  return MEMORY[0x1E0D820D0]();
}

uint64_t sub_1BA2C1D24()
{
  return MEMORY[0x1E0D820D8]();
}

uint64_t sub_1BA2C1D30()
{
  return MEMORY[0x1E0D820E0]();
}

uint64_t sub_1BA2C1D3C()
{
  return MEMORY[0x1E0D820E8]();
}

uint64_t sub_1BA2C1D48()
{
  return MEMORY[0x1E0D820F0]();
}

uint64_t sub_1BA2C1D54()
{
  return MEMORY[0x1E0D820F8]();
}

uint64_t sub_1BA2C1D60()
{
  return MEMORY[0x1E0D82100]();
}

uint64_t sub_1BA2C1D6C()
{
  return MEMORY[0x1E0D82108]();
}

uint64_t sub_1BA2C1D78()
{
  return MEMORY[0x1E0D82110]();
}

uint64_t sub_1BA2C1D84()
{
  return MEMORY[0x1E0D82118]();
}

uint64_t sub_1BA2C1D90()
{
  return MEMORY[0x1E0D82120]();
}

uint64_t sub_1BA2C1D9C()
{
  return MEMORY[0x1E0D82128]();
}

uint64_t sub_1BA2C1DA8()
{
  return MEMORY[0x1E0D82130]();
}

uint64_t sub_1BA2C1DB4()
{
  return MEMORY[0x1E0D82138]();
}

uint64_t sub_1BA2C1DC0()
{
  return MEMORY[0x1E0D82140]();
}

uint64_t sub_1BA2C1DCC()
{
  return MEMORY[0x1E0D822E8]();
}

uint64_t sub_1BA2C1DD8()
{
  return MEMORY[0x1E0D82310]();
}

uint64_t sub_1BA2C1DE4()
{
  return MEMORY[0x1E0D82450]();
}

uint64_t sub_1BA2C1DF0()
{
  return MEMORY[0x1E0D82458]();
}

uint64_t sub_1BA2C1DFC()
{
  return MEMORY[0x1E0D82460]();
}

uint64_t sub_1BA2C1E08()
{
  return MEMORY[0x1E0D82468]();
}

uint64_t sub_1BA2C1E14()
{
  return MEMORY[0x1E0D82470]();
}

uint64_t sub_1BA2C1E20()
{
  return MEMORY[0x1E0D82478]();
}

uint64_t sub_1BA2C1E2C()
{
  return MEMORY[0x1E0D82480]();
}

uint64_t sub_1BA2C1E38()
{
  return MEMORY[0x1E0D82488]();
}

uint64_t sub_1BA2C1E44()
{
  return MEMORY[0x1E0D82498]();
}

uint64_t sub_1BA2C1E50()
{
  return MEMORY[0x1E0D824A0]();
}

uint64_t sub_1BA2C1E5C()
{
  return MEMORY[0x1E0D824A8]();
}

uint64_t sub_1BA2C1E68()
{
  return MEMORY[0x1E0D824B0]();
}

uint64_t sub_1BA2C1E74()
{
  return MEMORY[0x1E0D824B8]();
}

uint64_t sub_1BA2C1E80()
{
  return MEMORY[0x1E0D824E8]();
}

uint64_t sub_1BA2C1E8C()
{
  return MEMORY[0x1E0D824F0]();
}

uint64_t sub_1BA2C1E98()
{
  return MEMORY[0x1E0D824F8]();
}

uint64_t sub_1BA2C1EA4()
{
  return MEMORY[0x1E0D82500]();
}

uint64_t sub_1BA2C1EB0()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1BA2C1EBC()
{
  return MEMORY[0x1E0DB74D8]();
}

uint64_t sub_1BA2C1EC8()
{
  return MEMORY[0x1E0DB74E0]();
}

uint64_t sub_1BA2C1ED4()
{
  return MEMORY[0x1E0DB77A0]();
}

uint64_t sub_1BA2C1EE0()
{
  return MEMORY[0x1E0DB79E8]();
}

uint64_t sub_1BA2C1EEC()
{
  return MEMORY[0x1E0DB7E28]();
}

uint64_t sub_1BA2C1EF8()
{
  return MEMORY[0x1E0DB8160]();
}

uint64_t sub_1BA2C1F04()
{
  return MEMORY[0x1E0DB8168]();
}

uint64_t sub_1BA2C1F10()
{
  return MEMORY[0x1E0DB8540]();
}

uint64_t sub_1BA2C1F1C()
{
  return MEMORY[0x1E0DB9678]();
}

uint64_t sub_1BA2C1F28()
{
  return MEMORY[0x1E0DB9690]();
}

uint64_t sub_1BA2C1F34()
{
  return MEMORY[0x1E0DB96A0]();
}

uint64_t sub_1BA2C1F40()
{
  return MEMORY[0x1E0DB9F30]();
}

uint64_t sub_1BA2C1F4C()
{
  return MEMORY[0x1E0DBAE20]();
}

uint64_t sub_1BA2C1F58()
{
  return MEMORY[0x1E0DBAE28]();
}

uint64_t sub_1BA2C1F64()
{
  return MEMORY[0x1E0DBC2A0]();
}

uint64_t sub_1BA2C1F70()
{
  return MEMORY[0x1E0DBC2A8]();
}

uint64_t sub_1BA2C1F7C()
{
  return MEMORY[0x1E0DBC300]();
}

uint64_t sub_1BA2C1F88()
{
  return MEMORY[0x1E0DBC308]();
}

uint64_t sub_1BA2C1F94()
{
  return MEMORY[0x1E0DBC328]();
}

uint64_t sub_1BA2C1FA0()
{
  return MEMORY[0x1E0DBC338]();
}

uint64_t sub_1BA2C1FAC()
{
  return MEMORY[0x1E0DBC340]();
}

uint64_t sub_1BA2C1FB8()
{
  return MEMORY[0x1E0DBC348]();
}

uint64_t sub_1BA2C1FC4()
{
  return MEMORY[0x1E0DBC440]();
}

uint64_t sub_1BA2C1FD0()
{
  return MEMORY[0x1E0DBC458]();
}

uint64_t sub_1BA2C1FDC()
{
  return MEMORY[0x1E0DC2190]();
}

uint64_t sub_1BA2C1FE8()
{
  return MEMORY[0x1E0DC21B0]();
}

uint64_t sub_1BA2C1FF4()
{
  return MEMORY[0x1E0DC2220]();
}

uint64_t sub_1BA2C2000()
{
  return MEMORY[0x1E0DC2250]();
}

uint64_t sub_1BA2C200C()
{
  return MEMORY[0x1E0DC2350]();
}

uint64_t sub_1BA2C2018()
{
  return MEMORY[0x1E0DC2360]();
}

uint64_t sub_1BA2C2024()
{
  return MEMORY[0x1E0DC23A0]();
}

uint64_t sub_1BA2C2030()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BA2C203C()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1BA2C2048()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BA2C2054()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1BA2C2060()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BA2C206C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1BA2C2078()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1BA2C2084()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1BA2C2090()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1BA2C209C()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1BA2C20A8()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1BA2C20B4()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1BA2C20C0()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BA2C20CC()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_1BA2C20D8()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1BA2C20E4()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BA2C20F0()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1BA2C20FC()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1BA2C2108()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1BA2C2114()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_1BA2C2120()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BA2C212C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BA2C2138()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BA2C2144()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BA2C2150()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BA2C215C()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1BA2C2168()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1BA2C2174()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1BA2C2180()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1BA2C218C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BA2C2198()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1BA2C21A4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BA2C21B0()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1BA2C21BC()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1BA2C21C8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BA2C21D4()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1BA2C21E0()
{
  return MEMORY[0x1E0DB51C8]();
}

uint64_t sub_1BA2C21EC()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1BA2C21F8()
{
  return MEMORY[0x1E0DB5960]();
}

uint64_t sub_1BA2C2204()
{
  return MEMORY[0x1E0DB5968]();
}

uint64_t sub_1BA2C2210()
{
  return MEMORY[0x1E0DB5970]();
}

uint64_t sub_1BA2C221C()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1BA2C2228()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1BA2C2234()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1BA2C2240()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1BA2C224C()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1BA2C2258()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1BA2C2264()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BA2C2270()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BA2C227C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BA2C2288()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BA2C2294()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1BA2C22A0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BA2C22AC()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1BA2C22B8()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1BA2C22C4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BA2C22D0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1BA2C22DC()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1BA2C22E8()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1BA2C22F4()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BA2C2300()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1BA2C230C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1BA2C2318()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1BA2C2324()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1BA2C2330()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1BA2C233C()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1BA2C2348()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1BA2C2354()
{
  return MEMORY[0x1E0DEB7F8]();
}

uint64_t sub_1BA2C2360()
{
  return MEMORY[0x1E0DBCAB8]();
}

uint64_t sub_1BA2C236C()
{
  return MEMORY[0x1E0DBCAD8]();
}

uint64_t sub_1BA2C2378()
{
  return MEMORY[0x1E0DBCAE8]();
}

uint64_t sub_1BA2C2384()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BA2C2390()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BA2C239C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BA2C23A8()
{
  return MEMORY[0x1E0DC2B20]();
}

uint64_t sub_1BA2C23B4()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BA2C23C0()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1BA2C23CC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BA2C23D8()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1BA2C23E4()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BA2C23F0()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BA2C23FC()
{
  return MEMORY[0x1E0DBCC70]();
}

uint64_t sub_1BA2C2408()
{
  return MEMORY[0x1E0DB6538]();
}

uint64_t sub_1BA2C2414()
{
  return MEMORY[0x1E0DBCD20]();
}

uint64_t sub_1BA2C2420()
{
  return MEMORY[0x1E0DBCD78]();
}

uint64_t sub_1BA2C242C()
{
  return MEMORY[0x1E0DBCD98]();
}

uint64_t sub_1BA2C2438()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1BA2C2444()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_1BA2C2450()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1BA2C245C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BA2C2468()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BA2C2474()
{
  return MEMORY[0x1E0DEC010]();
}

uint64_t sub_1BA2C2480()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BA2C248C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BA2C2498()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1BA2C24A4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1BA2C24B0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1BA2C24BC()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BA2C24C8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BA2C24D4()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1BA2C24E0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BA2C24EC()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1BA2C24F8()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t sub_1BA2C2504()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BA2C2510()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BA2C251C()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1BA2C2528()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BA2C2534()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BA2C2540()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BA2C254C()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1BA2C2558()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1BA2C2564()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1BA2C2570()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BA2C257C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BA2C2588()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1BA2C2594()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BA2C25A0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BA2C25AC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BA2C25B8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BA2C25C4()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BA2C25D0()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BA2C25DC()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BA2C25E8()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1BA2C25F4()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1BA2C2600()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1BA2C260C()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1BA2C2618()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1BA2C2624()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1BA2C2630()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1BA2C263C()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1BA2C2648()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1BA2C2654()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1BA2C2660()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1BA2C266C()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1BA2C2678()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1BA2C2684()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1BA2C2690()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BA2C269C()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BA2C26A8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BA2C26B4()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1BA2C26C0()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1BA2C26CC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1BA2C26D8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BA2C26E4()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1BA2C26F0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BA2C26FC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BA2C2708()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BA2C2714()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BA2C2720()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BA2C272C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BA2C2738()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BA2C2744()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BA2C2750()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BA2C275C()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BA2C2768()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1BA2C2774()
{
  return MEMORY[0x1E0DEE8F8]();
}

uint64_t sub_1BA2C2780()
{
  return MEMORY[0x1E0DEE978]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

