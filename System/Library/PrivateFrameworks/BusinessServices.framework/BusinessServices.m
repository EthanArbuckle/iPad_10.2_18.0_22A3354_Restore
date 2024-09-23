uint64_t sub_21CADE4F0@<X0>(uint64_t a1@<X8>)
{
  return BrandModel.genericCSSTemplateURL.getter(a1);
}

uint64_t BrandModel.genericCSSTemplateURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_21CAF80E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_21CADE540()
{
  return 0;
}

uint64_t BrandModel.logoFingerprint.getter()
{
  return 0;
}

uint64_t sub_21CADE558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, __int128 a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19, uint64_t a20,uint64_t a21,__int128 a22,uint64_t a23,uint64_t a24,unint64_t a25,uint64_t a26,uint64_t a27)
{
  return BrandModel.init(brandURI:name:categories:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:genericCSSTemplateURL:logoFingerprint:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_21CADE5AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, __int128 a9, __int128 a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16, __int128 a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v51 = a6;
  v52 = a7;
  v50 = a5;
  v47 = a3;
  v48 = a4;
  v45 = a1;
  v46 = a2;
  v44 = a8;
  v53 = a25;
  v54 = a24;
  v42 = a10;
  v43 = a9;
  v41 = a11;
  v40 = a12;
  v38 = a14;
  v39 = a13;
  v37 = a16;
  v36 = a17;
  v35 = a18;
  v34 = a19;
  v49 = a23;
  swift_bridgeObjectRelease();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  v26 = *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
  v28 = sub_21CADEA58(a15, (uint64_t)&v34 - v27);
  MEMORY[0x24BDAC7A8](v28);
  v29 = sub_21CADEA58(a20, (uint64_t)&v34 - v27);
  MEMORY[0x24BDAC7A8](v29);
  v30 = sub_21CADEA58((uint64_t)&v34 - v27, (uint64_t)&v34 - v27);
  MEMORY[0x24BDAC7A8](v30);
  v31 = sub_21CADEA58((uint64_t)&v34 - v27, (uint64_t)&v34 - v27);
  MEMORY[0x24BDAC7A8](v31);
  v32 = sub_21CAF80E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))((char *)&v34 - v27, 1, 1, v32);
  sub_21CAE36D4(v45, v46, v47, v48, 0, v50, v51, v52, v44, v43, v42, v41, v40, v39, v38, (uint64_t)&v34 - v27, v37, *((uint64_t *)&v37 + 1), v36,
    *((uint64_t *)&v36 + 1),
    v35,
    v34,
    (uint64_t)&v34 - v27,
    a21,
    a22,
    (uint64_t)&v34 - v27,
    0,
    0xF000000000000000,
    0);
  sub_21CADEAF8((uint64_t)&v34 - v27);
  sub_21CADEAF8((uint64_t)&v34 - v27);
  sub_21CADEAA0(v54, v53);
  sub_21CADEAF8(v49);
  sub_21CADEAF8(a20);
  return sub_21CADEAF8(a15);
}

uint64_t BrandModel.init(brandURI:name:categories:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:genericCSSTemplateURL:logoFingerprint:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, __int128 a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19, uint64_t a20,uint64_t a21,__int128 a22,uint64_t a23,uint64_t a24,unint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v49 = a6;
  v50 = a7;
  v45 = a3;
  v46 = a4;
  v41 = a8;
  v42 = a1;
  v51 = a23;
  v47 = a24;
  v48 = a5;
  v43 = a9;
  v44 = a2;
  v39 = a10;
  v37 = a12;
  v38 = a11;
  v36 = a13;
  v35 = a14;
  v34 = a17;
  v33 = a18;
  v32 = a22;
  v40 = a25;
  swift_bridgeObjectRelease();
  v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0) - 8) + 64);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  v29 = sub_21CADEA58(a16, (uint64_t)&v32 - v28);
  MEMORY[0x24BDAC7A8](v29);
  sub_21CADEA58(a21, (uint64_t)&v32 - v28);
  v31 = v36;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, char, uint64_t, uint64_t, char *, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, char *, _QWORD, _QWORD, uint64_t, uint64_t))(a27 + 168))(v42, v44, v45, v46, v48, v49, v50, v43, v39, *((_QWORD *)&v39 + 1), v38, v37, v31, v35, a15, (char *)&v32 - v28, v34, *((_QWORD *)&v34 + 1), v33,
    *((_QWORD *)&v33 + 1),
    a19,
    a20,
    (char *)&v32 - v28,
    v32,
    *((_QWORD *)&v32 + 1),
    a26,
    a27);
  sub_21CADEAA0(v47, v40);
  sub_21CADEAF8(v51);
  sub_21CADEAF8(a21);
  return sub_21CADEAF8(a16);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207877F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21CADEA58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CADEAA0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21CADEAB4(a1, a2);
  return a1;
}

uint64_t sub_21CADEAB4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21CADEAF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t BrandModel.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t static BrandModel.== infix(_:_:)()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v2 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  sub_21CAF8358();
  sub_21CAF8358();
  swift_getAssociatedConformanceWitness();
  v7 = sub_21CAF81C0();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, AssociatedTypeWitness);
  v8(v6, AssociatedTypeWitness);
  return v7 & 1;
}

uint64_t BrandModel.hash(into:)()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v3 = (char *)&v5 - v2;
  sub_21CAF8358();
  swift_getAssociatedConformanceWitness();
  sub_21CAF81B4();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
}

uint64_t sub_21CADED54()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_21CAF822C();
  swift_bridgeObjectRetain();
  sub_21CAF822C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t BrandModel.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5;

  v5 = (*(uint64_t (**)(void))(a2 + 40))();
  sub_21CAF822C();
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  sub_21CAF822C();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t MapKitBrand.brandURI.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.categories.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MapKitBrand.categories.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*MapKitBrand.categories.modify())()
{
  return nullsub_1;
}

uint64_t MapKitBrand.primaryPhoneNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.primaryBrandColorHexString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.secondaryBrandColorHexString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.isVerified.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t MapKitBrand.verifiedBy.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.verifiedBy.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 96) = a1;
  *(_QWORD *)(v2 + 104) = a2;
  return result;
}

uint64_t (*MapKitBrand.verifiedBy.modify())()
{
  return nullsub_1;
}

uint64_t MapKitBrand.localizedDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.localizedDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  return result;
}

uint64_t (*MapKitBrand.localizedDescription.modify())()
{
  return nullsub_1;
}

uint64_t MapKitBrand.website.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MapKitBrand() + 52);
  return sub_21CADEA58(v3, a1);
}

uint64_t type metadata accessor for MapKitBrand()
{
  uint64_t result;

  result = qword_2552D0B98;
  if (!qword_2552D0B98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t MapKitBrand.website.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MapKitBrand() + 52);
  return sub_21CADF0EC(a1, v3);
}

uint64_t sub_21CADF0EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MapKitBrand.website.modify())()
{
  type metadata accessor for MapKitBrand();
  return nullsub_1;
}

uint64_t MapKitBrand.messageNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MapKitBrand() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.messageNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for MapKitBrand() + 56));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*MapKitBrand.messageNumber.modify())()
{
  type metadata accessor for MapKitBrand();
  return nullsub_1;
}

uint64_t MapKitBrand.emailAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MapKitBrand() + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.emailAddress.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for MapKitBrand() + 60));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*MapKitBrand.emailAddress.modify())()
{
  type metadata accessor for MapKitBrand();
  return nullsub_1;
}

uint64_t MapKitBrand.address.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MapKitBrand() + 64));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.address.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for MapKitBrand() + 64));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*MapKitBrand.address.modify())()
{
  type metadata accessor for MapKitBrand();
  return nullsub_1;
}

uint64_t MapKitBrand.termsAndConditionsURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MapKitBrand() + 68);
  return sub_21CADEA58(v3, a1);
}

uint64_t MapKitBrand.termsAndConditionsURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MapKitBrand() + 68);
  return sub_21CADF0EC(a1, v3);
}

uint64_t (*MapKitBrand.termsAndConditionsURL.modify())()
{
  type metadata accessor for MapKitBrand();
  return nullsub_1;
}

uint64_t MapKitBrand.localizedResponseTime.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MapKitBrand() + 72));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MapKitBrand.localizedResponseTime.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for MapKitBrand() + 72));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*MapKitBrand.localizedResponseTime.modify())()
{
  type metadata accessor for MapKitBrand();
  return nullsub_1;
}

uint64_t MapKitBrand.init(brandURI:name:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  int *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t result;

  *(_QWORD *)(a9 + 32) = 0;
  v26 = (int *)type metadata accessor for MapKitBrand();
  v27 = a9 + v26[13];
  v28 = sub_21CAF80E8();
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v29(v27, 1, 1, v28);
  v30 = (_QWORD *)(a9 + v26[14]);
  *v30 = 0;
  v30[1] = 0;
  v31 = (_QWORD *)(a9 + v26[15]);
  *v31 = 0;
  v31[1] = 0;
  v32 = (_QWORD *)(a9 + v26[16]);
  *v32 = 0;
  v32[1] = 0;
  v33 = a9 + v26[17];
  v29(v33, 1, 1, v28);
  v34 = (_QWORD *)(a9 + v26[18]);
  *v34 = 0;
  v34[1] = 0;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 40) = a7;
  *(_QWORD *)(a9 + 48) = a8;
  *(_OWORD *)(a9 + 56) = a10;
  *(_QWORD *)(a9 + 72) = a11;
  *(_QWORD *)(a9 + 80) = a12;
  *(_BYTE *)(a9 + 88) = a13;
  *(_QWORD *)(a9 + 96) = a14;
  *(_QWORD *)(a9 + 104) = a15;
  *(_QWORD *)(a9 + 112) = a5;
  *(_QWORD *)(a9 + 120) = a6;
  sub_21CADF0EC(a16, v27);
  swift_bridgeObjectRelease();
  *v30 = a17;
  v30[1] = a18;
  swift_bridgeObjectRelease();
  *v31 = a19;
  v31[1] = a20;
  swift_bridgeObjectRelease();
  *v32 = a21;
  v32[1] = a22;
  sub_21CADF0EC(a23, v33);
  result = swift_bridgeObjectRelease();
  *v34 = a24;
  v34[1] = a25;
  return result;
}

uint64_t MapKitBrand.hashValue.getter()
{
  sub_21CAF8448();
  swift_bridgeObjectRetain();
  sub_21CAF8220();
  swift_bridgeObjectRelease();
  return sub_21CAF8460();
}

uint64_t sub_21CADF6E4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21CADF710()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21CADF73C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21CADF744()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21CADF770()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21CADF79C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21CADF7C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21CADF7F4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t sub_21CADF7FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21CADF828@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21CADEA58(v2 + *(int *)(a1 + 52), a2);
}

uint64_t sub_21CADF838(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CADF86C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CADF8A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 64));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CADF8D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21CADEA58(v2 + *(int *)(a1 + 68), a2);
}

uint64_t sub_21CADF8E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_21CAF80E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_21CADF920(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 72));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CADF954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  return MapKitBrand.init(brandURI:name:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_21CADF998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, __int128 a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v48 = a6;
  v49 = a7;
  v43 = a3;
  v44 = a4;
  v38 = a8;
  v39 = a1;
  v46 = a25;
  v47 = a5;
  v45 = a26;
  v41 = a9;
  v42 = a2;
  v37 = a10;
  v35 = a12;
  v36 = a11;
  v34 = a13;
  v33 = a14;
  v32 = a17;
  v31 = a18;
  v40 = a24;
  swift_bridgeObjectRelease();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  v27 = *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  v29 = sub_21CADEA58(a16, (uint64_t)&v31 - v28);
  MEMORY[0x24BDAC7A8](v29);
  sub_21CADEA58(a21, (uint64_t)&v31 - v28);
  MapKitBrand.init(brandURI:name:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:)(v39, v42, v43, v44, v47, v48, v49, v41, v38, v37, v36, v35, v34, v33, a15, (uint64_t)&v31 - v28, v32, *((uint64_t *)&v32 + 1), v31,
    *((uint64_t *)&v31 + 1),
    a19,
    a20,
    (uint64_t)&v31 - v28,
    a22,
    a23);
  sub_21CADEAA0(v46, v45);
  sub_21CADEAF8(v40);
  sub_21CADEAF8(a21);
  return sub_21CADEAF8(a16);
}

uint64_t sub_21CADFB4C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21CADFB58(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_21CAF83E8();
}

uint64_t sub_21CADFB88()
{
  sub_21CAF8448();
  swift_bridgeObjectRetain();
  sub_21CAF8220();
  swift_bridgeObjectRelease();
  return sub_21CAF8460();
}

uint64_t sub_21CADFBE0()
{
  swift_bridgeObjectRetain();
  sub_21CAF8220();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CADFC24()
{
  sub_21CAF8448();
  swift_bridgeObjectRetain();
  sub_21CAF8220();
  swift_bridgeObjectRelease();
  return sub_21CAF8460();
}

uint64_t sub_21CADFC78(_QWORD *a1)
{
  uint64_t result;

  a1[1] = sub_21CADFD0C(&qword_2552D0B20, (uint64_t)&protocol conformance descriptor for MapKitBrand);
  a1[2] = sub_21CADFD0C(&qword_2552D0B28, (uint64_t)&protocol conformance descriptor for MapKitBrand);
  result = sub_21CADFD0C(&qword_2552D0B30, (uint64_t)&protocol conformance descriptor for MapKitBrand);
  a1[3] = result;
  return result;
}

uint64_t sub_21CADFCDC()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_21CADFCE8()
{
  return sub_21CADFD0C(&qword_2552D0B38, (uint64_t)&protocol conformance descriptor for MapKitBrand);
}

uint64_t sub_21CADFD0C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for MapKitBrand();
    result = MEMORY[0x220787808](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of BrandModel.brandURI.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BrandModel.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BrandModel.categories.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BrandModel.localizedDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BrandModel.primaryPhoneNumber.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BrandModel.primaryBrandColorHexString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of BrandModel.secondaryBrandColorHexString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of BrandModel.isVerified.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of BrandModel.verifiedBy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of BrandModel.website.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of BrandModel.messageNumber.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of BrandModel.emailAddress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of BrandModel.address.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of BrandModel.termsAndConditionsURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of BrandModel.genericCSSTemplateURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of BrandModel.localizedResponseTime.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of BrandModel.logoFingerprint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of BrandModel.init(brandURI:name:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  return (*(uint64_t (**)(void))(a27 + 168))();
}

uint64_t dispatch thunk of BrandModel.init(brandURI:name:categories:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:genericCSSTemplateURL:logoFingerprint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  return (*(uint64_t (**)(void))(a31 + 176))();
}

_QWORD *initializeBufferWithCopyOfBuffer for MapKitBrand(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  char *v41;
  uint64_t v42;
  void *__dst;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v9;
    v10 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v10;
    v11 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v11;
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
    v12 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v12;
    v13 = a2[15];
    v14 = a3[13];
    __dst = (void *)(a1 + v14);
    v41 = (char *)a2 + v14;
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v13;
    v15 = sub_21CAF80E8();
    v42 = *(_QWORD *)(v15 - 8);
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v41, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
      memcpy(__dst, v41, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      v18 = v42;
    }
    else
    {
      v18 = v42;
      (*(void (**)(void *, char *, uint64_t))(v42 + 16))(__dst, v41, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v42 + 56))(__dst, 0, 1, v15);
    }
    v20 = a3[14];
    v21 = a3[15];
    v22 = (_QWORD *)((char *)v4 + v20);
    v23 = (uint64_t *)((char *)a2 + v20);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = (_QWORD *)((char *)v4 + v21);
    v26 = (uint64_t *)((char *)a2 + v21);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = a3[16];
    v29 = a3[17];
    v30 = (_QWORD *)((char *)v4 + v28);
    v31 = (uint64_t *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = (char *)v4 + v29;
    v34 = (char *)a2 + v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v34, 1, v15))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v33, v34, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v33, 0, 1, v15);
    }
    v36 = a3[18];
    v37 = (_QWORD *)((char *)v4 + v36);
    v38 = (uint64_t *)((char *)a2 + v36);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MapKitBrand(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 52);
  v5 = sub_21CAF80E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = a1 + *(int *)(a2 + 68);
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MapKitBrand(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  const void *v38;
  uint64_t v39;
  void *__dst;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = *(_QWORD *)(a2 + 120);
  v12 = a3[13];
  __dst = (void *)(a1 + v12);
  v38 = (const void *)(a2 + v12);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  v13 = sub_21CAF80E8();
  v39 = *(_QWORD *)(v13 - 8);
  v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v39 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14(v38, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(__dst, v38, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    v16 = v39;
  }
  else
  {
    v16 = v39;
    (*(void (**)(void *, const void *, uint64_t))(v39 + 16))(__dst, v38, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v39 + 56))(__dst, 0, 1, v13);
  }
  v17 = a3[14];
  v18 = a3[15];
  v19 = (_QWORD *)(a1 + v17);
  v20 = (_QWORD *)(a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (_QWORD *)(a1 + v18);
  v23 = (_QWORD *)(a2 + v18);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = a3[16];
  v26 = a3[17];
  v27 = (_QWORD *)(a1 + v25);
  v28 = (_QWORD *)(a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = (void *)(a1 + v26);
  v31 = (const void *)(a2 + v26);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14(v31, 1, v13))
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v30, v31, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v30, 0, 1, v13);
  }
  v33 = a3[18];
  v34 = (_QWORD *)(a1 + v33);
  v35 = (_QWORD *)(a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MapKitBrand(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[13];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_21CAF80E8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[14];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[15];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[16];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[17];
  v25 = (void *)(a1 + v24);
  v26 = (void *)(a2 + v24);
  v27 = v11((void *)(a1 + v24), 1, v9);
  v28 = v11(v26, 1, v9);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v25, v26, v9);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v25, v9);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v25, v26, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v25, 0, 1, v9);
LABEL_13:
  v30 = a3[18];
  v31 = (_QWORD *)(a1 + v30);
  v32 = (_QWORD *)(a2 + v30);
  *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MapKitBrand(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  uint64_t v19;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = a3[13];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  v11 = sub_21CAF80E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  v16 = a3[17];
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  v17 = (void *)(a1 + v16);
  v18 = (const void *)(a2 + v16);
  if (v13((const void *)(a2 + v16), 1, v11))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v17, v18, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
  }
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  return a1;
}

uint64_t assignWithTake for MapKitBrand(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v11 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v12;
  swift_bridgeObjectRelease();
  v13 = a3[13];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = sub_21CAF80E8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  v22 = a3[14];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  v27 = a3[15];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (uint64_t *)(a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v32 = a3[16];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (uint64_t *)(a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  v37 = a3[17];
  v38 = (void *)(a1 + v37);
  v39 = (void *)(a2 + v37);
  v40 = v18((void *)(a1 + v37), 1, v16);
  v41 = v18(v39, 1, v16);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v38, v39, v16);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v38, v16);
    goto LABEL_12;
  }
  if (v41)
  {
LABEL_12:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v38, v39, v16);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v38, 0, 1, v16);
LABEL_13:
  v43 = a3[18];
  v44 = (_QWORD *)(a1 + v43);
  v45 = (uint64_t *)(a2 + v43);
  v47 = *v45;
  v46 = v45[1];
  *v44 = v47;
  v44[1] = v46;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MapKitBrand()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CAE0C68(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 52), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MapKitBrand()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CAE0CF4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 52), a2, a2, v7);
  }
  return result;
}

void sub_21CAE0D6C()
{
  unint64_t v0;

  sub_21CAE0E10();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21CAE0E10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552D0BA8[0])
  {
    sub_21CAF80E8();
    v0 = sub_21CAF8304();
    if (!v1)
      atomic_store(v0, qword_2552D0BA8);
  }
}

void type metadata accessor for SCNetworkReachability(uint64_t a1)
{
  sub_21CAE1094(a1, &qword_2552D0C10);
}

uint64_t sub_21CAE0E78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v4;

  if ((*(uint64_t (**)(void))(a2 + 32))() == 0xD00000000000002CLL && v2 == 0x800000021CAFC040)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v4 = sub_21CAF83E8();
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
}

uint64_t sub_21CAE0F08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v4;

  if ((*(uint64_t (**)(void))(a2 + 32))() == 0xD00000000000002CLL && v2 == 0x800000021CAFC010)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v4 = sub_21CAF83E8();
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
}

uint64_t sub_21CAE0F98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, __int128 a9, __int128 a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16, __int128 a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25)
{
  return sub_21CADE5AC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

_QWORD *sub_21CAE0FE4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21CAE0FF4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for BSBrandAssetType(uint64_t a1)
{
  sub_21CAE1094(a1, &qword_2552D0C18);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21CAE1024(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21CAE1044(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_21CAE1094(a1, &qword_2552D0C20);
}

void type metadata accessor for BSBrandLogoType(uint64_t a1)
{
  sub_21CAE1094(a1, &qword_2552D0C28);
}

void sub_21CAE1094(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_21CAE10D8()
{
  return 1;
}

uint64_t sub_21CAE10E0()
{
  sub_21CAF8448();
  sub_21CAF8454();
  return sub_21CAF8460();
}

uint64_t sub_21CAE1120()
{
  return sub_21CAF8454();
}

uint64_t sub_21CAE1144()
{
  sub_21CAF8448();
  sub_21CAF8454();
  return sub_21CAF8460();
}

uint64_t NetworkProvider.__allocating_init(customURLCache:waitsForConnectivity:)(void *a1, char a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = swift_allocObject();
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v6 = v5;
  if (a1)
    objc_msgSend(v5, sel_setURLCache_, a1);
  objc_msgSend(v6, sel_setWaitsForConnectivity_, a2 & 1);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v6);

  *(_QWORD *)(v4 + 16) = v7;
  return v4;
}

uint64_t NetworkProvider.init(customURLCache:waitsForConnectivity:)(void *a1, char a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v6 = v5;
  if (a1)
    objc_msgSend(v5, sel_setURLCache_, a1);
  objc_msgSend(v6, sel_setWaitsForConnectivity_, a2 & 1);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v6);

  *(_QWORD *)(v2 + 16) = v7;
  return v2;
}

uint64_t sub_21CAE1304(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_21CAE131C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_21CAE1378;
  return sub_21CAF8280();
}

uint64_t sub_21CAE1378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 40) = a1;
  *(_QWORD *)(v5 + 48) = a2;
  *(_QWORD *)(v5 + 56) = a3;
  swift_task_dealloc();
  if (v3)
    return (*(uint64_t (**)(void))(v5 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_21CAE13F0()
{
  uint64_t v0;
  void *v1;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  objc_opt_self();
  v1 = (void *)swift_dynamicCastObjCClass();
  if (v1 && objc_msgSend(v1, sel_statusCode) == (id)200)
  {

    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 48);
    v4 = *(void **)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 40);
    sub_21CAE14CC();
    swift_allocError();
    swift_willThrow();

    sub_21CADEAB4(v5, v3);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

unint64_t sub_21CAE14CC()
{
  unint64_t result;

  result = qword_2552D0CF8;
  if (!qword_2552D0CF8)
  {
    result = MEMORY[0x220787808](&unk_21CAF9970, &type metadata for NetworkProviderError);
    atomic_store(result, (unint64_t *)&qword_2552D0CF8);
  }
  return result;
}

uint64_t NetworkProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NetworkProvider.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_21CAE1550(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(**(_QWORD **)v1 + 96) + *(_QWORD *)(**(_QWORD **)v1 + 96));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21CAE15B8;
  return v6(a1);
}

uint64_t sub_21CAE15B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t dispatch thunk of NetworkProviderProtocol.performDataTask(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21CAE18CC;
  return v9(a1, a2, a3);
}

uint64_t type metadata accessor for NetworkProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for NetworkProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NetworkProvider.__allocating_init(customURLCache:waitsForConnectivity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of NetworkProvider.performDataTask(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 96) + *(_QWORD *)(*(_QWORD *)v1 + 96));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21CAE172C;
  return v6(a1);
}

uint64_t sub_21CAE172C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t getEnumTagSinglePayload for NetworkProviderError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for NetworkProviderError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21CAE1820 + 4 * byte_21CAF9890[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21CAE1840 + 4 * byte_21CAF9895[v4]))();
}

_BYTE *sub_21CAE1820(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21CAE1840(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CAE1848(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CAE1850(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CAE1858(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CAE1860(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21CAE186C()
{
  return 0;
}

ValueMetadata *type metadata accessor for NetworkProviderError()
{
  return &type metadata for NetworkProviderError;
}

unint64_t sub_21CAE1888()
{
  unint64_t result;

  result = qword_2552D0D18;
  if (!qword_2552D0D18)
  {
    result = MEMORY[0x220787808](&unk_21CAF9948, &type metadata for NetworkProviderError);
    atomic_store(result, (unint64_t *)&qword_2552D0D18);
  }
  return result;
}

id sub_21CAE18D0()
{
  return sub_21CAE18E4();
}

id sub_21CAE18E4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v1 = objc_msgSend(v0, sel_getSubscriptionInfoWithError_, v5);
  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_21CAF80AC();

    swift_willThrow();
  }
  return v1;
}

id sub_21CAE1998(uint64_t a1, uint64_t a2)
{
  return sub_21CAE19AC(a1, a2);
}

id sub_21CAE19AC(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7[0] = 0;
  v3 = objc_msgSend(v2, sel_readCachedChatBotRenderInformation_forChatBot_withError_, a1, a2, v7);
  if (v3)
  {
    v4 = v7[0];
  }
  else
  {
    v5 = v7[0];
    sub_21CAF80AC();

    swift_willThrow();
  }
  return v3;
}

id sub_21CAE1A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21CAE1A7C(a1, a2, a3);
}

id sub_21CAE1A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  if (objc_msgSend(v3, sel_fetchRenderInformation_forChatBot_withOperationID_withError_, a1, a2, a3, v6))
    return v6[0];
  v5 = v6[0];
  sub_21CAF80AC();

  return (id)swift_willThrow();
}

id sub_21CAE1B58()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCDaemonConnection();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for XPCDaemonConnection()
{
  return objc_opt_self();
}

uint64_t URL.hasSecureScheme.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  sub_21CAF80D0();
  if (v0 && (v1 = sub_21CAF8214(), v3 = v2, swift_bridgeObjectRelease(), v3))
  {
    if (v1 == 0x7370747468 && v3 == 0xE500000000000000)
      v4 = 1;
    else
      v4 = sub_21CAF83E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

uint64_t String.isAppleMainBrandURI.getter(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000002CLL && a2 == 0x800000021CAFC040)
    return 1;
  else
    return sub_21CAF83E8();
}

uint64_t String.isAppleMakoBrandURI.getter(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000002CLL && a2 == 0x800000021CAFC010)
    return 1;
  else
    return sub_21CAF83E8();
}

unint64_t static String.appleMainBrandURI.getter()
{
  return 0xD00000000000002CLL;
}

unint64_t static String.appleMakoBrandURI.getter()
{
  return 0xD00000000000002CLL;
}

uint64_t static BrandManagerError.errorDomain.getter()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = qword_2552D0D50;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static BrandManagerError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  qword_2552D0D50 = a1;
  qword_2552D0D58 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static BrandManagerError.errorDomain.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

BOOL BrandManagerError.errorCode.getter()
{
  _QWORD *v0;

  return *v0 == 1;
}

unint64_t BrandManagerError.errorUserInfo.getter()
{
  void **v0;
  void *v1;
  uint64_t inited;
  uint64_t v4;
  id v5;

  v1 = *v0;
  if ((unint64_t)v1 < 2)
    return sub_21CAE1EB8(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0D60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21CAF9A60;
  *(_QWORD *)(inited + 32) = sub_21CAF81D8();
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 72) = sub_21CAE1FE0();
  *(_QWORD *)(inited + 48) = v1;
  v5 = v1;
  return sub_21CAE1EB8(inited);
}

unint64_t sub_21CAE1EB8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0ED0);
  v2 = sub_21CAF83B8();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21CAE3678(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_21CAEC7D8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21CAE36C0(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21CAE1FE0()
{
  unint64_t result;

  result = qword_2552D0D68;
  if (!qword_2552D0D68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2552D0D68);
  }
  return result;
}

uint64_t sub_21CAE201C()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = qword_2552D0D50;
  swift_bridgeObjectRetain();
  return v0;
}

BOOL sub_21CAE206C()
{
  _QWORD *v0;

  return *v0 == 1;
}

uint64_t sub_21CAE2080()
{
  sub_21CAE34A0();
  return sub_21CAF840C();
}

uint64_t sub_21CAE20AC()
{
  sub_21CAE34A0();
  return sub_21CAF8400();
}

uint64_t sub_21CAE20DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  void (*v23)(uint64_t, unint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  _OWORD v27[3];

  v5 = v4;
  if (qword_2552D0AF8 != -1)
    swift_once();
  v9 = sub_21CAF8178();
  __swift_project_value_buffer(v9, (uint64_t)qword_2552D2AB0);
  swift_bridgeObjectRetain_n();
  v10 = sub_21CAF8160();
  v11 = sub_21CAF82B0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v25 = a4;
    v13 = a1;
    v14 = swift_slowAlloc();
    *(_QWORD *)&v27[0] = v14;
    *(_DWORD *)v12 = 136446467;
    v15 = sub_21CAF846C();
    sub_21CAE2520(v15, v16, (uint64_t *)v27);
    sub_21CAF8310();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2081;
    swift_bridgeObjectRetain();
    sub_21CAE2520(v13, a2, (uint64_t *)v27);
    sub_21CAF8310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CADC000, v10, v11, "[%{public}s] Fetching brand with URI: %{private}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    v17 = v14;
    a1 = v13;
    a4 = v25;
    MEMORY[0x2207878A4](v17, -1, -1);
    MEMORY[0x2207878A4](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v18 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 40));
  v19 = v18[3];
  v20 = v18[4];
  __swift_project_boxed_opaque_existential_1(v18, v19);
  sub_21CAE30F4((uint64_t)v18, (uint64_t)v27);
  v21 = swift_allocObject();
  v22 = v27[1];
  *(_OWORD *)(v21 + 16) = v27[0];
  *(_OWORD *)(v21 + 32) = v22;
  *(_OWORD *)(v21 + 48) = v27[2];
  *(_QWORD *)(v21 + 64) = a3;
  *(_QWORD *)(v21 + 72) = a4;
  v23 = *(void (**)(uint64_t, unint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v20 + 8);
  swift_retain();
  v23(a1, a2, sub_21CAE3164, v21, v19, v20);
  return swift_release();
}

uint64_t sub_21CAE2374(uint64_t a1, uint64_t a2)
{
  swift_retain();
  sub_21CAE6B48(a1, a2);
  return swift_release();
}

uint64_t sub_21CAE23B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  swift_retain();
  swift_retain();
  sub_21CAE5F50(a1, a2, (uint64_t)sub_21CAE3194, v8);
  swift_release();
  return swift_release();
}

void sub_21CAE2444(void *a1, unint64_t a2, char a3, void (*a4)(void *, unint64_t, void *))
{
  id v8;
  void *v9;

  if ((a3 & 1) != 0)
  {
    v8 = a1;
    v9 = (void *)sub_21CAF80A0();
    a4(0, 0xF000000000000000, v9);

  }
  else
  {
    sub_21CAE34F0((uint64_t)a1, a2);
    a4(a1, a2, 0);
  }
  sub_21CAE34E4(a1, a2, a3 & 1);
}

uint64_t BrandManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return v0;
}

uint64_t BrandManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_21CAE2520(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21CAE25F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21CAE3554((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_21CAE3554((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_21CAE25F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21CAF831C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21CAE27A8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_21CAF8370();
  if (!v8)
  {
    sub_21CAF837C();
    __break(1u);
LABEL_17:
    result = sub_21CAF83C4();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21CAE27A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21CAE283C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21CAE2A14(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21CAE2A14(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21CAE283C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21CAE29B0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21CAF834C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21CAF837C();
      __break(1u);
LABEL_10:
      v2 = sub_21CAF8238();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21CAF83C4();
    __break(1u);
LABEL_14:
    result = sub_21CAF837C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21CAE29B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0E58);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21CAE2A14(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0E58);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21CAF83C4();
  __break(1u);
  return result;
}

uint64_t sub_21CAE2B60(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16[5];
  uint64_t v17;
  _BYTE v18[40];
  __int128 v19;
  ValueMetadata *v20;
  _UNKNOWN **v21;

  v20 = &type metadata for BrandRemoteDataSourceFactoryComposition;
  v21 = &off_24E0A6A30;
  v6 = (_OWORD *)swift_allocObject();
  *(_QWORD *)&v19 = v6;
  v7 = a1[1];
  v6[1] = *a1;
  v6[2] = v7;
  v6[3] = a1[2];
  if (qword_2552D0AF8 != -1)
    swift_once();
  v8 = sub_21CAF8178();
  __swift_project_value_buffer(v8, (uint64_t)qword_2552D2AB0);
  sub_21CAE361C((uint64_t)&v19, (uint64_t)v18);
  v9 = sub_21CAF8160();
  v10 = sub_21CAF8298();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v17 = v12;
    *(_DWORD *)v11 = 136315138;
    sub_21CAE361C((uint64_t)v18, (uint64_t)v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC8);
    v13 = sub_21CAF8208();
    v16[0] = sub_21CAE2520(v13, v14, &v17);
    sub_21CAF8310();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
    _os_log_impl(&dword_21CADC000, v9, v10, "Creating BrandManger with BrandDataSource: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v12, -1, -1);
    MEMORY[0x2207878A4](v11, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }

  sub_21CAE3660(&v19, a3 + 16);
  *(_QWORD *)(a3 + 56) = a2;
  return a3;
}

uint64_t _s16BusinessServices12BrandManagerC14cachingEnabled8cacheURL35brandRemoteDataSourceNeedingFactoryACSb_10Foundation0H0VSgAA0cjklmN0_ptcfC_0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_class *v10;
  id v11;
  void *v12;
  char *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v30[5];
  _DWORD v31[10];
  uint64_t v32;
  objc_super v33;

  if (qword_2552D0AF8 != -1)
    swift_once();
  v6 = sub_21CAF8178();
  __swift_project_value_buffer(v6, (uint64_t)qword_2552D2AB0);
  v7 = sub_21CAF8160();
  v8 = sub_21CAF8298();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    v31[0] = a1 & 1;
    sub_21CAF8310();
    _os_log_impl(&dword_21CADC000, v7, v8, "Creating brandManger with caching enabled: %{BOOL}d", v9, 8u);
    MEMORY[0x2207878A4](v9, -1, -1);
  }

  v10 = (objc_class *)type metadata accessor for XPCDaemonConnection();
  v11 = objc_allocWithZone(v10);
  v12 = (void *)objc_opt_self();
  v13 = (char *)v11;
  v14 = objc_msgSend(v12, sel_interfaceWithProtocol_, &unk_2552D4E58);
  v15 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v16 = (void *)sub_21CAF81CC();
  v17 = objc_msgSend(v15, sel_initWithMachServiceName_options_, v16, 0);

  *(_QWORD *)&v13[OBJC_IVAR____TtC16BusinessServices19XPCDaemonConnection_connection] = v17;
  v18 = v17;
  v19 = v14;
  objc_msgSend(v18, sel_setRemoteObjectInterface_, v19);

  v33.receiver = v13;
  v33.super_class = v10;
  v20 = (char *)objc_msgSendSuper2(&v33, sel_init);

  type metadata accessor for BrandService();
  v21 = swift_allocObject();
  *(_BYTE *)(v21 + 24) = a1 & 1;
  *(_QWORD *)(v21 + 16) = v20;
  objc_msgSend(*(id *)&v20[OBJC_IVAR____TtC16BusinessServices19XPCDaemonConnection_connection], sel_resume);
  sub_21CAE361C(a3, (uint64_t)v31);
  v32 = v21;
  v30[3] = &type metadata for BrandRemoteDataSourceFactoryComposition;
  v30[4] = &off_24E0A6A30;
  v30[0] = swift_allocObject();
  sub_21CAE30F4((uint64_t)v31, v30[0] + 16);
  type metadata accessor for BrandManager();
  v22 = swift_allocObject();
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, (uint64_t)&type metadata for BrandRemoteDataSourceFactoryComposition);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (_OWORD *)((char *)&v30[-1] - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v26 + 16))(v25);
  swift_retain_n();
  v27 = sub_21CAE2B60(v25, v21, v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  sub_21CADEAF8(a2);
  sub_21CAE35E8((uint64_t)v31);
  return v27;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21CAE30F4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for BrandRemoteDataSourceFactoryComposition(a2, a1);
  return a2;
}

uint64_t sub_21CAE3130()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_21CAE3164(uint64_t a1)
{
  uint64_t v1;

  sub_21CAF27D8(a1, v1 + 16, *(void (**)(void *, uint64_t))(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t sub_21CAE3170()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CAE3194(void *a1, unint64_t a2, char a3)
{
  uint64_t v3;

  sub_21CAE2444(a1, a2, a3 & 1, *(void (**)(void *, unint64_t, void *))(v3 + 16));
}

unint64_t sub_21CAE31A4()
{
  unint64_t result;

  result = qword_2552D0D70;
  if (!qword_2552D0D70)
  {
    result = MEMORY[0x220787808](&protocol conformance descriptor for BrandManagerError, &type metadata for BrandManagerError);
    atomic_store(result, (unint64_t *)&qword_2552D0D70);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for BrandManagerError(_QWORD *a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  LODWORD(v4) = -1;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  if ((int)v4 - 1 < 0)
    v5 = v3;
  *a1 = v3;
  return a1;
}

void destroy for BrandManagerError(void **a1)
{
  void *v1;
  int v2;

  v1 = *a1;
  v2 = -1;
  if ((unint64_t)v1 < 0xFFFFFFFF)
    v2 = (int)v1;
  if (v2 - 1 < 0)

}

void **assignWithCopy for BrandManagerError(void **a1, void **a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;
  id v12;

  v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v5) = -1;
  else
    v5 = *a1;
  v6 = (_DWORD)v5 - 1;
  v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  v8 = (_DWORD)v4 - 1;
  if (v6 < 0)
  {
    if (v8 < 0)
    {
      *a1 = v7;
      v12 = v7;

      return a1;
    }

    v7 = *a2;
    goto LABEL_11;
  }
  if ((v8 & 0x80000000) == 0)
  {
LABEL_11:
    *a1 = v7;
    return a1;
  }
  *a1 = v7;
  v9 = v7;
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for BrandManagerError(void **a1, unint64_t *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    v4 = *a1;
  v5 = *a2;
  if ((int)v4 - 1 < 0)
  {
    LODWORD(v6) = -1;
    if (v5 < 0xFFFFFFFF)
      v6 = *a2;
    if ((int)v6 - 1 < 0)
    {
      *a1 = (void *)v5;

      return a1;
    }

  }
  *a1 = (void *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for BrandManagerError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  if ((v4 + 1) >= 2)
    return v4;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BrandManagerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_21CAE33F4(uint64_t *a1)
{
  uint64_t v1;
  int v2;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

_QWORD *sub_21CAE3418(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    a2 -= 0x7FFFFFFF;
    goto LABEL_5;
  }
  if (a2)
LABEL_5:
    *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BrandManagerError()
{
  return &type metadata for BrandManagerError;
}

uint64_t type metadata accessor for BrandManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BrandManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BrandManager.brandWithURI(_:resultHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of BrandManager.clearUnusedBrandLogos(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of BrandManager.fetchAsset(withURL:assetType:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

unint64_t sub_21CAE34A0()
{
  unint64_t result;

  result = qword_2552D0E50;
  if (!qword_2552D0E50)
  {
    result = MEMORY[0x220787808](&protocol conformance descriptor for BrandManagerError, &type metadata for BrandManagerError);
    atomic_store(result, (unint64_t *)&qword_2552D0E50);
  }
  return result;
}

void sub_21CAE34E4(id a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    sub_21CADEAB4((uint64_t)a1, a2);
}

uint64_t sub_21CAE34F0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21CAE3554(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21CAE3594()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_21CAE35E8(uint64_t a1)
{
  destroy for BrandRemoteDataSourceFactoryComposition(a1);
  return a1;
}

uint64_t sub_21CAE361C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21CAE3660(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_21CAE3678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2552D0ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_21CAE36C0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21CAE36D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  int *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;

  v30 = (int *)type metadata accessor for RCSChatBotBrand(0);
  v31 = a9 + v30[13];
  v42 = v31;
  v32 = sub_21CAF80E8();
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
  v33(v31, 1, 1, v32);
  v34 = (_QWORD *)(a9 + v30[14]);
  *v34 = 0;
  v34[1] = 0;
  v35 = (_QWORD *)(a9 + v30[15]);
  *v35 = 0;
  v35[1] = 0;
  v36 = (_QWORD *)(a9 + v30[16]);
  *v36 = 0;
  v36[1] = 0;
  v37 = a9 + v30[17];
  v33(v37, 1, 1, v32);
  v38 = (_QWORD *)(a9 + v30[18]);
  *v38 = 0;
  v38[1] = 0;
  v39 = a9 + v30[19];
  v33(v39, 1, 1, v32);
  v40 = a9 + v30[20];
  *(_OWORD *)v40 = xmmword_21CAF9B70;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 96) = a6;
  *(_QWORD *)(a9 + 104) = a7;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a8;
  *(_OWORD *)(a9 + 48) = a10;
  *(_OWORD *)(a9 + 64) = a11;
  *(_QWORD *)(a9 + 80) = a12;
  *(_BYTE *)(a9 + 88) = a13;
  *(_QWORD *)(a9 + 112) = a14;
  *(_QWORD *)(a9 + 120) = a15;
  sub_21CADF0EC(a16, v42);
  swift_bridgeObjectRelease();
  *v34 = a17;
  v34[1] = a18;
  swift_bridgeObjectRelease();
  *v35 = a19;
  v35[1] = a20;
  swift_bridgeObjectRelease();
  *v36 = a21;
  v36[1] = a22;
  sub_21CADF0EC(a23, v37);
  swift_bridgeObjectRelease();
  *v38 = a24;
  v38[1] = a25;
  sub_21CADF0EC(a26, v39);
  result = sub_21CADEAA0(*(_QWORD *)v40, *(_QWORD *)(v40 + 8));
  *(_QWORD *)v40 = a27;
  *(_QWORD *)(v40 + 8) = a28;
  *(_BYTE *)(a9 + v30[21]) = a29;
  return result;
}

uint64_t type metadata accessor for RCSChatBotBrand(uint64_t a1)
{
  return sub_21CAE41A8(a1, qword_2552D0FC8);
}

uint64_t *sub_21CAE3968(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21CAF80E8();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v12 = *(int *)(a3 + 20);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    if (v9((uint64_t *)v14, 1, v7))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_21CAE3AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;

  v4 = sub_21CAF80E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v7 = a1 + *(int *)(a2 + 20);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v7, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  return result;
}

char *sub_21CAE3B58(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = sub_21CAF80E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(v12, 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  return a1;
}

char *sub_21CAE3C78(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;

  v6 = sub_21CAF80E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 1, v6);
  v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
  return a1;
}

char *sub_21CAE3E28(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = sub_21CAF80E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(v12, 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  return a1;
}

char *sub_21CAE3F48(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;

  v6 = sub_21CAF80E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 1, v6);
  v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
  return a1;
}

uint64_t sub_21CAE40F8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CAE4104(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_21CAE4144()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CAE4150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ChatBotLogoURLProvider(uint64_t a1)
{
  return sub_21CAE41A8(a1, qword_2552D0F38);
}

uint64_t sub_21CAE41A8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21CAE41DC()
{
  unint64_t v0;

  sub_21CAE0E10();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *sub_21CAE4244(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v50;
  void *__dst;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v10;
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = a2[15];
    v13 = a3[13];
    __dst = (void *)(a1 + v13);
    v14 = (char *)a2 + v13;
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v12;
    v15 = sub_21CAF80E8();
    v50 = *(_QWORD *)(v15 - 8);
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v14, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
      memcpy(__dst, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      v18 = v50;
    }
    else
    {
      v18 = v50;
      (*(void (**)(void *, char *, uint64_t))(v50 + 16))(__dst, v14, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v50 + 56))(__dst, 0, 1, v15);
    }
    v20 = a3[14];
    v21 = a3[15];
    v22 = (_QWORD *)((char *)v4 + v20);
    v23 = (uint64_t *)((char *)a2 + v20);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = (_QWORD *)((char *)v4 + v21);
    v26 = (uint64_t *)((char *)a2 + v21);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = a3[16];
    v29 = a3[17];
    v30 = (_QWORD *)((char *)v4 + v28);
    v31 = (uint64_t *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = (char *)v4 + v29;
    v34 = (char *)a2 + v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v34, 1, v15))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v33, v34, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v33, 0, 1, v15);
    }
    v36 = a3[18];
    v37 = a3[19];
    v38 = (_QWORD *)((char *)v4 + v36);
    v39 = (uint64_t *)((char *)a2 + v36);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = (char *)v4 + v37;
    v42 = (char *)a2 + v37;
    swift_bridgeObjectRetain();
    if (v16(v42, 1, v15))
    {
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
      memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v41, v42, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v41, 0, 1, v15);
    }
    v44 = a3[20];
    v45 = (char *)v4 + v44;
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = v46[1];
    if (v47 >> 60 == 15)
    {
      *(_OWORD *)v45 = *(_OWORD *)v46;
    }
    else
    {
      v48 = *v46;
      sub_21CAE34F0(*v46, v46[1]);
      *(_QWORD *)v45 = v48;
      *((_QWORD *)v45 + 1) = v47;
    }
    *((_BYTE *)v4 + a3[21]) = *((_BYTE *)a2 + a3[21]);
  }
  return v4;
}

uint64_t sub_21CAE456C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t *v11;
  unint64_t v12;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[13];
  v5 = sub_21CAF80E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = a1 + a2[17];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  v9 = a1 + a2[19];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v9, 1, v5);
  if (!(_DWORD)result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  v11 = (uint64_t *)(a1 + a2[20]);
  v12 = v11[1];
  if (v12 >> 60 != 15)
    return sub_21CADEAB4(*v11, v12);
  return result;
}

uint64_t sub_21CAE46E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  const void *v47;
  uint64_t v48;
  void *__dst;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = *(_QWORD *)(a2 + 120);
  v12 = a3[13];
  __dst = (void *)(a1 + v12);
  v47 = (const void *)(a2 + v12);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  v13 = sub_21CAF80E8();
  v48 = *(_QWORD *)(v13 - 8);
  v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v48 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14(v47, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(__dst, v47, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    v16 = v48;
  }
  else
  {
    v16 = v48;
    (*(void (**)(void *, const void *, uint64_t))(v48 + 16))(__dst, v47, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v48 + 56))(__dst, 0, 1, v13);
  }
  v17 = a3[14];
  v18 = a3[15];
  v19 = (_QWORD *)(a1 + v17);
  v20 = (_QWORD *)(a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (_QWORD *)(a1 + v18);
  v23 = (_QWORD *)(a2 + v18);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = a3[16];
  v26 = a3[17];
  v27 = (_QWORD *)(a1 + v25);
  v28 = (_QWORD *)(a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = (void *)(a1 + v26);
  v31 = (const void *)(a2 + v26);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14(v31, 1, v13))
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v30, v31, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v30, 0, 1, v13);
  }
  v33 = a3[18];
  v34 = a3[19];
  v35 = (_QWORD *)(a1 + v33);
  v36 = (_QWORD *)(a2 + v33);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  v38 = (void *)(a1 + v34);
  v39 = (const void *)(a2 + v34);
  swift_bridgeObjectRetain();
  if (v14(v39, 1, v13))
  {
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v38, v39, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v38, 0, 1, v13);
  }
  v41 = a3[20];
  v42 = a1 + v41;
  v43 = (uint64_t *)(a2 + v41);
  v44 = v43[1];
  if (v44 >> 60 == 15)
  {
    *(_OWORD *)v42 = *(_OWORD *)v43;
  }
  else
  {
    v45 = *v43;
    sub_21CAE34F0(*v43, v43[1]);
    *(_QWORD *)v42 = v45;
    *(_QWORD *)(v42 + 8) = v44;
  }
  *(_BYTE *)(a1 + a3[21]) = *(_BYTE *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_21CAE49E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[13];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_21CAF80E8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[14];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[15];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[16];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[17];
  v25 = (void *)(a1 + v24);
  v26 = (void *)(a2 + v24);
  v27 = v11((void *)(a1 + v24), 1, v9);
  v28 = v11(v26, 1, v9);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v25, v26, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v25, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v25, v9);
LABEL_12:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v25, v26, v9);
LABEL_13:
  v30 = a3[18];
  v31 = (_QWORD *)(a1 + v30);
  v32 = (_QWORD *)(a2 + v30);
  *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33 = a3[19];
  v34 = (void *)(a1 + v33);
  v35 = (void *)(a2 + v33);
  v36 = v11((void *)(a1 + v33), 1, v9);
  v37 = v11(v35, 1, v9);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v34, v35, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v34, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v37)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v34, v9);
LABEL_18:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v34, v35, v9);
LABEL_19:
  v39 = a3[20];
  v40 = (uint64_t *)(a1 + v39);
  v41 = (uint64_t *)(a2 + v39);
  v42 = *(_QWORD *)(a2 + v39 + 8);
  if (*(_QWORD *)(a1 + v39 + 8) >> 60 != 15)
  {
    if (v42 >> 60 != 15)
    {
      v44 = *v41;
      sub_21CAE34F0(v44, v42);
      v45 = *v40;
      v46 = v40[1];
      *v40 = v44;
      v40[1] = v42;
      sub_21CADEAB4(v45, v46);
      goto LABEL_26;
    }
    sub_21CAE4E94((uint64_t)v40);
    goto LABEL_24;
  }
  if (v42 >> 60 == 15)
  {
LABEL_24:
    *(_OWORD *)v40 = *(_OWORD *)v41;
    goto LABEL_26;
  }
  v43 = *v41;
  sub_21CAE34F0(v43, v42);
  *v40 = v43;
  v40[1] = v42;
LABEL_26:
  *(_BYTE *)(a1 + a3[21]) = *(_BYTE *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_21CAE4E94(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDF0] - 8) + 8))();
  return a1;
}

uint64_t sub_21CAE4EC8(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = a3[13];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  v11 = sub_21CAF80E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  v16 = a3[17];
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  v17 = (void *)(a1 + v16);
  v18 = (const void *)(a2 + v16);
  if (v13((const void *)(a2 + v16), 1, v11))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v17, v18, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
  }
  v20 = a3[19];
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  if (v13((const void *)(a2 + v20), 1, v11))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v21, v22, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v21, 0, 1, v11);
  }
  v24 = a3[21];
  *(_OWORD *)(a1 + a3[20]) = *(_OWORD *)(a2 + a3[20]);
  *(_BYTE *)(a1 + v24) = *(_BYTE *)(a2 + v24);
  return a1;
}

uint64_t sub_21CAE50DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v11 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v12;
  swift_bridgeObjectRelease();
  v13 = a3[13];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = sub_21CAF80E8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  v22 = a3[14];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  v27 = a3[15];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (uint64_t *)(a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v32 = a3[16];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (uint64_t *)(a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  v37 = a3[17];
  v38 = (void *)(a1 + v37);
  v39 = (void *)(a2 + v37);
  v40 = v18((void *)(a1 + v37), 1, v16);
  v41 = v18(v39, 1, v16);
  if (v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v38, v39, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v38, 0, 1, v16);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v41)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v38, v16);
LABEL_12:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v38, v39, v16);
LABEL_13:
  v43 = a3[18];
  v44 = (_QWORD *)(a1 + v43);
  v45 = (uint64_t *)(a2 + v43);
  v47 = *v45;
  v46 = v45[1];
  *v44 = v47;
  v44[1] = v46;
  swift_bridgeObjectRelease();
  v48 = a3[19];
  v49 = (void *)(a1 + v48);
  v50 = (void *)(a2 + v48);
  v51 = v18((void *)(a1 + v48), 1, v16);
  v52 = v18(v50, 1, v16);
  if (v51)
  {
    if (!v52)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v49, v50, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v49, 0, 1, v16);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v52)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v49, v16);
LABEL_18:
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v49, v50, v16);
LABEL_19:
  v54 = a3[20];
  v55 = (uint64_t *)(a1 + v54);
  v56 = (uint64_t *)(a2 + v54);
  v57 = *(_QWORD *)(a1 + v54 + 8);
  if (v57 >> 60 != 15)
  {
    v58 = v56[1];
    if (v58 >> 60 != 15)
    {
      v59 = *v55;
      *v55 = *v56;
      v55[1] = v58;
      sub_21CADEAB4(v59, v57);
      goto LABEL_24;
    }
    sub_21CAE4E94((uint64_t)v55);
  }
  *(_OWORD *)v55 = *(_OWORD *)v56;
LABEL_24:
  *(_BYTE *)(a1 + a3[21]) = *(_BYTE *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_21CAE54A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CAE54B4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 52), a2, v8);
  }
}

uint64_t sub_21CAE5534()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CAE5540(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 52), a2, a2, v7);
  }
  return result;
}

void sub_21CAE55B8()
{
  unint64_t v0;

  sub_21CAE0E10();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_21CAE5674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21CADEA58(v2 + *(int *)(a1 + 76), a2);
}

uint64_t sub_21CAE5684(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1 + *(int *)(a1 + 80);
  v3 = *(_QWORD *)v2;
  sub_21CAE5974(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  return v3;
}

uint64_t sub_21CAE56BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v30[32];
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v43 = a8;
  v44 = a4;
  v46 = a6;
  v47 = a7;
  v45 = a5;
  v41 = a2;
  v42 = a3;
  v39 = a9;
  v40 = a1;
  v38 = a10;
  v36 = a12;
  v37 = a11;
  v35 = a13;
  v33 = a15;
  v34 = a14;
  v31 = a18;
  v32 = a17;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  v24 = *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  v26 = sub_21CADEA58(a16, (uint64_t)&v31 - v25);
  MEMORY[0x24BDAC7A8](v26);
  v27 = sub_21CADEA58(a21, (uint64_t)&v31 - v25);
  MEMORY[0x24BDAC7A8](v27);
  v28 = sub_21CAF80E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))((char *)&v31 - v25, 1, 1, v28);
  *(_QWORD *)&v30[24] = v37;
  *(_OWORD *)&v30[8] = v38;
  *(_QWORD *)v30 = v43;
  sub_21CAE36D4(v40, v41, v42, v44, 0, v45, v46, v47, v39, *(__int128 *)v30, *(__int128 *)&v30[16], v36, v35, v34, v33, (uint64_t)&v31 - v25, v32, *((uint64_t *)&v32 + 1), v31,
    *((uint64_t *)&v31 + 1),
    a19,
    a20,
    (uint64_t)&v31 - v25,
    a22,
    a23,
    (uint64_t)&v31 - v25,
    0,
    0xF000000000000000,
    0);
  sub_21CADEAF8(a21);
  return sub_21CADEAF8(a16);
}

uint64_t sub_21CAE5890()
{
  return sub_21CAE5934(&qword_2552D1040, (uint64_t)&unk_21CAF9C88);
}

uint64_t sub_21CAE58B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21CADEA58(v1, a1);
}

uint64_t sub_21CAE58C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21CADEA58(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_21CAE58D0(_QWORD *a1)
{
  uint64_t result;

  a1[1] = sub_21CAE5934(&qword_2552D1048, (uint64_t)&unk_21CAF9C20);
  a1[2] = sub_21CAE5934(&qword_2552D1050, (uint64_t)&unk_21CAF9C48);
  result = sub_21CAE5934(&qword_2552D1058, (uint64_t)&unk_21CAF9CB0);
  a1[3] = result;
  return result;
}

uint64_t sub_21CAE5934(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for RCSChatBotBrand(255);
    result = MEMORY[0x220787808](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21CAE5974(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21CAE34F0(a1, a2);
  return a1;
}

void sub_21CAE5988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  char *v13;
  void *v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD aBlock[7];

  v9 = v8;
  v13 = *(char **)(v8 + 16);
  v14 = *(void **)&v13[OBJC_IVAR____TtC16BusinessServices19XPCDaemonConnection_connection];
  v15 = v13;
  v16 = objc_msgSend(v14, sel_remoteObjectProxy);
  sub_21CAF8328();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1178);
  swift_dynamicCast();
  v17 = (void *)aBlock[6];

  v18 = (void *)sub_21CAF81CC();
  v19 = (void *)sub_21CAF80B8();
  if (a6 >> 60 == 15)
    v20 = 0;
  else
    v20 = (void *)sub_21CAF80F4();
  v21 = *(unsigned __int8 *)(v9 + 24);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a7;
  *(_QWORD *)(v22 + 24) = a8;
  aBlock[4] = sub_21CAE6E60;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CAE5EBC;
  aBlock[3] = &block_descriptor_6;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_assetDataForBrandURI_URL_type_fingerprint_cachingEnabled_completion_, v18, v19, a4, v20, v21, v23);
  _Block_release(v23);
  swift_unknownObjectRelease();

}

void sub_21CAE5B58(uint64_t a1, unint64_t a2, id a3, void (*a4)(id, unint64_t, uint64_t))
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  _BYTE *v23;
  id v24;
  uint64_t v26;

  if (a3)
  {
    v6 = a3;
    if (qword_2552D0AF8 != -1)
      swift_once();
    v7 = sub_21CAF8178();
    __swift_project_value_buffer(v7, (uint64_t)qword_2552D2AB0);
    v8 = a3;
    v9 = a3;
    v10 = sub_21CAF8160();
    v11 = sub_21CAF82A4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v26 = v13;
      *(_DWORD *)v12 = 136315138;
      v14 = a3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1190);
      v15 = sub_21CAF8208();
      sub_21CAE2520(v15, v16, &v26);
      sub_21CAF8310();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CADC000, v10, v11, "Error fetching logo: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v13, -1, -1);
      MEMORY[0x2207878A4](v12, -1, -1);
    }
    else
    {

    }
    v24 = a3;
    a4(a3, 0, 1);

  }
  else if (a2 >> 60 == 15)
  {
    if (qword_2552D0AF8 != -1)
      swift_once();
    v18 = sub_21CAF8178();
    __swift_project_value_buffer(v18, (uint64_t)qword_2552D2AB0);
    v19 = sub_21CAF8160();
    v20 = sub_21CAF8298();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21CADC000, v19, v20, "Got nil data for logo even when there was no error", v21, 2u);
      MEMORY[0x2207878A4](v21, -1, -1);
    }

    sub_21CAE6E68();
    v22 = (void *)swift_allocError();
    *v23 = 1;
    a4(v22, 0, 1);

  }
  else
  {
    sub_21CAE34F0(a1, a2);
    a4((id)a1, a2, 0);
    sub_21CADEAA0(a1, a2);
  }
}

uint64_t sub_21CAE5EBC(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_21CAF8100();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_21CADEAA0((uint64_t)v4, v8);
  return swift_release();
}

void sub_21CAE5F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD aBlock[7];

  v8 = *(char **)(v4 + 16);
  v9 = *(void **)&v8[OBJC_IVAR____TtC16BusinessServices19XPCDaemonConnection_connection];
  v10 = v8;
  v11 = objc_msgSend(v9, sel_remoteObjectProxy);
  sub_21CAF8328();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1178);
  swift_dynamicCast();
  v12 = (void *)aBlock[6];

  v13 = (void *)sub_21CAF80B8();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = a4;
  aBlock[4] = sub_21CAE6ED0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CAE5EBC;
  aBlock[3] = &block_descriptor_14;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_fetchAssetWithURL_assetType_completion_, v13, a2, v15);
  _Block_release(v15);
  swift_unknownObjectRelease();

}

void sub_21CAE60C0(uint64_t a1, unint64_t a2, id a3, uint64_t a4, void (*a5)(id, unint64_t, uint64_t))
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void *v23;
  _BYTE *v24;
  id v25;
  uint64_t v27;

  if (a3)
  {
    v7 = a3;
    if (qword_2552D0AF8 != -1)
      swift_once();
    v8 = sub_21CAF8178();
    __swift_project_value_buffer(v8, (uint64_t)qword_2552D2AB0);
    v9 = a3;
    v10 = a3;
    v11 = sub_21CAF8160();
    v12 = sub_21CAF82A4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v27 = v14;
      *(_DWORD *)v13 = 134218242;
      sub_21CAF8310();
      *(_WORD *)(v13 + 12) = 2080;
      v15 = a3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1190);
      v16 = sub_21CAF8208();
      sub_21CAE2520(v16, v17, &v27);
      sub_21CAF8310();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CADC000, v11, v12, "Error fetching asset of type %ld. Error: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v14, -1, -1);
      MEMORY[0x2207878A4](v13, -1, -1);
    }
    else
    {

    }
    v25 = a3;
    a5(a3, 0, 1);

  }
  else if (a2 >> 60 == 15)
  {
    if (qword_2552D0AF8 != -1)
      swift_once();
    v19 = sub_21CAF8178();
    __swift_project_value_buffer(v19, (uint64_t)qword_2552D2AB0);
    v20 = sub_21CAF8160();
    v21 = sub_21CAF8298();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21CADC000, v20, v21, "Got nil data for logo even when there was no error", v22, 2u);
      MEMORY[0x2207878A4](v22, -1, -1);
    }

    sub_21CAE6E68();
    v23 = (void *)swift_allocError();
    *v24 = 1;
    a5(v23, 0, 1);

  }
  else
  {
    sub_21CAE34F0(a1, a2);
    a5((id)a1, a2, 0);
    sub_21CADEAA0(a1, a2);
  }
}

uint64_t sub_21CAE6444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[23] = a4;
  v5[24] = v4;
  v5[21] = a2;
  v5[22] = a3;
  v5[20] = a1;
  return swift_task_switch();
}

uint64_t sub_21CAE6464()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *v3;
  char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;

  v1 = *(_QWORD *)(v0 + 192);
  if (*(_BYTE *)(v1 + 24) == 1)
  {
    v2 = *(char **)(v1 + 16);
    v3 = *(void **)&v2[OBJC_IVAR____TtC16BusinessServices19XPCDaemonConnection_connection];
    v4 = v2;
    v5 = objc_msgSend(v3, sel_remoteObjectProxy);
    sub_21CAF8328();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1178);
    swift_dynamicCast();
    v6 = *(void **)(v0 + 152);
    *(_QWORD *)(v0 + 200) = v6;

    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1188);
    *(_QWORD *)(v0 + 208) = v7;
    *(_QWORD *)(v0 + 216) = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
    v8 = swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v8;
    v9 = sub_21CAF81CC();
    *(_QWORD *)(v0 + 232) = v9;
    v10 = sub_21CAF80B8();
    *(_QWORD *)(v0 + 240) = v10;
    *(_QWORD *)(v0 + 56) = v8;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21CAE66FC;
    v11 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v12 = (_QWORD *)(v0 + 80);
    v12[1] = 0x40000000;
    v12[2] = sub_21CAE68A8;
    v12[3] = &block_descriptor_2;
    v12[4] = v11;
    objc_msgSend(v6, sel_logoFileURLForBrandURI_remoteURL_completion_, v9, v10, v12);
    return swift_continuation_await();
  }
  else
  {
    if (qword_2552D0AF8 != -1)
      swift_once();
    v14 = sub_21CAF8178();
    __swift_project_value_buffer(v14, (uint64_t)qword_2552D2AB0);
    v15 = sub_21CAF8160();
    v16 = sub_21CAF82B0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21CADC000, v15, v16, "This SPI only works when caching is enabled", v17, 2u);
      MEMORY[0x2207878A4](v17, -1, -1);
    }

    sub_21CAE6DB0();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21CAE66FC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 248) = v2;
  if (!v2)
    *(_DWORD *)(v1 + 256) = *(_DWORD *)(*(_QWORD *)(v1 + 208) + 48);
  return swift_task_switch();
}

uint64_t sub_21CAE6768()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void *v11;

  v1 = *(void **)(v0 + 240);
  v11 = *(void **)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = (uint64_t *)(v2 + *(int *)(v0 + 256));
  v5 = swift_task_alloc();
  v6 = sub_21CAF80E8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(v5, v2, v6);
  v8 = *v4;
  v9 = v4[1];
  v7(v3, v5, v6);
  swift_task_dealloc();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v8, v9);
}

uint64_t sub_21CAE6844()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 240);
  v2 = *(void **)(v0 + 232);
  swift_willThrow();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21CAE68A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  _QWORD *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1190);
    swift_allocError();
    *v6 = a4;
    v7 = a4;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1188);
    MEMORY[0x24BDAC7A8](v9);
    v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_21CAF80C4();
    v12 = (uint64_t *)&v11[*(int *)(v9 + 48)];
    *v12 = sub_21CAF81D8();
    v12[1] = v13;
    sub_21CAE6DF4((uint64_t)v11, *(_QWORD *)(*(_QWORD *)(v4 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

void sub_21CAE69B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char *v7;
  void *v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[7];

  v7 = *(char **)(v4 + 16);
  v8 = *(void **)&v7[OBJC_IVAR____TtC16BusinessServices19XPCDaemonConnection_connection];
  v9 = v7;
  v10 = objc_msgSend(v8, sel_remoteObjectProxy);
  sub_21CAF8328();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1178);
  swift_dynamicCast();
  v11 = (void *)aBlock[6];

  v12 = (void *)sub_21CAF81CC();
  aBlock[4] = a3;
  aBlock[5] = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CAE6AF4;
  aBlock[3] = &block_descriptor;
  v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_clearCachedAssetsForBrandURI_completion_, v12, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();

}

void sub_21CAE6AF4(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_21CAE6B48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v5;
  void *v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD aBlock[7];

  v5 = *(char **)(v2 + 16);
  v6 = *(void **)&v5[OBJC_IVAR____TtC16BusinessServices19XPCDaemonConnection_connection];
  v7 = v5;
  v8 = objc_msgSend(v6, sel_remoteObjectProxy);
  sub_21CAF8328();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1178);
  swift_dynamicCast();
  v9 = (void *)aBlock[6];

  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CAE6AF4;
  aBlock[3] = &block_descriptor_17;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_clearUnusedCachedLogos_, v10);
  _Block_release(v10);
  return swift_unknownObjectRelease();
}

uint64_t BrandService.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BrandService.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

void sub_21CAE6CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21CAE5988(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_21CAE6CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v10;
  _QWORD *v11;

  v10 = *v4;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_21CAE15B8;
  v11[23] = a4;
  v11[24] = v10;
  v11[21] = a2;
  v11[22] = a3;
  v11[20] = a1;
  return swift_task_switch();
}

void sub_21CAE6D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21CAE69B0(a1, a2, a3, a4);
}

uint64_t type metadata accessor for BrandService()
{
  return objc_opt_self();
}

uint64_t method lookup function for BrandService()
{
  return swift_lookUpClassMethod();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_21CAE6DB0()
{
  unint64_t result;

  result = qword_2552D1180;
  if (!qword_2552D1180)
  {
    result = MEMORY[0x220787808](&unk_21CAF9E1C, &type metadata for BrandServiceError);
    atomic_store(result, (unint64_t *)&qword_2552D1180);
  }
  return result;
}

uint64_t sub_21CAE6DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CAE6E3C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CAE6E60(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_21CAE5B58(a1, a2, a3, *(void (**)(id, unint64_t, uint64_t))(v3 + 16));
}

unint64_t sub_21CAE6E68()
{
  unint64_t result;

  result = qword_2552D1198;
  if (!qword_2552D1198)
  {
    result = MEMORY[0x220787808](&unk_21CAF9F84, &type metadata for BrandAssetNetworkFetchError);
    atomic_store(result, (unint64_t *)&qword_2552D1198);
  }
  return result;
}

uint64_t sub_21CAE6EAC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CAE6ED0(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_21CAE60C0(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void (**)(id, unint64_t, uint64_t))(v3 + 24));
}

uint64_t storeEnumTagSinglePayload for BrandServiceError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21CAE6F1C + 4 * byte_21CAF9D30[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21CAE6F3C + 4 * byte_21CAF9D35[v4]))();
}

_BYTE *sub_21CAE6F1C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21CAE6F3C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CAE6F44(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CAE6F4C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CAE6F54(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CAE6F5C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BrandServiceError()
{
  return &type metadata for BrandServiceError;
}

unint64_t sub_21CAE6F7C()
{
  unint64_t result;

  result = qword_2552D11A0;
  if (!qword_2552D11A0)
  {
    result = MEMORY[0x220787808](&unk_21CAF9DF4, &type metadata for BrandServiceError);
    atomic_store(result, (unint64_t *)&qword_2552D11A0);
  }
  return result;
}

uint64_t OpaqueWrapper.wrappedThing.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21CAE3554(v1 + OBJC_IVAR____BSOpaqueWrapper_wrappedThing, a1);
}

id OpaqueWrapper.__allocating_init(_:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  id v4;
  objc_super v6;

  v3 = objc_allocWithZone(v1);
  sub_21CAE3554(a1, (uint64_t)v3 + OBJC_IVAR____BSOpaqueWrapper_wrappedThing);
  v6.receiver = v3;
  v6.super_class = v1;
  v4 = objc_msgSendSuper2(&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v4;
}

id OpaqueWrapper.init(_:)(uint64_t a1)
{
  void *v1;
  id v3;
  objc_super v5;

  sub_21CAE3554(a1, (uint64_t)v1 + OBJC_IVAR____BSOpaqueWrapper_wrappedThing);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for OpaqueWrapper();
  v3 = objc_msgSendSuper2(&v5, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v3;
}

uint64_t type metadata accessor for OpaqueWrapper()
{
  return objc_opt_self();
}

id OpaqueWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void OpaqueWrapper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id OpaqueWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OpaqueWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for OpaqueWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OpaqueWrapper.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of BrandAssetDataSource.assetData(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21CAE172C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of BrandLogoURLProvider.squareLogoURLForDesiredSize(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of BrandLogoURLProvider.wideLogoURLForDesiredSize(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL sub_21CAE72E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21CAE72FC()
{
  sub_21CAF8448();
  sub_21CAF8454();
  return sub_21CAF8460();
}

uint64_t sub_21CAE7340()
{
  return sub_21CAF8454();
}

uint64_t sub_21CAE7368()
{
  sub_21CAF8448();
  sub_21CAF8454();
  return sub_21CAF8460();
}

uint64_t BrandAssetNetworkFetcher.init(networkProvider:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21CAE3660(a1, a2);
}

uint64_t BrandAssetNetworkFetcher.assetData(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_21CAE73C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t (*v17)(_QWORD, uint64_t, uint64_t);
  uint64_t v18;

  if (qword_2552D0AF8 != -1)
    swift_once();
  v1 = v0[3];
  v2 = sub_21CAF8178();
  __swift_project_value_buffer(v2, (uint64_t)qword_2552D2AB0);
  v3 = sub_21CAF80E8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v1, v3);
  v6 = sub_21CAF8160();
  v7 = sub_21CAF8298();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v18 = v16;
    *(_DWORD *)v8 = 136315138;
    sub_21CAE76DC();
    v9 = sub_21CAF83D0();
    v0[2] = sub_21CAE2520(v9, v10, &v18);
    sub_21CAF8310();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
    _os_log_impl(&dword_21CADC000, v6, v7, "Fetching data for URL: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v16, -1, -1);
    MEMORY[0x2207878A4](v8, -1, -1);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  }

  v11 = (_QWORD *)v0[4];
  swift_task_dealloc();
  v12 = v11[3];
  v13 = v11[4];
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v17 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v13 + 8) + *(_QWORD *)(v13 + 8));
  v14 = (_QWORD *)swift_task_alloc();
  v0[5] = v14;
  *v14 = v0;
  v14[1] = sub_21CAE7618;
  return v17(v0[3], v12, v13);
}

uint64_t sub_21CAE7618(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_21CAE767C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21CAE15B8;
  v4[3] = a1;
  v4[4] = v1;
  return swift_task_switch();
}

unint64_t sub_21CAE76DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552D11F0;
  if (!qword_2552D11F0)
  {
    v1 = sub_21CAF80E8();
    result = MEMORY[0x220787808](MEMORY[0x24BDCDB30], v1);
    atomic_store(result, (unint64_t *)&qword_2552D11F0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BrandAssetNetworkFetcher(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for BrandAssetNetworkFetcher(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for BrandAssetNetworkFetcher(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for BrandAssetNetworkFetcher(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BrandAssetNetworkFetcher(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BrandAssetNetworkFetcher(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BrandAssetNetworkFetcher()
{
  return &type metadata for BrandAssetNetworkFetcher;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrandAssetNetworkFetchError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BrandAssetNetworkFetchError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CAE7AF0 + 4 * byte_21CAF9EC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CAE7B24 + 4 * byte_21CAF9EC0[v4]))();
}

uint64_t sub_21CAE7B24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CAE7B2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CAE7B34);
  return result;
}

uint64_t sub_21CAE7B40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CAE7B48);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CAE7B4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CAE7B54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CAE7B60(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21CAE7B68(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BrandAssetNetworkFetchError()
{
  return &type metadata for BrandAssetNetworkFetchError;
}

unint64_t sub_21CAE7B88()
{
  unint64_t result;

  result = qword_2552D1200;
  if (!qword_2552D1200)
  {
    result = MEMORY[0x220787808](&unk_21CAF9F5C, &type metadata for BrandAssetNetworkFetchError);
    atomic_store(result, (unint64_t *)&qword_2552D1200);
  }
  return result;
}

uint64_t sub_21CAE7BCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_21CAE7C30()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  unsigned int *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _BYTE *v31;
  id v32;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2818]), sel_initWithQueue_, 0);
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 56) = v1;
  v2 = objc_msgSend(v1, sel_getSubscriptionInfoWithError_, v0 + 16);
  *(_QWORD *)(v0 + 64) = v2;
  v3 = *(void **)(v0 + 16);
  if (!v2)
  {
    v26 = v3;
    sub_21CAF80AC();

    swift_willThrow();
LABEL_14:

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v4 = v2;
  v5 = v3;
  sub_21CAEF534(v4);
  *(_QWORD *)(v0 + 72) = v6;
  if (!v6)
  {
    if (qword_2552D0B00 != -1)
      swift_once();
    v27 = sub_21CAF8178();
    __swift_project_value_buffer(v27, (uint64_t)qword_2552D2AC8);
    v28 = sub_21CAF8160();
    v29 = sub_21CAF82A4();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_21CADC000, v28, v29, "Did not find any valid CTXPCServiceSubscriptionContext object", v30, 2u);
      MEMORY[0x2207878A4](v30, -1, -1);
    }

    sub_21CAE8768();
    swift_allocError();
    *v31 = 0;
    swift_willThrow();

    goto LABEL_14;
  }
  v7 = v6;
  *(_QWORD *)(v0 + 24) = 0;
  v8 = objc_msgSend(v1, sel_getSystemConfiguration_withError_, v6, v0 + 24);
  *(_QWORD *)(v0 + 80) = v8;
  v9 = *(void **)(v0 + 24);
  if (!v8)
  {
    v32 = v9;
    sub_21CAF80AC();

    swift_willThrow();
    v1 = v4;
    goto LABEL_14;
  }
  v10 = v8;
  v11 = *(_QWORD *)(v0 + 48);
  v12 = sub_21CAF8154();
  *(_QWORD *)(v0 + 88) = v12;
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v0 + 96) = v13;
  v14 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v14;
  v15 = v9;
  v16 = objc_msgSend(v7, sel_slotID);
  v17 = (unsigned int *)MEMORY[0x24BE12270];
  if (v16 == (id)1)
    v17 = (unsigned int *)MEMORY[0x24BE12268];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v14, *v17, v12);
  v18 = sub_21CAF8148();
  *(_QWORD *)(v0 + 112) = v18;
  *(_QWORD *)(v0 + 120) = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v0 + 128) = swift_task_alloc();
  swift_task_alloc();
  (*(void (**)(void))(v13 + 16))();
  v19 = *(void **)(v11 + 16);
  v20 = v10;
  v21 = v19;
  sub_21CAF8130();
  swift_task_dealloc();
  v22 = sub_21CAF8064();
  *(_QWORD *)(v0 + 136) = v22;
  *(_QWORD *)(v0 + 144) = *(_QWORD *)(v22 - 8);
  *(_QWORD *)(v0 + 152) = swift_task_alloc();
  v23 = *(_QWORD *)(sub_21CAF80E8() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v23 + 16))();
  sub_21CAF8058();
  swift_task_dealloc();
  v24 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v24;
  *v24 = v0;
  v24[1] = sub_21CAE804C;
  return sub_21CAF813C();
}

uint64_t sub_21CAE804C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[21] = a1;
  v5[22] = a2;
  v5[23] = a3;
  v5[24] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_21CAE8100()
{
  __asm { BR              X11 }
}

uint64_t sub_21CAE84C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 112);
  v12 = *(_QWORD *)(v0 + 96);
  v7 = *(void **)(v0 + 80);
  v13 = *(_QWORD *)(v0 + 88);
  v8 = *(void **)(v0 + 64);
  v9 = *(void **)(v0 + 72);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v6, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t RCSChatBotNetworkProvider.__allocating_init(customURLCache:waitsForConnectivity:)(void *a1, char a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = swift_allocObject();
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v6 = v5;
  if (a1)
    objc_msgSend(v5, sel_setURLCache_, a1);
  objc_msgSend(v6, sel_setWaitsForConnectivity_, a2 & 1);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v6);

  *(_QWORD *)(v4 + 16) = v7;
  return v4;
}

uint64_t RCSChatBotNetworkProvider.init(customURLCache:waitsForConnectivity:)(void *a1, char a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v6 = v5;
  if (a1)
    objc_msgSend(v5, sel_setURLCache_, a1);
  objc_msgSend(v6, sel_setWaitsForConnectivity_, a2 & 1);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v6);

  *(_QWORD *)(v2 + 16) = v7;
  return v2;
}

uint64_t RCSChatBotNetworkProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t RCSChatBotNetworkProvider.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

unint64_t sub_21CAE8768()
{
  unint64_t result;

  result = qword_2552D1210;
  if (!qword_2552D1210)
  {
    result = MEMORY[0x220787808](&unk_21CAFA098, &type metadata for RCSChatBotNetworkProviderError);
    atomic_store(result, (unint64_t *)&qword_2552D1210);
  }
  return result;
}

uint64_t type metadata accessor for RCSChatBotNetworkProvider()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for RCSChatBotNetworkProviderError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CAE8818 + 4 * byte_21CAF9FD9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CAE884C + 4 * byte_21CAF9FD4[v4]))();
}

uint64_t sub_21CAE884C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CAE8854(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CAE885CLL);
  return result;
}

uint64_t sub_21CAE8868(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CAE8870);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CAE8874(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CAE887C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RCSChatBotNetworkProviderError()
{
  return &type metadata for RCSChatBotNetworkProviderError;
}

unint64_t sub_21CAE889C()
{
  unint64_t result;

  result = qword_2552D1220;
  if (!qword_2552D1220)
  {
    result = MEMORY[0x220787808](&unk_21CAFA070, &type metadata for RCSChatBotNetworkProviderError);
    atomic_store(result, (unint64_t *)&qword_2552D1220);
  }
  return result;
}

uint64_t BrandMessagingDetails.localizedResponseTime.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

BusinessServices::BrandMessagingDetails __swiftcall BrandMessagingDetails.init(localizedResponseTime:)(BusinessServices::BrandMessagingDetails localizedResponseTime)
{
  BusinessServices::BrandMessagingDetails *v1;

  *v1 = localizedResponseTime;
  return localizedResponseTime;
}

_QWORD *initializeBufferWithCopyOfBuffer for BrandMessagingDetails(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BrandMessagingDetails()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for BrandMessagingDetails(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for BrandMessagingDetails(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BrandMessagingDetails(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BrandMessagingDetails(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BrandMessagingDetails()
{
  return &type metadata for BrandMessagingDetails;
}

uint64_t BrandFactory.init(brandService:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t BrandFactory.makeBrand(brandModel:brandLogoURLProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  _UNKNOWN **v9;
  __int128 v10[2];
  __int128 v11[2];

  v4 = *v2;
  sub_21CAE361C(a1, (uint64_t)v11);
  sub_21CAE361C(a2, (uint64_t)v10);
  v8 = type metadata accessor for BrandService();
  v9 = &off_24E0A5DE0;
  *(_QWORD *)&v7 = v4;
  type metadata accessor for Brand();
  v5 = swift_allocObject();
  sub_21CAE3660(&v7, v5 + 96);
  sub_21CAE3660(v11, v5 + 16);
  sub_21CAE3660(v10, v5 + 56);
  swift_retain();
  return v5;
}

ValueMetadata *type metadata accessor for BrandFactory()
{
  return &type metadata for BrandFactory;
}

uint64_t sub_21CAE8B34()
{
  uint64_t v0;
  uint64_t v1;
  const __SCNetworkReachability *v2;
  const __SCNetworkReachability *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  const __SCNetworkReachability *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  SCNetworkReachabilityContext context;
  uint64_t v28;

  v1 = v0;
  v28 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)&address.sa_data[6] = 0;
  *(_QWORD *)address.sa_data = 0;
  *(_WORD *)&address.sa_len = 528;
  v2 = SCNetworkReachabilityCreateWithAddress(0, &address);
  if (v2)
  {
    v3 = v2;
    flags = 0;
    if (!SCNetworkReachabilityGetFlags(v2, &flags))
    {
      if (qword_2552D0B00 != -1)
        swift_once();
      v4 = sub_21CAF8178();
      __swift_project_value_buffer(v4, (uint64_t)qword_2552D2AC8);
      v5 = sub_21CAF8160();
      v6 = sub_21CAF82B0();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21CADC000, v5, v6, "Failed to determine initial reachability status", v7, 2u);
        MEMORY[0x2207878A4](v7, -1, -1);
      }

    }
    *(_QWORD *)(v1 + 16) = v3;
    *(_BYTE *)(v1 + 24) = (flags & 2) != 0;
    context.info = (void *)v1;
    memset(&context.retain, 0, 24);
    context.version = 0;
    v8 = v3;
    if (!SCNetworkReachabilitySetCallback(v8, (SCNetworkReachabilityCallBack)sub_21CAE8F20, &context))
    {
      if (qword_2552D0B00 != -1)
        swift_once();
      v9 = sub_21CAF8178();
      __swift_project_value_buffer(v9, (uint64_t)qword_2552D2AC8);
      v10 = sub_21CAF8160();
      v11 = sub_21CAF82B0();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_21CADC000, v10, v11, "Failed to configure reachability callback", v12, 2u);
        MEMORY[0x2207878A4](v12, -1, -1);
      }

    }
    sub_21CAE90EC();
    v13 = sub_21CAF82D4();
    v14 = SCNetworkReachabilitySetDispatchQueue(v8, v13);

    if (!v14)
    {
      if (qword_2552D0B00 != -1)
        swift_once();
      v15 = sub_21CAF8178();
      __swift_project_value_buffer(v15, (uint64_t)qword_2552D2AC8);
      v16 = sub_21CAF8160();
      v17 = sub_21CAF82B0();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_21CADC000, v16, v17, "Failed to configure reachability callback queue", v18, 2u);
        MEMORY[0x2207878A4](v18, -1, -1);
        v19 = v8;
        v8 = (const __SCNetworkReachability *)v16;
      }
      else
      {
        v19 = v16;
      }

    }
  }
  else
  {
    if (qword_2552D0B00 != -1)
      swift_once();
    v20 = sub_21CAF8178();
    __swift_project_value_buffer(v20, (uint64_t)qword_2552D2AC8);
    v21 = sub_21CAF8160();
    v22 = sub_21CAF82B0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21CADC000, v21, v22, "Failed to create network reachability", v23, 2u);
      MEMORY[0x2207878A4](v23, -1, -1);
    }

    sub_21CAE90DC(*(_QWORD *)(v1 + 32));
    type metadata accessor for NetworkReachabilityProvider();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v1;
}

void sub_21CAE8F20(uint64_t a1, char a2, uint64_t a3)
{
  sub_21CAE9128(a2, a3);
}

uint64_t sub_21CAE8F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  const char *v6;
  uint64_t v7;

  v1 = v0;
  if (SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(v0 + 16), 0))
  {
    if (qword_2552D0B00 != -1)
      swift_once();
    v2 = sub_21CAF8178();
    __swift_project_value_buffer(v2, (uint64_t)qword_2552D2AC8);
    v3 = sub_21CAF8160();
    v4 = sub_21CAF82B0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      v6 = "Unscheduled reachability callback";
LABEL_10:
      _os_log_impl(&dword_21CADC000, v3, v4, v6, v5, 2u);
      MEMORY[0x2207878A4](v5, -1, -1);
    }
  }
  else
  {
    if (qword_2552D0B00 != -1)
      swift_once();
    v7 = sub_21CAF8178();
    __swift_project_value_buffer(v7, (uint64_t)qword_2552D2AC8);
    v3 = sub_21CAF8160();
    v4 = sub_21CAF82B0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      v6 = "Failed to unschedule reachability callback";
      goto LABEL_10;
    }
  }

  sub_21CAE90DC(*(_QWORD *)(v1 + 32));
  return v1;
}

uint64_t sub_21CAE909C()
{
  sub_21CAE8F2C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NetworkReachabilityProvider()
{
  return objc_opt_self();
}

uint64_t sub_21CAE90DC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_21CAE90EC()
{
  unint64_t result;

  result = qword_2552D1308;
  if (!qword_2552D1308)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2552D1308);
  }
  return result;
}

void sub_21CAE9128(char a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  unsigned int v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  NSObject *oslog;

  if (a2)
  {
    v3 = a1 & 2;
    v4 = *(unsigned __int8 *)(a2 + 24) ^ (v3 >> 1);
    swift_retain();
    if ((v4 & 1) != 0)
    {
      if (qword_2552D0B00 != -1)
        swift_once();
      v5 = sub_21CAF8178();
      __swift_project_value_buffer(v5, (uint64_t)qword_2552D2AC8);
      v6 = sub_21CAF8160();
      v7 = sub_21CAF8298();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v8 = 67109120;
        v9 = v3 >> 1;
        sub_21CAF8310();
        _os_log_impl(&dword_21CADC000, v6, v7, "Network reachability changed: isReachable = %{BOOL}d", v8, 8u);
        MEMORY[0x2207878A4](v8, -1, -1);

      }
      else
      {

        v9 = v3 >> 1;
      }
      *(_BYTE *)(a2 + 24) = v9;
      v13 = *(void (**)(uint64_t))(a2 + 32);
      if (v13)
      {
        v14 = swift_retain();
        v13(v14);
        sub_21CAE90DC((uint64_t)v13);
      }
    }
    swift_release();
  }
  else
  {
    if (qword_2552D0B00 != -1)
      swift_once();
    v10 = sub_21CAF8178();
    __swift_project_value_buffer(v10, (uint64_t)qword_2552D2AC8);
    oslog = sub_21CAF8160();
    v11 = sub_21CAF8298();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21CADC000, oslog, v11, "Reachability callback info is nil", v12, 2u);
      MEMORY[0x2207878A4](v12, -1, -1);
    }

  }
}

uint64_t sub_21CAE936C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_21CAE9384()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  v1 = swift_task_alloc();
  sub_21CAF80DC();
  v2 = sub_21CAF80E8();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 16), v1, v2);
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(0x6F69736E65747865, 0xEF6E656B6F74206ELL);
  }
  return result;
}

uint64_t sub_21CAE9470()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FakeBrandService()
{
  return objc_opt_self();
}

void sub_21CAE94A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(id, unint64_t, uint64_t))
{
  sub_21CAE9550(a3, a7);
}

uint64_t sub_21CAE94CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21CAE15B8;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_21CAE952C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

void sub_21CAE9550(uint64_t a1, void (*a2)(id, unint64_t, uint64_t))
{
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  if (*(_BYTE *)(v2 + 16) == 1)
  {
    v4 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v5 = (void *)sub_21CAF81CC();
    v14 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, 1, 0);

    a2(v14, 0, 1);
  }
  else
  {
    v6 = sub_21CAF81FC();
    v7 = *(_QWORD *)(v6 - 8);
    MEMORY[0x24BDAC7A8](v6);
    v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_21CAF81F0();
    v10 = sub_21CAF81E4();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if (v12 >> 60 == 15)
    {
      __break(1u);
    }
    else
    {
      a2((id)v10, v12, 0);
      sub_21CADEAA0(v10, v12);
    }
  }
}

uint64_t BrandManagerObjcShim.__allocating_init(cachingEnabled:cacheURL:brandDataSourceWrapper:)(char a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v7;
  uint64_t v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_21CAE9E38(a1, a2, a3);

  return v8;
}

uint64_t BrandManagerObjcShim.init(cachingEnabled:cacheURL:brandDataSourceWrapper:)(char a1, uint64_t a2, void *a3)
{
  uint64_t v4;

  v4 = sub_21CAE9E38(a1, a2, a3);

  return v4;
}

uint64_t sub_21CAE984C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  swift_retain();
  sub_21CAE20DC(a1, a2, (uint64_t)sub_21CAE9FDC, v8);
  return swift_release();
}

void sub_21CAE98D0(id a1, char a2, void (*a3)(id, void *))
{
  objc_class *v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  if ((a2 & 1) != 0)
  {
    v8 = a1;
    v9 = (void *)sub_21CAF80A0();
    a3(0, v9);

    sub_21CAEA0B8(a1, 1);
  }
  else
  {
    v5 = (objc_class *)type metadata accessor for BrandObjcShim();
    v6 = (char *)objc_allocWithZone(v5);
    *(_QWORD *)&v6[OBJC_IVAR___BSBrandObjcShim_brand] = a1;
    v10.receiver = v6;
    v10.super_class = v5;
    swift_retain_n();
    v7 = objc_msgSendSuper2(&v10, sel_init);
    a3(v7, 0);

    sub_21CAEA0B8(a1, 0);
  }
}

uint64_t sub_21CAE9A80(uint64_t a1, uint64_t a2)
{
  swift_retain();
  sub_21CAE6B48(a1, a2);
  return swift_release();
}

void sub_21CAE9B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_21CAF80A0();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_21CAE9BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  swift_retain();
  swift_retain();
  sub_21CAE5F50(a1, a2, (uint64_t)sub_21CAE3194, v8);
  swift_release();
  return swift_release();
}

id BrandManagerObjcShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BrandManagerObjcShim.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BrandManagerObjcShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandManagerObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21CAE9E38(char a1, uint64_t a2, void *a3)
{
  void *v3;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  uint64_t result;
  objc_super v16;
  __int128 v17[2];
  uint64_t v18;
  _BYTE v19[40];

  v7 = v3;
  v8 = objc_msgSend(a3, sel_wrappedThing);
  sub_21CAF8328();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1428);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21CAE3660(v17, (uint64_t)v19);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
    MEMORY[0x24BDAC7A8](v9);
    v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_21CADEA58(a2, (uint64_t)v11);
    sub_21CAE361C((uint64_t)v19, (uint64_t)v17);
    v12 = _s16BusinessServices12BrandManagerC14cachingEnabled8cacheURL35brandRemoteDataSourceNeedingFactoryACSb_10Foundation0H0VSgAA0cjklmN0_ptcfC_0(a1 & 1, (uint64_t)v11, (uint64_t)v17);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    *(_QWORD *)&v7[OBJC_IVAR___BSBrandManagerObjcShim_brandManager] = v12;

    v13 = (objc_class *)type metadata accessor for BrandManagerObjcShim();
    v16.receiver = v7;
    v16.super_class = v13;
    v14 = objc_msgSendSuper2(&v16, sel_init);
    sub_21CAEA0C4(a2, &qword_2552D0EC0);
    return (uint64_t)v14;
  }
  else
  {
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    result = sub_21CAEA0C4((uint64_t)v17, &qword_2552D1430);
    __break(1u);
  }
  return result;
}

uint64_t sub_21CAE9FB8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CAE9FDC(void *a1, char a2)
{
  uint64_t v2;

  sub_21CAE98D0(a1, a2 & 1, *(void (**)(id, void *))(v2 + 16));
}

uint64_t type metadata accessor for BrandManagerObjcShim()
{
  return objc_opt_self();
}

uint64_t method lookup function for BrandManagerObjcShim()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BrandManagerObjcShim.__allocating_init(cachingEnabled:cacheURL:brandDataSourceWrapper:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of BrandManagerObjcShim.brandWithURI(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of BrandManagerObjcShim.clearUnusedCachedLogos(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of BrandManagerObjcShim.fetchAsset(withURL:assetType:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

void sub_21CAEA070(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_21CAEF948(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_21CAEA078()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAEA09C(uint64_t a1)
{
  uint64_t v1;

  sub_21CAE9B5C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAEA0A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_21CAEA0B8(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_21CAEA0C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21CAEA11C()
{
  uint64_t v0;

  sub_21CADEAF8(v0 + OBJC_IVAR____TtC16BusinessServices24FakeBrandLogoURLProvider_squareLogoURL);
  sub_21CADEAF8(v0 + OBJC_IVAR____TtC16BusinessServices24FakeBrandLogoURLProvider_wideLogoURL);
  return swift_deallocClassInstance();
}

uint64_t sub_21CAEA15C()
{
  return type metadata accessor for FakeBrandLogoURLProvider();
}

uint64_t type metadata accessor for FakeBrandLogoURLProvider()
{
  uint64_t result;

  result = qword_2552D1460;
  if (!qword_2552D1460)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21CAEA1A0()
{
  unint64_t v0;

  sub_21CAE0E10();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_21CAEA20C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *v1 + OBJC_IVAR____TtC16BusinessServices24FakeBrandLogoURLProvider_squareLogoURL;
  swift_beginAccess();
  return sub_21CADEA58(v3, a1);
}

uint64_t sub_21CAEA260@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_21CADEA58(*v1 + OBJC_IVAR____TtC16BusinessServices24FakeBrandLogoURLProvider_wideLogoURL, a1);
}

void sub_21CAEA278(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  void *v34;
  _BYTE *v35;
  void *v36;
  unint64_t v37;
  id v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  void (*v46)(uint64_t *);
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  void *v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  uint8_t *v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  _QWORD *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char isUniquelyReferenced_nonNull_native;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  id v90;
  id v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  _QWORD *v95;
  id v96;
  id v97;
  _QWORD v98[2];
  id v99;
  id v100;
  id v101;
  id v102;
  char *v103;
  unint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t *);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id v112;
  uint64_t v113[5];
  _BYTE v114[40];
  uint64_t v115;
  uint64_t v116[5];
  char v117[8];
  char v118;

  v5 = v4;
  v9 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v5 + 24);
  ObjectType = swift_getObjectType();
  v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(ObjectType, v10);
  v105 = v5;
  v112 = v12;
  sub_21CAEF534(v12);
  if (v13)
  {
    v14 = v13;
    v110 = a4;
    v106 = a3;
    v15 = sub_21CAED1E0(a1);
    v17 = v16;
    v109 = v10;
    v108 = v9;
    v107 = ObjectType;
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2760]), sel_init);
    v104 = v15;
    v111 = v17;
    v19 = (void *)sub_21CAF81CC();
    objc_msgSend(v18, sel_setUri_, v19);

    v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2768]), sel_init);
    v21 = sub_21CAF8124();
    v22 = *(_QWORD *)(v21 - 8);
    MEMORY[0x24BDAC7A8](v21);
    v24 = (char *)v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_21CAF8118();
    sub_21CAF810C();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    v25 = v107;
    v26 = (void *)sub_21CAF81CC();
    v27 = v20;
    v28 = v109;
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_setUuid_, v26);

    v29 = (void *)(*(uint64_t (**)(void *, id, uint64_t, uint64_t))(v28 + 40))(v14, v18, v25, v28);
    v36 = v29;
    v37 = v104;
    v102 = v27;
    v100 = v18;
    v99 = v14;
    v38 = objc_msgSend(v29, sel_renderInformation);
    v101 = v36;
    v39 = (char *)objc_msgSend(v36, sel_cacheType);
    if (qword_2552D0B00 != -1)
      swift_once();
    v40 = sub_21CAF8178();
    v41 = __swift_project_value_buffer(v40, (uint64_t)qword_2552D2AC8);
    v42 = (uint64_t)v111;
    swift_bridgeObjectRetain_n();
    v98[1] = v41;
    v43 = sub_21CAF8160();
    v44 = sub_21CAF828C();
    v45 = os_log_type_enabled(v43, v44);
    v46 = v106;
    v103 = v39;
    if (v45)
    {
      v47 = swift_slowAlloc();
      v116[0] = swift_slowAlloc();
      v48 = v116[0];
      *(_DWORD *)v47 = 134218242;
      v113[0] = (uint64_t)v39;
      sub_21CAF8310();
      *(_WORD *)(v47 + 12) = 2080;
      swift_bridgeObjectRetain();
      v113[0] = sub_21CAE2520(v37, (unint64_t)v111, v116);
      v42 = (uint64_t)v111;
      sub_21CAF8310();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CADC000, v43, v44, "brandModelWithURI: Chatbot Information cache state: %ld for %s", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v48, -1, -1);
      MEMORY[0x2207878A4](v47, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (v38)
    {
      if ((unint64_t)(v103 + 1) < 2)
      {
LABEL_21:
        swift_bridgeObjectRetain();
        v53 = sub_21CAF8160();
        v54 = sub_21CAF828C();
        v55 = os_log_type_enabled(v53, v54);
        v98[0] = v38;
        if (v55)
        {
          v56 = (uint8_t *)swift_slowAlloc();
          v57 = swift_slowAlloc();
          v116[0] = v57;
          *(_DWORD *)v56 = 136315138;
          v46 = v106;
          swift_bridgeObjectRetain();
          v113[0] = sub_21CAE2520(v37, v42, v116);
          sub_21CAF8310();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21CADC000, v53, v54, "brandModelWithURI: Fetching Chatbot Information from remote source for %s", v56, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207878A4](v57, -1, -1);
          MEMORY[0x2207878A4](v56, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v58 = v102;
        v59 = objc_msgSend(v102, sel_uuid, v98[0]);
        v60 = sub_21CAF81D8();
        v62 = v61;

        v63 = v105;
        v64 = (uint64_t *)(v105 + 40);
        swift_beginAccess();
        v65 = *(_QWORD *)(v63 + 40);
        if (*(_QWORD *)(v65 + 16))
        {
          swift_bridgeObjectRetain();
          v66 = sub_21CAEC7D8(v60, v62);
          if ((v67 & 1) != 0)
          {
            v68 = *(_QWORD **)(*(_QWORD *)(v65 + 56) + 8 * v66);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v69 = swift_allocObject();
            *(_QWORD *)(v69 + 16) = v46;
            *(_QWORD *)(v69 + 24) = v110;
            swift_retain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v68 = sub_21CAEC6D0(0, v68[2] + 1, 1, v68, &qword_2552D1538);
            v71 = v68[2];
            v70 = v68[3];
            if (v71 >= v70 >> 1)
              v68 = sub_21CAEC6D0((_QWORD *)(v70 > 1), v71 + 1, 1, v68, &qword_2552D1538);
            v68[2] = v71 + 1;
            v72 = &v68[2 * v71];
            v72[4] = sub_21CAEE05C;
            v72[5] = v69;
            v58 = v102;
            v73 = objc_msgSend(v102, sel_uuid);
            v74 = sub_21CAF81D8();
            v76 = v75;

            swift_beginAccess();
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v115 = *v64;
            *v64 = 0x8000000000000000;
            sub_21CAECED0((uint64_t)v68, v74, v76, isUniquelyReferenced_nonNull_native);
            *v64 = v115;
            goto LABEL_35;
          }
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        v78 = objc_msgSend(v58, sel_uuid);
        v79 = sub_21CAF81D8();
        v81 = v80;

        __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1538);
        v82 = swift_allocObject();
        *(_OWORD *)(v82 + 16) = xmmword_21CAF9A60;
        v83 = swift_allocObject();
        v84 = v110;
        *(_QWORD *)(v83 + 16) = v46;
        *(_QWORD *)(v83 + 24) = v84;
        *(_QWORD *)(v82 + 32) = sub_21CAED3AC;
        *(_QWORD *)(v82 + 40) = v83;
        swift_beginAccess();
        swift_retain();
        v85 = swift_isUniquelyReferenced_nonNull_native();
        v115 = *v64;
        *v64 = 0x8000000000000000;
        sub_21CAECED0(v82, v79, v81, v85);
        *v64 = v115;
LABEL_35:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        v86 = v99;
        v87 = v100;
        (*(void (**)(id, id, id, uint64_t))(v109 + 48))(v99, v100, v58, v107);
        v88 = (void *)v98[0];

        return;
      }
      if ((unint64_t)(v103 - 1) > 1)
      {
LABEL_31:

        swift_bridgeObjectRelease();
        return;
      }
      v111 = v38;
      v49 = sub_21CAF8160();
      v50 = sub_21CAF828C();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_21CADC000, v49, v50, "brandModelWithURI: Using cached Chatbot Information", v51, 2u);
        MEMORY[0x2207878A4](v51, -1, -1);
      }

      v52 = v111;
      sub_21CAEAFC4(v113, (unint64_t)v114, v111, v37, v42, v103 == (char *)2, 1);
      sub_21CAE361C((uint64_t)v113, (uint64_t)v116);
      sub_21CAE361C((uint64_t)v114, (uint64_t)v117);
      v118 = 0;
      v46(v116);

      sub_21CAEA0C4((uint64_t)v116, &qword_2552D1530);
      sub_21CAEA0C4((uint64_t)v113, &qword_2552D1540);
    }
    if ((unint64_t)(v103 + 1) <= 3 && v103 != (char *)1)
      goto LABEL_21;
    goto LABEL_31;
  }
  if (qword_2552D0B00 != -1)
    swift_once();
  v30 = sub_21CAF8178();
  __swift_project_value_buffer(v30, (uint64_t)qword_2552D2AC8);
  v31 = sub_21CAF8160();
  v32 = sub_21CAF82A4();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_21CADC000, v31, v32, "Did not find any valid CTXPCServiceSubscriptionContext object", v33, 2u);
    MEMORY[0x2207878A4](v33, -1, -1);
  }

  sub_21CAE8768();
  v34 = (void *)swift_allocError();
  *v35 = 0;
  swift_willThrow();

  if (qword_2552D0AF8 != -1)
    swift_once();
  v89 = sub_21CAF8178();
  __swift_project_value_buffer(v89, (uint64_t)qword_2552D2AB0);
  v90 = v34;
  v91 = v34;
  v92 = sub_21CAF8160();
  v93 = sub_21CAF82A4();
  if (os_log_type_enabled(v92, v93))
  {
    v94 = (uint8_t *)swift_slowAlloc();
    v95 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v94 = 138412290;
    v96 = v34;
    v116[0] = _swift_stdlib_bridgeErrorToNSError();
    sub_21CAF8310();
    *v95 = v116[0];

    _os_log_impl(&dword_21CADC000, v92, v93, "brandModelWithURI:resultHandler: error: %@", v94, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1218);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v95, -1, -1);
    MEMORY[0x2207878A4](v94, -1, -1);
  }
  else
  {

  }
  v116[0] = (uint64_t)v34;
  v118 = 1;
  v97 = v34;
  a3(v116);

  sub_21CAEA0C4((uint64_t)v116, &qword_2552D1530);
}

uint64_t sub_21CAEAFC4(uint64_t *a1, unint64_t a2, void *a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char **p_name;
  id v15;
  char **v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  char **v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  id v86;
  char **v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, uint64_t, uint64_t, uint64_t);
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  id v122;
  id v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  NSObject *v128;
  unint64_t v129;
  os_log_type_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t *v150;
  uint64_t v151;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void (*v157)(char *, uint64_t, uint64_t, uint64_t);
  char *v158;
  unint64_t *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t *v165;
  unint64_t *v166;
  unint64_t *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t *v180;
  int v181;
  unint64_t *v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  unsigned int v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;

  v181 = a7;
  v186 = a6;
  v180 = a1;
  v11 = sub_21CAF8178();
  v179 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (unint64_t)&v153 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  p_name = &BSBrandManager__classData.name;
  v15 = objc_msgSend(a3, sel_botInfo);
  v16 = &BSBrandManager__classData.name;
  v17 = objc_msgSend(v15, sel_pcc);

  v18 = objc_msgSend(v17, sel_orgDetails);
  if (!v18)
    goto LABEL_12;
  v19 = objc_msgSend(v18, sel_orgName);

  if (!v19)
    goto LABEL_12;
  v20 = objc_msgSend(v19, sel_list);

  sub_21CAEDF3C(0, &qword_2552D1660);
  v21 = sub_21CAF8250();

  if (!(v21 >> 62))
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = (char **)(&BSBrandManager__classData + 24);
    if (v22)
      goto LABEL_5;
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  v22 = sub_21CAF8394();
  swift_bridgeObjectRelease();
  v16 = &BSBrandManager__classData.name;
  if (!v22)
    goto LABEL_11;
LABEL_5:
  if ((v21 & 0xC000000000000001) != 0)
  {
    v23 = (id)MEMORY[0x2207872EC](0, v21);
  }
  else
  {
    if (!*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_129;
    }
    v23 = *(id *)(v21 + 32);
  }
  v24 = v23;
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v24, sel_displayName);

  if (v25)
  {
    v26 = sub_21CAF81D8();
    v176 = v27;
    v177 = v26;

    goto LABEL_13;
  }
LABEL_12:
  swift_bridgeObjectRetain();
  v176 = a5;
  v177 = a4;
LABEL_13:
  v28 = objc_msgSend(a3, sel_botInfo);
  v29 = objc_msgSend(v28, v16[174]);

  v30 = objc_msgSend(v29, sel_orgDetails);
  v178 = (uint64_t *)a2;
  if (v30)
  {
    v31 = objc_msgSend(v30, sel_orgDescription);

    if (v31
      && (v32 = objc_msgSend(v31, sel_orgDescription), v31, v32))
    {
      v33 = sub_21CAF81D8();
      v174 = v34;
      v175 = v33;

    }
    else
    {
      v174 = 0;
      v175 = 0;
    }
    v16 = (char **)(&BSBrandManager__classData + 24);
  }
  else
  {
    v174 = 0;
    v175 = 0;
  }
  v35 = objc_msgSend(a3, sel_botInfo);
  v36 = objc_msgSend(v35, v16[174]);

  v37 = objc_msgSend(v36, sel_orgDetails);
  v38 = &BSBrandManager__classData.name;
  if (v37
    && (v39 = objc_msgSend(v37, sel_communicationAddress), v37, v39))
  {
    v40 = objc_msgSend(v39, sel_telInformation);

    v41 = objc_msgSend(v40, sel_telNumber);
    v42 = objc_msgSend(v41, sel_number);

    v43 = sub_21CAF81D8();
    v172 = v44;
    v173 = v43;

  }
  else
  {
    v172 = 0;
    v173 = 0;
  }
  v45 = objc_msgSend(a3, sel_botInfo);
  v46 = objc_msgSend(v45, v16[174]);

  v47 = objc_msgSend(v46, sel_orgDetails);
  v187 = a5;
  v182 = (unint64_t *)v11;
  if (v47)
  {
    v48 = objc_msgSend(v47, sel_communicationAddress);

    if (v48)
    {
      v49 = objc_msgSend(v48, sel_uriList);

      v50 = objc_msgSend(v49, sel_list);
      sub_21CAEDF3C(0, &qword_2552D1658);
      v51 = sub_21CAF8250();

      if (v51 >> 62)
        goto LABEL_42;
      v52 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v52; v52 = sub_21CAF8394())
      {
        v153 = v13;
        v11 = a4;
        a4 = v51 & 0xC000000000000001;
        v13 = 4;
        a5 = (uint64_t)&BSBrandManager__classData.name;
        while (1)
        {
          v53 = a4 ? (id)MEMORY[0x2207872EC](v13 - 4, v51) : *(id *)(v51 + 8 * v13);
          v54 = v53;
          v38 = (char **)(v13 - 3);
          if (__OFADD__(v13 - 4, 1))
            break;
          if (objc_msgSend(v53, sel_label) == (id)1)
          {
            swift_bridgeObjectRelease_n();
            v56 = objc_msgSend(v54, sel_addressUri);

            a4 = v11;
            v13 = v153;
            a5 = v187;
            if (v56)
            {
              v55 = sub_21CAF81D8();
              v168 = v57;

            }
            else
            {
              v55 = 0;
              v168 = 0;
            }
            v11 = (uint64_t)v182;
            goto LABEL_40;
          }

          ++v13;
          if (v38 == (char **)v52)
          {
            swift_bridgeObjectRelease_n();
            v55 = 0;
            v168 = 0;
            a4 = v11;
            v11 = (uint64_t)v182;
            v13 = v153;
            a5 = v187;
LABEL_40:
            p_name = (char **)(&BSBrandManager__classData + 24);
            goto LABEL_45;
          }
        }
        __break(1u);
LABEL_42:
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease_n();
    }
  }
  v55 = 0;
  v168 = 0;
LABEL_45:
  v58 = objc_msgSend(a3, p_name[173], v153);
  v59 = objc_msgSend(v58, sel_email);

  if (v59)
  {
    v170 = sub_21CAF81D8();
    v169 = v60;

  }
  else
  {
    v170 = 0;
    v169 = 0;
  }
  v61 = objc_msgSend(a3, p_name[173]);
  v62 = objc_msgSend(v61, sel_addresses);

  v184 = a4;
  v171 = v55;
  if (!v62)
    goto LABEL_57;
  v63 = objc_msgSend(v62, sel_list);

  sub_21CAEDF3C(0, &qword_2552D1650);
  v64 = sub_21CAF8250();

  if (v64 >> 62)
  {
    swift_bridgeObjectRetain();
    v65 = sub_21CAF8394();
    swift_bridgeObjectRelease();
    if (v65)
      goto LABEL_51;
    goto LABEL_56;
  }
  v65 = *(_QWORD *)((v64 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v65)
  {
LABEL_56:
    swift_bridgeObjectRelease();
LABEL_57:
    v162 = 0;
    v161 = 0;
    goto LABEL_58;
  }
LABEL_51:
  if ((v64 & 0xC000000000000001) != 0)
  {
LABEL_104:
    v66 = (id)MEMORY[0x2207872EC](0, v64);
  }
  else
  {
    if (!*(_QWORD *)((v64 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_106;
    }
    v66 = *(id *)(v64 + 32);
  }
  v67 = v66;
  swift_bridgeObjectRelease();
  v68 = objc_msgSend(v67, sel_address);

  v162 = sub_21CAF81D8();
  v161 = v69;

LABEL_58:
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  v167 = &v153;
  v71 = *(_QWORD *)(*(_QWORD *)(v70 - 8) + 64);
  MEMORY[0x24BDAC7A8](v70);
  v72 = (v71 + 15) & 0xFFFFFFFFFFFFFFF0;
  v189 = (uint64_t)&v153 - v72;
  v73 = objc_msgSend(a3, p_name[173]);
  v74 = objc_msgSend(v73, sel_tcPageUrl);

  MEMORY[0x24BDAC7A8](v75);
  if (v74)
  {
    sub_21CAF80C4();

    v76 = sub_21CAF80E8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))((char *)&v153 - v72, 0, 1, v76);
  }
  else
  {
    v77 = sub_21CAF80E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 56))((char *)&v153 - v72, 1, 1, v77);
  }
  v78 = sub_21CAEDE70((uint64_t)&v153 - v72, v189);
  v166 = &v153;
  MEMORY[0x24BDAC7A8](v78);
  v79 = (v71 + 15) & 0xFFFFFFFFFFFFFFF0;
  v188 = (uint64_t)&v153 - v79;
  v80 = objc_msgSend(a3, p_name[173]);
  v81 = objc_msgSend(v80, sel_website);

  MEMORY[0x24BDAC7A8](v82);
  if (v81)
  {
    sub_21CAF80C4();

    v83 = sub_21CAF80E8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 56))((char *)&v153 - v79, 0, 1, v83);
  }
  else
  {
    v84 = sub_21CAF80E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v84 - 8) + 56))((char *)&v153 - v79, 1, 1, v84);
  }
  sub_21CAEDE70((uint64_t)&v153 - v79, v188);
  if ((v186 & 1) != 0)
  {
    v85 = 0;
  }
  else
  {
    v86 = objc_msgSend(a3, sel_verificationDetails);
    v85 = objc_msgSend(v86, sel_verified);

  }
  v87 = &BSBrandManager__classData.name;
  v88 = objc_msgSend(a3, sel_verificationDetails);
  v89 = objc_msgSend(v88, sel_verifiedBy);

  v164 = sub_21CAF81D8();
  v163 = v90;

  v165 = &v153;
  MEMORY[0x24BDAC7A8](v91);
  v183 = v71;
  v185 = (uint64_t)&v153 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = v85;
  if (!v85)
  {
    v100 = sub_21CAF80E8();
    v101 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 56))((char *)&v153 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v100);
    goto LABEL_82;
  }
  v92 = objc_msgSend(a3, p_name[173]);
  v93 = objc_msgSend(v92, sel_pcc);

  v94 = objc_msgSend(v93, sel_orgDetails);
  if (!v94)
    goto LABEL_80;
  v95 = objc_msgSend(v94, sel_mediaList);

  if (!v95)
    goto LABEL_80;
  v96 = objc_msgSend(v95, sel_entry);

  v97 = objc_msgSend(v96, sel_list);
  sub_21CAEDF3C(0, &qword_2552D1648);
  v22 = sub_21CAF8250();

  p_name = (char **)a5;
  a2 = v13;
  if (!(v22 >> 62))
  {
    v64 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v64)
      goto LABEL_72;
    goto LABEL_79;
  }
LABEL_129:
  swift_bridgeObjectRetain();
  v64 = sub_21CAF8394();
  if (!v64)
  {
LABEL_79:
    swift_bridgeObjectRelease_n();
    v13 = a2;
    a5 = (uint64_t)p_name;
    p_name = (char **)(&BSBrandManager__classData + 24);
    v87 = (char **)(&BSBrandManager__classData + 24);
    v11 = (uint64_t)v182;
    v71 = v183;
    v85 = v186;
LABEL_80:
    v100 = sub_21CAF80E8();
    v101 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 56))(v185, 1, 1, v100);
    goto LABEL_82;
  }
LABEL_72:
  v13 = 4;
  a5 = (uint64_t)&BSBrandManager__classData.name;
  while (1)
  {
    if ((v22 & 0xC000000000000001) != 0)
      v98 = (id)MEMORY[0x2207872EC](v13 - 4, v22);
    else
      v98 = *(id *)(v22 + 8 * v13);
    v99 = v98;
    v11 = v13 - 3;
    if (__OFADD__(v13 - 4, 1))
    {
LABEL_103:
      __break(1u);
      goto LABEL_104;
    }
    if (!objc_msgSend(v98, sel_label))
      break;

    ++v13;
    if (v11 == v64)
      goto LABEL_79;
  }
  swift_bridgeObjectRelease_n();
  v115 = objc_msgSend(v99, sel_media);

  v13 = a2;
  a5 = (uint64_t)p_name;
  p_name = (char **)(&BSBrandManager__classData + 24);
  v87 = (char **)(&BSBrandManager__classData + 24);
  v11 = (uint64_t)v182;
  v71 = v183;
  v85 = v186;
  if (!v115)
    goto LABEL_80;
  v116 = objc_msgSend(v115, sel_mediaUrl);

  v117 = objc_msgSend(v116, sel_url);
  v118 = v185;
  sub_21CAF80C4();

  v119 = sub_21CAF80E8();
  v120 = v118;
  v100 = v119;
  v101 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v119 - 8) + 56))(v120, 0, 1, v119);
LABEL_82:
  v159 = &v153;
  MEMORY[0x24BDAC7A8](v101);
  sub_21CAF80E8();
  v102 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 56);
  v158 = (char *)&v153 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = v100;
  v157 = v102;
  v102(v158, 1, 1, v100);
  v103 = objc_msgSend(a3, p_name[173]);
  v104 = objc_msgSend(v103, v87[174]);

  v105 = objc_msgSend(v104, sel_orgDetails);
  if (!v105
    || (v106 = objc_msgSend(v105, sel_mediaList), v105, !v106))
  {
    v155 = 0;
    v154 = 0xF000000000000000;
    goto LABEL_110;
  }
  v107 = objc_msgSend(v106, sel_entry);

  v108 = objc_msgSend(v107, sel_list);
  sub_21CAEDF3C(0, &qword_2552D1648);
  v65 = sub_21CAF8250();

  v38 = (char **)v13;
  if (!(v65 >> 62))
  {
    v64 = *(_QWORD *)((v65 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v64)
      goto LABEL_86;
    goto LABEL_107;
  }
LABEL_106:
  swift_bridgeObjectRetain();
  v64 = sub_21CAF8394();
  if (v64)
  {
LABEL_86:
    v13 = v65 & 0xC000000000000001;
    a5 = 4;
    p_name = &BSBrandManager__classData.name;
    while (1)
    {
      if (v13)
        v109 = (id)MEMORY[0x2207872EC](a5 - 4, v65);
      else
        v109 = *(id *)(v65 + 8 * a5);
      v110 = v109;
      v11 = a5 - 3;
      if (__OFADD__(a5 - 4, 1))
      {
        __break(1u);
        goto LABEL_103;
      }
      if (!objc_msgSend(v109, sel_label))
        break;

      ++a5;
      if (v11 == v64)
      {
        swift_bridgeObjectRelease_n();
LABEL_98:
        v155 = 0;
        v154 = 0xF000000000000000;
        a5 = v187;
        v11 = (uint64_t)v182;
        v13 = (unint64_t)v38;
        p_name = (char **)(&BSBrandManager__classData + 24);
        goto LABEL_108;
      }
    }
    swift_bridgeObjectRelease_n();
    v111 = objc_msgSend(v110, sel_media);

    if (!v111)
      goto LABEL_98;
    v112 = objc_msgSend(v111, sel_fingerprint);

    a5 = v187;
    v11 = (uint64_t)v182;
    v13 = (unint64_t)v38;
    p_name = (char **)(&BSBrandManager__classData + 24);
    v87 = (char **)(&BSBrandManager__classData + 24);
    if (v112)
    {
      v113 = objc_msgSend(v112, sel_data);

      v155 = sub_21CAF8100();
      v154 = v114;

    }
    else
    {
      v155 = 0;
      v154 = 0xF000000000000000;
    }
    goto LABEL_109;
  }
LABEL_107:
  swift_bridgeObjectRelease_n();
  v155 = 0;
  v154 = 0xF000000000000000;
  a5 = v187;
  v13 = (unint64_t)v38;
LABEL_108:
  v87 = &BSBrandManager__classData.name;
LABEL_109:
  v85 = v186;
LABEL_110:
  v121 = objc_msgSend(a3, p_name[173]);
  v122 = objc_msgSend(v121, v87[174]);

  v123 = objc_msgSend(v122, sel_orgDetails);
  if (v123)
  {
    v124 = objc_msgSend(v123, sel_categoryList);

    v125 = v179;
    if (v124)
    {
      v126 = objc_msgSend(v124, sel_categoryList);

      v156 = sub_21CAF8250();
    }
    else
    {
      v156 = 0;
    }
  }
  else
  {
    v156 = 0;
    v125 = v179;
  }
  if (qword_2552D0AF8 != -1)
    swift_once();
  v127 = __swift_project_value_buffer(v11, (uint64_t)qword_2552D2AB0);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v125 + 16))(v13, v127, v11);
  swift_bridgeObjectRetain_n();
  v128 = sub_21CAF8160();
  v129 = a5;
  v130 = sub_21CAF828C();
  if (os_log_type_enabled(v128, v130))
  {
    v131 = swift_slowAlloc();
    v153 = v13;
    v132 = v131;
    v133 = swift_slowAlloc();
    v191 = v133;
    *(_DWORD *)v132 = 136315394;
    swift_bridgeObjectRetain();
    v190 = sub_21CAE2520(v184, v129, &v191);
    sub_21CAF8310();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v132 + 12) = 2080;
    if (v85)
      v134 = 0x6465696669726556;
    else
      v134 = 0x6966697265766E55;
    if (v85)
      v135 = 0xE800000000000000;
    else
      v135 = 0xEA00000000006465;
    v190 = sub_21CAE2520(v134, v135, &v191);
    sub_21CAF8310();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v128, v130, "Brand with URI %s is %s", (uint8_t *)v132, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v133, -1, -1);
    MEMORY[0x2207878A4](v132, -1, -1);

    v136 = (*(uint64_t (**)(unint64_t, unint64_t *))(v125 + 8))(v153, v182);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v136 = (*(uint64_t (**)(unint64_t, uint64_t))(v125 + 8))(v13, v11);
  }
  v182 = &v153;
  v137 = v183;
  MEMORY[0x24BDAC7A8](v136);
  v138 = (char *)&v153 - ((v137 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = v188;
  v140 = sub_21CADEA58(v188, (uint64_t)v138);
  MEMORY[0x24BDAC7A8](v140);
  v141 = v189;
  v142 = sub_21CADEA58(v189, (uint64_t)v138);
  MEMORY[0x24BDAC7A8](v142);
  v143 = (uint64_t)v158;
  sub_21CADEA58((uint64_t)v158, (uint64_t)v138);
  v144 = type metadata accessor for RCSChatBotBrand(0);
  v145 = v180;
  v180[3] = v144;
  v145[4] = sub_21CAEDEB8();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v145);
  v147 = v187;
  swift_bridgeObjectRetain();
  sub_21CAE36D4(v184, v147, v177, v176, v156, v175, v174, v173, (uint64_t)boxed_opaque_existential_1, v172, 0, 0, v186, v164, v163, (uint64_t)v138, v171, v168, v170,
    v169,
    v162,
    v161,
    (uint64_t)v138,
    0,
    0,
    (uint64_t)v138,
    v155,
    v154,
    v181 & 1);
  v148 = type metadata accessor for ChatBotLogoURLProvider(0);
  v149 = v178;
  v178[3] = v148;
  v149[4] = (uint64_t)&off_24E0A5C98;
  v150 = __swift_allocate_boxed_opaque_existential_1(v149);
  v151 = v185;
  sub_21CADEA58(v185, (uint64_t)v150);
  v157((char *)v150 + *(int *)(v148 + 20), 1, 1, v160);
  sub_21CAEA0C4(v143, &qword_2552D0EC0);
  sub_21CAEA0C4(v151, &qword_2552D0EC0);
  sub_21CAEA0C4(v139, &qword_2552D0EC0);
  return sub_21CAEA0C4(v141, &qword_2552D0EC0);
}

uint64_t RCSChatBotBrandDataSource.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RCSChatBotBrandDataSource.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_21CAEC60C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4)
{
  sub_21CAEA278(a1, a2, a3, a4);
}

uint64_t RCSChatBotBrandDataSource.didFinishFetchChatBotRenderInformation(_:forChatBot:withRenderData:with:)(int a1, void *a2, id a3, void *a4)
{
  return sub_21CAED3CC(a2, a3, a4);
}

_QWORD *sub_21CAEC6C4(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_21CAEC6D0(a1, a2, a3, a4, &qword_2552D1620);
}

_QWORD *sub_21CAEC6D0(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v9 + 4])
          memmove(v14, a4 + 4, 16 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21CAEDD24(0, v9, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

unint64_t sub_21CAEC7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21CAF8448();
  sub_21CAF8220();
  v4 = sub_21CAF8460();
  return sub_21CAEC83C(a1, a2, v4);
}

unint64_t sub_21CAEC83C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21CAF83E8() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21CAF83E8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21CAEC91C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21CAEC7D8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21CAED02C();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_21CAECCFC(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21CAEC9E8(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1638);
  v36 = a2;
  v6 = sub_21CAF83AC();
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
    sub_21CAF8448();
    sub_21CAF8220();
    result = sub_21CAF8460();
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

unint64_t sub_21CAECCFC(unint64_t result, uint64_t a2)
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21CAF8340();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_21CAF8448();
        swift_bridgeObjectRetain();
        sub_21CAF8220();
        v9 = sub_21CAF8460();
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
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21CAECED0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21CAEC7D8(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_21CAED02C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_21CAEC9E8(v15, a4 & 1);
  v21 = sub_21CAEC7D8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21CAF83F4();
  __break(1u);
  return result;
}

void *sub_21CAED02C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1638);
  v2 = *v0;
  v3 = sub_21CAF83A0();
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

uint64_t sub_21CAED1E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int IsEmail;
  uint64_t v13;
  void *v14;
  int v15;
  _QWORD v17[2];

  v2 = sub_21CAF8088();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1668);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CAF807C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_21CAEA0C4((uint64_t)v8, &qword_2552D1668);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_21CAF8070();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v10)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  v11 = (void *)sub_21CAF81CC();
  IsEmail = IMStringIsEmail();

  if (!IsEmail)
  {
    v14 = (void *)sub_21CAF81CC();
    v15 = MEMORY[0x22078740C]();

    if (v15)
    {
      v13 = 980182388;
      goto LABEL_9;
    }
LABEL_10:
    swift_bridgeObjectRetain();
    return a1;
  }
  v13 = 980445555;
LABEL_9:
  v17[0] = v13;
  v17[1] = 0xE400000000000000;
  sub_21CAF822C();
  return v17[0];
}

uint64_t sub_21CAED388()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21CAED3AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21CAED3CC(void *a1, id a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char **p_name;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  char **v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t *);
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char **v60;
  uint64_t *v61;
  unint64_t v62;
  id v63;
  void (*v64)(uint64_t *);
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  id v69;
  NSObject *v70;
  os_log_type_t v71;
  uint64_t *v72;
  char **v73;
  uint64_t v74;
  _QWORD *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t result;
  uint64_t v84;
  id v85;
  id v86;
  void *v87;
  id v90;
  void (*v91)(uint64_t *);
  _BYTE v92[40];
  uint64_t v93[5];
  uint64_t v94[5];
  uint64_t v95;
  char v96;

  v4 = v3;
  v5 = a3;
  p_name = &BSBrandManager__classData.name;
  if (a2)
  {
    v8 = objc_msgSend(a2, sel_cacheType);
    if (qword_2552D0AF8 != -1)
      swift_once();
    v9 = sub_21CAF8178();
    __swift_project_value_buffer(v9, (uint64_t)qword_2552D2AB0);
    v10 = a1;
    v11 = sub_21CAF8160();
    v12 = sub_21CAF828C();
    if (os_log_type_enabled(v11, v12))
    {
      v87 = a1;
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v94[0] = v14;
      *(_DWORD *)v13 = 136315394;
      v85 = v8;
      v15 = objc_msgSend(v10, sel_uri);
      v16 = v4;
      v17 = sub_21CAF81D8();
      v19 = v18;

      v20 = v17;
      v4 = v16;
      sub_21CAE2520(v20, v19, v94);
      v5 = a3;
      sub_21CAF8310();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2048;
      v93[0] = (uint64_t)v85;
      sub_21CAF8310();
      _os_log_impl(&dword_21CADC000, v11, v12, "Successfully fetched Chatbot rendering information from CT for %s with cacheType %ld", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      v21 = v14;
      p_name = (char **)(&BSBrandManager__classData + 24);
LABEL_10:
      MEMORY[0x2207878A4](v21, -1, -1);
      v32 = v13;
      a1 = v87;
      MEMORY[0x2207878A4](v32, -1, -1);

      goto LABEL_13;
    }

  }
  else
  {
    if (qword_2552D0AF8 != -1)
      swift_once();
    v22 = sub_21CAF8178();
    __swift_project_value_buffer(v22, (uint64_t)qword_2552D2AB0);
    v23 = a1;
    v11 = sub_21CAF8160();
    v24 = sub_21CAF82A4();
    if (os_log_type_enabled(v11, v24))
    {
      v87 = a1;
      v13 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v94[0] = v25;
      *(_DWORD *)v13 = 136315138;
      v26 = v4;
      v27 = objc_msgSend(v23, sel_uri);
      v28 = sub_21CAF81D8();
      v30 = v29;

      v4 = v26;
      v31 = v28;
      p_name = (char **)(&BSBrandManager__classData + 24);
      v93[0] = sub_21CAE2520(v31, v30, v94);
      sub_21CAF8310();

      v5 = a3;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CADC000, v11, v24, "Fetched Chatbot rendering information from CT for %s but cacheType is unknown", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      v21 = v25;
      goto LABEL_10;
    }

  }
LABEL_13:
  v33 = objc_msgSend(a1, p_name[170]);
  v34 = sub_21CAF81D8();
  v36 = v35;

  v37 = objc_msgSend(v5, sel_operation);
  v38 = &BSBrandManager__classData.name;
  v39 = objc_msgSend(v37, sel_uuid);
  v40 = sub_21CAF81D8();
  v42 = v41;

  swift_beginAccess();
  v43 = *(_QWORD *)(v4 + 40);
  if (*(_QWORD *)(v43 + 16))
  {
    swift_bridgeObjectRetain();
    v44 = sub_21CAEC7D8(v40, v42);
    if ((v45 & 1) != 0)
    {
      v86 = v37;
      v46 = *(_QWORD *)(*(_QWORD *)(v43 + 56) + 8 * v44);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v47 = a2;
      if (a2 && (v48 = objc_msgSend(a2, sel_renderInformation)) != 0)
      {
        v90 = v48;
        sub_21CAEAFC4(v93, (unint64_t)v92, v48, v34, v36, objc_msgSend(v47, sel_cacheType) == (id)2, 0);
        swift_bridgeObjectRelease();
        v84 = v46;
        v49 = *(_QWORD *)(v46 + 16);
        if (v49)
        {
          v50 = v84 + 40;
          do
          {
            v51 = *(void (**)(uint64_t *))(v50 - 8);
            v52 = qword_2552D0AF8;
            swift_retain();
            if (v52 != -1)
              swift_once();
            v53 = sub_21CAF8178();
            __swift_project_value_buffer(v53, (uint64_t)qword_2552D2AB0);
            v54 = sub_21CAF8160();
            v55 = sub_21CAF828C();
            if (os_log_type_enabled(v54, v55))
            {
              v56 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v56 = 0;
              _os_log_impl(&dword_21CADC000, v54, v55, "Successfully returning chatbot rendering information", v56, 2u);
              MEMORY[0x2207878A4](v56, -1, -1);
            }

            sub_21CAE361C((uint64_t)v93, (uint64_t)v94);
            sub_21CAE361C((uint64_t)v92, (uint64_t)&v95);
            v96 = 0;
            v51(v94);
            swift_release();
            sub_21CAEA0C4((uint64_t)v94, &qword_2552D1530);
            v50 += 16;
            --v49;
          }
          while (v49);
        }
        swift_bridgeObjectRelease();

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v92);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v93);
      }
      else
      {
        swift_bridgeObjectRelease();
        v57 = v46;
        v58 = *(_QWORD *)(v46 + 16);
        if (!v58)
        {
          swift_bridgeObjectRelease();
          goto LABEL_42;
        }
        v59 = v57 + 40;
        v60 = &BSBrandManager__classData.name;
        v61 = qword_2552D2AB0;
        v62 = 0x2552D0000uLL;
        do
        {
          v64 = *(void (**)(uint64_t *))(v59 - 8);
          swift_retain();
          v65 = objc_msgSend(v5, v60[172]);
          if (v65)
          {

            v66 = objc_msgSend(v5, v60[172]);
            if (!v66)
            {
              result = swift_release();
              __break(1u);
              return result;
            }
          }
          else
          {
            sub_21CAEDE2C();
            v66 = (id)swift_allocError();
          }
          v91 = v64;
          if (*(_QWORD *)(v62 + 2808) != -1)
            swift_once();
          v67 = sub_21CAF8178();
          __swift_project_value_buffer(v67, (uint64_t)v61);
          v68 = v66;
          v69 = v66;
          v70 = sub_21CAF8160();
          v71 = sub_21CAF82A4();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = v61;
            v73 = v60;
            v74 = swift_slowAlloc();
            v75 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v74 = 138412290;
            v76 = v66;
            v77 = _swift_stdlib_bridgeErrorToNSError();
            *(_QWORD *)(v74 + 4) = v77;
            *v75 = v77;

            _os_log_impl(&dword_21CADC000, v70, v71, "Failed to fetch chatbot rendering information. Error %@", (uint8_t *)v74, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1218);
            swift_arrayDestroy();
            MEMORY[0x2207878A4](v75, -1, -1);
            v78 = v74;
            v60 = v73;
            v61 = v72;
            v62 = 0x2552D0000;
            v5 = a3;
            MEMORY[0x2207878A4](v78, -1, -1);
          }
          else
          {

          }
          v94[0] = (uint64_t)v66;
          v96 = 1;
          v63 = v66;
          v91(v94);

          swift_release();
          sub_21CAEA0C4((uint64_t)v94, &qword_2552D1530);
          v59 += 16;
          --v58;
        }
        while (v58);
        swift_bridgeObjectRelease();
      }
      v38 = (char **)(&BSBrandManager__classData + 24);
LABEL_42:
      v79 = objc_msgSend(v86, v38[169]);
      v80 = sub_21CAF81D8();
      v82 = v81;

      swift_beginAccess();
      sub_21CAEC91C(v80, v82);
      swift_endAccess();

      goto LABEL_43;
    }

    swift_bridgeObjectRelease();
  }
  else
  {

  }
LABEL_43:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for RCSChatBotBrandDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for RCSChatBotBrandDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RCSChatBotBrandDataSource.brandModelWithURI(_:resultHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_21CAEDD24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1628);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21CAF83C4();
  __break(1u);
  return result;
}

unint64_t sub_21CAEDE2C()
{
  unint64_t result;

  result = qword_2552D1630;
  if (!qword_2552D1630)
  {
    result = MEMORY[0x220787808](&unk_21CAFA358, &type metadata for RCSChatBotBrandDataSourceError);
    atomic_store(result, (unint64_t *)&qword_2552D1630);
  }
  return result;
}

uint64_t sub_21CAEDE70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21CAEDEB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552D1640;
  if (!qword_2552D1640)
  {
    v1 = type metadata accessor for RCSChatBotBrand(255);
    result = MEMORY[0x220787808](&unk_21CAF9CF8, v1);
    atomic_store(result, (unint64_t *)&qword_2552D1640);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_21CAEDF3C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RCSChatBotBrandDataSourceError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21CAEDFB4 + 4 * byte_21CAFA240[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21CAEDFD4 + 4 * byte_21CAFA245[v4]))();
}

_BYTE *sub_21CAEDFB4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21CAEDFD4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CAEDFDC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CAEDFE4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CAEDFEC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CAEDFF4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RCSChatBotBrandDataSourceError()
{
  return &type metadata for RCSChatBotBrandDataSourceError;
}

unint64_t sub_21CAEE014()
{
  unint64_t result;

  result = qword_2552D1670;
  if (!qword_2552D1670)
  {
    result = MEMORY[0x220787808](&unk_21CAFA330, &type metadata for RCSChatBotBrandDataSourceError);
    atomic_store(result, (unint64_t *)&qword_2552D1670);
  }
  return result;
}

uint64_t sub_21CAEE0BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BSBrandMessagingDetailsObjcShim_messagingDetails);
  swift_bridgeObjectRetain();
  return v1;
}

id BrandMessagingDetailsObjcShim.__allocating_init(_:)(_OWORD *a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_OWORD *)&v3[OBJC_IVAR___BSBrandMessagingDetailsObjcShim_messagingDetails] = *a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id BrandMessagingDetailsObjcShim.init(_:)(_OWORD *a1)
{
  char *v1;
  objc_super v3;

  *(_OWORD *)&v1[OBJC_IVAR___BSBrandMessagingDetailsObjcShim_messagingDetails] = *a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BrandMessagingDetailsObjcShim();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for BrandMessagingDetailsObjcShim()
{
  return objc_opt_self();
}

id BrandMessagingDetailsObjcShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BrandMessagingDetailsObjcShim.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BrandMessagingDetailsObjcShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandMessagingDetailsObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for BrandMessagingDetailsObjcShim()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BrandMessagingDetailsObjcShim.localizedResponseTime.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of BrandMessagingDetailsObjcShim.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_QWORD *sub_21CAEE290()
{
  uint64_t v0;
  _UNKNOWN **v1;
  uint64_t v2;
  _QWORD *result;

  type metadata accessor for NetworkReachabilityProvider();
  swift_allocObject();
  v0 = sub_21CAE8B34();
  if (v0)
    v1 = &off_24E0A6340;
  else
    v1 = 0;
  type metadata accessor for NetworkConnectivityTrampoline();
  v2 = swift_allocObject();
  result = sub_21CAEE350(v0, (uint64_t)v1, 0);
  qword_2552D16A8 = v2;
  return result;
}

uint64_t static NetworkConnectivityTrampoline.shared.getter()
{
  if (qword_2552D0AF0 != -1)
    swift_once();
  return swift_retain();
}

_QWORD *sub_21CAEE350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = v3;
  v26 = a2;
  v27 = a3;
  v25 = sub_21CAF82C8();
  v6 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21CAF82BC();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_21CAF81A8();
  MEMORY[0x24BDAC7A8](v11);
  v24[1] = sub_21CAE90EC();
  sub_21CAF819C();
  v28 = MEMORY[0x24BEE4AF8];
  sub_21CAEF400(&qword_2552D17A8, v10, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D17B0);
  sub_21CAEF440(&qword_2552D17B8, &qword_2552D17B0);
  sub_21CAF8334();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5750], v25);
  v12 = sub_21CAF82EC();
  v13 = MEMORY[0x24BEE4AF8];
  v3[5] = v12;
  v3[6] = v13;
  v14 = v26;
  v15 = v27;
  v3[2] = a1;
  v3[3] = v14;
  v16 = 200;
  if (v15 > 1)
    v16 = v15;
  v3[4] = v16;
  if (a1)
  {
    v17 = swift_allocObject();
    swift_weakInit();
    v18 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = sub_21CAEF4A4;
    *(_QWORD *)(a1 + 40) = v17;
    sub_21CAE90DC(v18);
  }
  else
  {
    if (qword_2552D0B00 != -1)
      swift_once();
    v19 = sub_21CAF8178();
    __swift_project_value_buffer(v19, (uint64_t)qword_2552D2AC8);
    v20 = sub_21CAF8160();
    v21 = sub_21CAF82B0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21CADC000, v20, v21, "networkReachabilityProvider is nil, requests will be unconditionally dispatched", v22, 2u);
      MEMORY[0x2207878A4](v22, -1, -1);
    }

  }
  return v4;
}

uint64_t sub_21CAEE624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v0 = sub_21CAF8184();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_21CAF81A8();
  v4 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21CAF8190();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v12 = result;
    v18 = v1;
    v13 = *(_QWORD *)(result + 16);
    if (v13)
    {
      if ((*(_BYTE *)(v13 + 24) & 1) != 0)
      {
        sub_21CAE90EC();
        (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5490], v7);
        swift_unknownObjectRetain();
        v17 = sub_21CAF82F8();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        aBlock[4] = sub_21CAEF4AC;
        aBlock[5] = v12;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_21CAEEF0C;
        aBlock[3] = &block_descriptor_18;
        v14 = _Block_copy(aBlock);
        swift_retain();
        sub_21CAF819C();
        v20 = MEMORY[0x24BEE4AF8];
        sub_21CAEF400((unint64_t *)&qword_2552D16B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2552D16B8);
        sub_21CAEF440((unint64_t *)&qword_2552D16C0, &qword_2552D16B8);
        sub_21CAF8334();
        v15 = (void *)v17;
        MEMORY[0x220787268](0, v6, v3, v14);
        _Block_release(v14);
        swift_unknownObjectRelease();

        (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v0);
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
        swift_release();
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_21CAEE8C8(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v5 = sub_21CAF8184();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21CAF81A8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v2 + 16);
  if (!v14 || (*(_BYTE *)(v14 + 24) & 1) != 0)
    return a1(v11);
  v20 = *(_QWORD *)(v2 + 40);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v2;
  v16[3] = a1;
  v16[4] = a2;
  aBlock[4] = sub_21CAEEF00;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CAEEF0C;
  aBlock[3] = &block_descriptor_0;
  v17 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  sub_21CAF819C();
  v21 = MEMORY[0x24BEE4AF8];
  sub_21CAEF400((unint64_t *)&qword_2552D16B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D16B8);
  v19 = v6;
  sub_21CAEF440((unint64_t *)&qword_2552D16C0, &qword_2552D16B8);
  sub_21CAF8334();
  MEMORY[0x220787268](0, v13, v8, v17);
  _Block_release(v17);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return swift_release();
}

uint64_t sub_21CAEEAEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v6 = sub_21CAF8184();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21CAF81A8();
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21CAF8190();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (uint64_t *)(a1 + 48);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 16) == *(_QWORD *)(a1 + 32))
  {
    result = swift_beginAccess();
    v18 = *v16;
    if (!*(_QWORD *)(*v16 + 16))
    {
      __break(1u);
      return result;
    }
    v36 = v6;
    v19 = a3;
    v21 = *(_QWORD *)(v18 + 32);
    v20 = *(_QWORD *)(v18 + 40);
    swift_retain();
    v37 = a2;
    sub_21CAEF290(0, 1);
    swift_endAccess();
    v22 = swift_allocObject();
    v35 = v7;
    v23 = v22;
    *(_QWORD *)(v22 + 16) = v21;
    *(_QWORD *)(v22 + 24) = v20;
    a3 = v19;
    sub_21CAE90EC();
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BEE5490], v12);
    v24 = (void *)sub_21CAF82F8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_21CAED3AC;
    *(_QWORD *)(v25 + 24) = v23;
    aBlock[4] = sub_21CAED3AC;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21CAEEF0C;
    aBlock[3] = &block_descriptor_12;
    v26 = _Block_copy(aBlock);
    swift_retain();
    sub_21CAF819C();
    v41 = MEMORY[0x24BEE4AF8];
    sub_21CAEF400((unint64_t *)&qword_2552D16B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D16B8);
    sub_21CAEF440((unint64_t *)&qword_2552D16C0, &qword_2552D16B8);
    v27 = v40;
    v28 = v36;
    sub_21CAF8334();
    MEMORY[0x220787268](0, v11, v27, v26);
    a2 = v37;
    _Block_release(v26);
    swift_release();

    (*(void (**)(char *, uint64_t))(v35 + 8))(v27, v28);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v39);
    swift_release();
  }
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = a2;
  *(_QWORD *)(v29 + 24) = a3;
  swift_beginAccess();
  v30 = (_QWORD *)*v16;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v16 = (uint64_t)v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v30 = sub_21CAEC6C4(0, v30[2] + 1, 1, v30);
    *v16 = (uint64_t)v30;
  }
  v33 = v30[2];
  v32 = v30[3];
  if (v33 >= v32 >> 1)
  {
    v30 = sub_21CAEC6C4((_QWORD *)(v32 > 1), v33 + 1, 1, v30);
    *v16 = (uint64_t)v30;
  }
  v30[2] = v33 + 1;
  v34 = &v30[2 * v33];
  v34[4] = sub_21CAED3AC;
  v34[5] = v29;
  return swift_endAccess();
}

uint64_t sub_21CAEEED4()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21CAEEF00()
{
  uint64_t *v0;

  return sub_21CAEEAEC(v0[2], v0[3], v0[4]);
}

uint64_t sub_21CAEEF0C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207877FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21CAEEF94(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  _QWORD aBlock[6];
  uint64_t v13;

  v13 = MEMORY[0x24BEE4AF8];
  v2 = *(NSObject **)(a1 + 40);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = &v13;
  *(_QWORD *)(v3 + 24) = a1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_21CAEF4B4;
  *(_QWORD *)(v4 + 24) = v3;
  aBlock[4] = sub_21CAED3AC;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CAEF18C;
  aBlock[3] = &block_descriptor_27;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v2, v5);
  _Block_release(v5);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v2 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v7 = v13;
    v8 = *(_QWORD *)(v13 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      v9 = v7 + 40;
      do
      {
        v10 = *(void (**)(uint64_t))(v9 - 8);
        v11 = swift_retain();
        v10(v11);
        swift_release();
        v9 += 16;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
    }
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21CAEF11C(_QWORD *a1, uint64_t a2)
{
  swift_beginAccess();
  *a1 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a2 + 48) = MEMORY[0x24BEE4AF8];
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CAEF18C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t NetworkConnectivityTrampoline.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t NetworkConnectivityTrampoline.__deallocating_deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_21CAEF20C(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  return sub_21CAEE8C8(a1, a2);
}

uint64_t dispatch thunk of NetworkConnectivityTrampolineProtocol.withNetworkConnectivity(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for NetworkConnectivityTrampoline()
{
  return objc_opt_self();
}

uint64_t method lookup function for NetworkConnectivityTrampoline()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NetworkConnectivityTrampoline.withNetworkConnectivity(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t sub_21CAEF26C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21CAEF290(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_21CAEC6C4(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1628);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (_QWORD *)&v16[16 * v15])
      result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_21CAF83C4();
  __break(1u);
  return result;
}

uint64_t sub_21CAEF400(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220787808](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21CAEF440(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x220787808](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21CAEF480()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21CAEF4A4()
{
  return sub_21CAEE624();
}

uint64_t sub_21CAEF4AC()
{
  uint64_t v0;

  return sub_21CAEEF94(v0);
}

uint64_t sub_21CAEF4B4()
{
  uint64_t v0;

  return sub_21CAEF11C(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21CAEF4BC()
{
  return swift_deallocObject();
}

uint64_t ChatbotTelephonyUtilities.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ChatbotTelephonyUtilities.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ChatbotTelephonyUtilities()
{
  return objc_opt_self();
}

uint64_t method lookup function for ChatbotTelephonyUtilities()
{
  return swift_lookUpClassMethod();
}

void sub_21CAEF534(void *a1)
{
  unint64_t v1;
  SEL *p_name;
  id v3;
  unint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  SEL *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;

  v1 = (unint64_t)a1;
  p_name = (SEL *)&BSBrandManager__classData.name;
  v3 = objc_msgSend(a1, sel_subscriptions);
  if (!v3)
    goto LABEL_9;
  sub_21CAEF7D0();
  v4 = sub_21CAF8250();

  if (v4 >> 62)
    goto LABEL_30;
  v3 = *(id *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (!v3)
  {
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_9:
    v6 = objc_msgSend((id)v1, p_name[200]);
    if (!v6)
    {

      return;
    }
    v7 = v6;
    sub_21CAEF7D0();
    v1 = sub_21CAF8250();

    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_21CAF8394();
      swift_bridgeObjectRelease();
      if (!v4)
      {
LABEL_33:
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v4)
        goto LABEL_33;
    }
    v23 = v3;
    v8 = 4;
    while (1)
    {
      v9 = (v1 & 0xC000000000000001) != 0
         ? (SEL *)MEMORY[0x2207872EC](v8 - 4, v1)
         : (SEL *)*(id *)(v1 + 8 * v8);
      p_name = v9;
      v10 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      v11 = -[SEL phoneNumber](v9, sel_phoneNumber);
      if (v11)
      {
        v12 = v11;
        v13 = sub_21CAF81D8();
        v15 = v14;

        swift_bridgeObjectRelease();
        v16 = HIBYTE(v15) & 0xF;
        if ((v15 & 0x2000000000000000) == 0)
          v16 = v13 & 0xFFFFFFFFFFFFLL;
        if (v16)
          goto LABEL_26;
      }
      v17 = -[SEL labelID](p_name, sel_labelID);
      if (v17)
      {
        v18 = v17;
        v19 = sub_21CAF81D8();
        v21 = v20;

        swift_bridgeObjectRelease();
        v22 = HIBYTE(v21) & 0xF;
        if ((v21 & 0x2000000000000000) == 0)
          v22 = v19 & 0xFFFFFFFFFFFFLL;
        if (v22)
        {
LABEL_26:
          swift_bridgeObjectRelease();

          return;
        }
      }

      ++v8;
      if (v10 == v4)
        goto LABEL_33;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
    v3 = (id)sub_21CAF8394();
    swift_bridgeObjectRelease();
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x2207872EC](0, v4);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(v4 + 32);
LABEL_7:
    v3 = v5;
    goto LABEL_8;
  }
  __break(1u);
}

unint64_t sub_21CAEF7D0()
{
  unint64_t result;

  result = qword_2552D1868;
  if (!qword_2552D1868)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2552D1868);
  }
  return result;
}

uint64_t sub_21CAEF80C(uint64_t a1)
{
  return sub_21CAEF848(a1, qword_2552D2AB0);
}

uint64_t sub_21CAEF828(uint64_t a1)
{
  return sub_21CAEF848(a1, qword_2552D2AC8);
}

uint64_t sub_21CAEF848(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21CAF8178();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21CAF816C();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id BrandObjcShim.__allocating_init(_:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___BSBrandObjcShim_brand] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

void sub_21CAEF948(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;

  if (a2 >> 60 == 15)
    v5 = 0;
  else
    v5 = sub_21CAF80F4();
  v6 = (id)v5;
  (*(void (**)(uint64_t))(a4 + 16))(a4);

}

uint64_t sub_21CAEFA30()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
}

id sub_21CAEFB44()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = objc_msgSend(objc_allocWithZone((Class)IMSharedUtilitiesSoftLinkingWrapper), sel_init);
  v3 = v1[5];
  v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  v5 = (void *)sub_21CAF81CC();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v2, sel_isRCSChatBot_, v5);

  return v6;
}

uint64_t sub_21CAEFC74()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
}

uint64_t sub_21CAEFD5C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 48))(v2, v3);
}

uint64_t sub_21CAEFE44()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 64))(v2, v3);
}

uint64_t sub_21CAEFF2C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 72))(v2, v3);
}

uint64_t sub_21CAF0014()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 80))(v2, v3);
}

uint64_t sub_21CAF00D4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v3) & 1;
}

uint64_t sub_21CAF01C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 96))(v2, v3);
}

uint64_t sub_21CAF0314()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 104))(v2, v3);
}

uint64_t sub_21CAF0404()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 112))(v2, v3);
}

uint64_t sub_21CAF04EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 120))(v2, v3);
}

uint64_t sub_21CAF05D4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 128))(v2, v3);
}

uint64_t sub_21CAF0728()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 136))(v2, v3);
}

uint64_t sub_21CAF0884()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 144))(v2, v3);
}

uint64_t sub_21CAF0974()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 56))(v2, v3);
}

uint64_t sub_21CAF0A5C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 152))(v2, v3);
}

uint64_t sub_21CAF0B50()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR___BSBrandObjcShim_brand);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 160))(v2, v3);
}

id BrandObjcShim.init(_:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR___BSBrandObjcShim_brand] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BrandObjcShim();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t sub_21CAF0BDC(uint64_t a1, uint64_t a2, double a3, double a4)
{
  return sub_21CAF0C8C(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, double, double))sub_21CAF5B04, a3, a4);
}

uint64_t sub_21CAF0C80(uint64_t a1, uint64_t a2, double a3, double a4)
{
  return sub_21CAF0C8C(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, double, double))sub_21CAF6044, a3, a4);
}

uint64_t sub_21CAF0C8C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, double, double), double a4, double a5)
{
  uint64_t v5;
  uint64_t v11;

  v11 = *(_QWORD *)(v5 + OBJC_IVAR___BSBrandObjcShim_brand);
  swift_retain();
  a3(v11, a1, a2, a4, a5);
  return swift_release();
}

uint64_t sub_21CAF0D8C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 48) = v4;
  *(double *)(v5 + 32) = a3;
  *(double *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_21CAF0DAC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_21CAF0E0C;
  return sub_21CAF3B38(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_21CAF0E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_21CAF0FB0(uint64_t a1, const void *a2, void *a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v8;
  id v9;

  *(_QWORD *)(v5 + 40) = a3;
  *(double *)(v5 + 24) = a4;
  *(double *)(v5 + 32) = a5;
  *(_QWORD *)(v5 + 16) = a1;
  v8 = sub_21CAF80E8();
  *(_QWORD *)(v5 + 48) = v8;
  *(_QWORD *)(v5 + 56) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v5 + 64) = swift_task_alloc();
  *(_QWORD *)(v5 + 72) = _Block_copy(a2);
  v9 = a3;
  return swift_task_switch();
}

uint64_t sub_21CAF1030()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_21CAF1094;
  return sub_21CAF3B38(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_21CAF1094()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const void *v10;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(v2 + 72);
  v6 = *(_QWORD *)(v2 + 48);
  v7 = *(_QWORD *)(v2 + 56);

  v8 = (void *)sub_21CAF80B8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
  v9 = (void *)sub_21CAF81CC();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void *, void *, _QWORD))(v5 + 16))(v5, v8, v9, 0);

  v10 = *(const void **)(v2 + 72);
  _Block_release(v10);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21CAF11A0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  const void *v4;

  v1 = *(void **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 72);

  v3 = (void *)sub_21CAF80A0();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v2 + 16))(v2, 0, 0, v3);
  v4 = *(const void **)(v0 + 72);

  _Block_release(v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21CAF1224(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, unint64_t, void *), uint64_t a5, double a6, double a7)
{
  uint64_t v7;
  _QWORD *v15;

  v15 = *(_QWORD **)(v7 + OBJC_IVAR___BSBrandObjcShim_brand);
  swift_retain();
  sub_21CAF6584(a1, a2, a3, v15, a4, a5, a6, a7);
  return swift_release();
}

uint64_t sub_21CAF13A4(uint64_t a1, void (*a2)(_QWORD, unint64_t, void *), uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = *(_QWORD **)(v3 + OBJC_IVAR___BSBrandObjcShim_brand);
  swift_retain();
  sub_21CAF6BB4(a1, v7, a2, a3);
  return swift_release();
}

uint64_t sub_21CAF1480(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_21CAF5024();
  return swift_release();
}

void sub_21CAF14EC(void *a1, void (*a2)(void *))
{
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1190);
    sub_21CAE1FE0();
    if (swift_dynamicCast())
      v4 = v5;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  a2(v4);

}

uint64_t BrandObjcShim.brand.getter()
{
  return swift_retain();
}

id BrandObjcShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BrandObjcShim.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BrandObjcShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21CAF1704()
{
  if (qword_2552D0B10 != -1)
    swift_once();
  qword_2552D1870 = qword_2552D1910;
  *(_QWORD *)algn_2552D1878 = *(_QWORD *)algn_2552D1918;
  return swift_bridgeObjectRetain();
}

uint64_t static BrandObjcShim.placeholderName.getter()
{
  uint64_t v0;

  if (qword_2552D0B08 != -1)
    swift_once();
  v0 = qword_2552D1870;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t type metadata accessor for BrandObjcShim()
{
  return objc_opt_self();
}

uint64_t sub_21CAF1840(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_21CAF2608;
  return v6();
}

uint64_t sub_21CAF1894(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_21CAF2608;
  return v7();
}

uint64_t sub_21CAF18E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21CAF8274();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21CAF8268();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21CAEA0C4(a1, &qword_2552D18C0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21CAF825C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21CAF1A34(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21CAF1A98;
  return v6(a1);
}

uint64_t sub_21CAF1A98()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21CAF1AE4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CAF1B08(void *a1)
{
  uint64_t v1;

  sub_21CAF14EC(a1, *(void (**)(void *))(v1 + 16));
}

id _s16BusinessServices13BrandObjcShimC04mockC0ACyFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  objc_class *v15;
  char *v16;
  id v17;
  __int128 v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  __int128 v24;
  uint64_t v25;
  _UNKNOWN **v26;
  __int128 v27;
  uint64_t v28;
  _UNKNOWN **v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;

  v22 = type metadata accessor for MapKitBrand();
  MEMORY[0x24BDAC7A8](v22);
  v21 = (uint64_t)v20 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  v2 = *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CAF80DC();
  v4 = type metadata accessor for FakeBrandLogoURLProvider();
  v5 = swift_allocObject();
  v6 = v5 + OBJC_IVAR____TtC16BusinessServices24FakeBrandLogoURLProvider_squareLogoURL;
  v7 = sub_21CAF80E8();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  v8(v5 + OBJC_IVAR____TtC16BusinessServices24FakeBrandLogoURLProvider_wideLogoURL, 1, 1, v7);
  swift_beginAccess();
  sub_21CAF24F8((uint64_t)v3, v6);
  swift_endAccess();
  v9 = type metadata accessor for FakeBrandService();
  v10 = swift_allocObject();
  v20[1] = v20;
  *(_BYTE *)(v10 + 16) = 0;
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_21CADEA58((uint64_t)v3, (uint64_t)v3);
  MEMORY[0x24BDAC7A8](v11);
  sub_21CADEA58((uint64_t)v3, (uint64_t)v3);
  *(_QWORD *)&v19 = 0x42433043464623;
  *((_QWORD *)&v19 + 1) = 0xE700000000000000;
  v12 = v21;
  MapKitBrand.init(brandURI:name:localizedDescription:primaryPhoneNumber:primaryBrandColorHexString:secondaryBrandColorHexString:isVerified:verifiedBy:website:messageNumber:emailAddress:address:termsAndConditionsURL:localizedResponseTime:)(0xD00000000000002BLL, 0x800000021CAFCC90, 0x6172422074736554, 0xEA0000000000646ELL, 0xD0000000000000E5, 0x800000021CAFCCC0, 0xD000000000000010, 0x800000021CAFCDB0, v21, v19, 0x30383030303823, 0xE700000000000000, 1, 0xD000000000000011, 0x800000021CAFCDD0, (uint64_t)v3, 0xD000000000000010, 0x800000021CAFCDF0, 0x6C707061406F6F66,
    0xED00006D6F632E65,
    0xD000000000000030,
    0x800000021CAFCE10,
    (uint64_t)v3,
    0xD000000000000012,
    0x800000021CAFCE50);
  v31 = v22;
  v32 = sub_21CAF2540();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v30);
  sub_21CAF2588(v12, (uint64_t)boxed_opaque_existential_1);
  v28 = v4;
  v29 = &off_24E0A64B0;
  *(_QWORD *)&v27 = v5;
  v25 = v9;
  v26 = &off_24E0A6368;
  *(_QWORD *)&v24 = v10;
  type metadata accessor for Brand();
  v14 = swift_allocObject();
  sub_21CAE3660(&v24, v14 + 96);
  sub_21CAE3660(&v30, v14 + 16);
  sub_21CAE3660(&v27, v14 + 56);
  v15 = (objc_class *)type metadata accessor for BrandObjcShim();
  v16 = (char *)objc_allocWithZone(v15);
  *(_QWORD *)&v16[OBJC_IVAR___BSBrandObjcShim_brand] = v14;
  v23.receiver = v16;
  v23.super_class = v15;
  v17 = objc_msgSendSuper2(&v23, sel_init);
  sub_21CAF25CC(v12);
  sub_21CAEA0C4((uint64_t)v3, &qword_2552D0EC0);
  return v17;
}

uint64_t method lookup function for BrandObjcShim()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BrandObjcShim.brandURI.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of BrandObjcShim.isRCSChatBot.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of BrandObjcShim.name.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of BrandObjcShim.categories.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of BrandObjcShim.primaryPhoneNumber.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of BrandObjcShim.primaryBrandColorHexString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of BrandObjcShim.secondaryBrandColorHexString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of BrandObjcShim.isVerified.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of BrandObjcShim.verifiedBy.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of BrandObjcShim.website.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of BrandObjcShim.messageNumber.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of BrandObjcShim.emailAddress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of BrandObjcShim.address.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of BrandObjcShim.termsAndConditionsURL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of BrandObjcShim.genericCSSTemplateURL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of BrandObjcShim.localizedDescription.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of BrandObjcShim.localizedResponseTime.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of BrandObjcShim.logoFingerprint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of BrandObjcShim.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of BrandObjcShim.squareLogoDataForDesiredSize(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of BrandObjcShim.wideLogoDataForDesiredSize(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of BrandObjcShim.logoFileURL(ofType:desiredSize:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  _QWORD *v4;
  uint64_t v5;
  int *v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, double, double);

  v10 = *(int **)((*MEMORY[0x24BEE4EA0] & *v4) + 0x100);
  v13 = (uint64_t (*)(uint64_t, uint64_t, double, double))((char *)v10 + *v10);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_21CAE172C;
  return v13(a1, a2, a3, a4);
}

uint64_t dispatch thunk of BrandObjcShim.logoData(ofType:desiredSize:fingerprint:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of BrandObjcShim.assetData(ofType:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of BrandObjcShim.clearCachedAssets(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t sub_21CAF2230()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21CAF2240()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAF2264()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));

  return swift_deallocObject();
}

uint64_t sub_21CAF2290()
{
  double *v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  const void *v6;
  _QWORD *v7;

  v2 = *((_QWORD *)v0 + 2);
  v3 = v0[3];
  v4 = v0[4];
  v6 = (const void *)*((_QWORD *)v0 + 5);
  v5 = (void *)*((_QWORD *)v0 + 6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_21CAF2310;
  return ((uint64_t (*)(uint64_t, const void *, void *, double, double))((char *)&dword_2552D18C8
                                                                                + dword_2552D18C8))(v2, v6, v5, v3, v4);
}

uint64_t sub_21CAF2310()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21CAF235C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_21CAF2608;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2552D18D8 + dword_2552D18D8))(v2, v3, v4);
}

uint64_t objectdestroy_23Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21CAF2404(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21CAF2608;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2552D18E8 + dword_2552D18E8))(a1, v4, v5, v6);
}

uint64_t sub_21CAF2488(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21CAF2310;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2552D18F8 + dword_2552D18F8))(a1, v4);
}

uint64_t sub_21CAF24F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t sub_21CAF2540()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552D1908;
  if (!qword_2552D1908)
  {
    v1 = type metadata accessor for MapKitBrand();
    result = MEMORY[0x220787808](&protocol conformance descriptor for MapKitBrand, v1);
    atomic_store(result, (unint64_t *)&qword_2552D1908);
  }
  return result;
}

uint64_t sub_21CAF2588(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MapKitBrand();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CAF25CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MapKitBrand();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s16BusinessServices35BrandRemoteDataSourceNeedingFactoryP17brandModelWithURI_13resultHandlerySS_ys6ResultOyAA0cJ0_p_AA0C15LogoURLProvider_pts5Error_pGctFTj_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t destroy for BrandRemoteDataSourceFactoryComposition(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return swift_release();
}

uint64_t initializeWithCopy for BrandRemoteDataSourceFactoryComposition(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for BrandRemoteDataSourceFactoryComposition(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for BrandRemoteDataSourceFactoryComposition(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BrandRemoteDataSourceFactoryComposition(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BrandRemoteDataSourceFactoryComposition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BrandRemoteDataSourceFactoryComposition()
{
  return &type metadata for BrandRemoteDataSourceFactoryComposition;
}

void sub_21CAF27D8(uint64_t a1, uint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  uint64_t (*v26)();
  _QWORD *v27;
  __int128 v28;
  uint64_t v29;
  _UNKNOWN **v30;
  __int128 v31[2];
  _BYTE v32[40];
  _BYTE v33[40];
  __int128 v34[2];
  __int128 v35;
  char v36;

  v8 = sub_21CAF8184();
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_21CAF81A8();
  v11 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CAF2AC0(a1, (uint64_t)v34);
  if ((v36 & 1) != 0)
  {
    v14 = *(void **)&v34[0];
    v15 = *(id *)&v34[0];
    a3(v14, 1);

  }
  else
  {
    sub_21CAE3660(v34, (uint64_t)v33);
    sub_21CAE3660(&v35, (uint64_t)v32);
    v16 = *(_QWORD *)(a2 + 40);
    sub_21CAE361C((uint64_t)v33, (uint64_t)&v23);
    sub_21CAE361C((uint64_t)v32, (uint64_t)v31);
    v29 = type metadata accessor for BrandService();
    v30 = &off_24E0A5DE0;
    *(_QWORD *)&v28 = v16;
    type metadata accessor for Brand();
    v17 = swift_allocObject();
    sub_21CAE3660(&v28, v17 + 96);
    sub_21CAE3660(&v23, v17 + 16);
    sub_21CAE3660(v31, v17 + 56);
    sub_21CAE90EC();
    swift_retain();
    v18 = (void *)sub_21CAF82D4();
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = a3;
    v19[3] = a4;
    v19[4] = v17;
    v26 = sub_21CAF2B34;
    v27 = v19;
    *(_QWORD *)&v23 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v23 + 1) = 1107296256;
    v24 = sub_21CAEEF0C;
    v25 = &block_descriptor_1;
    v20 = _Block_copy(&v23);
    swift_retain();
    swift_retain();
    swift_release();
    sub_21CAF819C();
    *(_QWORD *)&v23 = MEMORY[0x24BEE4AF8];
    sub_21CAF2B78();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552D16B8);
    sub_21CAF2BC0();
    sub_21CAF8334();
    MEMORY[0x220787268](0, v13, v10, v20);
    _Block_release(v20);
    swift_release();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v21);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  }
}

uint64_t sub_21CAF2AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D1530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CAF2B08()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21CAF2B34()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), 0);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_21CAF2B78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552D16B0;
  if (!qword_2552D16B0)
  {
    v1 = sub_21CAF8184();
    result = MEMORY[0x220787808](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2552D16B0);
  }
  return result;
}

unint64_t sub_21CAF2BC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552D16C0;
  if (!qword_2552D16C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2552D16B8);
    result = MEMORY[0x220787808](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2552D16C0);
  }
  return result;
}

uint64_t sub_21CAF2C10()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
}

id sub_21CAF2C54()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = objc_msgSend(objc_allocWithZone((Class)IMSharedUtilitiesSoftLinkingWrapper), sel_init);
  v2 = v0[5];
  v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v4 = (void *)sub_21CAF81CC();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v1, sel_isRCSChatBot_, v4);

  return v5;
}

uint64_t sub_21CAF2CEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
}

uint64_t sub_21CAF2D30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(v1, v2);
}

uint64_t sub_21CAF2D74()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2);
}

uint64_t sub_21CAF2DB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v2) & 1;
}

uint64_t sub_21CAF2E00()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v2);
}

uint64_t sub_21CAF2E44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 56))(v1, v2);
}

uint64_t sub_21CAF2E88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 104))(v1, v2);
}

uint64_t sub_21CAF2ED4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 112))(v1, v2);
}

uint64_t sub_21CAF2F18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 120))(v1, v2);
}

uint64_t sub_21CAF2F5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 128))(v1, v2);
}

uint64_t sub_21CAF2FA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 136))(v1, v2);
}

uint64_t sub_21CAF2FEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 144))(v1, v2);
}

uint64_t sub_21CAF3038()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 160))(v1, v2);
}

uint64_t sub_21CAF307C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 152))(v1, v2);
}

void sub_21CAF30C0(void (*a1)(void *, _QWORD, uint64_t), uint64_t a2, double a3, double a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _BYTE *v41;
  _QWORD v42[2];
  void (*v43)(void *, _QWORD, uint64_t);
  uint64_t v44;
  uint64_t v45[5];
  uint64_t v46;

  v5 = v4;
  v43 = a1;
  v44 = a2;
  if (qword_2552D0AF8 != -1)
    swift_once();
  v8 = sub_21CAF8178();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v42[1] = v9;
  v10 = sub_21CAF8160();
  v11 = sub_21CAF82B0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    v45[0] = v13;
    v14 = v5[5];
    v15 = v5[6];
    __swift_project_boxed_opaque_existential_1(v5 + 2, v14);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
    v46 = sub_21CAE2520(v16, v17, v45);
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v10, v11, "Fetching squareLogoDataForDesiredSize for %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v13, -1, -1);
    MEMORY[0x2207878A4](v12, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v18 = sub_21CAF80E8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = v5[10];
  v26 = v5[11];
  __swift_project_boxed_opaque_existential_1(v5 + 7, v25);
  (*(void (**)(uint64_t, uint64_t, double, double))(v26 + 8))(v25, v26, a3, a4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v24, 1, v18) == 1)
  {
    sub_21CADEAF8((uint64_t)v24);
    swift_retain_n();
    v27 = sub_21CAF8160();
    v28 = sub_21CAF82B0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      *(_DWORD *)v29 = 136315138;
      v45[0] = v30;
      v31 = v5[5];
      v32 = v5[6];
      __swift_project_boxed_opaque_existential_1(v5 + 2, v31);
      v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 32))(v31, v32);
      v46 = sub_21CAE2520(v33, v34, v45);
      sub_21CAF8310();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CADC000, v27, v28, "Missing square logo url for brand with URI: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v30, -1, -1);
      MEMORY[0x2207878A4](v29, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    sub_21CAE6E68();
    v40 = (void *)swift_allocError();
    *v41 = 0;
    v43(v40, 0, 1);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v24, v18);
    sub_21CAE361C((uint64_t)(v5 + 12), (uint64_t)v45);
    v35 = v45[4];
    __swift_project_boxed_opaque_existential_1(v45, v45[3]);
    v36 = v5 + 2;
    v38 = v5[5];
    v37 = v5[6];
    __swift_project_boxed_opaque_existential_1(v36, v38);
    v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 32))(v38, v37);
    (*(void (**)(uint64_t))(v35 + 8))(v39);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  }
}

uint64_t Brand.squareLogoURLForDesiredSize(_:)(double a1, double a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2[10];
  v6 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v6 + 8))(v5, v6, a1, a2);
}

void sub_21CAF35FC(void (*a1)(void *, _QWORD, uint64_t), uint64_t a2, double a3, double a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _BYTE *v41;
  _QWORD v42[2];
  void (*v43)(void *, _QWORD, uint64_t);
  uint64_t v44;
  uint64_t v45[5];
  uint64_t v46;

  v5 = v4;
  v43 = a1;
  v44 = a2;
  if (qword_2552D0AF8 != -1)
    swift_once();
  v8 = sub_21CAF8178();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v42[1] = v9;
  v10 = sub_21CAF8160();
  v11 = sub_21CAF82B0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    v45[0] = v13;
    v14 = v5[5];
    v15 = v5[6];
    __swift_project_boxed_opaque_existential_1(v5 + 2, v14);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
    v46 = sub_21CAE2520(v16, v17, v45);
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v10, v11, "Fetching wideLogoDataForDesiredSize for %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v13, -1, -1);
    MEMORY[0x2207878A4](v12, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v18 = sub_21CAF80E8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = v5[10];
  v26 = v5[11];
  __swift_project_boxed_opaque_existential_1(v5 + 7, v25);
  (*(void (**)(uint64_t, uint64_t, double, double))(v26 + 16))(v25, v26, a3, a4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v24, 1, v18) == 1)
  {
    sub_21CADEAF8((uint64_t)v24);
    swift_retain_n();
    v27 = sub_21CAF8160();
    v28 = sub_21CAF82B0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      *(_DWORD *)v29 = 136315138;
      v45[0] = v30;
      v31 = v5[5];
      v32 = v5[6];
      __swift_project_boxed_opaque_existential_1(v5 + 2, v31);
      v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 32))(v31, v32);
      v46 = sub_21CAE2520(v33, v34, v45);
      sub_21CAF8310();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CADC000, v27, v28, "Missing wide logo url for brand with URI: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v30, -1, -1);
      MEMORY[0x2207878A4](v29, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    sub_21CAE6E68();
    v40 = (void *)swift_allocError();
    *v41 = 0;
    v43(v40, 0, 1);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v24, v18);
    sub_21CAE361C((uint64_t)(v5 + 12), (uint64_t)v45);
    v35 = v45[4];
    __swift_project_boxed_opaque_existential_1(v45, v45[3]);
    v36 = v5 + 2;
    v38 = v5[5];
    v37 = v5[6];
    __swift_project_boxed_opaque_existential_1(v36, v38);
    v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 32))(v38, v37);
    (*(void (**)(uint64_t))(v35 + 8))(v39);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  }
}

uint64_t Brand.wideLogoURLForDesiredSize(_:)(double a1, double a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2[10];
  v6 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v6 + 16))(v5, v6, a1, a2);
}

uint64_t sub_21CAF3B38(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 112) = v4;
  *(double *)(v5 + 96) = a3;
  *(double *)(v5 + 104) = a4;
  *(_QWORD *)(v5 + 80) = a1;
  *(_QWORD *)(v5 + 88) = a2;
  return swift_task_switch();
}

uint64_t sub_21CAF3B58()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  _QWORD *v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _BYTE *v51;
  uint64_t (*v52)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v53[2];

  if (qword_2552D0AF8 != -1)
    swift_once();
  v1 = sub_21CAF8178();
  __swift_project_value_buffer(v1, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v2 = sub_21CAF8160();
  v3 = sub_21CAF82B0();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD **)(v0 + 112);
  if (v4)
  {
    v6 = *(_QWORD *)(v0 + 88);
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v53[0] = v8;
    *(_DWORD *)v7 = 134218242;
    *(_QWORD *)(v0 + 64) = v6;
    sub_21CAF8310();
    *(_WORD *)(v7 + 12) = 2080;
    v9 = v5[5];
    v10 = v5[6];
    __swift_project_boxed_opaque_existential_1(v5 + 2, v9);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
    *(_QWORD *)(v0 + 72) = sub_21CAE2520(v11, v12, v53);
    sub_21CAF8310();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CADC000, v2, v3, "Fetching logoFileURL of type %ld for %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v8, -1, -1);
    MEMORY[0x2207878A4](v7, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v13 = *(_QWORD *)(v0 + 88);
  v14 = sub_21CAF80E8();
  *(_QWORD *)(v0 + 120) = v14;
  v15 = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v0 + 128) = v15;
  v16 = swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  v17 = swift_task_alloc();
  if (v13 == 2)
  {
    v23 = *(_QWORD **)(v0 + 112);
    v24 = v23[5];
    v25 = v23[6];
    __swift_project_boxed_opaque_existential_1(v23 + 2, v24);
    (*(void (**)(uint64_t, uint64_t))(v25 + 104))(v24, v25);
  }
  else if (v13 == 1)
  {
    v26 = *(_QWORD **)(v0 + 112);
    v28 = *(double *)(v0 + 96);
    v27 = *(double *)(v0 + 104);
    v29 = v26[10];
    v30 = v26[11];
    __swift_project_boxed_opaque_existential_1(v26 + 7, v29);
    (*(void (**)(uint64_t, uint64_t, double, double))(v30 + 16))(v29, v30, v28, v27);
  }
  else
  {
    if (v13)
      return sub_21CAF8388();
    v18 = *(_QWORD **)(v0 + 112);
    v20 = *(double *)(v0 + 96);
    v19 = *(double *)(v0 + 104);
    v21 = v18[10];
    v22 = v18[11];
    __swift_project_boxed_opaque_existential_1(v18 + 7, v21);
    (*(void (**)(uint64_t, uint64_t, double, double))(v22 + 8))(v21, v22, v20, v19);
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v17, 1, v14) == 1)
  {
    sub_21CADEAF8(v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_retain_n();
    v31 = sub_21CAF8160();
    v32 = sub_21CAF82B0();
    v33 = os_log_type_enabled(v31, v32);
    v34 = *(_QWORD **)(v0 + 112);
    if (v33)
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      *(_DWORD *)v35 = 136315138;
      v53[0] = v36;
      v38 = v34[5];
      v37 = v34[6];
      __swift_project_boxed_opaque_existential_1(v34 + 2, v38);
      v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 32))(v38, v37);
      *(_QWORD *)(v0 + 56) = sub_21CAE2520(v39, v40, v53);
      sub_21CAF8310();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CADC000, v31, v32, "Missing logo url for brand with URI: %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v36, -1, -1);
      MEMORY[0x2207878A4](v35, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    sub_21CAE6E68();
    swift_allocError();
    *v51 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v41 = *(_QWORD **)(v0 + 112);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v16, v17, v14);
    swift_task_dealloc();
    sub_21CAE361C((uint64_t)(v41 + 12), v0 + 16);
    v42 = *(_QWORD *)(v0 + 40);
    v43 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v42);
    v44 = v41[5];
    v45 = v41[6];
    __swift_project_boxed_opaque_existential_1(v41 + 2, v44);
    v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v45 + 32))(v44, v45);
    v48 = v47;
    *(_QWORD *)(v0 + 144) = v47;
    v52 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v43 + 16)
                                                                                      + *(_QWORD *)(v43 + 16));
    v49 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v49;
    *v49 = v0;
    v49[1] = sub_21CAF4150;
    return v52(*(_QWORD *)(v0 + 80), v46, v48, v16, v42, v43);
  }
}

uint64_t sub_21CAF4150(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 160) = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v2)
  {
    *(_QWORD *)(v6 + 168) = a2;
    *(_QWORD *)(v6 + 176) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_21CAF41D0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 168));
}

uint64_t sub_21CAF4228()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Brand.assetURL(forType:desiredSize:)(uint64_t a1, double a2, double a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 == 2)
  {
    v9 = v3[5];
    v10 = v3[6];
    __swift_project_boxed_opaque_existential_1(v3 + 2, v9);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 104))(v9, v10);
  }
  else if (a1 == 1)
  {
    v6 = v3[10];
    v7 = v3[11];
    __swift_project_boxed_opaque_existential_1(v3 + 7, v6);
    return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v7 + 16))(v6, v7, a2, a3);
  }
  else if (a1)
  {
    result = sub_21CAF8388();
    __break(1u);
  }
  else
  {
    v11 = v3[10];
    v12 = v3[11];
    __swift_project_boxed_opaque_existential_1(v3 + 7, v11);
    return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v12 + 8))(v11, v12, a2, a3);
  }
  return result;
}

{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  switch(a1)
  {
    case 0:
    case 2:
      v6 = v3[10];
      v7 = v3[11];
      __swift_project_boxed_opaque_existential_1(v3 + 7, v6);
      result = (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v7 + 8))(v6, v7, a2, a3);
      break;
    case 1:
      v9 = v3[10];
      v10 = v3[11];
      __swift_project_boxed_opaque_existential_1(v3 + 7, v9);
      result = (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v10 + 16))(v9, v10, a2, a3);
      break;
    case 3:
      v11 = v3[5];
      v12 = v3[6];
      __swift_project_boxed_opaque_existential_1(v3 + 2, v11);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 104))(v11, v12);
      break;
    default:
      result = sub_21CAF8388();
      __break(1u);
      break;
  }
  return result;
}

void sub_21CAF438C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, _QWORD, uint64_t), uint64_t a5, double a6, double a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(void *, _QWORD, uint64_t);
  void *v50;
  _BYTE *v51;
  _QWORD v52[3];
  uint64_t v53;
  void (*v54)(void *, _QWORD, uint64_t);
  uint64_t v55;
  uint64_t v56[5];
  uint64_t v57;

  v8 = v7;
  v55 = a5;
  v52[1] = a2;
  v52[2] = a3;
  if (qword_2552D0AF8 != -1)
    swift_once();
  v13 = sub_21CAF8178();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v52[0] = v14;
  v15 = sub_21CAF8160();
  v16 = sub_21CAF82B0();
  v53 = a1;
  v54 = a4;
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    v56[0] = v18;
    *(_DWORD *)v17 = 134218242;
    v57 = a1;
    sub_21CAF8310();
    *(_WORD *)(v17 + 12) = 2080;
    v20 = v8[5];
    v19 = v8[6];
    __swift_project_boxed_opaque_existential_1(v8 + 2, v20);
    v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 32))(v20, v19);
    v57 = sub_21CAE2520(v21, v22, v56);
    a1 = v53;
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v15, v16, "Fetching logoData ofType %ld for %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v18, -1, -1);
    MEMORY[0x2207878A4](v17, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v23 = sub_21CAF80E8();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 0:
    case 2:
      v30 = v8[10];
      v31 = v8[11];
      __swift_project_boxed_opaque_existential_1(v8 + 7, v30);
      (*(void (**)(uint64_t, uint64_t, double, double))(v31 + 8))(v30, v31, a6, a7);
      goto LABEL_11;
    case 1:
      v32 = v8[10];
      v33 = v8[11];
      __swift_project_boxed_opaque_existential_1(v8 + 7, v32);
      (*(void (**)(uint64_t, uint64_t, double, double))(v33 + 16))(v32, v33, a6, a7);
      goto LABEL_11;
    case 3:
      v34 = v8[5];
      v35 = v8[6];
      __swift_project_boxed_opaque_existential_1(v8 + 2, v34);
      (*(void (**)(uint64_t, uint64_t))(v35 + 104))(v34, v35);
LABEL_11:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v29, 1, v23) == 1)
      {
        sub_21CADEAF8((uint64_t)v29);
        swift_retain_n();
        v36 = sub_21CAF8160();
        v37 = sub_21CAF82B0();
        if (os_log_type_enabled(v36, v37))
        {
          v38 = (uint8_t *)swift_slowAlloc();
          v39 = swift_slowAlloc();
          *(_DWORD *)v38 = 136315138;
          v56[0] = v39;
          v40 = v8[5];
          v41 = v8[6];
          __swift_project_boxed_opaque_existential_1(v8 + 2, v40);
          v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 32))(v40, v41);
          v57 = sub_21CAE2520(v42, v43, v56);
          sub_21CAF8310();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21CADC000, v36, v37, "Missing logo url for brand with URI: %s", v38, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207878A4](v39, -1, -1);
          MEMORY[0x2207878A4](v38, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        v49 = v54;
        sub_21CAE6E68();
        v50 = (void *)swift_allocError();
        *v51 = 0;
        v49(v50, 0, 1);

      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v26, v29, v23);
        sub_21CAE361C((uint64_t)(v8 + 12), (uint64_t)v56);
        v44 = v56[4];
        __swift_project_boxed_opaque_existential_1(v56, v56[3]);
        v45 = v8 + 2;
        v47 = v8[5];
        v46 = v8[6];
        __swift_project_boxed_opaque_existential_1(v45, v47);
        v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 32))(v47, v46);
        (*(void (**)(uint64_t))(v44 + 8))(v48);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v56);
      }
      break;
    default:
      sub_21CAF8388();
      __break(1u);
      break;
  }
}

void sub_21CAF4A64(uint64_t a1, void (*a2)(void *, _QWORD, uint64_t), uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(void *, _QWORD, uint64_t);
  void *v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(void *, _QWORD, uint64_t);
  uint64_t v51;
  uint64_t v52[5];
  uint64_t v53;

  v4 = v3;
  v51 = a3;
  if (qword_2552D0AF8 != -1)
    swift_once();
  v7 = sub_21CAF8178();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v48 = v8;
  v9 = sub_21CAF8160();
  v10 = sub_21CAF82B0();
  v49 = a1;
  v50 = a2;
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v52[0] = v12;
    *(_DWORD *)v11 = 134218242;
    v53 = a1;
    sub_21CAF8310();
    *(_WORD *)(v11 + 12) = 2080;
    v14 = v4[5];
    v13 = v4[6];
    __swift_project_boxed_opaque_existential_1(v4 + 2, v14);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 32))(v14, v13);
    v53 = sub_21CAE2520(v15, v16, v52);
    a1 = v49;
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v9, v10, "Fetching assetData ofType %ld for %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v12, -1, -1);
    MEMORY[0x2207878A4](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v17 = sub_21CAF80E8();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *MEMORY[0x24BDBF148];
  v24 = *(double *)(MEMORY[0x24BDBF148] + 8);
  switch(a1)
  {
    case 0:
    case 2:
      v26 = v4[10];
      v27 = v4[11];
      __swift_project_boxed_opaque_existential_1(v4 + 7, v26);
      (*(void (**)(uint64_t, uint64_t, double, double))(v27 + 8))(v26, v27, v25, v24);
      goto LABEL_11;
    case 1:
      v28 = v4[10];
      v29 = v4[11];
      __swift_project_boxed_opaque_existential_1(v4 + 7, v28);
      (*(void (**)(uint64_t, uint64_t, double, double))(v29 + 16))(v28, v29, v25, v24);
      goto LABEL_11;
    case 3:
      v30 = v4[5];
      v31 = v4[6];
      __swift_project_boxed_opaque_existential_1(v4 + 2, v30);
      (*(void (**)(uint64_t, uint64_t))(v31 + 104))(v30, v31);
LABEL_11:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v23, 1, v17) == 1)
      {
        sub_21CADEAF8((uint64_t)v23);
        swift_retain_n();
        v32 = sub_21CAF8160();
        v33 = sub_21CAF82B0();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = (uint8_t *)swift_slowAlloc();
          v35 = swift_slowAlloc();
          *(_DWORD *)v34 = 136315138;
          v52[0] = v35;
          v36 = v4[5];
          v37 = v4[6];
          __swift_project_boxed_opaque_existential_1(v4 + 2, v36);
          v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 32))(v36, v37);
          v53 = sub_21CAE2520(v38, v39, v52);
          sub_21CAF8310();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21CADC000, v32, v33, "Missing logo url for brand with URI: %s", v34, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207878A4](v35, -1, -1);
          MEMORY[0x2207878A4](v34, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        v45 = v50;
        sub_21CAE6E68();
        v46 = (void *)swift_allocError();
        *v47 = 0;
        v45(v46, 0, 1);

      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v23, v17);
        sub_21CAE361C((uint64_t)(v4 + 12), (uint64_t)v52);
        v40 = v52[4];
        __swift_project_boxed_opaque_existential_1(v52, v52[3]);
        v41 = v4 + 2;
        v43 = v4[5];
        v42 = v4[6];
        __swift_project_boxed_opaque_existential_1(v41, v43);
        v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 32))(v43, v42);
        (*(void (**)(uint64_t))(v40 + 8))(v44);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
      }
      break;
    default:
      sub_21CAF8388();
      __break(1u);
      break;
  }
}

uint64_t sub_21CAF5024()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15[5];

  if (qword_2552D0AF8 != -1)
    swift_once();
  v1 = sub_21CAF8178();
  __swift_project_value_buffer(v1, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v2 = sub_21CAF8160();
  v3 = sub_21CAF82B0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    *(_DWORD *)v4 = 136315138;
    v15[0] = v5;
    v6 = v0[5];
    v7 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v6);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
    sub_21CAE2520(v8, v9, v15);
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v2, v3, "Calling clearCachedAssets for %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v5, -1, -1);
    MEMORY[0x2207878A4](v4, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  sub_21CAE361C((uint64_t)(v0 + 12), (uint64_t)v15);
  v10 = v15[4];
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  v12 = v0[5];
  v11 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v12);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 32))(v12, v11);
  (*(void (**)(uint64_t))(v10 + 24))(v13);
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

uint64_t sub_21CAF5274()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  sub_21CAF8220();
  return swift_bridgeObjectRelease();
}

uint64_t Brand.brandModel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21CAE361C(v1 + 16, a1);
}

uint64_t Brand.brandLogoURLProvider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21CAE361C(v1 + 56, a1);
}

uint64_t Brand.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  return v0;
}

uint64_t Brand.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  return swift_deallocClassInstance();
}

uint64_t sub_21CAF5370()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  sub_21CAF8448();
  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  sub_21CAF8220();
  swift_bridgeObjectRelease();
  return sub_21CAF8460();
}

uint64_t sub_21CAF53F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v1 + 16), v3);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  *a1 = result;
  a1[1] = v6;
  return result;
}

uint64_t sub_21CAF5440(_QWORD **a1, _QWORD **a2)
{
  return _s16BusinessServices5BrandC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_21CAF544C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)*v0;
  sub_21CAF8448();
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  sub_21CAF8220();
  swift_bridgeObjectRelease();
  return sub_21CAF8460();
}

uint64_t sub_21CAF54D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 16), v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  sub_21CAF8220();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CAF5538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_21CAF8448();
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 16), v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  sub_21CAF8220();
  swift_bridgeObjectRelease();
  return sub_21CAF8460();
}

uint64_t sub_21CAF55B8(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v2 + 56), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v6 + 8))(v5, v6, a1, a2);
}

uint64_t sub_21CAF5620(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v2 + 56), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(v6 + 16))(v5, v6, a1, a2);
}

uint64_t Brand.isAppleMainBrand.getter()
{
  return sub_21CAF56A0(sub_21CAE0E78);
}

uint64_t Brand.isAppleMakoBrand.getter()
{
  return sub_21CAF56A0(sub_21CAE0F08);
}

uint64_t sub_21CAF56A0(uint64_t (*a1)(uint64_t, uint64_t))
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + 2;
  v5 = v1[5];
  v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v3, v5);
  return a1(v5, v4) & 1;
}

void sub_21CAF56EC()
{
  id v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);

  v3 = sub_21CAF8094();
  v5 = v4;

  qword_2552D1910 = v3;
  *(_QWORD *)algn_2552D1918 = v5;
}

uint64_t static Brand.placeholderName.getter()
{
  uint64_t v0;

  if (qword_2552D0B10 != -1)
    swift_once();
  v0 = qword_2552D1910;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t _s16BusinessServices5BrandC2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v3 = a1[5];
  v4 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v3);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  v7 = v6;
  v8 = a2 + 2;
  v10 = a2[5];
  v9 = a2[6];
  __swift_project_boxed_opaque_existential_1(v8, v10);
  if (v5 == (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 32))(v10, v9) && v7 == v11)
    v13 = 1;
  else
    v13 = sub_21CAF83E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

unint64_t sub_21CAF58E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552D1928;
  if (!qword_2552D1928)
  {
    v1 = type metadata accessor for Brand();
    result = MEMORY[0x220787808](&protocol conformance descriptor for Brand, v1);
    atomic_store(result, (unint64_t *)&qword_2552D1928);
  }
  return result;
}

uint64_t type metadata accessor for Brand()
{
  return objc_opt_self();
}

uint64_t method lookup function for Brand()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Brand.brandURI.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of Brand.isRCSChatBot.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of Brand.name.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of Brand.categories.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of Brand.primaryPhoneNumber.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of Brand.isVerified.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of Brand.verifiedBy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of Brand.localizedDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of Brand.website.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of Brand.messageNumber.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of Brand.emailAddress.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of Brand.address.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of Brand.termsAndConditionsURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of Brand.genericCSSTemplateURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of Brand.logoFingerprint.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of Brand.localizedResponseTime.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of Brand.squareLogoDataForDesiredSize(_:resultHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of Brand.wideLogoDataForDesiredSize(_:resultHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of Brand.logoFileURL(ofType:desiredSize:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, double, double);

  v12 = (uint64_t (*)(uint64_t, uint64_t, double, double))(**(int **)(*(_QWORD *)v4 + 248)
                                                                 + *(_QWORD *)(*(_QWORD *)v4 + 248));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_21CAE172C;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of Brand.logoData(ofType:desiredSize:fingerprint:resultHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of Brand.assetData(ofType:resultHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of Brand.clearCachedAssets(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of Brand.id.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of Brand.hash(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of Brand.hashValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t sub_21CAF5B04(_QWORD *a1, void (*a2)(_QWORD, unint64_t, void *), uint64_t a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  _BYTE *v46;
  id v47;
  void *v48;
  _QWORD v49[2];
  void (*v50)(_QWORD, unint64_t, void *);
  uint64_t v51;
  uint64_t v52[5];
  uint64_t v53;

  v10 = swift_allocObject();
  v50 = a2;
  v51 = v10;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v11 = qword_2552D0AF8;
  v49[1] = a3;
  swift_retain();
  if (v11 != -1)
    swift_once();
  v12 = sub_21CAF8178();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v49[0] = v13;
  v14 = sub_21CAF8160();
  v15 = sub_21CAF82B0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    *(_DWORD *)v16 = 136315138;
    v52[0] = v17;
    v18 = a1[5];
    v19 = a1[6];
    __swift_project_boxed_opaque_existential_1(a1 + 2, v18);
    v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 32))(v18, v19);
    v53 = sub_21CAE2520(v20, v21, v52);
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v14, v15, "Fetching squareLogoDataForDesiredSize for %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v17, -1, -1);
    MEMORY[0x2207878A4](v16, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v22 = sub_21CAF80E8();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)v49 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a1[10];
  v30 = a1[11];
  __swift_project_boxed_opaque_existential_1(a1 + 7, v29);
  (*(void (**)(uint64_t, uint64_t, double, double))(v30 + 8))(v29, v30, a4, a5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v28, 1, v22) == 1)
  {
    sub_21CADEAF8((uint64_t)v28);
    swift_retain_n();
    v31 = sub_21CAF8160();
    v32 = sub_21CAF82B0();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_DWORD *)v33 = 136315138;
      v52[0] = v34;
      v35 = a1[5];
      v36 = a1[6];
      __swift_project_boxed_opaque_existential_1(a1 + 2, v35);
      v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 32))(v35, v36);
      v53 = sub_21CAE2520(v37, v38, v52);
      sub_21CAF8310();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CADC000, v31, v32, "Missing square logo url for brand with URI: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v34, -1, -1);
      MEMORY[0x2207878A4](v33, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    sub_21CAE6E68();
    v45 = (void *)swift_allocError();
    *v46 = 0;
    v47 = v45;
    v48 = (void *)sub_21CAF80A0();
    v50(0, 0xF000000000000000, v48);

    return swift_release();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v25, v28, v22);
    sub_21CAE361C((uint64_t)(a1 + 12), (uint64_t)v52);
    v39 = v52[4];
    __swift_project_boxed_opaque_existential_1(v52, v52[3]);
    v40 = a1 + 2;
    v41 = a1[5];
    v42 = a1[6];
    __swift_project_boxed_opaque_existential_1(v40, v41);
    v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 32))(v41, v42);
    (*(void (**)(uint64_t))(v39 + 8))(v43);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
    return swift_release();
  }
}

uint64_t sub_21CAF6044(_QWORD *a1, void (*a2)(_QWORD, unint64_t, void *), uint64_t a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  _BYTE *v46;
  id v47;
  void *v48;
  _QWORD v49[2];
  void (*v50)(_QWORD, unint64_t, void *);
  uint64_t v51;
  uint64_t v52[5];
  uint64_t v53;

  v10 = swift_allocObject();
  v50 = a2;
  v51 = v10;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v11 = qword_2552D0AF8;
  v49[1] = a3;
  swift_retain();
  if (v11 != -1)
    swift_once();
  v12 = sub_21CAF8178();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v49[0] = v13;
  v14 = sub_21CAF8160();
  v15 = sub_21CAF82B0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    *(_DWORD *)v16 = 136315138;
    v52[0] = v17;
    v18 = a1[5];
    v19 = a1[6];
    __swift_project_boxed_opaque_existential_1(a1 + 2, v18);
    v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 32))(v18, v19);
    v53 = sub_21CAE2520(v20, v21, v52);
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v14, v15, "Fetching wideLogoDataForDesiredSize for %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v17, -1, -1);
    MEMORY[0x2207878A4](v16, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v22 = sub_21CAF80E8();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)v49 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a1[10];
  v30 = a1[11];
  __swift_project_boxed_opaque_existential_1(a1 + 7, v29);
  (*(void (**)(uint64_t, uint64_t, double, double))(v30 + 16))(v29, v30, a4, a5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v28, 1, v22) == 1)
  {
    sub_21CADEAF8((uint64_t)v28);
    swift_retain_n();
    v31 = sub_21CAF8160();
    v32 = sub_21CAF82B0();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_DWORD *)v33 = 136315138;
      v52[0] = v34;
      v35 = a1[5];
      v36 = a1[6];
      __swift_project_boxed_opaque_existential_1(a1 + 2, v35);
      v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 32))(v35, v36);
      v53 = sub_21CAE2520(v37, v38, v52);
      sub_21CAF8310();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CADC000, v31, v32, "Missing wide logo url for brand with URI: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207878A4](v34, -1, -1);
      MEMORY[0x2207878A4](v33, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    sub_21CAE6E68();
    v45 = (void *)swift_allocError();
    *v46 = 0;
    v47 = v45;
    v48 = (void *)sub_21CAF80A0();
    v50(0, 0xF000000000000000, v48);

    return swift_release();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v25, v28, v22);
    sub_21CAE361C((uint64_t)(a1 + 12), (uint64_t)v52);
    v39 = v52[4];
    __swift_project_boxed_opaque_existential_1(v52, v52[3]);
    v40 = a1 + 2;
    v41 = a1[5];
    v42 = a1[6];
    __swift_project_boxed_opaque_existential_1(v40, v41);
    v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 32))(v41, v42);
    (*(void (**)(uint64_t))(v39 + 8))(v43);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
    return swift_release();
  }
}

uint64_t sub_21CAF6584(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(_QWORD, unint64_t, void *), uint64_t a6, double a7, double a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t result;
  void (*v53)(_QWORD, unint64_t, void *);
  void *v54;
  _BYTE *v55;
  id v56;
  void *v57;
  _QWORD v58[4];
  void (*v59)(_QWORD, unint64_t, void *);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63[5];
  uint64_t v64;

  v58[2] = a2;
  v58[3] = a3;
  v14 = swift_allocObject();
  v59 = a5;
  v60 = a6;
  *(_QWORD *)(v14 + 16) = a5;
  *(_QWORD *)(v14 + 24) = a6;
  v62 = v14;
  v15 = qword_2552D0AF8;
  swift_retain();
  if (v15 != -1)
    swift_once();
  v16 = sub_21CAF8178();
  v17 = __swift_project_value_buffer(v16, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v58[1] = v17;
  v18 = sub_21CAF8160();
  v19 = sub_21CAF82B0();
  v61 = a1;
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    v63[0] = v21;
    *(_DWORD *)v20 = 134218242;
    v64 = a1;
    sub_21CAF8310();
    *(_WORD *)(v20 + 12) = 2080;
    v23 = a4[5];
    v22 = a4[6];
    __swift_project_boxed_opaque_existential_1(a4 + 2, v23);
    v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32))(v23, v22);
    v64 = sub_21CAE2520(v24, v25, v63);
    a1 = v61;
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v18, v19, "Fetching logoData ofType %ld for %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v21, -1, -1);
    MEMORY[0x2207878A4](v20, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v26 = sub_21CAF80E8();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)v58 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)v58 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 0:
    case 2:
      v33 = a4[10];
      v34 = a4[11];
      __swift_project_boxed_opaque_existential_1(a4 + 7, v33);
      (*(void (**)(uint64_t, uint64_t, double, double))(v34 + 8))(v33, v34, a7, a8);
      goto LABEL_11;
    case 1:
      v35 = a4[10];
      v36 = a4[11];
      __swift_project_boxed_opaque_existential_1(a4 + 7, v35);
      (*(void (**)(uint64_t, uint64_t, double, double))(v36 + 16))(v35, v36, a7, a8);
      goto LABEL_11;
    case 3:
      v37 = a4[5];
      v38 = a4[6];
      __swift_project_boxed_opaque_existential_1(a4 + 2, v37);
      (*(void (**)(uint64_t, uint64_t))(v38 + 104))(v37, v38);
LABEL_11:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v32, 1, v26) == 1)
      {
        sub_21CADEAF8((uint64_t)v32);
        swift_retain_n();
        v39 = sub_21CAF8160();
        v40 = sub_21CAF82B0();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = (uint8_t *)swift_slowAlloc();
          v42 = swift_slowAlloc();
          *(_DWORD *)v41 = 136315138;
          v63[0] = v42;
          v43 = a4[5];
          v44 = a4[6];
          __swift_project_boxed_opaque_existential_1(a4 + 2, v43);
          v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 32))(v43, v44);
          v64 = sub_21CAE2520(v45, v46, v63);
          sub_21CAF8310();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21CADC000, v39, v40, "Missing logo url for brand with URI: %s", v41, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207878A4](v42, -1, -1);
          MEMORY[0x2207878A4](v41, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        v53 = v59;
        sub_21CAE6E68();
        v54 = (void *)swift_allocError();
        *v55 = 0;
        v56 = v54;
        v57 = (void *)sub_21CAF80A0();
        v53(0, 0xF000000000000000, v57);

        result = swift_release();
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v29, v32, v26);
        sub_21CAE361C((uint64_t)(a4 + 12), (uint64_t)v63);
        v47 = v63[4];
        __swift_project_boxed_opaque_existential_1(v63, v63[3]);
        v48 = a4 + 2;
        v49 = a4[5];
        v50 = a4[6];
        __swift_project_boxed_opaque_existential_1(v48, v49);
        v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 32))(v49, v50);
        (*(void (**)(uint64_t))(v47 + 8))(v51);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
        result = swift_release();
      }
      break;
    default:
      swift_release();
      swift_release();
      result = sub_21CAF8388();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_21CAF6BB4(uint64_t a1, _QWORD *a2, void (*a3)(_QWORD, unint64_t, void *), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  void (*v49)(_QWORD, unint64_t, void *);
  void *v50;
  _BYTE *v51;
  id v52;
  void *v53;
  _QWORD v54[2];
  void (*v55)(_QWORD, unint64_t, void *);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[5];
  uint64_t v60;

  v58 = a1;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  v8 = qword_2552D0AF8;
  v56 = a4;
  swift_retain();
  if (v8 != -1)
    swift_once();
  v9 = sub_21CAF8178();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2552D2AB0);
  swift_retain_n();
  v54[1] = v10;
  v11 = sub_21CAF8160();
  v12 = sub_21CAF82B0();
  v57 = v7;
  v55 = a3;
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v59[0] = v14;
    *(_DWORD *)v13 = 134218242;
    v15 = v58;
    v60 = v58;
    sub_21CAF8310();
    *(_WORD *)(v13 + 12) = 2080;
    v54[0] = v13 + 14;
    v17 = a2[5];
    v16 = a2[6];
    __swift_project_boxed_opaque_existential_1(a2 + 2, v17);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 32))(v17, v16);
    v60 = sub_21CAE2520(v18, v19, v59);
    sub_21CAF8310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CADC000, v11, v12, "Fetching assetData ofType %ld for %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207878A4](v14, -1, -1);
    MEMORY[0x2207878A4](v13, -1, -1);

  }
  else
  {

    swift_release_n();
    v15 = v58;
  }
  v20 = sub_21CAF80E8();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v54 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *MEMORY[0x24BDBF148];
  v27 = *(double *)(MEMORY[0x24BDBF148] + 8);
  switch(v15)
  {
    case 0:
    case 2:
      v29 = a2[10];
      v30 = a2[11];
      __swift_project_boxed_opaque_existential_1(a2 + 7, v29);
      (*(void (**)(uint64_t, uint64_t, double, double))(v30 + 8))(v29, v30, v28, v27);
      goto LABEL_11;
    case 1:
      v31 = a2[10];
      v32 = a2[11];
      __swift_project_boxed_opaque_existential_1(a2 + 7, v31);
      (*(void (**)(uint64_t, uint64_t, double, double))(v32 + 16))(v31, v32, v28, v27);
      goto LABEL_11;
    case 3:
      v33 = a2[5];
      v34 = a2[6];
      __swift_project_boxed_opaque_existential_1(a2 + 2, v33);
      (*(void (**)(uint64_t, uint64_t))(v34 + 104))(v33, v34);
LABEL_11:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v26, 1, v20) == 1)
      {
        sub_21CADEAF8((uint64_t)v26);
        swift_retain_n();
        v35 = sub_21CAF8160();
        v36 = sub_21CAF82B0();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          v38 = swift_slowAlloc();
          *(_DWORD *)v37 = 136315138;
          v59[0] = v38;
          v39 = a2[5];
          v40 = a2[6];
          __swift_project_boxed_opaque_existential_1(a2 + 2, v39);
          v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 32))(v39, v40);
          v60 = sub_21CAE2520(v41, v42, v59);
          sub_21CAF8310();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21CADC000, v35, v36, "Missing logo url for brand with URI: %s", v37, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207878A4](v38, -1, -1);
          MEMORY[0x2207878A4](v37, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        v49 = v55;
        sub_21CAE6E68();
        v50 = (void *)swift_allocError();
        *v51 = 0;
        v52 = v50;
        v53 = (void *)sub_21CAF80A0();
        v49(0, 0xF000000000000000, v53);

        result = swift_release();
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v23, v26, v20);
        sub_21CAE361C((uint64_t)(a2 + 12), (uint64_t)v59);
        v43 = v59[4];
        __swift_project_boxed_opaque_existential_1(v59, v59[3]);
        v44 = a2 + 2;
        v45 = a2[5];
        v46 = a2[6];
        __swift_project_boxed_opaque_existential_1(v44, v45);
        v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 32))(v45, v46);
        (*(void (**)(uint64_t))(v43 + 8))(v47);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v59);
        result = swift_release();
      }
      break;
    default:
      swift_release();
      swift_release();
      result = sub_21CAF8388();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_21CAF71F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21CAF7218(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return sub_21CAF0BE8(a1, a2, a3 & 1, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

id RCSChatBotBrandDataSourceObjcShim.opaqueWrapper.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___IMBrandChatBotBrandDataSourceObjcShim_opaqueWrapper);
}

id RCSChatBotBrandDataSourceObjcShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id RCSChatBotBrandDataSourceObjcShim.init()()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v1 = objc_allocWithZone(MEMORY[0x24BDC2818]);
  v2 = v0;
  v3 = objc_msgSend(v1, sel_initWithQueue_, 0);
  v4 = type metadata accessor for ChatbotTelephonyUtilities();
  type metadata accessor for RCSChatBotBrandDataSource();
  v5 = (_QWORD *)swift_allocObject();
  v6 = MEMORY[0x24BEE4B00];
  v5[4] = v4;
  v5[5] = v6;
  v5[2] = v3;
  v5[3] = &off_24E0A5AE8;
  objc_msgSend(v3, sel_setDelegate_, v5);
  v7 = objc_msgSend(objc_allocWithZone((Class)BSOpaqueWrapper), sel_initWithThing_, v5);
  swift_release();
  *(_QWORD *)&v2[OBJC_IVAR___IMBrandChatBotBrandDataSourceObjcShim_opaqueWrapper] = v7;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for RCSChatBotBrandDataSourceObjcShim();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for RCSChatBotBrandDataSourceObjcShim()
{
  return objc_opt_self();
}

id RCSChatBotBrandDataSourceObjcShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RCSChatBotBrandDataSourceObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21CAF7424()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FrameworkBundleAnchor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FrameworkBundleAnchor()
{
  return objc_opt_self();
}

uint64_t BSBrandURIIsAppleMain(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("urn:biz:b15ed773-9eed-11e7-baa2-7b88b04daa8e"));
  else
    v2 = 0;

  return v2;
}

uint64_t BSBrandURIIsAppleMako(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("urn:biz:e46750f1-3f94-4aba-73ca-1c14fb3adddd"));
  else
    v2 = 0;

  return v2;
}

uint64_t sub_21CAF8058()
{
  return MEMORY[0x24BDCB078]();
}

uint64_t sub_21CAF8064()
{
  return MEMORY[0x24BDCB0B8]();
}

uint64_t sub_21CAF8070()
{
  return MEMORY[0x24BDCBB18]();
}

uint64_t sub_21CAF807C()
{
  return MEMORY[0x24BDCBB38]();
}

uint64_t sub_21CAF8088()
{
  return MEMORY[0x24BDCBB70]();
}

uint64_t sub_21CAF8094()
{
  return MEMORY[0x24BDCC6E0]();
}

uint64_t sub_21CAF80A0()
{
  return MEMORY[0x24BDCD2E8]();
}

uint64_t sub_21CAF80AC()
{
  return MEMORY[0x24BDCD300]();
}

uint64_t sub_21CAF80B8()
{
  return MEMORY[0x24BDCD8D8]();
}

uint64_t sub_21CAF80C4()
{
  return MEMORY[0x24BDCD9B8]();
}

uint64_t sub_21CAF80D0()
{
  return MEMORY[0x24BDCDA40]();
}

uint64_t sub_21CAF80DC()
{
  return MEMORY[0x24BDCDA60]();
}

uint64_t sub_21CAF80E8()
{
  return MEMORY[0x24BDCDAB8]();
}

uint64_t sub_21CAF80F4()
{
  return MEMORY[0x24BDCDC98]();
}

uint64_t sub_21CAF8100()
{
  return MEMORY[0x24BDCDCE8]();
}

uint64_t sub_21CAF810C()
{
  return MEMORY[0x24BDCE9A8]();
}

uint64_t sub_21CAF8118()
{
  return MEMORY[0x24BDCEA48]();
}

uint64_t sub_21CAF8124()
{
  return MEMORY[0x24BDCEA50]();
}

uint64_t sub_21CAF8130()
{
  return MEMORY[0x24BE12240]();
}

uint64_t sub_21CAF813C()
{
  return MEMORY[0x24BE12248]();
}

uint64_t sub_21CAF8148()
{
  return MEMORY[0x24BE12258]();
}

uint64_t sub_21CAF8154()
{
  return MEMORY[0x24BE12278]();
}

uint64_t sub_21CAF8160()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21CAF816C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21CAF8178()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21CAF8184()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21CAF8190()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_21CAF819C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21CAF81A8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21CAF81B4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21CAF81C0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21CAF81CC()
{
  return MEMORY[0x24BDCF9E8]();
}

uint64_t sub_21CAF81D8()
{
  return MEMORY[0x24BDCFA20]();
}

uint64_t sub_21CAF81E4()
{
  return MEMORY[0x24BDCFA30]();
}

uint64_t sub_21CAF81F0()
{
  return MEMORY[0x24BDCFAD0]();
}

uint64_t sub_21CAF81FC()
{
  return MEMORY[0x24BDCFAF0]();
}

uint64_t sub_21CAF8208()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21CAF8214()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_21CAF8220()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21CAF822C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21CAF8238()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21CAF8244()
{
  return MEMORY[0x24BDCFBA0]();
}

uint64_t sub_21CAF8250()
{
  return MEMORY[0x24BDCFBD0]();
}

uint64_t sub_21CAF825C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21CAF8268()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21CAF8274()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21CAF8280()
{
  return MEMORY[0x24BDCFEE8]();
}

uint64_t sub_21CAF828C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21CAF8298()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21CAF82A4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21CAF82B0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21CAF82BC()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21CAF82C8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21CAF82D4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21CAF82E0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21CAF82EC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21CAF82F8()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_21CAF8304()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21CAF8310()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21CAF831C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21CAF8328()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21CAF8334()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21CAF8340()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21CAF834C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21CAF8358()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_21CAF8364()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21CAF8370()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21CAF837C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21CAF8388()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21CAF8394()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21CAF83A0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21CAF83AC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21CAF83B8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21CAF83C4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21CAF83D0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21CAF83DC()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21CAF83E8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21CAF83F4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21CAF8400()
{
  return MEMORY[0x24BDD06E8]();
}

uint64_t sub_21CAF840C()
{
  return MEMORY[0x24BDD06F8]();
}

uint64_t sub_21CAF8418()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21CAF8424()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21CAF8430()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21CAF843C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21CAF8448()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21CAF8454()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21CAF8460()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21CAF846C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x24BE50800]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x24BE50808]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF57A8](target, queue);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

