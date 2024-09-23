void sub_21EA3731C()
{
  static PreviewRegistry.preview.getter();
}

void static PreviewRegistry.preview.getter()
{
  sub_21EA471D8();
  __break(1u);
}

uint64_t dispatch thunk of static PreviewRegistry.fileID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static PreviewRegistry.line.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static PreviewRegistry.column.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static PreviewRegistry.makePreview()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static PreviewRegistry.preview.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

ValueMetadata *type metadata accessor for PreviewUnavailable()
{
  return &type metadata for PreviewUnavailable;
}

void sub_21EA373CC(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_21EA373D4@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *sub_21EA373E0(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_21EA37430(a1, &qword_2554646F0);
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_21EA37430(a1, &qword_2554646F8);
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_21EA37430(a1, &qword_255464700);
}

void sub_21EA37430(uint64_t a1, unint64_t *a2)
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

uint64_t NamedResource.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id NamedResource.bundle.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void NamedResource.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_21EA47010();
  swift_bridgeObjectRelease();
  v2 = v1;
  sub_21EA47154();

}

uint64_t static NamedResource.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_21EA4722C() & 1) == 0)
    return 0;
  sub_21EA3758C();
  return sub_21EA47148() & 1;
}

unint64_t sub_21EA3758C()
{
  unint64_t result;

  result = qword_255464708;
  if (!qword_255464708)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255464708);
  }
  return result;
}

uint64_t NamedResource.hashValue.getter()
{
  sub_21EA47274();
  sub_21EA47010();
  sub_21EA47154();
  return sub_21EA47298();
}

uint64_t sub_21EA37624()
{
  sub_21EA47274();
  sub_21EA47010();
  sub_21EA47154();
  return sub_21EA47298();
}

uint64_t sub_21EA37680()
{
  sub_21EA47010();
  return sub_21EA47154();
}

uint64_t sub_21EA376B0()
{
  sub_21EA47274();
  sub_21EA47010();
  sub_21EA47154();
  return sub_21EA47298();
}

uint64_t sub_21EA37708(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_21EA4722C() & 1) == 0)
    return 0;
  sub_21EA3758C();
  return sub_21EA47148() & 1;
}

uint64_t ResourceReference.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_21EA47280();
  swift_bridgeObjectRetain();
  v2 = v1;
  sub_21EA47010();
  sub_21EA47154();

  return swift_bridgeObjectRelease();
}

uint64_t ResourceReference.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_21EA47274();
  sub_21EA47280();
  swift_bridgeObjectRetain();
  v2 = v1;
  sub_21EA47010();
  sub_21EA47154();

  swift_bridgeObjectRelease();
  return sub_21EA47298();
}

uint64_t _s21DeveloperToolsSupport13ColorResourceV9hashValueSivg_0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_21EA47274();
  sub_21EA47280();
  swift_bridgeObjectRetain();
  v2 = v1;
  sub_21EA47010();
  sub_21EA47154();

  swift_bridgeObjectRelease();
  return sub_21EA47298();
}

uint64_t _s21DeveloperToolsSupport13ColorResourceV4hash4intoys6HasherVz_tF_0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_21EA47280();
  swift_bridgeObjectRetain();
  v2 = v1;
  sub_21EA47010();
  sub_21EA47154();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21EA37964()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_21EA47274();
  sub_21EA47280();
  swift_bridgeObjectRetain();
  v2 = v1;
  sub_21EA47010();
  sub_21EA47154();

  swift_bridgeObjectRelease();
  return sub_21EA47298();
}

uint64_t (*ColorResource.reference.modify())()
{
  return nullsub_1;
}

uint64_t ColorResource.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ColorResource.init(name:bundle:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL static ColorResource.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(a1, a2);
}

BOOL sub_21EA37A68(_QWORD *a1, _QWORD *a2)
{
  return _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(a1, a2);
}

id _s21DeveloperToolsSupport13ColorResourceV9referenceAA0E9ReferenceOvg_0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  id v4;

  v2 = v1[1];
  v4 = (id)v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

__n128 _s21DeveloperToolsSupport13ColorResourceV9referenceAA0E9ReferenceOvs_0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  __n128 result;

  v3 = *a1;

  swift_bridgeObjectRelease();
  *(_QWORD *)v1 = v3;
  result = *(__n128 *)(a1 + 1);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

uint64_t (*ImageResource.reference.modify())()
{
  return nullsub_1;
}

BOOL static ImageResource.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(a1, a2);
}

BOOL _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  id v6;
  char v7;

  v2 = (void *)a1[2];
  v3 = (void *)a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_21EA4722C() & 1) == 0)
    return 0;
  sub_21EA3758C();
  swift_bridgeObjectRetain();
  v5 = v2;
  swift_bridgeObjectRetain();
  v6 = v3;
  v7 = sub_21EA47148();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v7 & 1) != 0;
}

unint64_t sub_21EA37BF4()
{
  unint64_t result;

  result = qword_255464710;
  if (!qword_255464710)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for NamedResource, &type metadata for NamedResource);
    atomic_store(result, (unint64_t *)&qword_255464710);
  }
  return result;
}

unint64_t sub_21EA37C3C()
{
  unint64_t result;

  result = qword_255464718;
  if (!qword_255464718)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for ResourceReference, &type metadata for ResourceReference);
    atomic_store(result, (unint64_t *)&qword_255464718);
  }
  return result;
}

unint64_t sub_21EA37C84()
{
  unint64_t result;

  result = qword_255464720;
  if (!qword_255464720)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for ColorResource, &type metadata for ColorResource);
    atomic_store(result, (unint64_t *)&qword_255464720);
  }
  return result;
}

unint64_t sub_21EA37CCC()
{
  unint64_t result;

  result = qword_255464728;
  if (!qword_255464728)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for ImageResource, &type metadata for ImageResource);
    atomic_store(result, (unint64_t *)&qword_255464728);
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for NamedResource()
{
  return &type metadata for NamedResource;
}

uint64_t sub_21EA37D48()
{
  return 0;
}

ValueMetadata *type metadata accessor for ResourceReference()
{
  return &type metadata for ResourceReference;
}

void destroy for ColorResource(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

ValueMetadata *type metadata accessor for ColorResource()
{
  return &type metadata for ColorResource;
}

_QWORD *_s21DeveloperToolsSupport13NamedResourceVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *_s21DeveloperToolsSupport13NamedResourceVwca_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  return a1;
}

uint64_t _s21DeveloperToolsSupport13NamedResourceVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t _s21DeveloperToolsSupport13NamedResourceVwet_0(uint64_t a1, int a2)
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

uint64_t sub_21EA37EBC(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ImageResource()
{
  return &type metadata for ImageResource;
}

uint64_t previewImage(category:description:file:line:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t result;
  unsigned __int8 v11;

  v8 = *a1;
  if ((sub_21EA3BA1C() & 1) != 0)
  {
    if (qword_2554646E0 != -1)
      swift_once();
    v11 = v8;
    swift_retain();
    v9 = sub_21EA37FF4(&v11, a7);
    swift_release();
    return v9;
  }
  else
  {
    result = sub_21EA471D8();
    __break(1u);
  }
  return result;
}

uint64_t sub_21EA37FF4(unsigned __int8 *a1, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  char v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CGColorSpace *v31;
  CGColorSpace *v32;
  CGContext *v33;
  CGGradient *v34;
  CGGradient *v35;
  CGImageRef Image;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  os_unfair_lock_s *v40;
  id v41;
  uint64_t result;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  char v52;
  char v53;
  CGPoint v54;
  CGPoint v55;

  v45 = *v2;
  v5 = sub_21EA46FBC();
  v50 = *(_QWORD *)(v5 - 8);
  v51 = (uint64_t *)v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v49 = (uint64_t)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v43 - v11;
  v13 = type metadata accessor for PreviewImageProvider.State.Entry();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v48 = (id *)((char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15);
  v18 = (id *)((char *)&v43 - v17);
  v46 = *a1;
  v53 = v46;
  v47 = a2;
  v19 = sub_21EA3C678();
  v21 = v20;
  sub_21EA46FB0();
  v44 = v2;
  v22 = v2[2];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v22 + 24));
  sub_21EA3A84C((uint64_t *)(v22 + 16), v19, v21, (uint64_t)v7, (uint64_t)v12);
  v23 = v14;
  os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 24));
  v24 = v13;
  swift_release();
  (*(void (**)(char *, uint64_t *))(v50 + 8))(v7, v51);
  swift_bridgeObjectRelease();
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v25(v12, 1, v13) != 1)
  {
    v38 = (uint64_t)v12;
LABEL_14:
    sub_21EA3C78C(v38, (uint64_t)v18);
    v41 = *v18;
    sub_21EA3C7D0((uint64_t)v18);
    return (uint64_t)v41;
  }
  sub_21EA3C80C((uint64_t)v12, &qword_255464768);
  v26 = v46;
  v52 = v46;
  v27 = v47;
  v28 = sub_21EA3C678();
  v30 = v29;
  if ((v26 & 1) != 0)
  {
    v31 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
    if (!v31)
      goto LABEL_8;
    v32 = v31;
    v33 = CGBitmapContextCreate(0, 0x7D0uLL, 0x3E8uLL, 8uLL, 0x1F40uLL, v31, 0x2002u);

    if (!v33)
      goto LABEL_8;
    v34 = sub_21EA3C970(v27);
    if (v34)
    {
      v35 = v34;
      v55.x = 2000.0;
      v55.y = 1000.0;
      v54.x = 0.0;
      v54.y = 0.0;
      CGContextDrawLinearGradient(v33, v34, v54, v55, 0);

    }
    Image = CGBitmapContextCreateImage(v33);

    if (!Image)
      goto LABEL_8;
  }
  else
  {
    Image = sub_21EA3CB14(v27);
    if (!Image)
    {
LABEL_8:
      v37 = v49;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v49, 1, 1, v24);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  v51 = &v43;
  v39 = v24;
  v40 = (os_unfair_lock_s *)v44[2];
  swift_retain();
  os_unfair_lock_lock(v40 + 6);
  v37 = v49;
  sub_21EA39D14((uint64_t)&v40[4], 0, Image, v28, v30, v49);
  os_unfair_lock_unlock(v40 + 6);
  swift_bridgeObjectRelease();

  v24 = v39;
  swift_release();
LABEL_12:
  if (v25((char *)v37, 1, v24) != 1)
  {
    v38 = v37;
    v18 = v48;
    goto LABEL_14;
  }
  sub_21EA3C80C(v37, &qword_255464768);
  result = sub_21EA471D8();
  __break(1u);
  return result;
}

uint64_t previewImage(category:description:file:line:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  unsigned __int8 v5;
  uint64_t result;
  unsigned __int8 v7;

  v5 = *a1;
  if ((sub_21EA3BA1C() & 1) != 0)
  {
    if (qword_2554646E0 != -1)
      swift_once();
    v7 = v5;
    swift_retain();
    sub_21EA384E8(&v7, a2, a3);
    return swift_release();
  }
  else
  {
    result = sub_21EA471D8();
    __break(1u);
  }
  return result;
}

uint64_t sub_21EA384E8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int (*v32)(uint64_t, uint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CGColorSpace *v37;
  uint64_t v38;
  CGColorSpace *v39;
  CGContext *v40;
  CGGradient *v41;
  CGGradient *v42;
  CGImageRef Image;
  unsigned __int8 v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  os_unfair_lock_s *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t result;
  _QWORD v62[2];
  char *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned __int8 v74[18];
  CGPoint v75;
  CGPoint v76;

  v4 = v3;
  v73 = a3;
  v62[1] = *v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v69 = (uint64_t)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v63 = (char *)v62 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v66 = (uint64_t)v62 - v12;
  v13 = sub_21EA46FBC();
  v70 = *(_QWORD *)(v13 - 8);
  v71 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v68 = (uint64_t)v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v62 - v19;
  v21 = type metadata accessor for PreviewImageProvider.State.Entry();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v67 = (uint64_t)v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v65 = (uint64_t)v62 - v25;
  v26 = *a1;
  v74[17] = *a1;
  v72 = a2;
  v27 = sub_21EA3C678();
  v29 = v28;
  sub_21EA46FB0();
  v64 = v4;
  v30 = v4[2];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v30 + 24));
  sub_21EA3A84C((uint64_t *)(v30 + 16), v27, v29, (uint64_t)v15, (uint64_t)v20);
  os_unfair_lock_unlock((os_unfair_lock_t)(v30 + 24));
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v15, v71);
  v31 = v22;
  swift_bridgeObjectRelease();
  v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  if (v32((uint64_t)v20, 1, v21) == 1)
  {
    sub_21EA3C80C((uint64_t)v20, &qword_255464768);
    v74[1] = v26;
    v33 = v72;
    v34 = sub_21EA3C678();
    v36 = v35;
    if ((v26 & 1) != 0)
    {
      v37 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
      v38 = v68;
      if (!v37)
        goto LABEL_8;
      v39 = v37;
      v40 = CGBitmapContextCreate(0, 0x7D0uLL, 0x3E8uLL, 8uLL, 0x1F40uLL, v37, 0x2002u);

      if (!v40)
        goto LABEL_8;
      v41 = sub_21EA3C970(v33);
      if (v41)
      {
        v42 = v41;
        v76.x = 2000.0;
        v76.y = 1000.0;
        v75.x = 0.0;
        v75.y = 0.0;
        CGContextDrawLinearGradient(v40, v41, v75, v76, 0);

      }
      Image = CGBitmapContextCreateImage(v40);

      if (!Image)
        goto LABEL_8;
    }
    else
    {
      Image = sub_21EA3CB14(v33);
      v38 = v68;
      if (!Image)
      {
LABEL_8:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v38, 1, 1, v21);
        swift_bridgeObjectRelease();
LABEL_14:
        if (v32(v38, 1, v21) == 1)
        {
          v57 = &qword_255464768;
        }
        else
        {
          v56 = v67;
          sub_21EA3C78C(v38, v67);
          v57 = &qword_255464740;
          v58 = v69;
          sub_21EA3D39C(v56 + *(int *)(v21 + 20), v69, &qword_255464740);
          sub_21EA3C7D0(v56);
          v59 = sub_21EA46F5C();
          v60 = *(_QWORD *)(v59 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48))(v58, 1, v59) != 1)
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v73, v58, v59);
          v68 = v58;
        }
        sub_21EA3C80C(v68, v57);
        goto LABEL_24;
      }
    }
    v72 = v21;
    v55 = (os_unfair_lock_s *)v64[2];
    swift_retain();
    os_unfair_lock_lock(v55 + 6);
    sub_21EA39D14((uint64_t)&v55[4], 1, Image, v34, v36, v38);
    os_unfair_lock_unlock(v55 + 6);
    swift_bridgeObjectRelease();

    swift_release();
    v21 = v72;
    goto LABEL_14;
  }
  v44 = v26;
  v45 = v72;
  v46 = v65;
  sub_21EA3C78C((uint64_t)v20, v65);
  v47 = v66;
  sub_21EA3D39C(v46 + *(int *)(v21 + 20), v66, &qword_255464740);
  v48 = sub_21EA46F5C();
  v49 = *(_QWORD *)(v48 - 8);
  v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
  if (v50((char *)v47, 1, v48) == 1)
  {
    sub_21EA3C80C(v47, &qword_255464740);
    v74[0] = v44;
    v51 = v63;
    sub_21EA39378(v74, v45, v63);
    if (v50(v51, 1, v48) == 1)
    {
      sub_21EA3C80C((uint64_t)v51, &qword_255464740);
LABEL_24:
      result = sub_21EA471D8();
      __break(1u);
      return result;
    }
    sub_21EA3C7D0(v46);
    v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 32);
    v53 = v73;
    v54 = (uint64_t)v51;
  }
  else
  {
    sub_21EA3C7D0(v46);
    v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 32);
    v53 = v73;
    v54 = v47;
  }
  return v52(v53, v54, v48);
}

uint64_t sub_21EA38AC0()
{
  sub_21EA47274();
  sub_21EA47010();
  swift_bridgeObjectRelease();
  return sub_21EA47298();
}

uint64_t sub_21EA38B38()
{
  sub_21EA47010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EA38B8C()
{
  sub_21EA47274();
  sub_21EA47010();
  swift_bridgeObjectRelease();
  return sub_21EA47298();
}

uint64_t sub_21EA38C00@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_21EA47208();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_21EA38C5C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x726174617661;
  if (*v1)
    v2 = 0x6F746F6870;
  v3 = 0xE600000000000000;
  if (*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_21EA38C94(char *a1, char *a2)
{
  return sub_21EA38CA0(*a1, *a2);
}

uint64_t sub_21EA38CA0(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6F746F6870;
  else
    v3 = 0x726174617661;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6F746F6870;
  else
    v5 = 0x726174617661;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21EA4722C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void static PreviewImageCategory.avatar.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static PreviewImageCategory.photo.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

unint64_t sub_21EA38D50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464790);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255464770);
  v6 = sub_21EA471FC();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_21EA3D39C(v12, (uint64_t)v5, &qword_255464790);
    v14 = *v5;
    v15 = v5[1];
    result = sub_21EA3AB20(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = type metadata accessor for PreviewImageProvider.State.Entry();
    result = sub_21EA3C78C(v9, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

void sub_21EA38EE8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD aBlock[6];

  swift_beginAccess();
  v1 = *(void **)(v0 + 40);
  if (*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16))
  {
    if (v1)
      return;
    v2 = (void *)objc_opt_self();
    v3 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_21EA3CEF4;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EA39090;
    aBlock[3] = &block_descriptor;
    v4 = _Block_copy(aBlock);
    swift_release();
    v5 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v4, 180.0);
    _Block_release(v4);
    v6 = *(void **)(v0 + 40);
    *(_QWORD *)(v0 + 40) = v5;
  }
  else
  {
    if (v1)
    {
      objc_msgSend(v1, sel_invalidate);
      v6 = *(void **)(v0 + 40);
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)(v0 + 40) = 0;
  }

}

uint64_t sub_21EA39020()
{
  uint64_t result;
  void (*v1)(uint64_t);
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = *(void (**)(uint64_t))(result + 24);
    swift_retain();
    v2 = swift_release();
    v1(v2);
    return swift_release();
  }
  return result;
}

void sub_21EA39090(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_21EA390E0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_21EA39114()
{
  uint64_t result;

  type metadata accessor for PreviewImageProvider();
  swift_allocObject();
  result = sub_21EA39150();
  qword_255464730 = result;
  return result;
}

uint64_t sub_21EA39150()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t *v7;

  type metadata accessor for PreviewImageProvider.State();
  v1 = (_QWORD *)swift_allocObject();
  v2 = MEMORY[0x24BEE4AF8];
  v1[2] = sub_21EA38D50(MEMORY[0x24BEE4AF8]);
  v1[5] = 0;
  v3 = sub_21EA38D50(v2);
  swift_beginAccess();
  v1[2] = v3;
  swift_bridgeObjectRelease();
  v4 = (void *)v1[5];
  v1[5] = 0;

  v1[3] = nullsub_1;
  v1[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255464788);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  v6 = (os_unfair_lock_s *)(v5 + 24);
  *(_QWORD *)(v5 + 16) = v1;
  v7 = (uint64_t *)(v5 + 16);
  *(_QWORD *)(v0 + 16) = v5;
  swift_retain();
  os_unfair_lock_lock(v6);
  sub_21EA39258(v7);
  os_unfair_lock_unlock(v6);
  swift_release();
  return v0;
}

uint64_t sub_21EA39258(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = swift_allocObject();
  swift_weakInit();
  *(_QWORD *)(v1 + 24) = sub_21EA3CFE0;
  *(_QWORD *)(v1 + 32) = v2;
  return swift_release();
}

uint64_t sub_21EA392C0()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_21EA39314();
    return swift_release();
  }
  return result;
}

uint64_t sub_21EA39314()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_21EA397E8((uint64_t *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  return swift_release();
}

uint64_t sub_21EA39378@<X0>(unsigned __int8 *a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CGColorSpace *v33;
  CGColorSpace *v34;
  _QWORD *v35;
  CGContext *v36;
  CGGradient *v37;
  CGGradient *v38;
  CGImageRef Image;
  void (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  void **v42;
  uint64_t v43;
  os_unfair_lock_s *v45;
  uint64_t v46;
  uint64_t v47;
  void **v48;
  uint64_t v49;
  int v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  CGPoint v61;
  CGPoint v62;

  v55 = a3;
  v54 = *v3;
  v6 = sub_21EA46FBC();
  v57 = *(_QWORD *)(v6 - 8);
  v58 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v53 = (uint64_t)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v52 = (uint64_t)&v48 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v48 - v14;
  v16 = type metadata accessor for PreviewImageProvider.State.Entry();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v48 = (void **)((char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v50 = *a1;
  v60 = v50;
  v51 = a2;
  v19 = sub_21EA3C678();
  v21 = v20;
  sub_21EA46FB0();
  v56 = v3;
  v22 = v3[2];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v22 + 24));
  v49 = v19;
  sub_21EA3A84C((uint64_t *)(v22 + 16), v19, v21, (uint64_t)v8, (uint64_t)v15);
  os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 24));
  swift_release();
  v23 = v8;
  v24 = v16;
  (*(void (**)(char *, uint64_t))(v57 + 8))(v23, v58);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  if (v25(v15, 1, v16) != 1)
  {
    v42 = v48;
    sub_21EA3C78C((uint64_t)v15, (uint64_t)v48);
    v43 = v56[2];
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v43 + 24));
    sub_21EA3A370((_QWORD *)(v43 + 16), v42, v49, v21, v55);
    os_unfair_lock_unlock((os_unfair_lock_t)(v43 + 24));
    swift_release();
    sub_21EA3C7D0((uint64_t)v42);
    return swift_bridgeObjectRelease();
  }
  v26 = v17;
  v27 = v56;
  swift_bridgeObjectRelease();
  sub_21EA3C80C((uint64_t)v15, &qword_255464768);
  v28 = v50;
  v59 = v50;
  v29 = v51;
  v30 = sub_21EA3C678();
  v32 = v31;
  v58 = v30;
  if ((v28 & 1) != 0)
  {
    v33 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
    if (!v33)
      goto LABEL_8;
    v34 = v33;
    v35 = v27;
    v36 = CGBitmapContextCreate(0, 0x7D0uLL, 0x3E8uLL, 8uLL, 0x1F40uLL, v33, 0x2002u);

    if (!v36)
      goto LABEL_8;
    v37 = sub_21EA3C970(v29);
    if (v37)
    {
      v38 = v37;
      v62.x = 2000.0;
      v62.y = 1000.0;
      v61.x = 0.0;
      v61.y = 0.0;
      CGContextDrawLinearGradient(v36, v37, v61, v62, 0);

    }
    Image = CGBitmapContextCreateImage(v36);

    if (!Image)
      goto LABEL_8;
  }
  else
  {
    Image = sub_21EA3CB14(v29);
    v35 = v27;
    if (!Image)
    {
LABEL_8:
      v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
      v41 = v52;
      v40(v52, 1, 1, v24);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  v45 = (os_unfair_lock_s *)v35[2];
  swift_retain();
  os_unfair_lock_lock(v45 + 6);
  v41 = v52;
  sub_21EA39D14((uint64_t)&v45[4], 1, Image, v58, v32, v52);
  os_unfair_lock_unlock(v45 + 6);
  swift_bridgeObjectRelease();

  swift_release();
LABEL_12:
  v46 = v53;
  sub_21EA3CDFC(v41, v53);
  if (v25((char *)v46, 1, v24) == 1)
  {
    sub_21EA3C80C(v46, &qword_255464768);
    v47 = sub_21EA46F5C();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v55, 1, 1, v47);
  }
  else
  {
    sub_21EA3D39C(v46 + *(int *)(v24 + 20), (uint64_t)v55, &qword_255464740);
    return sub_21EA3C7D0(v46);
  }
}

uint64_t sub_21EA397E8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = sub_21EA46FBC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - v5;
  if (qword_2554646E8 != -1)
    swift_once();
  sub_21EA46FA4();
  sub_21EA46F80();
  v7 = *a1;
  v8 = swift_beginAccess();
  MEMORY[0x24BDAC7A8](v8);
  *(&v12 - 2) = (uint64_t)v6;
  v9 = swift_bridgeObjectRetain();
  v10 = sub_21EA3D22C(v9, (uint64_t (*)(uint64_t, uint64_t, char *))sub_21EA3CFE8, (uint64_t)(&v12 - 4));
  swift_bridgeObjectRelease();
  *(_QWORD *)(v7 + 16) = v10;
  swift_bridgeObjectRelease();
  sub_21EA38EE8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_21EA39964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  void *v18;
  _BYTE v20[16];
  id v21[2];

  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_21EA46F5C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for PreviewImageProvider.State.Entry();
  v12 = sub_21EA46F8C();
  if ((v12 & 1) == 0)
  {
    sub_21EA3D39C(a3 + *(int *)(v11 + 20), (uint64_t)v6, &qword_255464740);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_21EA3C80C((uint64_t)v6, &qword_255464740);
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v10, v6, v7);
      v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
      v14 = (void *)sub_21EA46F38();
      v21[0] = 0;
      v15 = objc_msgSend(v13, sel_removeItemAtURL_error_, v14, v21);

      if (v15)
      {
        v16 = v21[0];
      }
      else
      {
        v17 = v21[0];
        v18 = (void *)sub_21EA46F2C();

        swift_willThrow();
      }
      (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
  return v12 & 1;
}

void sub_21EA39B60()
{
  qword_255464738 = 0x405E000000000000;
}

__CFData *sub_21EA39B70()
{
  CGImage *v0;
  CGImage *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __CFData *v6;
  __CFString *v7;
  CGImageDestinationRef v8;
  __CFData *v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_21EA46FEC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (__CFData *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEC8]), sel_init);
  sub_21EA46FE0();
  sub_21EA46FD4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v7 = (__CFString *)sub_21EA47004();
  swift_bridgeObjectRelease();
  v8 = CGImageDestinationCreateWithData(v6, v7, 1uLL, 0);

  if (!v8)
  {
    sub_21EA3CF9C();
    swift_allocError();
    swift_willThrow();
    v8 = v6;
LABEL_6:

    return v6;
  }
  CGImageDestinationAddImage(v8, v1, 0);
  if (!CGImageDestinationFinalize(v8))
  {
    sub_21EA3CF9C();
    swift_allocError();
    swift_willThrow();

    goto LABEL_6;
  }
  v9 = v6;
  v6 = (__CFData *)sub_21EA46F68();

  return v6;
}

uint64_t sub_21EA39D14@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void *v39;
  __CFData *v40;
  unint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  char *v57;
  void *v58;
  char *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70[4];

  v68 = a4;
  v69 = a5;
  v66 = a1;
  v67 = a6;
  v70[3] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  MEMORY[0x24BDAC7A8](v8);
  v65 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21EA46F5C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v57 = (char *)&v56 - v15;
  v16 = sub_21EA46FBC();
  v63 = *(_QWORD *)(v16 - 8);
  v64 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v59 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v56 - v22;
  v24 = type metadata accessor for PreviewImageProvider.State.Entry();
  v62 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v61 = (uint64_t)&v56 - v28;
  if ((a2 & 1) != 0)
  {
    v56 = v11;
    v58 = a3;
    v32 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v70[0] = 0;
    v33 = objc_msgSend(v32, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 1, v70);

    v34 = v70[0];
    if (v33)
    {
      sub_21EA46F50();
      v35 = v34;

      v36 = v57;
      sub_21EA46F44();
      v37 = v56;
      v38 = *(void (**)(char *, uint64_t))(v56 + 8);
      v38(v14, v10);
      v39 = v60;
      v40 = sub_21EA39B70();
      if (!v39)
      {
        v44 = (uint64_t)v40;
        v60 = (void *)v41;
        sub_21EA46F74();
        v54 = (uint64_t)v59;
        (*(void (**)(void))(v37 + 32))();
        sub_21EA3CE44(v44, (unint64_t)v60);
        v55 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56);
        v55(v54, 0, 1, v10);
LABEL_9:
        v45 = v58;
        sub_21EA46FB0();
        v46 = (uint64_t)&v27[*(int *)(v24 + 20)];
        v55(v46, 1, 1, v10);
        *(_QWORD *)v27 = v45;
        v47 = v45;
        sub_21EA3CE88(v54, v46);
        goto LABEL_10;
      }
      v38(v36, v10);

    }
    else
    {
      v42 = v70[0];
      v43 = (void *)sub_21EA46F2C();

      swift_willThrow();
      v37 = v56;
    }
    v54 = (uint64_t)v59;
    v55 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56);
    v55((uint64_t)v59, 1, 1, v10);
    goto LABEL_9;
  }
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v29(v23, 1, 1, v10);
  v30 = a3;
  sub_21EA46FB0();
  v31 = (uint64_t)&v27[*(int *)(v24 + 20)];
  v29((char *)v31, 1, 1, v10);
  *(_QWORD *)v27 = v30;
  sub_21EA3CE88((uint64_t)v23, v31);
LABEL_10:
  (*(void (**)(char *, char *, uint64_t))(v63 + 32))(&v27[*(int *)(v24 + 24)], v18, v64);
  v48 = v61;
  sub_21EA3C78C((uint64_t)v27, v61);
  v49 = v67;
  sub_21EA3C78C(v48, v67);
  v50 = v65;
  sub_21EA3CF58(v49, v65);
  v51 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v62 + 56);
  v51(v50, 0, 1, v24);
  swift_beginAccess();
  v52 = v69;
  swift_bridgeObjectRetain();
  sub_21EA3A210(v50, v68, v52);
  swift_endAccess();
  sub_21EA38EE8();
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v51)(v49, 0, 1, v24);
}

uint64_t sub_21EA3A210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreviewImageProvider.State.Entry();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_21EA3C80C(a1, &qword_255464768);
    sub_21EA3B310(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_21EA3C80C((uint64_t)v10, &qword_255464768);
  }
  else
  {
    sub_21EA3C78C(a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_21EA3B634((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21EA3A370@<X0>(_QWORD *a1@<X0>, void **a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  __CFData *v31;
  unint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v41)(char *, char *, uint64_t);
  void (*v42)(char *, uint64_t, uint64_t, uint64_t);
  int v43;
  char *v44;
  uint64_t v45;
  void *v46;
  id v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  _QWORD *v55;
  void **v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  id v67[4];

  v65 = a4;
  v55 = a1;
  v66 = a5;
  v67[3] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = type metadata accessor for PreviewImageProvider.State.Entry();
  v62 = *(_QWORD *)(v7 - 8);
  v63 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v61 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21EA46FBC();
  v58 = *(_QWORD *)(v9 - 8);
  v59 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v57 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  MEMORY[0x24BDAC7A8](v11);
  v60 = (uint64_t)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21EA46F5C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v53 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v54 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v53 - v23;
  v56 = a2;
  v25 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v67[0] = 0;
  v26 = objc_msgSend(v25, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 1, v67);

  v27 = v67[0];
  if (!v26)
  {
    v34 = v67[0];
    v35 = sub_21EA46F2C();

    swift_willThrow();
    v33 = (void *)v35;
    goto LABEL_6;
  }
  sub_21EA46F50();
  v28 = v27;

  sub_21EA46F44();
  v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v17, v13);
  v30 = v64;
  v31 = sub_21EA39B70();
  if (v30)
  {
    v29(v19, v13);
    v33 = (void *)v30;
LABEL_6:

    v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    v42(v24, 1, 1, v13);
    goto LABEL_7;
  }
  v36 = (uint64_t)v31;
  v37 = v32;
  v64 = a3;
  sub_21EA46F74();
  v41 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v41(v24, v19, v13);
  sub_21EA3CE44(v36, v37);
  v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v42(v24, 0, 1, v13);
  v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v24, 1, v13);
  if (v43 != 1)
  {
    v44 = v66;
    v41(v66, v24, v13);
    v45 = (uint64_t)v54;
    v55 = (_QWORD *)*v55;
    v46 = *v56;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v54, v44, v13);
    v42((char *)v45, 0, 1, v13);
    swift_bridgeObjectRetain();
    v47 = v46;
    v48 = v57;
    sub_21EA46FB0();
    v49 = v63;
    v50 = v61;
    v51 = (uint64_t)&v61[*(int *)(v63 + 20)];
    v42((char *)v51, 1, 1, v13);
    *(_QWORD *)v50 = v47;
    sub_21EA3CE88(v45, v51);
    (*(void (**)(char *, char *, uint64_t))(v58 + 32))(&v50[*(int *)(v49 + 24)], v48, v59);
    v52 = v60;
    sub_21EA3C78C((uint64_t)v50, v60);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v62 + 56))(v52, 0, 1, v49);
    swift_beginAccess();
    sub_21EA3A210(v52, v64, v65);
    swift_endAccess();
    sub_21EA38EE8();
    v38 = v66;
    v39 = 0;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v42)(v38, v39, 1, v13);
  }
LABEL_7:
  sub_21EA3C80C((uint64_t)v24, &qword_255464740);
  v38 = v66;
  v39 = 1;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v42)(v38, v39, 1, v13);
}

uint64_t sub_21EA3A84C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = a4;
  v30 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v28 - v12;
  v14 = type metadata accessor for PreviewImageProvider.State.Entry();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  swift_beginAccess();
  v19 = *(_QWORD *)(v18 + 16);
  if (!*(_QWORD *)(v19 + 16))
  {
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v22(v13, 1, 1, v14);
LABEL_7:
    sub_21EA3C80C((uint64_t)v13, &qword_255464768);
    swift_endAccess();
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v22)(v30, 1, 1, v14);
  }
  swift_bridgeObjectRetain();
  v28 = a2;
  v20 = sub_21EA3AB20(a2, a3);
  if ((v21 & 1) != 0)
  {
    sub_21EA3CF58(*(_QWORD *)(v19 + 56) + *(_QWORD *)(v15 + 72) * v20, (uint64_t)v13);
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v22(v13, 0, 1, v14);
  }
  else
  {
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v22(v13, 1, 1, v14);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    goto LABEL_7;
  sub_21EA3C78C((uint64_t)v13, (uint64_t)v17);
  swift_endAccess();
  v24 = &v17[*(int *)(v14 + 24)];
  v25 = v29;
  if ((sub_21EA46F98() & 1) != 0)
  {
    v26 = sub_21EA46FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
    sub_21EA3CF58((uint64_t)v17, (uint64_t)v11);
    v22(v11, 0, 1, v14);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_21EA3A210((uint64_t)v11, v28, a3);
    swift_endAccess();
    sub_21EA38EE8();
  }
  v27 = v30;
  sub_21EA3CF58((uint64_t)v17, v30);
  v22((char *)v27, 0, 1, v14);
  return sub_21EA3C7D0((uint64_t)v17);
}

uint64_t sub_21EA3AAFC()
{
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_21EA3AB20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21EA47274();
  sub_21EA47010();
  v4 = sub_21EA47298();
  return sub_21EA3AB84(a1, a2, v4);
}

unint64_t sub_21EA3AB84(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21EA4722C() & 1) == 0)
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
      while (!v14 && (sub_21EA4722C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21EA3AC64(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
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
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for PreviewImageProvider.State.Entry();
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255464770);
  v43 = a2;
  v9 = sub_21EA471F0();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_21EA3C78C(v30, (uint64_t)v7);
    }
    else
    {
      sub_21EA3CF58(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_21EA47274();
    sub_21EA47010();
    result = sub_21EA47298();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_21EA3C78C((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_21EA3AFCC(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v42 = a1;
  v7 = type metadata accessor for PreviewImageProvider.State.Entry();
  v45 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v40 - v10;
  if (!a3)
    return MEMORY[0x24BEE4B00];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v43 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255464770);
  result = sub_21EA471FC();
  v12 = result;
  v41 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *v42;
  v14 = 0;
  v15 = result + 64;
  v16 = v43;
  v17 = (uint64_t)v44;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v46 = v14;
      v19 = v18 | (v14 << 6);
    }
    else
    {
      v20 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v20 >= v41)
        return v12;
      v21 = v42[v20];
      v22 = v14 + 1;
      if (!v21)
      {
        v22 = v14 + 2;
        if (v14 + 2 >= v41)
          return v12;
        v21 = v42[v22];
        if (!v21)
        {
          v22 = v14 + 3;
          if (v14 + 3 >= v41)
            return v12;
          v21 = v42[v22];
          if (!v21)
          {
            v23 = v14 + 4;
            if (v14 + 4 >= v41)
              return v12;
            v21 = v42[v23];
            if (!v21)
            {
              while (1)
              {
                v22 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v22 >= v41)
                  return v12;
                v21 = v42[v22];
                ++v23;
                if (v21)
                  goto LABEL_24;
              }
            }
            v22 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v21 - 1) & v21;
      v46 = v22;
      v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    v24 = a4[7];
    v25 = a4;
    v26 = (uint64_t *)(a4[6] + 16 * v19);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v45 + 72);
    sub_21EA3CF58(v24 + v29 * v19, v17);
    sub_21EA3C78C(v17, v16);
    sub_21EA47274();
    swift_bridgeObjectRetain();
    sub_21EA47010();
    result = sub_21EA47298();
    v30 = -1 << *(_BYTE *)(v12 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      v16 = v43;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v30) >> 6;
      v16 = v43;
      do
      {
        if (++v32 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v36 = v32 == v35;
        if (v32 == v35)
          v32 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v32);
      }
      while (v37 == -1);
      v33 = __clz(__rbit64(~v37)) + (v32 << 6);
    }
    *(_QWORD *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v38 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v33);
    *v38 = v28;
    v38[1] = v27;
    result = sub_21EA3C78C(v16, *(_QWORD *)(v12 + 56) + v33 * v29);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v25;
    v14 = v46;
    if (!a3)
      return v12;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_21EA3B310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_21EA3AB20(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21EA3B7F0();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = type metadata accessor for PreviewImageProvider.State.Entry();
    v14 = *(_QWORD *)(v13 - 8);
    sub_21EA3C78C(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_21EA3B438(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for PreviewImageProvider.State.Entry();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

unint64_t sub_21EA3B438(unint64_t result, uint64_t a2)
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
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21EA47184();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_21EA47274();
        swift_bridgeObjectRetain();
        sub_21EA47010();
        v9 = sub_21EA47298();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for PreviewImageProvider.State.Entry() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21EA3B634(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_21EA3AB20(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = v19
            + *(_QWORD *)(*(_QWORD *)(type metadata accessor for PreviewImageProvider.State.Entry() - 8) + 72) * v12;
        return sub_21EA3CF14(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_21EA3B7F0();
      goto LABEL_7;
    }
    sub_21EA3AC64(v15, a4 & 1);
    v22 = sub_21EA3AB20(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21EA3B768(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_21EA47238();
  __break(1u);
  return result;
}

uint64_t sub_21EA3B768(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for PreviewImageProvider.State.Entry();
  result = sub_21EA3C78C(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_21EA3B7F0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for PreviewImageProvider.State.Entry();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255464770);
  v5 = *v0;
  v6 = sub_21EA471E4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_21EA3CF58(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_21EA3C78C((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21EA3BA1C()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_environment);

  v2 = sub_21EA46FF8();
  if (*(_QWORD *)(v2 + 16) && (v3 = sub_21EA3AB20(0xD00000000000001ALL, 0x800000021EA48990), (v4 & 1) != 0))
  {
    v5 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 16 * v3);
    v7 = *v5;
    v6 = v5[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v7 == 49 && v6 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v9 = sub_21EA4722C();
      swift_bridgeObjectRelease();
      return v9 & 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewImageCategory()
{
  return &type metadata for PreviewImageCategory;
}

uint64_t type metadata accessor for PreviewImageProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PreviewImageProvider.State()
{
  return objc_opt_self();
}

void **sub_21EA3BBA4(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21EA46F5C();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    v14 = v4;
    if (v13(v10, 1, v11))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = *(int *)(a3 + 24);
    v17 = (char *)v7 + v16;
    v18 = (char *)a2 + v16;
    v19 = sub_21EA46FBC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  }
  return v7;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207B44C8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21EA3BD10(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_21EA46F5C();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  v7 = (char *)a1 + *(int *)(a2 + 24);
  v8 = sub_21EA46FBC();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

void **sub_21EA3BDA8(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21EA46F5C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v6;
  if (v12(v9, 1, v10))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v15 = *(int *)(a3 + 24);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_21EA46FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

void **sub_21EA3BEAC(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_21EA46F5C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = *(int *)(a3 + 24);
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_21EA46FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  return a1;
}

_QWORD *sub_21EA3BFFC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21EA46F5C();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_21EA46FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

void **sub_21EA3C0F4(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21EA46F5C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_21EA46FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_21EA3C240()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EA3C24C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = sub_21EA46FBC();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t sub_21EA3C2F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21EA3C2FC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_21EA46FBC();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for PreviewImageProvider.State.Entry()
{
  uint64_t result;

  result = qword_255464748;
  if (!qword_255464748)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21EA3C3D8()
{
  unint64_t v0;
  unint64_t v1;

  sub_21EA3C46C();
  if (v0 <= 0x3F)
  {
    sub_21EA46FBC();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_21EA3C46C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255464758)
  {
    sub_21EA46F5C();
    v0 = sub_21EA47160();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255464758);
  }
}

uint64_t _s21DeveloperToolsSupport20PreviewImageCategoryV4KindOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s21DeveloperToolsSupport20PreviewImageCategoryV4KindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EA3C59C + 4 * byte_21EA47B25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21EA3C5D0 + 4 * byte_21EA47B20[v4]))();
}

uint64_t sub_21EA3C5D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA3C5D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EA3C5E0);
  return result;
}

uint64_t sub_21EA3C5EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EA3C5F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21EA3C5F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA3C600(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA3C60C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21EA3C614(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewImageCategory.Kind()
{
  return &type metadata for PreviewImageCategory.Kind;
}

unint64_t sub_21EA3C634()
{
  unint64_t result;

  result = qword_255464760;
  if (!qword_255464760)
  {
    result = MEMORY[0x2207B44E0](&unk_21EA47BB4, &type metadata for PreviewImageCategory.Kind);
    atomic_store(result, (unint64_t *)&qword_255464760);
  }
  return result;
}

uint64_t sub_21EA3C678()
{
  sub_21EA47190();
  sub_21EA4701C();
  sub_21EA471CC();
  sub_21EA4701C();
  sub_21EA47214();
  sub_21EA4701C();
  swift_bridgeObjectRelease();
  sub_21EA4701C();
  return 0;
}

uint64_t sub_21EA3C78C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EA3C7D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21EA3C80C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_21EA3C848(double a1)
{
  double v1;
  double v2;

  v1 = a1 / 60.0;
  fmod(a1 / 60.0, 2.0);
  v2 = floor(v1);
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x21EA3C95CLL);
  }
}

CGGradientRef sub_21EA3C970(unint64_t a1)
{
  double v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGColorRef SRGB;
  CGColorRef v15;
  CGColorSpace *v16;
  uint64_t v17;
  CGColor *v18;
  CGColor *v19;
  const __CFArray *v20;
  CGGradientRef v21;

  v1 = fmod((double)(a1 % 0x24) * 15.0, 360.0);
  sub_21EA3C848(v1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  sub_21EA3C848(v1);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  SRGB = CGColorCreateSRGB(v3, v5, v7, 1.0);
  v15 = CGColorCreateSRGB(v9, v11, v13, 1.0);
  v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255464780);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_21EA47CD0;
  *(_QWORD *)(v17 + 32) = SRGB;
  *(_QWORD *)(v17 + 40) = v15;
  sub_21EA4707C();
  type metadata accessor for CGColor(0);
  v18 = SRGB;
  v19 = v15;
  v20 = (const __CFArray *)sub_21EA47070();
  swift_bridgeObjectRelease();
  v21 = CGGradientCreateWithColors(v16, v20, 0);

  return v21;
}

CGImageRef sub_21EA3CB14(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  CGColorSpace *v6;
  CGColorSpace *v7;
  CGContext *v8;
  CGGradient *v9;
  CGGradient *v10;
  CGColor *SRGB;
  double MidX;
  CGFloat v13;
  CGImageRef Image;
  _QWORD v16[2];
  CGPoint v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v2 = sub_21EA46FC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = CGBitmapContextCreate(0, 0xC8uLL, 0xC8uLL, 8uLL, 0x320uLL, v6, 0x2002u);

  if (!v8)
    return 0;
  v9 = sub_21EA3C970(a1);
  if (v9)
  {
    v10 = v9;
    v18.x = 200.0;
    v17.x = 0.0;
    v17.y = 0.0;
    v18.y = 200.0;
    CGContextDrawLinearGradient(v8, v9, v17, v18, 0);

  }
  SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGContextSetFillColorWithColor(v8, SRGB);

  v16[1] = 0x4044000000000000;
  v19.origin.x = 80.0;
  v19.origin.y = 95.0;
  v19.size.width = 40.0;
  v19.size.height = 50.0;
  CGContextFillEllipseInRect(v8, v19);
  v20.origin.x = 80.0;
  v20.origin.y = 95.0;
  v20.size.width = 40.0;
  v20.size.height = 50.0;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = 80.0;
  v21.origin.y = 95.0;
  v21.size.width = 40.0;
  v21.size.height = 50.0;
  v13 = CGRectGetMinY(v21) + -40.0 + -6.25;
  atan2(v13 + 5.71428571 - (v13 + 5.0), MidX + -39.5897327 - (MidX + -34.6410162));
  v16[0] = atan2(v13 - (v13 + 5.0), MidX + -34.6410162 - (MidX + -34.6410162));
  atan2(v13 + 5.71428571 - (v13 + 5.0), MidX + 39.5897327 - (MidX + 34.6410162));
  atan2(v13 - (v13 + 5.0), MidX + 34.6410162 - (MidX + 34.6410162));
  sub_21EA47130();
  sub_21EA47130();
  sub_21EA47130();
  CGContextClosePath(v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDBD730], v2);
  sub_21EA4713C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  Image = CGBitmapContextCreateImage(v8);

  return Image;
}

uint64_t sub_21EA3CDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EA3CE44(uint64_t a1, unint64_t a2)
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

uint64_t sub_21EA3CE88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255464740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EA3CED0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21EA3CEF4()
{
  return sub_21EA39020();
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

uint64_t sub_21EA3CF14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EA3CF58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21EA3CF9C()
{
  unint64_t result;

  result = qword_255464778;
  if (!qword_255464778)
  {
    result = MEMORY[0x2207B44E0](&unk_21EA47C80, &_s31ImageDataGenerationFailureErrorVN);
    atomic_store(result, (unint64_t *)&qword_255464778);
  }
  return result;
}

uint64_t sub_21EA3CFE0()
{
  return sub_21EA392C0();
}

uint64_t sub_21EA3CFE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21EA39964(a1, a2, a3);
}

uint64_t sub_21EA3CFF0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v24;
  unint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, char *);

  v24 = a2;
  v29 = a4;
  v25 = a1;
  v5 = type metadata accessor for PreviewImageProvider.State.Entry();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v11 = *(_QWORD *)(a3 + 64);
  v26 = 0;
  v27 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v28 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }
    v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v20 >= v28)
      return sub_21EA3AFCC(v25, v24, v26, (_QWORD *)a3);
    v21 = *(_QWORD *)(v27 + 8 * v20);
    ++v10;
    if (!v21)
    {
      v10 = v20 + 1;
      if (v20 + 1 >= v28)
        return sub_21EA3AFCC(v25, v24, v26, (_QWORD *)a3);
      v21 = *(_QWORD *)(v27 + 8 * v10);
      if (!v21)
      {
        v10 = v20 + 2;
        if (v20 + 2 >= v28)
          return sub_21EA3AFCC(v25, v24, v26, (_QWORD *)a3);
        v21 = *(_QWORD *)(v27 + 8 * v10);
        if (!v21)
          break;
      }
    }
LABEL_20:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_5:
    v17 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v16);
    v19 = *v17;
    v18 = v17[1];
    sub_21EA3CF58(*(_QWORD *)(a3 + 56) + *(_QWORD *)(v6 + 72) * v16, (uint64_t)v9);
    swift_bridgeObjectRetain();
    LOBYTE(v19) = v29(v19, v18, v9);
    sub_21EA3C7D0((uint64_t)v9);
    result = swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
    {
      *(unint64_t *)((char *)v25 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v26++, 1))
      {
        __break(1u);
        return sub_21EA3AFCC(v25, v24, v26, (_QWORD *)a3);
      }
    }
  }
  v22 = v20 + 3;
  if (v22 >= v28)
    return sub_21EA3AFCC(v25, v24, v26, (_QWORD *)a3);
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
  {
    v10 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    v10 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v10 >= v28)
      return sub_21EA3AFCC(v25, v24, v26, (_QWORD *)a3);
    v21 = *(_QWORD *)(v27 + 8 * v10);
    ++v22;
    if (v21)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_21EA3D22C(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    v10 = sub_21EA3CFF0((_QWORD *)((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_21EA3CFF0((unint64_t *)v11, v8, v6, a2);
    MEMORY[0x2207B454C](v11, -1, -1);
  }
  return a3;
}

uint64_t sub_21EA3D39C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *_s31ImageDataGenerationFailureErrorVMa()
{
  return &_s31ImageDataGenerationFailureErrorVN;
}

void static LibraryItem.Category.effect.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x746365666665;
  a1[1] = 0xE600000000000000;
}

void static LibraryItem.Category.layout.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x74756F79616CLL;
  a1[1] = 0xE600000000000000;
}

void static LibraryItem.Category.control.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x6C6F72746E6F63;
  a1[1] = 0xE700000000000000;
}

void static LibraryItem.Category.other.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x726568746FLL;
  a1[1] = 0xE500000000000000;
}

uint64_t LibraryItem.init<A>(_:visible:title:category:matchingSignature:)()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t static LibraryContentBuilder.buildBlock(_:)()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_21EA3D51C(v0);
  swift_bridgeObjectRelease();
  return v1;
}

double static LibraryContentBuilder.buildExpression(_:)()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255464798);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_21EA47CE0;
  return result;
}

uint64_t sub_21EA3D4F8()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t LibraryContentProvider.views.getter()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t LibraryContentProvider.modifiers(base:)()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21EA3D51C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  size_t v4;
  unint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  char *v15;
  size_t v16;
  size_t v17;
  char *v18;
  char *v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v2 = a1 + 32;
  result = swift_bridgeObjectRetain();
  v4 = 0;
  v5 = 0;
  v6 = (char *)MEMORY[0x24BEE4AF8];
LABEL_3:
  v8 = *(_QWORD *)(a1 + 16);
  if (v5 != v8)
  {
    if (v5 >= v8)
    {
LABEL_29:
      __break(1u);
    }
    else
    {
      while (1)
      {
        v9 = *(_QWORD *)(v2 + 8 * v5);
        swift_bridgeObjectRetain();
        result = swift_bridgeObjectRelease();
        if (v9)
        {
          v7 = *(_QWORD *)(v9 + 16);
          if (v7)
            break;
        }
        ++v5;
        v10 = *(_QWORD *)(a1 + 16);
        if (v5 == v10)
          goto LABEL_25;
        if (v5 >= v10)
          goto LABEL_29;
      }
      v11 = 0;
      ++v5;
      while (v11 < v7)
      {
        if (!v4)
        {
          v12 = *((_QWORD *)v6 + 3);
          if ((uint64_t)((v12 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_32;
          v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
          if (v13 <= 1)
            v14 = 1;
          else
            v14 = v13;
          __swift_instantiateConcreteTypeFromMangledName(&qword_255464798);
          v15 = (char *)swift_allocObject();
          v16 = 2 * _swift_stdlib_malloc_size(v15) - 64;
          *((_QWORD *)v15 + 2) = v14;
          *((_QWORD *)v15 + 3) = v16;
          v17 = *((_QWORD *)v6 + 3) >> 1;
          if (*((_QWORD *)v6 + 2))
          {
            v18 = v15 + 32;
            v19 = v6 + 32;
            if (v15 != v6 || v18 >= &v19[v17])
              memmove(v18, v19, v17);
            *((_QWORD *)v6 + 2) = 0;
          }
          v4 = (v16 >> 1) - v17;
          result = swift_release();
          v6 = v15;
        }
        v20 = __OFSUB__(v4--, 1);
        if (v20)
          goto LABEL_31;
        ++v11;
        v7 = *(_QWORD *)(v9 + 16);
        if (v11 == v7)
          goto LABEL_3;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_25:
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v21 = *((_QWORD *)v6 + 3);
  if (v21 < 2)
    return (uint64_t)v6;
  v22 = v21 >> 1;
  v20 = __OFSUB__(v22, v4);
  v23 = v22 - v4;
  if (!v20)
  {
    *((_QWORD *)v6 + 2) = v23;
    return (uint64_t)v6;
  }
LABEL_33:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for LibraryItem()
{
  return &type metadata for LibraryItem;
}

_QWORD *initializeBufferWithCopyOfBuffer for LibraryItem.Category(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LibraryItem.Category()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for LibraryItem.Category(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for LibraryItem.Category(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LibraryItem.Category(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LibraryItem.Category(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LibraryItem.Category()
{
  return &type metadata for LibraryItem.Category;
}

ValueMetadata *type metadata accessor for LibraryContentBuilder()
{
  return &type metadata for LibraryContentBuilder;
}

uint64_t dispatch thunk of LibraryContentProvider.views.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of LibraryContentProvider.modifiers(base:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

float PreviewCamera.Point.x.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

float PreviewCamera.Point.y.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

float PreviewCamera.Point.z.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

DeveloperToolsSupport::PreviewCamera::Point __swiftcall PreviewCamera.Point.init(x:y:z:)(Swift::Float x, Swift::Float y, Swift::Float z)
{
  Swift::Float *v3;
  DeveloperToolsSupport::PreviewCamera::Point result;

  *v3 = x;
  v3[1] = y;
  v3[2] = z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

uint64_t PreviewCamera.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(_BYTE *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  return sub_21EA3D89C();
}

uint64_t sub_21EA3D89C()
{
  return swift_bridgeObjectRetain();
}

__n128 PreviewCamera.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;
  __n128 result;
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  result = *(__n128 *)a1;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 32) = v2;
  *(_BYTE *)(a2 + 40) = v3;
  return result;
}

uint64_t static PreviewCameraBuilder.buildExpression(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = *((_BYTE *)a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554647A0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21EA47CE0;
  *(_QWORD *)(v7 + 32) = v1;
  *(_QWORD *)(v7 + 40) = v2;
  *(_QWORD *)(v7 + 48) = v3;
  *(_QWORD *)(v7 + 56) = v4;
  *(_QWORD *)(v7 + 64) = v5;
  *(_BYTE *)(v7 + 72) = v6;
  sub_21EA3D89C();
  return v7;
}

char *static PreviewCameraBuilder.buildArray(_:)(uint64_t a1)
{
  uint64_t v1;
  char *result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)MEMORY[0x24BEE4AF8];
  result = (char *)swift_bridgeObjectRetain();
  v4 = 0;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v6 = *(_QWORD *)(a1 + 8 * v4 + 32);
    v7 = *(_QWORD *)(v6 + 16);
    v8 = *((_QWORD *)v5 + 2);
    v9 = v8 + v7;
    if (__OFADD__(v8, v7))
      break;
    swift_bridgeObjectRetain();
    result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v9 <= *((_QWORD *)v5 + 3) >> 1)
    {
      if (*(_QWORD *)(v6 + 16))
        goto LABEL_14;
    }
    else
    {
      if (v8 <= v9)
        v10 = v8 + v7;
      else
        v10 = v8;
      result = sub_21EA3DD4C(result, v10, 1, v5);
      v5 = result;
      if (*(_QWORD *)(v6 + 16))
      {
LABEL_14:
        if ((*((_QWORD *)v5 + 3) >> 1) - *((_QWORD *)v5 + 2) < v7)
          goto LABEL_23;
        result = (char *)swift_arrayInitWithCopy();
        if (v7)
        {
          v11 = *((_QWORD *)v5 + 2);
          v12 = __OFADD__(v11, v7);
          v13 = v11 + v7;
          if (v12)
            goto LABEL_24;
          *((_QWORD *)v5 + 2) = v13;
        }
        goto LABEL_4;
      }
    }
    if (v7)
      goto LABEL_22;
LABEL_4:
    result = (char *)swift_bridgeObjectRelease();
    if (v1 == ++v4)
    {
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t PreviewCameraTrait.value.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static PreviewCameraTrait.defaultValue.getter()
{
  return MEMORY[0x24BEE4AF8];
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _s21DeveloperToolsSupport20PreviewCameraBuilderV17buildPartialBlock11accumulated4nextSayAA0dE0VGAI_AItFZ_0()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  v0 = swift_bridgeObjectRetain();
  sub_21EA3DC60(v0);
}

uint64_t sub_21EA3DB04@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

void sub_21EA3DB10(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_21EA3DB20@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v5 = *a1;
  swift_bridgeObjectRetain();
  v3 = swift_bridgeObjectRetain();
  result = sub_21EA3DC60(v3);
  *a2 = v5;
  return result;
}

uint64_t static PreviewTrait<A>.camera(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = *((_BYTE *)a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554647A0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21EA47CE0;
  *(_QWORD *)(v9 + 32) = v3;
  *(_QWORD *)(v9 + 40) = v4;
  *(_QWORD *)(v9 + 48) = v5;
  *(_QWORD *)(v9 + 56) = v6;
  *(_QWORD *)(v9 + 64) = v7;
  *(_BYTE *)(v9 + 72) = v8;
  v13 = &type metadata for PreviewCameraTrait;
  v14 = &protocol witness table for PreviewCameraTrait;
  *(_QWORD *)&v12 = v9;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_21EA47CE0;
  sub_21EA3DE60(&v12, v10 + 32);
  *a2 = v10;
  return sub_21EA3D89C();
}

uint64_t sub_21EA3DC60(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_21EA3DD4C((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_21EA3DD4C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2554647A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21EA3DE60(__int128 *a1, uint64_t a2)
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

uint64_t sub_21EA3DE7C()
{
  return swift_bridgeObjectRelease();
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

ValueMetadata *type metadata accessor for PreviewCamera()
{
  return &type metadata for PreviewCamera;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewCamera.Point(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviewCamera.Point(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PreviewCamera.Point()
{
  return &type metadata for PreviewCamera.Point;
}

uint64_t initializeBufferWithCopyOfBuffer for PreviewCamera.Value(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwxx_0()
{
  return sub_21EA3DE7C();
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwcp_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = *((_BYTE *)a2 + 40);
  sub_21EA3D89C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwca_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = *((_BYTE *)a2 + 40);
  sub_21EA3D89C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  sub_21EA3DE7C();
  return a1;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = v4;
  sub_21EA3DE7C();
  return a1;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
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

uint64_t sub_21EA3E158(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_21EA3E160(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewCamera.Value()
{
  return &type metadata for PreviewCamera.Value;
}

ValueMetadata *type metadata accessor for PreviewCameraBuilder()
{
  return &type metadata for PreviewCameraBuilder;
}

ValueMetadata *type metadata accessor for PreviewCameraTrait()
{
  return &type metadata for PreviewCameraTrait;
}

uint64_t static PreviewBodyBuilder.buildBlock(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

void static PreviewBodyBuilder.buildBlock(_:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewBodyBuilder.buildOptional(_:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewBodyBuilder.buildEither(first:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewBodyBuilder.buildEither(second:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewBodyBuilder.buildLimitedAvailability(_:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewMacroBodyBuilder.buildBlock(_:)()
{
  sub_21EA471D8();
  __break(1u);
}

{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewMacroBodyBuilder.buildOptional(_:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewMacroBodyBuilder.buildEither(first:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewMacroBodyBuilder.buildEither(second:)()
{
  sub_21EA471D8();
  __break(1u);
}

void static PreviewMacroBodyBuilder.buildLimitedAvailability(_:)()
{
  sub_21EA471D8();
  __break(1u);
}

uint64_t sub_21EA3E4E4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for PreviewBodyBuilder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewBodyBuilder);
}

uint64_t type metadata accessor for PreviewMacroBodyBuilder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewMacroBodyBuilder);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2207B4498](a1, v6, a5);
}

uint64_t Preview.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Preview.source.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EA3F0B4(v1 + 16, a1);
}

uint64_t Preview.init<A, B>(displayName:source:traits:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, _QWORD *a7@<X8>)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  *a7 = a1;
  a7[1] = a2;
  a7[5] = a5;
  a7[6] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a7 + 2);
  v12 = *(_QWORD *)(a5 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v12 + 16))(boxed_opaque_existential_1, a3, a5);
  swift_getKeyPath();
  type metadata accessor for PreviewTrait(255, a4, v13, v14);
  v15 = sub_21EA470C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554648B0);
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12C8], v15);
  sub_21EA3E744();
  v16 = sub_21EA47064();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, a5);
  swift_bridgeObjectRelease();
  result = swift_release();
  a7[7] = v16;
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

uint64_t sub_21EA3E6EC()
{
  swift_bridgeObjectRetain();
  swift_getAtKeyPath();
  return swift_bridgeObjectRelease();
}

unint64_t sub_21EA3E744()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2554648B8;
  if (!qword_2554648B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554648B0);
    result = MEMORY[0x2207B44E0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2554648B8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207B44D4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t Preview.init<A>(displayName:source:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;

  *a6 = a1;
  a6[1] = a2;
  a6[5] = a4;
  a6[6] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a6 + 2);
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a3, a4);
  a6[7] = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t Preview.value<A>(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v25 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = sub_21EA47160();
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v22 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v22 - v14;
  v30 = *(_QWORD *)(v3 + 56);
  v28 = a1;
  v29 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554648B0);
  sub_21EA3E744();
  v16 = sub_21EA47040();
  swift_bridgeObjectRelease();
  v30 = v16;
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v13, 1, 1, AssociatedTypeWitness);
  v26 = a1;
  v27 = a2;
  v23 = a2;
  v18 = sub_21EA470C4();
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12C8], v18);
  sub_21EA47058();
  v19 = v24;
  v20 = *(void (**)(char *, uint64_t))(v24 + 8);
  v20(v13, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v10, v15, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(uint64_t))(v23 + 24))(a1);
    v20(v15, v7);
    return ((uint64_t (*)(char *, uint64_t))v20)(v10, v7);
  }
  else
  {
    v20(v15, v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v25, v10, AssociatedTypeWitness);
  }
}

uint64_t sub_21EA3EA7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  _BYTE v7[40];

  sub_21EA3F0B4(a1, (uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554648C0);
  v5 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, v5 ^ 1u, 1, a2);
}

uint64_t sub_21EA3EAFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21EA3EA7C(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_21EA3EB14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a1;
  v24 = a2;
  v25 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_21EA47160();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v22 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v23, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v19 = v25;
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v12, AssociatedTypeWitness);
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
    v19 = v25;
    (*(void (**)(char *, char *, uint64_t, uint64_t))(a4 + 32))(v18, v16, a3, a4);
    v20 = *(void (**)(char *, uint64_t))(v13 + 8);
    v20(v16, AssociatedTypeWitness);
    v20(v18, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v19, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_21EA3ECEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21EA3EB14(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t destroy for Preview(uint64_t a1)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return swift_bridgeObjectRelease();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t initializeWithCopy for Preview(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2 + 16;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  v7 = v6;
  v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Preview(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Preview(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Preview(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Preview(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Preview()
{
  return &type metadata for Preview;
}

uint64_t sub_21EA3F0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t static PreviewTrait<A>.defaultLayout.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  __int128 v5;
  ValueMetadata *v6;
  _UNKNOWN **v7;

  v6 = &type metadata for PreviewLayoutTrait;
  v7 = &protocol witness table for PreviewLayoutTrait;
  v2 = swift_allocObject();
  *(_QWORD *)&v5 = v2;
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 16) = 0;
  *(_BYTE *)(v2 + 40) = 2;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v5, v3 + 32);
  *a1 = v3;
  return result;
}

uint64_t sub_21EA3F190()
{
  return swift_deallocObject();
}

uint64_t static PreviewTrait<A>.sizeThatFitsLayout.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  __int128 v5;
  ValueMetadata *v6;
  _UNKNOWN **v7;

  v6 = &type metadata for PreviewLayoutTrait;
  v7 = &protocol witness table for PreviewLayoutTrait;
  v2 = swift_allocObject();
  *(_QWORD *)&v5 = v2;
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 16) = 1;
  *(_BYTE *)(v2 + 40) = 2;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v5, v3 + 32);
  *a1 = v3;
  return result;
}

uint64_t static PreviewTrait<A>.fixedLayout(width:height:)@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  __int128 v9;
  ValueMetadata *v10;
  _UNKNOWN **v11;

  v10 = &type metadata for PreviewLayoutTrait;
  v11 = &protocol witness table for PreviewLayoutTrait;
  v6 = swift_allocObject();
  *(_QWORD *)&v9 = v6;
  *(double *)(v6 + 16) = a2;
  *(double *)(v6 + 24) = a3;
  *(_QWORD *)(v6 + 32) = 0;
  *(_BYTE *)(v6 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v9, v7 + 32);
  *a1 = v7;
  return result;
}

uint64_t static PreviewTrait<A>.fixedLayout(width:height:depth:)@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  __int128 v11;
  ValueMetadata *v12;
  _UNKNOWN **v13;

  v12 = &type metadata for PreviewLayoutTrait;
  v13 = &protocol witness table for PreviewLayoutTrait;
  v8 = swift_allocObject();
  *(_QWORD *)&v11 = v8;
  *(double *)(v8 + 16) = a2;
  *(double *)(v8 + 24) = a3;
  *(double *)(v8 + 32) = a4;
  *(_BYTE *)(v8 + 40) = 1;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v11, v9 + 32);
  *a1 = v9;
  return result;
}

uint64_t static PreviewTrait<A>.portrait.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  ValueMetadata *v5;
  _UNKNOWN **v6;

  v5 = &type metadata for PreviewInterfaceOrientationTrait;
  v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

uint64_t static PreviewTrait<A>.landscapeLeft.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  ValueMetadata *v5;
  _UNKNOWN **v6;

  v5 = &type metadata for PreviewInterfaceOrientationTrait;
  v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 2;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

uint64_t static PreviewTrait<A>.landscapeRight.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  ValueMetadata *v5;
  _UNKNOWN **v6;

  v5 = &type metadata for PreviewInterfaceOrientationTrait;
  v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 3;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

uint64_t static PreviewTrait<A>.portraitUpsideDown.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  ValueMetadata *v5;
  _UNKNOWN **v6;

  v5 = &type metadata for PreviewInterfaceOrientationTrait;
  v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 1;
  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

ValueMetadata *type metadata accessor for Preview.ViewTraits()
{
  return &type metadata for Preview.ViewTraits;
}

uint64_t _Playground.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _Playground.displayName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*_Playground.displayName.modify())()
{
  return nullsub_1;
}

uint64_t sub_21EA3F5F0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_21EA3F644;
  return v5();
}

uint64_t sub_21EA3F644()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21EA3F68C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  swift_retain();
  result = swift_release();
  *(_QWORD *)(a2 + 16) = &unk_2554648D0;
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t sub_21EA3F6F0(int *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_21EA3FB18;
  return v4();
}

uint64_t _Playground.body.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t _Playground.body.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*_Playground.body.modify())()
{
  return nullsub_1;
}

uint64_t _Playground.init(_:body:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_21EA3F7C8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  *a2 = &unk_2554648E0;
  a2[1] = v5;
  return swift_retain();
}

uint64_t destroy for _Playground()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for _Playground(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for _Playground(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for _Playground(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _Playground(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _Playground(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _Playground()
{
  return &type metadata for _Playground;
}

uint64_t dispatch thunk of static _PlaygroundRegistry.fileID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static _PlaygroundRegistry.line.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static _PlaygroundRegistry.column.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static _PlaygroundRegistry.makePlayground()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

ValueMetadata *type metadata accessor for _PlaygroundUnavailable()
{
  return &type metadata for _PlaygroundUnavailable;
}

uint64_t sub_21EA3FA20()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EA3FA44()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21EA3FB18;
  return ((uint64_t (*)(int *))((char *)&dword_2554648C8 + dword_2554648C8))(v2);
}

uint64_t sub_21EA3FAA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21EA3F644;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2554648D8 + dword_2554648D8))(a1, v4);
}

uint64_t sub_21EA3FB20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = *(_QWORD *)(v5 + *(int *)(a2 + 28));
  v9 = type metadata accessor for PreviewSection(0, *(_QWORD *)(a2 + 16), a3, a4);
  if (MEMORY[0x2207B3F34](v8, v9) < a1)
  {
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56);
    v11 = a5;
    v12 = 1;
    return v10(v11, v12, 1, v9);
  }
  if (!a1)
  {
    v14 = *(_QWORD *)(v9 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(a5, v5, v9);
    goto LABEL_7;
  }
  result = a1 - 1;
  if (!__OFSUB__(a1, 1))
  {
    sub_21EA470DC();
    v14 = *(_QWORD *)(v9 - 8);
LABEL_7:
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    v11 = a5;
    v12 = 0;
    return v10(v11, v12, 1, v9);
  }
  __break(1u);
  return result;
}

uint64_t sub_21EA3FBE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v9 = type metadata accessor for PreviewSection(0, a3, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a5, a1, v9);
  result = type metadata accessor for PreviewArguments.InhabitedSections(0, a3, v10, v11);
  *(_QWORD *)(a5 + *(int *)(result + 28)) = a2;
  return result;
}

uint64_t sub_21EA3FC4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v8 = type metadata accessor for PreviewArguments.InhabitedSections(255, a2, a3, a4);
  v9 = sub_21EA47160();
  v43 = *(_QWORD *)(v9 - 8);
  v44 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v38 - v10;
  v40 = a2;
  v13 = type metadata accessor for PreviewSection(255, a2, v11, v12);
  v14 = sub_21EA47160();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v38 - v17;
  v19 = *(_QWORD *)(v13 - 8);
  v20 = MEMORY[0x24BDAC7A8](v16);
  v38 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v38 - v22;
  v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v45 = a5;
  v41 = v8;
  v42 = v24;
  v24(a5, 1, 1, v8);
  *(_QWORD *)&v48 = a1;
  v25 = sub_21EA470C4();
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12E0], v25);
  sub_21EA4710C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v13) == 1)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    v26 = v45;
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
    return v42(v26, 1, 1, v41);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v23, v18, v13);
    v28 = v38;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v38, v23, v13);
    *(_QWORD *)&v46 = a1;
    sub_21EA47118();
    v46 = v48;
    v47 = v49;
    v29 = sub_21EA47178();
    MEMORY[0x2207B44E0](MEMORY[0x24BEE2180], v29);
    v30 = sub_21EA470D0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v13);
    v31 = v40;
    v34 = type metadata accessor for PreviewSection(0, v40, v32, v33);
    v35 = v39;
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v39, v28, v34);
    *(_QWORD *)&v35[*(int *)(type metadata accessor for PreviewArguments.InhabitedSections(0, v31, v36, v37) + 28)] = v30;
    v42((uint64_t)v35, 0, 1, v41);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v43 + 40))(v45, v35, v44);
  }
}

uint64_t PreviewSection.init(_:arguments:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v11 = type metadata accessor for PreviewSection(255, a5, (uint64_t)a3, a4);
  v12 = sub_21EA47160();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - v15;
  v17 = a3(v14);
  sub_21EA4005C(a1, a2, v17, a5, (uint64_t)v16);
  v18 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v11))
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    v19 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a6, v16, v11);
    v19 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(a6, v19, 1, v11);
}

uint64_t type metadata accessor for PreviewSection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewSection);
}

uint64_t sub_21EA4005C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v28 = a1;
  v29 = a2;
  v31 = a5;
  v7 = sub_21EA47160();
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - v9;
  v11 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for PreviewSection(0, a4, v14, v15);
  v30 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v26 - v17;
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  *(_QWORD *)&v34 = a3;
  v19 = sub_21EA470C4();
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12E0], v19);
  sub_21EA4710C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a4) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v27);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v31, 1, 1, v16);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a4);
    v21 = v29;
    *(_QWORD *)v18 = v28;
    *((_QWORD *)v18 + 1) = v21;
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v18[*(int *)(v16 + 28)], v13, a4);
    *(_QWORD *)&v32 = a3;
    sub_21EA47118();
    v32 = v34;
    v33 = v35;
    v22 = sub_21EA47178();
    MEMORY[0x2207B44E0](MEMORY[0x24BEE2180], v22);
    v23 = sub_21EA470D0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a4);
    *(_QWORD *)&v18[*(int *)(v16 + 32)] = v23;
    v25 = v30;
    v24 = v31;
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v31, v18, v16);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v25 + 56))(v24, 0, 1, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v18, v16);
  }
}

uint64_t sub_21EA402DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 + 16);
  if (MEMORY[0x2207B3F34](*(_QWORD *)(v3 + *(int *)(a2 + 32)), v7) < a1)
  {
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a3;
    v10 = 1;
    return v8(v9, v10, 1, v7);
  }
  if (!a1)
  {
    v13 = v3 + *(int *)(a2 + 28);
    v12 = *(_QWORD *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a3, v13, v7);
    goto LABEL_7;
  }
  result = a1 - 1;
  if (!__OFSUB__(a1, 1))
  {
    sub_21EA470DC();
    v12 = *(_QWORD *)(v7 - 8);
LABEL_7:
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v9 = a3;
    v10 = 0;
    return v8(v9, v10, 1, v7);
  }
  __break(1u);
  return result;
}

uint64_t _s21DeveloperToolsSupport23PreviewArgumentsBuilderV15buildExpressionyAC9ComponentVyx_GxFZ_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  type metadata accessor for PreviewArgumentsBuilder.Component.Item(255, a2, a3, a4);
  sub_21EA47220();
  swift_allocObject();
  v8 = sub_21EA47088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(v9, a1, a2);
  swift_storeEnumTagMultiPayload();
  result = sub_21EA470C4();
  *a5 = v8;
  return result;
}

uint64_t sub_21EA40450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  type metadata accessor for PreviewArgumentsBuilder.Component.Item(255, a2, a3, a4);
  sub_21EA47220();
  swift_allocObject();
  v8 = sub_21EA47088();
  v10 = v9;
  v13 = type metadata accessor for PreviewSection(0, a2, v11, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, a1, v13);
  swift_storeEnumTagMultiPayload();
  result = sub_21EA470C4();
  *a5 = v8;
  return result;
}

uint64_t _s21DeveloperToolsSupport23PreviewArgumentsBuilderV10buildArrayyAC9ComponentVyx_GSayAGGFZ_0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_getKeyPath();
  type metadata accessor for PreviewArgumentsBuilder.Component(255, a1, v4, v5);
  v6 = sub_21EA470C4();
  type metadata accessor for PreviewArgumentsBuilder.Component.Item(255, a1, v7, v8);
  v9 = sub_21EA470C4();
  v10 = MEMORY[0x24BEE12C8];
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12C8], v6);
  MEMORY[0x2207B44E0](v10, v9);
  v11 = sub_21EA47064();
  result = swift_release();
  *a2 = v11;
  return result;
}

uint64_t sub_21EA405F8()
{
  swift_bridgeObjectRetain();
  swift_getAtKeyPath();
  return swift_bridgeObjectRelease();
}

uint64_t static PreviewArgumentsBuilder.buildExpression<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];

  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  v8 = type metadata accessor for PreviewArgumentsBuilder.Component(0, a1, a2, a3);
  sub_21EA4071C((void (*)(char *, char *))sub_21EA406F4, (uint64_t)v11, a2, v8, MEMORY[0x24BEE4078], a3, MEMORY[0x24BEE40A8], v9);
  _s21DeveloperToolsSupport23PreviewArgumentsBuilderV10buildArrayyAC9ComponentVyx_GSayAGGFZ_0(a1, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EA406F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;

  return _s21DeveloperToolsSupport23PreviewArgumentsBuilderV15buildExpressionyAC9ComponentVyx_GxFZ_0(a1, *(_QWORD *)(v4 + 16), a2, a3, a4);
}

uint64_t sub_21EA4071C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t result;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_21EA47160();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x24BDAC7A8](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_21EA47034();
  v57 = sub_21EA471B4();
  v53 = sub_21EA471C0();
  sub_21EA4719C();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_21EA47028();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_21EA4716C();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      sub_21EA471A8();
      if (!--v31)
      {
        v34 = v49;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v34 = v49;
LABEL_9:
  sub_21EA4716C();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36 = v38;
    v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      sub_21EA471A8();
      sub_21EA4716C();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t type metadata accessor for PreviewArgumentsBuilder.Component(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewArgumentsBuilder.Component);
}

uint64_t static PreviewArgumentsBuilder.buildExpression(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD v13[5];
  uint64_t v14;

  v13[2] = a1;
  type metadata accessor for PreviewSection(255, a1, a2, a3);
  sub_21EA47160();
  v8 = type metadata accessor for PreviewArgumentsBuilder.Component(0, a1, v6, v7);
  sub_21EA40D08((void (*)(char *, char *))sub_21EA40CE0, (uint64_t)v13, MEMORY[0x24BEE4078], v8, v9, (uint64_t)&v14);
  result = v14;
  if (!v14)
  {
    type metadata accessor for PreviewArgumentsBuilder.Component.Item(0, a1, v10, v11);
    result = sub_21EA47094();
  }
  *a4 = result;
  return result;
}

uint64_t sub_21EA40CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;

  return sub_21EA40450(a1, *(_QWORD *)(v4 + 16), a2, a3, a4);
}

uint64_t sub_21EA40D08@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;

  v25 = a5;
  v26 = a2;
  v28 = a4;
  v27 = a1;
  v24 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t static PreviewArgumentsBuilder.buildOptional(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *a1;
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    type metadata accessor for PreviewArgumentsBuilder.Component.Item(0, a2, a3, a4);
    v7 = sub_21EA47094();
  }
  *a5 = v7;
  return swift_bridgeObjectRetain();
}

uint64_t static PreviewArgumentsBuilder.buildEither(first:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t static PreviewArgumentsBuilder.buildFinalResult(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v27 = a5;
  v7 = type metadata accessor for PreviewSection(255, a2, a3, a4);
  v26 = sub_21EA47160();
  v8 = *(_QWORD *)(v26 - 8);
  v9 = MEMORY[0x24BDAC7A8](v26);
  v11 = (char *)&v26 - v10;
  v12 = *(_QWORD *)(v7 - 8);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - v16;
  v18 = *a1;
  v33 = sub_21EA47094();
  v31 = v18;
  swift_bridgeObjectRetain();
  v30 = sub_21EA47094();
  v28 = a2;
  v29 = &v33;
  type metadata accessor for PreviewArgumentsBuilder.Component.Item(255, a2, v19, v20);
  v21 = sub_21EA470C4();
  sub_21EA470C4();
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12C8], v21);
  sub_21EA4704C();
  swift_bridgeObjectRelease();
  v22 = v33;
  swift_bridgeObjectRetain();
  sub_21EA4005C(0, 0, v22, a2, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v26);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v11, v7);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v7);
    sub_21EA470AC();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v7);
  }
  sub_21EA3FC4C(v32, a2, v23, v24, v27);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EA41120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int v33;
  char *v34;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;

  v43 = a2;
  v45 = (uint64_t *)a3;
  v41 = a1;
  v5 = type metadata accessor for PreviewSection(255, a4, a3, a4);
  v6 = sub_21EA47160();
  v38 = *(_QWORD *)(v6 - 8);
  v39 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v38 - v8;
  v42 = *(_QWORD *)(v5 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v38 - v15;
  v17 = *(_QWORD *)(a4 - 8);
  v18 = MEMORY[0x24BDAC7A8](v14);
  v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v38 - v21;
  v25 = type metadata accessor for PreviewArgumentsBuilder.Component.Item(0, a4, v23, v24);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v38 - v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))((char *)&v38 - v26, v43, v25);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v29 = v42;
    v30 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
    v30(v16, v27, v5);
    v31 = *v45;
    swift_bridgeObjectRetain();
    v32 = (uint64_t)v44;
    sub_21EA4005C(0, 0, v31, a4, (uint64_t)v44);
    v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v32, 1, v5);
    v34 = v40;
    if (v33 == 1)
    {
      (*(void (**)(char *, uint64_t))(v38 + 8))(v44, v39);
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v34, v16, v5);
    }
    else
    {
      v36 = v13;
      v30(v13, v44, v5);
      v37 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
      v37(v34, v36, v5);
      sub_21EA470C4();
      sub_21EA470AC();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v5);
      v37(v34, v16, v5);
    }
    sub_21EA470C4();
    sub_21EA470AC();
    sub_21EA470C4();
    sub_21EA470B8();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v27, a4);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, a4);
    sub_21EA470C4();
    sub_21EA470AC();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, a4);
  }
}

uint64_t static PreviewSectionArgumentsBuilder.buildExpression(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_21EA41614(a2, a2);
  v4 = *(_QWORD *)(a2 - 8);
  swift_allocObject();
  v5 = sub_21EA47088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  sub_21EA470C4();
  return v5;
}

uint64_t static PreviewSectionArgumentsBuilder.buildExpression<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_21EA470D0();
}

uint64_t static PreviewSectionArgumentsBuilder.buildArray(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_21EA470C4();
  v1 = sub_21EA470C4();
  v2 = MEMORY[0x24BEE12C8];
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12C8], v1);
  MEMORY[0x2207B44E0](v2, v0);
  return sub_21EA47064();
}

uint64_t sub_21EA415F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21EA41120(a1, a2, *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 16));
}

uint64_t type metadata accessor for PreviewArgumentsBuilder.Component.Item(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewArgumentsBuilder.Component.Item);
}

uint64_t sub_21EA41614(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (swift_isClassType())
    v3 = a2;
  else
    v3 = 0;
  if (v3)
    return __swift_instantiateConcreteTypeFromMangledName(&qword_255464780);
  else
    return sub_21EA47220();
}

uint64_t sub_21EA41660@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21EA4167C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21EA41684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  type metadata accessor for PreviewArguments.InhabitedSections(255, *(_QWORD *)(a1 + 16), a3, a4);
  result = sub_21EA47160();
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_21EA416FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  v9 = (v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8;
  if (v7 <= 7 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0 && ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 8 <= 0x18)
  {
    v13 = ((unint64_t)a2 + v7 + 16) & ~v7;
    if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
    {
      v14 = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      if ((_DWORD)v14 != -1)
        goto LABEL_12;
    }
    else if ((*(unsigned int (**)(unint64_t))(v6 + 48))(((unint64_t)a2 + v7 + 16) & ~v7))
    {
LABEL_12:
      memcpy(a1, a2, ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
      return a1;
    }
    v15 = a2[1];
    *a1 = *a2;
    a1[1] = v15;
    v16 = ((unint64_t)a1 + v7 + 16) & ~v7;
    v17 = *(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v17(v16, ((unint64_t)a2 + v7 + 16) & ~v7, v5);
    *(_QWORD *)((v8 + v16) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)a1 + v9 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v9 + 15) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  v12 = *a2;
  *a1 = *a2;
  a1 = (_QWORD *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
  swift_retain();
  return a1;
}

uint64_t sub_21EA41884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 16 + a1) & ~v4;
  if (*(_DWORD *)(v3 + 84) >= 0x7FFFFFFFu)
  {
    result = (*(uint64_t (**)(uint64_t))(v3 + 48))((v4 + 16 + a1) & ~v4);
    if ((_DWORD)result)
      return result;
LABEL_7:
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v7 = *(_QWORD *)((*(_QWORD *)(v3 + 64) + 7 + v5) & 0xFFFFFFFFFFFFF8);
  if (v7 >= 0xFFFFFFFF)
    LODWORD(v7) = -1;
  result = (v7 + 1);
  if ((_DWORD)v7 == -1)
    goto LABEL_7;
  return result;
}

_QWORD *sub_21EA41978(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  v9 = (v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)a2 + v7 + 16) & ~v7;
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    v12 = *(_QWORD *)((v8 + v10) & 0xFFFFFFFFFFFFF8);
    if (v12 >= 0xFFFFFFFF)
      LODWORD(v12) = -1;
    v11 = v9 + 15;
    if ((_DWORD)v12 != -1)
      goto LABEL_3;
LABEL_7:
    v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    v14 = ((unint64_t)a1 + v7 + 16) & ~v7;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v15(v14, v10, v5);
    *(_QWORD *)((v8 + v14) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v10) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)a1 + v9 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v11) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  v11 = v9 + 15;
  if (!(*(unsigned int (**)(unint64_t))(v6 + 48))(((unint64_t)a2 + v7 + 16) & ~v7))
    goto LABEL_7;
LABEL_3:
  memcpy(a1, a2, (v11 & 0xFFFFFFFFFFFFFFF8) + 8);
  return a1;
}

_QWORD *sub_21EA41ABC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)(void);
  int v16;
  int v17;
  void *v18;
  const void *v19;
  size_t v20;
  unint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;

  v3 = a2;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  v9 = ((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  v10 = *(unsigned int *)(v6 + 84);
  v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
  v12 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v13 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v26 = v12;
  if (v10 < 0x7FFFFFFF)
  {
    v21 = *(_QWORD *)((v8 + v12) & 0xFFFFFFFFFFFFF8);
    v22 = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
    if (v22 >= 0xFFFFFFFF)
      LODWORD(v22) = -1;
    v17 = v22 + 1;
    if (v21 < 0xFFFFFFFF)
      goto LABEL_3;
LABEL_8:
    if (!v17)
    {
      *a1 = *v3;
      a1[1] = v3[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(v26, v13, v5);
      *(_QWORD *)((v8 + v26) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(((unint64_t)a1 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v3 + v9) & 0xFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v26, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = a1;
    v19 = v3;
    v20 = v11;
    goto LABEL_10;
  }
  v14 = ((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  v15 = *(uint64_t (**)(void))(v6 + 48);
  v16 = v15();
  v17 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v15)(v13, v10, v5);
  v9 = v14;
  v3 = a2;
  if (!v16)
    goto LABEL_8;
LABEL_3:
  if (!v17)
  {
    *a1 = *v3;
    a1[1] = v3[1];
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v23(v26, v13, v5);
    *(_QWORD *)((v8 + v26) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)a1 + v9) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v3 + v9) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  v18 = a1;
  v19 = v3;
  v20 = v11;
LABEL_10:
  memcpy(v18, v19, v20);
  return a1;
}

_OWORD *sub_21EA41D24(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  v9 = (v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)a2 + v7 + 16) & ~v7;
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    v12 = *(_QWORD *)((v8 + v10) & 0xFFFFFFFFFFFFF8);
    if (v12 >= 0xFFFFFFFF)
      LODWORD(v12) = -1;
    v11 = v9 + 15;
    if ((_DWORD)v12 != -1)
      goto LABEL_3;
LABEL_7:
    *a1 = *a2;
    v13 = ((unint64_t)a1 + v7 + 16) & ~v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v13, v10, v5);
    *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v10) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)a1 + v9 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v11) & 0xFFFFFFFFFFFFF8);
    return a1;
  }
  v11 = v9 + 15;
  if (!(*(unsigned int (**)(unint64_t))(v6 + 48))(((unint64_t)a2 + v7 + 16) & ~v7))
    goto LABEL_7;
LABEL_3:
  memcpy(a1, a2, (v11 & 0xFFFFFFFFFFFFFFF8) + 8);
  return a1;
}

_QWORD *sub_21EA41E58(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v22;
  uint64_t v23;

  v3 = a2;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  v9 = ((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  v10 = *(unsigned int *)(v6 + 84);
  v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
  v12 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v23 = ((unint64_t)a2 + v7 + 16) & ~v7;
  if (v10 >= 0x7FFFFFFF)
  {
    v22 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    v13 = ((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    v15 = ((unint64_t)a2 + v7 + 16) & ~v7;
    v16 = v14(v12, v10, v5);
    v17 = v14(v15, v10, v5);
    v9 = v13;
    v3 = a2;
    v11 = v22;
    if (v16)
      goto LABEL_3;
LABEL_8:
    if (!v17)
    {
      v19 = v3[1];
      *a1 = *v3;
      a1[1] = v19;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40))(v12, v23, v5);
      *(_QWORD *)((v8 + v12) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v23) & 0xFFFFFFFFFFFFF8);
      swift_bridgeObjectRelease();
      *(_QWORD *)(((unint64_t)a1 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v3 + v9) & 0xFFFFFFFFFFFFF8);
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v12, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v18 = *(_QWORD *)((v8 + (((unint64_t)a2 + v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFF8);
  if (v18 >= 0xFFFFFFFF)
    LODWORD(v18) = -1;
  v17 = v18 + 1;
  if (*(_QWORD *)((v8 + v12) & 0xFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL)
    goto LABEL_8;
LABEL_3:
  if (v17)
  {
LABEL_10:
    memcpy(a1, v3, v11);
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)v3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v12, v23, v5);
  *(_QWORD *)((v8 + v12) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v23) & 0xFFFFFFFFFFFFF8);
  *(_QWORD *)(((unint64_t)a1 + v9) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v3 + v9) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21EA42078(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  unsigned int v14;
  unint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  if (v6 - 1 < a2)
  {
    v9 = a2 - v6 + 2;
    if (((((((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    __asm { BR              X16 }
  }
  v13 = (a1 + v7 + 16) & ~v7;
  if (v5 < 0x7FFFFFFF)
  {
    v15 = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
    if (v15 >= 0xFFFFFFFF)
      LODWORD(v15) = -1;
    v14 = v15 + 1;
  }
  else
  {
    v14 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v13);
  }
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void sub_21EA421C4(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = v6 - 1;
  v8 = *(unsigned __int8 *)(v5 + 80);
  if (v6 - 1 >= a3)
  {
    v11 = 0;
    if (v7 >= a2)
      goto LABEL_16;
  }
  else
  {
    v9 = a3 - v6 + 2;
    if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v8 + 16) & ~(_DWORD)v8)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (v7 >= a2)
LABEL_16:
      __asm { BR              X15 }
  }
  v12 = a2 - v6;
  if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v8 + 16) & ~(_DWORD)v8)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_21EA422DC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x21EA42388);
}

void sub_21EA422E4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x21EA422ECLL);
  JUMPOUT(0x21EA42388);
}

void sub_21EA4234C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x21EA42388);
}

void sub_21EA42354()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x21EA42388);
}

uint64_t sub_21EA4235C(uint64_t a1, int a2, unsigned int a3)
{
  int v3;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  size_t v10;

  *(_WORD *)((char *)v9 + v10) = 0;
  if (!a2)
LABEL_8:
    JUMPOUT(0x21EA42388);
  if (a2 + 1 > v6)
  {
    if ((_DWORD)v10)
    {
      v3 = a2 - v6;
      bzero(v9, v10);
      *v9 = v3;
    }
    goto LABEL_8;
  }
  if (a2 == -1)
    goto LABEL_8;
  if (a3 < 0x7FFFFFFF)
    JUMPOUT(0x21EA42368);
  return (*(uint64_t (**)(unint64_t, _QWORD))(v5 + 56))(((unint64_t)v9 + v7 + 16) & v8, (a2 + 1));
}

uint64_t type metadata accessor for PreviewArguments(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewArguments);
}

uint64_t type metadata accessor for PreviewArguments.InhabitedSections(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewArguments.InhabitedSections);
}

uint64_t sub_21EA423B8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21EA423C0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21EA42444(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    *(_QWORD *)((v7 + v12) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v7 + v13) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21EA4252C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21EA42594(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_21EA42628(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_21EA426D8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_21EA42758(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  *(_QWORD *)((*(_QWORD *)(v7 + 64) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v7 + 64) + 7 + v10) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21EA427F0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  if (v6 >= a2)
  {
    v13 = (a1 + v7 + 16) & ~v7;
    if (v5 < 0x7FFFFFFF)
    {
      v14 = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      return (v14 + 1);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))(v13);
    }
  }
  else
  {
    if (((((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_21EA4287C + 4 * byte_21EA47FDF[v11]))();
  }
}

void sub_21EA4290C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X14 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_21EA42A14()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x21EA42A8CLL);
}

void sub_21EA42A1C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x21EA42A24);
  JUMPOUT(0x21EA42A8CLL);
}

void sub_21EA42A68()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x21EA42A8CLL);
}

void sub_21EA42A70()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x21EA42A8CLL);
}

uint64_t sub_21EA42A78@<X0>(int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a1)
    JUMPOUT(0x21EA42A8CLL);
  if (a2 < 0x7FFFFFFF)
  {
    if ((a1 & 0x80000000) == 0)
      JUMPOUT(0x21EA42A88);
    JUMPOUT(0x21EA42A84);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))((v6 + v5 + 16) & a3);
}

uint64_t type metadata accessor for PreviewArgumentsBuilder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewArgumentsBuilder);
}

uint64_t type metadata accessor for PreviewSectionArgumentsBuilder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewSectionArgumentsBuilder);
}

uint64_t sub_21EA42ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for PreviewSection(319, *(_QWORD *)(a1 + 16), a3, a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21EA42B34(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  v9 = ((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  if (v7 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || (v9 & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    v14 = ((unint64_t)a1 + v7 + 16) & ~v7;
    v15 = ((unint64_t)a2 + v7 + 16) & ~v7;
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v16(v14, v15, v5);
    *(_QWORD *)((v8 + v14) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v15) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)a1 + v9) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v9) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21EA42C50(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 16
                                                                                            + a1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21EA42CE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(unint64_t, uint64_t, uint64_t);
  uint64_t v11;
  unint64_t v12;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a2 + v8 + 16) & ~v8;
  v10 = *(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 16);
  swift_bridgeObjectRetain();
  v10(((unint64_t)a1 + v8 + 16) & ~v8, v9, v6);
  v11 = *(_QWORD *)(v7 + 64) + 7;
  *(_QWORD *)((v11 + (((unint64_t)a1 + v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v11 + v9) & 0xFFFFFFFFFFFFF8);
  v12 = ((v11 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(_QWORD *)(((unint64_t)a1 + v12) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v12) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_21EA42DB8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + v7 + 16) & ~v7, ((unint64_t)a2 + v7 + 16) & ~v7);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  *(_QWORD *)((v8 + (((unint64_t)a1 + v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + (((unint64_t)a2 + v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = ((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(_QWORD *)(((unint64_t)a1 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v9) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_21EA42EB0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *a1 = *a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v7, v8);
  v9 = *(_QWORD *)(v5 + 64) + 7;
  *(_QWORD *)((v9 + v7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v9 + v8) & 0xFFFFFFFFFFFFF8);
  v10 = ((v9 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(_QWORD *)(((unint64_t)a1 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v10) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_21EA42F6C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + v8 + 16) & ~v8, ((unint64_t)a2 + v8 + 16) & ~v8);
  v9 = *(_QWORD *)(v7 + 64) + 7;
  *(_QWORD *)((v9 + (((unint64_t)a1 + v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v9 + (((unint64_t)a2 + v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  v10 = ((v9 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(_QWORD *)(((unint64_t)a1 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v10) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21EA43044(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  if (v6 >= a2)
  {
    v13 = (a1 + v7 + 16) & ~v7;
    if (v5 < 0x7FFFFFFF)
    {
      v14 = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      return (v14 + 1);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))(v13);
    }
  }
  else
  {
    if (((((((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_21EA430D8 + 4 * byte_21EA47FEE[v11]))();
  }
}

void sub_21EA43168(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X14 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_21EA43278()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x21EA432F0);
}

void sub_21EA43280(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x21EA43288);
  JUMPOUT(0x21EA432F0);
}

void sub_21EA432CC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x21EA432F0);
}

void sub_21EA432D4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x21EA432F0);
}

uint64_t sub_21EA432DC@<X0>(int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a1)
    JUMPOUT(0x21EA432F0);
  if (a2 < 0x7FFFFFFF)
  {
    if ((a1 & 0x80000000) == 0)
      JUMPOUT(0x21EA432ECLL);
    JUMPOUT(0x21EA432E8);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))((v6 + v5 + 16) & a3);
}

uint64_t sub_21EA43308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v0 = swift_checkMetadataState();
  v3 = v0;
  if (v4 <= 0x3F)
  {
    v3 = type metadata accessor for PreviewSection(319, v0, v1, v2);
    if (v5 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return v3;
}

uint64_t *sub_21EA4339C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  v8 = v7;
  v9 = v6 + 7;
  if (((v6 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v6)
    v10 = *(_QWORD *)(v5 + 64);
  else
    v10 = ((v6 + 7 + ((v7 + 16) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8)
        + 8;
  v11 = v7 & 0x100000;
  if (v8 > 7 || v11 != 0 || v10 + 1 > 0x18)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    v15 = *((unsigned __int8 *)a2 + v10);
    if (v15 >= 2)
    {
      if (v10 <= 3)
        v16 = v10;
      else
        v16 = 4;
      __asm { BR              X14 }
    }
    if (v15 == 1)
    {
      v17 = a2[1];
      *v3 = *a2;
      v3[1] = v17;
      v18 = ((unint64_t)v3 + v8 + 16) & ~v8;
      v19 = ((unint64_t)a2 + v8 + 16) & ~v8;
      v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
      swift_bridgeObjectRetain();
      v20(v18, v19, v4);
      *(_QWORD *)((v9 + v18) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v9 + v19) & 0xFFFFFFFFFFFFF8);
      *((_BYTE *)v3 + v10) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(uint64_t *))(v5 + 16))(a1);
      *((_BYTE *)v3 + v10) = 0;
    }
  }
  return v3;
}

uint64_t sub_21EA43530(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  if (((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > v5)
    v5 = ((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8;
  v7 = *(unsigned __int8 *)(a1 + v5);
  if (v7 >= 2)
  {
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v7 != 1)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 8))(a1, *(_QWORD *)(a2 + 16));
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))((a1 + v6 + 16) & ~v6, v3);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21EA43658(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  char v16;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(unsigned __int8 *)(v5 + 80);
  v8 = v6 + 7;
  if (((v6 + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v6)
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = ((v6 + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8;
  v10 = *((unsigned __int8 *)a2 + v9);
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v11 = v9;
    else
      v11 = 4;
    __asm { BR              X14 }
  }
  if (v10 == 1)
  {
    v12 = a2[1];
    *a1 = *a2;
    a1[1] = v12;
    v13 = ((unint64_t)a1 + v7 + 16) & ~v7;
    v14 = ((unint64_t)a2 + v7 + 16) & ~v7;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v15(v13, v14, v4);
    *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + v14) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    v16 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *))(v5 + 16))(a1);
    v16 = 0;
  }
  *((_BYTE *)a1 + v9) = v16;
  return a1;
}

_QWORD *sub_21EA437B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, uint64_t, uint64_t);

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + 7;
    if (((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v7)
      v10 = *(_QWORD *)(v6 + 64);
    else
      v10 = ((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
    v11 = *((unsigned __int8 *)a1 + v10);
    if (v11 >= 2)
    {
      if (v10 <= 3)
        v12 = v10;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    v13 = ~v8;
    if (v11 == 1)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))(((unint64_t)a1 + v8 + 16) & v13, v5);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    v14 = *((unsigned __int8 *)a2 + v10);
    if (v14 >= 2)
    {
      if (v10 <= 3)
        v15 = v10;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    if (v14 == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      v16 = ((unint64_t)a2 + v8 + 16) & v13;
      v17 = *(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_bridgeObjectRetain();
      v17(((unint64_t)a1 + v8 + 16) & v13, v16, v5);
      *(_QWORD *)((v9 + (((unint64_t)a1 + v8 + 16) & v13)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v9 + v16) & 0xFFFFFFFFFFFFF8);
      *((_BYTE *)a1 + v10) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v10) = 0;
    }
  }
  return a1;
}

_OWORD *sub_21EA439E8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + 7;
  if (((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v5)
    v8 = *(_QWORD *)(v4 + 64);
  else
    v8 = ((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8;
  v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X14 }
  }
  if (v9 == 1)
  {
    *a1 = *a2;
    v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v11, v12);
    *(_QWORD *)((v7 + v11) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v7 + v12) & 0xFFFFFFFFFFFFF8);
    v13 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    v13 = 0;
  }
  *((_BYTE *)a1 + v8) = v13;
  return a1;
}

_OWORD *sub_21EA43B28(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + 7;
    if (((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v7)
      v10 = *(_QWORD *)(v6 + 64);
    else
      v10 = ((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
    v11 = *((unsigned __int8 *)a1 + v10);
    if (v11 >= 2)
    {
      if (v10 <= 3)
        v12 = v10;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    v13 = ~v8;
    if (v11 == 1)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))(((unint64_t)a1 + v8 + 16) & v13, v5);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(_OWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    v14 = *((unsigned __int8 *)a2 + v10);
    if (v14 >= 2)
    {
      if (v10 <= 3)
        v15 = v10;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    if (v14 == 1)
    {
      *a1 = *a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32))(((unint64_t)a1 + v8 + 16) & v13, ((unint64_t)a2 + v8 + 16) & v13, v5);
      *(_QWORD *)((v9 + (((unint64_t)a1 + v8 + 16) & v13)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v9 + (((unint64_t)a2 + v8 + 16) & v13)) & 0xFFFFFFFFFFFFF8);
      v16 = 1;
    }
    else
    {
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v16 = 0;
    }
    *((_BYTE *)a1 + v10) = v16;
  }
  return a1;
}

uint64_t sub_21EA43D50(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  int v8;
  unsigned int v10;
  int v11;
  unsigned int v12;

  v3 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = ((v4 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v5 > v4)
    v4 = v5;
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v6 = v4 + 1;
  v7 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    v10 = ((a2 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = *(_DWORD *)(a1 + v6);
      if (!v8)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v10 > 0xFF)
    {
      v8 = *(unsigned __int16 *)(a1 + v6);
      if (!*(_WORD *)(a1 + v6))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v10 < 2)
    {
LABEL_21:
      v12 = *(unsigned __int8 *)(a1 + v4);
      if (v12 >= 2)
        return (v12 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v8 = *(unsigned __int8 *)(a1 + v6);
  if (!*(_BYTE *)(a1 + v6))
    goto LABEL_21;
LABEL_14:
  v11 = (v8 - 1) << v7;
  if (v6 > 3)
    v11 = 0;
  if (!(_DWORD)v6)
    return (v11 + 255);
  if (v6 > 3)
    LODWORD(v6) = 4;
  return ((uint64_t (*)(void))((char *)&loc_21EA43E2C + 4 * byte_21EA48025[(v6 - 1)]))();
}

void sub_21EA43E78(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = ((v6 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v7 <= v6)
    v7 = v6;
  v8 = v7 + 1;
  if (a3 < 0xFF)
  {
    v9 = 0;
  }
  else if (v8 <= 3)
  {
    v11 = ((a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      v9 = 4u;
    }
    else if (v11 >= 0x100)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 > 1;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v10 = a2 - 255;
  if (v8 < 4)
  {
    if ((_DWORD)v7 != -1)
    {
      v12 = v10 & ~(-1 << (8 * v8));
      bzero(a1, v8);
      if ((_DWORD)v8 == 3)
      {
        *a1 = v12;
        *((_BYTE *)a1 + 2) = BYTE2(v12);
      }
      else if ((_DWORD)v8 == 2)
      {
        *a1 = v12;
      }
      else
      {
        *(_BYTE *)a1 = v12;
      }
    }
  }
  else
  {
    bzero(a1, v7 + 1);
    *(_DWORD *)a1 = v10;
  }
  __asm { BR              X10 }
}

uint64_t sub_21EA44038(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = ((v3 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v4 > v3)
    v3 = v4;
  if (*(unsigned __int8 *)(a1 + v3) < 2u)
    return *(unsigned __int8 *)(a1 + v3);
  if (v3 <= 3)
    v5 = v3;
  else
    v5 = 4;
  return ((uint64_t (*)(void))((char *)&loc_21EA44098 + 4 * byte_21EA48033[v5]))();
}

void sub_21EA440E0(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  unint64_t v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (a2 > 1)
  {
    v8 = *(_QWORD *)(v4 + 64);
    v9 = ((v8 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    if (v9 <= v8)
      v10 = v8;
    else
      v10 = v9;
    v11 = a2 - 2;
    if (v10 < 4)
    {
      v12 = v11 >> (8 * v10);
      v13 = v11 & ~(-1 << (8 * v10));
      a1[v10] = v12 + 2;
      bzero(a1, v10);
      if ((_DWORD)v10 == 3)
      {
        *(_WORD *)a1 = v13;
        a1[2] = BYTE2(v13);
      }
      else if ((_DWORD)v10 == 2)
      {
        *(_WORD *)a1 = v13;
      }
      else
      {
        *a1 = v13;
      }
    }
    else
    {
      a1[v10] = 2;
      bzero(a1, v10);
      *(_DWORD *)a1 = v11;
    }
  }
  else
  {
    v5 = *(unsigned __int8 *)(v4 + 80);
    v6 = *(_QWORD *)(v4 + 64);
    v7 = ((v6 + ((v5 + 16) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    if (v7 > v6)
      v6 = v7;
    a1[v6] = a2;
  }
}

uint64_t sub_21EA441E8()
{
  return sub_21EA405F8();
}

uint64_t PreviewTrait.init(_:)@<X0>(__int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(qword_2554647A8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21EA47CE0;
  result = sub_21EA3DE60(a1, v4 + 32);
  *a2 = v4;
  return result;
}

uint64_t PreviewTrait.init(_:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_getKeyPath();
  type metadata accessor for PreviewTrait(255, a1, v4, v5);
  v6 = sub_21EA470C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554648B0);
  MEMORY[0x2207B44E0](MEMORY[0x24BEE12C8], v6);
  sub_21EA3E744();
  v7 = sub_21EA47064();
  swift_bridgeObjectRelease();
  result = swift_release();
  *a2 = v7;
  return result;
}

uint64_t type metadata accessor for PreviewTrait(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PreviewTrait);
}

__n128 PreviewLayoutTrait.value.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = v1[1].n128_u64[0];
  v3 = v1[1].n128_u8[8];
  result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

void static PreviewLayoutTrait.defaultValue.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 2;
}

__n128 static PreviewLayoutTrait.combine(_:_:)@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u8[8];
  result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = v2;
  a2[1].n128_u8[8] = v3;
  return result;
}

__n128 sub_21EA443A4@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = v1[1].n128_u64[0];
  v3 = v1[1].n128_u8[8];
  result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

void sub_21EA443C0(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 2;
}

__n128 sub_21EA443D4@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u8[8];
  result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = v2;
  a2[1].n128_u8[8] = v3;
  return result;
}

void PreviewInterfaceOrientationTrait.value.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void static PreviewInterfaceOrientationTrait.defaultValue.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static PreviewInterfaceOrientationTrait.combine(_:_:)(_BYTE *a1@<X1>, _BYTE *a2@<X8>)
{
  *a2 = *a1;
}

void sub_21EA44410(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void sub_21EA4441C(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_21EA44424(_BYTE *a1@<X1>, _BYTE *a2@<X8>)
{
  *a2 = *a1;
}

uint64_t dispatch thunk of PreviewTraitProtocol.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static PreviewTraitProtocol.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static PreviewTraitProtocol.combine(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewLayout(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewLayoutTrait()
{
  return &type metadata for PreviewLayoutTrait;
}

uint64_t getEnumTagSinglePayload for PreviewInterfaceOrientation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewInterfaceOrientationTrait(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EA445D8 + 4 * byte_21EA481B5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21EA4460C + 4 * byte_21EA481B0[v4]))();
}

uint64_t sub_21EA4460C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA44614(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EA4461CLL);
  return result;
}

uint64_t sub_21EA44628(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EA44630);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21EA44634(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA4463C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewInterfaceOrientationTrait()
{
  return &type metadata for PreviewInterfaceOrientationTrait;
}

uint64_t sub_21EA44658()
{
  return 1;
}

uint64_t PreviewSource.supportsOnDevicePreviews.getter()
{
  return 1;
}

uint64_t PreviewSource.supportsInteractivePreviews.getter()
{
  return 1;
}

void DefaultPreviewSource.contentDomain.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *DefaultPreviewSource.contentDomain.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*DefaultPreviewSource.contentDomain.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.contentCategory.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *a1 = *(_QWORD *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t DefaultPreviewSource.contentCategory.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t (*DefaultPreviewSource.contentCategory.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.supportsOnDevicePreviews.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t DefaultPreviewSource.supportsOnDevicePreviews.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*DefaultPreviewSource.supportsOnDevicePreviews.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.supportsInteractivePreviews.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t DefaultPreviewSource.supportsInteractivePreviews.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

uint64_t (*DefaultPreviewSource.supportsInteractivePreviews.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.structure.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  v6 = *(_QWORD *)(v1 + 64);
  v7 = *(_QWORD *)(v1 + 72);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_BYTE *)(v1 + 80);
  *(_BYTE *)(a1 + 48) = v8;
  return sub_21EA44748(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_21EA44748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  if (a7)
  {
    if (a7 != 1)
      return result;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return swift_retain();
}

__n128 DefaultPreviewSource.structure.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  __n128 result;
  __n128 v6;
  __int128 v7;

  v6 = (__n128)a1[1];
  v7 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 5);
  v4 = *((_BYTE *)a1 + 48);
  sub_21EA44804(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_BYTE *)(v1 + 80));
  result = v6;
  *(_OWORD *)(v1 + 32) = v7;
  *(__n128 *)(v1 + 48) = v6;
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v3;
  *(_BYTE *)(v1 + 80) = v4;
  return result;
}

uint64_t sub_21EA44804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  if (a7 == 1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else if (!a7)
  {
    return swift_release();
  }
  return result;
}

uint64_t (*DefaultPreviewSource.structure.modify())()
{
  return nullsub_1;
}

double DefaultPreviewSource.init(contentDomain:contentCategory:supportsOnDevicePreviews:supportsInteractivePreviews:body:)@<D0>(_BYTE *a1@<X0>, uint64_t *a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  double result;

  v7 = *a2;
  v8 = a2[1];
  *(_BYTE *)a7 = *a1;
  *(_QWORD *)(a7 + 8) = v7;
  *(_QWORD *)(a7 + 16) = v8;
  *(_BYTE *)(a7 + 24) = a3;
  *(_BYTE *)(a7 + 25) = a4;
  *(_QWORD *)(a7 + 32) = a5;
  *(_QWORD *)(a7 + 40) = a6;
  result = 0.0;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_BYTE *)(a7 + 80) = 0;
  return result;
}

uint64_t DefaultPreviewSource.init<A>(contentDomain:contentCategory:supportsOnDevicePreviews:supportsInteractivePreviews:arguments:body:)@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 **a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unsigned __int8 *v24;
  unint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  unint64_t v31;
  unint64_t v32;
  uint64_t (*v33)(uint64_t, _QWORD *, uint64_t, uint64_t);
  uint64_t v34;
  __n128 v35;
  char v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  __n128 v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 *v58;
  __n128 v59;
  unint64_t v60;
  unint64_t v61;
  unsigned __int8 v62;
  unsigned __int8 v63;

  v51 = a8;
  v52 = a6;
  v57 = a7;
  v58 = a1;
  v54.n128_u32[0] = a4;
  LODWORD(v53) = a3;
  v56 = a10;
  v13 = type metadata accessor for PreviewArguments.InhabitedSections(255, a10, a3, a4);
  v14 = sub_21EA47160();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v50 - v17;
  v19 = *(_QWORD *)(v13 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  v21 = MEMORY[0x24BDAC7A8](v16);
  v50 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v50 - v22;
  v55 = *v58;
  v24 = *a2;
  v25 = (unint64_t)a2[1];
  v58 = v24;
  v63 = v53;
  v62 = v54.n128_u8[0];
  v26 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  v54.n128_u64[0] = a5;
  v26(v18, a5, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v13) == 1)
  {
    swift_release();
    v29 = type metadata accessor for PreviewArguments(0, v56, v27, v28);
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(v54.n128_u64[0], v29);
    result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0uLL;
    v36 = 2;
  }
  else
  {
    v37 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    v37(v23, v18, v13);
    sub_21EA44B44(v13, v38, v39, &v59);
    v53 = v25;
    v40 = v56;
    v43 = type metadata accessor for PreviewArguments(0, v56, v41, v42);
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 8))(v54.n128_u64[0], v43);
    v54 = v59;
    v31 = v60;
    v32 = v61;
    v44 = v50;
    v37(v50, v23, v13);
    v45 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = v51;
    *(_QWORD *)(v34 + 24) = v40;
    v25 = v53;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v37)(v34 + v45, v44, v13);
    v35 = v54;
    v46 = (_QWORD *)(v34 + ((v20 + v45 + 7) & 0xFFFFFFFFFFFFFFF8));
    v47 = v57;
    *v46 = v52;
    v46[1] = v47;
    v36 = 1;
    v33 = sub_21EA44DF8;
  }
  v48 = v63;
  v49 = v62;
  a9->n128_u8[0] = v55;
  a9->n128_u64[1] = (unint64_t)v58;
  a9[1].n128_u64[0] = v25;
  a9[1].n128_u8[8] = v48;
  a9[1].n128_u8[9] = v49;
  a9[2] = v35;
  a9[3].n128_u64[0] = v31;
  a9[3].n128_u64[1] = v32;
  a9[4].n128_u64[0] = (unint64_t)v33;
  a9[4].n128_u64[1] = v34;
  a9[5].n128_u8[0] = v36;
  return result;
}

__n128 sub_21EA44B44@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, __n128 *a4@<X8>)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 result;
  __n128 v13;
  __n128 v14;
  unint64_t v15;

  v5 = type metadata accessor for PreviewSection(0, *(_QWORD *)(a1 + 16), a2, a3);
  sub_21EA45258(v5, &v14);
  v13 = v14;
  v6 = v15;
  KeyPath = swift_getKeyPath();
  v8 = sub_21EA470C4();
  swift_bridgeObjectRetain();
  v9 = MEMORY[0x2207B44E0](MEMORY[0x24BEE12E0], v8);
  v11 = sub_21EA4530C((void (*)(char *, char *))sub_21EA46D24, KeyPath, v8, (uint64_t)&type metadata for PreviewGroupMetadata.Section, MEMORY[0x24BEE4078], v9, MEMORY[0x24BEE40A8], v10);
  swift_release();
  swift_bridgeObjectRelease();
  result = v13;
  *a4 = v13;
  a4[1].n128_u64[0] = v6;
  a4[1].n128_u64[1] = v11;
  return result;
}

uint64_t sub_21EA44C4C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  __int128 v21;
  char v22;
  _QWORD v23[2];

  v11 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v12) = *(_BYTE *)(v14 + 16);
  v21 = *(_OWORD *)v14;
  v22 = v12;
  v17 = type metadata accessor for PreviewArguments.InhabitedSections(0, v16, v14, v15);
  sub_21EA44E7C((uint64_t)v13, v23, (uint64_t)&v21, v17);
  v18 = v23[0];
  v19 = v23[1];
  a5(v13);
  result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a8);
  *a2 = v18;
  a2[1] = v19;
  return result;
}

uint64_t sub_21EA44D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 24);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PreviewArguments.InhabitedSections(0, v5, a3, a4)
                                      - 8)
                          + 80);
  v7 = v4 + ((v6 + 32) & ~v6);
  swift_bridgeObjectRelease();
  v10 = type metadata accessor for PreviewSection(0, v5, v8, v9);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v7 + *(int *)(v10 + 28), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EA44DF8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v8 = *(_QWORD *)(v4 + 16);
  v9 = *(_QWORD *)(v4 + 24);
  v10 = *(_QWORD *)(type metadata accessor for PreviewArguments.InhabitedSections(0, v9, a3, a4) - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = v4 + ((*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_21EA44C4C(a1, a2, a3, v4 + v11, *(void (**)(char *))v12, *(_QWORD *)(v12 + 8), v8, v9);
}

uint64_t sub_21EA44E7C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t result;
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

  v33 = a4;
  v8 = *(_QWORD *)(a4 + 16);
  v9 = sub_21EA47160();
  v30 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v32 = (uint64_t)&v27 - v10;
  v13 = type metadata accessor for PreviewSection(255, v8, v11, v12);
  v14 = sub_21EA47160();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v27 - v17;
  v34 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v22 = (char *)&v27 - v21;
  if ((*(_BYTE *)(a3 + 16) & 1) != 0)
    goto LABEL_4;
  v29 = a1;
  v23 = *(_QWORD *)(a3 + 8);
  v28 = *(_QWORD *)a3;
  sub_21EA3FB20(v28, v33, v19, v20, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v18, 1, v13) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    a1 = v29;
LABEL_4:
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, v4 + *(int *)(v13 + 28), v8);
    *a2 = 0;
    a2[1] = 0;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v22, v18, v13);
  v25 = v32;
  sub_21EA402DC(v23, v13, v32);
  v26 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v25, 1, v8) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v25, v31);
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v29, &v22[*(int *)(v13 + 28)], v8);
    result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v22, v13);
    *a2 = v28;
    a2[1] = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v22, v13);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v29, v25, v8);
    *a2 = v28;
    a2[1] = v23;
  }
  return result;
}

BOOL static PreviewSourceContentDomain.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PreviewSourceContentDomain.hash(into:)()
{
  return sub_21EA47280();
}

uint64_t PreviewSourceContentDomain.hashValue.getter()
{
  sub_21EA47274();
  sub_21EA47280();
  return sub_21EA47298();
}

BOOL sub_21EA45158(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21EA4516C()
{
  sub_21EA47274();
  sub_21EA47280();
  return sub_21EA47298();
}

uint64_t sub_21EA451B0()
{
  return sub_21EA47280();
}

uint64_t sub_21EA451D8()
{
  sub_21EA47274();
  sub_21EA47280();
  return sub_21EA47298();
}

uint64_t PreviewSourceContentCategory.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

DeveloperToolsSupport::PreviewSourceContentCategory __swiftcall PreviewSourceContentCategory.init(stringLiteral:)(DeveloperToolsSupport::PreviewSourceContentCategory stringLiteral)
{
  DeveloperToolsSupport::PreviewSourceContentCategory *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

_QWORD *sub_21EA4524C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_21EA45258@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v5 = *v2;
  v4 = v2[1];
  v6 = *(uint64_t *)((char *)v2 + *(int *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  result = MEMORY[0x2207B3F34](v6, v7);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = result + 1;
  }
  return result;
}

double sub_21EA452BC@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  double result;
  __int128 v8;
  uint64_t v9;

  v5 = type metadata accessor for PreviewSection(0, *(_QWORD *)(a2 + a1 - 8), a2, a3);
  sub_21EA45258(v5, &v8);
  v6 = v9;
  result = *(double *)&v8;
  *(_OWORD *)a4 = v8;
  *(_QWORD *)(a4 + 16) = v6;
  return result;
}

uint64_t sub_21EA4530C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  void (*v24)(char *, _QWORD);
  void (*v25)(char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];
  uint64_t v44;

  v30 = a5;
  v31 = a8;
  v38 = a1;
  v39 = a2;
  v29 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v29 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v17 - 8);
  v33 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - v18;
  v20 = sub_21EA470F4();
  if (!v20)
    return sub_21EA47094();
  v36 = AssociatedTypeWitness;
  v21 = v20;
  v44 = sub_21EA471B4();
  v34 = sub_21EA471C0();
  sub_21EA4719C();
  v37 = v8;
  result = sub_21EA470E8();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21;
    v35 = v16;
    while (v23)
    {
      v41 = v23;
      v24 = (void (*)(char *, _QWORD))sub_21EA47124();
      v25 = *(void (**)(char *))(v11 + 16);
      v26 = v11;
      v27 = v36;
      v25(v14);
      v24(v43, 0);
      v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }
      v42 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      sub_21EA471A8();
      result = sub_21EA47100();
      v23 = v41 - 1;
      v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

DeveloperToolsSupport::PreviewGroupMetadata __swiftcall PreviewGroupMetadata.init(firstSection:moreSections:)(DeveloperToolsSupport::PreviewGroupMetadata::Section firstSection, Swift::OpaquePointer moreSections)
{
  uint64_t v2;
  uint64_t v3;
  DeveloperToolsSupport::PreviewGroupMetadata result;

  v3 = *(_QWORD *)(firstSection.title.value._countAndFlagsBits + 16);
  *(_OWORD *)v2 = *(_OWORD *)firstSection.title.value._countAndFlagsBits;
  *(_QWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 24) = firstSection.title.value._object;
  result.firstSection = firstSection;
  result.moreSections = moreSections;
  return result;
}

DeveloperToolsSupport::PreviewGroupIndex __swiftcall PreviewGroupIndex.init(section:preview:)(Swift::Int section, Swift::Int preview)
{
  Swift::Int *v2;
  DeveloperToolsSupport::PreviewGroupIndex result;

  *v2 = section;
  v2[1] = preview;
  result.preview = preview;
  result.section = section;
  return result;
}

DeveloperToolsSupport::PreviewGroupMetadata::Section __swiftcall PreviewGroupMetadata.Section.init(title:previewCount:)(Swift::String_optional title, Swift::Int previewCount)
{
  Swift::String_optional *v2;
  DeveloperToolsSupport::PreviewGroupMetadata::Section result;

  *v2 = title;
  v2[1].value._countAndFlagsBits = previewCount;
  result.title = title;
  result.previewCount = previewCount;
  return result;
}

uint64_t PreviewGroupMetadata.Section.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewGroupMetadata.Section.title.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PreviewGroupMetadata.Section.title.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.Section.previewCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t PreviewGroupMetadata.Section.previewCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*PreviewGroupMetadata.Section.previewCount.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.Section.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
  {
    sub_21EA4728C();
    swift_bridgeObjectRetain();
    sub_21EA47010();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21EA4728C();
  }
  return sub_21EA47280();
}

uint64_t PreviewGroupMetadata.Section.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_21EA47274();
  sub_21EA4728C();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21EA47010();
    swift_bridgeObjectRelease();
  }
  sub_21EA47280();
  return sub_21EA47298();
}

uint64_t sub_21EA457B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_21EA47274();
  sub_21EA4728C();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21EA47010();
    swift_bridgeObjectRelease();
  }
  sub_21EA47280();
  return sub_21EA47298();
}

uint64_t sub_21EA45840()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
  {
    sub_21EA4728C();
    swift_bridgeObjectRetain();
    sub_21EA47010();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21EA4728C();
  }
  return sub_21EA47280();
}

uint64_t sub_21EA458B0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_21EA47274();
  sub_21EA4728C();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21EA47010();
    swift_bridgeObjectRelease();
  }
  sub_21EA47280();
  return sub_21EA47298();
}

uint64_t PreviewGroupMetadata.firstSection.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  return swift_bridgeObjectRetain();
}

__n128 PreviewGroupMetadata.firstSection.setter(__n128 *a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;
  __n128 v4;

  v4 = *a1;
  v2 = a1[1].n128_u64[0];
  swift_bridgeObjectRelease();
  result = v4;
  *v1 = v4;
  v1[1].n128_u64[0] = v2;
  return result;
}

uint64_t (*PreviewGroupMetadata.firstSection.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.moreSections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewGroupMetadata.moreSections.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*PreviewGroupMetadata.moreSections.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 24);
  if (*(_QWORD *)(v1 + 8))
  {
    sub_21EA4728C();
    swift_bridgeObjectRetain();
    sub_21EA47010();
  }
  else
  {
    sub_21EA4728C();
  }
  sub_21EA47280();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21EA45F2C(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EA45A84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (uint64_t *)(a2 + 48);
    v4 = (uint64_t *)(a1 + 48);
    do
    {
      v6 = *(v4 - 1);
      v7 = *v4;
      v8 = *(v3 - 1);
      v9 = *v3;
      if (v6)
      {
        if (!v8)
          return 0;
        if (*(v4 - 2) == *(v3 - 2) && v6 == v8)
        {
          if (v7 != v9)
            return 0;
        }
        else
        {
          v11 = sub_21EA4722C();
          result = 0;
          if ((v11 & 1) == 0 || v7 != v9)
            return result;
        }
      }
      else
      {
        if (v8)
          v5 = 0;
        else
          v5 = v7 == v9;
        if (!v5)
          return 0;
      }
      v3 += 3;
      v4 += 3;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t PreviewGroupMetadata.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  sub_21EA47274();
  sub_21EA4728C();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21EA47010();
  }
  sub_21EA47280();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21EA45F2C((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return sub_21EA47298();
}

uint64_t sub_21EA45BFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 24);
  if (*(_QWORD *)(v1 + 8))
  {
    sub_21EA4728C();
    swift_bridgeObjectRetain();
    sub_21EA47010();
  }
  else
  {
    sub_21EA4728C();
  }
  sub_21EA47280();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21EA45F2C(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EA45C98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  sub_21EA47274();
  sub_21EA4728C();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21EA47010();
  }
  sub_21EA47280();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21EA45F2C((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return sub_21EA47298();
}

uint64_t PreviewGroupIndex.section.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PreviewGroupIndex.section.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*PreviewGroupIndex.section.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupIndex.preview.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t PreviewGroupIndex.preview.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*PreviewGroupIndex.preview.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupIndex.hash(into:)()
{
  sub_21EA47280();
  return sub_21EA47280();
}

BOOL static PreviewGroupIndex.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t PreviewGroupIndex.hashValue.getter()
{
  sub_21EA47274();
  sub_21EA47280();
  sub_21EA47280();
  return sub_21EA47298();
}

uint64_t sub_21EA45E30()
{
  sub_21EA47274();
  sub_21EA47280();
  sub_21EA47280();
  return sub_21EA47298();
}

uint64_t sub_21EA45E88()
{
  sub_21EA47280();
  return sub_21EA47280();
}

uint64_t sub_21EA45EC0()
{
  sub_21EA47274();
  sub_21EA47280();
  sub_21EA47280();
  return sub_21EA47298();
}

BOOL sub_21EA45F14(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_21EA45F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_21EA47280();
  if (v3)
  {
    v5 = a2 + 48;
    do
    {
      if (*(_QWORD *)(v5 - 8))
      {
        sub_21EA4728C();
        swift_bridgeObjectRetain();
        sub_21EA47010();
      }
      else
      {
        sub_21EA4728C();
      }
      v5 += 24;
      sub_21EA47280();
      result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL _s21DeveloperToolsSupport20PreviewGroupMetadataV7SectionV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  _BOOL8 result;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a2[1];
  v6 = a2[2];
  if (!v3)
  {
    if (!v5)
      return v4 == v6;
    return 0;
  }
  if (!v5)
    return 0;
  if (*a1 == *a2 && v3 == v5)
    return v4 == v6;
  v8 = sub_21EA4722C();
  result = 0;
  if ((v8 & 1) != 0)
    return v4 == v6;
  return result;
}

uint64_t _s21DeveloperToolsSupport20PreviewGroupMetadataV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v11;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  if (v3)
  {
    if (v6)
    {
      v9 = *a1 == *a2 && v3 == v6;
      if ((v9 || (sub_21EA4722C() & 1) != 0) && v4 == v7)
        return sub_21EA45A84(v5, v8);
    }
  }
  else
  {
    if (v6)
      v11 = 0;
    else
      v11 = v4 == v7;
    if (v11)
      return sub_21EA45A84(v5, v8);
  }
  return 0;
}

unint64_t sub_21EA460C4()
{
  unint64_t result;

  result = qword_255464CE8;
  if (!qword_255464CE8)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for PreviewSourceContentDomain, &type metadata for PreviewSourceContentDomain);
    atomic_store(result, (unint64_t *)&qword_255464CE8);
  }
  return result;
}

unint64_t sub_21EA4610C()
{
  unint64_t result;

  result = qword_255464CF0;
  if (!qword_255464CF0)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for PreviewSourceContentCategory, &type metadata for PreviewSourceContentCategory);
    atomic_store(result, (unint64_t *)&qword_255464CF0);
  }
  return result;
}

uint64_t sub_21EA46150()
{
  return MEMORY[0x24BEE0D80];
}

unint64_t sub_21EA46160()
{
  unint64_t result;

  result = qword_255464CF8;
  if (!qword_255464CF8)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for PreviewSourceContentCategory, &type metadata for PreviewSourceContentCategory);
    atomic_store(result, (unint64_t *)&qword_255464CF8);
  }
  return result;
}

uint64_t sub_21EA461A4()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_21EA461B0()
{
  return MEMORY[0x24BEE0D88];
}

unint64_t sub_21EA461C0()
{
  unint64_t result;

  result = qword_255464D00;
  if (!qword_255464D00)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for PreviewGroupMetadata.Section, &type metadata for PreviewGroupMetadata.Section);
    atomic_store(result, (unint64_t *)&qword_255464D00);
  }
  return result;
}

unint64_t sub_21EA46208()
{
  unint64_t result;

  result = qword_255464D08;
  if (!qword_255464D08)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for PreviewGroupMetadata, &type metadata for PreviewGroupMetadata);
    atomic_store(result, (unint64_t *)&qword_255464D08);
  }
  return result;
}

unint64_t sub_21EA46250()
{
  unint64_t result;

  result = qword_255464D10[0];
  if (!qword_255464D10[0])
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for PreviewGroupIndex, &type metadata for PreviewGroupIndex);
    atomic_store(result, qword_255464D10);
  }
  return result;
}

uint64_t dispatch thunk of PreviewSource.contentDomain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PreviewSource.contentCategory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PreviewSource.supportsOnDevicePreviews.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PreviewSource.supportsInteractivePreviews.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_21EA462B4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21EA462BC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_21EA44804(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t sub_21EA462F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 56);
  v8 = *(_QWORD *)(a2 + 64);
  v9 = *(_QWORD *)(a2 + 72);
  v10 = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRetain();
  sub_21EA44748(v4, v5, v6, v7, v8, v9, v10);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v9;
  *(_BYTE *)(a1 + 80) = v10;
  return a1;
}

uint64_t sub_21EA46384(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  char v16;

  v2 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(v2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(v2 + 25);
  v4 = *(_QWORD *)(v2 + 32);
  v5 = *(_QWORD *)(v2 + 40);
  v6 = *(_QWORD *)(v2 + 48);
  v7 = *(_QWORD *)(v2 + 56);
  v8 = *(_QWORD *)(v2 + 64);
  v9 = *(_QWORD *)(v2 + 72);
  LOBYTE(v2) = *(_BYTE *)(v2 + 80);
  sub_21EA44748(v4, v5, v6, v7, v8, v9, v2);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v9;
  v16 = *(_BYTE *)(a1 + 80);
  *(_BYTE *)(a1 + 80) = v2;
  sub_21EA44804(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_21EA46470(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  char v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v5 = *(_BYTE *)(a2 + 80);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v12;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v13 = *(_BYTE *)(a1 + 80);
  *(_BYTE *)(a1 + 80) = v5;
  sub_21EA44804(v6, v7, v8, v9, v10, v11, v13);
  return a1;
}

uint64_t sub_21EA464E8(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 81))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_21EA46530(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 81) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for DefaultPreviewSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DefaultPreviewSource);
}

uint64_t sub_21EA46594(uint64_t a1)
{
  return sub_21EA44804(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t sub_21EA465AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_21EA44748(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t sub_21EA46624(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_21EA44748(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_21EA44804(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_21EA466CC(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_21EA44804(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t sub_21EA46720(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t sub_21EA46768(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_21EA467BC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 1u)
    return *(unsigned __int8 *)(a1 + 48);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_21EA467D4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)(result + 40) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 48) = a2;
  return result;
}

uint64_t type metadata accessor for DefaultPreviewSource.Structure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DefaultPreviewSource.Structure);
}

uint64_t getEnumTagSinglePayload for PreviewSourceContentDomain(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewSourceContentDomain(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21EA468E4 + 4 * byte_21EA482C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21EA46918 + 4 * asc_21EA482C0[v4]))();
}

uint64_t sub_21EA46918(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA46920(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EA46928);
  return result;
}

uint64_t sub_21EA46934(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EA4693CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21EA46940(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA46948(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21EA46954(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewSourceContentDomain()
{
  return &type metadata for PreviewSourceContentDomain;
}

ValueMetadata *type metadata accessor for PreviewSourceContentCategory()
{
  return &type metadata for PreviewSourceContentCategory;
}

uint64_t destroy for PreviewGroupMetadata()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for PreviewGroupMetadata(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PreviewGroupMetadata(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for PreviewGroupMetadata(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewGroupMetadata(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewGroupMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewGroupMetadata()
{
  return &type metadata for PreviewGroupMetadata;
}

_QWORD *sub_21EA46B2C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PreviewGroupMetadata.Section(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for PreviewGroupMetadata.Section(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewGroupMetadata.Section(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewGroupMetadata.Section(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewGroupMetadata.Section()
{
  return &type metadata for PreviewGroupMetadata.Section;
}

uint64_t getEnumTagSinglePayload for PreviewGroupIndex(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviewGroupIndex(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreviewGroupIndex()
{
  return &type metadata for PreviewGroupIndex;
}

uint64_t sub_21EA46D0C()
{
  return 8;
}

_QWORD *sub_21EA46D18(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21EA46D24()
{
  return swift_getAtKeyPath();
}

BOOL static PreviewInterfaceOrientation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PreviewInterfaceOrientation.hash(into:)()
{
  return sub_21EA47280();
}

uint64_t PreviewInterfaceOrientation.hashValue.getter()
{
  sub_21EA47274();
  sub_21EA47280();
  return sub_21EA47298();
}

unint64_t sub_21EA46DD8()
{
  unint64_t result;

  result = qword_255464E18;
  if (!qword_255464E18)
  {
    result = MEMORY[0x2207B44E0](&protocol conformance descriptor for PreviewInterfaceOrientation, &type metadata for PreviewInterfaceOrientation);
    atomic_store(result, (unint64_t *)&qword_255464E18);
  }
  return result;
}

uint64_t sub_21EA46E1C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_21EA46E34(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewLayout()
{
  return &type metadata for PreviewLayout;
}

uint64_t storeEnumTagSinglePayload for PreviewInterfaceOrientation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EA46EAC + 4 * byte_21EA486D5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21EA46EE0 + 4 * byte_21EA486D0[v4]))();
}

uint64_t sub_21EA46EE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA46EE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EA46EF0);
  return result;
}

uint64_t sub_21EA46EFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EA46F04);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21EA46F08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EA46F10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewInterfaceOrientation()
{
  return &type metadata for PreviewInterfaceOrientation;
}

uint64_t sub_21EA46F2C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21EA46F38()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21EA46F44()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_21EA46F50()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21EA46F5C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21EA46F68()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21EA46F74()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_21EA46F80()
{
  return MEMORY[0x24BDCE2E8]();
}

uint64_t sub_21EA46F8C()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_21EA46F98()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_21EA46FA4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_21EA46FB0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21EA46FBC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21EA46FC8()
{
  return MEMORY[0x24BDBD738]();
}

uint64_t sub_21EA46FD4()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_21EA46FE0()
{
  return MEMORY[0x24BEE6278]();
}

uint64_t sub_21EA46FEC()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_21EA46FF8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21EA47004()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21EA47010()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21EA4701C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21EA47028()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_21EA47034()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_21EA47040()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_21EA4704C()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_21EA47058()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_21EA47064()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_21EA47070()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21EA4707C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21EA47088()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_21EA47094()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21EA470A0()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_21EA470AC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21EA470B8()
{
  return MEMORY[0x24BEE1240]();
}

uint64_t sub_21EA470C4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21EA470D0()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_21EA470DC()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_21EA470E8()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21EA470F4()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21EA47100()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21EA4710C()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_21EA47118()
{
  return MEMORY[0x24BEE19D0]();
}

uint64_t sub_21EA47124()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21EA47130()
{
  return MEMORY[0x24BDBD798]();
}

uint64_t sub_21EA4713C()
{
  return MEMORY[0x24BDBD7B0]();
}

uint64_t sub_21EA47148()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21EA47154()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_21EA47160()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21EA4716C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_21EA47178()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_21EA47184()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21EA47190()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21EA4719C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_21EA471A8()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_21EA471B4()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21EA471C0()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_21EA471CC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21EA471D8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21EA471E4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21EA471F0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21EA471FC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21EA47208()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21EA47214()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21EA47220()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_21EA4722C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21EA47238()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21EA47244()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21EA47250()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21EA4725C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21EA47268()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21EA47274()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21EA47280()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21EA4728C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21EA47298()
{
  return MEMORY[0x24BEE4328]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
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

