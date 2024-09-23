uint64_t _s7VariantVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)(result + 17) = a2 + 1;
  }
  return result;
}

uint64_t _s7VariantVwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 17);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s6FormatOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_1D81D5878@<X0>(char *a1@<X8>)
{
  return Artwork.Format.init(rawValue:)(a1);
}

uint64_t _s11URLTemplateVwet(uint64_t a1, int a2)
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

_QWORD *sub_1D81D58CC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

void sub_1D81D58D8(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t _s5StyleOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t sub_1D81D5984@<X0>(char *a1@<X8>)
{
  return Artwork.Style.init(rawValue:)(a1);
}

_BYTE *sub_1D81D5990(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

CGSize __swiftcall CGSize.clamped(atLeast:)(CGSize atLeast)
{
  double v1;
  double v2;

  if (v1 > atLeast.width)
    atLeast.width = v1;
  if (v2 > atLeast.height)
    atLeast.height = v2;
  return atLeast;
}

uint64_t dispatch thunk of DynamicTypeLabel.wantsFastBaselineMeasurement.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for DirectionalTextAlignment()
{
  return &type metadata for DirectionalTextAlignment;
}

uint64_t dispatch thunk of DynamicTypeLabel.fontUseCase.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

ValueMetadata *type metadata accessor for Artwork.Style()
{
  return &type metadata for Artwork.Style;
}

id static UIColor.secondaryText.getter()
{
  return sub_1D81D8054(&qword_1EDA1C508, (id *)&qword_1EDA1BCE8);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for CornerStyle()
{
  return &type metadata for CornerStyle;
}

_BYTE *sub_1D81D5A80(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t dispatch thunk of Artwork.isPortrait.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

BOOL sub_1D81D5A98()
{
  uint64_t v0;

  return *(double *)(v0 + 32) <= *(double *)(v0 + 40);
}

void Artwork.style.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 64);
}

uint64_t Artwork.contentMode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t dispatch thunk of RoundedCornerView.borderWidth.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

id static UIColor.primaryText.getter()
{
  return sub_1D81D8054(&qword_1EDA1C500, (id *)&qword_1EDA1BCE0);
}

ValueMetadata *type metadata accessor for StringCharacteristics()
{
  return &type metadata for StringCharacteristics;
}

uint64_t dispatch thunk of RoundedCornerView.borderColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

ValueMetadata *type metadata accessor for Artwork.Crop()
{
  return &type metadata for Artwork.Crop;
}

uint64_t static CharacterSet.excessiveLeading.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D81D7684(&qword_1EDA1C3E8, (uint64_t)qword_1EDA1BCB0, a1);
}

uint64_t sub_1D81D5C3C()
{
  uint64_t v0;

  v0 = sub_1D821534C();
  __swift_allocate_value_buffer(v0, qword_1EDA1BCB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDA1BCB0);
  return sub_1D8215304();
}

uint64_t sub_1D81D5CE8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id v10;
  _QWORD *v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D8215454();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for DynamicTypeButton();
  v20.receiver = v1;
  v20.super_class = v9;
  v10 = objc_msgSendSuper2(&v20, sel_traitCollectionDidChange_, a1);
  v11 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x110))(v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v13 = objc_msgSend(v1, sel_traitCollection);
  v14 = objc_msgSend(v13, sel_preferredContentSizeCategory);

  if (!*(_QWORD *)((char *)v1 + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory))
  {

    goto LABEL_9;
  }
  v15 = sub_1D82156D0();
  v17 = v16;
  if (v15 != sub_1D82156D0() || v17 != v18)
  {
    v19 = sub_1D8215A3C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_9:
    (*(void (**)(char *))((*v11 & *v1) + 0x108))(v8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  swift_bridgeObjectRelease_n();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1D81D5F0C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BCA0);
  result = sub_1D8215958();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_1D8215AA8();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1D81D616C()
{
  uint64_t v0;

  v0 = sub_1D8215634();
  __swift_allocate_value_buffer(v0, qword_1EDA1D6C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDA1D6C0);
  return sub_1D8215640();
}

void ArtworkView.shadow.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;

  v2 = *a1;
  v6 = *(_OWORD *)(a1 + 1);
  v3 = a1[3];
  v4 = v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadow;
  swift_beginAccess();
  v5 = *(void **)v4;
  *(_QWORD *)v4 = v2;
  *(_OWORD *)(v4 + 8) = v6;
  *(_QWORD *)(v4 + 24) = v3;

  sub_1D81DE9E4();
}

id DynamicTypeLabel.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_1D81D6290()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA1C4C8)
  {
    sub_1D8215454();
    v0 = sub_1D82158BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA1C4C8);
  }
}

void sub_1D81D62E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA1C1B8)
  {
    sub_1D82155B0();
    v0 = sub_1D82158BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA1C1B8);
  }
}

uint64_t sub_1D81D645C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a1, &qword_1EDA1C180);
}

uint64_t sub_1D81D64B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_1D821534C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x1E0C80A78](v2);
  v7 = (char *)&v10 - v6;
  __swift_allocate_value_buffer(v5, qword_1EDA1BA38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDA1BA38);
  sub_1D8215304();
  sub_1D8215334();
  sub_1D8215340();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  return ((uint64_t (*)(char *, uint64_t))v8)(v7, v0);
}

uint64_t initializeWithCopy for Shadow(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v5 = v3;
  return a1;
}

uint64_t sub_1D81D65C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = sub_1D8215634();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D8215658();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (qword_1EDA1BBF0 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_1EDA1D6C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  return sub_1D821564C();
}

uint64_t ArtworkLoader.__allocating_init(cacheLimit:renderIntent:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3828]), sel_init);
  v5 = (void *)sub_1D82156AC();
  objc_msgSend(v4, sel_setName_, v5);

  v6 = swift_allocObject();
  ArtworkLoader.init(queue:cacheLimit:renderIntent:)(v4, a1, a2);
  return v6;
}

uint64_t sub_1D81D6800()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t result;

  sub_1D81DEF94();
  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 0.0, 0.08);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 1.0, 0.08);
  v2 = v0;
  v3 = v1;
  result = sub_1D8215880();
  qword_1EDA1BCD8 = result;
  return result;
}

uint64_t sub_1D81D68A4(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  double *v9;
  uint64_t result;

  v9 = (double *)(v4 + OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin);
  result = swift_beginAccess();
  *v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t sub_1D81D690C()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t result;

  sub_1D81DEF94();
  v0 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithRed_green_blue_alpha_, 0.109803922, 0.109803922, 0.117647059, 1.0);
  v2 = v0;
  v3 = v1;
  result = sub_1D8215880();
  qword_1EDA1BA60 = result;
  return result;
}

_QWORD *DynamicTypeButton.__allocating_init(useCase:)(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_buttonWithType_, 1);
  v5 = sub_1D8215454();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v3, a1, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v3, 0, 1, v5);
  v7 = (uint64_t)v4 + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase;
  swift_beginAccess();
  v8 = v4;
  sub_1D81E9A28((uint64_t)v3, v7);
  swift_endAccess();
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v8) + 0x108))(a1);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v8;
}

uint64_t sub_1D81D6CE8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isIdle) ^ 1;
}

uint64_t sub_1D81D6D0C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isIdleForReason_, 2) ^ 1;
}

id sub_1D81D6D34(char *a1, double a2)
{
  char *v2;
  void *v3;
  char *v4;
  char *v5;
  id result;

  v3 = v2;
  *(double *)&v2[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius] = a2;
  v2[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle] = *a1;
  CornerStyle.apply(withRadius:to:)(v2, a2);
  v4 = &v2[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = &v2[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
  result = (id)swift_beginAccess();
  if (*(_QWORD *)v5)
    return objc_msgSend(v3, sel_setNeedsLayout);
  return result;
}

id sub_1D81D6DD8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v7;

  v2 = *a1;
  v7 = *(_OWORD *)(a1 + 1);
  v3 = a1[3];
  v4 = v1 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow;
  swift_beginAccess();
  v5 = *(void **)v4;
  *(_QWORD *)v4 = v2;
  *(_OWORD *)(v4 + 8) = v7;
  *(_QWORD *)(v4 + 24) = v3;

  return sub_1D81DED2C();
}

uint64_t sub_1D81D6E4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[3];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1D82154A8();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D82154C0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v11 = *(_BYTE *)(v1 + 64);
  v15[1] = *(_QWORD *)(v1 + 24);
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v1;
  aBlock[4] = sub_1D81E9ECC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D81D7A68;
  aBlock[3] = &block_descriptor_36;
  v13 = _Block_copy(aBlock);
  swift_retain();
  sub_1D82154B4();
  v15[2] = MEMORY[0x1E0DEE9D8];
  sub_1D81E802C(&qword_1EDA1C188, v3, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1D8);
  sub_1D81E806C(&qword_1EDA1C1E0, &qword_1EDA1C1D8);
  sub_1D8215910();
  MEMORY[0x1D82AA154](0, v10, v6, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_1D81D71C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 80) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t ArtworkLoader.register(resourceLoader:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  char v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v3 = sub_1D8215658();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_supportedScheme);
  v8 = sub_1D82156D0();
  v10 = v9;

  v11 = (uint64_t *)(v1 + 56);
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v1 + 56) + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain();
  sub_1D81E7A1C(v8, v10);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_endAccess();
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v11;
    *v11 = 0x8000000000000000;
    sub_1D81D8534(a1, v8, v10, isUniquelyReferenced_nonNull_native);
    *v11 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (qword_1EDA1BBE8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_1EDA1D670);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
  sub_1D8215580();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8218A50;
  sub_1D8215550();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0167F70);
  v17[0] = a1;
  sub_1D8215568();
  sub_1D81D8B6C((uint64_t)v17, &qword_1EDA1C290);
  sub_1D8215550();
  v18 = MEMORY[0x1E0DEA968];
  v17[0] = v8;
  v17[1] = v10;
  sub_1D8215568();
  sub_1D81D8B6C((uint64_t)v17, &qword_1EDA1C290);
  sub_1D821561C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id sub_1D81D7514(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), *a2);
  *a3 = result;
  return result;
}

id sub_1D81D7554(unsigned __int8 *a1)
{
  char *v1;
  void *v2;
  int v3;
  char *v4;
  id result;
  int v6;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  objc_super v14;
  objc_super v15;

  v2 = v1;
  v3 = *a1;
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment];
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = v3;
  if (v3 != v6 && v3 != 0)
  {
    if (v3 == 1)
    {
      v8 = objc_msgSend(v2, sel_traitCollection);
      v9 = sub_1D8215820();

      if ((v9 & 1) != 0)
        v10 = 2;
      else
        v10 = 0;
      v14.receiver = v2;
      v14.super_class = (Class)type metadata accessor for DynamicTypeLabel();
      return objc_msgSendSuper2(&v14, sel_setTextAlignment_, v10);
    }
    else
    {
      v11 = objc_msgSend(v2, sel_traitCollection);
      v12 = sub_1D8215820();

      if ((v12 & 1) != 0)
        v13 = 0;
      else
        v13 = 2;
      v15.receiver = v2;
      v15.super_class = (Class)type metadata accessor for DynamicTypeLabel();
      return objc_msgSendSuper2(&v15, sel_setTextAlignment_, v13);
    }
  }
  return result;
}

void *Artwork.backgroundColor.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

uint64_t sub_1D81D7684@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1D821534C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

_QWORD *ArtworkLoader.init(queue:cacheLimit:renderIntent:)(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = v3;
  v23 = a2;
  v24 = a3;
  v22 = a1;
  v21 = sub_1D82157F0();
  v5 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D82157E4();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_1D82154C0();
  MEMORY[0x1E0C80A78]();
  v9 = MEMORY[0x1E0DEE9D8];
  v3[4] = sub_1D81DA370(MEMORY[0x1E0DEE9D8]);
  v3[5] = sub_1D81DA4B0(v9);
  v3[10] = 0;
  swift_unknownObjectWeakInit();
  swift_weakInit();
  v3[12] = MEMORY[0x1E0DEE9E8];
  sub_1D81D898C(0, (unint64_t *)&qword_1EDA1C218);
  sub_1D82154B4();
  v25 = v9;
  sub_1D81E802C(&qword_1EDA1C210, v8, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1F8);
  sub_1D81E806C(&qword_1EDA1C200, &qword_1EDA1C1F8);
  sub_1D8215910();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF8D0], v21);
  v10 = sub_1D8215814();
  v3[3] = v10;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3828]), sel_init);
  objc_msgSend(v11, sel_setMaxConcurrentOperationCount_, 1);
  objc_msgSend(v11, sel_setUnderlyingQueue_, v10);
  v12 = (void *)sub_1D82156AC();
  objc_msgSend(v11, sel_setName_, v12);

  v13 = (void *)objc_opt_self();
  v14 = v22;
  v15 = v11;
  v16 = objc_msgSend(v13, sel_mainQueue);
  v17 = objc_allocWithZone((Class)ASKResourceLoader);
  v18 = objc_msgSend(v17, sel_initWithRequestQueue_accessQueue_notificationQueue_cacheLimit_, v14, v15, v16, v23);

  v4[2] = v18;
  *((_BYTE *)v4 + 64) = 0;
  v4[6] = v24;
  v4[7] = sub_1D81D8380();
  sub_1D81DA5E4();

  return v4;
}

uint64_t static ArtworkLoader.handlerKey<A>(for:)()
{
  sub_1D8215694();
  return sub_1D8215940();
}

uint64_t sub_1D81D7A68(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_1D81D7A94()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setAlpha_, 1.0);
}

uint64_t sub_1D81D7AB4(double a1)
{
  _QWORD *v1;
  double *v3;
  uint64_t v4;

  v3 = (double *)((char *)v1 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth);
  v4 = swift_beginAccess();
  *v3 = a1;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE8))(v4);
}

uint64_t sub_1D81D7B20(char *a1, double a2)
{
  _QWORD *v2;
  _QWORD *v3;
  char v5;
  double *v6;
  _BYTE *v7;
  _BOOL8 v8;

  v3 = v2;
  v5 = *a1;
  v6 = (double *)((char *)v2 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius);
  swift_beginAccess();
  *v6 = a2;
  v7 = (char *)v3 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle;
  swift_beginAccess();
  *v7 = v5;
  v8 = CornerStyle.apply(withRadius:to:)(v3, a2);
  return (*(uint64_t (**)(_BOOL8))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xE8))(v8);
}

void sub_1D81D7C18(uint64_t a1)
{
  char *v1;
  id v3;
  void *v4;
  char *v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  objc_msgSendSuper2(&v6, sel_setLineSpacing_, a1);
  v3 = objc_msgSend(v1, sel_font);
  if (v3)
  {
    v4 = v3;
    if (!objc_msgSend(v1, sel_lineSpacing)
      && ((v5 = &v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement],
           swift_beginAccess(),
           (*v5 & 1) != 0)
       || v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] == 1))
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, v4);
    }
    else
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, 0);
    }

  }
  else
  {
    __break(1u);
  }
}

id ArtworkView.imageSize.setter(double a1, double a2)
{
  _BYTE *v2;
  double *v5;
  id result;
  double v7;
  double v8;

  v5 = (double *)&v2[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize];
  result = (id)swift_beginAccess();
  v7 = *v5;
  v8 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  if (v7 != a1 || v8 != a2)
  {
    v2[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = 1;
    return objc_msgSend(v2, sel_setNeedsLayout);
  }
  return result;
}

double CGPoint.rounded(_:)(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t (*v14)(char *, uint64_t);
  int v15;
  int v16;
  double v17;
  int v18;
  double v20;
  double v21;

  v6 = sub_1D8215A18();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v20 - v11;
  v21 = a2;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)&v20 - v11, a1, v6);
  v14 = *(uint64_t (**)(char *, uint64_t))(v7 + 88);
  v15 = v14(v12, v6);
  v16 = *MEMORY[0x1E0DED4F0];
  if (v15 == *MEMORY[0x1E0DED4F0])
  {
    v17 = round(a2);
    v21 = v17;
  }
  else if (v15 == *MEMORY[0x1E0DED4E8])
  {
    v17 = rint(a2);
    v21 = v17;
  }
  else
  {
    if (v15 == *MEMORY[0x1E0DED500])
      goto LABEL_6;
    if (v15 == *MEMORY[0x1E0DED508])
      goto LABEL_8;
    if (v15 == *MEMORY[0x1E0DED4D8])
    {
      v17 = trunc(a2);
      v21 = v17;
      goto LABEL_15;
    }
    if (v15 != *MEMORY[0x1E0DED4E0])
    {
      sub_1D82157CC();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      v17 = v21;
      goto LABEL_15;
    }
    if ((*(_QWORD *)&a2 & 0x8000000000000000) != 0)
    {
LABEL_8:
      v17 = floor(a2);
      v21 = v17;
    }
    else
    {
LABEL_6:
      v17 = ceil(a2);
      v21 = v17;
    }
  }
LABEL_15:
  v20 = a3;
  v13(v10, a1, v6);
  v18 = v14(v10, v6);
  if (v18 != v16
    && v18 != *MEMORY[0x1E0DED4E8]
    && v18 != *MEMORY[0x1E0DED500]
    && v18 != *MEMORY[0x1E0DED508]
    && v18 != *MEMORY[0x1E0DED4D8]
    && v18 != *MEMORY[0x1E0DED4E0])
  {
    sub_1D82157CC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return v17;
}

id sub_1D81D8054(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t ArtworkLoaderConfig.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t ArtworkLoader.forgetFetch<A>(forView:deprioritizingFetch:)(uint64_t a1, char a2)
{
  _QWORD v4[6];

  v4[5] = sub_1D8215694();
  sub_1D8215940();
  ArtworkLoader.forgetFetch(forHandlerKey:deprioritizingFetch:)((uint64_t)v4, a2);
  return sub_1D81E610C((uint64_t)v4);
}

_QWORD *DynamicTypeLabel.__allocating_init(useCase:numberOfLines:lineBreakMode:isUserInteractionEnabled:directionalTextAlignment:contentSizeCategoryMapping:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5, char *a6, uint64_t a7, uint64_t a8)
{
  objc_class *v8;
  int v16;
  id v17;
  _QWORD *v18;

  v16 = a4 & 1;
  v17 = objc_allocWithZone(v8);
  v18 = sub_1D81E29C0(a1, a2, a3, v16, a5, a6, a7, a8);
  sub_1D81E2E70(a7);
  return v18;
}

uint64_t sub_1D81D82A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t result;

  v9 = *(_QWORD *)(v7 + 32);
  result = sub_1D821573C();
  if (result >= 9)
  {
    result = swift_beginAccess();
    *(_BYTE *)(v9 + 16) = 1;
    *a7 = 1;
  }
  return result;
}

id ArtworkView.frame.getter()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_frame);
}

uint64_t sub_1D81D8380()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v0 = sub_1D81D898C(0, &qword_1EDA1C4E0);
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_supportedScheme);
  v2 = sub_1D82156D0();
  v4 = v3;

  v5 = MEMORY[0x1E0DEE9E0];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1D81D8534(v0, v2, v4, isUniquelyReferenced_nonNull_native);
  v7 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = sub_1D81D898C(0, &qword_1EDA1C4E8);
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_supportedScheme);
  v10 = sub_1D82156D0();
  v12 = v11;

  v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_1D81D8534(v8, v10, v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = sub_1D81D898C(0, &qword_1EDA1C4D8);
  v15 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_supportedScheme);
  v16 = sub_1D82156D0();
  v18 = v17;

  v19 = swift_isUniquelyReferenced_nonNull_native();
  sub_1D81D8534(v14, v16, v18, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1D81D8534(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1D81E7A1C(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1D8204BF8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1D81D8684(result, a4 & 1);
  result = sub_1D81E7A1C(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1D8215A6C();
  __break(1u);
  return result;
}

uint64_t sub_1D81D8684(uint64_t a1, char a2)
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
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C518);
  v37 = a2;
  v6 = sub_1D82159DC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
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
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1D8215AB4();
    sub_1D821570C();
    result = sub_1D8215AE4();
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
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
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

uint64_t sub_1D81D898C(uint64_t a1, unint64_t *a2)
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

void sub_1D81D89C4(void *a1)
{
  _QWORD *v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)((char *)v1 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE8))();
}

uint64_t type metadata accessor for ArtworkView()
{
  return objc_opt_self();
}

uint64_t ArtworkLoader.fetchArtwork<A>(using:forReason:closestMatch:into:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  _QWORD *v12;
  _QWORD v14[6];

  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a5;
  v12[3] = a6;
  v12[4] = v11;
  v14[5] = sub_1D8215694();
  sub_1D8215940();
  swift_retain();
  ArtworkLoader.fetchArtwork(using:forReason:closestMatch:handlerKey:completionHandler:)(a1, a2, a3, (uint64_t)v14, (uint64_t)sub_1D81DE004, (uint64_t)v12);
  swift_release_n();
  return sub_1D81D8B6C((uint64_t)v14, &qword_1EDA1BF58);
}

uint64_t sub_1D81D8B6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t ArtworkLoader.pageRenderMetrics.setter()
{
  sub_1D81D8BCC();
  return swift_release();
}

uint64_t sub_1D81D8BCC()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  swift_weakAssign();
  if (qword_1EDA1BBE8 != -1)
    swift_once();
  v1 = sub_1D8215658();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EDA1D670);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
  sub_1D8215580();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8218310;
  sub_1D8215550();
  sub_1D8215610();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v0 + 96) = MEMORY[0x1E0DEE9E8];
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D81D8D74(uint64_t a1)
{
  uint64_t v1;

  return sub_1D81D8D8C(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_1D81D8D8C(uint64_t a1, _QWORD *a2)
{
  void (**v4)(id);
  uint64_t result;
  void (*v6)(id);
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void (**)(id))((char *)a2 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping);
  result = swift_beginAccess();
  v6 = *v4;
  if (*v4)
  {
    v7 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *a2) + 0xC0);
    v8 = swift_retain();
    v9 = (void *)v7(v8);
    v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);

    v6(v10);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    sub_1D8215478();
    return sub_1D81E2E70((uint64_t)v6);
  }
  return result;
}

uint64_t type metadata accessor for ArtworkLoader()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for DynamicTypeButton()
{
  uint64_t result;

  result = qword_1EDA1C410;
  if (!qword_1EDA1C410)
    return swift_getSingletonMetadata();
  return result;
}

BOOL Array.isNotEmpty.getter()
{
  uint64_t v0;

  v0 = sub_1D82157B4();
  MEMORY[0x1D82AAACC](MEMORY[0x1E0DEAF50], v0);
  return (sub_1D82157D8() & 1) == 0;
}

double sub_1D81D91C0(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, double (*a7)(double, double, double, double))
{
  id v12;
  double v13;

  v12 = a1;
  v13 = a7(a2, a3, a4, a5);

  return v13;
}

double sub_1D81D923C(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  objc_class *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double MaxX;
  double v35;
  double v36;
  double MinX;
  double v38;
  objc_super v40;
  objc_super v41;
  CGRect v42;

  v5 = v4;
  v10 = (objc_class *)type metadata accessor for Button();
  v41.receiver = v5;
  v41.super_class = v10;
  objc_msgSendSuper2(&v41, sel_titleRectForContentRect_, a1, a2, a3, a4);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = &v5[OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment];
  swift_beginAccess();
  if (*v19 == 1)
  {
    v40.receiver = v5;
    v40.super_class = v10;
    objc_msgSendSuper2(&v40, sel_imageRectForContentRect_, a1, a2, a3, a4);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = objc_msgSend(v5, sel_traitCollection);
    v29 = sub_1D8215820();

    v30 = v21;
    v31 = v23;
    v32 = v25;
    v33 = v27;
    if ((v29 & 1) != 0)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v30);
      v42.origin.x = v12;
      v42.origin.y = v14;
      v42.size.width = v16;
      v42.size.height = v18;
      v35 = MaxX - CGRectGetWidth(v42);
      objc_msgSend(v5, sel_imageEdgeInsets);
      return v35 + v36;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v30);
      objc_msgSend(v5, sel_imageEdgeInsets);
      return MinX - v38;
    }
  }
  return v12;
}

uint64_t type metadata accessor for Button()
{
  return objc_opt_self();
}

void sub_1D81D93F4(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  objc_class *v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  id v26;
  void *v27;
  char *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double MinY;
  double v46;
  double v47;
  double Height;
  double v49;
  char *v50;
  id v51;
  char v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  objc_super v56;
  objc_super v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v5 = v4;
  v10 = (objc_class *)type metadata accessor for Button();
  v57.receiver = v5;
  v57.super_class = v10;
  objc_msgSendSuper2(&v57, sel_imageRectForContentRect_, a1, a2, a3, a4);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v55 = v17;
  v56.receiver = v5;
  v56.super_class = v10;
  objc_msgSendSuper2(&v56, sel_titleRectForContentRect_, a1, a2, a3, a4);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = objc_msgSend(v5, sel_titleLabel);
  if (v26)
  {
    v27 = v26;
    v28 = &v5[OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment];
    swift_beginAccess();
    if (*v28 != 1)
    {
LABEL_12:

      goto LABEL_17;
    }
    v29 = objc_msgSend(v27, sel_font);
    if (!v29)
      goto LABEL_24;
    v30 = v29;
    v31 = objc_msgSend(v27, sel_text);
    v54 = v16;
    if (v31)
    {
      v32 = v31;
      sub_1D82156D0();

      v33 = qword_1EDA1C3E8;
      swift_bridgeObjectRetain();
      if (v33 != -1)
        swift_once();
      v34 = sub_1D821534C();
      __swift_project_value_buffer(v34, (uint64_t)qword_1EDA1BCB0);
      sub_1D81E04C0();
      sub_1D82158C8();
      v36 = v35;
      swift_bridgeObjectRelease();
      if ((v36 & 1) == 0)
      {
        objc_msgSend(v30, sel_lineHeight);
        v38 = v37;

        swift_bridgeObjectRelease();
        v16 = 1.3;
        v39 = ceil(v38 * 1.3);
        if ((~*(_QWORD *)&v39 & 0x7FF0000000000000) != 0)
        {
          if (v39 > -9.22337204e18)
          {
            if (v39 >= 9.22337204e18)
            {
              __break(1u);
              goto LABEL_12;
            }
            goto LABEL_16;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
LABEL_24:
        __break(1u);
        return;
      }

      swift_bridgeObjectRelease();
    }
    else
    {

    }
    v16 = 1.0;
LABEL_16:
    v58.origin.x = v19;
    v58.origin.y = v21;
    v58.size.width = v23;
    v58.size.height = v25;
    v40 = v19;
    v41 = v21;
    v42 = v23;
    v43 = v25;
    v44 = v16 * CGRectGetHeight(v58);
    v59.origin.x = v40;
    v59.origin.y = v41;
    v59.size.width = v42;
    v59.size.height = v43;
    v53 = v44 - CGRectGetHeight(v59);
    v60.origin.x = v40;
    v60.origin.y = v41;
    v60.size.width = v42;
    v60.size.height = v43;
    MinY = CGRectGetMinY(v60);
    objc_msgSend(v27, sel_firstBaselineFromTop);
    v47 = MinY + v16 * v46;
    v61.origin.x = v12;
    v61.origin.y = v14;
    v61.size.height = v55;
    v61.size.width = v54;
    Height = CGRectGetHeight(v61);

    v49 = v47 - Height;
    v25 = v43;
    v23 = v42;
    v21 = v41;
    v19 = v40;
    v16 = v54;
    v14 = v49 + v53 * -0.5;
  }
LABEL_17:
  v50 = &v5[OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment];
  swift_beginAccess();
  if (*v50 == 1)
  {
    v51 = objc_msgSend(v5, sel_traitCollection);
    v52 = sub_1D8215820();

    if ((v52 & 1) != 0)
    {
      v62.origin.x = v19;
      v62.origin.y = v21;
      v62.size.width = v23;
      v62.size.height = v25;
      CGRectGetMinX(v62);
      objc_msgSend(v5, sel_imageEdgeInsets);
      v63.origin.x = v12;
      v63.origin.y = v14;
      v63.size.width = v16;
      v63.size.height = v55;
      CGRectGetWidth(v63);
    }
    else
    {
      v64.origin.x = v12;
      v64.origin.y = v14;
      v64.size.width = v16;
      v64.size.height = v55;
      CGRectGetMinX(v64);
      v65.size.height = v25;
      v65.origin.x = v19;
      v65.origin.y = v21;
      v65.size.width = v23;
      CGRectGetWidth(v65);
      objc_msgSend(v5, sel_imageEdgeInsets);
    }
  }
}

uint64_t sub_1D81D983C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v3);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = v1 + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase;
  swift_beginAccess();
  sub_1D81D9CD8(v6, (uint64_t)v5);
  swift_beginAccess();
  sub_1D81D9920(a1, v6);
  swift_endAccess();
  sub_1D81D9968((uint64_t)v5);
  sub_1D81D8B6C(a1, &qword_1EDA1C180);
  return sub_1D81D8B6C((uint64_t)v5, &qword_1EDA1C180);
}

uint64_t sub_1D81D9920(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D81D9968(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char v26;
  void (*v27)(char *, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C4D0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v6 = MEMORY[0x1E0C80A78](v5);
  v29 = (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v28 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v28 - v11;
  v13 = sub_1D8215454();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v28 - v18;
  v20 = (uint64_t)v1 + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase;
  swift_beginAccess();
  sub_1D81D9CD8(v20, (uint64_t)v12);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v21(v12, 1, v13) == 1)
    return sub_1D81D8B6C((uint64_t)v12, &qword_1EDA1C180);
  v28 = v1;
  v23 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v23(v19, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v10, v19, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
  v24 = (uint64_t)&v4[*(int *)(v2 + 48)];
  sub_1D81D9CD8((uint64_t)v10, (uint64_t)v4);
  sub_1D81D9CD8(v30, v24);
  if (v21(v4, 1, v13) == 1)
  {
    sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1C180);
    if (v21((char *)v24, 1, v13) == 1)
    {
      sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    }
    goto LABEL_8;
  }
  v25 = v29;
  sub_1D81D9CD8((uint64_t)v4, v29);
  if (v21((char *)v24, 1, v13) == 1)
  {
    sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1C180);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v25, v13);
LABEL_8:
    sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C4D0);
LABEL_12:
    (*(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & *v28) + 0x108))(v19);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  }
  v23(v17, (char *)v24, v13);
  sub_1D81E46E0();
  v26 = sub_1D82156A0();
  v27 = *(void (**)(char *, uint64_t))(v14 + 8);
  v27(v17, v13);
  sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1C180);
  v27((char *)v25, v13);
  sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
  if ((v26 & 1) == 0)
    goto LABEL_12;
  return ((uint64_t (*)(char *, uint64_t))v27)(v19, v13);
}

uint64_t sub_1D81D9CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1D81D9D20(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t (*v4)(void);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = v1;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1) + 0x100);
  v5 = (void *)v4();
  v6 = objc_msgSend(v5, sel_preferredContentSizeCategory);

  v7 = *(void **)&v2[OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory];
  *(_QWORD *)&v2[OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory] = v6;

  sub_1D81D898C(0, (unint64_t *)&qword_1EDA1C248);
  v8 = (void *)v4();
  v9 = (id)MEMORY[0x1D82AA1A8](a1, v8);

  objc_msgSend(v2, sel__setFont_, v9);
}

id sub_1D81D9E00()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v10;

  v1 = objc_msgSend(v0, sel_traitCollection);
  v2 = objc_msgSend(v1, sel_preferredContentSizeCategory);
  v3 = sub_1D82156D0();
  v5 = v4;
  if (v3 == sub_1D82156D0() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = sub_1D8215A3C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      return v1;
  }
  sub_1D81D898C(0, &qword_1EDA1C220);
  v10 = sub_1D821582C();

  return (id)v10;
}

double CGSize.rounded(_:)(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t (*v14)(char *, uint64_t);
  int v15;
  int v16;
  double v17;
  int v18;
  double v20;
  double v21;

  v6 = sub_1D8215A18();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v20 - v11;
  v21 = a2;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)&v20 - v11, a1, v6);
  v14 = *(uint64_t (**)(char *, uint64_t))(v7 + 88);
  v15 = v14(v12, v6);
  v16 = *MEMORY[0x1E0DED4F0];
  if (v15 == *MEMORY[0x1E0DED4F0])
  {
    v17 = round(a2);
    v21 = v17;
  }
  else if (v15 == *MEMORY[0x1E0DED4E8])
  {
    v17 = rint(a2);
    v21 = v17;
  }
  else
  {
    if (v15 == *MEMORY[0x1E0DED500])
      goto LABEL_6;
    if (v15 == *MEMORY[0x1E0DED508])
      goto LABEL_8;
    if (v15 == *MEMORY[0x1E0DED4D8])
    {
      v17 = trunc(a2);
      v21 = v17;
      goto LABEL_15;
    }
    if (v15 != *MEMORY[0x1E0DED4E0])
    {
      sub_1D82157CC();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      v17 = v21;
      goto LABEL_15;
    }
    if ((*(_QWORD *)&a2 & 0x8000000000000000) != 0)
    {
LABEL_8:
      v17 = floor(a2);
      v21 = v17;
    }
    else
    {
LABEL_6:
      v17 = ceil(a2);
      v21 = v17;
    }
  }
LABEL_15:
  v20 = a3;
  v13(v10, a1, v6);
  v18 = v14(v10, v6);
  if (v18 != v16
    && v18 != *MEMORY[0x1E0DED4E8]
    && v18 != *MEMORY[0x1E0DED500]
    && v18 != *MEMORY[0x1E0DED508]
    && v18 != *MEMORY[0x1E0DED4D8]
    && v18 != *MEMORY[0x1E0DED4E0])
  {
    sub_1D82157CC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return v17;
}

uint64_t sub_1D81DA198@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = Artwork.__allocating_init(deserializing:using:)(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t ArtworkLoader.init(parent:)(_QWORD *a1)
{
  uint64_t v1;

  v1 = sub_1D81DA284(a1);
  swift_release();
  return v1;
}

uint64_t sub_1D81DA284(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v1 + 32) = sub_1D81DA370(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)(v1 + 40) = sub_1D81DA4B0(v3);
  *(_QWORD *)(v1 + 80) = 0;
  swift_unknownObjectWeakInit();
  swift_weakInit();
  *(_QWORD *)(v1 + 96) = MEMORY[0x1E0DEE9E8];
  v4 = (void *)a1[3];
  *(_QWORD *)(v1 + 24) = v4;
  v5 = a1[2];
  v6 = objc_allocWithZone((Class)ASKResourceLoader);
  v7 = v4;
  *(_QWORD *)(v1 + 16) = objc_msgSend(v6, sel_initWithParentResourceLoader_, v5);
  *(_BYTE *)(v1 + 64) = 1;
  *(_QWORD *)(v1 + 48) = a1[6];
  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1[7];
  swift_bridgeObjectRetain();
  sub_1D81DA5E4();
  return v1;
}

unint64_t sub_1D81DA370(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  char v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF68);
  v2 = (_QWORD *)sub_1D82159E8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1D81E1C08(v4, (uint64_t)v15, &qword_1F01681C8);
    result = sub_1D81E5818((uint64_t)v15);
    if ((v6 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v7 = v2[6] + 40 * result;
    v8 = v15[0];
    v9 = v15[1];
    *(_QWORD *)(v7 + 32) = v16;
    *(_OWORD *)v7 = v8;
    *(_OWORD *)(v7 + 16) = v9;
    v10 = v2[7] + 24 * result;
    v11 = v18;
    *(_OWORD *)v10 = v17;
    *(_QWORD *)(v10 + 16) = v11;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 64;
    if (!--v3)
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

unint64_t sub_1D81DA4B0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF60);
  v2 = (_QWORD *)sub_1D82159E8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v6 = (void *)*(v4 - 3);
    v5 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1D81E6444(v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v6;
    v11 = (_QWORD *)(v2[7] + 24 * result);
    *v11 = v5;
    v11[1] = v7;
    v11[2] = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 4;
    if (!--v3)
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

void sub_1D81DA5E4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = *(_QWORD *)(v0 + 16);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_resourceLoaderDidBeginLoading, CFSTR("ASKResourceLoaderDidBeginLoadingNotification"), v1);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_resourceLoaderDidLoadAllForReason_, CFSTR("ASKResourceLoaderDidLoadAllForReasonNotification"), v1);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_resourceLoaderDidIdle, CFSTR("ASKResourceLoaderDidIdleNotification"), v1);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_resourceLoaderDidBeginLoadingForReason_, CFSTR("ASKResourceLoaderDidBeginLoadingForReasonNotification"), v1);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_resourceLoaderDidFinishLoadingForReason_, CFSTR("ASKResourceLoaderDidFinishLoadingForReasonNotification"), v1);

}

uint64_t sub_1D81DA700(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = sub_1D8215370();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D8215358();
  swift_retain();
  a4(v8);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_1D81DA838(unsigned __int8 *a1)
{
  char *v1;
  void *v2;
  int v3;
  char *v4;
  id result;
  int v6;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  objc_super v14;
  objc_super v15;

  v2 = v1;
  v3 = *a1;
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment];
  result = (id)swift_beginAccess();
  v6 = *v4;
  if (v6 != v3 && v6 != 0)
  {
    if (v6 == 1)
    {
      v8 = objc_msgSend(v2, sel_traitCollection);
      v9 = sub_1D8215820();

      if ((v9 & 1) != 0)
        v10 = 2;
      else
        v10 = 0;
      v14.receiver = v2;
      v14.super_class = (Class)type metadata accessor for DynamicTypeLabel();
      return objc_msgSendSuper2(&v14, sel_setTextAlignment_, v10);
    }
    else
    {
      v11 = objc_msgSend(v2, sel_traitCollection);
      v12 = sub_1D8215820();

      if ((v12 & 1) != 0)
        v13 = 0;
      else
        v13 = 2;
      v15.receiver = v2;
      v15.super_class = (Class)type metadata accessor for DynamicTypeLabel();
      return objc_msgSendSuper2(&v15, sel_setTextAlignment_, v13);
    }
  }
  return result;
}

uint64_t LayoutMarginsAware<>.layoutFrame.getter()
{
  void *v0;

  objc_msgSend(v0, sel_frame);
  objc_msgSend(v0, sel_layoutMargins);
  return sub_1D8215844();
}

AppStoreKit::StringCharacteristics __swiftcall StringCharacteristics.init(byAnalyzing:)(Swift::String_optional byAnalyzing)
{
  uint64_t *v1;
  unint64_t object;
  uint64_t countAndFlagsBits;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  AppStoreKit::StringCharacteristics result;
  uint64_t v8;
  char *v9;
  char v10;
  _BOOL8 v11;
  void (*v12)(char *, uint64_t);
  char v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  object = (unint64_t)byAnalyzing.value._object;
  countAndFlagsBits = byAnalyzing.value._countAndFlagsBits;
  v4 = v1;
  v5 = sub_1D821534C();
  v6 = *(_QWORD *)(v5 - 8);
  result.rawValue = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (object)
  {
    v25 = v4;
    v26 = countAndFlagsBits;
    v27 = object;
    sub_1D8215334();
    sub_1D81E04C0();
    sub_1D82158C8();
    v11 = (v10 & 1) == 0;
    v12 = *(void (**)(char *, uint64_t))(v6 + 8);
    v12(v9, v5);
    v26 = countAndFlagsBits;
    v27 = object;
    if (qword_1EDA1BAF0 != -1)
      swift_once();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EDA1BA38);
    sub_1D82158C8();
    if ((v13 & 1) != 0)
      v14 = v11;
    else
      v14 = v11 | 8;
    v26 = countAndFlagsBits;
    v27 = object;
    sub_1D8215310();
    sub_1D82158C8();
    v16 = v15;
    v12(v9, v5);
    if ((v16 & 1) == 0
      || (v26 = countAndFlagsBits, v27 = object,
                                   sub_1D821531C(),
                                   sub_1D82158C8(),
                                   v18 = v17,
                                   v12(v9, v5),
                                   (v18 & 1) == 0))
    {
      v14 |= 2uLL;
    }
    v19 = HIBYTE(object) & 0xF;
    if ((object & 0x2000000000000000) == 0)
      v19 = countAndFlagsBits;
    v20 = 7;
    if (((object >> 60) & ((countAndFlagsBits & 0x800000000000000) == 0)) != 0)
      v20 = 11;
    v21 = v20 | (v19 << 16);
    v22 = swift_allocObject();
    *(_BYTE *)(v22 + 16) = 0;
    v26 = countAndFlagsBits;
    v27 = object;
    v28 = 15;
    v29 = v21;
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = countAndFlagsBits;
    v23[3] = object;
    v23[4] = v22;
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BA88);
    sub_1D81DACAC(&qword_1EDA1BA90, &qword_1EDA1BA88, MEMORY[0x1E0DEB8A8]);
    sub_1D82158E0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_beginAccess();
    LOBYTE(v21) = *(_BYTE *)(v22 + 16);
    result.rawValue = swift_release();
    if ((v21 & ((v14 & 4) == 0)) != 0)
      v24 = v14 | 4;
    else
      v24 = v14;
    v4 = v25;
  }
  else
  {
    v24 = 0;
  }
  *v4 = v24;
  return result;
}

uint64_t sub_1D81DACAC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D82AAACC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Artwork.config(_:mode:prefersLayeredImage:)(UIViewContentMode a1, uint64_t a2, double a3, double a4)
{
  _QWORD *v4;
  CGSize v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  char v11;
  int v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  char v21;
  char v23;
  uint64_t v24[2];
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned __int8 v28;

  v6 = CGSize.fitting(_:mode:)((CGSize)__PAIR128__(*(unint64_t *)&a4, *(unint64_t *)&a3), a1);
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v8, sel_scale);

  sub_1D81DAE98(a2, (uint64_t)&v25);
  v9 = v25;
  v10 = v26;
  v11 = v27;
  v12 = v28;
  v13 = v4[3];
  v25 = v4[2];
  v26 = v13;
  swift_bridgeObjectRetain();
  v14 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v14, sel_scale);
  v16 = v15;

  v17 = v4[10];
  v24[0] = v4[9];
  v24[1] = v17;
  v23 = v9;
  swift_bridgeObjectRetain();
  if (v12 == 1)
  {
    v18 = objc_msgSend(v7, sel_mainScreen);
    v19 = objc_msgSend(v18, sel_traitCollection);

    v20 = objc_msgSend(v19, sel_displayGamut);
    v21 = v20 == (id)1;
  }
  else
  {
    v21 = 0;
  }
  type metadata accessor for ArtworkLoaderConfig();
  swift_allocObject();
  return ArtworkLoaderConfig.init(template:size:scale:crop:format:quality:useWideGamut:)(&v25, v24, &v23, v10, v11, v21, floor(v6.width), floor(v6.height), v16);
}

uint64_t sub_1D81DAE98@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(_QWORD *)(v2 + 96);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = (char *)(v3 + 49);
    while (1)
    {
      v6 = *(v5 - 17);
      if ((((v6 != 3) ^ result) & 1) != 0)
        break;
      v5 += 24;
      if (!--v4)
      {
        LOBYTE(v6) = *(_BYTE *)(v3 + 32);
        v7 = *(_QWORD *)(v3 + 40);
        v8 = *(unsigned __int8 *)(v3 + 48);
        v9 = *(_BYTE *)(v3 + 49);
        goto LABEL_8;
      }
    }
    v9 = *v5;
    LOBYTE(v8) = *(v5 - 1);
    v7 = *(_QWORD *)(v5 - 9);
  }
  else
  {
    v7 = 0;
    v9 = 0;
    LOBYTE(v8) = 1;
    LOBYTE(v6) = 2;
  }
LABEL_8:
  *(_BYTE *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v8;
  *(_BYTE *)(a2 + 17) = v9;
  return result;
}

uint64_t type metadata accessor for ArtworkLoaderConfig()
{
  return objc_opt_self();
}

uint64_t sub_1D81DAF30@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1D81DAF5C();
  *a1 = result;
  return result;
}

uint64_t sub_1D81DAF5C()
{
  unint64_t v0;

  v0 = sub_1D8215A00();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA)
    return 10;
  else
    return v0;
}

uint64_t sub_1D81DAFA4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1D81DAFD0();
  *a1 = result;
  return result;
}

uint64_t sub_1D81DAFD0()
{
  unint64_t v0;

  v0 = sub_1D8215A00();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t sub_1D81DB018(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v3);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  swift_beginAccess();
  sub_1D81E1C08(v6, (uint64_t)v5, &qword_1EDA1C180);
  swift_beginAccess();
  sub_1D81E2430(a1, v6, &qword_1EDA1C180);
  swift_endAccess();
  sub_1D81E1EA0((uint64_t)v5);
  sub_1D81D8B6C(a1, &qword_1EDA1C180);
  return sub_1D81D8B6C((uint64_t)v5, &qword_1EDA1C180);
}

uint64_t Artwork.Style.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1D8215A00();
  result = swift_bridgeObjectRelease();
  v4 = 7;
  if (v2 < 7)
    v4 = v2;
  *a1 = v4;
  return result;
}

void _GLOBAL__sub_I_NSLocale_AMPICUExtensions_mm()
{
  void *v0;
  _QWORD v1[5];
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D82AA6D0]();
  v1[0] = AMPICUFormattingLengthVariant;
  v1[1] = AMPICUFormattingLengthStandAlone;
  v2[0] = AMPICUFormattingLengthStandard;
  v2[1] = AMPICUFormattingLengthMenu;
  v1[2] = AMPICUFormattingLengthMenu;
  v1[3] = AMPICUFormattingLengthLong;
  v2[2] = AMPICUFormattingLengthLong;
  v2[3] = AMPICUFormattingLengthStandard;
  v1[4] = AMPICUFormattingLengthShort;
  v2[4] = AMPICUFormattingLengthStandard;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 5);
  AMPICUFormattingLengthFallbacks = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v0);
}

id ArtworkView.frame.setter(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_class *ObjectType;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v22;
  objc_super v23;
  objc_super v24;

  ObjectType = (objc_class *)swift_getObjectType();
  v24.receiver = v4;
  v24.super_class = ObjectType;
  objc_msgSendSuper2(&v24, sel_frame);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v23.receiver = v4;
  v23.super_class = ObjectType;
  objc_msgSendSuper2(&v23, sel_frame);
  if (v19 != a3 || v18 != a4)
    *((_BYTE *)v4 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid) = 1;
  v22.receiver = v4;
  v22.super_class = ObjectType;
  objc_msgSendSuper2(&v22, sel_setFrame_, a1, a2, a3, a4);
  return sub_1D81DB83C(v11, v13, v15, v17);
}

id sub_1D81DB83C(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v8;
  id result;
  double *v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = &v4[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_frameUpdatesImageSize];
  result = (id)swift_beginAccess();
  if (*v8 == 1)
  {
    if ((v10 = (double *)&v4[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize],
          result = (id)swift_beginAccess(),
          v11 = *v10,
          v12 = v10[1],
          *v10 == 0.0)
      && v12 == 0.0
      || (v11 == a3 ? (v13 = v12 == a4) : (v13 = 0),
          v13 || v4[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_updatingFrameForSymbolSizeChange] == 1))
    {
      v19.receiver = v4;
      v19.super_class = ObjectType;
      result = objc_msgSendSuper2(&v19, sel_frame, v11);
      v15 = *v10;
      v16 = v10[1];
      *v10 = v17;
      v10[1] = v14;
      if (v17 != v15 || v14 != v16)
      {
        v4[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = 1;
        result = objc_msgSend(v4, sel_setNeedsLayout);
      }
    }
  }
  v4[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_updatingFrameForSymbolSizeChange] = 0;
  return result;
}

void sub_1D81DB984()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  __objc2_class **p_superclass;
  uint64_t v20;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  objc_super v57;

  v57.receiver = v0;
  v57.super_class = (Class)type metadata accessor for ShadowView();
  objc_msgSendSuper2(&v57, sel_layoutSubviews);
  v1 = &v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
  swift_beginAccess();
  if (*(_QWORD *)v1)
  {
    v2 = objc_msgSend(v0, sel_layer);
    v3 = objc_msgSend(v2, sel_shadowPath);

    v4 = v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle];
    objc_msgSend(v0, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = *(double *)&v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius];
    v14 = (id)objc_opt_self();
    if (v13 >= COERCE_DOUBLE(1))
    {
      if ((v4 & 1) != 0)
      {
        v14 = objc_msgSend(v14, sel__bezierPathWithArcRoundedRect_cornerRadius_, v6, v8, v10, v12, v13);
        v16 = v14;
        if (v14)
          goto LABEL_9;
        __break(1u);
      }
      v15 = objc_msgSend(v14, sel_bezierPathWithRoundedRect_byRoundingCorners_cornerRadii_, -1, v6, v8, v10, v12, v13, v13);
    }
    else
    {
      v15 = objc_msgSend(v14, sel_bezierPathWithRect_, v6, v8, v10, v12);
    }
    v16 = v15;
LABEL_9:
    v17 = objc_msgSend(v16, sel_CGPath);

    v18 = &v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange];
    swift_beginAccess();
    p_superclass = &OBJC_METACLASS___AMPLanguageAwareTextStorage.superclass;
    if ((*v18 & 1) == 0)
      goto LABEL_22;
    objc_msgSend(v0, sel_bounds);
    if ((v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds + 32] & 1) == 0
      && CGRectEqualToRect(*(CGRect *)&v20, *(CGRect *)&v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds]))
    {
      goto LABEL_22;
    }
    v24 = objc_msgSend(v0, sel_layer);
    v25 = (void *)sub_1D82156AC();
    v26 = objc_msgSend(v24, sel_animationForKey_, v25);

    if (v26)
      goto LABEL_22;
    v27 = objc_msgSend(v0, sel_layer);
    v28 = (void *)sub_1D82156AC();
    v29 = objc_msgSend(v27, sel_animationForKey_, v28);

    if (v29)
    {
      objc_opt_self();
      v30 = swift_dynamicCastObjCClass();
      if (v30)
      {
        v31 = (void *)v30;
        v32 = (void *)sub_1D82156AC();
        v33 = objc_msgSend((id)objc_opt_self(), sel_animationWithKeyPath_, v32);

        v34 = v33;
        objc_msgSend(v31, sel_duration);
        objc_msgSend(v34, sel_setDuration_);

        v35 = v34;
        v36 = objc_msgSend(v31, sel_timingFunction);
        objc_msgSend(v35, sel_setTimingFunction_, v36);

        objc_msgSend(v35, sel_setFromValue_, v3);
        objc_msgSend(v35, sel_setToValue_, v17);
        objc_msgSend(v31, sel_mass);
        objc_msgSend(v35, sel_setMass_);
        objc_msgSend(v31, sel_stiffness);
        objc_msgSend(v35, sel_setStiffness_);
        objc_msgSend(v31, sel_damping);
        objc_msgSend(v35, sel_setDamping_);
        objc_msgSend(v31, sel_initialVelocity);
        objc_msgSend(v35, sel_setInitialVelocity_);
        v37 = objc_msgSend(v0, sel_layer);
        v38 = sub_1D82156AC();
        objc_msgSend(v37, sel_addAnimation_forKey_, v35, v38);
        p_superclass = (__objc2_class **)(&OBJC_METACLASS___AMPLanguageAwareTextStorage + 8);
        goto LABEL_20;
      }

      p_superclass = &OBJC_METACLASS___AMPLanguageAwareTextStorage.superclass;
    }
    v39 = objc_msgSend(v0, sel_layer);
    v40 = (void *)sub_1D82156AC();
    v29 = objc_msgSend(v39, sel_animationForKey_, v40);

    if (!v29)
    {
LABEL_22:
      v47 = objc_msgSend(v0, sel_layer);
      objc_msgSend(v47, sel_setShadowPath_, v17);

      objc_msgSend(v0, sel_bounds);
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;

      v56 = (char *)p_superclass[62] + (_QWORD)v0;
      *(_QWORD *)v56 = v49;
      *((_QWORD *)v56 + 1) = v51;
      *((_QWORD *)v56 + 2) = v53;
      *((_QWORD *)v56 + 3) = v55;
      v56[32] = 0;
      return;
    }
    objc_opt_self();
    v41 = swift_dynamicCastObjCClass();
    if (!v41)
    {
LABEL_21:

      goto LABEL_22;
    }
    v42 = (void *)v41;
    v43 = (void *)sub_1D82156AC();
    v44 = objc_msgSend((id)objc_opt_self(), sel_animationWithKeyPath_, v43);

    v45 = v44;
    objc_msgSend(v42, sel_duration);
    objc_msgSend(v45, sel_setDuration_);

    v35 = v45;
    v46 = objc_msgSend(v42, sel_timingFunction);
    objc_msgSend(v35, sel_setTimingFunction_, v46);

    objc_msgSend(v35, sel_setFromValue_, v3);
    objc_msgSend(v35, sel_setToValue_, v17);
    v37 = objc_msgSend(v0, sel_layer);
    v38 = sub_1D82156AC();
    objc_msgSend(v37, sel_addAnimation_forKey_, v35, v38);
LABEL_20:

    v29 = (id)v38;
    goto LABEL_21;
  }
}

uint64_t type metadata accessor for ShadowView()
{
  return objc_opt_self();
}

Swift::Void __swiftcall ArtworkView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  void *v1;
  Class isa;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  objc_super v12;

  isa = a1.value.super.isa;
  v12.receiver = v1;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_traitCollectionDidChange_, isa);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!isa)
  {

    goto LABEL_9;
  }
  v5 = -[objc_class preferredContentSizeCategory](isa, sel_preferredContentSizeCategory);
  v6 = sub_1D82156D0();
  v8 = v7;
  if (v6 == sub_1D82156D0() && v8 == v9)
  {

    swift_bridgeObjectRelease_n();
    return;
  }
  v11 = sub_1D8215A3C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
LABEL_9:
    sub_1D81DE3F8(0);
}

uint64_t Artwork.Format.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1D8215A00();
  result = swift_bridgeObjectRelease();
  v4 = 4;
  if (v2 < 4)
    v4 = v2;
  *a1 = v4;
  return result;
}

void sub_1D81DC8B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

char *static ArtworkView.iconArtworkView.getter()
{
  objc_class *v0;
  char *v1;
  char *v2;

  v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v2 = &v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style];
  swift_beginAccess();
  *v2 = 1;
  sub_1D81DCECC();
  return v1;
}

char *ArtworkView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  double *v18;
  id v19;
  id v20;
  char *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  objc_super v30;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView] = 0;
  v10 = &v4[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadow];
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v11 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor;
  v12 = qword_1EDA1C2B8;
  v13 = v4;
  if (v12 != -1)
    swift_once();
  v14 = (void *)qword_1EDA1BCF8;
  *(_QWORD *)&v13[v11] = qword_1EDA1BCF8;
  *(_QWORD *)&v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_placeholderColor] = v14;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_updatingFrameForSymbolSizeChange] = 0;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_frameUpdatesImageSize] = 1;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_clipImageToBounds] = 0;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shouldSymbolImageSelfSize] = 0;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_setImageDisablesAnimations] = 1;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = 0;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isStyleInvalid] = 0;
  v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor] = 0;
  v15 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v16 = v14;
  v17 = objc_msgSend(v15, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView] = v17;
  v18 = (double *)&v13[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize];
  *v18 = a3;
  v18[1] = a4;

  v30.receiver = v13;
  v30.super_class = ObjectType;
  v19 = objc_msgSendSuper2(&v30, sel_initWithFrame_, a1, a2, a3, a4);
  v20 = objc_allocWithZone((Class)type metadata accessor for ShadowView());
  v21 = (char *)v19;
  v22 = objc_msgSend(v20, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v23 = (void *)qword_1EDA1BCF8;
  v24 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor;
  v25 = *(void **)&v21[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor];
  *(_QWORD *)&v21[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor] = qword_1EDA1BCF8;
  v26 = v23;

  objc_msgSend(v22, sel_setBackgroundColor_, *(_QWORD *)&v21[v24]);
  objc_msgSend(v21, sel_addSubview_, v22);
  v27 = *(void **)&v21[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView];
  *(_QWORD *)&v21[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView] = v22;
  v28 = v22;

  objc_msgSend(v21, sel_setContentMode_, 1);
  objc_msgSend(v21, sel_setClipsToBounds_, 0);
  objc_msgSend(v21, sel_setEdgesInsettingLayoutMarginsFromSafeArea_, 0);
  objc_msgSend(v21, sel_addSubview_, *(_QWORD *)&v21[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView]);

  return v21;
}

id RoundedCornerView.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  objc_super v14;

  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius] = 0;
  v4[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners] = -1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView] = 0;
  v9 = OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor;
  v10 = (void *)objc_opt_self();
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, sel_clearColor);
  *(_QWORD *)&v11[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth] = 0;

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for RoundedCornerView();
  v12 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v12, sel_setClipsToBounds_, 1);
  return v12;
}

void ArtworkView.style.setter(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style);
  swift_beginAccess();
  *v3 = v2;
  sub_1D81DCECC();
}

void sub_1D81DCECC()
{
  uint64_t v0;
  char *v1;
  char v2;

  v1 = (char *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style);
  swift_beginAccess();
  sub_1D81DD248(*v1);
  if ((v2 & 1) == 0)
    __asm { BR              X11 }
}

void sub_1D81DD248(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1D81DD2AC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1D81DD348 + 4 * byte_1D8217B70[a2]))(0x526465646E756F72);
}

uint64_t sub_1D81DD348(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x526465646E756F72 && v1 == 0xEB00000000746365)
    v2 = 1;
  else
    v2 = sub_1D8215A3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1D81DD440@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1D81DD4A8();
  *a1 = result;
  return result;
}

uint64_t sub_1D81DD474@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1D81DD4A8();
  *a1 = result;
  return result;
}

uint64_t sub_1D81DD4A8()
{
  unint64_t v0;

  v0 = sub_1D8215A00();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

void sub_1D81DD4EC()
{
  uint64_t v0;

  sub_1D81DD504(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(unsigned __int8 *)(v0 + 72));
}

void sub_1D81DD504(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  int v28;
  void *v29;
  double v30;
  double v31;
  double v33;
  uint64_t v35;
  id v36;
  BOOL v37;
  BOOL *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  BOOL *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  BOOL *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  BOOL *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  _QWORD *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _QWORD *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t);
  uint64_t v77;
  BOOL *v78;
  uint64_t v79;
  uint64_t v80;
  BOOL *v81;
  int v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  char v86[32];
  void *v87;
  _OWORD v88[2];
  __int128 aBlock;
  __int128 v90;
  uint64_t (*v91)();
  _QWORD *v92;
  __int128 v93;
  uint64_t v94;

  v82 = a8;
  v77 = a5;
  v14 = sub_1D82155D4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v81 = (BOOL *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = sub_1D82155E0();
  v79 = *(_QWORD *)(v80 - 8);
  MEMORY[0x1E0C80A78](v80);
  v78 = (BOOL *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = a1;
  v18 = *(void **)(a1 + 16);
  sub_1D81DDC44();
  v20 = objc_msgSend(v18, sel_cachedResourcesForCacheKey_, v19);
  v21 = swift_unknownObjectRelease();
  if (v20)
  {
    v69 = v15;
    v71 = v18;
    v70 = v14;
    v75 = a4;
    v76 = a3;
    v72 = a6;
    v73 = a7;
    v22 = sub_1D8215778();

    v23 = *(double *)(a2 + 32);
    v24 = *(double *)(a2 + 40);
    v74 = a2;
    v25 = *(_QWORD *)(v22 + 16);
    v85 = v22;
    swift_bridgeObjectRetain();
    v84 = 0;
    v26 = 0;
    v27 = 1.79769313e308;
    while (1)
    {
      if (v26 == v25)
      {
        aBlock = 0u;
        v90 = 0u;
        v26 = v25;
      }
      else
      {
        if (v26 >= *(_QWORD *)(v85 + 16))
        {
          __break(1u);
          return;
        }
        sub_1D81E5848(v22 + 32 + 32 * v26++, (uint64_t)&aBlock);
      }
      sub_1D82059FC((uint64_t)&aBlock, (uint64_t)&v93, &qword_1EDA1C290);
      if (!v94)
        break;
      sub_1D8205A44(&v93, v88);
      sub_1D81E5848((uint64_t)v88, (uint64_t)v86);
      sub_1D81D898C(0, &qword_1EDA1BAB0);
      v28 = swift_dynamicCast();
      v29 = v87;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
      if (v28 && v29)
      {
        objc_msgSend(v29, sel_size);
        if (v30 == v23 && v31 == v24)
        {
          swift_bridgeObjectRelease();

          swift_beginAccess();
          if (swift_weakLoadStrong())
          {
            v45 = v77 == 2;
            v46 = v78;
            *v78 = v77 == 2;
            v47 = v79;
            v48 = v80;
            (*(void (**)(BOOL *, _QWORD, uint64_t))(v79 + 104))(v46, *MEMORY[0x1E0D40BC8], v80);
            v49 = v29;
            sub_1D82155F8();
            (*(void (**)(BOOL *, uint64_t))(v47 + 8))(v46, v48);
            v50 = v81;
            *v81 = v45;
            v51 = v69;
            v52 = v70;
            (*(void (**)(BOOL *, _QWORD, uint64_t))(v69 + 104))(v50, *MEMORY[0x1E0D40BA0], v70);
            sub_1D82155EC();
            swift_release();
            (*(void (**)(BOOL *, uint64_t))(v51 + 8))(v50, v52);
          }
          else
          {
            v61 = v29;
          }
          v62 = v74;
          v63 = v73;
          v64 = v72;
          v65 = objc_msgSend(v71, sel_notificationQueue);
          v66 = (_QWORD *)swift_allocObject();
          v66[2] = v64;
          v66[3] = v63;
          v66[4] = v29;
          v66[5] = v62;
          v91 = sub_1D8205A94;
          v92 = v66;
          *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
          *((_QWORD *)&aBlock + 1) = 1107296256;
          *(_QWORD *)&v90 = sub_1D81D7A68;
          *((_QWORD *)&v90 + 1) = &block_descriptor_82;
          v67 = _Block_copy(&aBlock);
          v68 = v29;
          sub_1D81E3020(v64);
          swift_retain();
          swift_release();
          objc_msgSend(v65, sel_addOperationWithBlock_, v67);
          _Block_release(v67);
          swift_bridgeObjectRelease();

          return;
        }
        v33 = vabdd_f64(v30, v23);
        if (vabdd_f64(v30 / v31, v23 / v24) < 0.01 && v33 < v27)
        {

          v84 = v29;
          v27 = v33;
        }
        else
        {

        }
      }
    }
    v35 = swift_bridgeObjectRelease();
    v36 = v84;
    if (v84 && (v82 & 1) != 0)
    {
      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        v37 = v77 == 2;
        v38 = v78;
        *v78 = v77 == 2;
        v39 = v79;
        v40 = v80;
        (*(void (**)(BOOL *, _QWORD, uint64_t))(v79 + 104))(v38, *MEMORY[0x1E0D40BC8], v80);
        v41 = v36;
        sub_1D82155F8();
        (*(void (**)(BOOL *, uint64_t))(v39 + 8))(v38, v40);
        v42 = v81;
        *v81 = v37;
        v43 = v69;
        v44 = v70;
        (*(void (**)(BOOL *, _QWORD, uint64_t))(v69 + 104))(v42, *MEMORY[0x1E0D40BA0], v70);
        sub_1D82155EC();
        swift_release();
        (*(void (**)(BOOL *, uint64_t))(v43 + 8))(v42, v44);
      }
      else
      {
        v53 = v36;
      }
      v54 = v74;
      v55 = v73;
      v56 = v72;
      v57 = objc_msgSend(v71, sel_notificationQueue);
      v58 = (_QWORD *)swift_allocObject();
      v58[2] = v56;
      v58[3] = v55;
      v58[4] = v36;
      v58[5] = v54;
      v91 = sub_1D8205AE8;
      v92 = v58;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v90 = sub_1D81D7A68;
      *((_QWORD *)&v90 + 1) = &block_descriptor_76;
      v59 = _Block_copy(&aBlock);
      sub_1D81E3020(v56);
      swift_retain();
      v60 = v36;
      swift_release();
      objc_msgSend(v57, sel_addOperationWithBlock_, v59);
      _Block_release(v59);

    }
    v76(v35);
    swift_bridgeObjectRelease();

  }
  else
  {
    a3(v21);
  }
}

void sub_1D81DDC44()
{
  uint64_t inited;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D8219290;
  *(_BYTE *)(inited + 32) = 2;
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 40) = sub_1D81E0504();
  *(_QWORD *)(inited + 48) = v2;
  *(_BYTE *)(inited + 56) = 3;
  __asm { BR              X12 }
}

uint64_t sub_1D81DDCCC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 64) = 1734701162;
  *(_QWORD *)(v0 + 72) = 0xE400000000000000;
  v1 = sub_1D81E0070(v0);
  Artwork.URLTemplate.makeString(withSubstitutions:)((Swift::OpaquePointer)v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = sub_1D82156AC();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_1D81DDD54()
{
  uint64_t *v0;

  sub_1D81E5884(v0[2], v0[3], v0[4], v0[5], (uint64_t)(v0 + 6), v0[11]);
}

uint64_t sub_1D81DDD68()
{
  uint64_t v0;

  return sub_1D81DDD78(*(_QWORD *)(v0 + 16), v0 + 24, *(_BYTE *)(v0 + 64));
}

uint64_t sub_1D81DDD78(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v6;
  unint64_t v7;
  char v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = (uint64_t *)(a1 + 32);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v7 = sub_1D81E5818(a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return swift_endAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v6;
  v13 = *v6;
  *v6 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_1D8204F74();
    v10 = v13;
  }
  sub_1D81E610C(*(_QWORD *)(v10 + 48) + 40 * v7);
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 24 * v7);
  sub_1D8204A1C(v7, v10);
  *v6 = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  if ((a3 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 16), sel_setReason_forRequestWithKey_, 1, v11);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D81DDEA8()
{
  uint64_t *v0;

  return sub_1D81DDEB8(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_1D81DDEB8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  void (*v11)(uint64_t *, char *, _QWORD *, uint64_t *);
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD v15[2];

  v5 = *(_QWORD *)(result + 16);
  if (v5)
  {
    v10 = swift_bridgeObjectRetain() + 40;
    do
    {
      v11 = *(void (**)(uint64_t *, char *, _QWORD *, uint64_t *))(v10 - 8);
      v15[0] = a3;
      v15[1] = a4;
      v14 = a2;
      v13 = 0;
      v12 = a5;
      swift_retain();
      swift_bridgeObjectRetain();
      v11(&v14, &v13, v15, &v12);
      swift_bridgeObjectRelease();
      swift_release();
      v10 += 16;
      --v5;
    }
    while (v5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1D81DDF94(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v4 + 16))(*a1, *a2, a3, *a4);
}

uint64_t sub_1D81DDFC0(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t *, char *, uint64_t, uint64_t *);
  uint64_t v7;
  char v8;
  uint64_t v9;

  v5 = *(uint64_t (**)(uint64_t *, char *, uint64_t, uint64_t *))(v4 + 16);
  v9 = a1;
  v8 = a2;
  v7 = a4;
  return v5(&v9, &v8, a3, &v7);
}

uint64_t sub_1D81DE004(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_1D81DE010(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_1D81DE010(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t result;

  v11 = a5 + 16;
  swift_beginAccess();
  result = MEMORY[0x1D82AAB98](v11);
  if (result)
  {
    (*(void (**)(uint64_t, BOOL, uint64_t, uint64_t))(a7 + 40))(a1, (a2 & 1) == 0, a6, a7);
    return swift_unknownObjectRelease();
  }
  return result;
}

void ArtworkView.image.setter(UIImage_optional a1, Swift::Bool a2)
{
  Class isa;

  isa = a1.value.super.isa;
  a1.is_nil = 0;
  ArtworkView.setImage(image:animated:)(a1, a2);

}

Swift::Void __swiftcall ArtworkView.setImage(image:animated:)(UIImage_optional image, Swift::Bool animated)
{
  char *v2;
  Swift::Bool is_nil;
  Class isa;
  char *v5;
  id v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  is_nil = image.is_nil;
  isa = image.value.super.isa;
  v5 = &v2[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_setImageDisablesAnimations];
  swift_beginAccess();
  if (*v5 == 1)
  {
    v6 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView], sel_layer);
    objc_msgSend(v6, sel_removeAllAnimations);

  }
  if (isa)
  {
    v7 = &v2[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor];
    swift_beginAccess();
    v8 = *(_QWORD *)v7;
    v9 = isa;
    v10 = v9;
    if (v8)
      v11 = (objc_class *)-[objc_class imageWithRenderingMode:](v9, sel_imageWithRenderingMode_, 2);
    else
      v11 = v9;
    v13 = v11;
    v14 = *(void **)&v2[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView];
    if (is_nil)
    {
      objc_msgSend(v14, sel_setAlpha_, 0.0);
      objc_msgSend(v14, sel_setImage_, v13);
      objc_msgSend(v14, sel_setHidden_, 0);
      sub_1D81DE3F8(0);
      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC36D8]), sel_init);
      v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F38]), sel_initWithDuration_timingParameters_, v15, 0.15);

      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = v2;
      v28 = sub_1D81D7A94;
      v29 = v17;
      v18 = MEMORY[0x1E0C809B0];
      v24 = MEMORY[0x1E0C809B0];
      v25 = 1107296256;
      v26 = sub_1D81D7A68;
      v27 = &block_descriptor_3;
      v19 = _Block_copy(&v24);
      v20 = v2;
      swift_release();
      objc_msgSend(v16, sel_addAnimations_, v19);
      _Block_release(v19);
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = v20;
      v28 = sub_1D81DE8B8;
      v29 = v21;
      v24 = v18;
      v25 = 1107296256;
      v26 = sub_1D81DE87C;
      v27 = &block_descriptor_6;
      v22 = _Block_copy(&v24);
      v23 = v20;
      swift_release();
      objc_msgSend(v16, sel_addCompletion_, v22);
      _Block_release(v22);
      objc_msgSend(v16, sel_startAnimation);

    }
    else
    {
      objc_msgSend(v14, sel_setImage_, v11);
      sub_1D81DE3F8(0);
      objc_msgSend(v14, sel_setHidden_, 0);
      sub_1D81DE9E4();
    }

  }
  else
  {
    v12 = *(void **)&v2[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView];
    objc_msgSend(v12, sel_setImage_, 0);
    objc_msgSend(v12, sel_setHidden_, 1);
    sub_1D81DE9E4();
  }
}

void sub_1D81DE3F8(void *a1)
{
  _BYTE *v1;
  objc_class *ObjectType;
  _BYTE *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  objc_super v34;
  objc_super v35;
  objc_super v36;
  objc_super v37;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shouldSymbolImageSelfSize];
  swift_beginAccess();
  if (*v4 == 1)
  {
    v5 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView];
    v6 = objc_msgSend(v5, sel_image);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, sel_isSymbolImage);

      if (v8)
      {
        v9 = objc_msgSend(v5, sel_image);
        if (v9)
        {
          v10 = v9;
          if (a1)
          {
            v11 = a1;
          }
          else
          {
            v12 = objc_msgSend(v5, sel_preferredSymbolConfiguration);
            if (!v12)
            {
              v11 = v10;
LABEL_15:

              return;
            }
            v11 = v12;
          }
          v13 = a1;
          v14 = objc_msgSend(v10, sel_imageWithConfiguration_, v11);
          objc_msgSend(v14, sel_size);
          v16 = v15;
          v18 = v17;

          v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_updatingFrameForSymbolSizeChange] = 1;
          v37.receiver = v1;
          v37.super_class = ObjectType;
          objc_msgSendSuper2(&v37, sel_frame);
          v20 = v19;
          v22 = v21;
          v36.receiver = v1;
          v36.super_class = ObjectType;
          objc_msgSendSuper2(&v36, sel_frame);
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v35.receiver = v1;
          v35.super_class = ObjectType;
          objc_msgSendSuper2(&v35, sel_frame);
          if (v32 != v16 || v31 != v18)
            v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = 1;
          v34.receiver = v1;
          v34.super_class = ObjectType;
          objc_msgSendSuper2(&v34, sel_setFrame_, v20, v22, v16, v18);
          sub_1D81DB83C(v24, v26, v28, v30);

          goto LABEL_15;
        }
      }
    }
  }
}

void sub_1D81DE610(UIImage_optional image, Swift::Bool a2)
{
  uint64_t v2;
  objc_class *isa;
  id v4;
  UIImage_optional v5;

  isa = image.value.super.isa;
  if (image.is_nil)
  {
    v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                               + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image));
    if (!v4)
    {
      v5.is_nil = 1;
      goto LABEL_6;
    }

  }
  v5.is_nil = 0;
LABEL_6:
  v5.value.super.isa = isa;
  ArtworkView.setImage(image:animated:)(v5, a2);
}

uint64_t sub_1D81DE668@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Artwork.Variant.init(deserializing:using:)(a1, a2, a3);
}

uint64_t Artwork.Variant.init(deserializing:using:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  int v19;
  unsigned __int8 v20;

  v18 = a2;
  v5 = sub_1D8215538();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v18 - v10;
  sub_1D8215544();
  sub_1D81DE838();
  sub_1D82154E4();
  v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v11, v5);
  v19 = v20;
  sub_1D8215544();
  v13 = sub_1D82154FC();
  LOBYTE(v6) = v14;
  v12(v11, v5);
  sub_1D8215544();
  v15 = sub_1D8215508();
  v16 = sub_1D821558C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v18, v16);
  v12(a1, v5);
  result = ((uint64_t (*)(char *, uint64_t))v12)(v9, v5);
  *(_BYTE *)a3 = v19;
  *(_QWORD *)(a3 + 8) = v13;
  *(_BYTE *)(a3 + 16) = v6 & 1;
  *(_BYTE *)(a3 + 17) = v15 & 1;
  return result;
}

unint64_t sub_1D81DE838()
{
  unint64_t result;

  result = qword_1EDA1C018;
  if (!qword_1EDA1C018)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Format, &type metadata for Artwork.Format);
    atomic_store(result, (unint64_t *)&qword_1EDA1C018);
  }
  return result;
}

uint64_t sub_1D81DE87C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_1D81DE8B8()
{
  sub_1D81DE9E4();
}

void ArtworkView.backgroundColor.setter(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = v1;
  if (a1)
  {
    v3 = *(void **)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor) = a1;
    v4 = a1;
    sub_1D81DEF94();
    v5 = v4;
    LOBYTE(v4) = sub_1D82158A4();

    if ((v4 & 1) == 0)
      sub_1D81DE9E4();

    v7 = v5;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    v5 = *(id *)(v2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor) = v6;
    sub_1D81DEF94();
    v7 = v6;
    LOBYTE(v6) = sub_1D82158A4();

    if ((v6 & 1) == 0)
      sub_1D81DE9E4();
  }

}

void sub_1D81DE9E4()
{
  char *v0;
  char *v1;
  char *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  double *v14;
  double v15;
  char *v16;
  char v17;
  id v18;
  char *v19;
  char *v20;
  id v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  id v28;

  v1 = v0;
  v2 = &v0[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadow];
  swift_beginAccess();
  if (*(_QWORD *)v2
    || (v3 = *(void **)&v0[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView],
        (objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView], sel_isHidden) & 1) != 0)
    || (v4 = objc_msgSend(v3, sel_image), v4, !v4))
  {
    v6 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView;
    v7 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView];
    if (v7)
    {
      v8 = *(char **)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView];
    }
    else
    {
      type metadata accessor for ShadowView();
      v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
      v10 = *(void **)&v1[v6];
      v11 = v9;
      if (v10)
      {
        objc_msgSend(v10, sel_removeFromSuperview);
        v12 = *(void **)&v1[v6];
      }
      else
      {
        v12 = 0;
      }
      *(_QWORD *)&v1[v6] = v9;
      v8 = (char *)v9;

      v13 = *(_QWORD *)&v1[v6];
      if (v13)
        objc_msgSend(v1, sel_insertSubview_belowSubview_, v13, *(_QWORD *)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView]);

    }
    v14 = (double *)&v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius];
    swift_beginAccess();
    v15 = *v14;
    v16 = &v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle];
    swift_beginAccess();
    v17 = *v16;
    *(double *)&v8[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius] = v15;
    v8[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle] = v17;
    v18 = v7;
    CornerStyle.apply(withRadius:to:)(v8, v15);
    v19 = &v8[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds];
    *(_OWORD *)v19 = 0u;
    *((_OWORD *)v19 + 1) = 0u;
    v19[32] = 1;
    v20 = &v8[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
    swift_beginAccess();
    if (*(_QWORD *)v20)
      objc_msgSend(v8, sel_setNeedsLayout);
    v21 = objc_msgSend(v8, sel_layer);
    v22 = &v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners];
    swift_beginAccess();
    v23 = *(_QWORD *)v22;
    if ((*(_QWORD *)v22 & 1) != 0)
    {
      if ((v23 & 2) != 0)
      {
        v24 = 3;
        if ((v23 & 8) == 0)
        {
LABEL_28:
          if ((v23 & 4) == 0 || (v24 & 4) != 0)
            goto LABEL_31;
LABEL_30:
          v24 |= 4uLL;
LABEL_31:
          objc_msgSend(v21, sel_setMaskedCorners_, v24);

          objc_msgSend(v8, sel_setBackgroundColor_, *(_QWORD *)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor]);
          v25 = *(void **)v20;
          v26 = *(_OWORD *)v2;
          v27 = *((_OWORD *)v2 + 1);
          *(_OWORD *)v20 = *(_OWORD *)v2;
          *((_OWORD *)v20 + 1) = v27;
          v28 = (id)v26;

          sub_1D81DED2C();
          objc_msgSend(v8, sel_setHidden_, 0);

          return;
        }
        goto LABEL_27;
      }
      v24 = 1;
      if ((v23 & 8) != 0)
        goto LABEL_27;
    }
    else
    {
      if ((v23 & 2) != 0)
      {
        v24 = 2;
        if ((v23 & 8) == 0)
          goto LABEL_28;
        goto LABEL_27;
      }
      v24 = 0;
      if ((v23 & 8) != 0)
      {
LABEL_27:
        v24 |= 8uLL;
        goto LABEL_28;
      }
    }
    if ((v23 & 4) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  v5 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView];
  if (v5)
    objc_msgSend(v5, sel_setHidden_, 1);
}

id sub_1D81DED2C()
{
  char *v0;
  double *v1;
  double v2;
  double v3;
  double v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  char *v17;

  v1 = (double *)&v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
  swift_beginAccess();
  if (*(_QWORD *)v1)
  {
    v3 = v1[2];
    v2 = v1[3];
    v4 = v1[1];
    v5 = *(id *)v1;
    v6 = objc_msgSend(v0, sel_layer);
    v7 = objc_msgSend(v5, sel_CGColor);
    objc_msgSend(v6, sel_setShadowColor_, v7);

    v8 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v8, sel_setShadowRadius_, v4);

    v9 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v9, sel_setShadowOffset_, v3, v2);

    v10 = objc_msgSend(v0, sel_layer);
    LODWORD(v11) = 1.0;
    objc_msgSend(v10, sel_setShadowOpacity_, v11);

    objc_msgSend(v0, sel_setClipsToBounds_, 0);
  }
  else
  {
    v12 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v12, sel_setShadowColor_, 0);

    v13 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v13, sel_setShadowRadius_, 0.0);

    v14 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v14, sel_setShadowOffset_, 0.0, 0.0);

    v15 = objc_msgSend(v0, sel_layer);
    LODWORD(v16) = 0;
    objc_msgSend(v15, sel_setShadowOpacity_, v16);

    objc_msgSend(v0, sel_setClipsToBounds_, 1);
  }
  v17 = &v0[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds];
  *(_OWORD *)v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  v17[32] = 1;
  return objc_msgSend(v0, sel_setNeedsLayout);
}

unint64_t sub_1D81DEF94()
{
  unint64_t result;

  result = qword_1EDA1C250;
  if (!qword_1EDA1C250)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDA1C250);
  }
  return result;
}

Swift::Void __swiftcall ArtworkView.layoutSubviews()()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  UIViewContentMode v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  char *v12;
  double *v13;
  double height;
  double width;
  CGSize v16;
  double v17;
  double v18;
  uint64_t v19;
  char *v20;
  double *v21;
  double v22;
  double v23;
  char *v24;
  double v25;
  double v26;
  char *v27;
  id v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  uint64_t v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  char v61[24];
  objc_super v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = (UIViewContentMode)objc_msgSend(v0, sel_contentMode);
  objc_msgSend(v0, sel_bounds);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = &v0[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_clipImageToBounds];
  swift_beginAccess();
  v13 = (double *)&v0[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize];
  if ((*v12 & 1) != 0)
  {
    swift_beginAccess();
    width = *v13;
    height = v13[1];
  }
  else
  {
    swift_beginAccess();
    v16 = CGSize.fitting(_:mode:)((CGSize)__PAIR128__(*(unint64_t *)&v11, *(unint64_t *)&v9), v3);
    width = v16.width;
    height = v16.height;
  }
  v17 = 0.0;
  v18 = 0.0;
  if ((unint64_t)v3 <= UIViewContentModeBottomRight)
  {
    if (((1 << v3) & 0x7F) != 0)
    {
      v63.origin.x = v5;
      v63.origin.y = v7;
      v63.size.width = v9;
      v63.size.height = v11;
      v18 = CGRectGetMidX(v63) + width * -0.5;
    }
    else if (((1 << v3) & 0x1500) != 0)
    {
      v64.origin.x = v5;
      v64.origin.y = v7;
      v64.size.width = v9;
      v64.size.height = v11;
      v18 = CGRectGetMaxX(v64) - width;
    }
  }
  v59 = v18;
  if ((unint64_t)v3 <= UIViewContentModeBottomRight)
  {
    if (((1 << v3) & 0x19F) != 0)
    {
      v65.origin.x = v5;
      v65.origin.y = v7;
      v65.size.width = v9;
      v65.size.height = v11;
      v17 = CGRectGetMidY(v65) + height * -0.5;
    }
    else if (((1 << v3) & 0x1840) != 0)
    {
      v66.origin.x = v5;
      v66.origin.y = v7;
      v66.size.width = v9;
      v66.size.height = v11;
      v17 = CGRectGetMaxY(v66) - height;
    }
  }
  v19 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isStyleInvalid;
  v60 = v11;
  if ((v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isStyleInvalid] & 1) != 0
    || v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] == 1)
  {
    v20 = &v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style];
    swift_beginAccess();
    if (*v20 == 4)
    {
      v67.origin.x = v59;
      v67.origin.y = v17;
      v67.size.width = width;
      v67.size.height = height;
      CGRectGetWidth(v67);
      v68.origin.x = v59;
      v68.origin.y = v17;
      v68.size.width = width;
      v68.size.height = height;
      CGRectGetHeight(v68);
      Artwork.Style.iconCornerRadius(for:)();
      v61[0] = 0;
      ArtworkView.setCorner(radius:style:)(v61, v26);
      v27 = &v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners];
      swift_beginAccess();
      *(_QWORD *)v27 = 2;
      v28 = objc_msgSend(v1, sel_layer);
      objc_msgSend(v28, sel_setMaskedCorners_, 2);

      sub_1D81E05F8();
      sub_1D820A9F0();
    }
    else
    {
      if (*v20)
      {
        v61[0] = *v20;
        Artwork.Style.iconCornerRadius(for:)();
        v61[0] = (0x44u >> *v20) & 1;
      }
      else
      {
        v21 = (double *)&v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius];
        swift_beginAccess();
        v22 = v11;
        v23 = *v21;
        v24 = &v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle];
        swift_beginAccess();
        v61[0] = *v24;
        v25 = v23;
        v11 = v22;
      }
      ArtworkView.setCorner(radius:style:)(v61, v25);
    }
    v1[v19] = 0;
    v90.origin.x = 0.0;
    v90.origin.y = 0.0;
    v90.size.width = 0.0;
    v90.size.height = 0.0;
    v69.origin.x = v5;
    v69.origin.y = v7;
    v69.size.width = v9;
    v69.size.height = v11;
    v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = CGRectEqualToRect(v69, v90);
  }
  v29 = v17;
  v30 = width;
  v56 = height;
  v62.receiver = v1;
  v62.super_class = ObjectType;
  objc_msgSendSuper2(&v62, sel_layoutSubviews);
  v57 = v5;
  v58 = v7;
  v31 = v9;
  v32 = v3 - 2;
  if (v3 != UIViewContentModeScaleAspectFill)
  {
    if (*v12)
    {
      v31 = v9;
    }
    else
    {
      v5 = v59;
      v7 = v29;
      v31 = width;
    }
    if (*v12)
      v11 = v60;
    else
      v11 = v56;
  }
  v33 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView];
  objc_msgSend(v33, sel_setFrame_, v5, v7, v31, v11);
  v34 = (id *)&v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView];
  swift_beginAccess();
  if (*v34)
    objc_msgSend(*v34, sel_setFrame_, v5, v7, v31, v11);
  v35 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView];
  if (v35)
    objc_msgSend(v35, sel_setFrame_, v5, v7, v31, v11);
  v36 = objc_msgSend(v33, sel_layer);
  objc_msgSend(v36, sel_setAnchorPoint_, 0.5, 0.5);

  switch(v32)
  {
    case 0:
      v37 = objc_msgSend(v33, (SEL)0x1E9DBAE48);
      v82.origin.x = v59;
      v82.origin.y = v29;
      v46 = width;
      v82.size.width = width;
      v82.size.height = v56;
      v47 = 0.0 - CGRectGetMinX(v82);
      v83.origin.x = v59;
      v83.origin.y = v29;
      v83.size.width = v30;
      v83.size.height = v56;
      v55 = v47 / CGRectGetWidth(v83);
      v84.origin.x = v59;
      v84.origin.y = v29;
      v84.size.width = v30;
      v84.size.height = v56;
      v48 = 0.0 - CGRectGetMinY(v84);
      v85.origin.x = v59;
      v85.origin.y = v29;
      v85.size.width = v30;
      v85.size.height = v56;
      v53 = v48 / CGRectGetHeight(v85);
      v86.origin.x = v57;
      v86.origin.y = v58;
      v86.size.width = v9;
      v86.size.height = v60;
      v50 = CGRectGetWidth(v86);
      v87.origin.x = v59;
      v87.origin.y = v29;
      v87.size.width = v46;
      v87.size.height = v56;
      v51 = v50 / CGRectGetWidth(v87);
      v88.origin.x = v57;
      v88.origin.y = v58;
      v88.size.width = v9;
      v88.size.height = v60;
      v49 = CGRectGetHeight(v88);
      v89.origin.x = v59;
      v89.origin.y = v29;
      v89.size.width = v46;
      v89.size.height = v56;
      objc_msgSend(v37, sel_setContentsRect_, v55, v53, v51, v49 / CGRectGetHeight(v89));
      break;
    case 5:
    case 7:
      if ((*v12 & 1) != 0)
        goto LABEL_40;
      goto LABEL_43;
    case 6:
    case 8:
      if ((*v12 & 1) == 0)
        goto LABEL_43;
      goto LABEL_42;
    case 9:
      if (*v12 != 1)
        goto LABEL_43;
LABEL_40:
      v37 = objc_msgSend(v33, sel_layer);
      v70.origin.x = v57;
      v70.origin.y = v58;
      v70.size.width = v9;
      v70.size.height = v60;
      v38 = CGRectGetWidth(v70);
      v71.origin.x = v59;
      v71.origin.y = v29;
      v71.size.width = width;
      v71.size.height = v56;
      v39 = v38 / CGRectGetWidth(v71);
      v72.origin.x = v57;
      v72.origin.y = v58;
      v72.size.width = v9;
      v72.size.height = v60;
      v40 = CGRectGetHeight(v72);
      v73.origin.x = v59;
      v73.origin.y = v29;
      v73.size.width = width;
      v73.size.height = v56;
      objc_msgSend(v37, sel_setContentsRect_, 0.0, 0.0, v39, v40 / CGRectGetHeight(v73));
      break;
    case 10:
      if (*v12 != 1)
        goto LABEL_43;
LABEL_42:
      v37 = objc_msgSend(v33, (SEL)0x1E9DBAE48);
      v74.origin.x = v59;
      v74.origin.y = v29;
      v74.size.width = width;
      v74.size.height = v56;
      v41 = 0.0 - CGRectGetMinX(v74);
      v75.origin.x = v59;
      v75.origin.y = v29;
      v75.size.width = width;
      v75.size.height = v56;
      v54 = v41 / CGRectGetWidth(v75);
      v76.origin.x = v59;
      v76.origin.y = v29;
      v76.size.width = width;
      v76.size.height = v56;
      v42 = 0.0 - CGRectGetMinY(v76);
      v77.origin.x = v59;
      v77.origin.y = v29;
      v77.size.width = width;
      v77.size.height = v56;
      v52 = v42 / CGRectGetHeight(v77);
      v78.origin.x = v57;
      v78.origin.y = v58;
      v78.size.width = v9;
      v78.size.height = v60;
      v43 = CGRectGetWidth(v78);
      v79.origin.x = v59;
      v79.origin.y = v29;
      v79.size.width = width;
      v79.size.height = v56;
      v44 = v43 / CGRectGetWidth(v79);
      v80.origin.x = v57;
      v80.origin.y = v58;
      v80.size.width = v9;
      v80.size.height = v60;
      v45 = CGRectGetHeight(v80);
      v81.origin.x = v59;
      v81.origin.y = v29;
      v81.size.width = width;
      v81.size.height = v56;
      objc_msgSend(v37, sel_setContentsRect_, v54, v52, v44, v45 / CGRectGetHeight(v81));
      break;
    default:
LABEL_43:
      v37 = objc_msgSend(v33, sel_layer);
      objc_msgSend(v37, sel_setContentsRect_, 0.0, 0.0, 1.0, 1.0);
      break;
  }

}

CGSize __swiftcall CGSize.fitting(_:mode:)(CGSize _, UIViewContentMode mode)
{
  double v2;
  double v3;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  BOOL v13;
  CGSize result;

  if (_.width != 0.0 || (width = 0.0, height = 0.0, _.height != 0.0))
  {
    v6 = _.width / v2;
    if ((*(_QWORD *)&v2 & 0x7FFFFFFFFFFFFFFFLL) == 0)
      v6 = 0.0;
    v7 = _.height / v3;
    if ((*(_QWORD *)&v3 & 0x7FFFFFFFFFFFFFFFLL) == 0)
      v7 = 0.0;
    v8 = v7 * v2;
    v9 = v6 * v3;
    if ((unint64_t)(mode - 3) < 0xA || mode == UIViewContentModeScaleAspectFit)
    {
      v10 = v6 < v7;
      if (v6 >= v7)
        width = v8;
      else
        width = _.width;
      if (v10)
        height = v9;
      else
        height = _.height;
    }
    else if (mode == UIViewContentModeScaleAspectFill)
    {
      v13 = v6 < v7;
      if (v6 >= v7)
        width = _.width;
      else
        width = v8;
      if (v13)
        height = _.height;
      else
        height = v9;
    }
    else
    {
      width = _.width;
      height = _.height;
    }
  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

uint64_t type metadata accessor for RoundedCornerView()
{
  return objc_opt_self();
}

void ArtworkView.setCorner(radius:style:)(char *a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BYTE *v6;
  char *v7;
  char *v8;
  char *v9;
  double *v10;
  _BYTE *v11;

  v3 = v2;
  v5 = *a1;
  v6 = *(_BYTE **)(v2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView);
  if (v6)
  {
    *(double *)&v6[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius] = a2;
    v6[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle] = v5;
    v7 = v6;
    CornerStyle.apply(withRadius:to:)(v7, a2);
    v8 = &v7[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds];
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    v8[32] = 1;
    v9 = &v7[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
    swift_beginAccess();
    if (*(_QWORD *)v9)
      objc_msgSend(v7, sel_setNeedsLayout);

  }
  v10 = (double *)(v3 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius);
  swift_beginAccess();
  *v10 = a2;
  v11 = (_BYTE *)(v3 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle);
  swift_beginAccess();
  *v11 = v5;
  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setClipsToBounds_, CornerStyle.apply(withRadius:to:)(*(id *)(v3 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), a2));
  sub_1D81E05F8();
}

void Artwork.Style.iconCornerRadius(for:)()
{
  __asm { BR              X10 }
}

double sub_1D81DFB70(double a1, double a2, double a3)
{
  return ASKHomeScreenIconsGetScaledCornerRadiusForSize(a3, a2);
}

void sub_1D81DFC78(char a1)
{
  char *v1;
  char *v3;
  id v4;
  void *v5;

  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement];
  swift_beginAccess();
  *v3 = a1;
  v4 = objc_msgSend(v1, sel_font);
  if (v4)
  {
    v5 = v4;
    if (!objc_msgSend(v1, sel_lineSpacing)
      && ((*v3 & 1) != 0 || v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] == 1))
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, v5);
    }
    else
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, 0);
    }

  }
  else
  {
    __break(1u);
  }
}

void sub_1D81DFD48(char a1)
{
  _BYTE *v1;
  uint64_t v2;
  id v3;
  void *v4;
  _BYTE *v5;

  v2 = OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText;
  v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] = a1;
  v3 = objc_msgSend(v1, sel_font);
  if (v3)
  {
    v4 = v3;
    if (!objc_msgSend(v1, sel_lineSpacing)
      && ((v5 = &v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement],
           swift_beginAccess(),
           (*v5 & 1) != 0)
       || v1[v2] == 1))
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, v4);
    }
    else
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, 0);
    }

  }
  else
  {
    __break(1u);
  }
}

id sub_1D81DFE14(void *a1, uint64_t a2, SEL *a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return objc_msgSendSuper2(&v5, *a3);
}

uint64_t sub_1D81DFE68()
{
  double *v0;
  double v1;
  double v2;
  double v3;
  uint64_t result;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[5];
  v2 = v0[8];
  v3 = v0[4] * v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF70);
  result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_1D8218A50;
  *(_BYTE *)(result + 32) = 0;
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v5 = result;
  v6 = v1 * v2;
  swift_bridgeObjectRetain();
  result = sub_1D8215A0C();
  *(_QWORD *)(v5 + 40) = result;
  *(_QWORD *)(v5 + 48) = v7;
  *(_BYTE *)(v5 + 56) = 1;
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v6 < 9.22337204e18)
  {
    *(_QWORD *)(v5 + 64) = sub_1D8215A0C();
    *(_QWORD *)(v5 + 72) = v8;
    *(_BYTE *)(v5 + 80) = 2;
    *(_QWORD *)(v5 + 88) = sub_1D81E0504();
    *(_QWORD *)(v5 + 96) = v9;
    *(_BYTE *)(v5 + 104) = 3;
    __asm { BR              X12 }
  }
LABEL_13:
  __break(1u);
  return result;
}

unint64_t sub_1D81E0070(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C260);
  v2 = (_QWORD *)sub_1D82159E8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_BYTE *)v4 - 16);
    v7 = *(v4 - 1);
    v6 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1D81E017C(v5);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    v10 = (_QWORD *)(v2[7] + 16 * result);
    *v10 = v7;
    v10[1] = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

unint64_t sub_1D81E017C(char a1)
{
  uint64_t v2;

  sub_1D8215AB4();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  v2 = sub_1D8215AE4();
  return sub_1D81E01EC(a1, v2);
}

unint64_t sub_1D81E01EC(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    v6 = qword_1D8218F78[a1];
    while (qword_1D8218F78[*(char *)(*(_QWORD *)(v2 + 48) + v4)] != v6)
    {
      v7 = sub_1D8215A3C();
      swift_bridgeObjectRelease_n();
      if ((v7 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

Swift::String __swiftcall Artwork.URLTemplate.makeString(withSubstitutions:)(Swift::OpaquePointer withSubstitutions)
{
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  Swift::String result;

  v3 = *v1;
  v2 = (void *)v1[1];
  v4 = (char *)withSubstitutions._rawValue + 64;
  v5 = 1 << *((_BYTE *)withSubstitutions._rawValue + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *((_QWORD *)withSubstitutions._rawValue + 8);
  v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_5;
    }
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v14 >= v8)
      goto LABEL_21;
    v15 = *(_QWORD *)&v4[8 * v14];
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_21;
      v15 = *(_QWORD *)&v4[8 * v11];
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_21;
        v15 = *(_QWORD *)&v4[8 * v11];
        if (!v15)
          break;
      }
    }
LABEL_20:
    v7 = (v15 - 1) & v15;
LABEL_5:
    sub_1D81E04C0();
    swift_bridgeObjectRetain();
    v3 = sub_1D82158EC();
    v13 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 = swift_bridgeObjectRelease();
    v2 = v13;
  }
  v16 = v14 + 3;
  if (v16 >= v8)
  {
LABEL_21:
    swift_release();
    v9 = v3;
    v10 = v2;
    goto LABEL_24;
  }
  v15 = *(_QWORD *)&v4[8 * v16];
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v8)
      goto LABEL_21;
    v15 = *(_QWORD *)&v4[8 * v11];
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

unint64_t sub_1D81E04C0()
{
  unint64_t result;

  result = qword_1EDA1C1C8;
  if (!qword_1EDA1C1C8)
  {
    result = MEMORY[0x1D82AAACC](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EDA1C1C8);
  }
  return result;
}

uint64_t sub_1D81E0504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if (*(_BYTE *)(v0 + 88) == 1)
  {
    if (*(_BYTE *)(v0 + 89) != 1)
    {
      v1 = *(_QWORD *)(v0 + 48);
      swift_bridgeObjectRetain();
      return v1;
    }
    v3 = *(_QWORD *)(v0 + 48);
    swift_bridgeObjectRetain();
    goto LABEL_5;
  }
  v3 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_1D8215A0C();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(v0 + 89) == 1)
LABEL_5:
    sub_1D8215724();
  return v3;
}

void sub_1D81E05F8()
{
  _QWORD *v0;
  double *v1;
  id *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void **v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  double *v23;
  double v24;
  id v25;

  v1 = (double *)((char *)v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth);
  swift_beginAccess();
  v2 = (id *)((char *)v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView);
  if (*v1 >= COERCE_DOUBLE(1))
  {
    swift_beginAccess();
    v4 = *v2;
    if (*v2)
    {
      v5 = *v2;
    }
    else
    {
      type metadata accessor for BorderView();
      v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
      v7 = v6;
      v8 = *v2;
      if (*v2)
      {
        v9 = v6;
        objc_msgSend(v8, sel_removeFromSuperview);
        v8 = *v2;
      }
      else
      {
        v10 = v6;
      }
      *v2 = v7;
      v5 = v7;

      if (*v2)
        objc_msgSend(v0, sel_addSubview_);

    }
    v11 = (void **)((char *)v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor);
    swift_beginAccess();
    v12 = *v11;
    v13 = v4;
    v14 = v12;
    v15 = objc_msgSend(v5, sel_layer);
    v16 = objc_msgSend(v14, sel_CGColor);
    objc_msgSend(v15, sel_setBorderColor_, v16);

    v17 = *v1;
    v18 = objc_msgSend(v5, sel_layer);
    objc_msgSend(v18, sel_setBorderWidth_, v17);

    v19 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
    v20 = objc_msgSend(v5, sel_layer);
    v21 = v20;
    if ((v19 & 1) != 0)
    {
      if ((v19 & 2) != 0)
      {
        v22 = 3;
        if ((v19 & 8) == 0)
        {
LABEL_27:
          if ((v19 & 4) == 0 || (v22 & 4) != 0)
            goto LABEL_30;
LABEL_29:
          v22 |= 4uLL;
LABEL_30:
          objc_msgSend(v20, sel_setMaskedCorners_, v22);

          swift_beginAccess();
          v23 = (double *)((char *)v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius);
          swift_beginAccess();
          v24 = *v23;
          v25 = v5;
          CornerStyle.apply(withRadius:to:)(v25, v24);

          return;
        }
        goto LABEL_26;
      }
      v22 = 1;
      if ((v19 & 8) != 0)
        goto LABEL_26;
    }
    else
    {
      if ((v19 & 2) != 0)
      {
        v22 = 2;
        if ((v19 & 8) == 0)
          goto LABEL_27;
        goto LABEL_26;
      }
      v22 = 0;
      if ((v19 & 8) != 0)
      {
LABEL_26:
        v22 |= 8uLL;
        goto LABEL_27;
      }
    }
    if ((v19 & 4) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
  swift_beginAccess();
  if (*v2)
  {
    objc_msgSend(*v2, sel_removeFromSuperview);
    v3 = *v2;
  }
  else
  {
    v3 = 0;
  }
  *v2 = 0;

  if (*v2)
    objc_msgSend(v0, sel_addSubview_);
}

BOOL CornerStyle.apply(withRadius:to:)(id a1, double a2)
{
  _BYTE *v2;
  char **v5;
  char **v6;
  id v7;

  if (a2 < COERCE_DOUBLE(1))
  {
    objc_msgSend(a1, sel__setContinuousCornerRadius_, 0.0);
    objc_msgSend(a1, sel__setCornerRadius_, 0.0);
    v7 = objc_msgSend(a1, sel_layer);
    objc_msgSend(v7, sel_setAllowsEdgeAntialiasing_, 0);
  }
  else
  {
    if (*v2)
      v5 = &selRef__setContinuousCornerRadius_;
    else
      v5 = &selRef__setCornerRadius_;
    if (*v2)
      v6 = &selRef__setCornerRadius_;
    else
      v6 = &selRef__setContinuousCornerRadius_;
    objc_msgSend(a1, *v5, 0.0);
    objc_msgSend(a1, *v6, a2);
    v7 = objc_msgSend(a1, sel_layer);
    objc_msgSend(v7, sel_setAllowsEdgeAntialiasing_, 1);
  }

  return a2 >= COERCE_DOUBLE(1);
}

id sub_1D81E0A20(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id result;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  void *v16;
  _OWORD v18[2];
  uint64_t v19;
  objc_super v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v18 - v7 + 16;
  v9 = (objc_class *)type metadata accessor for DynamicTypeLabel();
  v20.receiver = v1;
  v20.super_class = v9;
  result = objc_msgSendSuper2(&v20, sel_setFont_, a1);
  if (a1)
  {
    v11 = a1;
    if (!objc_msgSend(v1, sel_lineSpacing)
      && ((v12 = &v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement],
           swift_beginAccess(),
           (*v12 & 1) != 0)
       || v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] == 1))
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, v11);
    }
    else
    {
      objc_msgSend(v1, sel_set_fontForShortcutBaselineCalculation_, 0);
    }

    v13 = sub_1D8215454();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
    v14 = (uint64_t)&v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase];
    swift_beginAccess();
    sub_1D81E1C08(v14, (uint64_t)v6, &qword_1EDA1C180);
    swift_beginAccess();
    sub_1D81E2430((uint64_t)v8, v14, &qword_1EDA1C180);
    swift_endAccess();
    sub_1D81E1EA0((uint64_t)v6);
    sub_1D81D8B6C((uint64_t)v8, &qword_1EDA1C180);
    sub_1D81D8B6C((uint64_t)v6, &qword_1EDA1C180);
    v19 = 0;
    memset(v18, 0, sizeof(v18));
    sub_1D81E2250((uint64_t)v18);
    v15 = (void **)&v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory];
    swift_beginAccess();
    v16 = *v15;
    *v15 = 0;

    return objc_msgSend(v1, sel_setAdjustsFontForContentSizeCategory_, 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for DynamicTypeLabel()
{
  uint64_t result;

  result = qword_1EDA1C400;
  if (!qword_1EDA1C400)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t Artwork.__allocating_init(deserializing:using:)(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86[2];
  uint64_t v87;
  uint64_t v88;
  unsigned __int8 v89;

  v3 = v2;
  v85 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1B0);
  MEMORY[0x1E0C80A78](v5);
  v81 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D821558C();
  v83 = *(_QWORD *)(v7 - 8);
  v84 = v7;
  MEMORY[0x1E0C80A78](v7);
  v80 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D8215538();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v79 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v78 = (char *)&v68 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v77 = (uint64_t)&v68 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v68 - v18;
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (char *)&v68 - v21;
  v23 = MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v68 - v24;
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)&v68 - v26;
  v28 = a1;
  sub_1D8215544();
  sub_1D81E1C4C();
  sub_1D82154F0();
  v29 = *(void (**)(char *, uint64_t))(v10 + 8);
  v29(v27, v9);
  if (!v88)
  {
    v58 = sub_1D8215664();
    sub_1D81E802C((unint64_t *)&qword_1EDA1C1C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
    swift_allocError();
    v60 = v59;
    *v59 = 0x6574616C706D6574;
    v59[1] = 0xE800000000000000;
    v59[2] = v3;
LABEL_9:
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v58 - 8) + 104))(v60, *MEMORY[0x1E0D414E8], v58);
    v63 = v84;
    v57 = v85;
    v64 = v83;
    v37 = v9;
LABEL_10:
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v57, v63);
    v29(v28, v37);
    return v57;
  }
  v75 = v19;
  v76 = v3;
  v82 = v88;
  v30 = v87;
  sub_1D8215544();
  v31 = sub_1D8215514();
  v33 = v32;
  v29(v25, v9);
  if ((v33 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v58 = sub_1D8215664();
    sub_1D81E802C((unint64_t *)&qword_1EDA1C1C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
    swift_allocError();
    v60 = v61;
    *v61 = 0x6874646977;
    v62 = v76;
    v61[1] = 0xE500000000000000;
    v61[2] = v62;
    goto LABEL_9;
  }
  v74 = v30;
  sub_1D8215544();
  v34 = sub_1D8215514();
  v36 = v35;
  v29(v22, v9);
  v37 = v9;
  if ((v36 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v66 = sub_1D8215664();
    sub_1D81E802C((unint64_t *)&qword_1EDA1C1C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
    swift_allocError();
    *v67 = 0x746867696568;
    v67[1] = 0xE600000000000000;
    v67[2] = v76;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v66 - 8) + 104))(v67, *MEMORY[0x1E0D414E8], v66);
    v63 = v84;
    v57 = v85;
    v64 = v83;
    goto LABEL_10;
  }
  v38 = *(double *)&v31;
  v39 = *(double *)&v34;
  sub_1D8215544();
  sub_1D81E19A0();
  sub_1D82154E4();
  v29(v27, v9);
  LODWORD(v76) = v87;
  sub_1D8215544();
  sub_1D81E19E4();
  sub_1D82154E4();
  v29(v27, v9);
  v40 = v87;
  v41 = v88;
  v42 = (uint64_t)v75;
  sub_1D8215544();
  v43 = sub_1D82154FC();
  v45 = v44;
  v29((char *)v42, v37);
  if ((v45 & 1) != 0)
  {
    v87 = v40;
    v88 = v41;
    v43 = Artwork.Crop.preferredContentMode.getter();
  }
  v75 = (char *)v43;
  sub_1D8215544();
  v70 = v41;
  v46 = v40;
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v83 + 16);
  v48 = v80;
  v47(v80, v85, v84);
  sub_1D81E195C();
  v71 = sub_1D82157A8();
  sub_1D8215544();
  v49 = sub_1D821552C();
  v72 = v50;
  v73 = v49;
  v29(v27, v37);
  v87 = v74;
  v88 = v82;
  v51 = v77;
  sub_1D8215544();
  v82 = JSONObject.appStoreColor.getter();
  v29((char *)v51, v37);
  v52 = v78;
  sub_1D8215544();
  v53 = JSONObject.appStoreColor.getter();
  v69 = v28;
  v77 = v53;
  v29(v52, v37);
  v89 = v76;
  v86[0] = v46;
  v86[1] = v70;
  sub_1D82155B0();
  sub_1D8215544();
  v54 = v84;
  v55 = v85;
  v47(v48, v85, v84);
  v56 = (uint64_t)v81;
  sub_1D82155A4();
  type metadata accessor for Artwork();
  v57 = swift_allocObject();
  Artwork.init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)(v73, v72, &v87, v82, v77, &v89, v86, (uint64_t)v75, v38, v39, 0, v71, v56);
  (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v55, v54);
  v29(v69, v37);
  return v57;
}

uint64_t type metadata accessor for Artwork()
{
  uint64_t result;

  result = qword_1EDA1C568;
  if (!qword_1EDA1C568)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t JSONObject.appStoreColor.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  _BYTE v5[16];

  v0 = sub_1D8215538();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = &v5[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((sub_1D8215520() & 1) == 0)
  {
    sub_1D8215544();
    sub_1D81E16A8();
    sub_1D82154F0();
    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v3, v0);
    __asm { BR              X10 }
  }
  return 0;
}

unint64_t sub_1D81E16A8()
{
  unint64_t result;

  result = qword_1EDA1C1A8;
  if (!qword_1EDA1C1A8)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D821956C, &_s9ColorTypeON);
    atomic_store(result, (unint64_t *)&qword_1EDA1C1A8);
  }
  return result;
}

uint64_t Artwork.Crop.preferredContentMode.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t result;
  char v5;
  BOOL v7;
  char v8;
  BOOL v10;
  char v11;
  BOOL v13;

  v1 = *v0;
  v2 = v0[1];
  v3 = v1 == 25186 && v2 == 0xE200000000000000;
  if (v3 || (sub_1D8215A3C() & 1) != 0)
    return 1;
  if (v1 == 24934 && v2 == 0xE200000000000000)
    return 0;
  v5 = sub_1D8215A3C();
  result = 0;
  v7 = v1 == 24948 && v2 == 0xE200000000000000;
  if ((v5 & 1) == 0 && !v7)
  {
    if ((sub_1D8215A3C() & 1) != 0
      || v1 == 0x7070412E45474D44 && v2 == 0xEC00000031305453
      || (sub_1D8215A3C() & 1) != 0)
    {
      return 0;
    }
    if (v1 == 0x435370412E424353 && v2 == 0xEC00000031304C42)
      return 8;
    v8 = sub_1D8215A3C();
    v10 = v1 == 0x435370412E424353 && v2 == 0xEC00000032305342;
    result = 8;
    if ((v8 & 1) == 0 && !v10)
    {
      if ((sub_1D8215A3C() & 1) != 0)
        return 8;
      if (v1 == 0x435370412E424353 && v2 == 0xEC00000032304C42)
      {
        return 7;
      }
      else
      {
        v11 = sub_1D8215A3C();
        v13 = v1 == 0x435370412E424353 && v2 == 0xEC00000031305342;
        result = 7;
        if ((v11 & 1) == 0 && !v13)
        {
          if ((sub_1D8215A3C() & 1) != 0)
            return 7;
          else
            return 2;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1D81E195C()
{
  unint64_t result;

  result = qword_1EDA1C020;
  if (!qword_1EDA1C020)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Variant, &type metadata for Artwork.Variant);
    atomic_store(result, (unint64_t *)&qword_1EDA1C020);
  }
  return result;
}

unint64_t sub_1D81E19A0()
{
  unint64_t result;

  result = qword_1EDA1C010;
  if (!qword_1EDA1C010)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Style, &type metadata for Artwork.Style);
    atomic_store(result, (unint64_t *)&qword_1EDA1C010);
  }
  return result;
}

unint64_t sub_1D81E19E4()
{
  unint64_t result;

  result = qword_1EDA1C008;
  if (!qword_1EDA1C008)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Crop, &type metadata for Artwork.Crop);
    atomic_store(result, (unint64_t *)&qword_1EDA1C008);
  }
  return result;
}

uint64_t Artwork.init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t *a7, uint64_t a8, double a9, double a10, unsigned __int8 a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v14 = v13;
  v37 = a8;
  v41 = a4;
  v42 = a5;
  v43 = a13;
  v40 = a12;
  v39 = a11;
  v22 = sub_1D821540C();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v25 = (char *)&v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *a3;
  v26 = a3[1];
  v38 = *a6;
  v28 = *a7;
  v29 = a7[1];
  *(_OWORD *)(v14 + 144) = 0u;
  *(_OWORD *)(v14 + 160) = 0u;
  *(_QWORD *)(v14 + 176) = 0;
  if (!a2)
  {
    sub_1D8215400();
    a1 = sub_1D82153F4();
    a2 = v30;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  }
  v44 = a1;
  v45 = a2;
  sub_1D8215940();
  v31 = v47;
  *(_OWORD *)(v14 + 104) = v46;
  *(_OWORD *)(v14 + 120) = v31;
  *(_QWORD *)(v14 + 136) = v48;
  v32 = v43;
  sub_1D81E1C08(v43, v14 + OBJC_IVAR____TtC11AppStoreKit7Artwork_impressionMetrics, &qword_1EDA1C1B0);
  *(_QWORD *)(v14 + 16) = v27;
  *(_QWORD *)(v14 + 24) = v26;
  *(double *)(v14 + 32) = a9;
  *(double *)(v14 + 40) = a10;
  v33 = v42;
  *(_QWORD *)(v14 + 48) = v41;
  *(_QWORD *)(v14 + 56) = v33;
  *(_QWORD *)(v14 + 72) = v28;
  *(_QWORD *)(v14 + 80) = v29;
  *(_BYTE *)(v14 + 64) = v38;
  *(_QWORD *)(v14 + 96) = v40;
  if ((v39 & 1) != 0)
  {
    *(_QWORD *)&v46 = v28;
    *((_QWORD *)&v46 + 1) = v29;
    v34 = Artwork.Crop.preferredContentMode.getter();
    swift_bridgeObjectRetain();
    sub_1D81D8B6C(v32, &qword_1EDA1C1B0);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1D81D8B6C(v32, &qword_1EDA1C1B0);
    v34 = v37;
  }
  *(_QWORD *)(v14 + 88) = v34;
  return v14;
}

uint64_t sub_1D81E1C08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1D81E1C4C()
{
  unint64_t result;

  result = qword_1EDA1C000;
  if (!qword_1EDA1C000)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.URLTemplate, &type metadata for Artwork.URLTemplate);
    atomic_store(result, (unint64_t *)&qword_1EDA1C000);
  }
  return result;
}

id sub_1D81E1C90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  char v15;
  void (*v16)(char *, uint64_t);
  id result;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  char v22;
  char v23;
  double v24;
  double v25;
  char v26;
  char v27;
  double v28;
  uint64_t v29;

  v0 = sub_1D8215538();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x1E0C80A78](v2);
  v7 = (char *)&v29 - v6;
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v29 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v29 - v11;
  sub_1D8215544();
  v13 = sub_1D8215514();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v1 + 8);
  v16(v12, v0);
  result = 0;
  if ((v15 & 1) == 0)
  {
    sub_1D8215544();
    v18 = sub_1D8215514();
    v20 = v19;
    v16(v10, v0);
    if ((v20 & 1) != 0)
      return 0;
    sub_1D8215544();
    v21 = sub_1D8215514();
    v23 = v22;
    v16(v7, v0);
    if ((v23 & 1) != 0)
    {
      return 0;
    }
    else
    {
      v24 = *(double *)&v21;
      sub_1D8215544();
      v25 = COERCE_DOUBLE(sub_1D8215514());
      v27 = v26;
      v16(v4, v0);
      if ((v27 & 1) != 0)
        v28 = 1.0;
      else
        v28 = v25;
      return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithRed_green_blue_alpha_, *(double *)&v13, *(double *)&v18, v24, v28);
    }
  }
  return result;
}

uint64_t sub_1D81E1EA0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  void (*v26)(char *, uint64_t);
  _QWORD *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _OWORD v34[2];
  uint64_t v35;

  v33 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C4D0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v6 = MEMORY[0x1E0C80A78](v5);
  v31 = (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v28 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v28 - v11;
  v13 = sub_1D8215454();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v30 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v28 - v17;
  v32 = v1;
  v19 = (uint64_t)v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  swift_beginAccess();
  sub_1D81E1C08(v19, (uint64_t)v12, &qword_1EDA1C180);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v20(v12, 1, v13) == 1)
    return sub_1D81D8B6C((uint64_t)v12, &qword_1EDA1C180);
  v29 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v29(v18, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v10, v18, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
  v22 = (uint64_t)&v4[*(int *)(v2 + 48)];
  sub_1D81E1C08((uint64_t)v10, (uint64_t)v4, &qword_1EDA1C180);
  sub_1D81E1C08(v33, v22, &qword_1EDA1C180);
  if (v20(v4, 1, v13) == 1)
  {
    sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1C180);
    if (v20((char *)v22, 1, v13) == 1)
    {
      sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v18, v13);
    }
    goto LABEL_8;
  }
  v23 = v31;
  sub_1D81E1C08((uint64_t)v4, v31, &qword_1EDA1C180);
  if (v20((char *)v22, 1, v13) == 1)
  {
    sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1C180);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v23, v13);
LABEL_8:
    sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C4D0);
LABEL_12:
    v35 = 0;
    memset(v34, 0, sizeof(v34));
    v27 = v32;
    sub_1D81E2250((uint64_t)v34);
    (*(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & *v27) + 0xD0))(v18);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v18, v13);
  }
  v24 = v30;
  v29(v30, (char *)v22, v13);
  sub_1D81E46E0();
  v25 = sub_1D82156A0();
  v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v24, v13);
  sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1C180);
  v26((char *)v23, v13);
  sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
  if ((v25 & 1) == 0)
    goto LABEL_12;
  return ((uint64_t (*)(char *, uint64_t))v26)(v18, v13);
}

uint64_t sub_1D81E2250(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[40];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v13 - v7;
  v9 = (uint64_t)v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle;
  swift_beginAccess();
  sub_1D81E2430(a1, v9, &qword_1EDA1BC80);
  swift_endAccess();
  sub_1D81E1C08(v9, (uint64_t)&v14, &qword_1EDA1BC80);
  if (v15)
  {
    sub_1D81F6AE4(&v14, (uint64_t)v16);
    v10 = sub_1D8215454();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
    v11 = (uint64_t)v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
    swift_beginAccess();
    sub_1D81E1C08(v11, (uint64_t)v6, &qword_1EDA1C180);
    swift_beginAccess();
    sub_1D81E2430((uint64_t)v8, v11, &qword_1EDA1C180);
    swift_endAccess();
    sub_1D81E1EA0(v6);
    sub_1D81D8B6C((uint64_t)v8, &qword_1EDA1C180);
    sub_1D81D8B6C((uint64_t)v6, &qword_1EDA1C180);
    (*(void (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xD8))(v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    sub_1D81D8B6C((uint64_t)&v14, &qword_1EDA1BC80);
  }
  return sub_1D81D8B6C(a1, &qword_1EDA1BC80);
}

uint64_t sub_1D81E2430(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

void sub_1D81E2474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  _BYTE v4[16];

  v0 = sub_1D8215538();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = &v4[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D8215544();
  sub_1D81E2678();
  sub_1D82154F0();
  (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v3, v0);
  __asm { BR              X10 }
}

id sub_1D81E252C()
{
  return objc_msgSend((id)objc_opt_self(), sel_whiteColor);
}

void sub_1D81E257C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  int v4;
  int v5;
  id v6;
  id v7;

  sub_1D8215544();
  sub_1D81E2634();
  sub_1D82154F0();
  v2(v1, v0);
  v4 = *(unsigned __int8 *)(v3 - 50);
  if (v4 == 9)
  {
    sub_1D8215544();
    sub_1D81E2704();
    sub_1D82154F0();
    v2(v1, v0);
    v5 = *(unsigned __int8 *)(v3 - 51);
    if (v5 != 10)
    {
      sub_1D81E2748(v5);
      v7 = v6;
    }
    JUMPOUT(0x1D81E2560);
  }
  sub_1D81E8498(v4);
  JUMPOUT(0x1D81E255CLL);
}

unint64_t sub_1D81E2634()
{
  unint64_t result;

  result = qword_1EDA1C198;
  if (!qword_1EDA1C198)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D8219774, &_s16SystemNamedColorON);
    atomic_store(result, (unint64_t *)&qword_1EDA1C198);
  }
  return result;
}

unint64_t sub_1D81E2678()
{
  unint64_t result;

  result = qword_1EDA1C190;
  if (!qword_1EDA1C190)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D82197AC, &_s16StaticNamedColorON);
    atomic_store(result, (unint64_t *)&qword_1EDA1C190);
  }
  return result;
}

uint64_t ArtworkView.roundedCorners.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

unint64_t sub_1D81E2704()
{
  unint64_t result;

  result = qword_1EDA1C1A0;
  if (!qword_1EDA1C1A0)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D821973C, &_s18SemanticNamedColorON);
    atomic_store(result, (unint64_t *)&qword_1EDA1C1A0);
  }
  return result;
}

void sub_1D81E2748(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1D81E276C()
{
  if (qword_1EDA1C510 != -1)
    swift_once();
  return qword_1EDA1BD00;
}

_QWORD *DynamicTypeLabel.init(useCase:numberOfLines:lineBreakMode:isUserInteractionEnabled:directionalTextAlignment:contentSizeCategoryMapping:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5, char *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;

  v9 = sub_1D81E29C0(a1, a2, a3, a4 & 1, a5, a6, a7, a8);
  sub_1D81E2E70(a7);
  return v9;
}

_QWORD *sub_1D81E29C0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, char *a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  _BYTE *v9;
  _BOOL4 v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  char *v21;
  objc_class *v22;
  _QWORD *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  char *v32;
  id v33;
  char v34;
  uint64_t v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  char *v48;
  objc_class *v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  __int128 v54;
  uint64_t ObjectType;
  objc_super v56;
  objc_super v57;
  objc_super v58;

  v9 = v8;
  v53 = a7;
  *(_QWORD *)&v54 = a8;
  v52 = a5;
  v50 = a4;
  v51 = a3;
  v13 = a2 != 0;
  ObjectType = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78]();
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1D8215454();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78]();
  v48 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a6;
  *(_QWORD *)&v9[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory] = 0;
  v20 = &v9[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping];
  *v20 = 0;
  v20[1] = 0;
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v17 + 56))(&v9[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase], 1, 1, v16);
  v21 = &v9[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle];
  *(_OWORD *)v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  *((_QWORD *)v21 + 4) = 0;
  v9[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement] = 0;
  v9[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] = 1;
  v9[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment] = 0;
  v22 = (objc_class *)type metadata accessor for DynamicTypeLabel();
  v58.receiver = v9;
  v58.super_class = v22;
  v49 = v22;
  v23 = objc_msgSendSuper2(&v58, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v23, sel_setNumberOfLines_, a2);
  if ((v50 & 1) != 0)
    v24 = 4 * v13;
  else
    v24 = v51;
  objc_msgSend(v23, sel_setLineBreakMode_, v24);
  objc_msgSend(v23, sel_setUserInteractionEnabled_, v52 & 1);
  v25 = (char *)v23 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment;
  swift_beginAccess();
  *v25 = v19;
  v26 = (uint64_t)v23 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  swift_beginAccess();
  sub_1D81E2430(a1, v26, &qword_1EDA1C180);
  swift_endAccess();
  v27 = (_QWORD *)((char *)v23 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping);
  swift_beginAccess();
  v28 = *v27;
  v29 = v53;
  v30 = v54;
  *v27 = v53;
  v27[1] = v30;
  sub_1D81E3020(v29);
  sub_1D81E2E70(v28);
  sub_1D81E1C08(a1, (uint64_t)v15, &qword_1EDA1C180);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_1D81D8B6C((uint64_t)v15, &qword_1EDA1C180);
    v31 = *v25;
    if (!*v25)
      goto LABEL_17;
  }
  else
  {
    v32 = v48;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v48, v15, v16);
    (*(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & *v23) + 0xD0))(v32);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v32, v16);
    v31 = *v25;
    if (!*v25)
      goto LABEL_17;
  }
  if (v31 == 1)
  {
    v33 = objc_msgSend(v23, sel_traitCollection);
    v34 = sub_1D8215820();

    if ((v34 & 1) != 0)
      v35 = 2;
    else
      v35 = 0;
    v56.receiver = v23;
    v56.super_class = v49;
    objc_msgSendSuper2(&v56, sel_setTextAlignment_, v35);
  }
  else
  {
    v36 = objc_msgSend(v23, sel_traitCollection);
    v37 = sub_1D8215820();

    if ((v37 & 1) != 0)
      v38 = 0;
    else
      v38 = 2;
    v57.receiver = v23;
    v57.super_class = v49;
    objc_msgSendSuper2(&v57, sel_setTextAlignment_, v38);
  }
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BC98);
  v39 = swift_allocObject();
  v54 = xmmword_1D8218310;
  *(_OWORD *)(v39 + 16) = xmmword_1D8218310;
  v40 = sub_1D8215484();
  v41 = MEMORY[0x1E0DC1F50];
  *(_QWORD *)(v39 + 32) = v40;
  *(_QWORD *)(v39 + 40) = v41;
  v42 = v23;
  sub_1D8215874();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = v54;
  v44 = sub_1D8215490();
  v45 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v43 + 32) = v44;
  *(_QWORD *)(v43 + 40) = v45;
  v46 = v42;
  sub_1D8215874();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  sub_1D81D8B6C(a1, &qword_1EDA1C180);
  return v46;
}

uint64_t sub_1D81E2E70(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_1D81E2E80(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t (*v4)(void);
  void *v5;
  id v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char *v14;
  objc_super v15;

  v2 = v1;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1) + 0xC0);
  v5 = (void *)v4();
  v6 = objc_msgSend(v5, sel_preferredContentSizeCategory);

  v7 = (void **)&v2[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory];
  swift_beginAccess();
  v8 = *v7;
  *v7 = v6;

  v9 = (void *)((uint64_t (*)(id))v4)(objc_msgSend(v2, sel_setAdjustsFontForContentSizeCategory_, 0));
  v10 = (void *)sub_1D8215838();

  sub_1D81D898C(0, (unint64_t *)&qword_1EDA1C248);
  v11 = (void *)MEMORY[0x1D82AA1A8](a1, v10);
  v15.receiver = v2;
  v15.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  objc_msgSendSuper2(&v15, sel_setFont_, v11);
  v12 = objc_msgSend(v2, sel_lineSpacing);
  v13 = 0;
  if (!v12)
  {
    v14 = &v2[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement];
    swift_beginAccess();
    if ((*v14 & 1) != 0 || v2[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] == 1)
      v13 = v11;
    else
      v13 = 0;
  }
  objc_msgSend(v2, sel_set_fontForShortcutBaselineCalculation_, v13);

}

uint64_t sub_1D81E3020(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D82AAAB4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1D81E36F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D81E3C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D81E3ED0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D81E41B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D81E42A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D81E437C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

unint64_t sub_1D81E46E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA1C4C0;
  if (!qword_1EDA1C4C0)
  {
    v1 = sub_1D8215454();
    result = MEMORY[0x1D82AAACC](MEMORY[0x1E0D41A88], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA1C4C0);
  }
  return result;
}

double ASKHomeScreenIconsGetScaledCornerRadiusForSize(double a1, double a2)
{
  double Size;
  double v5;
  double v6;
  double CornerRadius;
  double v8;

  Size = ASKHomeScreenIconsGetSize();
  v6 = v5;
  CornerRadius = ASKHomeScreenIconsGetCornerRadius();
  v8 = a2 / v6;
  if (a1 > a2)
    v8 = a1 / Size;
  return CornerRadius * v8;
}

double ASKHomeScreenIconsGetSize()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  v2 = v1;

  return v2;
}

double ASKHomeScreenIconsGetCornerRadius()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "continuousCornerRadius");
  v2 = v1;

  return v2;
}

uint64_t type metadata accessor for BorderView()
{
  return objc_opt_self();
}

void sub_1D81E49D0(void *a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t aBlock;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  uint64_t (*v29)();
  _QWORD *v30;

  v4 = v3;
  v8 = sub_1D82154CC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (uint64_t *)((char *)&aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)(v4 + 24);
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF740], v8);
  v13 = v12;
  LOBYTE(v12) = sub_1D82154D8();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    v14 = objc_msgSend(a1, sel_requestKey);
    swift_beginAccess();
    sub_1D81E4F48(v14, (uint64_t)&aBlock);
    swift_endAccess();
    v15 = aBlock;
    if (aBlock)
    {
      v17 = v26;
      v16 = v27;
      swift_retain();
      v18 = a1;
      v19 = sub_1D81E4C2C(v15, v4, v18);
      swift_bridgeObjectRelease();
      swift_release();

      v20 = objc_msgSend(*(id *)(v4 + 16), sel_notificationQueue);
      v21 = (_QWORD *)swift_allocObject();
      v21[2] = v19;
      v21[3] = a2;
      v21[4] = v17;
      v21[5] = v16;
      v21[6] = a3;
      v29 = sub_1D81DDEA8;
      v30 = v21;
      aBlock = MEMORY[0x1E0C809B0];
      v26 = 1107296256;
      v27 = sub_1D81D7A68;
      v28 = &block_descriptor_42;
      v22 = _Block_copy(&aBlock);
      v23 = a2;
      v24 = a3;
      swift_release();
      objc_msgSend(v20, sel_addOperationWithBlock_, v22);
      _Block_release(v22);
      swift_unknownObjectRelease();

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1D81E4C00(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_1D81E4C2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  v5 = a1 + 32;
  v6 = (uint64_t *)(a2 + 32);
  swift_bridgeObjectRetain();
  v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  do
  {
    swift_beginAccess();
    v8 = *v6;
    if (*(_QWORD *)(*v6 + 16) && (v9 = sub_1D81E5818(v5), (v10 & 1) != 0))
    {
      v11 = *(_QWORD *)(v8 + 56) + 24 * v9;
      v12 = *(void **)v11;
      v13 = *(_QWORD *)(v11 + 8);
      v14 = *(_QWORD *)(v11 + 16);
      v15 = swift_allocObject();
      *(_QWORD *)(v15 + 16) = v13;
      *(_QWORD *)(v15 + 24) = v14;
      swift_endAccess();
      swift_unknownObjectRetain();
      swift_retain();
      LOBYTE(v13) = objc_msgSend(v12, sel_isEqual_, objc_msgSend(a3, sel_requestKey));
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if ((v13 & 1) != 0)
      {
        v16 = swift_allocObject();
        *(_QWORD *)(v16 + 16) = sub_1D81DDFC0;
        *(_QWORD *)(v16 + 24) = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v7 = sub_1D81E4E28(0, v7[2] + 1, 1, v7);
        v18 = v7[2];
        v17 = v7[3];
        if (v18 >= v17 >> 1)
          v7 = sub_1D81E4E28((_QWORD *)(v17 > 1), v18 + 1, 1, v7);
        v7[2] = v18 + 1;
        v19 = &v7[2 * v18];
        v19[4] = sub_1D81DE000;
        v19[5] = v16;
      }
      else
      {
        swift_release();
      }
    }
    else
    {
      swift_endAccess();
    }
    v5 += 40;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  return v7;
}

_QWORD *sub_1D81E4E28(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF88);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C298);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D81E4F48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t result;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1D81E6444(a1);
  LOBYTE(a1) = v7;
  result = swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    v14 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1D8204DA4();
      v10 = v14;
    }
    swift_unknownObjectRelease();
    v11 = *(_QWORD *)(v10 + 56) + 24 * v6;
    v12 = *(_OWORD *)v11;
    v13 = *(_QWORD *)(v11 + 16);
    *(_OWORD *)a2 = v12;
    *(_QWORD *)(a2 + 16) = v13;
    sub_1D81E5038(v6, v10);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  return result;
}

unint64_t sub_1D81E5038(unint64_t result, uint64_t a2)
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
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
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
    result = sub_1D821591C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1D8215AB4();
        objc_msgSend((id)swift_unknownObjectRetain(), sel_hash);
        sub_1D8215AC0();
        v10 = sub_1D8215AE4();
        result = swift_unknownObjectRelease();
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
          v13 = (_QWORD *)(v12 + 8 * v3);
          v14 = (_QWORD *)(v12 + 8 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = v15 + 24 * v3;
          v17 = (__int128 *)(v15 + 24 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= (unint64_t)v17 + 24))
          {
            v9 = *v17;
            *(_QWORD *)(v16 + 16) = *((_QWORD *)v17 + 2);
            *(_OWORD *)v16 = v9;
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

uint64_t sub_1D81E5220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;

  v1 = v0;
  v2 = sub_1D82155D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (BOOL *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v7 = sub_1D8215364();
  if (!v7)
  {
    v16 = 0u;
    v17 = 0u;
LABEL_12:
    swift_release();
    return sub_1D81D8B6C((uint64_t)&v16, &qword_1EDA1C290);
  }
  v8 = v7;
  v14[1] = sub_1D82156D0();
  v14[2] = v9;
  sub_1D8215940();
  if (*(_QWORD *)(v8 + 16) && (v10 = sub_1D81E5818((uint64_t)v15), (v11 & 1) != 0))
  {
    sub_1D81E5848(*(_QWORD *)(v8 + 56) + 32 * v10, (uint64_t)&v16);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D81E610C((uint64_t)v15);
  if (!*((_QWORD *)&v17 + 1))
    goto LABEL_12;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v12 = v15[0];
    swift_beginAccess();
    if (sub_1D81E80AC(v12, *(_QWORD *)(v1 + 96)))
    {
      *v5 = sub_1D81E5718();
      (*(void (**)(BOOL *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0D40BA0], v2);
      sub_1D82155EC();
      (*(void (**)(BOOL *, uint64_t))(v3 + 8))(v5, v2);
      swift_beginAccess();
      sub_1D81E8174(v12);
      swift_endAccess();
    }
    else
    {
      if (qword_1EDA1BBE8 != -1)
        swift_once();
      v13 = sub_1D8215658();
      __swift_project_value_buffer(v13, (uint64_t)qword_1EDA1D670);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
      sub_1D8215580();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8218310;
      sub_1D8215550();
      sub_1D8215610();
      swift_bridgeObjectRelease();
    }
  }
  return swift_release();
}

uint64_t sub_1D81E5514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;

  v0 = sub_1D82155E0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (BOOL *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = sub_1D8215364();
    if (v5)
    {
      v6 = v5;
      v11[1] = sub_1D82156D0();
      v11[2] = v7;
      sub_1D8215940();
      if (*(_QWORD *)(v6 + 16) && (v8 = sub_1D81E5818((uint64_t)v12), (v9 & 1) != 0))
      {
        sub_1D81E5848(*(_QWORD *)(v6 + 56) + 32 * v8, (uint64_t)&v13);
      }
      else
      {
        v13 = 0u;
        v14 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_1D81E610C((uint64_t)v12);
      if (*((_QWORD *)&v14 + 1))
      {
        if ((swift_dynamicCast() & 1) == 0)
          return swift_release();
        v10 = v12[0];
        swift_beginAccess();
        sub_1D81E711C((uint64_t *)&v13, v10);
        swift_endAccess();
        *v3 = sub_1D81E5718();
        (*(void (**)(BOOL *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0D40BC8], v0);
        sub_1D82155F8();
        swift_release();
        return (*(uint64_t (**)(BOOL *, uint64_t))(v1 + 8))(v3, v0);
      }
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }
    swift_release();
    return sub_1D81D8B6C((uint64_t)&v13, &qword_1EDA1C290);
  }
  return result;
}

BOOL sub_1D81E5718()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;

  v0 = sub_1D8215364();
  if (!v0)
  {
    v6 = 0u;
    v7 = 0u;
LABEL_11:
    sub_1D81D8B6C((uint64_t)&v6, &qword_1EDA1C290);
    return 0;
  }
  v1 = v0;
  sub_1D82156D0();
  sub_1D8215940();
  if (*(_QWORD *)(v1 + 16) && (v2 = sub_1D81E5818((uint64_t)v5), (v3 & 1) != 0))
  {
    sub_1D81E5848(*(_QWORD *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D81E610C((uint64_t)v5);
  if (!*((_QWORD *)&v7 + 1))
    goto LABEL_11;
  return (swift_dynamicCast() & 1) != 0 && v5[0] == 2;
}

unint64_t sub_1D81E5818(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D8215928();
  return sub_1D81E6048(a1, v2);
}

uint64_t sub_1D81E5848(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1D81E5884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v18;
  uint64_t Strong;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  void (*v65)();
  __int128 aBlock;
  __int128 v67;
  void (*v68)();
  _QWORD *v69;

  v58 = a6;
  v59 = a4;
  v60 = a3;
  v57 = sub_1D82152F8();
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x1E0C80A78](v57);
  v55 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D821540C();
  MEMORY[0x1E0C80A78](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1D82153E8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v54 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v52 - v17;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v20 = Strong;
    if ((sub_1D81E6F2C() & 1) == 0)
    {
      v21 = objc_msgSend(*(id *)(v20 + 16), sel_notificationQueue);
      v26 = (_QWORD *)swift_allocObject();
      v27 = v59;
      v24 = v60;
      v26[2] = v60;
      v26[3] = v27;
      v26[4] = a2;
      v68 = sub_1D8205974;
      v69 = v26;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v25 = &block_descriptor_54;
      goto LABEL_6;
    }
    sub_1D81DFE68();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      sub_1D81D8B6C((uint64_t)v12, &qword_1EDA1BFE8);
      v21 = objc_msgSend(*(id *)(v20 + 16), sel_notificationQueue);
      v22 = (_QWORD *)swift_allocObject();
      v23 = v59;
      v24 = v60;
      v22[2] = v60;
      v22[3] = v23;
      v22[4] = a2;
      v68 = sub_1D8205998;
      v69 = v22;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v25 = &block_descriptor_60;
LABEL_6:
      *(_QWORD *)&v67 = sub_1D81D7A68;
      *((_QWORD *)&v67 + 1) = v25;
      v28 = _Block_copy(&aBlock);
      sub_1D81E3020(v24);
      swift_retain();
      swift_release();
      objc_msgSend(v21, sel_addOperationWithBlock_, v28);
      _Block_release(v28);
      swift_release();

      return;
    }
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v12, v13);
    v29 = (void *)sub_1D81E6548();
    if (!v60)
      goto LABEL_23;
    sub_1D8205390(a5, (uint64_t)&v63);
    if (*((_QWORD *)&v64 + 1))
    {
      aBlock = v63;
      v67 = v64;
      v68 = v65;
      v30 = v59;
      swift_retain();
    }
    else
    {
      v30 = v59;
      swift_retain();
      sub_1D8215400();
      sub_1D81E802C(&qword_1EDA1BFF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
      sub_1D8215940();
      sub_1D81D8B6C((uint64_t)&v63, &qword_1EDA1BF58);
    }
    sub_1D81E6140((uint64_t)&aBlock, (uint64_t)&v63);
    v31 = swift_allocObject();
    v32 = v60;
    *(_QWORD *)(v31 + 16) = v60;
    *(_QWORD *)(v31 + 24) = v30;
    swift_beginAccess();
    sub_1D81E3020(v32);
    swift_unknownObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v61 = *(_QWORD *)(v20 + 32);
    *(_QWORD *)(v20 + 32) = 0x8000000000000000;
    sub_1D81E617C((uint64_t)v29, (uint64_t)sub_1D81DE000, v31, (uint64_t)&v63, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v20 + 32) = v61;
    swift_bridgeObjectRelease();
    sub_1D81E610C((uint64_t)&v63);
    swift_endAccess();
    v53 = (uint64_t *)(v20 + 40);
    swift_beginAccess();
    v34 = *(_QWORD *)(v20 + 40);
    v35 = *(_QWORD *)(v34 + 16);
    swift_unknownObjectRetain();
    if (v35)
    {
      v36 = (void *)swift_unknownObjectRetain();
      v37 = sub_1D81E6444(v36);
      if ((v38 & 1) != 0)
      {
        v39 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 24 * v37);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        if (v39)
        {
          swift_endAccess();
          v40 = swift_bridgeObjectRetain();
          sub_1D81E4C00(v40);
          sub_1D81E6140((uint64_t)&aBlock, (uint64_t)&v63);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v39 = (uint64_t)sub_1D81E8B4C(0, *(_QWORD *)(v39 + 16) + 1, 1, (char *)v39);
          v42 = *(_QWORD *)(v39 + 16);
          v41 = *(_QWORD *)(v39 + 24);
          if (v42 >= v41 >> 1)
            v39 = (uint64_t)sub_1D81E8B4C((char *)(v41 > 1), v42 + 1, 1, (char *)v39);
          *(_QWORD *)(v39 + 16) = v42 + 1;
          v43 = v39 + 40 * v42;
          v44 = v63;
          v45 = v64;
          *(_QWORD *)(v43 + 64) = v65;
          *(_OWORD *)(v43 + 32) = v44;
          *(_OWORD *)(v43 + 48) = v45;
          v46 = *(_QWORD *)(a2 + 24);
          v52 = *(_QWORD *)(a2 + 16);
          v47 = v53;
          swift_beginAccess();
          swift_unknownObjectRetain();
          swift_bridgeObjectRetain();
          v48 = swift_isUniquelyReferenced_nonNull_native();
          v62 = *v47;
          *v47 = 0x8000000000000000;
          goto LABEL_22;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF80);
    v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = xmmword_1D8218310;
    sub_1D81E6140((uint64_t)&aBlock, v39 + 32);
    v46 = *(_QWORD *)(a2 + 24);
    v52 = *(_QWORD *)(a2 + 16);
    v47 = v53;
    swift_beginAccess();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    v48 = swift_isUniquelyReferenced_nonNull_native();
    v62 = *v47;
    *v47 = 0x8000000000000000;
LABEL_22:
    sub_1D81E62C4(v39, v52, v46, v29, v48);
    *v47 = v62;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_unknownObjectRelease();
    sub_1D81E2E70(v60);
    sub_1D81E610C((uint64_t)&aBlock);
LABEL_23:
    v49 = v58;
    if ((objc_msgSend(*(id *)(v20 + 16), sel_setReason_forRequestWithKey_, v58, v29) & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v54, v18, v13);
      v50 = (uint64_t)v55;
      sub_1D82152D4();
      v51 = sub_1D81E7334(a2, v50, (uint64_t)v29);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v50, v57);
      objc_msgSend(*(id *)(v20 + 16), sel_loadResourceWithRequest_reason_, v51, v49);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
      swift_release();
    }
  }
}

unint64_t sub_1D81E6048(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1D81E6140(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D82AA280](v9, a1);
      sub_1D81E610C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1D81E610C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1D81E6140(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_1D81E617C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  unint64_t result;
  unint64_t v23;
  char v24;
  _BYTE v25[40];

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_1D81E5818(a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    v20 = *v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (uint64_t *)(v20[7] + 24 * v14);
      swift_release();
      result = swift_unknownObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      v21[2] = a3;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1D8204F74();
    goto LABEL_7;
  }
  sub_1D81E84D8(v17, a5 & 1);
  v23 = sub_1D81E5818(a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_1D8215A6C();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v6;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_1D81E6140(a4, (uint64_t)v25);
  return sub_1D81E6CB8(v14, (uint64_t)v25, a1, a2, a3, v20);
}

uint64_t sub_1D81E62C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1D81E6444(a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1D8204DA4();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 24 * v14);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      v21[2] = a3;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    *(_QWORD *)(v20[6] + 8 * v14) = a4;
    v25 = (_QWORD *)(v20[7] + 24 * v14);
    *v25 = a1;
    v25[1] = a2;
    v25[2] = a3;
    v26 = v20[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (!v27)
    {
      v20[2] = v28;
      return swift_unknownObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1D81E8828(v17, a5 & 1);
  v23 = sub_1D81E6444(a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1D8215A6C();
  __break(1u);
  return result;
}

unint64_t sub_1D81E6444(void *a1)
{
  uint64_t v2;

  sub_1D8215AB4();
  objc_msgSend(a1, sel_hash);
  sub_1D8215AC0();
  v2 = sub_1D8215AE4();
  return sub_1D81E64A8((uint64_t)a1, v2);
}

unint64_t sub_1D81E64A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(v2 + 48) + 8 * v4), sel_isEqual_, a1) & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1D81E6548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = sub_1D8215658();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D82153E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D81DFE68();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1D81D8B6C((uint64_t)v6, &qword_1EDA1BFE8);
    if (qword_1F0167D08 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v1, (uint64_t)qword_1F016A438);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v11, v1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
    sub_1D8215580();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8219290;
    sub_1D8215550();
    v14[3] = type metadata accessor for ArtworkLoaderConfig();
    v14[0] = v0;
    swift_retain();
    sub_1D821555C();
    sub_1D81D8B6C((uint64_t)v14, &qword_1EDA1C290);
    sub_1D821561C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return sub_1D82156AC();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v12 = sub_1D82153AC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v12;
}

void ArtworkLoader.fetchArtwork(using:forReason:closestMatch:handlerKey:completionHandler:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id, _QWORD, uint64_t *, void *);
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  id v25;
  uint64_t v26;
  uint64_t v27;

  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v26 = v10;
  v27 = v11;
  v12 = Artwork.URLTemplate.systemImageName.getter();
  if (v13)
  {
    v14 = v12;
    v15 = v13;
    v16 = (void (*)(id, _QWORD, uint64_t *, void *))a5;
    swift_bridgeObjectRetain();
    v17 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
    v25 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_, v17);

    if (v25)
    {
      swift_bridgeObjectRelease();
      if (v16)
      {
        v26 = v10;
        v27 = v11;
        v18 = v25;
        swift_bridgeObjectRetain();
        v16(v25, 0, &v26, 0);
        swift_bridgeObjectRelease();

      }
      else
      {

      }
    }
    else if (v16)
    {
      v26 = v10;
      v27 = v11;
      sub_1D8205424();
      v21 = (void *)swift_allocError();
      *(_QWORD *)v22 = v14;
      *(_QWORD *)(v22 + 8) = v15;
      *(_BYTE *)(v22 + 16) = 2;
      swift_bridgeObjectRetain();
      v16(0, 0, &v26, v21);

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v19 = swift_allocObject();
    swift_weakInit();
    sub_1D8205390(a4, (uint64_t)&v26);
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v19;
    v20[3] = a1;
    v20[4] = a5;
    v20[5] = a6;
    sub_1D82059FC((uint64_t)&v26, (uint64_t)(v20 + 6), &qword_1EDA1BF58);
    v20[11] = a2;
    swift_retain();
    swift_retain();
    sub_1D81E3020(a5);
    sub_1D81E7D74(a1, a2, a3 & 1, a5, a6, (uint64_t)sub_1D81DDD54, (uint64_t)v20);
    swift_release();
    swift_release();
  }
}

uint64_t Artwork.URLTemplate.systemImageName.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  void (*v20)(char *, uint64_t);
  unint64_t v21;
  _QWORD v22[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v22 - v5;
  v7 = sub_1D82153E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v0;
  v11 = v0[1];
  swift_bridgeObjectRetain();
  sub_1D82153D0();
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v13(v6, 1, v7) == 1)
  {
    sub_1D820F22C((uint64_t)v6);
LABEL_10:
    swift_bridgeObjectRelease();
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  v14 = sub_1D82153C4();
  if (!v15)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    goto LABEL_10;
  }
  if (v14 == 0x6D696D6574737973 && v15 == 0xEB00000000656761)
    v17 = 1;
  else
    v17 = sub_1D8215A3C();
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
    v21 = sub_1D81E0070(MEMORY[0x1E0DEE9D8]);
    v22[0] = v12;
    v22[1] = v11;
    Artwork.URLTemplate.makeString(withSubstitutions:)((Swift::OpaquePointer)v21);
    sub_1D82153D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13(v4, 1, v7) != 1)
    {
      v18 = sub_1D82153B8();
      v20(v4, v7);
      return v18;
    }
    sub_1D820F22C((uint64_t)v4);
  }
  return 0;
}

unint64_t sub_1D81E6CB8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  __int128 v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = a6[6] + 40 * result;
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v6 = *(_OWORD *)a2;
  *(_OWORD *)(v6 + 16) = v7;
  *(_QWORD *)(v6 + 32) = *(_QWORD *)(a2 + 32);
  v8 = (_QWORD *)(a6[7] + 24 * result);
  *v8 = a3;
  v8[1] = a4;
  v8[2] = a5;
  v9 = a6[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a6[2] = v11;
  return result;
}

uint64_t ArtworkLoaderConfig.init(template:size:scale:crop:format:quality:useWideGamut:)(_QWORD *a1, uint64_t *a2, char *a3, uint64_t a4, char a5, char a6, double a7, double a8, double a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD v30[4];

  v10 = v9;
  v20 = sub_1D8215658();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a1[1];
  v25 = *a2;
  v26 = a2[1];
  v27 = *a3;
  *(_QWORD *)(v10 + 16) = *a1;
  *(_QWORD *)(v10 + 24) = v24;
  *(double *)(v10 + 32) = a7;
  *(double *)(v10 + 40) = a8;
  *(_BYTE *)(v10 + 72) = v27;
  *(_QWORD *)(v10 + 48) = v25;
  *(_QWORD *)(v10 + 56) = v26;
  *(double *)(v10 + 64) = a9;
  *(_QWORD *)(v10 + 80) = a4;
  *(_BYTE *)(v10 + 88) = a5 & 1;
  *(_BYTE *)(v10 + 89) = a6;
  if ((sub_1D81E6F2C() & 1) == 0)
  {
    if (qword_1F0167D08 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v20, (uint64_t)qword_1F016A438);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v28, v20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
    sub_1D8215580();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8219290;
    sub_1D8215550();
    v30[3] = type metadata accessor for ArtworkLoaderConfig();
    v30[0] = v10;
    swift_retain();
    sub_1D8215574();
    sub_1D81D8B6C((uint64_t)v30, &qword_1EDA1C290);
    sub_1D8215628();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }
  return v10;
}

uint64_t sub_1D81E6F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v13;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D82153E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1D82153D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1D81D8B6C((uint64_t)v3, &qword_1EDA1BFE8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    v8 = sub_1D82153C4();
    if (v9)
    {
      if (v8 == 0x6D696D6574737973 && v9 == 0xEB00000000656761)
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v11 = sub_1D8215A3C();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0)
          return *(double *)(v1 + 32) > 0.0 && *(double *)(v1 + 40) > 0.0;
      }
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_bridgeObjectRelease();
  return *(double *)(v1 + 32) > 0.0 && *(double *)(v1 + 40) > 0.0;
}

uint64_t sub_1D81E711C(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_1D8215AA8();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_1D81E7214(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_1D81E7214(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_1D81E8C60();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_1D820516C();
      goto LABEL_14;
    }
    sub_1D81D5F0C();
  }
  v8 = *v3;
  result = sub_1D8215AA8();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_1D8215A60();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

id sub_1D81E7334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;

  v4 = v3;
  v35 = a3;
  v7 = sub_1D82153E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v34 - v15;
  v17 = sub_1D82152F8();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(void (**)(char *, uint64_t))(v18 + 16);
  v34 = v22;
  v21(v20, a2);
  if (objc_msgSend((id)objc_opt_self(), sel_alwaysSendCacheBuster))
  {
    sub_1D82152E0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v14, 1, v7))
    {
      sub_1D81D8B6C((uint64_t)v14, &qword_1EDA1BFE8);
      v23 = 1;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v14, v7);
      sub_1D81D8B6C((uint64_t)v14, &qword_1EDA1BFE8);
      sub_1D82153DC();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v23 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v16, v23, 1, v7);
    sub_1D82152EC();
    sub_1D82152B0();
  }
  v24 = objc_msgSend(objc_allocWithZone((Class)ASKImageDataConsumer), sel_initWithSize_scale_isLayeredImage_renderIntent_, *(unsigned __int8 *)(a1 + 72) == 3, *(_QWORD *)(v4 + 48), *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 64));
  v25 = sub_1D81E765C((uint64_t)v20, v24, v4);
  v26 = objc_allocWithZone((Class)ASKImageRequest);
  v27 = v25;
  v28 = v24;
  swift_retain();
  v29 = (void *)sub_1D82152BC();
  v30 = objc_msgSend(v26, sel_initWithURLRequest_loadOperation_dataConsumer_delegate_, v29, v27, v28, v4);

  swift_release();
  v31 = v30;
  sub_1D81DDC44();
  objc_msgSend(v31, sel_setCacheKey_, v32);

  swift_unknownObjectRelease();
  objc_msgSend(v31, sel_setRequestKey_, v35);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v34);
  return v31;
}

id sub_1D81E765C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t *boxed_opaque_existential_0;
  void *v23;
  id v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;

  v27 = a2;
  v5 = sub_1D8215658();
  v28 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  v8 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v26 - v11;
  v29 = a1;
  sub_1D82152E0();
  v13 = sub_1D82153E8();
  v26 = *(_QWORD *)(v13 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v14(v12, 1, v13) == 1)
  {
    sub_1D81D8B6C((uint64_t)v12, &qword_1EDA1BFE8);
  }
  else
  {
    v15 = sub_1D82153C4();
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v13);
    if (v17)
    {
      swift_beginAccess();
      if (*(_QWORD *)(*(_QWORD *)(a3 + 56) + 16))
      {
        swift_bridgeObjectRetain();
        sub_1D81E7A1C(v15, v17);
        if ((v18 & 1) != 0)
        {
          swift_endAccess();
          swift_bridgeObjectRelease_n();
          v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          v20 = v27;
          goto LABEL_15;
        }
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_1EDA1BBE8 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v5, (uint64_t)qword_1EDA1D670);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v7, v21, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
  sub_1D8215580();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8218A40;
  sub_1D8215550();
  sub_1D82152E0();
  if (v14(v10, 1, v13) == 1)
  {
    sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1BFE8);
    v30 = 0u;
    v31 = 0u;
  }
  else
  {
    *((_QWORD *)&v31 + 1) = v13;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v30);
    (*(void (**)(uint64_t *, char *, uint64_t))(v26 + 32))(boxed_opaque_existential_0, v10, v13);
  }
  v20 = v27;
  sub_1D8215568();
  sub_1D81D8B6C((uint64_t)&v30, &qword_1EDA1C290);
  sub_1D8215550();
  sub_1D821561C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
  v19 = objc_allocWithZone((Class)ASKLoadImageResourceOperation);
LABEL_15:
  swift_unknownObjectRetain();
  v23 = (void *)sub_1D82152BC();
  v24 = objc_msgSend(v19, sel_initWithURLRequest_dataConsumer_, v23, v20);

  return v24;
}

unint64_t sub_1D81E7A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D8215AB4();
  sub_1D821570C();
  v4 = sub_1D8215AE4();
  return sub_1D81E7A80(a1, a2, v4);
}

unint64_t sub_1D81E7A80(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1D8215A3C() & 1) == 0)
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
      while (!v14 && (sub_1D8215A3C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t ArtworkLoader.forgetFetch(forHandlerKey:deprioritizingFetch:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  _QWORD v19[3];
  _QWORD aBlock[6];
  _OWORD v21[2];
  uint64_t v22;

  v3 = v2;
  v6 = sub_1D82154A8();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1D82154C0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(_QWORD *)(v3 + 24);
  sub_1D81E6140(a1, (uint64_t)v21);
  v15 = swift_allocObject();
  v16 = v21[1];
  *(_OWORD *)(v15 + 24) = v21[0];
  *(_QWORD *)(v15 + 16) = v3;
  *(_OWORD *)(v15 + 40) = v16;
  *(_QWORD *)(v15 + 56) = v22;
  *(_BYTE *)(v15 + 64) = a2;
  aBlock[4] = sub_1D81DDD68;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D81D7A68;
  aBlock[3] = &block_descriptor_21;
  v17 = _Block_copy(aBlock);
  swift_retain();
  sub_1D82154B4();
  v19[2] = MEMORY[0x1E0DEE9D8];
  sub_1D81E802C(&qword_1EDA1C188, v7, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1D8);
  sub_1D81E806C(&qword_1EDA1C1E0, &qword_1EDA1C1D8);
  sub_1D8215910();
  MEMORY[0x1D82AA154](0, v14, v10, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

uint64_t sub_1D81E7D74(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v26 = a2;
  v27 = a6;
  v30 = a4;
  v31 = a5;
  v28 = a3;
  v10 = sub_1D82154A8();
  v34 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1D82154C0();
  v32 = *(_QWORD *)(v13 - 8);
  v33 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1D82154CC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (uint64_t *)((char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = *(void **)(v7 + 24);
  *v19 = v20;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E0DEF738], v16);
  v29 = v20;
  LOBYTE(v20) = sub_1D82154D8();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v17 + 8))(v19, v16);
  if ((v20 & 1) != 0)
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v7;
    *(_QWORD *)(v22 + 24) = a1;
    *(_QWORD *)(v22 + 32) = v27;
    *(_QWORD *)(v22 + 40) = a7;
    v24 = v30;
    v23 = v31;
    *(_QWORD *)(v22 + 48) = v26;
    *(_QWORD *)(v22 + 56) = v24;
    *(_QWORD *)(v22 + 64) = v23;
    *(_BYTE *)(v22 + 72) = v28 & 1;
    aBlock[4] = sub_1D81DD4EC;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D81D7A68;
    aBlock[3] = &block_descriptor_70;
    v25 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1D81E3020(v24);
    sub_1D82154B4();
    v35 = MEMORY[0x1E0DEE9D8];
    sub_1D81E802C(&qword_1EDA1C188, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1D8);
    sub_1D81E806C(&qword_1EDA1C1E0, &qword_1EDA1C1D8);
    sub_1D8215910();
    MEMORY[0x1D82AA154](0, v15, v12, v25);
    _Block_release(v25);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v10);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v33);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1D81E802C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D82AAACC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D81E806C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D82AAACC](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_1D81E80AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sub_1D8215AA8();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_QWORD *)(v8 + 8 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_1D81E8174(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = *v2;
  v5 = sub_1D8215AA8();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(v4 + 48);
  if (*(_QWORD *)(v8 + 8 * v7) != a1)
  {
    v9 = ~v6;
    do
    {
      v7 = (v7 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(v8 + 8 * v7) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v2;
  v14 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1D820516C();
    v11 = v14;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v7);
  sub_1D81E827C(v7);
  *v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_1D81E827C(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1D821591C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        v12 = sub_1D8215AA8() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v2);
            if (v2 != v6 || (v2 = v6, v15 >= v11 + 1))
            {
              *v15 = *v11;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D82AAAC0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_1D81E8498(char a1)
{
  return objc_msgSend((id)objc_opt_self(), *off_1E9DB4308[a1]);
}

uint64_t sub_1D81E84D8(uint64_t a1, char a2)
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
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
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
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF68);
  v42 = a2;
  v6 = sub_1D82159DC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
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
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_22;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v40)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v41 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v40)
        goto LABEL_34;
      v23 = *(_QWORD *)(v41 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v41 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v13 >= v40)
              goto LABEL_34;
            v23 = *(_QWORD *)(v41 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v13 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((v42 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v46 = *(_QWORD *)(v25 + 32);
      v44 = v26;
      v45 = v27;
      v28 = *(_QWORD *)(v5 + 56) + 24 * v20;
      v43 = *(_OWORD *)v28;
      v29 = *(_QWORD *)(v28 + 16);
    }
    else
    {
      sub_1D81E6140(v25, (uint64_t)&v44);
      v30 = *(_QWORD *)(v5 + 56) + 24 * v20;
      v29 = *(_QWORD *)(v30 + 16);
      v43 = *(_OWORD *)v30;
      swift_unknownObjectRetain();
      swift_retain();
    }
    result = sub_1D8215928();
    v31 = -1 << *(_BYTE *)(v7 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v11 + 8 * (v32 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v11 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        v37 = *(_QWORD *)(v11 + 8 * v33);
      }
      while (v37 == -1);
      v14 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = *(_QWORD *)(v7 + 48) + 40 * v14;
    v16 = v44;
    v17 = v45;
    *(_QWORD *)(v15 + 32) = v46;
    *(_OWORD *)v15 = v16;
    *(_OWORD *)(v15 + 16) = v17;
    v18 = *(_QWORD *)(v7 + 56) + 24 * v14;
    *(_OWORD *)v18 = v43;
    *(_QWORD *)(v18 + 16) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v22 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v22, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1D81E8828(uint64_t a1, char a2)
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
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF60);
  v36 = a2;
  v6 = sub_1D82159DC();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v35 = (_QWORD *)(v5 + 64);
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
      }
      else
      {
        v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v34)
          goto LABEL_33;
        v22 = v35[v21];
        ++v13;
        if (!v22)
        {
          v13 = v21 + 1;
          if (v21 + 1 >= v34)
            goto LABEL_33;
          v22 = v35[v13];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v36 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v13 >= v34)
                  goto LABEL_33;
                v22 = v35[v13];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v13 = v23;
          }
        }
LABEL_30:
        v10 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      v28 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v20);
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 24 * v20);
      v30 = *v29;
      v31 = v29[1];
      v32 = v29[2];
      if ((v36 & 1) == 0)
      {
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_1D8215AB4();
      objc_msgSend(v28, sel_hash);
      sub_1D8215AC0();
      result = sub_1D8215AE4();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v28;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 24 * v17);
      *v18 = v30;
      v18[1] = v31;
      v18[2] = v32;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

char *sub_1D81E8B4C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF80);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D81E8C60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BCA0);
  result = sub_1D8215958();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_1D8215AA8();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

void sub_1D81E9264(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_1D81E95C4(char a1)
{
  uint64_t v1;

  if ((a1 & 1) != 0)
  {
    if ((a1 & 2) != 0)
    {
      v1 = 3;
      if ((a1 & 8) == 0)
      {
LABEL_13:
        if ((a1 & 4) == 0 || (v1 & 4) != 0)
          return v1;
        return v1 | 4;
      }
    }
    else
    {
      v1 = 1;
      if ((a1 & 8) == 0)
        goto LABEL_7;
    }
    goto LABEL_12;
  }
  if ((a1 & 2) != 0)
  {
    v1 = 2;
    if ((a1 & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v1 = 0;
  if ((a1 & 8) != 0)
  {
LABEL_12:
    v1 |= 8uLL;
    goto LABEL_13;
  }
LABEL_7:
  if ((a1 & 4) != 0)
    return v1 | 4;
  return v1;
}

uint64_t dispatch thunk of RoundedCornerView.setCorner(radius:style:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

id static UIColor.defaultLine.getter()
{
  return sub_1D81D8054(&qword_1EDA1C4F0, (id *)&qword_1EDA1BCD0);
}

uint64_t Artwork.crop.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 80);
  *a1 = *(_QWORD *)(v1 + 72);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t _s11URLTemplateVwxx()
{
  return swift_bridgeObjectRelease();
}

double ArtworkLoaderConfig.size.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

uint64_t dispatch thunk of Button.touchOutsideMargin.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

ValueMetadata *type metadata accessor for Artwork.URLTemplate()
{
  return &type metadata for Artwork.URLTemplate;
}

uint64_t dispatch thunk of PageRenderAssetLoader.isFetchingOnScreenAssets.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PageRenderAssetLoader.isFetchingAssets.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PageRenderAssetLoader.assetObserver.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

id static UIColor.appTint.getter()
{
  return sub_1D81D8054(&qword_1EDA1C510, (id *)&qword_1EDA1BD00);
}

double CGSize.scaled(_:)(double a1, double a2)
{
  return a1 * a2;
}

double Artwork.size.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

uint64_t _s11URLTemplateVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Artwork.URLTemplate.Key()
{
  return &type metadata for Artwork.URLTemplate.Key;
}

uint64_t storeEnumTagSinglePayload for Shadow(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Shadow()
{
  return &type metadata for Shadow;
}

uint64_t dispatch thunk of DynamicTypeButton.fontUseCase.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t method lookup function for DynamicTypeLabel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DynamicTypeLabel.directionalTextAlignment.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of DynamicTypeLabel.fontUseCase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t sub_1D81E97FC(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t dispatch thunk of ShadowView.setCorner(radius:style:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ShadowView.shadow.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

id sub_1D81E9914(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_systemBlueColor, &qword_1EDA1BD00);
}

id static UIColor.todayCardDefaultBackground.getter()
{
  return sub_1D81D8054(&qword_1EDA1BC08, (id *)&qword_1EDA1BA60);
}

id sub_1D81E9944(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_1EDA1BCF8);
}

id static UIColor.placeholderBackground.getter()
{
  return sub_1D81D8054(&qword_1EDA1C2B8, (id *)&qword_1EDA1BCF8);
}

id sub_1D81E9974(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_systemBackgroundColor, &qword_1EDA1BCF0);
}

id static UIColor.defaultBackground.getter()
{
  return sub_1D81D8054(&qword_1EDA1C2F0, (id *)&qword_1EDA1BCF0);
}

id sub_1D81E99A4(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_secondaryLabelColor, &qword_1EDA1BCE8);
}

id sub_1D81E99B8(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_labelColor, &qword_1EDA1BCE0);
}

id static UIColor.mediaBorder.getter()
{
  return sub_1D81D8054(&qword_1EDA1C4F8, (id *)&qword_1EDA1BCD8);
}

id sub_1D81E99E8(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_separatorColor, &qword_1EDA1BCD0);
}

uint64_t sub_1D81E99FC(uint64_t a1)
{
  return sub_1D81D65C8(a1, qword_1EDA1D670);
}

uint64_t sub_1D81E9A28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1D81E9A70()
{
  unint64_t v0;

  sub_1D81D62E4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_1D81E9B38()
{
  return sub_1D81E802C(&qword_1EDA1C560, (uint64_t (*)(uint64_t))type metadata accessor for Artwork, (uint64_t)&protocol conformance descriptor for Artwork);
}

uint64_t Artwork.template.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for Artwork.Variant()
{
  return &type metadata for Artwork.Variant;
}

uint64_t Artwork.Variant.quality.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void Artwork.Variant.format.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for Artwork.Format()
{
  return &type metadata for Artwork.Format;
}

uint64_t dispatch thunk of Artwork.bestVariant(prefersLayeredImage:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

unint64_t sub_1D81E9BB8()
{
  unint64_t result;

  result = qword_1EDA1BFF8;
  if (!qword_1EDA1BFF8)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.URLTemplate.Key, &type metadata for Artwork.URLTemplate.Key);
    atomic_store(result, (unint64_t *)&qword_1EDA1BFF8);
  }
  return result;
}

uint64_t static Artwork.URLTemplate.resourceScheme.getter()
{
  return 0x656372756F736572;
}

uint64_t Shadow.init(color:blurRadius:offset:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  *(_QWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  *(double *)(a2 + 16) = a4;
  *(double *)(a2 + 24) = a5;
  return result;
}

ValueMetadata *type metadata accessor for HashableRequestKey()
{
  return &type metadata for HashableRequestKey;
}

unint64_t sub_1D81E9C4C()
{
  unint64_t result;

  result = qword_1EDA1BDF8;
  if (!qword_1EDA1BDF8)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D8218ED4, &type metadata for HashableRequestKey);
    atomic_store(result, (unint64_t *)&qword_1EDA1BDF8);
  }
  return result;
}

uint64_t method lookup function for RoundedCornerView()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1D81E9C9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void sub_1D81E9D24()
{
  unint64_t v0;

  sub_1D81D6290();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_1D81E9D9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase;
  swift_beginAccess();
  return sub_1D81D9CD8(v3, a1);
}

void sub_1D81E9DEC()
{
  unint64_t v0;

  sub_1D81D6290();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t ArtworkLoader.isOccluded.setter(char a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_BYTE *)(v1 + 64) = a1;
  return sub_1D81D6E4C();
}

id sub_1D81E9ECC()
{
  uint64_t v0;
  char **v1;

  if (*(_BYTE *)(v0 + 16))
    v1 = &selRef_enterBackground;
  else
    v1 = &selRef_enterForeground;
  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 24) + 16), *v1);
}

unint64_t sub_1D81E9EF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA1BB30;
  if (!qword_1EDA1BB30)
  {
    v1 = type metadata accessor for ArtworkView();
    result = MEMORY[0x1D82AAACC](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA1BB30);
  }
  return result;
}

unint64_t sub_1D81E9F3C(uint64_t a1)
{
  unint64_t result;

  result = sub_1D81E9EF8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

id sub_1D81E9F60()
{
  if (qword_1EDA1C4F8 != -1)
    swift_once();
  qword_1EDA1C3F0 = qword_1EDA1BCD8;
  return (id)qword_1EDA1BCD8;
}

uint64_t AMPGetICUCharDirection()
{
  return MEMORY[0x1D82AABEC]();
}

CGFloat AMPRectWithFlippedOriginRelativeToBoundingRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v14;
  CGRect v16;
  CGRect v17;

  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  v14 = a1 - CGRectGetMinX(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  return CGRectGetMaxX(v17) - v14 - a3;
}

CGFloat AMPRectWithConditionalOriginRelativeToBoundingRect(int a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v15;
  CGRect v17;
  CGRect v18;

  if (a1)
  {
    v17.origin.x = a6;
    v17.origin.y = a7;
    v17.size.width = a8;
    v17.size.height = a9;
    v15 = a2 - CGRectGetMinX(v17);
    v18.origin.x = a6;
    v18.origin.y = a7;
    v18.size.width = a8;
    v18.size.height = a9;
    return CGRectGetMaxX(v18) - v15 - a4;
  }
  return a2;
}

CGFloat AMPRectMakeWithDirectionalOriginRelativeToBoundingRect(int a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v15;
  CGRect v17;
  CGRect v18;

  if (a1)
  {
    v17.origin.x = a6;
    v17.origin.y = a7;
    v17.size.width = a8;
    v17.size.height = a9;
    v15 = a2 - CGRectGetMinX(v17);
    v18.origin.x = a6;
    v18.origin.y = a7;
    v18.size.width = a8;
    v18.size.height = a9;
    return CGRectGetMaxX(v18) - v15 - a4;
  }
  return a2;
}

void sub_1D81EA614(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EA750(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1D81EA8E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1D81EA964(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EAA14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

double ASKHomeScreenIconsGetRoundedRectScaledCornerRadiusForSize(double a1, double a2)
{
  double Size;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  Size = ASKHomeScreenIconsGetSize();
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShape:", 1);
  objc_msgSend(v7, "continuousCornerRadius");
  v9 = a2 / v6;
  if (a1 > a2)
    v9 = a1 / Size;
  v10 = v8 * v9;

  return v10;
}

double ASKHomeScreenIconsGetScaledTVCornerRadiusForSize(double a1)
{
  return floor(a1 * 0.095 + a1 * 0.095) * 0.5;
}

void sub_1D81EB1D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D81EB2D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D81EB33C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EB3EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D81EB47C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D81EB4D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EB580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D81EB670(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EB774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1D81EB7EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EB89C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D81EBB4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81EBBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AMPICUNumberFormatter;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1D81EBC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D81EBF90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81EC120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81EC380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void AMPAddOverridesForSupportingLayoutDirectionOnUIView()
{
  if (sOverride_UIView_traitCollection != -1)
    dispatch_once(&sOverride_UIView_traitCollection, &__block_literal_global_2);
}

id swizzle_UIView_traitCollection(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  sOriginal_UIView_traitCollection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_layoutDirectionValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = objc_msgSend(v1, "_layoutDirectionFromLayoutDirectionValue:", v3), v4 != objc_msgSend(v2, "layoutDirection")))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLayoutDirection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v2;
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraitsFromCollections:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v2;
  }
  v8 = v5;

  return v8;
}

uint64_t AMPGetBidiClass(int a1)
{
  unint64_t v2;

  if (a1 == 65532)
    return 14;
  v2 = AMPGetICUCharDirection();
  if (v2 > 0x16)
    return 0;
  else
    return qword_1D8217A80[v2];
}

void sub_1D81ED00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D81ED1A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81ED2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void fillMutableSetWithRegionType(void *a1)
{
  id v1;
  int v2;
  void *v3;

  v1 = a1;
  uregion_getAvailable();
  v2 = uenum_count();
  if (v2 >= 1)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", uenum_next());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "addObject:", v3);

      --v2;
    }
    while (v2);
  }
  uenum_close();

}

void sub_1D81ED39C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81ED5F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81ED864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81EDAE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81EDB98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EDC4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EDCEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EDD8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EDDEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EDE4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EE41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1D81EE658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EE704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EE7B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D81EE8BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81EE978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D81EEAB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D81EEC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D81EED54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

size_t ___ZL15icuDataLangPathv_block_invoke()
{
  char *v0;
  size_t result;

  if (icuDataPathPrefix(void)::onceToken != -1)
    dispatch_once(&icuDataPathPrefix(void)::onceToken, &__block_literal_global_96);
  v0 = strcpy(icuDataLangPath(void)::sICUDataLangPath, (const char *)&icuDataPathPrefix(void)::sICUDataPathPrefix);
  result = strlen(v0);
  strcpy(&icuDataLangPath(void)::sICUDataLangPath[result], "lang");
  return result;
}

size_t ___ZL17icuDataPathPrefixv_block_invoke()
{
  char *v0;
  size_t result;
  char __str[16];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  u_getDataVersion();
  snprintf(__str, 0x10uLL, "%d", 0);
  strcpy((char *)&icuDataPathPrefix(void)::sICUDataPathPrefix, "icudt");
  v0 = strcat((char *)&icuDataPathPrefix(void)::sICUDataPathPrefix, __str);
  *(_WORD *)((char *)&icuDataPathPrefix(void)::sICUDataPathPrefix + strlen(v0)) = 108;
  result = strlen((const char *)&icuDataPathPrefix(void)::sICUDataPathPrefix);
  *(_WORD *)((char *)&icuDataPathPrefix(void)::sICUDataPathPrefix + result) = 45;
  return result;
}

size_t ___ZL17icuDataRegionPathv_block_invoke()
{
  char *v0;
  size_t result;

  if (icuDataPathPrefix(void)::onceToken != -1)
    dispatch_once(&icuDataPathPrefix(void)::onceToken, &__block_literal_global_96);
  v0 = strcpy(icuDataRegionPath(void)::sICUDataRegionPath, (const char *)&icuDataPathPrefix(void)::sICUDataPathPrefix);
  result = strlen(v0);
  strcpy(&icuDataRegionPath(void)::sICUDataRegionPath[result], "region");
  return result;
}

void sub_1D81EF71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void Artwork.Style.orIfUnspecified(_:)()
{
  __asm { BR              X9 }
}

uint64_t sub_1D81EF838()
{
  _BYTE *v0;
  char v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v0 = v1;
  return result;
}

BOOL sub_1D81EF900(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1D81EF90C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x64656D616ELL;
    else
      v3 = 0x63696D616E7964;
    if (v2 == 1)
      v4 = 0xE500000000000000;
    else
      v4 = 0xE700000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x64656D616ELL;
      else
        v6 = 0x63696D616E7964;
      if (v5 == 1)
        v7 = 0xE500000000000000;
      else
        v7 = 0xE700000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE300000000000000;
    v3 = 6449010;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE300000000000000;
  if (v3 != 6449010)
  {
LABEL_21:
    v8 = sub_1D8215A3C();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_1D81EFA0C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1D81EFA68(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1D81EFB70 + 4 * byte_1D8217B60[a2]))(0x72476D6574737973);
}

uint64_t sub_1D81EFB70(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x72476D6574737973 && v1 == 0xEB000000006E6565)
    v2 = 1;
  else
    v2 = sub_1D8215A3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1D81EFCC4(char a1, char a2)
{
  char v2;

  if (*(_QWORD *)&aBlack_1[8 * a1] == *(_QWORD *)&aBlack_1[8 * a2])
    v2 = 1;
  else
    v2 = sub_1D8215A3C();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

void sub_1D81EFD28(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1D81EFD68(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1D81EFDB0 + 4 * byte_1D8217B7B[a2]))(1734701162);
}

uint64_t sub_1D81EFDB0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1734701162 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_1D8215A3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1D81EFE3C(char a1, char a2)
{
  char v2;

  if (*(_QWORD *)&aW_0[8 * a1] == *(_QWORD *)&aW_0[8 * a2])
    v2 = 1;
  else
    v2 = sub_1D8215A3C();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

double Artwork.Style.iconHeight(fromWidth:)(double result)
{
  unsigned __int8 *v1;
  int v2;
  double v3;

  v2 = *v1;
  if (((1 << v2) & 0x57) == 0)
  {
    v3 = result * 3.0;
    if (v2 == 3)
      return v3 * 0.25;
    else
      return v3 / 5.0;
  }
  return result;
}

double Artwork.Style.iconWidth(fromHeight:)(double result)
{
  unsigned __int8 *v1;
  int v2;
  double v3;

  v2 = *v1;
  if (((1 << v2) & 0x57) == 0)
  {
    if (v2 == 3)
      v3 = 4.0;
    else
      v3 = 5.0;
    return result * v3 / 3.0;
  }
  return result;
}

void Artwork.Style.cornerStyle.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = (0x44u >> *v1) & 1;
}

uint64_t Artwork.Style.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1D81EFF74 + 4 * byte_1D8217B86[*v0]))(0x6669636570736E75, 0xEB00000000646569);
}

uint64_t sub_1D81EFF74()
{
  return 0x526465646E756F72;
}

uint64_t sub_1D81EFF94()
{
  return 0x646E756F72;
}

uint64_t sub_1D81EFFA8()
{
  return 1819044208;
}

uint64_t sub_1D81EFFB8()
{
  return 7364969;
}

uint64_t sub_1D81EFFC8()
{
  return 0x746365527674;
}

uint64_t sub_1D81EFFDC()
{
  return 0x656E726F64616E75;
}

void sub_1D81EFFF8(char *a1)
{
  sub_1D81DD248(*a1);
}

void sub_1D81F0004()
{
  char *v0;

  sub_1D81F00F4(0, *v0);
}

void sub_1D81F0010()
{
  __asm { BR              X10 }
}

uint64_t sub_1D81F0054()
{
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

void sub_1D81F00EC(uint64_t a1)
{
  char *v1;

  sub_1D81F00F4(a1, *v1);
}

void sub_1D81F00F4(uint64_t a1, char a2)
{
  sub_1D8215AB4();
  __asm { BR              X10 }
}

uint64_t sub_1D81F0148()
{
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D81F01F4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1D81F022C + 4 * byte_1D8217B9B[*v0]))();
}

void sub_1D81F022C(_QWORD *a1@<X8>)
{
  *a1 = 0x526465646E756F72;
  a1[1] = 0xEB00000000746365;
}

void sub_1D81F0250(_QWORD *a1@<X8>)
{
  *a1 = 0x646E756F72;
  a1[1] = 0xE500000000000000;
}

void sub_1D81F0268(_QWORD *a1@<X8>)
{
  *a1 = 1819044208;
  a1[1] = 0xE400000000000000;
}

void sub_1D81F027C(_QWORD *a1@<X8>)
{
  *a1 = 7364969;
  a1[1] = 0xE300000000000000;
}

void sub_1D81F0290(_QWORD *a1@<X8>)
{
  *a1 = 0x746365527674;
  a1[1] = 0xE600000000000000;
}

void sub_1D81F02A8(_QWORD *a1@<X8>)
{
  *a1 = 0x656E726F64616E75;
  a1[1] = 0xE900000000000064;
}

unint64_t sub_1D81F02CC()
{
  unint64_t result;

  result = qword_1EDA1BA78;
  if (!qword_1EDA1BA78)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Style, &type metadata for Artwork.Style);
    atomic_store(result, (unint64_t *)&qword_1EDA1BA78);
  }
  return result;
}

uint64_t _s5StyleOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D81F035C + 4 * byte_1D8217BA7[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1D81F0390 + 4 * byte_1D8217BA2[v4]))();
}

uint64_t sub_1D81F0390(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D81F0398(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D81F03A0);
  return result;
}

uint64_t sub_1D81F03AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D81F03B4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1D81F03B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D81F03C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Shadow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_1D81F040C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D81F042C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1EDA1BA98);
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1EDA1BAA0);
}

void type metadata accessor for ASKImageRenderIntent(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1F0167D98);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1EDA1BAA8);
}

void type metadata accessor for ContentMode(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1F0167DA0);
}

void type metadata accessor for UIRectCorner(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1F0167DA8);
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1EDA1BF38);
}

uint64_t sub_1D81F04E4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D81F0504(uint64_t result, int a2, int a3)
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
  sub_1D81F0DA0(a1, &qword_1F0167DB0);
}

void type metadata accessor for ResourceLoadReason(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1F0167DB8);
}

void type metadata accessor for NSWritingDirection(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1F0167DC0);
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1EDA1BF50);
}

uint64_t sub_1D81F057C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1D81F05D0(uint64_t a1, uint64_t a2)
{
  return sub_1D81F0BB8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1D81F05E8(uint64_t a1, uint64_t a2)
{
  return sub_1D81F0BB8(a1, a2, MEMORY[0x1E0DEA950]);
}

void sub_1D81F05FC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1D81F0604@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1D81F0618@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1D81F062C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1D81F065C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1D81F0688@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1D81F06AC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1D81F06C0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1D81F06D4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1D81F06E8()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1D81F06F8()
{
  return sub_1D8215904();
}

_QWORD *sub_1D81F0710(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1D81F0724@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1D81F0738(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1D81F074C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

BOOL sub_1D81F0760(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1D81F0774(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

uint64_t sub_1D81F0788(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1D82156B8();
  *a2 = 0;
  return result;
}

uint64_t sub_1D81F07FC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1D82156C4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1D81F0878@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1D82156D0();
  v2 = sub_1D82156AC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1D81F08BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1D82156D0();
  v2 = v1;
  if (v0 == sub_1D82156D0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1D8215A3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1D81F0944@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1D81F0D54(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_1D81F0980(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_1D81F098C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1D81F099C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1D81F09B4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1D81F09C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1D82156AC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1D81F0A04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1D82156D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D81F0A2C()
{
  sub_1D81E802C((unint64_t *)&qword_1EDA1C228, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1D8218290);
  sub_1D81E802C(&qword_1F0167E18, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1D82181E4);
  return sub_1D82159F4();
}

uint64_t sub_1D81F0AB0()
{
  sub_1D81E802C(&qword_1F0167DF8, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1D8217ED8);
  sub_1D81E802C(&qword_1F0167E00, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1D8217E78);
  return sub_1D82159F4();
}

uint64_t sub_1D81F0B34()
{
  return sub_1D81E802C(&qword_1F0167DC8, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1D8217E3C);
}

uint64_t sub_1D81F0B60()
{
  return sub_1D81E802C(&qword_1F0167DD0, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1D8217E10);
}

uint64_t sub_1D81F0B8C()
{
  return sub_1D81E802C(&qword_1EDA1BF30, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1D8217EAC);
}

uint64_t sub_1D81F0BB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1D82156D0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1D81F0BF4()
{
  sub_1D82156D0();
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D81F0C34()
{
  uint64_t v0;

  sub_1D82156D0();
  sub_1D8215AB4();
  sub_1D821570C();
  v0 = sub_1D8215AE4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1D81F0CA4()
{
  return sub_1D81E802C(&qword_1F0167DD8, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1D8217F9C);
}

uint64_t sub_1D81F0CD0()
{
  return sub_1D81E802C(&qword_1F0167DE0, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1D8217F68);
}

uint64_t sub_1D81F0CFC()
{
  return sub_1D81E802C(&qword_1F0167DE8, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1D8217FC8);
}

uint64_t sub_1D81F0D28()
{
  return sub_1D81E802C(&qword_1F0167DF0, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1D8218004);
}

uint64_t sub_1D81F0D54(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1D81F0DA0(a1, &qword_1EDA1C238);
}

void sub_1D81F0DA0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D81F0DE4()
{
  return sub_1D81E802C(&qword_1F0167E08, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1D82181A8);
}

uint64_t sub_1D81F0E10()
{
  return sub_1D81E802C(&qword_1F0167E10, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1D821817C);
}

uint64_t sub_1D81F0E3C()
{
  return sub_1D81E802C(&qword_1EDA1C230, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1D8218218);
}

id sub_1D81F0EDC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString;
  v2 = *(void **)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  }
  else
  {
    v4 = sub_1D81F0FA8(*(void **)(v0 + OBJC_IVAR___AMPLanguageAwareString_baseAttributedString), *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_paragraphs));
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_1D81F0F94(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  *(_QWORD *)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString) = a1;

}

id sub_1D81F0FA8(void *a1, unint64_t a2)
{
  id result;
  uint64_t v3;
  uint64_t v4;
  id i;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t inited;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  BOOL v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (a1)
    return a1;
  v3 = a2;
  v4 = a2 >> 62;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v18 = sub_1D82159C4();
    swift_bridgeObjectRelease();
    if (v18 != 1)
      goto LABEL_15;
    swift_bridgeObjectRetain();
    if (!sub_1D82159C4())
    {
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
  }
  else
  {
    if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10) != 1)
      goto LABEL_15;
    swift_bridgeObjectRetain();
  }
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_36;
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    for (i = *(id *)(v3 + 32); ; i = (id)MEMORY[0x1D82AA2D4](0, v3))
    {
      v6 = i;
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_directionalRangeValue);

      swift_bridgeObjectRetain();
      v7 = sub_1D8215748();
      swift_bridgeObjectRelease();
      if (!v32 && v33 == v7)
      {
        v8 = (void *)sub_1D81F44E4(v34);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C280);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1D8218310;
        v10 = (void *)*MEMORY[0x1E0DC1178];
        *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1178];
        *(_QWORD *)(inited + 64) = sub_1D81D898C(0, &qword_1EDA1C208);
        *(_QWORD *)(inited + 40) = v8;
        v11 = v8;
        swift_bridgeObjectRetain();
        v12 = v11;
        v13 = v10;
        sub_1D820EE5C(inited);
        v14 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
        v15 = (void *)sub_1D82156AC();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_1D81F6204();
        v16 = (void *)sub_1D8215670();
        swift_bridgeObjectRelease();
        v17 = objc_msgSend(v14, sel_initWithString_attributes_, v15, v16);

        return v17;
      }
LABEL_15:
      v19 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
      swift_bridgeObjectRetain();
      v20 = (void *)sub_1D82156AC();
      swift_bridgeObjectRelease();
      v31 = objc_msgSend(v19, sel_initWithString_, v20);

      if (v4)
      {
        swift_bridgeObjectRetain();
        v21 = sub_1D82159C4();
        if (!v21)
        {
LABEL_34:
          swift_bridgeObjectRelease();
          v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v31);

          return v30;
        }
      }
      else
      {
        v21 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v21)
          goto LABEL_34;
      }
      v22 = v3 & 0xC000000000000001;
      v23 = 4;
      v24 = *MEMORY[0x1E0DC1178];
      v25 = v3;
      while (1)
      {
        v4 = v23 - 4;
        v28 = v22 ? (id)MEMORY[0x1D82AA2D4](v23 - 4, v3) : *(id *)(v3 + 8 * v23);
        v29 = v28;
        v3 = v23 - 3;
        if (__OFADD__(v4, 1))
          break;
        objc_msgSend(v28, sel_directionalRangeValue);
        if (v34 == -1)
        {
          v26 = &qword_1EDA1D6E8;
          if (qword_1EDA1C2E8 != -1)
          {
            swift_once();
            v26 = &qword_1EDA1D6E8;
          }
        }
        else if (v34 == 1)
        {
          v26 = &qword_1F016A420;
          if (qword_1F0167CE8 != -1)
          {
            swift_once();
            v26 = &qword_1F016A420;
          }
        }
        else
        {
          if (v34)
            goto LABEL_38;
          v26 = &qword_1EDA1D6E0;
          if (qword_1EDA1C420 != -1)
          {
            swift_once();
            v26 = &qword_1EDA1D6E0;
          }
        }
        objc_msgSend(v31, sel_addAttribute_value_range_, v24, *v26, v32, v33);

        ++v23;
        v27 = v3 == v21;
        v3 = v25;
        if (v27)
          goto LABEL_34;
      }
      __break(1u);
LABEL_36:
      ;
    }
  }
  __break(1u);
LABEL_38:
  sub_1D821597C();
  swift_bridgeObjectRelease();
  sub_1D8215A0C();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  result = (id)sub_1D82159B8();
  __break(1u);
  return result;
}

void (*sub_1D81F14DC(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1D81F0EDC();
  return sub_1D81F1510;
}

void sub_1D81F1510(uint64_t *a1, uint64_t a2)
{
  sub_1D81F1CD8(a1, a2, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
}

uint64_t LanguageAwareString.string.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1D81F15D0()
{
  return sub_1D81F171C(&OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase, MEMORY[0x1E0CB2470]);
}

void sub_1D81F1618(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
  *(_QWORD *)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase) = a1;

}

id LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_1D81F4658(a1, a2, a3, a4, a5);

  return v12;
}

void (*sub_1D81F1698(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1D81F15D0();
  return sub_1D81F16CC;
}

void sub_1D81F16CC(uint64_t *a1, uint64_t a2)
{
  sub_1D81F1CD8(a1, a2, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
}

id sub_1D81F1708()
{
  return sub_1D81F171C(&OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase, MEMORY[0x1E0CB2478]);
}

id sub_1D81F171C(uint64_t *a1, uint64_t (*a2)(_QWORD, unint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v7 = v2;
    v8 = sub_1D81E04C0();
    v9 = a2(MEMORY[0x1E0DEA968], v8);
    v11 = v10;
    swift_beginAccess();
    v12 = byte_1F0167E20;
    swift_beginAccess();
    v13 = byte_1F0167E21;
    v14 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    v15 = sub_1D81F4658(v9, v11, 0, v12, v13);
    v16 = *(void **)(v7 + v3);
    *(_QWORD *)(v7 + v3) = v15;
    v5 = v15;

    v4 = 0;
  }
  v17 = v4;
  return v5;
}

void sub_1D81F1858(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
  *(_QWORD *)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase) = a1;

}

void (*sub_1D81F186C(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1D81F1708();
  return sub_1D81F18A0;
}

void sub_1D81F18A0(uint64_t *a1, uint64_t a2)
{
  sub_1D81F1CD8(a1, a2, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
}

id sub_1D81F18DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v1 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace;
  v2 = *(void **)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  }
  else
  {
    v4 = v0;
    sub_1D81E04C0();
    v5 = sub_1D82158EC();
    v7 = v6;
    swift_beginAccess();
    v8 = byte_1F0167E20;
    swift_beginAccess();
    v9 = byte_1F0167E21;
    v10 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    v11 = sub_1D81F4658(v5, v7, 0, v8, v9);
    v12 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v11;
    v3 = v11;

    v2 = 0;
  }
  v13 = v2;
  return v3;
}

void sub_1D81F1A5C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  *(_QWORD *)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace) = a1;

}

void (*sub_1D81F1A70(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1D81F18DC();
  return sub_1D81F1AA4;
}

void sub_1D81F1AA4(uint64_t *a1, uint64_t a2)
{
  sub_1D81F1CD8(a1, a2, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
}

id sub_1D81F1AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = sub_1D821534C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed;
  v7 = *(void **)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  if (v7)
  {
    v8 = *(id *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string + 8);
    v21 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string);
    v22 = v9;
    swift_bridgeObjectRetain();
    sub_1D8215328();
    sub_1D81E04C0();
    v10 = sub_1D82158D4();
    v12 = v11;
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v13 = byte_1F0167E20;
    swift_beginAccess();
    v14 = byte_1F0167E21;
    v15 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    v16 = sub_1D81F4658(v10, v12, 0, v13, v14);
    v17 = *(void **)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v16;
    v8 = v16;

    v7 = 0;
  }
  v18 = v7;
  return v8;
}

void sub_1D81F1C84(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  *(_QWORD *)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed) = a1;

}

void (*sub_1D81F1C98(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1D81F1AE0();
  return sub_1D81F1CCC;
}

void sub_1D81F1CCC(uint64_t *a1, uint64_t a2)
{
  sub_1D81F1CD8(a1, a2, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
}

void sub_1D81F1CD8(uint64_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v4 = *a1;
  v3 = a1[1];
  v5 = *(void **)(v3 + *a3);
  *(_QWORD *)(v3 + *a3) = v4;

}

uint64_t LanguageAwareString.numbers.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_1D81F1D58()
{
  void *v0;

  sub_1D81D898C(0, &qword_1EDA1BF48);
  swift_bridgeObjectRetain();
  v0 = (void *)sub_1D821576C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LanguageAwareString.paragraphs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LanguageAwareString.words.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1D81F1E20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange;
  if (*(_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange + 16) != 1)
    return *(_QWORD *)v1;
  v2 = sub_1D81F2000();
  result = 0;
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = v2;
  *(_BYTE *)(v1 + 16) = 0;
  return result;
}

uint64_t sub_1D81F1E84(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = v2 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange;
  *(_QWORD *)v3 = result;
  *(_QWORD *)(v3 + 8) = a2;
  *(_BYTE *)(v3 + 16) = 0;
  return result;
}

__n128 (*sub_1D81F1E9C(uint64_t *a1))(__n128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_1D81F1E20();
  a1[1] = v3;
  return sub_1D81F1ED0;
}

__n128 sub_1D81F1ED0(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  v1 = a1[1].n128_u64[0] + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange;
  result = *a1;
  *(__n128 *)v1 = *a1;
  *(_BYTE *)(v1 + 16) = 0;
  return result;
}

BOOL sub_1D81F1F14()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty);
  if (v1 != 2)
    return v1 & 1;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string + 8);
  if ((v2 & 0x2000000000000000) != 0)
    v3 = HIBYTE(v2) & 0xF;
  else
    v3 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string) & 0xFFFFFFFFFFFFLL;
  result = v3 == 0;
  *(_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = result;
  return result;
}

uint64_t sub_1D81F1F70(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = result;
  return result;
}

uint64_t (*sub_1D81F1F80(uint64_t a1))(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = sub_1D81F1F14();
  return sub_1D81F1FB8;
}

uint64_t sub_1D81F1FB8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)result + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = *(_BYTE *)(result + 8);
  return result;
}

uint64_t sub_1D81F2000()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count);
  if (*(_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count + 8) != 1)
    return *(_QWORD *)v1;
  swift_bridgeObjectRetain();
  v2 = sub_1D8215748();
  swift_bridgeObjectRelease();
  *(_QWORD *)v1 = v2;
  v1[8] = 0;
  return v2;
}

uint64_t sub_1D81F2094(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count;
  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

_QWORD *(*sub_1D81F20AC(uint64_t *a1))(_QWORD *result)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1D81F2000();
  return sub_1D81F20E0;
}

_QWORD *sub_1D81F20E0(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1] + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count;
  *(_QWORD *)v1 = *result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

unint64_t sub_1D81F211C()
{
  uint64_t v0;
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count);
  if (*(_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count + 8) != 1)
    return *(_QWORD *)v1;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string + 8);
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_string);
  v5 = 7;
  if (((v3 >> 60) & ((v2 & 0x800000000000000) == 0)) != 0)
    v5 = 11;
  result = sub_1D81F41CC(0xFuLL, v5 | (v4 << 16), v2, v3);
  *(_QWORD *)v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t sub_1D81F21B8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count;
  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

_QWORD *(*sub_1D81F21D0(unint64_t *a1))(_QWORD *result)
{
  unint64_t v1;

  a1[1] = v1;
  *a1 = sub_1D81F211C();
  return sub_1D81F2204;
}

_QWORD *sub_1D81F2204(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1] + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count;
  *(_QWORD *)v1 = *result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

uint64_t sub_1D81F2250()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount);
  if (*(_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount + 8) != 1)
    return *(_QWORD *)v1;
  result = sub_1D8215718();
  *(_QWORD *)v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t sub_1D81F22BC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount;
  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

_QWORD *(*sub_1D81F22D4(uint64_t *a1))(_QWORD *result)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1D81F2250();
  return sub_1D81F2308;
}

_QWORD *sub_1D81F2308(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1] + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount;
  *(_QWORD *)v1 = *result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

uint64_t static LanguageAwareString.alwaysGenerateAttributedString.getter()
{
  swift_beginAccess();
  return byte_1F0167E20;
}

uint64_t static LanguageAwareString.alwaysGenerateAttributedString.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1F0167E20 = a1;
  return result;
}

uint64_t (*static LanguageAwareString.alwaysGenerateAttributedString.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static LanguageAwareString.keepStatisticsOnLanguageComponents.getter()
{
  swift_beginAccess();
  return byte_1F0167E21;
}

uint64_t type metadata accessor for LanguageAwareString()
{
  return objc_opt_self();
}

uint64_t static LanguageAwareString.keepStatisticsOnLanguageComponents.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1F0167E21 = a1;
  return result;
}

uint64_t (*static LanguageAwareString.keepStatisticsOnLanguageComponents.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static LanguageAwareString.delegate.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t static LanguageAwareString.delegate.setter(uint64_t a1)
{
  swift_beginAccess();
  qword_1EDA1BAC8 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*static LanguageAwareString.delegate.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1D81F274C()
{
  char v0;
  char v1;
  id v2;
  id result;

  swift_beginAccess();
  v0 = byte_1F0167E20;
  swift_beginAccess();
  v1 = byte_1F0167E21;
  v2 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
  result = sub_1D81F4658(0, 0xE000000000000000, 0, v0, v1);
  qword_1F0167E28 = (uint64_t)result;
  return result;
}

id static LanguageAwareString.empty.getter()
{
  if (qword_1F0167CE0 != -1)
    swift_once();
  return (id)qword_1F0167E28;
}

id LanguageAwareString.__allocating_init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(void *a1, void *a2, char a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_1D81F4DC8(a1, a2, a3);

  return v8;
}

id LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(void *a1, void *a2, char a3)
{
  id v5;

  v5 = sub_1D81F4DC8(a1, a2, a3);

  return v5;
}

id LanguageAwareString.__allocating_init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_1D81F5120(a1, a2, a3, a4, a5);

  return v12;
}

id LanguageAwareString.init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  id v6;

  v6 = sub_1D81F5120(a1, a2, a3, a4, a5);

  return v6;
}

uint64_t LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  objc_class *v4;
  objc_class *v5;
  id v10;
  uint64_t ObjectType;
  uint64_t v12;

  v5 = v4;
  v10 = objc_allocWithZone(v5);
  if (a2)
  {
    ObjectType = swift_getObjectType();
    swift_beginAccess();
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(ObjectType + 504))(a1, a2, a3, a4 & 1, byte_1F0167E21);
    swift_deallocPartialClassInstance();
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v12;
}

uint64_t LanguageAwareString.init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t ObjectType;
  uint64_t v9;

  if (a2)
  {
    ObjectType = swift_getObjectType();
    swift_beginAccess();
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(ObjectType + 504))(a1, a2, a3, a4 & 1, byte_1F0167E21);
    swift_deallocPartialClassInstance();
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v9;
}

id LanguageAwareString.init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
{
  id v6;

  v6 = sub_1D81F4658(a1, a2, a3, a4, a5);

  return v6;
}

id LanguageAwareString.__allocating_init(_:attributes:keepStatisticsOnLanguageComponents:)(void *a1, uint64_t a2, char a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_1D81F57FC((uint64_t)a1, a2, a3);

  return v8;
}

id LanguageAwareString.init(_:attributes:keepStatisticsOnLanguageComponents:)(void *a1, uint64_t a2, char a3)
{
  id v4;

  v4 = sub_1D81F57FC((uint64_t)a1, a2, a3);

  return v4;
}

id LanguageAwareString.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return LanguageAwareString.init(from:)(a1);
}

id LanguageAwareString.init(from:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  char *v28;
  char v29;
  id v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  id v79;
  id v80;
  id v81;
  id v82;
  int v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v92;
  objc_super v93;
  uint64_t v94[3];
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;

  v3 = v1;
  v4 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString;
  *(_QWORD *)&v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString] = 0;
  v5 = OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage;
  *(_QWORD *)&v1[OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage] = 0;
  v6 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase;
  *(_QWORD *)&v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase] = 0;
  v7 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase;
  *(_QWORD *)&v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase] = 0;
  v87 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace;
  *(_QWORD *)&v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  v89 = OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed;
  *(_QWORD *)&v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed] = 0;
  v8 = &v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty] = 2;
  v9 = &v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = &v1[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v92 = v1;
  sub_1D8215AF0();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v94, v95);
    v16 = sub_1D8215A48();
    v18 = v17;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v94);
    swift_beginAccess();
    v19 = (void *)qword_1EDA1BAC8;
    if (qword_1EDA1BAC8)
    {
      swift_unknownObjectRetain();
      v20 = (void *)sub_1D82156AC();
      swift_bridgeObjectRelease();
      v21 = objc_msgSend(v19, sel_preprocessForLanguageAwarenessString_, v20);

      v90 = sub_1D82156D0();
      v23 = v22;
      swift_bridgeObjectRelease();

      swift_unknownObjectRelease();
      v18 = v23;
    }
    else
    {
      v90 = v16;
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    if (byte_1F0167E20 == 1)
    {
      v24 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
      swift_bridgeObjectRetain();
      v25 = (void *)sub_1D82156AC();
      swift_bridgeObjectRelease();
      v26 = objc_msgSend(v24, sel_initWithString_, v25);

      v27 = 0;
    }
    else
    {
      v27 = (void *)sub_1D82156AC();
      v26 = 0;
    }
    v28 = v92;
    swift_beginAccess();
    v29 = byte_1F0167E21;
    v30 = v26;
    v84 = v27;
    sub_1D81FF268(v26, v27, 0, v29, (uint64_t)v94);
    v31 = v94[2];
    v85 = v94[0];
    v86 = v94[1];
    v32 = v26;
    v33 = v95;
    v83 = v96;
    v34 = v97;

    v82 = v32;
    v88 = v33;
    if (v32)
    {
      if (v34)
      {
        v35 = *(_QWORD *)(v34 + 16);
        if (v35)
        {
          v36 = v30;
          swift_bridgeObjectRetain();
          for (i = 0; i != v35; ++i)
          {
            v38 = *(_QWORD *)(v34 + 8 * i + 32);
            v94[0] = v38;
            sub_1D820D72C(v94, v36, v31);
          }
          swift_bridgeObjectRelease_n();

          v33 = v88;
LABEL_23:
          v48 = v83;
          if (!v82)
          {
            if ((v83 & 1) != 0)
            {
LABEL_25:
              v77 = v31;
              v80 = v30;
              v49 = sub_1D81F0FA8(0, v31);
              *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = v49;
              v50 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
              v51 = v49;
              v52 = objc_msgSend(v50, sel_initWithAttributedString_, v51);
              if (qword_1F0167D00 != -1)
                swift_once();
              v53 = qword_1F0168198;
              v54 = objc_retainAutorelease(v52);
              objc_msgSend(v54, sel_performSelector_, v53);
              v55 = objc_msgSend(v54, sel_string);
              v56 = sub_1D82156D0();
              v58 = v57;

              swift_bridgeObjectRelease();
              v59 = &v28[OBJC_IVAR___AMPLanguageAwareString_string];
              *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_string] = v56;
              v18 = v58;
              v31 = v77;
              v30 = v80;
              goto LABEL_44;
            }
            goto LABEL_40;
          }
LABEL_30:
          objc_msgSend(v30, sel_copy);
          sub_1D82158F8();
          swift_unknownObjectRelease();
          sub_1D81D898C(0, &qword_1EDA1BF28);
          if (swift_dynamicCast())
            v60 = v98;
          else
            v60 = 0;
          *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = v60;
          if (v48)
          {
            v78 = v31;
            v81 = v30;
            v61 = qword_1F0167D00;
            v62 = v30;
            v63 = v60;
            if (v61 != -1)
              swift_once();
            v64 = qword_1F0168198;
            v65 = objc_retainAutorelease(v62);
            objc_msgSend(v65, sel_performSelector_, v64);
            v66 = objc_msgSend(v65, sel_string);
            v67 = sub_1D82156D0();
            v69 = v68;
            swift_bridgeObjectRelease();

            v59 = &v28[OBJC_IVAR___AMPLanguageAwareString_string];
            *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_string] = v67;
            v18 = v69;
            v31 = v78;
            v30 = v81;
            goto LABEL_43;
          }
          if (v60)
          {
            v70 = v60;
            v71 = objc_msgSend(v70, sel_string);
            v72 = sub_1D82156D0();
            v73 = v31;
            v75 = v74;

            swift_bridgeObjectRelease();
            v18 = v75;
            v31 = v73;
LABEL_42:

            v59 = &v28[OBJC_IVAR___AMPLanguageAwareString_string];
            *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_string] = v72;
LABEL_43:
            v33 = v88;
LABEL_44:
            *((_QWORD *)v59 + 1) = v18;
            *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_paragraphs] = v31;
            *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_numbers] = v85;
            *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_words] = v86;
            *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections] = v33;

            v93.receiver = v28;
            v93.super_class = (Class)type metadata accessor for LanguageAwareString();
            v13 = objc_msgSendSuper2(&v93, sel_init);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
            return v13;
          }
LABEL_41:
          v72 = v90;
          goto LABEL_42;
        }
        swift_bridgeObjectRelease();
      }
      v48 = v83;
      goto LABEL_30;
    }
    if (!v34)
    {
      if ((v83 & 1) != 0)
        goto LABEL_25;
LABEL_40:
      *(_QWORD *)&v28[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = 0;
      goto LABEL_41;
    }
    v79 = v30;
    v39 = (void *)sub_1D82156AC();
    objc_msgSend(v39, sel_mutableCopy);

    sub_1D82158F8();
    swift_unknownObjectRelease();
    sub_1D81D898C(0, &qword_1F0167EC0);
    swift_dynamicCast();
    v40 = v98;
    v41 = *(_QWORD *)(v34 + 16);
    if (v41)
    {
      v76 = v31;
      swift_bridgeObjectRetain();
      v42 = 0;
      do
      {
        v43 = *(_QWORD *)(v34 + 8 * v42++ + 32);
        v44 = (void *)sub_1D82156AC();
        objc_msgSend(v40, sel_replaceCharactersInRange_withString_, v43, 1, v44);

      }
      while (v41 != v42);
      swift_bridgeObjectRelease();
      v28 = v92;
      v33 = v88;
      v31 = v76;
    }
    swift_bridgeObjectRelease();
    objc_msgSend(v40, sel_copy);
    sub_1D82158F8();
    swift_unknownObjectRelease();
    sub_1D81D898C(0, &qword_1F0167EC8);
    swift_dynamicCast();
    v45 = v98;
    v90 = sub_1D82156D0();
    v47 = v46;
    swift_bridgeObjectRelease();

    v18 = v47;
    v30 = v79;
    goto LABEL_23;
  }
  v13 = v92;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

  v14 = *(void **)&v3[v89];
  type metadata accessor for LanguageAwareString();
  swift_deallocPartialClassInstance();
  return v13;
}

uint64_t sub_1D81F3794(uint64_t a1)
{
  id v2;
  id v3;
  char v4;
  char v5;

  v2 = sub_1D81F0EDC();
  v3 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a1);
  v5 = v4;

  if ((v5 & 1) != 0)
    return -1;
  else
    return (uint64_t)v3;
}

uint64_t sub_1D81F3854()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection);
  if (*(_BYTE *)(v0 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection + 8) != 1)
    return *(_QWORD *)v1;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections);
  if (*(_BYTE *)(v2 + OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts) == 1)
    result = *(unsigned __int8 *)(v2 + OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough);
  else
    result = -1;
  *(_QWORD *)v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t sub_1D81F38D4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

_QWORD *(*sub_1D81F38EC(uint64_t *a1))(_QWORD *result)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1D81F3854();
  return sub_1D81F3920;
}

_QWORD *sub_1D81F3920(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1] + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(_QWORD *)v1 = *result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

void sub_1D81F393C(uint64_t a1, id a2, id a3, char a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;

  v6 = *(_QWORD *)(v5 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections);
  if (*(_BYTE *)(v6 + OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts) == 1)
  {
    v12 = *(_QWORD *)(v6 + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight);
    v13 = *(_QWORD *)(v6 + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
    if (v12)
    {
      if (!v13)
        return;
    }
    else if (v13)
    {
      return;
    }
    if ((a4 & 1) == 0 || (v14 = *(void **)(v5 + OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage)) == 0)
    {
      v35 = sub_1D81F0EDC();
      v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1320]), sel_initWithAttributedString_, v35);

      v37 = objc_allocWithZone(MEMORY[0x1E0DC1280]);
      v15 = v36;
      v18 = objc_msgSend(v37, sel_init);
      objc_msgSend(v15, sel_addLayoutManager_, v18);
      v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC12C0]), sel_initWithSize_, a5, 1.79769313e308);
      objc_msgSend(v24, sel_setLineFragmentPadding_, 0.0);
      objc_msgSend(v24, sel_setMaximumNumberOfLines_, a2);
      objc_msgSend(v24, sel_setLineBreakMode_, a3);
      objc_msgSend(v18, sel_addTextContainer_, v24);

      if ((a4 & 1) != 0)
      {
        v34 = *(void **)(v5 + OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage);
        *(_QWORD *)(v5 + OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage) = v15;
      }
      else
      {

        v34 = *(void **)(v5 + OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage);
        *(_QWORD *)(v5 + OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage) = 0;
      }
      goto LABEL_35;
    }
    v15 = v14;
    v16 = objc_msgSend(v15, sel_layoutManagers);
    sub_1D81D898C(0, &qword_1F0167ED0);
    v17 = sub_1D8215778();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = (id)sub_1D82159C4();
      swift_bridgeObjectRelease();
      if (v18)
      {
LABEL_11:
        if ((v17 & 0xC000000000000001) == 0)
        {
          if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_41;
          }
          v19 = *(id *)(v17 + 32);
LABEL_14:
          v20 = v19;
          swift_bridgeObjectRelease();
          v18 = v20;
          v21 = objc_msgSend(v18, sel_textContainers);
          sub_1D81D898C(0, &qword_1F0167ED8);
          v17 = sub_1D8215778();

          if (!(v17 >> 62))
          {
            if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_16;
            goto LABEL_42;
          }
LABEL_41:
          swift_bridgeObjectRetain();
          v40 = sub_1D82159C4();
          swift_bridgeObjectRelease();
          if (v40)
          {
LABEL_16:
            if ((v17 & 0xC000000000000001) == 0)
            {
              if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
              {
                __break(1u);
                return;
              }
              v22 = *(id *)(v17 + 32);
LABEL_19:
              v23 = v22;
              swift_bridgeObjectRelease();
              v24 = v23;
              objc_msgSend(v24, sel_size);
              v26 = v25;
              v28 = v27;
              objc_msgSend(v24, sel_lineFragmentPadding);
              v30 = v29;
              v31 = objc_msgSend(v24, sel_maximumNumberOfLines);
              v32 = objc_msgSend(v24, sel_lineBreakMode);
              v33 = v32;
              if (v26 == a5 && v28 == 1.79769313e308)
              {
                if (v30 == 0.0)
                {
                  if (v31 == a2)
                  {
                    if (v32 == a3)
                    {

                      v34 = v24;
LABEL_35:

                      objc_msgSend(v15, sel_writingDirectionOfLine_usingLayoutManager_textContainer_, a1, v18, v24);
                      return;
                    }
                    goto LABEL_33;
                  }
LABEL_31:
                  objc_msgSend(v24, sel_setMaximumNumberOfLines_, a2);
LABEL_32:
                  if (v33 == a3)
                  {
LABEL_34:

                    v38 = objc_msgSend(v15, sel_fullRange);
                    objc_msgSend(v18, sel_invalidateLayoutForCharacterRange_actualCharacterRange_, v38, v39, 0);

                    v34 = v15;
                    goto LABEL_35;
                  }
LABEL_33:
                  objc_msgSend(v24, sel_setLineBreakMode_, a3);
                  goto LABEL_34;
                }
              }
              else
              {
                objc_msgSend(v24, sel_setSize_, a5, 1.79769313e308);
                if (v30 == 0.0)
                  goto LABEL_30;
              }
              objc_msgSend(v24, sel_setLineFragmentPadding_, 0.0);
LABEL_30:
              if (v31 == a2)
                goto LABEL_32;
              goto LABEL_31;
            }
LABEL_43:
            v22 = (id)MEMORY[0x1D82AA2D4](0, v17);
            goto LABEL_19;
          }
LABEL_42:
          swift_bridgeObjectRelease();
          __break(1u);
          goto LABEL_43;
        }
LABEL_39:
        v19 = (id)MEMORY[0x1D82AA2D4](0, v17);
        goto LABEL_14;
      }
    }
    else
    {
      v18 = *(id *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v18)
        goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_39;
  }
}

id sub_1D81F3EC0()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections);
}

id LanguageAwareString.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LanguageAwareString.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LanguageAwareString.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D81F4064@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 528))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_1D81F4090()
{
  uint64_t result;

  result = sub_1D81F40D0(0);
  qword_1EDA1D6E0 = result;
  return result;
}

uint64_t sub_1D81F40B0()
{
  uint64_t result;

  result = sub_1D81F40D0(-1);
  qword_1EDA1D6E8 = result;
  return result;
}

uint64_t sub_1D81F40D0(uint64_t a1)
{
  id v2;
  uint64_t v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
  objc_msgSend(v2, sel_setAlignment_, 4);
  objc_msgSend(v2, sel_setBaseWritingDirection_, a1);
  objc_msgSend(v2, sel_setLineBreakMode_, 0);
  objc_msgSend(v2, sel_copy);
  sub_1D82158F8();

  swift_unknownObjectRelease();
  sub_1D81D898C(0, &qword_1EDA1C208);
  swift_dynamicCast();
  return v4;
}

uint64_t sub_1D81F41AC()
{
  uint64_t result;

  result = sub_1D81F40D0(1);
  qword_1F016A420 = result;
  return result;
}

unint64_t sub_1D81F41CC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  unint64_t result;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v7 = sub_1D81F43DC(a1, a3, a4);
  result = sub_1D81F43DC(a2, a3, a4);
  v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (i = 0; ; ++i)
    {
      v11 = i + 1;
      if (__OFADD__(i, 1))
        break;
      if ((a4 & 0x1000000000000000) != 0)
      {
        result = sub_1D82156E8();
        v7 = result;
      }
      else
      {
        v12 = v7 >> 16;
        if ((a4 & 0x2000000000000000) != 0)
        {
          v22 = a3;
          v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0)
            result = sub_1D8215994();
          v13 = *(unsigned __int8 *)(result + v12);
        }
        v14 = (char)v13;
        v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0)
          LOBYTE(v15) = 1;
        v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14)
        return v11;
    }
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        result = sub_1D82156F4();
        v7 = result;
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          v22 = a3;
          v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          if ((*((_BYTE *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            v20 = 0;
            do
              v21 = *((_BYTE *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            v19 = 1 - v20;
          }
          else
          {
            v19 = 1;
          }
        }
        else
        {
          result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0)
            result = sub_1D8215994();
          v17 = 0;
          do
            v18 = *(_BYTE *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          v19 = -v17;
        }
        v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14)
        return v11;
    }
    goto LABEL_36;
  }
  return 0;
}

unint64_t sub_1D81F43DC(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_1D81F4478(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_1D81FEF70(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_1D81F4478(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_1D81FF080(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
    __break(1u);
  return result;
}

uint64_t sub_1D81F44E4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t result;

  switch(a1)
  {
    case -1:
      if (qword_1EDA1C2E8 != -1)
        swift_once();
      v1 = &qword_1EDA1D6E8;
      return *v1;
    case 1:
      if (qword_1F0167CE8 != -1)
        swift_once();
      v1 = &qword_1F016A420;
      return *v1;
    case 0:
      if (qword_1EDA1C420 != -1)
        swift_once();
      v1 = &qword_1EDA1D6E0;
      return *v1;
  }
  sub_1D821597C();
  swift_bridgeObjectRelease();
  sub_1D8215A0C();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  result = sub_1D82159B8();
  __break(1u);
  return result;
}

id sub_1D81F4658(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
{
  _BYTE *v5;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  int v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  objc_super v78;
  id v79;
  uint64_t v80[4];
  unsigned __int8 v81;
  uint64_t v82;

  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed] = 0;
  v11 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty] = 2;
  v12 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  v14 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v14 = 0;
  v14[8] = 1;
  v15 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  swift_beginAccess();
  v16 = (void *)qword_1EDA1BAC8;
  if (qword_1EDA1BAC8)
  {
    v17 = v5;
    swift_unknownObjectRetain();
    v18 = (void *)sub_1D82156AC();
    v19 = objc_msgSend(v16, sel_preprocessForLanguageAwarenessString_, v18);

    a1 = sub_1D82156D0();
    v21 = v20;
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    a2 = v21;
    if ((a4 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v22 = v5;
    if ((a4 & 1) != 0)
      goto LABEL_7;
  }
  if (!a3)
  {
    v23 = (void *)sub_1D82156AC();
    v24 = 0;
    goto LABEL_8;
  }
LABEL_7:
  v25 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  swift_bridgeObjectRetain();
  v26 = (void *)sub_1D82156AC();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(v25, sel_initWithString_, v26);

  v23 = 0;
LABEL_8:
  v27 = v24;
  sub_1D81FF268(v24, v23, a3, a5 & 1, (uint64_t)v80);
  v28 = v80[2];
  v74 = v80[0];
  v75 = v80[1];
  v76 = v80[3];
  v29 = v81;
  v30 = v82;

  v77 = v23;
  if (v24)
  {
    if (v30)
    {
      v72 = v29;
      v31 = *(_QWORD *)(v30 + 16);
      if (v31)
      {
        v69 = a2;
        v32 = v27;
        swift_bridgeObjectRetain();
        for (i = 0; i != v31; ++i)
        {
          v34 = *(_QWORD *)(v30 + 8 * i + 32);
          v80[0] = v34;
          sub_1D820D72C(v80, v32, v28);
        }
        swift_bridgeObjectRelease_n();

        a2 = v69;
        v29 = v72;
      }
      else
      {
        swift_bridgeObjectRelease();
        v29 = v72;
      }
    }
    objc_msgSend(v27, sel_copy, v68);
    sub_1D82158F8();
    swift_unknownObjectRelease();
    sub_1D81D898C(0, &qword_1EDA1BF28);
    if (swift_dynamicCast())
      v52 = v79;
    else
      v52 = 0;
    *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = v52;
    if (v29)
    {
      v53 = v27;
      v54 = qword_1F0167D00;
      v71 = v53;
      v55 = v53;
      v56 = v52;
      if (v54 != -1)
        swift_once();
      v57 = qword_1F0168198;
      v58 = objc_retainAutorelease(v55);
      objc_msgSend(v58, sel_performSelector_, v57);
      v59 = objc_msgSend(v58, sel_string);
      v60 = sub_1D82156D0();
      v62 = v61;
      swift_bridgeObjectRelease();

      v51 = &v5[OBJC_IVAR___AMPLanguageAwareString_string];
      *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_string] = v60;
      a2 = v62;
      v27 = v71;
      goto LABEL_37;
    }
    if (v52)
    {
      v63 = v52;
      v64 = objc_msgSend(v63, sel_string);
      a1 = sub_1D82156D0();
      v66 = v65;

      swift_bridgeObjectRelease();
      a2 = v66;
    }
    v23 = v77;
LABEL_36:

    v51 = &v5[OBJC_IVAR___AMPLanguageAwareString_string];
    *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_string] = a1;
    goto LABEL_37;
  }
  if (v30)
  {
    v35 = (void *)sub_1D82156AC();
    objc_msgSend(v35, sel_mutableCopy);

    sub_1D82158F8();
    swift_unknownObjectRelease();
    sub_1D81D898C(0, &qword_1F0167EC0);
    swift_dynamicCast();
    v36 = *(_QWORD *)(v30 + 16);
    if (v36)
    {
      v73 = v29;
      v70 = v27;
      swift_bridgeObjectRetain();
      v37 = 0;
      do
      {
        v38 = *(_QWORD *)(v30 + 8 * v37++ + 32);
        v39 = (void *)sub_1D82156AC();
        objc_msgSend(v79, sel_replaceCharactersInRange_withString_, v38, 1, v39);

      }
      while (v36 != v37);
      swift_bridgeObjectRelease();
      v27 = v70;
      LOBYTE(v29) = v73;
    }
    swift_bridgeObjectRelease();
    objc_msgSend(v79, sel_copy);
    sub_1D82158F8();
    swift_unknownObjectRelease();
    sub_1D81D898C(0, &qword_1F0167EC8);
    swift_dynamicCast();
    a1 = sub_1D82156D0();
    a2 = v40;
    swift_bridgeObjectRelease();

  }
  if ((v29 & 1) == 0)
  {
    *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = 0;
    goto LABEL_36;
  }
  v41 = sub_1D81F0FA8(0, v28);
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = v41;
  v42 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v43 = v41;
  v44 = objc_msgSend(v42, sel_initWithAttributedString_, v43);
  if (qword_1F0167D00 != -1)
    swift_once();
  v45 = qword_1F0168198;
  v46 = objc_retainAutorelease(v44);
  objc_msgSend(v46, sel_performSelector_, v45);
  v47 = objc_msgSend(v46, sel_string);
  v48 = sub_1D82156D0();
  v50 = v49;

  swift_bridgeObjectRelease();
  v51 = &v5[OBJC_IVAR___AMPLanguageAwareString_string];
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_string] = v48;
  a2 = v50;
LABEL_37:
  *((_QWORD *)v51 + 1) = a2;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_paragraphs] = v28;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_numbers] = v74;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_words] = v75;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections] = v76;

  v78.receiver = v5;
  v78.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v78, sel_init);
}

id sub_1D81F4DC8(void *a1, void *a2, char a3)
{
  _BYTE *v3;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  _BYTE *v13;
  id v14;
  _BYTE *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;
  uint64_t v43[4];
  unsigned __int8 v44;
  uint64_t v45;

  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed] = 0;
  v7 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty] = 2;
  v8 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  swift_beginAccess();
  v12 = (void *)qword_1EDA1BAC8;
  if (qword_1EDA1BAC8
    && (objc_msgSend((id)qword_1EDA1BAC8, sel_respondsToSelector_, sel_preprocessForLanguageAwarenessAttributedString_) & 1) != 0)
  {
    v13 = v3;
    v14 = objc_msgSend(v12, sel_preprocessForLanguageAwarenessAttributedString_, a1);
  }
  else
  {
    v15 = v3;
    v14 = a1;
  }
  v16 = v14;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v14);
  v18 = v17;
  sub_1D81FF268(v17, 0, a2, a3 & 1, (uint64_t)v43);
  v19 = v43[1];
  v41 = v43[0];
  v20 = v43[2];
  v21 = v43[3];
  v22 = v44;
  v23 = v45;

  if (v23)
  {
    v24 = v19;
    v25 = *(_QWORD *)(v23 + 16);
    if (v25)
    {
      v40 = v21;
      swift_bridgeObjectRetain();
      for (i = 0; i != v25; ++i)
      {
        v27 = *(_QWORD *)(v23 + 8 * i + 32);
        v43[0] = v27;
        sub_1D820D72C(v43, v18, v20);
      }
      swift_bridgeObjectRelease();
      v21 = v40;
    }
    swift_bridgeObjectRelease();
    v19 = v24;
  }
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v18);
  v29 = v28;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = v28;
  if (v22)
  {
    v30 = qword_1F0167D00;
    v31 = v28;
    if (v30 != -1)
      swift_once();
    v32 = qword_1F0168198;
    v33 = objc_retainAutorelease(v18);
    objc_msgSend(v33, sel_performSelector_, v32);
  }
  else
  {
    v33 = v28;
  }
  v34 = objc_msgSend(v33, sel_string, v40);
  v35 = sub_1D82156D0();
  v37 = v36;

  v38 = (uint64_t *)&v3[OBJC_IVAR___AMPLanguageAwareString_string];
  *v38 = v35;
  v38[1] = v37;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString_paragraphs] = v20;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString_numbers] = v41;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString_words] = v19;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections] = v21;

  v42.receiver = v3;
  v42.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v42, sel_init);
}

id sub_1D81F5120(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  _BYTE *v5;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  void *v14;
  _BYTE *v15;
  void *v16;
  id v17;
  _BYTE *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v46;
  objc_super v47;
  uint64_t v48[4];
  unsigned __int8 v49;
  uint64_t v50;

  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed] = 0;
  v9 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty] = 2;
  v10 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = &v5[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  swift_beginAccess();
  v14 = (void *)qword_1EDA1BAC8;
  if (qword_1EDA1BAC8)
  {
    v15 = v5;
    swift_unknownObjectRetain();
    v16 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v14, sel_preprocessForLanguageAwarenessString_, v16);

    sub_1D82156D0();
    swift_unknownObjectRelease();
  }
  else
  {
    v18 = v5;
  }
  v19 = (void *)sub_1D82156AC();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_1D81F6204();
    v20 = (void *)sub_1D8215670();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithString_attributes_, v19, v20);

  v22 = v21;
  sub_1D81FF268(v21, 0, a4, a5 & 1, (uint64_t)v48);
  v24 = v48[0];
  v23 = v48[1];
  v25 = v48[2];
  v26 = v48[3];
  v27 = v49;
  v28 = v50;

  if (v28)
  {
    v29 = *(_QWORD *)(v28 + 16);
    if (v29)
    {
      v46 = v24;
      v30 = v23;
      v31 = v26;
      swift_bridgeObjectRetain();
      for (i = 0; i != v29; ++i)
      {
        v33 = *(_QWORD *)(v28 + 8 * i + 32);
        v48[0] = v33;
        sub_1D820D72C(v48, v22, v25);
      }
      swift_bridgeObjectRelease();
      v26 = v31;
      v23 = v30;
      v24 = v46;
    }
    swift_bridgeObjectRelease();
  }
  v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v22);
  v35 = v34;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = v34;
  if (v27)
  {
    v36 = qword_1F0167D00;
    v37 = v34;
    if (v36 != -1)
      swift_once();
    v38 = qword_1F0168198;
    v39 = objc_retainAutorelease(v22);
    objc_msgSend(v39, sel_performSelector_, v38);
  }
  else
  {
    v39 = v34;
  }
  v40 = objc_msgSend(v39, sel_string);
  v41 = sub_1D82156D0();
  v43 = v42;

  v44 = (uint64_t *)&v5[OBJC_IVAR___AMPLanguageAwareString_string];
  *v44 = v41;
  v44[1] = v43;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_paragraphs] = v25;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_numbers] = v24;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_words] = v23;
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections] = v26;

  v47.receiver = v5;
  v47.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v47, sel_init);
}

id sub_1D81F5508(void *a1, char a2)
{
  _BYTE *v2;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  uint64_t v35[3];
  uint64_t v36;
  unsigned __int8 v37;
  uint64_t v38;

  *(_QWORD *)&v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString] = 0;
  v5 = OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage;
  *(_QWORD *)&v2[OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed] = 0;
  v6 = &v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty] = 2;
  v7 = &v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = &v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v2[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = v2;
  sub_1D81FF268(a1, 0, 0, a2, (uint64_t)v35);
  v12 = v35[2];
  v32 = v35[0];
  v33 = v35[1];
  v13 = v36;
  v14 = v37;
  v15 = v38;
  if (v38)
  {
    v16 = *(_QWORD *)(v38 + 16);
    if (v16)
    {
      v31 = v36;
      swift_bridgeObjectRetain();
      for (i = 0; i != v16; ++i)
      {
        v18 = *(_QWORD *)(v15 + 8 * i + 32);
        v35[0] = v18;
        sub_1D820D72C(v35, a1, v12);
      }
      swift_bridgeObjectRelease();
      v13 = v31;
    }
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&v11[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = a1;
  if (v14)
  {
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, a1);
    if (qword_1F0167D00 != -1)
      swift_once();
    v20 = qword_1F0168198;
    v21 = objc_retainAutorelease(v19);
    objc_msgSend(v21, sel_performSelector_, v20);
    v22 = objc_msgSend(v21, sel_string);
    v23 = sub_1D82156D0();
    v25 = v24;

  }
  else
  {
    v22 = objc_msgSend(a1, sel_string);
    v23 = sub_1D82156D0();
    v25 = v26;
  }

  v27 = (uint64_t *)&v11[OBJC_IVAR___AMPLanguageAwareString_string];
  *v27 = v23;
  v27[1] = v25;
  v28 = *(void **)&v2[v5];
  *(_QWORD *)&v2[v5] = a1;
  v29 = a1;

  *(_QWORD *)&v11[OBJC_IVAR___AMPLanguageAwareString_paragraphs] = v12;
  *(_QWORD *)&v11[OBJC_IVAR___AMPLanguageAwareString_numbers] = v32;
  *(_QWORD *)&v11[OBJC_IVAR___AMPLanguageAwareString_words] = v33;
  *(_QWORD *)&v11[OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections] = v13;

  v34.receiver = v11;
  v34.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v34, sel_init);
}

id sub_1D81F57FC(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE *v3;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  objc_super v31;

  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed] = 0;
  v7 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty] = 2;
  v8 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v3[OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = v3;
  v13 = sub_1D81F0EDC();
  v14 = v13;
  if (a2)
  {
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v13);
    type metadata accessor for Key(0);
    sub_1D81F6204();
    v16 = (void *)sub_1D8215670();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v14, sel_fullRange);
    objc_msgSend(v15, sel_addAttributes_range_, v16, v17, v18);

    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v15);
  }
  else
  {
    v19 = v13;
  }
  *(_QWORD *)&v12[OBJC_IVAR___AMPLanguageAwareString_baseAttributedString] = v19;
  v20 = v19;
  v21 = objc_msgSend(v20, sel_string);
  v22 = sub_1D82156D0();
  v24 = v23;

  v25 = (uint64_t *)&v12[OBJC_IVAR___AMPLanguageAwareString_string];
  *v25 = v22;
  v25[1] = v24;
  if ((a3 & 1) != 0)
  {
    *(_QWORD *)&v12[OBJC_IVAR___AMPLanguageAwareString_paragraphs] = *(_QWORD *)(a1
                                                                               + OBJC_IVAR___AMPLanguageAwareString_paragraphs);
    *(_QWORD *)&v12[OBJC_IVAR___AMPLanguageAwareString_numbers] = *(_QWORD *)(a1
                                                                            + OBJC_IVAR___AMPLanguageAwareString_numbers);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();

    v26 = OBJC_IVAR___AMPLanguageAwareString_words;
    v27 = *(_QWORD *)(a1 + OBJC_IVAR___AMPLanguageAwareString_words);
    swift_bridgeObjectRetain();
  }
  else
  {
    v27 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)&v12[OBJC_IVAR___AMPLanguageAwareString_paragraphs] = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)&v12[OBJC_IVAR___AMPLanguageAwareString_numbers] = v27;

    v26 = OBJC_IVAR___AMPLanguageAwareString_words;
  }
  *(_QWORD *)&v12[v26] = v27;
  v28 = *(void **)(a1 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections);
  *(_QWORD *)&v12[OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections] = v28;
  v29 = v28;

  v31.receiver = v12;
  v31.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v31, sel_init);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id sub_1D81F5AE8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1D81F0EDC();
  *a1 = result;
  return result;
}

void sub_1D81F5B10(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
}

id sub_1D81F5B1C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1D81F15D0();
  *a1 = result;
  return result;
}

void sub_1D81F5B44(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
}

id sub_1D81F5B50@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1D81F1708();
  *a1 = result;
  return result;
}

void sub_1D81F5B78(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
}

id sub_1D81F5B84@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1D81F18DC();
  *a1 = result;
  return result;
}

void sub_1D81F5BAC(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
}

id sub_1D81F5BB8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1D81F1AE0();
  *a1 = result;
  return result;
}

void sub_1D81F5BE0(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
}

void keypath_setTm(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  id v6;
  id v7;

  v5 = *a1;
  v7 = *(id *)(*a2 + *a5);
  *(_QWORD *)(*a2 + *a5) = *a1;
  v6 = v5;

}

uint64_t sub_1D81F5C24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1D81F1E20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

__n128 sub_1D81F5C4C(__n128 *a1, _QWORD *a2)
{
  uint64_t v2;
  __n128 result;

  v2 = *a2 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange;
  result = *a1;
  *(__n128 *)v2 = *a1;
  *(_BYTE *)(v2 + 16) = 0;
  return result;
}

BOOL sub_1D81F5C6C@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_1D81F1F14();
  *a1 = result;
  return result;
}

_BYTE *sub_1D81F5C98(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = *result;
  return result;
}

uint64_t sub_1D81F5CB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1D81F2000();
  *a1 = result;
  return result;
}

_QWORD *sub_1D81F5CD8(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count;
  *(_QWORD *)v2 = *result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

unint64_t sub_1D81F5CF8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_1D81F211C();
  *a1 = result;
  return result;
}

_QWORD *sub_1D81F5D20(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count;
  *(_QWORD *)v2 = *result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_1D81F5D40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1D81F2250();
  *a1 = result;
  return result;
}

_QWORD *sub_1D81F5D68(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount;
  *(_QWORD *)v2 = *result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_1D81F5D88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1D81F3854();
  *a1 = result;
  return result;
}

_QWORD *sub_1D81F5DB0(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(_QWORD *)v2 = *result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

uint64_t method lookup function for LanguageAwareString()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LanguageAwareString.attributedString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of LanguageAwareString.attributedString.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of LanguageAwareString.attributedString.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedLowercase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedLowercase.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedLowercase.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedUppercase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedUppercase.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedUppercase.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of LanguageAwareString.newlinesCollapsedToSpace.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of LanguageAwareString.newlinesCollapsedToSpace.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of LanguageAwareString.newlinesCollapsedToSpace.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of LanguageAwareString.trimmed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of LanguageAwareString.trimmed.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of LanguageAwareString.trimmed.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of LanguageAwareString.fullRange.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of LanguageAwareString.fullRange.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of LanguageAwareString.fullRange.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of LanguageAwareString.isEmpty.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of LanguageAwareString.isEmpty.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of LanguageAwareString.isEmpty.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of LanguageAwareString.utf16Count.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of LanguageAwareString.utf16Count.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of LanguageAwareString.utf16Count.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of LanguageAwareString.utf32Count.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of LanguageAwareString.utf32Count.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of LanguageAwareString.utf32Count.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of LanguageAwareString.characterCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of LanguageAwareString.characterCount.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of LanguageAwareString.characterCount.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 488))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 504))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:attributes:keepStatisticsOnLanguageComponents:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 520))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 528))();
}

uint64_t dispatch thunk of LanguageAwareString.baseWritingDirection(forCharacterAt:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of LanguageAwareString.thresholdBaseWritingDirection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of LanguageAwareString.thresholdBaseWritingDirection.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of LanguageAwareString.thresholdBaseWritingDirection.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of LanguageAwareString.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of LanguageAwareString.writingDirectionsQuantities()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x240))();
}

unint64_t sub_1D81F6204()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA1C228;
  if (!qword_1EDA1C228)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x1D82AAACC](&unk_1D8218290, v1);
    atomic_store(result, (unint64_t *)&qword_1EDA1C228);
  }
  return result;
}

double CGFloat.rounded(_:toScale:)(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  int v11;
  double v12;
  double v13;
  uint64_t v15;
  double v16;

  v6 = sub_1D8215A18();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2 * a3;
  v16 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v11 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v11 == *MEMORY[0x1E0DED4F0])
  {
    v12 = round(v10);
  }
  else if (v11 == *MEMORY[0x1E0DED4E8])
  {
    v12 = rint(v10);
  }
  else if (v11 == *MEMORY[0x1E0DED500])
  {
    v12 = ceil(v10);
  }
  else if (v11 == *MEMORY[0x1E0DED508])
  {
    v12 = floor(v10);
  }
  else if (v11 == *MEMORY[0x1E0DED4D8])
  {
    v12 = trunc(v10);
  }
  else if (v11 == *MEMORY[0x1E0DED4E0])
  {
    v12 = ceil(v10);
    v13 = floor(v10);
    if (v10 < 0.0)
      v12 = v13;
  }
  else
  {
    sub_1D82157CC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v12 = v16;
  }
  return v12 / a2;
}

double CGFloat.rounded(_:toScaleOf:)(uint64_t a1, id a2, double a3)
{
  double v6;
  double v7;

  objc_msgSend(a2, sel_displayScale);
  if (v6 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v7 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  return CGFloat.rounded(_:toScale:)(a1, v7, a3);
}

{
  id v5;
  double v6;
  double v7;
  double v8;

  v5 = objc_msgSend(a2, sel_traitCollection);
  objc_msgSend(v5, sel_displayScale);
  if (v6 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v7 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v5, sel_displayScale);
  }
  v8 = CGFloat.rounded(_:toScale:)(a1, v7, a3);

  return v8;
}

uint64_t sub_1D81F6524()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1D81F6540();
  qword_1F0167EE0 = v1;
  return result;
}

uint64_t sub_1D81F6540()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)();
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD aBlock[6];
  uint64_t v10;

  v10 = 0x3FF0000000000000;
  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    v0 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v0, sel_nativeScale);
    v2 = v1;

    v3 = 0;
    v10 = v2;
    return sub_1D81E2E70((uint64_t)v3);
  }
  sub_1D81F66F8();
  v4 = sub_1D82157FC();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = &v10;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1D81F67A4;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_1D81F67BC;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D81F67DC;
  aBlock[3] = &block_descriptor;
  v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v4, v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v4 & 1) == 0)
  {
    v3 = sub_1D81F67A4;
    return sub_1D81E2E70((uint64_t)v3);
  }
  __break(1u);
  return result;
}

unint64_t sub_1D81F66F8()
{
  unint64_t result;

  result = qword_1EDA1C218;
  if (!qword_1EDA1C218)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDA1C218);
  }
  return result;
}

void sub_1D81F6734(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v2, sel_nativeScale);
  v4 = v3;

  *a1 = v4;
}

uint64_t sub_1D81F6794()
{
  return swift_deallocObject();
}

void sub_1D81F67A4()
{
  uint64_t v0;

  sub_1D81F6734(*(_QWORD **)(v0 + 16));
}

uint64_t sub_1D81F67AC()
{
  return swift_deallocObject();
}

uint64_t sub_1D81F67BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D81F67DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t static CharacterSet.legacyExcessiveLineHeight.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D81D7684(&qword_1EDA1BAF0, (uint64_t)qword_1EDA1BA38, a1);
}

id Shadow.color.getter()
{
  id *v0;

  return *v0;
}

double Shadow.blurRadius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double Shadow.offset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void destroy for Shadow(id *a1)
{

}

uint64_t assignWithCopy for Shadow(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for Shadow(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Shadow(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

id DynamicTypeTextView.__allocating_init(useCase:)(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = sub_1D8215454();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v6, a1, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  v10 = (uint64_t)v7 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase;
  swift_beginAccess();
  v11 = v7;
  sub_1D81F6AFC((uint64_t)v6, v10, &qword_1EDA1C180);
  swift_endAccess();

  return v11;
}

id DynamicTypeTextView.__allocating_init(textStyle:)(__int128 *a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  id v5;
  _BYTE v7[40];

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1D81F6AE4(a1, (uint64_t)v7);
  v4 = (uint64_t)v3 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
  swift_beginAccess();
  v5 = v3;
  sub_1D81F6AFC((uint64_t)v7, v4, &qword_1EDA1BC80);
  swift_endAccess();

  return v5;
}

uint64_t sub_1D81F6AE4(__int128 *a1, uint64_t a2)
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

uint64_t sub_1D81F6AFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

id DynamicTypeTextView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id DynamicTypeTextView.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  id v13;
  objc_super v15;

  v9 = &v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase];
  v10 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = &v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping];
  *v11 = 0;
  v11[1] = 0;
  v12 = &v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle];
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_QWORD *)v12 + 4) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont] = 0;
  *(_DWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_hyphenationFactor] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor] = 0;
  v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_attributedTextShouldOverrideTextViewAttributes] = 1;
  v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_isUpdatingAttributedText] = 0;
  v4[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_directionalTextAlignment] = 0;
  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  v13 = objc_msgSendSuper2(&v15, sel_initWithFrame_textContainer_, 0, a1, a2, a3, a4);
  sub_1D81F6D84();

  return v13;
}

uint64_t type metadata accessor for DynamicTypeTextView()
{
  uint64_t result;

  result = qword_1EDA1BC20;
  if (!qword_1EDA1BC20)
    return swift_getSingletonMetadata();
  return result;
}

id DynamicTypeTextView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_1D81F6D84()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_getObjectType();
  objc_msgSend(v0, sel_setTextContainerInset_, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v1 = objc_msgSend(v0, sel_textContainer);
  objc_msgSend(v1, sel_setLineFragmentPadding_, 0.0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BC98);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1D8218310;
  v3 = sub_1D8215490();
  v4 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;
  sub_1D8215874();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1D8218310;
  v6 = sub_1D8215484();
  v7 = MEMORY[0x1E0DC1F50];
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;
  sub_1D8215874();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

id sub_1D81F6EC0()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend(v0, sel_text);
  if (result)
  {

    result = objc_msgSend(v0, sel_text);
    if (result)
    {
      v2 = result;
      sub_1D82156D0();

      v3 = sub_1D8215718();
      swift_bridgeObjectRelease();
      return (id)v3;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

id sub_1D81F6F4C()
{
  return sub_1D81F7038((SEL *)&selRef_maximumNumberOfLines);
}

void sub_1D81F6F58(uint64_t a1)
{
  sub_1D81F7090(a1, (SEL *)&selRef_setMaximumNumberOfLines_);
}

void (*sub_1D81F6F64(_QWORD *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;
  id v3;
  id v4;

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_textContainer);
  v4 = objc_msgSend(v3, sel_maximumNumberOfLines);

  *a1 = v4;
  return sub_1D81F6FCC;
}

void sub_1D81F6FCC(uint64_t *a1, uint64_t a2)
{
  sub_1D81F7160(a1, a2, (SEL *)&selRef_setMaximumNumberOfLines_);
}

void sub_1D81F6FD8(uint64_t *a1, id *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6;
  id v7;

  v6 = *a1;
  v7 = objc_msgSend(*a2, sel_textContainer);
  objc_msgSend(v7, *a5, v6);

}

id sub_1D81F702C()
{
  return sub_1D81F7038((SEL *)&selRef_lineBreakMode);
}

id sub_1D81F7038(SEL *a1)
{
  void *v1;
  id v3;
  id v4;

  v3 = objc_msgSend(v1, sel_textContainer);
  v4 = objc_msgSend(v3, *a1);

  return v4;
}

void sub_1D81F7084(uint64_t a1)
{
  sub_1D81F7090(a1, (SEL *)&selRef_setLineBreakMode_);
}

void sub_1D81F7090(uint64_t a1, SEL *a2)
{
  void *v2;
  id v5;

  v5 = objc_msgSend(v2, sel_textContainer);
  objc_msgSend(v5, *a2, a1);

}

void (*sub_1D81F70EC(_QWORD *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;
  id v3;
  id v4;

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_textContainer);
  v4 = objc_msgSend(v3, sel_lineBreakMode);

  *a1 = v4;
  return sub_1D81F7154;
}

void sub_1D81F7154(uint64_t *a1, uint64_t a2)
{
  sub_1D81F7160(a1, a2, (SEL *)&selRef_setLineBreakMode_);
}

void sub_1D81F7160(uint64_t *a1, uint64_t a2, SEL *a3)
{
  uint64_t v4;
  id v5;

  v4 = *a1;
  v5 = objc_msgSend((id)a1[1], sel_textContainer);
  objc_msgSend(v5, *a3, v4);

}

uint64_t sub_1D81F71B4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD v13[2];

  v1 = sub_1D821534C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_text);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = sub_1D82156D0();
  v9 = v8;

  v13[0] = v7;
  v13[1] = v9;
  sub_1D8215334();
  sub_1D81E04C0();
  v10 = 1;
  sub_1D82158C8();
  LOBYTE(v6) = v11;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 0;
  return v10;
}

double sub_1D81F72B0()
{
  void *v0;
  id v1;
  void *v2;
  double v3;
  double v4;

  v1 = objc_msgSend(v0, sel_font);
  if (!v1)
    return *MEMORY[0x1E0DC49E8];
  v2 = v1;
  sub_1D8215868();
  v4 = v3;

  return v4;
}

uint64_t sub_1D81F7334(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D81E1C08(a1, (uint64_t)v4, &qword_1EDA1C180);
  return sub_1D81F7410((uint64_t)v4);
}

uint64_t sub_1D81F73B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a1, &qword_1EDA1C180);
}

uint64_t sub_1D81F7410(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v12[2];
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (uint64_t)v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase;
  swift_beginAccess();
  sub_1D81E2430(a1, v6, &qword_1EDA1C180);
  swift_endAccess();
  sub_1D81E1C08(v6, (uint64_t)v5, &qword_1EDA1C180);
  v7 = sub_1D8215454();
  LODWORD(v6) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7);
  sub_1D81D8B6C((uint64_t)v5, &qword_1EDA1C180);
  if ((_DWORD)v6 != 1)
  {
    v13 = 0;
    memset(v12, 0, sizeof(v12));
    v8 = (uint64_t)v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
    swift_beginAccess();
    sub_1D81E2430((uint64_t)v12, v8, &qword_1EDA1BC80);
    swift_endAccess();
    sub_1D81F7AC0();
    v9 = sub_1D81D8B6C((uint64_t)v12, &qword_1EDA1BC80);
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x1E8))(v9);
  }
  return sub_1D81D8B6C(a1, &qword_1EDA1C180);
}

void (*sub_1D81F7588(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[11] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v6 = OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase;
  v3[12] = v5;
  v3[13] = v6;
  swift_beginAccess();
  return sub_1D81F760C;
}

void sub_1D81F760C(void **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[12];
    sub_1D81E1C08(v3[11] + v3[13], v4, &qword_1EDA1C180);
    v5 = sub_1D8215454();
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5);
    sub_1D81D8B6C(v4, &qword_1EDA1C180);
    if (v6 != 1)
    {
      v7 = (_QWORD *)v3[11];
      *(_OWORD *)v3 = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      v3[4] = 0;
      v8 = (uint64_t)v7 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
      swift_beginAccess();
      sub_1D81E2430((uint64_t)v3, v8, &qword_1EDA1BC80);
      swift_endAccess();
      sub_1D81F7AC0();
      v9 = sub_1D81D8B6C((uint64_t)v3, &qword_1EDA1BC80);
      (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0x1E8))(v9);
    }
  }
  free((void *)v3[12]);
  free(v3);
}

uint64_t sub_1D81F772C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, uint64_t *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1D81FAC14;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_1D81E3020(v4);
}

uint64_t sub_1D81F77C0(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *a1;
  v3 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v6 = sub_1D81FAC0C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  v8 = (_QWORD *)((char *)*a2 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping);
  swift_beginAccess();
  v9 = *v8;
  *v8 = (uint64_t)v6;
  v8[1] = v5;
  sub_1D81E3020(v4);
  sub_1D81E3020((uint64_t)v6);
  v10 = sub_1D81E2E70(v9);
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0x1E8))(v10);
  return sub_1D81E2E70((uint64_t)v6);
}

uint64_t sub_1D81F78AC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping);
  swift_beginAccess();
  v2 = *v1;
  sub_1D81E3020(*v1);
  return v2;
}

uint64_t sub_1D81F7904(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  sub_1D81E3020(a1);
  v7 = sub_1D81E2E70(v6);
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x1E8))(v7);
  return sub_1D81E2E70(a1);
}

uint64_t (*sub_1D81F79A4(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D81F79EC;
}

uint64_t sub_1D81F79EC(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(a1 + 24)) + 0x1E8))(result);
  return result;
}

uint64_t sub_1D81F7A34(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_1D81E1C08(a1, (uint64_t)v5, &qword_1EDA1BC80);
  v3 = *a2 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
  swift_beginAccess();
  sub_1D81E2430((uint64_t)v5, v3, &qword_1EDA1BC80);
  swift_endAccess();
  sub_1D81F7AC0();
  return sub_1D81D8B6C((uint64_t)v5, &qword_1EDA1BC80);
}

uint64_t sub_1D81F7AC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v17 - v5;
  v7 = (uint64_t)v0 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
  swift_beginAccess();
  sub_1D81E1C08(v7, (uint64_t)&v18, &qword_1EDA1BC80);
  v8 = *((_QWORD *)&v19 + 1);
  result = sub_1D81D8B6C((uint64_t)&v18, &qword_1EDA1BC80);
  if (v8)
  {
    v10 = sub_1D8215454();
    v11 = *(_QWORD *)(v10 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v6, 1, 1, v10);
    v12 = (uint64_t)v0 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase;
    swift_beginAccess();
    sub_1D81E2430((uint64_t)v6, v12, &qword_1EDA1C180);
    swift_endAccess();
    sub_1D81E1C08(v12, (uint64_t)v4, &qword_1EDA1C180);
    LODWORD(v10) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v4, 1, v10);
    sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
    v13 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    if ((_DWORD)v10 != 1)
    {
      v20 = 0;
      v18 = 0u;
      v19 = 0u;
      swift_beginAccess();
      sub_1D81E2430((uint64_t)&v18, v7, &qword_1EDA1BC80);
      v14 = swift_endAccess();
      sub_1D81F7AC0(v14);
      v15 = sub_1D81D8B6C((uint64_t)&v18, &qword_1EDA1BC80);
      (*(void (**)(uint64_t))((*v13 & *v0) + 0x1E8))(v15);
    }
    v16 = sub_1D81D8B6C((uint64_t)v6, &qword_1EDA1C180);
    return (*(uint64_t (**)(uint64_t))((*v13 & *v0) + 0x1E8))(v16);
  }
  return result;
}

uint64_t sub_1D81F7CCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a1, &qword_1EDA1BC80);
}

uint64_t sub_1D81F7D24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
  swift_beginAccess();
  sub_1D81E2430(a1, v3, &qword_1EDA1BC80);
  swift_endAccess();
  sub_1D81F7AC0();
  return sub_1D81D8B6C(a1, &qword_1EDA1BC80);
}

uint64_t (*sub_1D81F7DA0(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D81F7DE8;
}

uint64_t sub_1D81F7DE8(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_1D81F7AC0();
  return result;
}

id sub_1D81F7E24()
{
  return sub_1D81F810C((SEL *)&selRef_font);
}

void sub_1D81F7E78(void *a1)
{
  sub_1D81FA2BC(a1);

}

float sub_1D81F7E9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_hyphenationFactor;
  swift_beginAccess();
  return *(float *)v1;
}

void sub_1D81F7EE0(float a1)
{
  uint64_t v1;
  float *v3;

  v3 = (float *)(v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_hyphenationFactor);
  swift_beginAccess();
  *v3 = a1;
  sub_1D81F8C94();
}

uint64_t (*sub_1D81F7F34(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D81F7F7C;
}

id sub_1D81F7F8C()
{
  return sub_1D81F810C((SEL *)&selRef_textColor);
}

void sub_1D81F8034(void *a1)
{
  char *v1;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  objc_msgSendSuper2(&v5, sel_setTextColor_, a1);
  v3 = objc_msgSend(v1, sel_textColor);
  v4 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor];
  *(_QWORD *)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor] = v3;

  sub_1D81F8C94();
}

id sub_1D81F80B8(void *a1, uint64_t a2, SEL *a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return objc_msgSendSuper2(&v5, *a3);
}

id sub_1D81F8100()
{
  return sub_1D81F810C((SEL *)&selRef_attributedText);
}

id sub_1D81F810C(SEL *a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return objc_msgSendSuper2(&v4, *a1);
}

void sub_1D81F81CC(void *a1)
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  objc_msgSendSuper2(&v3, sel_setAttributedText_, a1);
  if ((*((_BYTE *)v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_isUpdatingAttributedText) & 1) == 0)
    sub_1D81F8C94();

}

uint64_t sub_1D81F8228()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_attributedTextShouldOverrideTextViewAttributes);
  swift_beginAccess();
  return *v1;
}

void sub_1D81F826C(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_attributedTextShouldOverrideTextViewAttributes);
  swift_beginAccess();
  *v3 = a1;
  sub_1D81F8C94();
}

uint64_t (*sub_1D81F82C0(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D81F7F7C;
}

void sub_1D81F8308(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1D81F8C94();
}

uint64_t sub_1D81F83D8()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  v1 = objc_msgSendSuper2(&v5, sel_text);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D82156D0();

  return v3;
}

void sub_1D81F84E4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_super v4;

  if (a2)
  {
    v3 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  objc_msgSendSuper2(&v4, sel_setText_, v3);

  sub_1D81F8C94();
}

id sub_1D81F8594()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return objc_msgSendSuper2(&v2, sel_textAlignment);
}

id sub_1D81F8644(uint64_t a1)
{
  _QWORD *v1;
  objc_super v4;
  char v5;

  v5 = 0;
  (*(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x1D0))(&v5);
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return objc_msgSendSuper2(&v4, sel_setTextAlignment_, a1);
}

uint64_t sub_1D81F86AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_directionalTextAlignment);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

_QWORD *sub_1D81F86F8(unsigned __int8 *a1)
{
  uint64_t v1;
  int v2;
  _BYTE *v3;
  _QWORD *result;
  int v5;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_directionalTextAlignment);
  result = (_QWORD *)swift_beginAccess();
  v5 = *v3;
  *v3 = v2;
  if (v2 != v5)
    return sub_1D81F8808();
  return result;
}

void (*sub_1D81F8758(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_directionalTextAlignment;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return sub_1D81F87C4;
}

void sub_1D81F87C4(uint64_t a1)
{
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v1 = *(void **)a1;
  v2 = *(unsigned __int8 *)(*(_QWORD *)a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(unsigned __int8 *)(v4 + v3);
  *(_BYTE *)(v4 + v3) = v2;
  if (v2 != v5)
    sub_1D81F8808();
  free(v1);
}

_QWORD *sub_1D81F8808()
{
  _QWORD *v0;
  void *v1;
  _QWORD *result;
  id v3;
  char v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;
  uint64_t v11;

  v1 = v0;
  result = (*(_QWORD *(**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))(&v11);
  if ((_BYTE)v11)
  {
    if (v11 == 1)
    {
      v3 = objc_msgSend(v0, sel_traitCollection);
      v4 = sub_1D8215820();

      if ((v4 & 1) != 0)
        v5 = 2;
      else
        v5 = 0;
      v9.receiver = v1;
      v9.super_class = (Class)type metadata accessor for DynamicTypeTextView();
      return objc_msgSendSuper2(&v9, sel_setTextAlignment_, v5);
    }
    else
    {
      v6 = objc_msgSend(v0, sel_traitCollection);
      v7 = sub_1D8215820();

      if ((v7 & 1) != 0)
        v8 = 0;
      else
        v8 = 2;
      v10.receiver = v1;
      v10.super_class = (Class)type metadata accessor for DynamicTypeTextView();
      return objc_msgSendSuper2(&v10, sel_setTextAlignment_, v8);
    }
  }
  return result;
}

void sub_1D81F8908()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  id v17;
  _BYTE v18[16];
  char *v19;
  _QWORD v20[4];
  objc_super v21;
  _BYTE v22[24];
  uint64_t v23;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_1D8215454();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 0);
  v10 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v0) + 0x130))(v9);
  v19 = v1;
  v11 = (void *)sub_1D8215838();

  v12 = (uint64_t)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle];
  swift_beginAccess();
  sub_1D81E1C08(v12, (uint64_t)v22, &qword_1EDA1BC80);
  if (v23)
  {
    sub_1D81FA400((uint64_t)v22, (uint64_t)v20);
    sub_1D81D8B6C((uint64_t)v22, &qword_1EDA1BC80);
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    v13 = (void *)sub_1D821546C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  else
  {
    sub_1D81D8B6C((uint64_t)v22, &qword_1EDA1BC80);
    v14 = (uint64_t)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase];
    swift_beginAccess();
    sub_1D81E1C08(v14, (uint64_t)v4, &qword_1EDA1C180);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
      v13 = 0;
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(v8, v4, v5);
      sub_1D81D898C(0, (unint64_t *)&qword_1EDA1C248);
      v13 = (void *)MEMORY[0x1D82AA1A8](v8, v11);
      (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    }
  }
  v15 = (objc_class *)type metadata accessor for DynamicTypeTextView();
  v21.receiver = v1;
  v21.super_class = v15;
  objc_msgSendSuper2(&v21, sel_setFont_, v13);
  v16 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont];
  *(_QWORD *)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont] = v13;
  v17 = v13;

  sub_1D81F8C94();
}

uint64_t sub_1D81F8BA4(uint64_t a1, _QWORD *a2)
{
  void (**v4)(id);
  uint64_t result;
  void (*v6)(id);
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void (**)(id))((char *)a2
                                + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping);
  result = swift_beginAccess();
  v6 = *v4;
  if (*v4)
  {
    v7 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *a2) + 0x130);
    v8 = swift_retain();
    v9 = (void *)v7(v8);
    v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);

    v6(v10);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    sub_1D8215478();
    return sub_1D81E2E70((uint64_t)v6);
  }
  return result;
}

void sub_1D81F8C94()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _BYTE *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  float v13;
  id v14;
  id v15;
  objc_super v16;

  v1 = v0;
  v2 = OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_isUpdatingAttributedText;
  *((_BYTE *)v0 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_isUpdatingAttributedText) = 1;
  v3 = (char *)v0 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_attributedTextShouldOverrideTextViewAttributes;
  swift_beginAccess();
  if ((*v3 & 1) != 0)
  {
    v4 = objc_msgSend(v1, sel_textColor);
    if (*v3 == 1)
    {
      v16.receiver = v1;
      v16.super_class = (Class)type metadata accessor for DynamicTypeTextView();
      v5 = objc_msgSendSuper2(&v16, sel_font);
      goto LABEL_6;
    }
  }
  else
  {
    v4 = *(id *)((char *)v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor);
    v6 = v4;
  }
  v5 = *(id *)((char *)v1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont);
  v7 = v5;
LABEL_6:
  v8 = objc_msgSend(v1, sel_attributedText);
  if (!v8)
  {
    v9 = objc_msgSend(v1, sel_text);
    if (v9)
    {
      v10 = v9;
      sub_1D82156D0();

    }
    v11 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v12 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v11, sel_initWithString_, v12);

  }
  v13 = (*(float (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x150))();
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v8);
  sub_1D81F9414(v4, v5, v13);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v14);

  objc_msgSend(v1, sel_setAttributedText_, v15);
  objc_msgSend(v1, sel_setNeedsLayout);

  *((_BYTE *)v1 + v2) = 0;
}

uint64_t sub_1D81F8ED4()
{
  _QWORD *v0;

  return (*(uint64_t (**)(float))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))(0.0);
}

id DynamicTypeTextView.__allocating_init(frame:textContainer:)(void *a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;
  id v7;

  v7 = objc_msgSend(objc_allocWithZone(v5), sel_initWithFrame_textContainer_, a1, a2, a3, a4, a5);

  return v7;
}

void DynamicTypeTextView.init(frame:textContainer:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DynamicTypeTextView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1D81F9070(uint64_t a1, uint64_t a2)
{
  return sub_1D81F90E0(a1, a2, (SEL *)&selRef_maximumNumberOfLines);
}

void sub_1D81F907C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1D81F9138(a1, a2, a3, (SEL *)&selRef_setMaximumNumberOfLines_);
}

uint64_t (*sub_1D81F9088(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1D81F6F64(v2);
  return sub_1D81F90D0;
}

id sub_1D81F90D4(uint64_t a1, uint64_t a2)
{
  return sub_1D81F90E0(a1, a2, (SEL *)&selRef_lineBreakMode);
}

id sub_1D81F90E0(uint64_t a1, uint64_t a2, SEL *a3)
{
  id *v3;
  id v5;
  id v6;

  v5 = objc_msgSend(*v3, sel_textContainer);
  v6 = objc_msgSend(v5, *a3);

  return v6;
}

void sub_1D81F912C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1D81F9138(a1, a2, a3, (SEL *)&selRef_setLineBreakMode_);
}

void sub_1D81F9138(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id *v4;
  id v7;

  v7 = objc_msgSend(*v4, sel_textContainer);
  objc_msgSend(v7, *a4, a1);

}

uint64_t (*sub_1D81F9194(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1D81F70EC(v2);
  return sub_1D81F90D0;
}

void sub_1D81F91DC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

id sub_1D81F9208()
{
  id *v0;

  return objc_msgSend(*v0, sel_font);
}

void sub_1D81F922C(void *a1)
{
  id *v1;

  objc_msgSend(*v1, sel_setFont_, a1);

}

void (*sub_1D81F9260(_QWORD *a1))(id *a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = objc_msgSend(v3, sel_font);
  return sub_1D81F92A8;
}

void sub_1D81F92A8(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setFont_);

}

uint64_t sub_1D81F92DC()
{
  return sub_1D81F71B4() & 1;
}

double sub_1D81F9300()
{
  id *v0;
  id v1;
  void *v2;
  double v3;
  double v4;

  v1 = objc_msgSend(*v0, sel_font);
  if (!v1)
    return *MEMORY[0x1E0DC49E8];
  v2 = v1;
  sub_1D8215868();
  v4 = v3;

  return v4;
}

id sub_1D81F9384()
{
  id *v0;
  id v1;
  id result;
  void *v3;
  uint64_t v4;

  v1 = *v0;
  result = objc_msgSend(*v0, sel_text);
  if (result)
  {

    result = objc_msgSend(v1, sel_text);
    if (result)
    {
      v3 = result;
      sub_1D82156D0();

      v4 = sub_1D8215718();
      swift_bridgeObjectRelease();
      return (id)v4;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

id sub_1D81F9414(void *a1, void *a2, float a3)
{
  void *v3;
  char **v4;
  __objc2_meth_list **p_base_meths;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t isEscapingClosureAtFileLocation;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  char *v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  void *v41;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _OWORD v47[2];
  __int128 v48;
  char v49;
  uint64_t v50;
  uint64_t aBlock;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v54;
  uint64_t (*v55)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v56;

  objc_msgSend(v3, sel_beginEditing);
  *(_QWORD *)&v48 = MEMORY[0x1E0DEE9D8];
  v8 = *MEMORY[0x1E0DC1178];
  v9 = objc_msgSend(v3, sel_length);
  v10 = swift_allocObject();
  *(float *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = &v48;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = sub_1D81FAC54;
  v11[3] = v10;
  v55 = sub_1D81FAC70;
  v56 = v11;
  aBlock = MEMORY[0x1E0C809B0];
  v52 = 1107296256;
  v53 = sub_1D820CF9C;
  v54 = &block_descriptor_0;
  v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_enumerateAttribute_inRange_options_usingBlock_, v8, 0, v9, 0, v12);
  _Block_release(v12);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
    goto LABEL_40;
  }
  v41 = a2;
  v14 = v48;
  swift_release();
  v15 = *(_QWORD *)(v14 + 16);
  if (v15)
  {
    v16 = (uint64_t *)(v14 + 40);
    v43 = v8;
    *(_QWORD *)&v44 = MEMORY[0x1E0DEE9B8] + 8;
    do
    {
      v19 = *(v16 - 1);
      v20 = *v16;
      if (objc_msgSend(v3, sel_attribute_atIndex_effectiveRange_, v8, v19, 0, v41))
      {
        sub_1D82158F8();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v47, 0, sizeof(v47));
      }
      sub_1D81FAC78((uint64_t)v47, (uint64_t)&v48);
      if (v50)
      {
        sub_1D81D898C(0, &qword_1EDA1C208);
        if ((swift_dynamicCast() & 1) != 0)
        {
          objc_msgSend(v46, sel_mutableCopy);

          sub_1D82158F8();
          swift_unknownObjectRelease();
          sub_1D81D898C(0, &qword_1EDA1BF40);
          if (swift_dynamicCast())
          {
            v17 = (id)v48;
            v8 = v43;
            goto LABEL_6;
          }
          v8 = v43;
        }
      }
      else
      {
        sub_1D81D8B6C((uint64_t)&v48, &qword_1EDA1C290);
      }
      v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
LABEL_6:
      v16 += 2;
      *(float *)&v18 = a3;
      objc_msgSend(v17, sel_setHyphenationFactor_, v18);
      objc_msgSend(v3, sel_addAttribute_value_range_, v8, v17, v19, v20);

      --v15;
    }
    while (v15);
  }
  swift_bridgeObjectRelease();
  v4 = &selRef_intrinsicContentSize;
  p_base_meths = &DynamicTypeTextField.base_meths;
  if (!a1)
    goto LABEL_26;
  v8 = *MEMORY[0x1E0DC1140];
  *(_QWORD *)&v47[0] = MEMORY[0x1E0DEE9D8];
  v48 = 0uLL;
  v49 = 1;
  v11 = a1;
  v21 = objc_msgSend(v3, sel_length);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = &v48;
  *(_QWORD *)(v22 + 24) = v47;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_1D81FAD0C;
  *(_QWORD *)(v23 + 24) = v22;
  v55 = sub_1D81FAD08;
  v56 = (_QWORD *)v23;
  aBlock = MEMORY[0x1E0C809B0];
  v52 = 1107296256;
  v53 = sub_1D820CF9C;
  v54 = &block_descriptor_44;
  v24 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_enumerateAttribute_inRange_options_usingBlock_, v8, 0, v21, 0, v24);
  _Block_release(v24);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  isEscapingClosureAtFileLocation = *(_QWORD *)&v47[0];
  if ((v49 & 1) != 0)
    goto LABEL_22;
  v44 = v48;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v47[0] = isEscapingClosureAtFileLocation;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_42;
  while (1)
  {
    v27 = *(_QWORD *)(isEscapingClosureAtFileLocation + 16);
    v26 = *(_QWORD *)(isEscapingClosureAtFileLocation + 24);
    if (v27 >= v26 >> 1)
      isEscapingClosureAtFileLocation = (uint64_t)sub_1D81FB508((char *)(v26 > 1), v27 + 1, 1, (char *)isEscapingClosureAtFileLocation);
    *(_QWORD *)(isEscapingClosureAtFileLocation + 16) = v27 + 1;
    *(_OWORD *)(isEscapingClosureAtFileLocation + 16 * v27 + 32) = v44;
    *(_QWORD *)&v47[0] = isEscapingClosureAtFileLocation;
LABEL_22:

    swift_release();
    v28 = *(_QWORD *)(isEscapingClosureAtFileLocation + 16);
    if (v28)
    {
      v29 = (_QWORD *)(isEscapingClosureAtFileLocation + 40);
      do
      {
        objc_msgSend(v3, v4[89], v8, v11, *(v29 - 1), *v29, v41);
        v29 += 2;
        --v28;
      }
      while (v28);
    }

    swift_bridgeObjectRelease();
LABEL_26:
    if (!v41)
      break;
    v11 = (_QWORD *)*MEMORY[0x1E0DC1138];
    *(_QWORD *)&v47[0] = MEMORY[0x1E0DEE9D8];
    v48 = 0uLL;
    v49 = 1;
    v30 = v41;
    v31 = objc_msgSend(v3, (SEL)p_base_meths[316]);
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = &v48;
    *(_QWORD *)(v8 + 24) = v47;
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = sub_1D81FACD0;
    *(_QWORD *)(v32 + 24) = v8;
    v55 = sub_1D81FAD08;
    v56 = (_QWORD *)v32;
    aBlock = MEMORY[0x1E0C809B0];
    v52 = 1107296256;
    v53 = sub_1D820CF9C;
    v54 = &block_descriptor_33;
    v33 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_enumerateAttribute_inRange_options_usingBlock_, v11, 0, v31, 0, v33);
    _Block_release(v33);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v34 = *(char **)&v47[0];
      if ((v49 & 1) == 0)
      {
        v45 = v48;
        v35 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v47[0] = v34;
        if ((v35 & 1) == 0)
        {
          v34 = sub_1D81FB508(0, *((_QWORD *)v34 + 2) + 1, 1, v34);
          *(_QWORD *)&v47[0] = v34;
        }
        v37 = *((_QWORD *)v34 + 2);
        v36 = *((_QWORD *)v34 + 3);
        if (v37 >= v36 >> 1)
          v34 = sub_1D81FB508((char *)(v36 > 1), v37 + 1, 1, v34);
        *((_QWORD *)v34 + 2) = v37 + 1;
        *(_OWORD *)&v34[16 * v37 + 32] = v45;
        *(_QWORD *)&v47[0] = v34;
      }

      swift_release();
      v38 = *((_QWORD *)v34 + 2);
      if (v38)
      {
        v39 = v34 + 40;
        do
        {
          objc_msgSend(v3, v4[89], v11, v30, *(v39 - 1), *v39, v41);
          v39 += 2;
          --v38;
        }
        while (v38);
      }

      swift_bridgeObjectRelease();
      return objc_msgSend(v3, sel_endEditing, v41);
    }
LABEL_41:
    __break(1u);
LABEL_42:
    isEscapingClosureAtFileLocation = (uint64_t)sub_1D81FB508(0, *(_QWORD *)(isEscapingClosureAtFileLocation + 16) + 1, 1, (char *)isEscapingClosureAtFileLocation);
    *(_QWORD *)&v47[0] = isEscapingClosureAtFileLocation;
  }
  return objc_msgSend(v3, sel_endEditing, v41);
}

uint64_t sub_1D81F9BD8(uint64_t result, NSRange range2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  NSUInteger length;
  NSUInteger location;
  NSRange v8;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSRange v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  NSRange v18;
  NSRange v19;

  if (!*(_QWORD *)(result + 24))
  {
    length = range2.length;
    location = range2.location;
    if ((*(_BYTE *)(a4 + 16) & 1) == 0)
    {
      if (vaddvq_s64(*(int64x2_t *)a4) == range2.location)
      {
        v19.location = range2.location;
        v19.length = length;
        v8 = NSUnionRange(*(NSRange *)a4, v19);
        result = v8.location;
        location = v8.location;
        length = v8.length;
      }
      else
      {
        v18 = *(NSRange *)a4;
        v10 = *a5;
        result = swift_isUniquelyReferenced_nonNull_native();
        *a5 = v10;
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_1D81FB508(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
          v10 = result;
          *a5 = result;
        }
        v11 = *(_QWORD *)(v10 + 16);
        v12 = *(_QWORD *)(v10 + 24);
        v13 = v11 + 1;
        v14 = v18;
        if (v11 >= v12 >> 1)
        {
          v17 = v11 + 1;
          v15 = (char *)v10;
          v16 = *(_QWORD *)(v10 + 16);
          result = (uint64_t)sub_1D81FB508((char *)(v12 > 1), v11 + 1, 1, v15);
          v14 = v18;
          v11 = v16;
          v13 = v17;
          v10 = result;
        }
        *(_QWORD *)(v10 + 16) = v13;
        *(NSRange *)(v10 + 16 * v11 + 32) = v14;
        *a5 = v10;
      }
    }
    *(_QWORD *)a4 = location;
    *(_QWORD *)(a4 + 8) = length;
    *(_BYTE *)(a4 + 16) = 0;
  }
  return result;
}

uint64_t sub_1D81F9CF8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1D81FB6F8(0, *(_QWORD *)(v3 + 16) + 1, 1, (char *)v3);
    v3 = result;
  }
  v6 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  if (v6 >= v5 >> 1)
  {
    result = (uint64_t)sub_1D81FB6F8((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    v3 = result;
  }
  *(_QWORD *)(v3 + 16) = v6 + 1;
  *(_QWORD *)(v3 + 8 * v6 + 32) = a1;
  *v1 = v3;
  return result;
}

uint64_t sub_1D81F9D94(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1D81FB508(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
    v5 = result;
  }
  v8 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)sub_1D81FB508((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    v5 = result;
  }
  *(_QWORD *)(v5 + 16) = v8 + 1;
  v9 = v5 + 16 * v8;
  *(_QWORD *)(v9 + 32) = a1;
  *(_QWORD *)(v9 + 40) = a2;
  *v2 = v5;
  return result;
}

uint64_t sub_1D81F9E34()
{
  _QWORD *v0;

  MEMORY[0x1D82AA0AC]();
  if (*(_QWORD *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1D8215790();
  sub_1D821579C();
  return sub_1D8215784();
}

void sub_1D81F9E94(uint64_t a1, uint64_t a2, uint64_t a3, float a4, uint64_t a5, char **a6)
{
  float v10;
  char *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  char *v24;
  unint64_t v25;
  id v26;
  _BYTE v27[24];
  uint64_t v28;

  sub_1D81E1C08(a1, (uint64_t)v27, &qword_1EDA1C290);
  if (v28)
  {
    sub_1D81D898C(0, &qword_1EDA1C208);
    if ((swift_dynamicCast() & 1) != 0)
    {
      objc_msgSend(v26, sel_hyphenationFactor);
      if (v10 != a4)
      {
        v11 = *a6;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a6 = v11;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v11 = sub_1D81FB508(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
          *a6 = v11;
        }
        v13 = *((_QWORD *)v11 + 2);
        v14 = *((_QWORD *)v11 + 3);
        v15 = v13 + 1;
        if (v13 >= v14 >> 1)
        {
          v25 = v13 + 1;
          v22 = v11;
          v23 = *((_QWORD *)v11 + 2);
          v24 = sub_1D81FB508((char *)(v14 > 1), v13 + 1, 1, v22);
          v13 = v23;
          v15 = v25;
          v11 = v24;
        }
        *((_QWORD *)v11 + 2) = v15;
        v16 = &v11[16 * v13];
        *((_QWORD *)v16 + 4) = a2;
        *((_QWORD *)v16 + 5) = a3;
        *a6 = v11;
      }

      return;
    }
  }
  else
  {
    sub_1D81D8B6C((uint64_t)v27, &qword_1EDA1C290);
  }
  v17 = *a6;
  v18 = swift_isUniquelyReferenced_nonNull_native();
  *a6 = v17;
  if ((v18 & 1) == 0)
  {
    v17 = sub_1D81FB508(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    *a6 = v17;
  }
  v20 = *((_QWORD *)v17 + 2);
  v19 = *((_QWORD *)v17 + 3);
  if (v20 >= v19 >> 1)
    v17 = sub_1D81FB508((char *)(v19 > 1), v20 + 1, 1, v17);
  *((_QWORD *)v17 + 2) = v20 + 1;
  v21 = &v17[16 * v20];
  *((_QWORD *)v21 + 4) = a2;
  *((_QWORD *)v21 + 5) = a3;
  *a6 = v17;
}

uint64_t sub_1D81FA064(_QWORD *a1)
{
  uint64_t result;

  result = (uint64_t)objc_msgSend(a1, sel_adjustsFontForContentSizeCategory);
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x1E8))();
  return result;
}

void _s11AppStoreKit19DynamicTypeTextViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  char *v1;
  uint64_t v2;
  _QWORD *v3;
  char *v4;

  v1 = &v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase];
  v2 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = &v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping];
  *v3 = 0;
  v3[1] = 0;
  v4 = &v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_hyphenationFactor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor] = 0;
  v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_attributedTextShouldOverrideTextViewAttributes] = 1;
  v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_isUpdatingAttributedText] = 0;
  v0[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_directionalTextAlignment] = 0;

  sub_1D82159B8();
  __break(1u);
}

_QWORD *sub_1D81FA1B8(_QWORD *a1)
{
  _QWORD *result;
  id v3;
  char v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;
  uint64_t v11;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x1C8))(&v11);
  if ((_BYTE)v11)
  {
    if (v11 == 1)
    {
      v3 = objc_msgSend(a1, sel_traitCollection);
      v4 = sub_1D8215820();

      if ((v4 & 1) != 0)
        v5 = 2;
      else
        v5 = 0;
      v9.receiver = a1;
      v9.super_class = (Class)type metadata accessor for DynamicTypeTextView();
      return objc_msgSendSuper2(&v9, sel_setTextAlignment_, v5);
    }
    else
    {
      v6 = objc_msgSend(a1, sel_traitCollection);
      v7 = sub_1D8215820();

      if ((v7 & 1) != 0)
        v8 = 0;
      else
        v8 = 2;
      v10.receiver = a1;
      v10.super_class = (Class)type metadata accessor for DynamicTypeTextView();
      return objc_msgSendSuper2(&v10, sel_setTextAlignment_, v8);
    }
  }
  return result;
}

void sub_1D81FA2BC(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v12[2];
  uint64_t v13;
  objc_super v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (objc_class *)type metadata accessor for DynamicTypeTextView();
  v14.receiver = v1;
  v14.super_class = v6;
  objc_msgSendSuper2(&v14, sel_setFont_, a1);
  v7 = *(void **)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont];
  *(_QWORD *)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont] = a1;
  v8 = a1;

  v9 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
  sub_1D81F7410((uint64_t)v5);
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  v10 = (uint64_t)&v1[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle];
  swift_beginAccess();
  sub_1D81E2430((uint64_t)v12, v10, &qword_1EDA1BC80);
  swift_endAccess();
  sub_1D81F7AC0();
  sub_1D81D8B6C((uint64_t)v12, &qword_1EDA1BC80);
  objc_msgSend(v1, sel_setAdjustsFontForContentSizeCategory_, 1);
  sub_1D81F8C94();
}

uint64_t sub_1D81FA3F8(uint64_t a1)
{
  uint64_t v1;

  return sub_1D81F8BA4(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_1D81FA400(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D81FA444()
{
  return MEMORY[0x1E0D42690];
}

void sub_1D81FA450(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;

  v3 = objc_msgSend(*a1, sel_textContainer);
  v4 = objc_msgSend(v3, sel_maximumNumberOfLines);

  *a2 = v4;
}

void sub_1D81FA4A8(uint64_t *a1, id *a2, uint64_t a3, uint64_t a4)
{
  sub_1D81F6FD8(a1, a2, a3, a4, (SEL *)&selRef_setMaximumNumberOfLines_);
}

void sub_1D81FA4C4(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;

  v3 = objc_msgSend(*a1, sel_textContainer);
  v4 = objc_msgSend(v3, sel_lineBreakMode);

  *a2 = v4;
}

void sub_1D81FA51C(uint64_t *a1, id *a2, uint64_t a3, uint64_t a4)
{
  sub_1D81F6FD8(a1, a2, a3, a4, (SEL *)&selRef_setLineBreakMode_);
}

uint64_t sub_1D81FA538@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a2, &qword_1EDA1C180);
}

uint64_t sub_1D81FA5A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a2, &qword_1EDA1BC80);
}

void sub_1D81FA600(_QWORD **a1@<X0>, float *a2@<X8>)
{
  *a2 = (*(float (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x150))();
}

uint64_t sub_1D81FA640(float *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(float))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x158))(*a1);
}

uint64_t sub_1D81FA67C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_attributedTextShouldOverrideTextViewAttributes);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_1D81FA6CC(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_attributedTextShouldOverrideTextViewAttributes);
  swift_beginAccess();
  *v3 = v2;
  sub_1D81F8C94();
}

_QWORD *sub_1D81FA724@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1C8))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1D81FA774(char *a1, _QWORD **a2)
{
  _QWORD *v2;
  char v4;

  v2 = *a2;
  v4 = *a1;
  return (*(uint64_t (**)(char *))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x1D0))(&v4);
}

uint64_t sub_1D81FA7C0()
{
  return type metadata accessor for DynamicTypeTextView();
}

void sub_1D81FA7C8()
{
  unint64_t v0;

  sub_1D81D6290();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for DynamicTypeTextView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DynamicTypeTextView.commonInit()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DynamicTypeTextView.textLength.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DynamicTypeTextView.numberOfLines.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.numberOfLines.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of DynamicTypeTextView.numberOfLines.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.lineBreakMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of DynamicTypeTextView.lineBreakMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.lineBreakMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of DynamicTypeTextView.isTextExtraTall.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.languageAwareOutsets.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of DynamicTypeTextView.fontUseCase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.fontUseCase.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of DynamicTypeTextView.fontUseCase.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.contentSizeCategoryMapping.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DynamicTypeTextView.contentSizeCategoryMapping.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of DynamicTypeTextView.contentSizeCategoryMapping.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of DynamicTypeTextView.customTextStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of DynamicTypeTextView.customTextStyle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of DynamicTypeTextView.customTextStyle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of DynamicTypeTextView.traitCollectionForFontUseCases.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of DynamicTypeTextView.hyphenationFactor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of DynamicTypeTextView.hyphenationFactor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of DynamicTypeTextView.hyphenationFactor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of DynamicTypeTextView.attributedTextShouldOverrideTextViewAttributes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of DynamicTypeTextView.attributedTextShouldOverrideTextViewAttributes.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of DynamicTypeTextView.attributedTextShouldOverrideTextViewAttributes.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of DynamicTypeTextView.directionalTextAlignment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.directionalTextAlignment.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of DynamicTypeTextView.directionalTextAlignment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.updateFont()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of DynamicTypeTextView.resetHyphenationFactor()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F8))();
}

uint64_t sub_1D81FABE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D81FAC0C(uint64_t a1)
{
  uint64_t v1;

  return sub_1D81FB8E4(a1, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16));
}

uint64_t sub_1D81FAC14@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1D81FB8B8(a1, *(uint64_t (**)(_QWORD))(v2 + 16), a2);
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

uint64_t sub_1D81FAC44()
{
  return swift_deallocObject();
}

void sub_1D81FAC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1D81F9E94(a1, a2, a3, *(float *)(v4 + 16), a4, *(char ***)(v4 + 24));
}

uint64_t sub_1D81FAC60()
{
  return swift_deallocObject();
}

uint64_t sub_1D81FAC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1D820CF7C(a1, a2, a3, a4, *(uint64_t (**)(void))(v4 + 16));
}

uint64_t sub_1D81FAC78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C290);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D81FACC0()
{
  return swift_deallocObject();
}

uint64_t sub_1D81FACD0(uint64_t a1, NSRange a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1D81F9BD8(a1, a2, a3, *(_QWORD *)(v3 + 16), *(uint64_t **)(v3 + 24));
}

uint64_t sub_1D81FACD8()
{
  return swift_deallocObject();
}

uint64_t sub_1D81FACE8()
{
  return swift_deallocObject();
}

uint64_t sub_1D81FACF8()
{
  return swift_deallocObject();
}

BOOL Artwork.Format.isLayeredImage.getter()
{
  unsigned __int8 *v0;

  return *v0 == 3;
}

void static Artwork.Format.standard(allowingTransparency:)(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t Artwork.Format.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1D81FAD60 + 4 * byte_1D8218504[*v0]))(6778480, 0xE300000000000000);
}

uint64_t sub_1D81FAD60()
{
  return 1734701162;
}

uint64_t sub_1D81FAD70()
{
  return 1667851624;
}

uint64_t sub_1D81FAD80()
{
  return 7496556;
}

void sub_1D81FAD8C(char *a1)
{
  sub_1D81EFD28(*a1);
}

unint64_t sub_1D81FAD9C()
{
  unint64_t result;

  result = qword_1F0167EE8;
  if (!qword_1F0167EE8)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Format, &type metadata for Artwork.Format);
    atomic_store(result, (unint64_t *)&qword_1F0167EE8);
  }
  return result;
}

void sub_1D81FADE0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1D8215AB4();
  __asm { BR              X9 }
}

uint64_t sub_1D81FAE24()
{
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

void sub_1D81FAE78()
{
  __asm { BR              X10 }
}

uint64_t sub_1D81FAEAC()
{
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

void sub_1D81FAEEC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1D8215AB4();
  __asm { BR              X9 }
}

uint64_t sub_1D81FAF2C()
{
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D81FAF80()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1D81FAFA8 + 4 * byte_1D8218514[*v0]))();
}

void sub_1D81FAFA8(_QWORD *a1@<X8>)
{
  *a1 = 1734701162;
  a1[1] = 0xE400000000000000;
}

void sub_1D81FAFBC(_QWORD *a1@<X8>)
{
  *a1 = 1667851624;
  a1[1] = 0xE400000000000000;
}

void sub_1D81FAFD0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 7496556;
  a1[1] = v1;
}

uint64_t _s6FormatOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D81FB02C + 4 * byte_1D821851D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1D81FB060 + 4 * byte_1D8218518[v4]))();
}

uint64_t sub_1D81FB060(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D81FB068(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D81FB070);
  return result;
}

uint64_t sub_1D81FB07C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D81FB084);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1D81FB088(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D81FB090(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t StringCharacteristics.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

AppStoreKit::StringCharacteristics __swiftcall StringCharacteristics.init(rawValue:)(AppStoreKit::StringCharacteristics rawValue)
{
  AppStoreKit::StringCharacteristics *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static StringCharacteristics.extraTallCharacters.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static StringCharacteristics.accentedCharacters.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static StringCharacteristics.longWords.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static StringCharacteristics.legacyExtraTallCharacters.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

uint64_t StringCharacteristics.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;

  v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    v2 = (char *)MEMORY[0x1E0DEE9D8];
    if ((v1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_1D81FB2E8(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_1D81FB2E8((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v5 = &v2[16 * v4];
  *((_QWORD *)v5 + 4) = 0xD000000000000014;
  *((_QWORD *)v5 + 5) = 0x80000001D821B090;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_1D81FB2E8(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v7 = *((_QWORD *)v2 + 2);
    v6 = *((_QWORD *)v2 + 3);
    if (v7 >= v6 >> 1)
      v2 = sub_1D81FB2E8((char *)(v6 > 1), v7 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v7 + 1;
    v8 = &v2[16 * v7];
    *((_QWORD *)v8 + 4) = 0xD000000000000013;
    *((_QWORD *)v8 + 5) = 0x80000001D821B070;
  }
LABEL_12:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1E8);
  sub_1D81DACAC(&qword_1EDA1C1F0, &qword_1EDA1C1E8, MEMORY[0x1E0DEAF20]);
  sub_1D8215688();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  return 91;
}

uint64_t sub_1D81FB2A8()
{
  return swift_deallocObject();
}

uint64_t sub_1D81FB2BC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

char *sub_1D81FB2E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C278);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1D81FB3EC()
{
  unint64_t result;

  result = qword_1F0167EF0;
  if (!qword_1F0167EF0)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for StringCharacteristics, &type metadata for StringCharacteristics);
    atomic_store(result, (unint64_t *)&qword_1F0167EF0);
  }
  return result;
}

unint64_t sub_1D81FB434()
{
  unint64_t result;

  result = qword_1F0167EF8;
  if (!qword_1F0167EF8)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for StringCharacteristics, &type metadata for StringCharacteristics);
    atomic_store(result, (unint64_t *)&qword_1F0167EF8);
  }
  return result;
}

unint64_t sub_1D81FB47C()
{
  unint64_t result;

  result = qword_1EDA1BBD8;
  if (!qword_1EDA1BBD8)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for StringCharacteristics, &type metadata for StringCharacteristics);
    atomic_store(result, (unint64_t *)&qword_1EDA1BBD8);
  }
  return result;
}

unint64_t sub_1D81FB4C4()
{
  unint64_t result;

  result = qword_1EDA1BBE0;
  if (!qword_1EDA1BBE0)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for StringCharacteristics, &type metadata for StringCharacteristics);
    atomic_store(result, (unint64_t *)&qword_1EDA1BBE0);
  }
  return result;
}

char *sub_1D81FB508(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1D81FB600(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C2A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1D81FB6F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BAC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1D81FB7F0()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for BundleImage();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EDA1D668 = (uint64_t)result;
  return result;
}

uint64_t sub_1D81FB840()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BundleImage()
{
  return objc_opt_self();
}

uint64_t CGSize.hash(into:)()
{
  sub_1D8215AD8();
  return sub_1D8215AD8();
}

uint64_t sub_1D81FB8B8@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = a2(*a1);
  *a3 = result;
  return result;
}

uint64_t sub_1D81FB8E4(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v3;
  uint64_t v4;

  v4 = a1;
  a2(&v3, &v4);
  return v3;
}

id DynamicTypeLabel.__allocating_init(customTextStyle:numberOfLines:lineBreakMode:directionalTextAlignment:contentSizeCategoryMapping:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _BYTE *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  _BYTE v24[24];

  v14 = a4 & 1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v15);
  v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  LOBYTE(a5) = *a5;
  v18 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v24[0] = (_BYTE)a5;
  v19 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, _QWORD, _BYTE *, uint64_t, uint64_t))(v7 + 136))(v17, a2, a3, v14, 0, v24, a6, a7);
  v20 = (uint64_t)v19 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle;
  swift_beginAccess();
  v21 = v19;
  sub_1D81FCEC8(a1, v20);
  swift_endAccess();

  return v21;
}

uint64_t DynamicTypeLabel.init(frame:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  char v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  v4 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 1, 1, v4);
  v8 = 0;
  v5 = (*(uint64_t (**)(char *, uint64_t, _QWORD, uint64_t, _QWORD, char *, _QWORD, _QWORD))(ObjectType + 136))(v2, 2, 0, 1, 0, &v8, 0, 0);
  swift_deallocPartialClassInstance();
  return v5;
}

id DynamicTypeLabel.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_1D81FBBA8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_1D81FBC08()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1D81FBC54(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1D81FBCA4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1D81FBCE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, uint64_t *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1D81FD750;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_1D81E3020(v4);
}

uint64_t sub_1D81FBD7C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1D81FD718;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1D81E3020(v3);
  sub_1D81E3020((uint64_t)v6);
  sub_1D81E2E70(v8);
  sub_1D81FBE50();
  return sub_1D81E2E70((uint64_t)v6);
}

uint64_t sub_1D81FBE50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[24];
  __int128 v12;
  uint64_t v13;
  _BYTE v14[40];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1D8215454();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (uint64_t)v0 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  swift_beginAccess();
  sub_1D81E1C08(v8, (uint64_t)v3, &qword_1EDA1C180);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1D81D8B6C((uint64_t)v3, &qword_1EDA1C180);
    v9 = (uint64_t)v0 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle;
    swift_beginAccess();
    sub_1D81E1C08(v9, (uint64_t)&v12, &qword_1EDA1BC80);
    if (v13)
    {
      sub_1D81F6AE4(&v12, (uint64_t)v14);
      (*(void (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))(v14);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    }
    else
    {
      return sub_1D81D8B6C((uint64_t)&v12, &qword_1EDA1BC80);
    }
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v3, v4);
    (*(void (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))(v7);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1D81FC024()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping);
  swift_beginAccess();
  v2 = *v1;
  sub_1D81E3020(*v1);
  return v2;
}

uint64_t sub_1D81FC07C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  sub_1D81E3020(a1);
  sub_1D81E2E70(v6);
  sub_1D81FBE50();
  return sub_1D81E2E70(a1);
}

uint64_t (*sub_1D81FC104(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D81FC14C;
}

uint64_t sub_1D81FC14C(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_1D81FBE50();
  return result;
}

void sub_1D81FC17C(_QWORD *a1)
{
  char *v1;
  char *v2;
  uint64_t (*v4)(void);
  void *v5;
  id v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char *v14;
  objc_super v15;

  v2 = v1;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1) + 0xC0);
  v5 = (void *)v4();
  v6 = objc_msgSend(v5, sel_preferredContentSizeCategory);

  v7 = (void **)&v2[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory];
  swift_beginAccess();
  v8 = *v7;
  *v7 = v6;

  v9 = (void *)((uint64_t (*)(id))v4)(objc_msgSend(v2, sel_setAdjustsFontForContentSizeCategory_, 0));
  v10 = (void *)sub_1D8215838();

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = (void *)sub_1D821546C();
  v15.receiver = v2;
  v15.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  objc_msgSendSuper2(&v15, sel_setFont_, v11);
  v12 = objc_msgSend(v2, sel_lineSpacing);
  v13 = 0;
  if (!v12)
  {
    v14 = &v2[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement];
    swift_beginAccess();
    if ((*v14 & 1) != 0 || v2[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] == 1)
      v13 = v11;
    else
      v13 = 0;
  }
  objc_msgSend(v2, sel_set_fontForShortcutBaselineCalculation_, v13);

}

uint64_t sub_1D81FC318(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE v12[24];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v12[-v8];
  sub_1D81E1C08(a1, (uint64_t)&v12[-v8], &qword_1EDA1C180);
  v10 = *a2 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  swift_beginAccess();
  sub_1D81E1C08(v10, (uint64_t)v7, &qword_1EDA1C180);
  swift_beginAccess();
  sub_1D81E2430((uint64_t)v9, v10, &qword_1EDA1C180);
  swift_endAccess();
  sub_1D81E1EA0((uint64_t)v7);
  sub_1D81D8B6C((uint64_t)v9, &qword_1EDA1C180);
  return sub_1D81D8B6C((uint64_t)v7, &qword_1EDA1C180);
}

void (*sub_1D81FC438(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180) - 8) + 64);
  v3[10] = malloc(v4);
  v3[11] = malloc(v4);
  v5 = malloc(v4);
  v6 = OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  v3[12] = v5;
  v3[13] = v6;
  v7 = v1 + v6;
  swift_beginAccess();
  sub_1D81E1C08(v7, (uint64_t)v5, &qword_1EDA1C180);
  return sub_1D81FC4EC;
}

void sub_1D81FC4EC(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 96);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 104);
  v5 = *(void **)(*(_QWORD *)a1 + 80);
  v6 = *(void **)(*(_QWORD *)a1 + 88);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 72) + v3;
  if ((a2 & 1) != 0)
  {
    sub_1D81E1C08(*(_QWORD *)(*(_QWORD *)a1 + 96), (uint64_t)v6, &qword_1EDA1C180);
    sub_1D81E1C08(v7, (uint64_t)v5, &qword_1EDA1C180);
    swift_beginAccess();
    sub_1D81E2430((uint64_t)v6, v7, &qword_1EDA1C180);
    swift_endAccess();
    sub_1D81E1EA0((uint64_t)v5);
    sub_1D81D8B6C((uint64_t)v6, &qword_1EDA1C180);
    v8 = (uint64_t)v5;
    v9 = (uint64_t)v4;
  }
  else
  {
    sub_1D81E1C08(*(_QWORD *)(*(_QWORD *)a1 + 72) + v3, (uint64_t)v6, &qword_1EDA1C180);
    swift_beginAccess();
    sub_1D81E2430((uint64_t)v4, v7, &qword_1EDA1C180);
    swift_endAccess();
    sub_1D81E1EA0((uint64_t)v6);
    v8 = (uint64_t)v4;
    v9 = (uint64_t)v6;
  }
  sub_1D81D8B6C(v8, &qword_1EDA1C180);
  sub_1D81D8B6C(v9, &qword_1EDA1C180);
  free(v4);
  free(v6);
  free(v5);
  free(v2);
}

uint64_t sub_1D81FC63C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a1, &qword_1EDA1BC80);
}

void (*sub_1D81FC694(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  uint64_t v6;

  v3 = malloc(0xB8uLL);
  *a1 = v3;
  v3[19] = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180) - 8) + 64);
  v3[20] = malloc(v4);
  v5 = malloc(v4);
  v6 = OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle;
  v3[21] = v5;
  v3[22] = v6;
  swift_beginAccess();
  return sub_1D81FC728;
}

void sub_1D81FC728(uint64_t *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    sub_1D81E1C08(*(_QWORD *)(v3 + 152) + *(_QWORD *)(v3 + 176), v3 + 40, &qword_1EDA1BC80);
    if (*(_QWORD *)(v3 + 64))
    {
      v4 = *(_QWORD *)(v3 + 160);
      v5 = *(_QWORD *)(v3 + 168);
      v6 = *(_QWORD **)(v3 + 152);
      sub_1D81F6AE4((__int128 *)(v3 + 40), v3);
      v7 = sub_1D8215454();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
      v8 = (uint64_t)v6 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
      swift_beginAccess();
      sub_1D81E1C08(v8, v4, &qword_1EDA1C180);
      swift_beginAccess();
      sub_1D81E2430(v5, v8, &qword_1EDA1C180);
      swift_endAccess();
      sub_1D81E1EA0(v4);
      sub_1D81D8B6C(v5, &qword_1EDA1C180);
      sub_1D81D8B6C(v4, &qword_1EDA1C180);
      (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v6) + 0xD8))(v3);
      __swift_destroy_boxed_opaque_existential_1(v3);
    }
    else
    {
      sub_1D81D8B6C(v3 + 40, &qword_1EDA1BC80);
    }
  }
  v9 = *(void **)(v3 + 160);
  free(*(void **)(v3 + 168));
  free(v9);
  free((void *)v3);
}

id sub_1D81FC8A8()
{
  return sub_1D81FCC54((SEL *)&selRef_font);
}

void sub_1D81FC8B4(void *a1)
{
  sub_1D81E0A20(a1);

}

uint64_t sub_1D81FC8D8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement);
  swift_beginAccess();
  return *v1;
}

void (*sub_1D81FC91C(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1D81FC974;
}

void sub_1D81FC974(uint64_t *a1, char a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) != 0)
  {
LABEL_9:
    free((void *)v3);
    return;
  }
  v4 = objc_msgSend(*(id *)(v3 + 24), sel_font);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(*(id *)(v3 + 24), sel_lineSpacing);
    v7 = *(void **)(v3 + 24);
    if (!v6
      && ((*((_BYTE *)v7 + *(_QWORD *)(v3 + 32)) & 1) != 0
       || *((_BYTE *)v7 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText) == 1))
    {
      objc_msgSend(v7, sel_set_fontForShortcutBaselineCalculation_, v5);
    }
    else
    {
      objc_msgSend(v7, sel_set_fontForShortcutBaselineCalculation_, 0);
    }

    goto LABEL_9;
  }
  __break(1u);
}

id sub_1D81FCA68()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return objc_msgSendSuper2(&v2, sel_textAlignment);
}

id sub_1D81FCA9C(uint64_t a1)
{
  char *v1;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  objc_super v6;
  unsigned __int8 v7;

  v3 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment];
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;
  v7 = v4;
  sub_1D81DA838(&v7);
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return objc_msgSendSuper2(&v6, sel_setTextAlignment_, a1);
}

uint64_t sub_1D81FCB1C()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  v1 = objc_msgSendSuper2(&v5, sel_text);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D82156D0();

  return v3;
}

void sub_1D81FCB94(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_super v4;

  if (a2)
  {
    v3 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  objc_msgSendSuper2(&v4, sel_setText_, v3);

  sub_1D81DFD48(1);
}

id sub_1D81FCC08()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return objc_msgSendSuper2(&v2, sel_lineSpacing);
}

id sub_1D81FCC48()
{
  return sub_1D81FCC54((SEL *)&selRef_attributedText);
}

id sub_1D81FCC54(SEL *a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return objc_msgSendSuper2(&v4, *a1);
}

void sub_1D81FCC94(void *a1)
{
  void *v1;
  id v3;
  objc_super v4;

  sub_1D81DFD48(0);
  v3 = objc_msgSend(v1, sel_lineBreakMode);
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  objc_msgSendSuper2(&v4, sel_setAttributedText_, a1);
  objc_msgSend(v1, sel_setLineBreakMode_, v3);

}

id sub_1D81FCD14(unsigned __int8 *a1, _QWORD *a2)
{
  unsigned __int8 v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  v2 = *a1;
  v3 = (unsigned __int8 *)(*a2 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v6 = v4;
  return sub_1D81DA838(&v6);
}

uint64_t sub_1D81FCD78@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

void (*sub_1D81FCDC4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return sub_1D81FCE30;
}

void sub_1D81FCE30(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  unsigned __int8 *v6;
  char v7;
  char v8;

  v2 = *(void **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(_BYTE *)(v4 + v3);
  *(_BYTE *)(v4 + v3) = *(_BYTE *)(*(_QWORD *)a1 + 40);
  if ((a2 & 1) != 0)
  {
    v7 = v5;
    v6 = (unsigned __int8 *)&v7;
  }
  else
  {
    v8 = v5;
    v6 = (unsigned __int8 *)&v8;
  }
  sub_1D81DA838(v6);
  free(v2);
}

id DynamicTypeLabel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D81FCEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BC80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_1D81FCF10(char *a1)
{
  char *v2;
  id result;
  id v4;
  char v5;
  uint64_t v6;
  id v7;
  char v8;
  uint64_t v9;
  objc_super v10;
  objc_super v11;

  v2 = &a1[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment];
  result = (id)swift_beginAccess();
  if (*v2)
  {
    if (*v2 == 1)
    {
      v4 = objc_msgSend(a1, sel_traitCollection);
      v5 = sub_1D8215820();

      if ((v5 & 1) != 0)
        v6 = 2;
      else
        v6 = 0;
      v10.receiver = a1;
      v10.super_class = (Class)type metadata accessor for DynamicTypeLabel();
      return objc_msgSendSuper2(&v10, sel_setTextAlignment_, v6);
    }
    else
    {
      v7 = objc_msgSend(a1, sel_traitCollection);
      v8 = sub_1D8215820();

      if ((v8 & 1) != 0)
        v9 = 0;
      else
        v9 = 2;
      v11.receiver = a1;
      v11.super_class = (Class)type metadata accessor for DynamicTypeLabel();
      return objc_msgSendSuper2(&v11, sel_setTextAlignment_, v9);
    }
  }
  return result;
}

uint64_t sub_1D81FD010(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  __int128 v13;
  uint64_t v14;
  _BYTE v15[40];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_1D8215454();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = (uint64_t)objc_msgSend(a1, sel_adjustsFontForContentSizeCategory);
  if ((result & 1) == 0)
  {
    v10 = (uint64_t)a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
    swift_beginAccess();
    sub_1D81E1C08(v10, (uint64_t)v4, &qword_1EDA1C180);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_1D81D8B6C((uint64_t)v4, &qword_1EDA1C180);
      v11 = (uint64_t)a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle;
      swift_beginAccess();
      sub_1D81E1C08(v11, (uint64_t)&v13, &qword_1EDA1BC80);
      if (v14)
      {
        sub_1D81F6AE4(&v13, (uint64_t)v15);
        (*(void (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & *a1) + 0xD8))(v15);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      }
      else
      {
        return sub_1D81D8B6C((uint64_t)&v13, &qword_1EDA1BC80);
      }
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(v8, v4, v5);
      (*(void (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & *a1) + 0xD0))(v8);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    }
  }
  return result;
}

void _s11AppStoreKit16DynamicTypeLabelC5coderACSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  char *v4;

  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory] = 0;
  v1 = &v0[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping];
  *v1 = 0;
  v1[1] = 0;
  v2 = &v0[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase];
  v3 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = &v0[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v0[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement] = 0;
  v0[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_isPlainText] = 1;
  v0[OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment] = 0;

  sub_1D82159B8();
  __break(1u);
}

id sub_1D81FD2E4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_1D81FD340@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a2, &qword_1EDA1C180);
}

uint64_t sub_1D81FD3A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle;
  swift_beginAccess();
  return sub_1D81E1C08(v3, a2, &qword_1EDA1BC80);
}

uint64_t sub_1D81FD3FC(uint64_t a1)
{
  _BYTE v2[40];

  sub_1D81E1C08(a1, (uint64_t)v2, &qword_1EDA1BC80);
  return sub_1D81E2250((uint64_t)v2);
}

uint64_t sub_1D81FD43C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_wantsFastBaselineMeasurement);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_1D81FD48C(char *a1)
{
  sub_1D81DFC78(*a1);
}

uint64_t sub_1D81FD4B0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1D81FD504()
{
  return type metadata accessor for DynamicTypeLabel();
}

uint64_t dispatch thunk of DynamicTypeLabel.__allocating_init(useCase:numberOfLines:lineBreakMode:isUserInteractionEnabled:directionalTextAlignment:contentSizeCategoryMapping:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v4 + 136))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of DynamicTypeLabel.fontUseCaseContentSizeCategory.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of DynamicTypeLabel.fontUseCaseContentSizeCategory.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DynamicTypeLabel.fontUseCaseContentSizeCategory.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of DynamicTypeLabel.traitCollectionForFontUseCases.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of DynamicTypeLabel.updateFont(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of DynamicTypeLabel.fontUseCase.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of DynamicTypeLabel.customTextStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of DynamicTypeLabel.customTextStyle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DynamicTypeLabel.customTextStyle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of DynamicTypeLabel.wantsFastBaselineMeasurement.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of DynamicTypeLabel.wantsFastBaselineMeasurement.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of DynamicTypeLabel.directionalTextAlignment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of DynamicTypeLabel.directionalTextAlignment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t sub_1D81FD6F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D81FD718(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16);
  v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t sub_1D81FD750@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result;
  return result;
}

BOOL Artwork.shouldUseWideGamut(for:)(uint64_t a1)
{
  id v1;
  id v2;
  id v3;

  if (*(_BYTE *)(a1 + 17) != 1)
    return 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  v2 = objc_msgSend(v1, sel_traitCollection);

  v3 = objc_msgSend(v2, sel_displayGamut);
  return v3 == (id)1;
}

uint64_t Artwork.config(using:)(double a1, double a2)
{
  uint64_t v3[2];

  v3[0] = 0;
  v3[1] = 0;
  return Artwork.config(using:cropCodeOverride:prefersLayeredImage:)(v3, 0, a1, a2);
}

uint64_t Artwork.config(using:cropCodeOverride:prefersLayeredImage:)(uint64_t *a1, uint64_t a2, double a3, double a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  char v22;
  uint64_t v24;
  char v25;
  uint64_t v26[2];
  uint64_t v27;
  uint64_t v28;
  char v29;
  unsigned __int8 v30;

  v8 = *a1;
  v7 = a1[1];
  sub_1D81DAE98(a2, (uint64_t)&v27);
  v9 = v27;
  v24 = v28;
  v10 = v29;
  v11 = v30;
  v12 = v4[3];
  v27 = v4[2];
  v28 = v12;
  v13 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v14 = objc_msgSend(v13, sel_mainScreen);
  objc_msgSend(v14, sel_scale);

  v15 = objc_msgSend(v13, sel_mainScreen);
  objc_msgSend(v15, sel_scale);
  v17 = v16;

  if (v7)
  {
    v18 = v7;
  }
  else
  {
    v8 = v4[9];
    v18 = swift_bridgeObjectRetain();
  }
  v26[0] = v8;
  v26[1] = v18;
  v25 = v9;
  swift_bridgeObjectRetain();
  if (v11)
  {
    v19 = objc_msgSend(v13, sel_mainScreen);
    v20 = objc_msgSend(v19, sel_traitCollection);

    v21 = objc_msgSend(v20, sel_displayGamut);
    v22 = v21 == (id)1;
  }
  else
  {
    v22 = 0;
  }
  type metadata accessor for ArtworkLoaderConfig();
  swift_allocObject();
  return ArtworkLoaderConfig.init(template:size:scale:crop:format:quality:useWideGamut:)(&v27, v26, &v25, v24, v10, v22, floor(a3), floor(a4), v17);
}

BOOL static CornerStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CornerStyle.hash(into:)()
{
  return sub_1D8215AC0();
}

uint64_t CornerStyle.hashValue.getter()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

BOOL sub_1D81FDA80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1D81FDA98()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

uint64_t sub_1D81FDADC()
{
  return sub_1D8215AC0();
}

uint64_t sub_1D81FDB04()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

unint64_t sub_1D81FDB48()
{
  unint64_t result;

  result = qword_1F0167F10;
  if (!qword_1F0167F10)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for CornerStyle, &type metadata for CornerStyle);
    atomic_store(result, (unint64_t *)&qword_1F0167F10);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CornerStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CornerStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D81FDC68 + 4 * byte_1D8218895[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D81FDC9C + 4 * byte_1D8218890[v4]))();
}

uint64_t sub_1D81FDC9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D81FDCA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D81FDCACLL);
  return result;
}

uint64_t sub_1D81FDCB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D81FDCC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D81FDCC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D81FDCCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

double sub_1D81FDCD8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1D81FDD1C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_1D81FDD68(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v3 = (_QWORD *)((char *)v1 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners);
  swift_beginAccess();
  *v3 = a1;
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) != 0)
    {
      v4 = 2;
      if ((a1 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
    v4 = 0;
    if ((a1 & 8) != 0)
    {
LABEL_12:
      v4 |= 8uLL;
      goto LABEL_13;
    }
LABEL_7:
    if ((a1 & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  if ((a1 & 2) == 0)
  {
    v4 = 1;
    if ((a1 & 8) != 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v4 = 3;
  if ((a1 & 8) != 0)
    goto LABEL_12;
LABEL_13:
  if ((a1 & 4) != 0 && (v4 & 4) == 0)
LABEL_15:
    v4 |= 4uLL;
LABEL_16:
  v5 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v5, sel_setMaskedCorners_, v4);

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE8))();
}

void (*sub_1D81FDE50(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1D81FDEA8;
}

void sub_1D81FDEA8(uint64_t *a1, char a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(_QWORD **)(v3 + 24);
    v5 = *(_QWORD *)((char *)v4 + *(_QWORD *)(v3 + 32));
    if ((v5 & 1) != 0)
    {
      if ((v5 & 2) != 0)
      {
        v6 = 3;
        if ((v5 & 8) == 0)
        {
LABEL_14:
          if ((v5 & 4) == 0 || (v6 & 4) != 0)
            goto LABEL_17;
LABEL_16:
          v6 |= 4uLL;
LABEL_17:
          v7 = objc_msgSend(*(id *)(v3 + 24), sel_layer);
          objc_msgSend(v7, sel_setMaskedCorners_, v6);

          (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0xE8))();
          goto LABEL_18;
        }
        goto LABEL_13;
      }
      v6 = 1;
      if ((v5 & 8) != 0)
        goto LABEL_13;
    }
    else
    {
      if ((v5 & 2) != 0)
      {
        v6 = 2;
        if ((v5 & 8) == 0)
          goto LABEL_14;
        goto LABEL_13;
      }
      v6 = 0;
      if ((v5 & 8) != 0)
      {
LABEL_13:
        v6 |= 8uLL;
        goto LABEL_14;
      }
    }
    if ((v5 & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_18:
  free((void *)v3);
}

void *sub_1D81FDF80()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1D81FDFCC(void *a1)
{
  sub_1D81FE71C(a1);

}

void (*sub_1D81FDFF0(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (void **)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v3[3] = *v5;
  v7 = v6;
  return sub_1D81FE064;
}

void sub_1D81FE064(uint64_t *a1, char a2)
{
  uint64_t v2;
  void *v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v2 = *a1;
  v4 = (void **)(*a1 + 24);
  v3 = *v4;
  v6 = *(_QWORD *)(*a1 + 32);
  v5 = *(_QWORD *)(*a1 + 40);
  v7 = *(void **)(v6 + v5);
  if ((a2 & 1) != 0)
  {
    v8 = v3;
    if (v7)
    {
      objc_msgSend(v7, sel_removeFromSuperview);
      v7 = *(void **)(v6 + v5);
      v6 = *(_QWORD *)(v2 + 32);
      v5 = *(_QWORD *)(v2 + 40);
    }
    *(_QWORD *)(v6 + v5) = v3;
    v10 = v8;

    if (*(_QWORD *)(v6 + v5))
      objc_msgSend(*(id *)(v2 + 32), sel_addSubview_);

    v9 = *v4;
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(v6 + v5), sel_removeFromSuperview);
      v7 = *(void **)(v6 + v5);
      v6 = *(_QWORD *)(v2 + 32);
      v5 = *(_QWORD *)(v2 + 40);
    }
    *(_QWORD *)(v6 + v5) = v3;
    v9 = v3;

    if (*(_QWORD *)(v6 + v5))
      objc_msgSend(*(id *)(v2 + 32), sel_addSubview_);
  }

  free((void *)v2);
}

void sub_1D81FE15C(void **a1, _QWORD **a2)
{
  void *v2;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;

  v2 = *a1;
  v3 = *a2;
  v4 = (void **)((char *)*a2 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = v2;
  v6 = v2;

  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xE8))();
}

id sub_1D81FE1E4()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor);
  swift_beginAccess();
  return *v1;
}

uint64_t (*sub_1D81FE228(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D81FE270;
}

double sub_1D81FE274()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t (*sub_1D81FE2B8(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D81FE270;
}

uint64_t sub_1D81FE300(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(a1 + 24)) + 0xE8))(result);
  return result;
}

id RoundedCornerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id RoundedCornerView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

_QWORD *RoundedCornerView.__allocating_init(radius:style:)(char *a1, double a2)
{
  objc_class *v2;
  char v4;
  _QWORD *v5;
  void (*v6)(char *, double);
  _QWORD *v7;
  char v9;

  v4 = *a1;
  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v9 = v4;
  v6 = *(void (**)(char *, double))((*MEMORY[0x1E0DEEDD8] & *v5) + 0xB0);
  v7 = v5;
  v6(&v9, a2);

  return v7;
}

void sub_1D81FE48C()
{
  char *v0;
  id *v1;
  id v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for RoundedCornerView();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  v1 = (id *)&v0[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView];
  swift_beginAccess();
  if (*v1)
  {
    v2 = *v1;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v2, sel_setFrame_);

  }
}

id sub_1D81FE518(void *a1)
{
  _QWORD *v1;
  id v3;
  id v4;
  id result;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for RoundedCornerView();
  objc_msgSendSuper2(&v6, sel_traitCollectionDidChange_, a1);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_userInterfaceStyle);

  if (!a1)
    return (id)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE8))();
  result = objc_msgSend(a1, sel_userInterfaceStyle);
  if (v4 != result)
    return (id)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE8))();
  return result;
}

BOOL sub_1D81FE5CC(char *a1, double a2)
{
  void *v2;
  void *v3;
  char v5;
  id v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _BYTE v11[2];

  v3 = v2;
  v5 = *a1;
  v6 = objc_msgSend(v2, sel_superview);
  if (v6)
  {
    v7 = v6;
    type metadata accessor for RoundedCornerView();
    v8 = (_QWORD *)swift_dynamicCastClass();
    if (v8)
    {
      v11[0] = v5;
      (*(void (**)(_BYTE *, double))((*MEMORY[0x1E0DEEDD8] & *v8) + 0xB0))(v11, a2);
      v9 = objc_msgSend(v2, sel_superview);
      objc_msgSend(v9, sel_setNeedsLayout);

    }
  }
  v11[1] = v5;
  return CornerStyle.apply(withRadius:to:)(v3, a2);
}

id RoundedCornerView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RoundedCornerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D81FE71C(void *a1)
{
  char *v1;
  id *v3;
  id v4;
  id v5;

  v3 = (id *)&v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView];
  swift_beginAccess();
  if (*v3)
  {
    objc_msgSend(*v3, sel_removeFromSuperview);
    v4 = *v3;
  }
  else
  {
    v4 = 0;
  }
  *v3 = a1;
  v5 = a1;

  if (*v3)
    objc_msgSend(v1, sel_addSubview_);
}

void _s11AppStoreKit17RoundedCornerViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  uint64_t v1;

  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius] = 0;
  v0[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners] = -1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView] = 0;
  v1 = OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor;
  *(_QWORD *)&v0[v1] = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth] = 0;

  sub_1D82159B8();
  __break(1u);
}

double sub_1D81FE87C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius, a2);
}

uint64_t sub_1D81FE888(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerRadius);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_1D81FE8DC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1D81FE92C(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_cornerStyle);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_1D81FE978@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

uint64_t sub_1D81FE9B8(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xC0))(*a1);
}

id sub_1D81FE9F4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_1D81FEA44(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1D81FE71C(v1);

}

id sub_1D81FEA80@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

double sub_1D81FEAD4@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth, a2);
}

double keypath_getTm@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

uint64_t sub_1D81FEB2C(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = *a1;
  v3 = *a2;
  v4 = (_QWORD *)((char *)*a2 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth);
  v5 = swift_beginAccess();
  *v4 = v2;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xE8))(v5);
}

uint64_t dispatch thunk of RoundedCornerView.cornerRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of RoundedCornerView.cornerStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of RoundedCornerView.roundedCorners.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of RoundedCornerView.roundedCorners.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of RoundedCornerView.roundedCorners.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of RoundedCornerView.borderView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of RoundedCornerView.borderView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of RoundedCornerView.borderView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of RoundedCornerView.updateBorder()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of RoundedCornerView.borderColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of RoundedCornerView.borderColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of RoundedCornerView.borderWidth.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of RoundedCornerView.borderWidth.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of RoundedCornerView.applyCorner(radius:style:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t sub_1D81FED24()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  if (!*(_QWORD *)(*v0 + 16))
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_1D81FF0F8(v1);
    v1 = result;
    v3 = *(_QWORD *)(result + 16);
    if (v3)
      goto LABEL_4;
    goto LABEL_7;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
LABEL_4:
    v4 = v3 - 1;
    result = *(unsigned int *)(v1 + 4 * v4 + 32);
    *(_QWORD *)(v1 + 16) = v4;
    *v0 = v1;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t sub_1D81FED8C(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_1D81FEE68(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_1D8215970();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_1D8215994();
      v5 = sub_1D82159A0();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_1D81FEE68(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_1D81FEF04(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_1D81FEF70(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_1D81FEF04(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_1D81FF080(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_1D81FEF70(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v7 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL))
          goto LABEL_14;
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_1D8215994();
        v5 = v12;
        if (v12 == v10)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          v7 = v5 - 1;
          v8 = *(_BYTE *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      v7 = v5;
      return v7 << 16;
    }
    v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v9 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v9)
      return sub_1D8215964();
  }
  return result;
}

uint64_t sub_1D81FF080(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_1D8215754();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1D82AA07C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

char *sub_1D81FF0F8(uint64_t a1)
{
  return sub_1D81FB600(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

id sub_1D81FF10C(void *a1, uint64_t a2, uint64_t a3, id a4, id a5, void *a6)
{
  void *v8;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (a5)
    return objc_msgSend(a5, sel_paragraphStyleWithBaseWritingDirection_, a4);
  v18[0] = 0;
  v18[1] = 0;
  v12 = objc_msgSend(a1, sel_paragraphStyleAtIndex_effectiveRange_, a2, v18);
  if (!v12)
    return a6;
  v8 = v12;
  v13 = sub_1D82158B0();
  if ((v15 & 1) != 0
    || v13 != a2
    || v14 != a3
    || objc_msgSend(v8, sel_baseWritingDirection) != a4
    && (a4 != (id)-1 || objc_msgSend(v8, sel_baseWritingDirection) == (id)-1))
  {
    v16 = objc_msgSend(v8, sel_paragraphStyleWithBaseWritingDirection_, a4);

    return v16;
  }
  return v8;
}

void sub_1D81FF268(id a1@<X0>, void *a2@<X1>, void *a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  int v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  int v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  unint64_t v38;
  unsigned int v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  UniChar *v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  uint64_t v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  UniChar v56;
  uint64_t v57;
  UniChar *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  _BOOL4 v63;
  _BOOL4 v64;
  uint64_t v65;
  uint64_t v66;
  _BOOL4 v67;
  int v68;
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  uint64_t v74;
  BOOL v75;
  id v76;
  uint64_t v77;
  objc_class *ObjCClassFromMetadata;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  void *v83;
  id v84;
  char *v85;
  char *v86;
  uint64_t v87;
  id v88;
  id v89;
  char v90;
  char v91;
  char *v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  char v102;
  id v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  id v108;
  uint64_t v109;
  char v110;
  char *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  char v118;
  char *v119;
  char *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  char v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD v129[2];
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  __CFString *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  UniChar *v140;
  uint64_t v141;
  uint64_t v142;
  CFRange v143;
  CFRange v144;

  if (a1)
  {
    v8 = objc_msgSend(a1, sel_mutableString);
  }
  else
  {
    if (!a2)
    {
      if (qword_1EDA1C2B0 != -1)
        goto LABEL_295;
      goto LABEL_260;
    }
    v8 = a2;
  }
  v9 = (uint64_t)v8;
  v10 = (uint64_t)objc_msgSend(v8, sel_length);
  if (v10 < 1)
  {
    if (qword_1EDA1C2B0 == -1)
    {
LABEL_258:
      v92 = (char *)(id)qword_1EDA1BCC8;

      goto LABEL_261;
    }
LABEL_286:
    swift_once();
    goto LABEL_258;
  }
  v11 = v10;
  v101 = a3;
  v109 = a5;
  v103 = a1;
  v108 = (id)v9;
  sub_1D8212B7C(v108, 0, v11, &v135);
  v9 = sub_1D82152A4();
  v12 = sub_1D82152A4();
  a5 = 0;
  v118 = 0;
  v122 = 0;
  v124 = 0;
  v111 = 0;
  v112 = 0;
  v113 = 0;
  v127 = 0;
  v115 = 0;
  v110 = 0;
  v131 = 0;
  v133 = MEMORY[0x1E0DEE9D8];
  v134 = MEMORY[0x1E0DEE9D8];
  v132 = MEMORY[0x1E0DEE9D8];
  v102 = (a1 == 0) | a4;
  v130 = (char *)MEMORY[0x1E0DEE9D8];
  v99 = *MEMORY[0x1E0DC1258];
  v100 = *MEMORY[0x1E0DC1178];
  v125 = v9;
  v126 = v9;
  v121 = v9;
  v128 = v11;
  while (1)
  {
    v13 = 0;
    v106 = 0;
    v107 = 0;
    v14 = 0;
    v15 = 0;
    v105 = a5;
LABEL_8:
    v104 = v14;
    v114 = a5;
LABEL_9:
    v119 = v13;
    v116 = 0;
    v16 = 0;
    LOBYTE(v17) = -1;
    v123 = -1;
LABEL_12:
    if (a5 < 0 || (v18 = v137, a5 >= v137))
    {
      v9 = 0;
LABEL_18:
      v20 = 1;
      v21 = __OFADD__(a5++, 1);
      if (v21)
        goto LABEL_263;
      goto LABEL_19;
    }
    v19 = v138;
    if (v138)
    {
      v17 = a5 + v136;
      if (__OFADD__(a5, v136))
        goto LABEL_266;
      v9 = *(unsigned __int16 *)(v138 + 2 * v17);
    }
    else
    {
      LOBYTE(v17) = v139;
      if (v139)
      {
        if (__OFADD__(a5, v136))
          goto LABEL_270;
        LODWORD(v17) = *(char *)(v139 + a5 + v136);
        if ((v17 & 0x80000000) != 0)
          goto LABEL_271;
        v9 = *(unsigned __int8 *)(v139 + a5 + v136);
      }
      else
      {
        if (a5 >= v142 || (v45 = v141, a5 < v141))
        {
          v53 = 4;
          if (a5 > 4)
            v53 = a5;
          v45 = v53 - 4;
          v141 = v53 - 4;
          v21 = __OFADD__(v53, 2044);
          v54 = v53 + 2044;
          if (v21)
            goto LABEL_281;
          if (v137 < v54)
            v54 = v137;
          v142 = v54;
          if (__OFADD__(v136, v45))
            goto LABEL_282;
          if (__OFSUB__(v54, v45))
            goto LABEL_283;
          v46 = v140;
          v143.location = v136 + v45;
          v143.length = v54 - v45;
          CFStringGetCharacters(v135, v143, v140);
        }
        else
        {
          v46 = v140;
        }
        if (!v46)
          goto LABEL_310;
        v17 = a5 - v45;
        if (__OFSUB__(a5, v45))
          goto LABEL_273;
        v9 = v46[v17];
      }
    }
    if ((unsigned __int16)((unsigned __int16)(v9 + 9216) >> 10) < 0x3Fu)
    {
      LODWORD(v17) = v9 >> 11;
      if (v9 >> 11 == 27)
        goto LABEL_175;
      goto LABEL_18;
    }
    if (a5 >= v18 - 1)
      goto LABEL_175;
    v55 = a5 + 1;
    if (v19)
    {
      v17 = v55 + v136;
      if (__OFADD__(v55, v136))
        goto LABEL_272;
      v56 = *(_WORD *)(v19 + 2 * v17);
      goto LABEL_174;
    }
    if (v139)
    {
      if (__OFADD__(v55, v136))
        goto LABEL_284;
      if (*(char *)(v139 + v55 + v136) < 0)
        goto LABEL_285;
      v56 = *(unsigned __int8 *)(v139 + v55 + v136);
      goto LABEL_174;
    }
    if (v55 >= v142 || (v57 = v141, v55 < v141))
    {
      v65 = 3;
      if (a5 > 3)
        v65 = a5;
      v57 = v65 - 3;
      v141 = v65 - 3;
      v21 = __OFADD__(v65, 2045);
      v66 = v65 + 2045;
      if (v21)
        goto LABEL_297;
      if (v18 < v66)
        v66 = v18;
      v142 = v66;
      if (__OFADD__(v136, v57))
        goto LABEL_298;
      if (__OFSUB__(v66, v57))
        goto LABEL_299;
      v58 = v140;
      v144.location = v136 + v57;
      v144.length = v66 - v57;
      CFStringGetCharacters(v135, v144, v140);
    }
    else
    {
      v58 = v140;
    }
    if (!v58)
      goto LABEL_311;
    if (__OFSUB__(v55, v57))
      break;
    v56 = v58[v55 - v57];
LABEL_174:
    if ((unsigned __int16)((unsigned __int16)(v56 + 0x2000) >> 10) < 0x3Fu)
    {
LABEL_175:
      LODWORD(v17) = 0;
      ++a5;
      v23 = 1;
      v24 = 1;
      v25 = 1;
      v20 = 1;
      goto LABEL_182;
    }
    LODWORD(v17) = ((unsigned __int16)(v9 + 10240) << 10) + (unsigned __int16)(v56 + 9216);
    v9 = (v17 + 0x10000);
    v20 = 2;
    v21 = __OFADD__(a5, 2);
    a5 += 2;
    if (v21)
      goto LABEL_263;
LABEL_19:
    v22 = AMPGetBidiClass(v9);
    LODWORD(v17) = 0;
    v23 = 1;
    v24 = 1;
    v25 = 1;
    switch(v22)
    {
      case 8:
        v26 = v130;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v26 = sub_1D81FB600(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
        v28 = *((_QWORD *)v26 + 2);
        v27 = *((_QWORD *)v26 + 3);
        if (v28 >= v27 >> 1)
          v26 = sub_1D81FB600((char *)(v27 > 1), v28 + 1, 1, v26);
        LOBYTE(v17) = 0;
        *((_QWORD *)v26 + 2) = v28 + 1;
        *(_DWORD *)&v26[4 * v28 + 32] = v9;
        v130 = v26;
        v29 = 1;
        switch((int)v9)
        {
          case 8234:
          case 8237:
            goto LABEL_68;
          case 8235:
          case 8238:
            goto LABEL_41;
          default:
            goto LABEL_76;
        }
        goto LABEL_76;
      case 9:
        v31 = *((_QWORD *)v130 + 2);
        if (v31)
        {
          v32 = *(_DWORD *)&v130[4 * v31 + 28] - 8234;
          if (v32 <= 4 && v32 != 2)
            goto LABEL_37;
        }
        goto LABEL_51;
      case 10:
        v36 = v130;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v36 = sub_1D81FB600(0, *((_QWORD *)v36 + 2) + 1, 1, v36);
        v38 = *((_QWORD *)v36 + 2);
        v37 = *((_QWORD *)v36 + 3);
        if (v38 >= v37 >> 1)
          v36 = sub_1D81FB600((char *)(v37 > 1), v38 + 1, 1, v36);
        *((_QWORD *)v36 + 2) = v38 + 1;
        *(_DWORD *)&v36[4 * v38 + 32] = v9;
        v130 = v36;
        switch((_DWORD)v9)
        {
          case 0x2068:
            v122 = 0;
            v124 = 0;
            LOBYTE(v17) = v118 ^ 1;
            v118 = 1;
            break;
          case 0x2067:
            v118 = 0;
            v124 = 0;
            LOBYTE(v17) = v122 ^ 1;
            v122 = 1;
            break;
          case 0x2066:
            v118 = 0;
            v122 = 0;
            LOBYTE(v17) = v124 ^ 1;
            v124 = 1;
            break;
          default:
LABEL_51:
            LOBYTE(v17) = 0;
            break;
        }
        goto LABEL_75;
      case 11:
        v30 = *((_QWORD *)v130 + 2);
        if (!v30 || (*(_DWORD *)&v130[4 * v30 + 28] - 8294) > 2)
          goto LABEL_51;
LABEL_37:
        v9 = (uint64_t)&v130;
        sub_1D81FED24();
        v17 = *((_QWORD *)v130 + 2);
        if (v17)
        {
          v34 = *(_DWORD *)&v130[4 * v17 + 28];
          LOBYTE(v17) = 0;
          v29 = 1;
          v35 = (v34 - 8234);
          if (v35 <= 0x3E)
          {
            if (((1 << v35) & 0x1000000000000009) != 0)
            {
LABEL_68:
              v118 = 0;
              v122 = 0;
              LOBYTE(v17) = v124 ^ 1;
              v124 = 1;
            }
            else if (((1 << v35) & 0x2000000000000012) != 0)
            {
LABEL_41:
              v118 = 0;
              v124 = 0;
              LOBYTE(v17) = v122 ^ 1;
              v122 = 1;
            }
            else if (v35 == 62)
            {
              v122 = 0;
              v124 = 0;
              LOBYTE(v17) = v118 ^ 1;
              v118 = 1;
            }
          }
        }
        else
        {
          LOBYTE(v17) = 1;
LABEL_75:
          v29 = 1;
        }
LABEL_76:
        v21 = __OFADD__(v16, v20);
        v16 += v20;
        if (v21)
          goto LABEL_264;
        if ((*((_QWORD *)v130 + 2) != 0) | v17 & 1)
        {
          if ((v124 & 1) != 0)
          {
            v47 = sub_1D81EF900(0, v123);
            v123 = 0;
            LODWORD(v17) = 0;
            v23 = 0;
            v116 = !v47;
            v124 = 1;
          }
          else
          {
            if ((v122 & 1) != 0)
            {
              v122 = 1;
              v50 = sub_1D81EF900(1, v123);
              v124 = 0;
              LODWORD(v17) = 0;
              v23 = 0;
              v116 = !v50;
              v51 = 1;
            }
            else
            {
              if ((v118 & 1) == 0)
              {
                v118 = 0;
                v122 = 0;
                v124 = 0;
LABEL_180:
                LODWORD(v17) = 0;
                v23 = 0;
                goto LABEL_181;
              }
              v52 = sub_1D81EF900(-1, v123);
              v122 = 0;
              v124 = 0;
              LODWORD(v17) = 0;
              v23 = 0;
              v116 = !v52;
              v118 = 1;
              v51 = -1;
            }
            v123 = v51;
          }
LABEL_181:
          v24 = v29;
          v25 = v29;
          goto LABEL_182;
        }
        break;
      case 12:
        goto LABEL_58;
      case 13:
        goto LABEL_182;
      case 14:
        if (v9 > 0x7F)
        {
          v71 = (v9 & 0x3F) << 8;
          if (v9 >= 0x800)
          {
            v72 = (v71 | (v9 >> 6) & 0x3F) << 8;
            v73 = (((v72 | (v9 >> 12) & 0x3F) << 8) | (v9 >> 18)) - 2122219023;
            v39 = (v72 | (v9 >> 12)) + 8487393;
            if (WORD1(v9))
              v39 = v73;
          }
          else
          {
            v39 = (v71 | (v9 >> 6)) + 33217;
          }
        }
        else
        {
          v39 = v9 + 1;
        }
        v129[0] = (v39 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v39) >> 3))));
        v40 = MEMORY[0x1D82AA04C](v129);
        v42 = sub_1D81FED8C(v40, v41);
        if ((v42 & 0x100000000) != 0)
          goto LABEL_309;
        v43 = v42;
        swift_bridgeObjectRelease();
        if ((v43 - 14) > 0xFFFFFFFB || (v43 - 8232) < 2 || v43 == 133)
        {
LABEL_58:
          if ((_DWORD)v9 == 8232)
          {
            v17 = v131;
            if (!v131)
              v17 = MEMORY[0x1E0DEE9D8];
            v131 = v17;
            if (__OFSUB__(a5, v20))
              goto LABEL_269;
            sub_1D81F9CF8(a5 - v20);
            LODWORD(v17) = 1;
          }
          else
          {
            LODWORD(v17) = 1;
            if (v128 > a5 && (_DWORD)v9 == 13)
            {
              sub_1D8212998(a5);
              if ((v44 & 0x1FFFFFFFFLL) == 0xA)
              {
                ++v20;
                ++a5;
              }
              LODWORD(v17) = 1;
            }
          }
        }
        else
        {
          LODWORD(v17) = 0;
        }
        v23 = 1;
        v24 = 1;
        v25 = 1;
        goto LABEL_182;
      default:
        v29 = 0;
        goto LABEL_76;
    }
    LODWORD(v17) = 0;
    v23 = 0;
    v24 = 1;
    v25 = 1;
    switch(v22)
    {
      case 0:
      case 15:
      case 16:
        goto LABEL_182;
      case 1:
        if (sub_1D81EF900(-1, v123))
        {
          v123 = 0;
          LODWORD(v17) = 0;
          v23 = 0;
        }
        else
        {
          v63 = sub_1D81EF900(0, v123);
          LODWORD(v17) = 0;
          v23 = 0;
          v116 |= !v63;
        }
        v24 = 1;
        goto LABEL_182;
      case 2:
        if (sub_1D81EF900(-1, v123))
        {
          LODWORD(v17) = 0;
          v23 = 0;
          v123 = 1;
          v24 = 1;
        }
        else
        {
          v24 = 1;
          v64 = sub_1D81EF900(1, v123);
          LODWORD(v17) = 0;
          v23 = 0;
          v116 |= !v64;
        }
        goto LABEL_182;
      case 3:
      case 4:
        v48 = sub_1D82152A4();
        v49 = v126;
        if (v48 != v126)
          goto LABEL_84;
        if (sub_1D82152A4() == v125)
        {
          v49 = a5 - v20;
          if (__OFSUB__(a5, v20))
            goto LABEL_290;
LABEL_84:
          v25 = v29;
        }
        else
        {
          v127 = v115 + v20;
          if (__OFADD__(v115, v20))
            goto LABEL_294;
          v49 = v125;
        }
        v59 = v127 + v20;
        if (__OFADD__(v127, v20))
        {
          __break(1u);
LABEL_280:
          __break(1u);
LABEL_281:
          __break(1u);
LABEL_282:
          __break(1u);
LABEL_283:
          __break(1u);
LABEL_284:
          __break(1u);
LABEL_285:
          __break(1u);
          goto LABEL_286;
        }
        v127 += v20;
        v60 = v59 + v49;
        v12 = v60 - 1;
        if (__OFSUB__(v60, 1))
          goto LABEL_280;
        v126 = v49;
        v61 = v123;
        if (sub_1D81EF900(-1, v123))
        {
          v62 = sub_1D81EF900(4, v22);
          LODWORD(v17) = 0;
          v23 = 0;
          if (v62)
            v61 = 1;
          v123 = v61;
          v24 = v29;
        }
        else
        {
LABEL_152:
          LODWORD(v17) = 0;
          v23 = 0;
          v24 = v29;
        }
LABEL_182:
        v21 = __OFADD__(v15, v20);
        v15 += v20;
        if (v21)
        {
          __break(1u);
LABEL_263:
          __break(1u);
LABEL_264:
          __break(1u);
LABEL_265:
          __break(1u);
LABEL_266:
          __break(1u);
LABEL_267:
          __break(1u);
LABEL_268:
          __break(1u);
LABEL_269:
          __break(1u);
LABEL_270:
          __break(1u);
LABEL_271:
          __break(1u);
LABEL_272:
          __break(1u);
LABEL_273:
          __break(1u);
          goto LABEL_274;
        }
        v67 = a5 == v128;
        if (a5 == v128)
          v68 = 1;
        else
          v68 = v25;
        if (a5 == v128)
          v69 = 1;
        else
          v69 = v17;
        if (a5 == v128)
          v70 = 1;
        else
          v70 = v23;
        if (a5 == v128)
          v9 = 1;
        else
          v9 = v24;
        if (v68 == 1)
        {
          if (sub_1D82152A4() == v125)
          {
            LODWORD(v17) = v69;
            v23 = v70;
            v24 = v9;
            goto LABEL_198;
          }
          if ((v9 & 1) != 0)
          {
            v115 = 0;
            v125 = v121;
            goto LABEL_202;
          }
          v115 = 0;
          v13 = v119;
          LOBYTE(v17) = v121;
          v125 = v121;
          if ((v70 & 1) != 0)
          {
            v67 = 0;
            v125 = v121;
            v74 = v127;
            goto LABEL_221;
          }
          goto LABEL_12;
        }
LABEL_198:
        v69 = v17;
        v70 = v23;
        if (!v24)
          goto LABEL_10;
LABEL_202:
        if (sub_1D82152A4() == v126)
        {
LABEL_10:
          if (v70)
          {
            v74 = v127;
            v13 = v119;
            goto LABEL_221;
          }
          if (a5 == v128)
            goto LABEL_275;
          goto LABEL_12;
        }
        v17 = v126 + v127 - 1;
        if (__OFSUB__(v126 + v127, 1))
          goto LABEL_265;
        if (v12 < v17)
        {
          v17 = v12 - v126;
          if (__OFSUB__(v12, v126))
            goto LABEL_267;
          v21 = __OFADD__(v17++, 1);
          v127 = v17;
          if (v21)
            goto LABEL_268;
        }
        if ((a4 & 1) != 0)
        {
          v9 = (uint64_t)&v134;
          sub_1D81F9D94(v126, v127);
        }
        v12 = sub_1D82152A4();
        v13 = v119;
        if ((v70 & 1) == 0)
        {
          v127 = 0;
          LOBYTE(v17) = v121;
          v126 = v121;
          if (a5 == v128)
            goto LABEL_275;
          goto LABEL_12;
        }
        v74 = 0;
        v126 = v121;
LABEL_221:
        v127 = v74;
        if (v123 == 1)
        {
          v75 = __CFADD__(v107++, 1);
          if (!v75)
            goto LABEL_227;
          goto LABEL_289;
        }
        if (v123)
        {
          if (v16 < 1)
            goto LABEL_234;
          v75 = __CFADD__(v13++, 1);
          if (!v75)
            goto LABEL_231;
          __break(1u);
LABEL_297:
          __break(1u);
LABEL_298:
          __break(1u);
LABEL_299:
          __break(1u);
LABEL_300:
          __break(1u);
LABEL_301:
          __break(1u);
LABEL_302:
          __break(1u);
LABEL_303:
          __break(1u);
LABEL_304:
          __break(1u);
LABEL_305:
          __break(1u);
          goto LABEL_306;
        }
        v75 = __CFADD__(v106++, 1);
        if (v75)
          goto LABEL_288;
LABEL_227:
        if (v16 < 1)
          goto LABEL_234;
LABEL_231:
        if ((a4 & 1) != 0)
        {
          sub_1D81D898C(0, &qword_1EDA1BF48);
          v76 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_valueWithRange_direction_hasMixedDirectionality_, v114, v16, v123, v116 & 1);
          v9 = (uint64_t)&v133;
          sub_1D81F9E34();
        }
        if ((v116 & 1) == 0)
        {
LABEL_234:
          if (v69)
            goto LABEL_243;
          v114 = a5;
          if (v67)
            goto LABEL_275;
          goto LABEL_9;
        }
        if (v103)
        {
          v120 = v13;
          v77 = nullsub_1(v123);
          sub_1D81D898C(0, &qword_1EDA1C258);
          ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
          v79 = v103;
          v80 = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_initWithInteger_, v77);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F0167F48);
          v81 = swift_allocObject();
          *(_OWORD *)(v81 + 16) = xmmword_1D8218970;
          *(_QWORD *)(v81 + 32) = v80;
          v129[0] = v81;
          sub_1D8215784();
          v9 = v129[0];
          v82 = v80;
          v83 = (void *)sub_1D821576C();
          swift_bridgeObjectRelease();
          objc_msgSend(v79, sel_addAttribute_value_range_, v99, v83, v114, v16);

          v13 = v120;
        }
        if ((v69 & 1) == 0)
        {
          v14 = 1;
          LOBYTE(v17) = 1;
          v110 = 1;
          if (v67)
          {
LABEL_274:
            v110 = v17;
            goto LABEL_275;
          }
          goto LABEL_8;
        }
        v104 = 1;
        v110 = 1;
LABEL_243:
        if (__CFADD__(v112, v106))
        {
LABEL_306:
          __break(1u);
LABEL_307:
          __break(1u);
LABEL_308:
          __break(1u);
LABEL_309:
          __break(1u);
LABEL_310:
          __break(1u);
LABEL_311:
          __break(1u);
LABEL_312:
          v129[0] = 0;
          v129[1] = 0xE000000000000000;
          sub_1D821597C();
          sub_1D8215A24();
          sub_1D8209BA4();
          sub_1D8215A24();
          sub_1D82159B8();
          __break(1u);
          JUMPOUT(0x1D82004A0);
        }
        if (__CFADD__(v113, v107))
          goto LABEL_307;
        v75 = __CFADD__(v111, v13);
        v111 = &v13[(_QWORD)v111];
        if (v75)
          goto LABEL_308;
        v112 += v106;
        v113 += v107;
        v84 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
        v85 = WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(v13, v106, v107);
        v86 = v85;
        if ((v85[OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough] & 1) != 0)
          v87 = 1;
        else
          v87 = v85[OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts] - 1;
        if ((v102 & 1) != 0
          && (sub_1D81D898C(0, &qword_1EDA1BF48),
              v88 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_valueWithRange_direction_hasMixedDirectionality_, v105, v15, v87, v104 & 1), v9 = (uint64_t)&v132, sub_1D81F9E34(), !v103))
        {
LABEL_253:

          if (v67)
            goto LABEL_275;
        }
        else
        {
          v89 = (id)sub_1D81F44E4(v87);
          v9 = (uint64_t)sub_1D81FF10C(v103, v105, v15, (id)v87, v101, v89);
          v91 = v90;

          if ((v91 & 1) != 0)
          {
            objc_msgSend(v103, sel_addAttribute_value_range_, v100, v9, v105, v15);

            goto LABEL_253;
          }

          if (v67)
          {
LABEL_275:
            swift_bridgeObjectRelease();
            v93 = v110;
            if (v140)
              MEMORY[0x1D82AAB50](v140, -1, -1);
            v98 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
            v92 = WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(v111, v112, v113);

            v96 = v133;
            v95 = v134;
            v94 = v131;
            v97 = v132;
            a5 = v109;
            goto LABEL_278;
          }
        }
        break;
      case 5:
        if (sub_1D82152A4() == v126)
        {
          if (sub_1D82152A4() != v125)
            goto LABEL_152;
          v125 = a5 - v20;
          if (__OFSUB__(a5, v20))
            goto LABEL_300;
          v21 = __OFADD__(v115, v20);
          v115 += v20;
          if (v21)
            goto LABEL_304;
        }
        else
        {
          v21 = __OFADD__(v127, v20);
          v127 += v20;
          if (v21)
            goto LABEL_291;
        }
        goto LABEL_180;
      case 6:
        if (sub_1D82152A4() == v126)
        {
          if (sub_1D82152A4() == v125)
          {
            v125 = a5 - v20;
            if (__OFSUB__(a5, v20))
              goto LABEL_301;
            v21 = __OFADD__(v115, v20);
            v115 += v20;
            if (v21)
              goto LABEL_305;
          }
          else
          {
            v21 = __OFADD__(v115, v20);
            v115 += v20;
            if (v21)
              goto LABEL_303;
          }
        }
        else
        {
          v21 = __OFADD__(v127, v20);
          v127 += v20;
          if (v21)
            goto LABEL_292;
        }
        goto LABEL_180;
      case 7:
        if (sub_1D82152A4() == v126)
        {
          if (sub_1D82152A4() != v125)
          {
            v21 = __OFADD__(v115, v20);
            v115 += v20;
            if (v21)
              goto LABEL_302;
          }
        }
        else
        {
          v21 = __OFADD__(v127, v20);
          v127 += v20;
          if (v21)
            goto LABEL_293;
        }
        goto LABEL_180;
      case 8:
      case 9:
      case 10:
      case 11:
        goto LABEL_180;
      default:
        goto LABEL_312;
    }
  }
  __break(1u);
LABEL_288:
  __break(1u);
LABEL_289:
  __break(1u);
LABEL_290:
  __break(1u);
LABEL_291:
  __break(1u);
LABEL_292:
  __break(1u);
LABEL_293:
  __break(1u);
LABEL_294:
  __break(1u);
LABEL_295:
  swift_once();
LABEL_260:
  v92 = (char *)(id)qword_1EDA1BCC8;
LABEL_261:
  v93 = 0;
  v94 = 0;
  v95 = MEMORY[0x1E0DEE9D8];
  v96 = MEMORY[0x1E0DEE9D8];
  v97 = MEMORY[0x1E0DEE9D8];
LABEL_278:
  *(_QWORD *)a5 = v95;
  *(_QWORD *)(a5 + 8) = v96;
  *(_QWORD *)(a5 + 16) = v97;
  *(_QWORD *)(a5 + 24) = v92;
  *(_BYTE *)(a5 + 32) = v93 & 1;
  *(_QWORD *)(a5 + 40) = v94;
}

void NSTextStorage.writingDirectionOfLine(_:layoutManager:textContainer:)(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v8;
  id v9;
  _QWORD *v10;
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  _QWORD aBlock[5];
  _QWORD *v37;

  v4 = (uint64_t)v3;
  v5 = a3;
  v6 = a2;
  if (!a2)
  {
    v11 = objc_msgSend(v3, sel_layoutManagers);
    sub_1D81D898C(0, &qword_1F0167ED0);
    v12 = sub_1D8215778();

    if (v12 >> 62)
      goto LABEL_24;
    if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_25;
    goto LABEL_6;
  }
  v8 = a2;
  if (!a3)
    goto LABEL_10;
LABEL_3:
  v9 = v6;
  v10 = v5;
  while (1)
  {
    v18 = v5;
    v34 = v10;
    objc_msgSend(v8, sel_ensureLayoutForTextContainer_, v10);
    v19 = objc_msgSend((id)v4, sel_fullRange);
    v35 = objc_msgSend(v8, sel_glyphRangeForCharacterRange_actualCharacterRange_, v19, v20, 0);
    v22 = v21;
    v5 = (_QWORD *)swift_allocObject();
    v5[2] = 0;
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_1D82152A4();
    v24 = (_QWORD *)(v23 + 16);
    *(_QWORD *)(v23 + 24) = 0;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)(v4 + 24) = 0;
    *(_BYTE *)(v4 + 32) = 1;
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = v5;
    v25[3] = a1;
    v25[4] = v23;
    v25[5] = v8;
    v25[6] = v4;
    aBlock[4] = sub_1D8200B30;
    v37 = v25;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D8200B5C;
    aBlock[3] = &block_descriptor_1;
    v26 = _Block_copy(aBlock);
    v6 = v37;
    swift_retain();
    swift_retain();
    v27 = v8;
    swift_retain();
    swift_release();
    objc_msgSend(v27, sel_enumerateLineFragmentsForGlyphRange_usingBlock_, v35, v22, v26);
    _Block_release(v26);
    if (a1 == -1)
    {
      swift_beginAccess();
      if ((*(_BYTE *)(v4 + 32) & 1) == 0)
      {
        v28 = objc_msgSend(v27, sel_characterRangeForGlyphRange_actualGlyphRange_, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), 0);
        v30 = v29;
        swift_beginAccess();
        *(_QWORD *)(v23 + 16) = v28;
        *(_QWORD *)(v23 + 24) = v30;
      }
    }
    v12 = sub_1D82152A4();
    swift_beginAccess();
    if (v12 == *v24)
    {
      swift_release();
      swift_release();
      swift_release();

      return;
    }
    v31 = *(_QWORD *)(v23 + 24) + *v24;
    if (!__OFSUB__(v31, 1))
    {
      NSAttributedString.strongBaseWritingDirectionOfParagraph(atOrBefore:)(v31 - 1);
      swift_release();
      swift_release();
      swift_release();

      return;
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    v32 = sub_1D82159C4();
    swift_bridgeObjectRelease();
    if (!v32)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_26;
    }
LABEL_6:
    if ((v12 & 0xC000000000000001) == 0)
      break;
LABEL_26:
    v13 = (id)MEMORY[0x1D82AA2D4](0, v12);
LABEL_9:
    v8 = v13;
    swift_bridgeObjectRelease();
    if (v5)
      goto LABEL_3;
LABEL_10:
    v14 = v6;
    v15 = objc_msgSend(v8, sel_textContainers);
    sub_1D81D898C(0, &qword_1F0167ED8);
    v16 = sub_1D8215778();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      v33 = sub_1D82159C4();
      swift_bridgeObjectRelease();
      if (!v33)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        __break(1u);
LABEL_29:
        v17 = (_QWORD *)MEMORY[0x1D82AA2D4](0, v16);
        goto LABEL_15;
      }
    }
    else if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_28;
    }
    if ((v16 & 0xC000000000000001) != 0)
      goto LABEL_29;
    if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_31;
    v17 = *(id *)(v16 + 32);
LABEL_15:
    v10 = v17;
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = *(id *)(v12 + 32);
    goto LABEL_9;
  }
  __break(1u);
LABEL_31:
  __break(1u);
}

uint64_t sub_1D820099C()
{
  return swift_deallocObject();
}

uint64_t sub_1D82009AC()
{
  return swift_deallocObject();
}

uint64_t sub_1D82009BC()
{
  return swift_deallocObject();
}

void sub_1D82009CC(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, uint64_t a9, uint64_t a10, uint64_t a11, _BYTE *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  CGRect v28;

  v28.size.height = a8;
  v28.size.width = a7;
  v28.origin.y = a6;
  v28.origin.x = a5;
  if (CGRectGetHeight(v28) != 0.0)
  {
    v24 = (_QWORD *)(a13 + 16);
    swift_beginAccess();
    if (*v24 == a14)
    {
      v25 = objc_msgSend(a16, sel_characterRangeForGlyphRange_actualGlyphRange_, a10, a11, 0);
      v27 = v26;
      swift_beginAccess();
      *(_QWORD *)(a15 + 16) = v25;
      *(_QWORD *)(a15 + 24) = v27;
      *a12 = 1;
    }
    else
    {
      swift_beginAccess();
      if (__OFADD__(*v24, 1))
      {
        __break(1u);
      }
      else
      {
        ++*v24;
        swift_beginAccess();
        *(_QWORD *)(a17 + 16) = a10;
        *(_QWORD *)(a17 + 24) = a11;
        *(_BYTE *)(a17 + 32) = 0;
      }
    }
  }
}

uint64_t sub_1D8200AF4()
{
  uint64_t v0;

  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_1D8200B30(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  uint64_t v12;

  sub_1D82009CC(a5, a6, a7, a8, a9, a10, a11, a12, a1, a2, a3, a4, *(_QWORD *)(v12 + 16), *(_QWORD *)(v12 + 24), *(_QWORD *)(v12 + 32), *(void **)(v12 + 40), *(_QWORD *)(v12 + 48));
}

void sub_1D8200B5C(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  void (*v19)(double, double, double, double, double, double, double, double);
  id v20;

  v19 = *(void (**)(double, double, double, double, double, double, double, double))(a1 + 32);
  swift_retain();
  v20 = a2;
  v19(a3, a4, a5, a6, a7, a8, a9, a10);
  swift_release();

}

uint64_t sub_1D8200C30(void *a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v9 = a4;
  v10 = a5;
  v11 = a1;
  NSTextStorage.writingDirectionOfLine(_:layoutManager:textContainer:)(a3, a4, a5);
  v13 = v12;

  return v13;
}

BOOL static DirectionalTextAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DirectionalTextAlignment.hash(into:)()
{
  return sub_1D8215AC0();
}

uint64_t DirectionalTextAlignment.hashValue.getter()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

BOOL sub_1D8200D28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1D8200D40()
{
  unint64_t result;

  result = qword_1F0167F50;
  if (!qword_1F0167F50)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for DirectionalTextAlignment, &type metadata for DirectionalTextAlignment);
    atomic_store(result, (unint64_t *)&qword_1F0167F50);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DirectionalTextAlignment(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DirectionalTextAlignment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D8200E60 + 4 * byte_1D8218985[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D8200E94 + 4 * byte_1D8218980[v4]))();
}

uint64_t sub_1D8200E94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D8200E9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D8200EA4);
  return result;
}

uint64_t sub_1D8200EB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D8200EB8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D8200EBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D8200EC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t Artwork.__allocating_init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t *a7, uint64_t a8, double a9, double a10, char a11, uint64_t a12, uint64_t a13)
{
  uint64_t v21;

  v21 = swift_allocObject();
  Artwork.init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 & 1, a12, a13);
  return v21;
}

void sub_1D8200F90(_QWORD *a1@<X8>)
{
  *a1 = 25186;
  a1[1] = 0xE200000000000000;
}

void *Artwork.backgroundGradientColor.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 56);
  v2 = v1;
  return v1;
}

uint64_t Artwork.variants.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1D8200FCC()
{
  double *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v15[2];
  unsigned __int8 v16;
  uint64_t v17[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1B0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *((_QWORD *)v0 + 3);
  v17[0] = (uint64_t)v0[2];
  v17[1] = v4;
  v5 = v0[4];
  v6 = v0[5];
  v7 = (void *)*((_QWORD *)v0 + 6);
  v16 = 0;
  v8 = *((_QWORD *)v0 + 10);
  v15[0] = (uint64_t)v0[9];
  v15[1] = v8;
  v9 = *((_QWORD *)v0 + 12);
  v10 = sub_1D82155B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v3, 1, 1, v10);
  type metadata accessor for Artwork();
  v11 = swift_allocObject();
  v12 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Artwork.init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)(0, 0, v17, (uint64_t)v7, 0, &v16, v15, 0, v5, v6, 1u, v9, (uint64_t)v3);
  return v11;
}

BOOL sub_1D8201104()
{
  uint64_t v0;

  return *(double *)(v0 + 32) > *(double *)(v0 + 40);
}

double sub_1D8201114(void *a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  uint64_t v12;
  uint64_t v13;

  v12 = *(_QWORD *)(v2 + 16);
  v13 = *(_QWORD *)(v2 + 24);
  Artwork.URLTemplate.systemImageName.getter();
  if (v5)
  {
    if (a1)
    {
      v6 = a1;
      v7 = (void *)sub_1D82156AC();
      swift_bridgeObjectRelease();
      v8 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v7, v6, v12, v13);

    }
    else
    {
      v6 = (id)sub_1D82156AC();
      swift_bridgeObjectRelease();
      v8 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v6, 0, v12, v13);
    }

    if (v8)
    {
      v9 = v8;
      objc_msgSend(v9, sel_size);
      a2 = v10;
      objc_msgSend(v9, sel_size);
      objc_msgSend(v9, sel_size);
      sub_1D8215898();
      sub_1D8215898();

    }
  }
  return a2;
}

uint64_t sub_1D82012B0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D82153E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1D82153D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1D81D8B6C((uint64_t)v2, &qword_1EDA1BFE8);
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  v7 = sub_1D82153C4();
  if (!v8)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    goto LABEL_11;
  }
  if (v7 == 0x656372756F736572 && v8 == 0xE800000000000000)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_1D8215A3C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      return 0;
  }
  return 1;
}

uint64_t sub_1D8201474()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D82153E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1D82153D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1D81D8B6C((uint64_t)v2, &qword_1EDA1BFE8);
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  v7 = sub_1D82153C4();
  if (!v8)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    goto LABEL_11;
  }
  if (v7 == 0x6D696D6574737973 && v8 == 0xEB00000000656761)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_1D8215A3C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      return 0;
  }
  return 1;
}

uint64_t sub_1D8201648()
{
  return Artwork.URLTemplate.systemImageName.getter();
}

BOOL sub_1D8201678()
{
  return Artwork.URLTemplate.isLocalImage.getter();
}

uint64_t Artwork.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D81E6140(v1 + 104, a1);
}

uint64_t Artwork.segue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D81E1C08(v1 + 144, a1, &qword_1EDA1C550);
}

uint64_t Artwork.impressionMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D81E1C08(v1 + OBJC_IVAR____TtC11AppStoreKit7Artwork_impressionMetrics, a1, &qword_1EDA1C1B0);
}

uint64_t sub_1D8201708()
{
  swift_bridgeObjectRetain();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  sub_1D8215AD8();
  sub_1D8215AD8();
  swift_bridgeObjectRetain();
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

id sub_1D8201798(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v2 = *(_QWORD *)(v1 + 96);
  if (*(_QWORD *)(v2 + 16))
  {
    objc_opt_self();
    swift_bridgeObjectRetain();
    v3 = *(unsigned __int8 *)(v2 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0167F58);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1D8218A40;
    *(_QWORD *)(inited + 32) = 0x74616D726F66;
    *(_QWORD *)(inited + 40) = 0xE600000000000000;
    __asm { BR              X10 }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0167F58);
  v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_1D8218A50;
  *(_QWORD *)(v5 + 32) = 0x6574616C706D6574;
  *(_QWORD *)(v5 + 40) = 0xE800000000000000;
  swift_bridgeObjectRetain();
  v6 = sub_1D81E0070(MEMORY[0x1E0DEE9D8]);
  Artwork.URLTemplate.makeString(withSubstitutions:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1;
  v8 = sub_1D8215A54();
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_valueWithObject_inContext_, v8, v7);
  swift_unknownObjectRelease();

  *(_QWORD *)(v5 + 48) = v10;
  *(_QWORD *)(v5 + 56) = 0x6874646977;
  *(_QWORD *)(v5 + 64) = 0xE500000000000000;
  v11 = v7;
  v12 = objc_msgSend(v9, sel_valueWithObject_inContext_, sub_1D8215A54(), v11);
  swift_unknownObjectRelease();

  *(_QWORD *)(v5 + 72) = v12;
  *(_QWORD *)(v5 + 80) = 0x746867696568;
  *(_QWORD *)(v5 + 88) = 0xE600000000000000;
  v13 = v11;
  v14 = objc_msgSend(v9, sel_valueWithObject_inContext_, sub_1D8215A54(), v13);
  swift_unknownObjectRelease();

  *(_QWORD *)(v5 + 96) = v14;
  *(_QWORD *)(v5 + 104) = 0x73746E6169726176;
  *(_QWORD *)(v5 + 112) = 0xE800000000000000;
  v15 = v13;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BA80);
  v16 = objc_msgSend(v9, sel_valueWithObject_inContext_, sub_1D8215A54(), v15);
  swift_unknownObjectRelease();

  *(_QWORD *)(v5 + 120) = v16;
  sub_1D820EF88(v5);
  v17 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0167F60);
  v18 = objc_msgSend(v9, sel_valueWithObject_inContext_, sub_1D8215A54(), v17);
  swift_unknownObjectRelease();

  if (!v18)
  {
    __break(1u);
    JUMPOUT(0x1D8201D58);
  }
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t Artwork.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D81E610C(v0 + 104);
  sub_1D81D8B6C(v0 + 144, &qword_1EDA1C550);
  sub_1D81D8B6C(v0 + OBJC_IVAR____TtC11AppStoreKit7Artwork_impressionMetrics, &qword_1EDA1C1B0);
  return v0;
}

uint64_t Artwork.__deallocating_deinit()
{
  Artwork.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1D8201DF8()
{
  sub_1D8215AB4();
  sub_1D8201708();
  return sub_1D8215AE4();
}

uint64_t sub_1D8201E34@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_1D81E6140(*v1 + 104, a1);
}

uint64_t sub_1D8201E44@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_1D81E1C08(*v1 + 144, a1, &qword_1EDA1C550);
}

uint64_t sub_1D8201E70()
{
  return sub_1D82155BC();
}

uint64_t sub_1D8201E84()
{
  return sub_1D82155C8();
}

id sub_1D8201E98(void *a1)
{
  return sub_1D8201798(a1);
}

uint64_t sub_1D8201EB8()
{
  sub_1D8215AB4();
  sub_1D8201708();
  return sub_1D8215AE4();
}

uint64_t sub_1D8201EF8()
{
  return sub_1D8201708();
}

uint64_t sub_1D8201F18()
{
  sub_1D8215AB4();
  sub_1D8201708();
  return sub_1D8215AE4();
}

uint64_t sub_1D8201F54@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_1D81E1C08(*v1 + OBJC_IVAR____TtC11AppStoreKit7Artwork_impressionMetrics, a1, &qword_1EDA1C1B0);
}

uint64_t sub_1D8201F84(uint64_t *a1, uint64_t *a2)
{
  return _s11AppStoreKit7ArtworkC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t _s11AppStoreKit7ArtworkC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  BOOL v5;
  char v6;

  v4 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
  if ((v4 || (sub_1D8215A3C() & 1) != 0)
    && (*(double *)(a1 + 32) == *(double *)(a2 + 32) ? (v5 = *(double *)(a1 + 40) == *(double *)(a2 + 40)) : (v5 = 0),
        v5
     && (sub_1D81DD248(*(_BYTE *)(a1 + 64)), (v6 & 1) != 0)
     && (*(_QWORD *)(a1 + 72) == *(_QWORD *)(a2 + 72) && *(_QWORD *)(a1 + 80) == *(_QWORD *)(a2 + 80)
      || (sub_1D8215A3C() & 1) != 0)))
  {
    return sub_1D8202120(*(_QWORD *)(a1 + 96), *(_QWORD *)(a2 + 96));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1D8202034()
{
  return sub_1D81E802C(&qword_1EDA1C2A0, (uint64_t (*)(uint64_t))type metadata accessor for Artwork, (uint64_t)&protocol conformance descriptor for Artwork);
}

uint64_t sub_1D8202060()
{
  return type metadata accessor for Artwork();
}

uint64_t method lookup function for Artwork()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Artwork.__allocating_init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of Artwork.__allocating_init(deserializing:using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of Artwork.removingStyle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of Artwork.isLandscape.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of Artwork.symbolImageMeasurements(using:fallBackSize:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of Artwork.isBundleImage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of Artwork.isSystemImage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of Artwork.systemImageName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of Artwork.isLocalImage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of Artwork.hash(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of Artwork.makeValue(in:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of Artwork.hashValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t sub_1D8202120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    if (a1 != a2)
      __asm { BR              X10 }
  }
  return 1;
}

id sub_1D82022D8(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_1D82159C4();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_1D82159C4();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x1D82AA2D4](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x1D82AA2D4](0, v2);
LABEL_21:
    v14 = v13;
    sub_1D81D898C(0, &qword_1F0167F68);
    v15 = sub_1D82158A4();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x1D82AA2D4](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x1D82AA2D4](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_1D82158A4();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_1D82158A4();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

void _s11AppStoreKit19ViewBackgroundStyleO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_1D8202634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  if (v9)
  {
    v25 = v8;
    v26 = v11;
    v19 = v8;
    v21 = v11;
    v22 = v4;
    sub_1D8202AB8(v19, v3, v13, v12, v10, v21, v9);
    sub_1D8202AB8(v22, v5, a3, v7, v14, v28, v6);
    sub_1D8202B18(v22, v5, a3, v7, v14, v28, v6);
    sub_1D8202B18(v25, v27, v13, v12, v10, v26, v9);
    return 0;
  }
  else
  {
    v15 = v13;
    v24 = v13;
    v16 = v3;
    v17 = v4;
    sub_1D81D898C(0, &qword_1EDA1BAB8);
    sub_1D8202AB8(v8, v16, v15, v12, v10, v11, 0);
    sub_1D8202AB8(v17, v5, a3, v7, v14, v28, 0);
    LOBYTE(v16) = sub_1D82158A4();
    sub_1D8202B18(v17, v5, a3, v7, v14, v28, 0);
    sub_1D8202B18(v8, v27, v24, v12, v10, v11, 0);
    return v16 & 1;
  }
}

id sub_1D8202AB8(id result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  id v7;

  switch(a7)
  {
    case 2:
      return (id)swift_bridgeObjectRetain();
    case 1:
      v7 = result;
      return a2;
    case 0:
      return result;
  }
  return result;
}

void destroy for ViewBackgroundStyle(uint64_t a1)
{
  sub_1D8202B18(*(void **)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

void sub_1D8202B18(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  switch(a7)
  {
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 1:

      break;
    case 0:

      break;
  }
}

uint64_t initializeWithCopy for ViewBackgroundStyle(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1D8202AB8(*(id *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for ViewBackgroundStyle(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1D8202AB8(*(id *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(void **)a1;
  v11 = *(void **)(a1 + 8);
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
  sub_1D8202B18(v10, v11, v12, v13, v14, v15, v16);
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

uint64_t assignWithTake for ViewBackgroundStyle(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(void **)a1;
  v6 = *(void **)(a1 + 8);
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
  sub_1D8202B18(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewBackgroundStyle(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewBackgroundStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_1D8202D70(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 2u)
    return *(unsigned __int8 *)(a1 + 48);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1D8202D88(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)(result + 40) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ViewBackgroundStyle()
{
  return &type metadata for ViewBackgroundStyle;
}

uint64_t sub_1D8202DC0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_unknownObjectRetain();
}

uint64_t sub_1D8202DCC()
{
  void **v0;
  void *v1;

  v1 = *v0;
  sub_1D8215AB4();
  objc_msgSend(v1, sel_hash);
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

uint64_t sub_1D8202E1C()
{
  id *v0;

  objc_msgSend(*v0, sel_hash);
  return sub_1D8215AC0();
}

uint64_t sub_1D8202E50()
{
  void **v0;
  void *v1;

  v1 = *v0;
  sub_1D8215AB4();
  objc_msgSend(v1, sel_hash);
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

id sub_1D8202E9C(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_isEqual_, *a2);
}

unint64_t ArtworkLoader.FetchError.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;

  v2 = *(_QWORD *)v0;
  v1 = *(_QWORD *)(v0 + 8);
  if (*(_BYTE *)(v0 + 16))
  {
    if (*(_BYTE *)(v0 + 16) == 1)
    {
      swift_retain();
      sub_1D821597C();
      swift_bridgeObjectRelease();
      v4 = 0xD000000000000013;
      sub_1D8209DC8();
      sub_1D8215724();
      swift_bridgeObjectRelease();
      sub_1D8204800(v2, v1, 1u);
    }
    else
    {
      sub_1D821597C();
      swift_bridgeObjectRelease();
      v4 = 0xD000000000000018;
      sub_1D8215724();
    }
  }
  else
  {
    swift_retain();
    sub_1D821597C();
    swift_bridgeObjectRelease();
    v4 = 0xD000000000000019;
    sub_1D8209DC8();
    sub_1D8215724();
    swift_bridgeObjectRelease();
    sub_1D8204800(v2, v1, 0);
  }
  return v4;
}

id ArtworkLoader.resourceLoader.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t ArtworkLoader.__allocating_init(parent:)(_QWORD *a1)
{
  uint64_t v2;

  swift_allocObject();
  v2 = sub_1D81DA284(a1);
  swift_release();
  return v2;
}

uint64_t ArtworkLoader.__allocating_init(queue:cacheLimit:renderIntent:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  ArtworkLoader.init(queue:cacheLimit:renderIntent:)(a1, a2, a3);
  return v6;
}

uint64_t ArtworkLoader.deinit()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D8205300(v0 + 72);
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ArtworkLoader.__deallocating_deinit()
{
  ArtworkLoader.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1D82031A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t result;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v24;
  id v25;
  _BYTE v26[32];

  v3 = sub_1D82154CC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (uint64_t *)((char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(void **)(v1 + 24);
  *v6 = v7;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF740], v3);
  v8 = v7;
  LOBYTE(v7) = sub_1D82154D8();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  v10 = *(void **)(v1 + 16);
  sub_1D81DDC44();
  v12 = objc_msgSend(v10, sel_cachedResourcesForCacheKey_, v11);
  swift_unknownObjectRelease();
  if (!v12)
    return 0;
  v13 = sub_1D8215778();

  v14 = *(_QWORD *)(v13 + 16);
  if (!v14)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  v15 = *(double *)(a1 + 32);
  v16 = *(double *)(a1 + 40);
  v17 = v13 + 32;
  while (1)
  {
    sub_1D81E5848(v17, (uint64_t)v26);
    sub_1D81D898C(0, &qword_1EDA1BAB0);
    if (swift_dynamicCast())
    {
      v18 = v25;
      objc_msgSend(v25, sel_size);
      v20 = v19;
      v22 = v21;

      if (v20 == v15 && v22 == v16)
        break;
    }
    v17 += 32;
    if (!--v14)
      goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1D8203384(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v5)(uint64_t, uint64_t, _QWORD *, _QWORD);
  uint64_t v6;
  _QWORD v7[2];

  if (result)
  {
    v5 = (void (*)(uint64_t, uint64_t, _QWORD *, _QWORD))result;
    v6 = *(_QWORD *)(a4 + 24);
    v7[0] = *(_QWORD *)(a4 + 16);
    v7[1] = v6;
    swift_bridgeObjectRetain();
    v5(a3, 1, v7, 0);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ArtworkLoader.fetchArtworkFromCache(using:forReason:closestMatch:completionHandler:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v5;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = a1;
  swift_retain();
  sub_1D81E3020(a4);
  v12 = swift_retain();
  sub_1D81E7D74(v12, a2, a3, a4, a5, (uint64_t)sub_1D8205360, (uint64_t)v11);
  return swift_release();
}

void sub_1D820348C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[6];

  v7 = objc_msgSend(*(id *)(a1 + 16), sel_notificationQueue);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v10[4] = sub_1D8205B40;
  v10[5] = v8;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1D81D7A68;
  v10[3] = &block_descriptor_88;
  v9 = _Block_copy(v10);
  sub_1D81E3020(a2);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_addOperationWithBlock_, v9);
  _Block_release(v9);

}

void sub_1D8203584(void (*a1)(_QWORD, _QWORD, _QWORD *, void *), uint64_t a2, uint64_t a3, char a4)
{
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  if (a1)
  {
    sub_1D8205424();
    v9[0] = 0;
    v9[1] = 0;
    v7 = (void *)swift_allocError();
    *(_QWORD *)v8 = a3;
    *(_QWORD *)(v8 + 8) = 0;
    *(_BYTE *)(v8 + 16) = a4;
    swift_retain();
    a1(0, 0, v9, v7);

  }
}

Swift::Void __swiftcall ArtworkLoader.prefetchArtwork(using:)(Swift::OpaquePointer using)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  Swift::OpaquePointer *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_1D82154A8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D82154C0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = v2[3];
  v13 = (Swift::OpaquePointer *)swift_allocObject();
  v13[2]._rawValue = using._rawValue;
  v13[3]._rawValue = v2;
  aBlock[4] = sub_1D8205494;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D81D7A68;
  aBlock[3] = &block_descriptor_2;
  v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1D82154B4();
  v15[1] = MEMORY[0x1E0DEE9D8];
  sub_1D81E802C(&qword_1EDA1C188, v5, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1D8);
  sub_1D81E806C(&qword_1EDA1C1E0, &qword_1EDA1C1D8);
  sub_1D8215910();
  MEMORY[0x1D82AA154](0, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
}

uint64_t sub_1D8203808(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v41 = a2;
  v3 = sub_1D82152F8();
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  MEMORY[0x1E0C80A78](v3);
  v39 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v35 - v9;
  v11 = sub_1D82153E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v36 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v35 - v16;
  MEMORY[0x1E0C80A78](v15);
  v42 = (char *)&v35 - v18;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1D82159C4();
    v19 = result;
    if (result)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  v19 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v19)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v19 >= 1)
  {
    v40 = v17;
    v43 = v8;
    v44 = a1;
    v21 = 0;
    v45 = a1 & 0xC000000000000001;
    v46 = v19;
    v22 = v42;
    while (1)
    {
      if (v45)
      {
        v23 = MEMORY[0x1D82AA2D4](v21, a1);
      }
      else
      {
        v23 = *(_QWORD *)(a1 + 8 * v21 + 32);
        swift_retain();
      }
      swift_bridgeObjectRetain();
      sub_1D82153D0();
      v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
      if (v24(v10, 1, v11) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v22, v10, v11);
      v25 = sub_1D82153C4();
      if (!v26)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v11);
        a1 = v44;
        goto LABEL_17;
      }
      if (v25 == 0x6D696D6574737973 && v26 == 0xEB00000000656761)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v11);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_22:
        v28 = (uint64_t)v43;
        sub_1D81DFE68();
        if (v24((char *)v28, 1, v11) == 1)
        {
          swift_release();
          sub_1D81D8B6C(v28, &qword_1EDA1BFE8);
          a1 = v44;
        }
        else
        {
          v29 = v40;
          (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v40, v28, v11);
          v30 = v41;
          if ((sub_1D82031A8(v23) & 1) != 0)
          {
            (*(void (**)(char *, uint64_t))(v12 + 8))(v29, v11);
            swift_release();
          }
          else
          {
            v31 = sub_1D81E6548();
            (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v36, v29, v11);
            v32 = (uint64_t)v39;
            sub_1D82152D4();
            v33 = *(void **)(v30 + 16);
            if ((objc_msgSend(v33, sel_setReason_forRequestWithKey_, 0, v31) & 1) != 0)
            {
              swift_unknownObjectRelease();
              swift_release();
              (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v32, v38);
            }
            else
            {
              v34 = sub_1D81E7334(v23, v32, v31);
              objc_msgSend(v33, sel_loadResourceWithRequest_reason_, v34, 0);

              swift_unknownObjectRelease();
              swift_release();
              (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v38);
            }
            (*(void (**)(char *, uint64_t))(v12 + 8))(v29, v11);
          }
          a1 = v44;
          v22 = v42;
        }
        goto LABEL_6;
      }
      v27 = sub_1D8215A3C();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 = v44;
      if ((v27 & 1) != 0)
        goto LABEL_22;
LABEL_18:
      if (*(double *)(v23 + 32) > 0.0 && *(double *)(v23 + 40) > 0.0)
        goto LABEL_22;
      swift_release();
LABEL_6:
      if (v46 == ++v21)
        return swift_bridgeObjectRelease();
    }
    sub_1D81D8B6C((uint64_t)v10, &qword_1EDA1BFE8);
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall ArtworkLoader.imageRequest(_:didLoad:)(ASKImageRequest *_, UIImage_optional didLoad)
{
  sub_1D81E49D0(_, didLoad.value.super.isa, 0);
}

void ArtworkLoader.imageRequest(_:didFailWithError:)(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15[3];
  uint64_t v16;

  v4 = sub_1D8215658();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDA1BBE8 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_1EDA1D670);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
  sub_1D8215580();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8218A50;
  sub_1D8215550();
  v9 = objc_msgSend(a1, sel_urlRequest);
  v16 = sub_1D82152F8();
  __swift_allocate_boxed_opaque_existential_0(v15);
  sub_1D82152C8();

  sub_1D8215568();
  sub_1D81D8B6C((uint64_t)v15, &qword_1EDA1C290);
  sub_1D8215550();
  swift_getErrorValue();
  v10 = v13[2];
  v11 = v14;
  v16 = v14;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_0, v10, v11);
  sub_1D8215568();
  sub_1D81D8B6C((uint64_t)v15, &qword_1EDA1C290);
  sub_1D821561C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1D81E49D0(a1, 0, a2);
}

uint64_t ArtworkLoader.isOccluded.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t (*ArtworkLoader.isOccluded.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D820403C;
}

uint64_t sub_1D820403C(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_1D81D6E4C();
  return result;
}

Swift::Void __swiftcall ArtworkLoader.discardInMemoryCache()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1D82154A8();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D82154C0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = *(_QWORD *)(v1 + 24);
  aBlock[4] = sub_1D820554C;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D81D7A68;
  aBlock[3] = &block_descriptor_24;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_1D82154B4();
  v12[1] = MEMORY[0x1E0DEE9D8];
  sub_1D81E802C(&qword_1EDA1C188, v3, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C1D8);
  sub_1D81E806C(&qword_1EDA1C1E0, &qword_1EDA1C1D8);
  sub_1D8215910();
  MEMORY[0x1D82AA154](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
}

id sub_1D8204238(uint64_t a1)
{
  uint64_t v2;

  if (qword_1EDA1BBE8 != -1)
    swift_once();
  v2 = sub_1D8215658();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EDA1D670);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
  sub_1D8215580();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8218310;
  sub_1D8215550();
  sub_1D8215604();
  swift_bridgeObjectRelease();
  return objc_msgSend(*(id *)(a1 + 16), sel_removeAllCachedResources);
}

uint64_t ArtworkLoader.isFetchingAssets.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isIdle) ^ 1;
}

uint64_t ArtworkLoader.isFetchingOnScreenAssets.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isIdleForReason_, 2) ^ 1;
}

uint64_t ArtworkLoader.assetObserver.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x1D82AAB98](v0 + 72);
}

uint64_t ArtworkLoader.assetObserver.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 80) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*ArtworkLoader.assetObserver.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x1D82AAB98](v1 + 72);
  v5 = *(_QWORD *)(v1 + 80);
  v3[3] = v4;
  v3[4] = v5;
  return sub_1D820449C;
}

uint64_t ArtworkLoader.pageRenderMetrics.getter()
{
  swift_beginAccess();
  return swift_weakLoadStrong();
}

void (*ArtworkLoader.pageRenderMetrics.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = swift_weakLoadStrong();
  return sub_1D8204548;
}

void sub_1D8204548(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_weakAssign();
  if ((a2 & 1) != 0)
  {
    swift_release();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_release();
    if (qword_1EDA1BBE8 != -1)
      swift_once();
    v4 = v3[4];
    v5 = sub_1D8215658();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EDA1D670);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C270);
    sub_1D8215580();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8218310;
    sub_1D8215550();
    sub_1D8215610();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    *(_QWORD *)(v4 + 96) = MEMORY[0x1E0DEE9E8];
    swift_bridgeObjectRelease();
  }
  free(v3);
}

uint64_t sub_1D82046B8()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x1D82AAB98](v0 + 72);
}

uint64_t (*sub_1D82046FC(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x1D82AAB98](v1 + 72);
  v5 = *(_QWORD *)(v1 + 80);
  v3[3] = v4;
  v3[4] = v5;
  return sub_1D820449C;
}

void sub_1D8204768(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 80) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_1D82047D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1D821549C();
  *a1 = result;
  return result;
}

uint64_t sub_1D8204800(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 == 2)
    return swift_bridgeObjectRelease();
  if (a3 <= 1u)
    return swift_release();
  return result;
}

unint64_t sub_1D8204828(uint64_t a1)
{
  uint64_t v2;

  sub_1D82156D0();
  sub_1D8215AB4();
  sub_1D821570C();
  v2 = sub_1D8215AE4();
  swift_bridgeObjectRelease();
  return sub_1D82048A8(a1, v2);
}

unint64_t sub_1D82048A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_1D82156D0();
    v8 = v7;
    if (v6 == sub_1D82156D0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1D8215A3C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_1D82156D0();
          v15 = v14;
          if (v13 == sub_1D82156D0() && v15 == v16)
            break;
          v18 = sub_1D8215A3C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1D8204A1C(unint64_t result, uint64_t a2)
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
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  __int128 *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1D821591C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1D81E6140(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_1D8215928();
        result = sub_1D81E610C((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = v19 + 24 * v3;
            v21 = (__int128 *)(v19 + 24 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= (unint64_t)v21 + 24))
            {
              v9 = *v21;
              *(_QWORD *)(v20 + 16) = *((_QWORD *)v21 + 2);
              *(_OWORD *)v20 = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_1D8204BF8()
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C518);
  v2 = *v0;
  v3 = sub_1D82159D0();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1D8204DA4()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF60);
  v2 = *v0;
  v3 = sub_1D82159D0();
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
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_26;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
        break;
    }
LABEL_25:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 24 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v21 = *v19;
    v20 = v19[1];
    v22 = v19[2];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v23 = v21;
    v23[1] = v20;
    v23[2] = v22;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v13)
    goto LABEL_26;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1D8204F74()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  _OWORD v28[2];
  uint64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF68);
  v2 = *v0;
  v3 = sub_1D82159D0();
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
    v16 = 40 * v15;
    sub_1D81E6140(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v28);
    v17 = 24 * v15;
    v18 = *(_QWORD *)(v2 + 56) + 24 * v15;
    v19 = *(_QWORD *)(v18 + 16);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    v21 = *(_OWORD *)v18;
    v22 = v29;
    v23 = v28[1];
    *(_OWORD *)v20 = v28[0];
    *(_OWORD *)(v20 + 16) = v23;
    *(_QWORD *)(v20 + 32) = v22;
    v24 = *(_QWORD *)(v4 + 56) + v17;
    *(_OWORD *)v24 = v21;
    *(_QWORD *)(v24 + 16) = v19;
    swift_unknownObjectRetain();
    result = (void *)swift_retain();
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

void *sub_1D820516C()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BCA0);
  v2 = *v0;
  v3 = sub_1D821594C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1D8205300(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1D8205324()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1D8205360()
{
  uint64_t *v0;

  sub_1D820348C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1D820536C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D8205390(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BF58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D82053D8()
{
  uint64_t v0;

  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  if (*(_QWORD *)(v0 + 72))
    __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

unint64_t sub_1D8205424()
{
  unint64_t result;

  result = qword_1F0167F78;
  if (!qword_1F0167F78)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for ArtworkLoader.FetchError, &type metadata for ArtworkLoader.FetchError);
    atomic_store(result, (unint64_t *)&qword_1F0167F78);
  }
  return result;
}

uint64_t sub_1D8205468()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D8205494()
{
  uint64_t v0;

  return sub_1D8203808(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1D820549C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D82054C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_1D8205520()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

id sub_1D820554C()
{
  uint64_t v0;

  return sub_1D8204238(v0);
}

uint64_t sub_1D8205558()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1D8205564@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 64);
  return result;
}

uint64_t sub_1D82055A8(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_BYTE *)(v3 + 64) = v2;
  return sub_1D81D6E4C();
}

uint64_t sub_1D82055EC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 72;
  swift_beginAccess();
  result = MEMORY[0x1D82AAB98](v4);
  v6 = *(_QWORD *)(v3 + 80);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1D8205644(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 80) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1D820569C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_1D82056E8()
{
  swift_retain();
  sub_1D81D8BCC();
  return swift_release();
}

uint64_t method lookup function for ArtworkLoader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArtworkLoader.__allocating_init(parent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ArtworkLoader.__allocating_init(queue:cacheLimit:renderIntent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_1D8205738(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 == 2)
    return swift_bridgeObjectRetain();
  if (a3 <= 1u)
    return swift_retain();
  return result;
}

uint64_t destroy for ArtworkLoader.FetchError(uint64_t a1)
{
  return sub_1D8204800(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s11AppStoreKit13ArtworkLoaderC10FetchErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D8205738(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ArtworkLoader.FetchError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D8205738(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1D8204800(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ArtworkLoader.FetchError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1D8204800(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArtworkLoader.FetchError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtworkLoader.FetchError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1D82058F0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1D82058F8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArtworkLoader.FetchError()
{
  return &type metadata for ArtworkLoader.FetchError;
}

uint64_t sub_1D8205910()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D8205934()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1D8205974()
{
  uint64_t v0;

  sub_1D8203584(*(void (**)(_QWORD, _QWORD, _QWORD *, void *))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), 1);
}

void sub_1D8205998()
{
  uint64_t v0;

  sub_1D8203584(*(void (**)(_QWORD, _QWORD, _QWORD *, void *))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), 0);
}

uint64_t sub_1D82059B8()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 56))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D82059FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1D8205A44(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t objectdestroy_72Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D8205A94()
{
  uint64_t *v0;

  return sub_1D8203384(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t objectdestroy_50Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

UIColor __swiftcall UIColor.init(light:dark:)(UIColor light, UIColor dark)
{
  objc_class *v3;
  objc_class *v4;

  v3 = light.super.isa;
  v4 = dark.super.isa;
  return (UIColor)sub_1D8215880();
}

id sub_1D8205BCC()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___AMPLanguageAwareTextStorage_textStorage);
  swift_beginAccess();
  return *v1;
}

void sub_1D8205C6C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___AMPLanguageAwareTextStorage_textStorage);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id LanguageAwareTextStorage.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  objc_class *v2;
  char *v4;
  char *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id v11;
  objc_super v13;

  v2 = v1;
  v4 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v4[OBJC_IVAR___AMPLanguageAwareTextStorage_textStorage] = a1;
  v5 = v4;
  v6 = a1;
  v7 = objc_msgSend(v6, sel_delegate);
  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareTextStorage_originalTextStorageDelegate] = v7;
  swift_beginAccess();
  v8 = byte_1F0167E21;
  objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
  v9 = v6;
  v10 = sub_1D81F5508(v9, v8);

  *(_QWORD *)&v5[OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString] = v10;
  v13.receiver = v5;
  v13.super_class = v2;
  v11 = objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend(v9, sel_setDelegate_, v11);

  return v11;
}

id LanguageAwareTextStorage.init(_:)(void *a1)
{
  char *v1;
  void *v2;
  char *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v2 = a1;
  *(_QWORD *)&v1[OBJC_IVAR___AMPLanguageAwareTextStorage_textStorage] = a1;
  v3 = v1;
  v4 = v2;
  v5 = objc_msgSend(v4, sel_delegate);
  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareTextStorage_originalTextStorageDelegate] = v5;
  swift_beginAccess();
  LOBYTE(v2) = byte_1F0167E21;
  objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
  v6 = v4;
  v7 = sub_1D81F5508(v6, (char)v2);

  *(_QWORD *)&v3[OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString] = v7;
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for LanguageAwareTextStorage();
  v8 = objc_msgSendSuper2(&v10, sel_init);
  objc_msgSend(v6, sel_setDelegate_, v8);

  return v8;
}

id sub_1D8205F10(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  id v11;

  v6 = *(void **)(v5 + OBJC_IVAR___AMPLanguageAwareTextStorage_originalTextStorageDelegate);
  if (v6)
  {
    v11 = result;
    result = objc_msgSend(v6, sel_respondsToSelector_, sel_textStorage_willProcessEditing_range_changeInLength_);
    if ((result & 1) != 0)
      return objc_msgSend(v6, sel_textStorage_willProcessEditing_range_changeInLength_, v11, a2, a3, a4, a5);
  }
  return result;
}

void sub_1D8206058(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  char v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v6 = v5;
  v10 = a2;
  if ((a2 & 2) != 0)
  {
    swift_beginAccess();
    v12 = byte_1F0167E21;
    objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    v13 = a1;
    v14 = sub_1D81F5508(v13, v12);

    v15 = *(void **)(v6 + OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString);
    *(_QWORD *)(v6 + OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString) = v14;

    v10 |= 1uLL;
  }
  v16 = *(void **)(v6 + OBJC_IVAR___AMPLanguageAwareTextStorage_originalTextStorageDelegate);
  if (v16)
  {
    if ((objc_msgSend(v16, sel_respondsToSelector_, sel_textStorage_didProcessEditing_range_changeInLength_) & 1) != 0)objc_msgSend(v16, sel_textStorage_didProcessEditing_range_changeInLength_, a1, v10, a3, a4, a5);
  }
}

id sub_1D82061E0()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0 + OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString)
                           + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections));
}

uint64_t sub_1D8206218(uint64_t a1, void *a2, void *a3, char a4, double a5)
{
  uint64_t v5;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v11 = *(id *)(v5 + OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString);
  sub_1D81F393C(a1, a2, a3, a4, a5);
  v13 = v12;

  return v13;
}

id LanguageAwareTextStorage.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LanguageAwareTextStorage.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LanguageAwareTextStorage.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageAwareTextStorage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LanguageAwareTextStorage()
{
  return objc_opt_self();
}

id sub_1D8206430@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___AMPLanguageAwareTextStorage_textStorage);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for LanguageAwareTextStorage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LanguageAwareTextStorage.textStorage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of LanguageAwareTextStorage.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of LanguageAwareTextStorage.textStorage(_:willProcessEditing:range:changeInLength:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LanguageAwareTextStorage.textStorage(_:didProcessEditing:range:changeInLength:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of LanguageAwareTextStorage.writingDirectionsQuantities()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of LanguageAwareTextStorage.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

BOOL sub_1D8206524(double a1)
{
  return CornerStylable<>.applyCorner(radius:style:)(a1);
}

BOOL CornerStylable<>.applyCorner(radius:style:)(double a1)
{
  void *v1;

  return CornerStyle.apply(withRadius:to:)(v1, a1);
}

id DynamicTypeButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id DynamicTypeButton.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  uint64_t v10;
  objc_super v12;

  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory] = 0;
  v9 = &v4[OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase];
  v10 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for DynamicTypeButton();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, a1, a2, a3, a4);
}

id DynamicTypeButton.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void DynamicTypeButton.init(coder:)()
{
  char *v0;
  char *v1;
  uint64_t v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCaseContentSizeCategory] = 0;
  v1 = &v0[OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase];
  v2 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);

  sub_1D82159B8();
  __break(1u);
}

double sub_1D8206804(double a1, double a2)
{
  void *v2;
  double v5;
  double v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for DynamicTypeButton();
  objc_msgSendSuper2(&v10, sel_sizeThatFits_, a1, a2);
  v6 = v5;
  v7 = objc_msgSend(v2, sel_titleLabel);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_measurementsWithFitting_in_, v2, a1, a2);

  }
  return v6;
}

uint64_t sub_1D82068B8(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D81D9CD8(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x118))(v6);
}

void (*sub_1D820694C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180) - 8) + 64);
  v3[10] = malloc(v4);
  v3[11] = malloc(v4);
  v5 = malloc(v4);
  v6 = OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase;
  v3[12] = v5;
  v3[13] = v6;
  v7 = v1 + v6;
  swift_beginAccess();
  sub_1D81D9CD8(v7, (uint64_t)v5);
  return sub_1D82069F8;
}

void sub_1D82069F8(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 96);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 104);
  v5 = *(void **)(*(_QWORD *)a1 + 80);
  v6 = *(void **)(*(_QWORD *)a1 + 88);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 72) + v3;
  if ((a2 & 1) != 0)
  {
    sub_1D81D9CD8(*(_QWORD *)(*(_QWORD *)a1 + 96), (uint64_t)v6);
    sub_1D81D9CD8(v7, (uint64_t)v5);
    swift_beginAccess();
    sub_1D81D9920((uint64_t)v6, v7);
    swift_endAccess();
    sub_1D81D9968((uint64_t)v5);
    sub_1D81D8B6C((uint64_t)v6, &qword_1EDA1C180);
    v8 = (uint64_t)v5;
    v9 = (uint64_t)v4;
  }
  else
  {
    sub_1D81D9CD8(*(_QWORD *)(*(_QWORD *)a1 + 72) + v3, (uint64_t)v6);
    swift_beginAccess();
    sub_1D81D9920((uint64_t)v4, v7);
    swift_endAccess();
    sub_1D81D9968((uint64_t)v6);
    v8 = (uint64_t)v4;
    v9 = (uint64_t)v6;
  }
  sub_1D81D8B6C(v8, &qword_1EDA1C180);
  sub_1D81D8B6C(v9, &qword_1EDA1C180);
  free(v4);
  free(v6);
  free(v5);
  free(v2);
}

uint64_t sub_1D8206B28()
{
  uint64_t v0;

  return sub_1D81D8B6C(v0 + OBJC_IVAR____TtC11AppStoreKit17DynamicTypeButton_fontUseCase, &qword_1EDA1C180);
}

id DynamicTypeButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D8206B94(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x110))();
}

uint64_t sub_1D8206BD0()
{
  return type metadata accessor for DynamicTypeButton();
}

uint64_t method lookup function for DynamicTypeButton()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DynamicTypeButton.traitCollectionForFontUseCases.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DynamicTypeButton.updateFont(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of DynamicTypeButton.fontUseCase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of DynamicTypeButton.fontUseCase.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

BOOL static WordmarkView.Alignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WordmarkView.Alignment.hash(into:)()
{
  return sub_1D8215AC0();
}

uint64_t WordmarkView.Alignment.hashValue.getter()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

char *WordmarkView.__allocating_init(frame:wordmark:referenceLineHeight:alignment:)(_BYTE *a1, uint64_t a2, _BYTE *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;

  v15 = *(_QWORD *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 32);
  v17 = __swift_mutable_project_boxed_opaque_existential_1(a2, v15);
  v18 = sub_1D82084F4(a1, v17, a3, a4, a5, a6, a7, v7, v15, v16);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v18;
}

char *WordmarkView.init(frame:wordmark:referenceLineHeight:alignment:)(_BYTE *a1, uint64_t a2, _BYTE *a3, double a4, double a5, double a6, double a7)
{
  char *v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;

  v15 = *(_QWORD *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 32);
  v17 = __swift_mutable_project_boxed_opaque_existential_1(a2, v15);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v19);
  v21 = sub_1D8208214(a1, (uint64_t)v19, a3, v7, v15, v16, a4, a5, a6, a7);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v21;
}

id WordmarkView.show(wordmark:with:)(uint64_t a1, void *a2)
{
  char *v2;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)&v2[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView];
  if (qword_1EDA1BB38 != -1)
    swift_once();
  v5 = (id)qword_1EDA1D668;
  v6 = a2;
  v7 = (void *)sub_1D82156AC();
  v8 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v7, v5, v6);

  objc_msgSend(v4, sel_setImage_, v8);
  return objc_msgSend(v2, sel_setNeedsLayout);
}

id WordmarkView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *WordmarkView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v8;
  char *v9;

  v8 = (char *)objc_allocWithZone((Class)swift_getObjectType());
  v9 = sub_1D8207F44(1, 0, v8, a1, a2, a3, a4, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

id WordmarkView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void WordmarkView.init(coder:)()
{
  char *v0;
  uint64_t v1;

  v1 = OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  sub_1D82159B8();
  __break(1u);
}

uint64_t WordmarkView.referenceLineHeight.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight;
  swift_beginAccess();
  return sub_1D81FA400(v3, a1);
}

uint64_t sub_1D8207290(uint64_t a1, void **a2)
{
  char *v3;
  uint64_t *v4;
  uint64_t v6[5];

  sub_1D81FA400(a1, (uint64_t)v6);
  v3 = (char *)*a2;
  v4 = (uint64_t *)&v3[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight];
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(v4, v6);
  swift_endAccess();
  objc_msgSend(v3, sel_setNeedsLayout);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t WordmarkView.referenceLineHeight.setter(uint64_t *a1)
{
  char *v1;
  uint64_t *v3;

  v3 = (uint64_t *)&v1[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight];
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(v3, a1);
  swift_endAccess();
  objc_msgSend(v1, sel_setNeedsLayout);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t (*WordmarkView.referenceLineHeight.modify(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D82073CC;
}

uint64_t WordmarkView.alignment.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

id WordmarkView.alignment.setter(char *a1)
{
  char *v1;
  char v2;
  char *v3;

  v2 = *a1;
  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment];
  swift_beginAccess();
  *v3 = v2;
  return objc_msgSend(v1, sel_setNeedsLayout);
}

uint64_t (*WordmarkView.alignment.modify(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D82073CC;
}

id sub_1D82074C4(uint64_t a1, char a2)
{
  id result;

  result = (id)swift_endAccess();
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 24), sel_setNeedsLayout);
  return result;
}

BOOL WordmarkView.hasContent.getter()
{
  uint64_t v0;
  id v1;
  id v2;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView), sel_image);
  v2 = v1;
  if (v1)

  return v2 != 0;
}

Swift::Void __swiftcall WordmarkView.layoutSubviews()()
{
  char *v0;
  void *v1;
  id v2;
  unsigned __int8 *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned __int8 v12;
  objc_super v13;

  v13.receiver = v0;
  v13.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v13, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView];
  v2 = objc_msgSend(v1, sel_image);
  v3 = (unsigned __int8 *)&v0[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment];
  swift_beginAccess();
  v12 = *v3;
  objc_msgSend(v0, sel_frame);
  objc_msgSend(v0, sel_layoutMargins);
  sub_1D8215844();
  sub_1D82076CC(v2, &v12);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
}

void sub_1D82076CC(void *a1, unsigned __int8 *a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];

  v5 = sub_1D8215A18();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D821543C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a2;
  if (a1)
  {
    v16 = v11;
    v17 = v14;
    objc_msgSend(a1, sel_size);
    _sSo6CGSizeV11AppStoreKitE11aspectRatio5JetUI06AspectF0Vvg_0();
    v15 = v2 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight;
    swift_beginAccess();
    sub_1D81FA400(v15, (uint64_t)v18);
    __swift_project_boxed_opaque_existential_1(v18, v18[3]);
    sub_1D8215424();
    sub_1D8215460();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    sub_1D8215430();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v16);
    v14 = v17;
  }
  __asm { BR              X9 }
}

uint64_t sub_1D8207870()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;
  CGRect v6;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  CGRectGetMinX(v5);
  v6.origin.x = v3;
  v6.origin.y = v2;
  v6.size.width = v1;
  v6.size.height = v0;
  CGRectGetMinY(v6);
  return sub_1D8215850();
}

CGSize __swiftcall WordmarkView.sizeThatFits(_:)(CGSize a1)
{
  uint64_t v1;
  double height;
  double width;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];

  height = a1.height;
  width = a1.width;
  v4 = sub_1D8215A18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D821543C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                              + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView), sel_image));
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_size);
    _sSo6CGSizeV11AppStoreKitE11aspectRatio5JetUI06AspectF0Vvg_0();
    v24 = v8;
    v14 = v4;
    v15 = v1 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight;
    swift_beginAccess();
    sub_1D81FA400(v15, (uint64_t)v25);
    __swift_project_boxed_opaque_existential_1(v25, v25[3]);
    sub_1D8215424();
    sub_1D8215460();
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    sub_1D8215430();
    v19 = v18;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);

    if (v19 <= width)
      width = v19;
  }
  else
  {
    v17 = 0.0;
    width = fmin(width, 0.0);
  }
  if (v17 <= height)
    v20 = v17;
  else
    v20 = height;
  v21 = width;
  result.height = v20;
  result.width = v21;
  return result;
}

double WordmarkView.intrinsicContentSize.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];

  v1 = sub_1D8215A18();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D821543C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView), sel_image);
  if (!v9)
    return 0.0;
  v10 = v9;
  objc_msgSend(v9, sel_size);
  _sSo6CGSizeV11AppStoreKitE11aspectRatio5JetUI06AspectF0Vvg_0();
  v16 = v5;
  v11 = v0 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight;
  swift_beginAccess();
  sub_1D81FA400(v11, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_1D8215424();
  sub_1D8215460();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  sub_1D8215430();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v16);

  return v13;
}

Swift::Void __swiftcall WordmarkView.updateAlignment(toMatch:)(NSTextAlignment toMatch)
{
  char *v1;
  char *v2;
  char *v3;
  char v4;
  char *v5;

  switch(toMatch)
  {
    case NSTextAlignmentLeft:
      v3 = &v1[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment];
      swift_beginAccess();
      v4 = 3;
      goto LABEL_6;
    case NSTextAlignmentCenter:
      v5 = &v1[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment];
      swift_beginAccess();
      *v5 = 1;
      goto LABEL_7;
    case NSTextAlignmentRight:
      v3 = &v1[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment];
      swift_beginAccess();
      v4 = 4;
LABEL_6:
      *v3 = v4;
      goto LABEL_7;
    case NSTextAlignmentJustified:
    case NSTextAlignmentNatural:
      v2 = &v1[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment];
      swift_beginAccess();
      *v2 = 0;
LABEL_7:
      objc_msgSend(v1, sel_setNeedsLayout);
      break;
    default:
      return;
  }
}

id WordmarkView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1D8207F44(char a1, char a2, char *a3, double a4, double a5, double a6, double a7, double a8)
{
  objc_class *ObjectType;
  uint64_t v17;
  id v18;
  char *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  char *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  objc_super v36;
  _QWORD v37[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v37[3] = MEMORY[0x1E0DEB070];
  v37[4] = MEMORY[0x1E0D425E8];
  *(double *)v37 = a8;
  v17 = OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView;
  v18 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v19 = a3;
  *(_QWORD *)&a3[v17] = objc_msgSend(v18, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1D81FA400((uint64_t)v37, (uint64_t)&v19[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight]);
  v19[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment] = a2;

  v36.receiver = v19;
  v36.super_class = ObjectType;
  v20 = objc_msgSendSuper2(&v36, sel_initWithFrame_, a4, a5, a6, a7);
  v21 = *MEMORY[0x1E0DC49E8];
  v22 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v23 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v24 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v25 = v20;
  objc_msgSend(v25, sel_setLayoutMargins_, v21, v22, v23, v24);
  v26 = (void *)objc_opt_self();
  v27 = (char *)v25;
  v28 = objc_msgSend(v26, sel_labelColor);
  objc_msgSend(v27, sel_setTintColor_, v28);

  v29 = *(void **)&v27[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView];
  objc_msgSend(v27, sel_addSubview_, v29);
  if ((a1 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);

  }
  else
  {
    v30 = objc_msgSend(v27, sel_traitCollection);
    if (qword_1EDA1BB38 != -1)
      swift_once();
    v31 = (id)qword_1EDA1D668;
    v32 = v30;
    v33 = (void *)sub_1D82156AC();
    v34 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v33, v31, v32);

    objc_msgSend(v29, sel_setImage_, v34);
    objc_msgSend(v27, sel_setNeedsLayout);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  }
  return v27;
}

char *sub_1D8208214(_BYTE *a1, uint64_t a2, _BYTE *a3, char *a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  objc_class *ObjectType;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v22;
  id v23;
  char *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  char *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  objc_super v41;
  uint64_t v42[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v42[3] = a5;
  v42[4] = a6;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v42);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_0, a2, a5);
  LOBYTE(a2) = *a1;
  LOBYTE(a1) = *a3;
  v22 = OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView;
  v23 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v24 = a4;
  *(_QWORD *)&a4[v22] = objc_msgSend(v23, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1D81FA400((uint64_t)v42, (uint64_t)&v24[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight]);
  v24[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment] = (char)a1;

  v41.receiver = v24;
  v41.super_class = ObjectType;
  v25 = objc_msgSendSuper2(&v41, sel_initWithFrame_, a7, a8, a9, a10);
  v26 = *MEMORY[0x1E0DC49E8];
  v27 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v28 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v29 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v30 = v25;
  objc_msgSend(v30, sel_setLayoutMargins_, v26, v27, v28, v29);
  v31 = (void *)objc_opt_self();
  v32 = (char *)v30;
  v33 = objc_msgSend(v31, sel_labelColor);
  objc_msgSend(v32, sel_setTintColor_, v33);

  v34 = *(void **)&v32[OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView];
  objc_msgSend(v32, sel_addSubview_, v34);
  if ((a2 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);

  }
  else
  {
    v35 = objc_msgSend(v32, sel_traitCollection);
    if (qword_1EDA1BB38 != -1)
      swift_once();
    v36 = (id)qword_1EDA1D668;
    v37 = v35;
    v38 = (void *)sub_1D82156AC();
    v39 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v38, v36, v37);

    objc_msgSend(v34, sel_setImage_, v39);
    objc_msgSend(v32, sel_setNeedsLayout);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  return v32;
}

char *sub_1D82084F4(_BYTE *a1, uint64_t a2, _BYTE *a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v19;
  uint64_t v20;
  char *v21;
  Class v22;
  char *v23;
  uint64_t v25;

  v19 = *(_QWORD *)(a9 - 8);
  MEMORY[0x1E0C80A78](a1);
  v21 = (char *)&v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (char *)objc_allocWithZone(v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a2, a9);
  return sub_1D8208214(a1, (uint64_t)v21, a3, v23, a9, a10, a4, a5, a6, a7);
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

unint64_t sub_1D8208740()
{
  unint64_t result;

  result = qword_1F01680F8;
  if (!qword_1F01680F8)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for WordmarkView.Alignment, &type metadata for WordmarkView.Alignment);
    atomic_store(result, (unint64_t *)&qword_1F01680F8);
  }
  return result;
}

uint64_t sub_1D8208784@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight;
  swift_beginAccess();
  return sub_1D81FA400(v3, a2);
}

uint64_t sub_1D82087DC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

id sub_1D820882C(char *a1, void **a2)
{
  char v2;
  void *v3;
  _BYTE *v4;

  v2 = *a1;
  v3 = *a2;
  v4 = (char *)*a2 + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_alignment;
  swift_beginAccess();
  *v4 = v2;
  return objc_msgSend(v3, sel_setNeedsLayout);
}

uint64_t type metadata accessor for WordmarkView()
{
  return objc_opt_self();
}

uint64_t method lookup function for WordmarkView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WordmarkView.__allocating_init(frame:wordmark:referenceLineHeight:alignment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t getEnumTagSinglePayload for WordmarkView.Alignment(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WordmarkView.Alignment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D82089A0 + 4 * byte_1D821905F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1D82089D4 + 4 * byte_1D821905A[v4]))();
}

uint64_t sub_1D82089D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D82089DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D82089E4);
  return result;
}

uint64_t sub_1D82089F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D82089F8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1D82089FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D8208A04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WordmarkView.Alignment()
{
  return &type metadata for WordmarkView.Alignment;
}

UIImage_optional __swiftcall Wordmark.asset(in:)(UITraitCollection in)
{
  id v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  Swift::Bool v6;
  objc_class *v7;
  UIImage_optional result;

  if (qword_1EDA1BB38 != -1)
    swift_once();
  v2 = (id)qword_1EDA1D668;
  v3 = in.super.isa;
  v4 = (void *)sub_1D82156AC();
  v5 = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v4, v2, v3);

  v7 = v5;
  result.value.super.isa = v7;
  result.is_nil = v6;
  return result;
}

unint64_t Wordmark.assetName.getter()
{
  return 0xD000000000000012;
}

uint64_t static Wordmark.== infix(_:_:)()
{
  return 1;
}

uint64_t Wordmark.hash(into:)()
{
  return sub_1D8215AC0();
}

uint64_t Wordmark.hashValue.getter()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

uint64_t sub_1D8208B6C()
{
  return 1;
}

uint64_t sub_1D8208B74()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

uint64_t sub_1D8208BB4()
{
  return sub_1D8215AC0();
}

uint64_t sub_1D8208BD8()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

unint64_t sub_1D8208C18()
{
  unint64_t result;

  result = qword_1F0168100;
  if (!qword_1F0168100)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Wordmark, &type metadata for Wordmark);
    atomic_store(result, (unint64_t *)&qword_1F0168100);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Wordmark(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Wordmark(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1D8208CF0 + 4 * byte_1D8219120[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1D8208D10 + 4 * byte_1D8219125[v4]))();
}

_BYTE *sub_1D8208CF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1D8208D10(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D8208D18(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D8208D20(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D8208D28(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D8208D30(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1D8208D3C()
{
  return 0;
}

ValueMetadata *type metadata accessor for Wordmark()
{
  return &type metadata for Wordmark;
}

void static Artwork.Crop.boundingBox.getter(_QWORD *a1@<X8>)
{
  *a1 = 25186;
  a1[1] = 0xE200000000000000;
}

uint64_t Artwork.Crop.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void static Artwork.Crop.specificRectangle.getter(_QWORD *a1@<X8>)
{
  *a1 = 29299;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.sourceSize.getter(_QWORD *a1@<X8>)
{
  *a1 = 29555;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.squareCenterCrop.getter(_QWORD *a1@<X8>)
{
  *a1 = 25443;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.fa.getter(_QWORD *a1@<X8>)
{
  *a1 = 24934;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.fm.getter(_QWORD *a1@<X8>)
{
  *a1 = 28006;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.fn.getter(_QWORD *a1@<X8>)
{
  *a1 = 28262;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.fo.getter(_QWORD *a1@<X8>)
{
  *a1 = 28518;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.em.getter(_QWORD *a1@<X8>)
{
  *a1 = 28005;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.el.getter(_QWORD *a1@<X8>)
{
  *a1 = 27749;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.ek.getter(_QWORD *a1@<X8>)
{
  *a1 = 27493;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.en.getter(_QWORD *a1@<X8>)
{
  *a1 = 28261;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.ep.getter(_QWORD *a1@<X8>)
{
  *a1 = 28773;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.oa.getter(_QWORD *a1@<X8>)
{
  *a1 = 24943;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.ob.getter(_QWORD *a1@<X8>)
{
  *a1 = 25199;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.ta.getter(_QWORD *a1@<X8>)
{
  *a1 = 24948;
  a1[1] = 0xE200000000000000;
}

void static Artwork.Crop.condensedSearchStory.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "DMGE.AppST01");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void static Artwork.Crop.searchLandingCategoryTile.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "SCB.ApSCBL01");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void static Artwork.Crop.searchLandingCategoryTileRTL.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "SCB.ApSCBL02");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void static Artwork.Crop.searchLandingCategoryPill.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "SCB.ApSCBS01");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void static Artwork.Crop.searchLandingCategoryPillRTL.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "SCB.ApSCBS02");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t Artwork.Crop.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D8208F3C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1D8208F48(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1D8215A3C();
}

unint64_t sub_1D8208F7C()
{
  unint64_t result;

  result = qword_1F0168108;
  if (!qword_1F0168108)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Crop, &type metadata for Artwork.Crop);
    atomic_store(result, (unint64_t *)&qword_1F0168108);
  }
  return result;
}

uint64_t sub_1D8208FC0()
{
  sub_1D8215AB4();
  swift_bridgeObjectRetain();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D8209018()
{
  swift_bridgeObjectRetain();
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D820905C()
{
  sub_1D8215AB4();
  swift_bridgeObjectRetain();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

_QWORD *_s11URLTemplateVwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s11URLTemplateVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *_s11URLTemplateVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void BorderView.borderColor.setter(void *a1)
{
  void *v1;
  id v2;
  id v3;

  v2 = objc_msgSend(v1, sel_layer);
  if (a1)
    v3 = objc_msgSend(a1, sel_CGColor);
  else
    v3 = 0;
  objc_msgSend(v2, sel_setBorderColor_, v3);

}

void BorderView.borderWidth.setter(double a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v3, sel_setBorderWidth_, a1);

}

id BorderView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id BorderView.init(frame:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  id v9;
  objc_super v11;

  v11.receiver = v4;
  v11.super_class = (Class)swift_getObjectType();
  v9 = objc_msgSendSuper2(&v11, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v9, sel_setUserInteractionEnabled_, 0);
  return v9;
}

id BorderView.borderColor.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(v0, sel_layer);
  v2 = objc_msgSend(v1, sel_borderColor);

  if (!v2)
    return 0;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithCGColor_, v2);

  return v3;
}

void sub_1D82093CC(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;
  id v5;

  v3 = objc_msgSend(*a1, sel_layer);
  v4 = objc_msgSend(v3, sel_borderColor);

  if (v4)
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithCGColor_, v4);

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_1D820945C(id *a1, void **a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  v5 = *a1;
  v4 = objc_msgSend(v3, sel_layer);
  if (v2)
    v2 = objc_msgSend(v5, sel_CGColor);
  objc_msgSend(v4, sel_setBorderColor_, v2);

}

void (*BorderView.borderColor.modify(_QWORD *a1))(void **a1, char a2)
{
  void *v1;
  id v3;
  id v4;
  id v5;

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_layer);
  v4 = objc_msgSend(v3, sel_borderColor);

  if (v4)
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithCGColor_, v4);

  }
  else
  {
    v5 = 0;
  }
  *a1 = v5;
  return sub_1D8209588;
}

void sub_1D8209588(void **a1, char a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = *a1;
  v3 = a1[1];
  if ((a2 & 1) != 0)
  {
    v4 = v2;
    v5 = objc_msgSend(v3, sel_layer);
    v8 = v5;
    if (v2)
    {
      v6 = objc_msgSend(v4, sel_CGColor);
      v5 = v8;
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v5, sel_setBorderColor_, v6);

  }
  else
  {
    v7 = objc_msgSend(a1[1], sel_layer);
    v8 = v7;
    if (v2)
    {
      v6 = objc_msgSend(v2, sel_CGColor);
      v7 = v8;
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v7, sel_setBorderColor_, v6);
    v4 = v2;
  }

}

double BorderView.borderWidth.getter()
{
  void *v0;
  id v1;
  double v2;
  double v3;

  v1 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v1, sel_borderWidth);
  v3 = v2;

  return v3;
}

void sub_1D82096DC(double *a1, id *a2)
{
  double v2;
  id v3;

  v2 = *a1;
  v3 = objc_msgSend(*a2, sel_layer);
  objc_msgSend(v3, sel_setBorderWidth_, v2);

}

void (*BorderView.borderWidth.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v3, sel_borderWidth);
  v5 = v4;

  *a1 = v5;
  return sub_1D8209798;
}

void sub_1D8209798(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)a1;
  v2 = objc_msgSend(*(id *)(a1 + 8), sel_layer);
  objc_msgSend(v2, sel_setBorderWidth_, v1);

}

id BorderView.backgroundColor.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_clearColor);
}

void BorderView.backgroundColor.setter(void *a1)
{
  swift_getObjectType();
  sub_1D821597C();
  sub_1D8215AFC();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D8215418();
  swift_bridgeObjectRelease();

}

void (*BorderView.backgroundColor.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  return sub_1D8209994;
}

void sub_1D8209994(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    BorderView.backgroundColor.setter(v2);

  }
  else
  {
    BorderView.backgroundColor.setter(*a1);
  }
}

uint64_t BorderView.clipsToBounds.getter()
{
  return 0;
}

uint64_t (*BorderView.clipsToBounds.modify(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = 0;
  return sub_1D8209A48;
}

uint64_t sub_1D8209A48()
{
  return _s11AppStoreKit10BorderViewC13clipsToBoundsSbvs_0();
}

id BorderView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s11AppStoreKit10BorderViewC13clipsToBoundsSbvs_0()
{
  swift_getObjectType();
  sub_1D821597C();
  sub_1D8215AFC();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D8215418();
  return swift_bridgeObjectRelease();
}

void sub_1D8209B48(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_layer);
  objc_msgSend(v3, sel_borderWidth);
  v5 = v4;

  *a2 = v5;
}

uint64_t sub_1D8209BA4()
{
  sub_1D8215A0C();
  sub_1D8215724();
  return swift_bridgeObjectRelease();
}

uint64_t ArtworkLoaderConfig.__allocating_init(template:size:scale:crop:format:quality:useWideGamut:)(_QWORD *a1, uint64_t *a2, char *a3, uint64_t a4, char a5, char a6, double a7, double a8, double a9)
{
  char v17;
  uint64_t v18;

  v17 = a5 & 1;
  v18 = swift_allocObject();
  ArtworkLoaderConfig.init(template:size:scale:crop:format:quality:useWideGamut:)(a1, a2, a3, a4, v17, a6, a7, a8, a9);
  return v18;
}

uint64_t ArtworkLoaderConfig.template.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t ArtworkLoaderConfig.crop.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 56);
  *a1 = *(_QWORD *)(v1 + 48);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

double ArtworkLoaderConfig.scale.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void ArtworkLoaderConfig.format.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 72);
}

uint64_t ArtworkLoaderConfig.quality.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t ArtworkLoaderConfig.useWideGamut.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 89);
}

uint64_t sub_1D8209CF8()
{
  uint64_t v0;
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v1 = *(double *)(v0 + 32);
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v1 >= 9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v2 = *(double *)(v0 + 40);
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v3 = (uint64_t)v2;
  v4 = (uint64_t)v1 + (uint64_t)v2;
  if (__OFADD__((uint64_t)v1, (uint64_t)v2))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v5 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v6 = v4 * v5;
  if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return result;
  }
  if (v6 >= 0)
    v7 = v4 * v5;
  else
    v7 = v6 + 1;
  result = v3 + (v7 >> 1);
  if (__OFADD__(v3, v7 >> 1))
    goto LABEL_24;
  return result;
}

uint64_t sub_1D8209DC8()
{
  sub_1D82157C0();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D82157C0();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D82157C0();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D82159AC();
  return 0;
}

unint64_t sub_1D8209EB0()
{
  sub_1D8215724();
  sub_1D82159AC();
  sub_1D8215724();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  type metadata accessor for CGSize(0);
  sub_1D82159AC();
  sub_1D8215724();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D82157C0();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D82159AC();
  sub_1D8215724();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D82159AC();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  return 0xD000000000000014;
}

uint64_t sub_1D820A1BC()
{
  sub_1D8209CF8();
  return sub_1D8215AC0();
}

uint64_t ArtworkLoaderConfig.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1D820A208(uint64_t *a1, uint64_t *a2)
{
  return _s11AppStoreKit19ArtworkLoaderConfigC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_1D820A214()
{
  return sub_1D8209CF8();
}

uint64_t sub_1D820A234()
{
  sub_1D8209CF8();
  return sub_1D8215AC0();
}

uint64_t sub_1D820A260()
{
  sub_1D8215AB4();
  sub_1D8209CF8();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

uint64_t sub_1D820A2A0()
{
  return sub_1D8209DC8();
}

unint64_t sub_1D820A2C0()
{
  return sub_1D8209EB0();
}

uint64_t _s11AppStoreKit19ArtworkLoaderConfigC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v5;
  char v7;
  char v8;
  char v9;

  if (*(double *)(a1 + 32) != *(double *)(a2 + 32) || *(double *)(a1 + 40) != *(double *)(a2 + 40))
    goto LABEL_22;
  sub_1D81EFD28(*(_BYTE *)(a1 + 72));
  if ((v5 & 1) == 0)
    goto LABEL_22;
  if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(a2 + 48) || *(_QWORD *)(a1 + 56) != *(_QWORD *)(a2 + 56))
  {
    v7 = sub_1D8215A3C();
    v8 = 0;
    if ((v7 & 1) == 0)
      return v8 & 1;
  }
  if (*(double *)(a1 + 64) != *(double *)(a2 + 64))
  {
LABEL_22:
    v8 = 0;
    return v8 & 1;
  }
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
    || (v9 = sub_1D8215A3C(), v8 = 0, (v9 & 1) != 0))
  {
    v8 = *(_BYTE *)(a2 + 88);
    if ((*(_BYTE *)(a1 + 88) & 1) != 0)
    {
      if (!*(_BYTE *)(a2 + 88))
        return v8 & 1;
      goto LABEL_24;
    }
    if (*(_QWORD *)(a1 + 80) != *(_QWORD *)(a2 + 80))
      v8 = 1;
    if ((v8 & 1) == 0)
    {
LABEL_24:
      v8 = *(_BYTE *)(a1 + 89) ^ *(_BYTE *)(a2 + 89) ^ 1;
      return v8 & 1;
    }
    goto LABEL_22;
  }
  return v8 & 1;
}

unint64_t sub_1D820A3C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F0168110;
  if (!qword_1F0168110)
  {
    v1 = type metadata accessor for ArtworkLoaderConfig();
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for ArtworkLoaderConfig, v1);
    atomic_store(result, (unint64_t *)&qword_1F0168110);
  }
  return result;
}

uint64_t method lookup function for ArtworkLoaderConfig()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArtworkLoaderConfig.__allocating_init(template:size:scale:crop:format:quality:useWideGamut:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v5 + 136))(a1, a2, a3, a4, a5 & 1);
}

uint64_t dispatch thunk of ArtworkLoaderConfig.url.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ArtworkLoaderConfig.cacheKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ArtworkLoaderConfig.isValid.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ArtworkLoaderConfig.hashValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ArtworkLoaderConfig.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ArtworkLoaderConfig.debugDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ArtworkLoaderConfig.hash(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

id static ArtworkView.iconBorderColor.getter()
{
  if (qword_1EDA1C3F8 != -1)
    swift_once();
  return (id)qword_1EDA1C3F0;
}

double static ArtworkView.iconBorderWidth.getter()
{
  return 1.0;
}

id ArtworkView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *static ArtworkView.iapIconArtworkView.getter()
{
  objc_class *v0;
  char *v1;
  char *v2;
  char v3;
  char *v4;
  id v5;
  uint64_t v7;

  v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v2 = &v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style];
  swift_beginAccess();
  v3 = *v2;
  *v2 = 4;
  LOBYTE(v7) = v3;
  sub_1D81DCECC();
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners];
  swift_beginAccess();
  *(_QWORD *)v4 = 2;
  v5 = objc_msgSend(v1, sel_layer, v7);
  objc_msgSend(v5, sel_setMaskedCorners_, 2);

  sub_1D81E05F8();
  sub_1D820A9F0();
  return v1;
}

void ArtworkView.roundedCorners.setter(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  id v5;

  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners];
  swift_beginAccess();
  *(_QWORD *)v3 = a1;
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) != 0)
    {
      v4 = 2;
      if ((a1 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
    v4 = 0;
    if ((a1 & 8) != 0)
    {
LABEL_12:
      v4 |= 8uLL;
      goto LABEL_13;
    }
LABEL_7:
    if ((a1 & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  if ((a1 & 2) == 0)
  {
    v4 = 1;
    if ((a1 & 8) != 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v4 = 3;
  if ((a1 & 8) != 0)
    goto LABEL_12;
LABEL_13:
  if ((a1 & 4) != 0 && (v4 & 4) == 0)
LABEL_15:
    v4 |= 4uLL;
LABEL_16:
  v5 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v5, sel_setMaskedCorners_, v4);

  sub_1D81E05F8();
  sub_1D820A9F0();
}

char *_s11AppStoreKit11ArtworkViewC04carddE0ACvgZ_0()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void **v5;
  void *v6;
  id v7;
  char *v8;
  char *v9;
  char v11[24];

  v1 = objc_msgSend(objc_allocWithZone(v0), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v11[0] = 1;
  ArtworkView.setCorner(radius:style:)(v11, 5.0);
  v2 = qword_1EDA1C3F8;
  v3 = (char *)v1;
  if (v2 != -1)
    swift_once();
  v4 = (void *)qword_1EDA1C3F0;
  v5 = (void **)&v3[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor];
  swift_beginAccess();
  v6 = *v5;
  *v5 = v4;
  v7 = v4;

  sub_1D81E05F8();
  v8 = &v3[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderWidth];
  swift_beginAccess();
  *(_QWORD *)v8 = 0x3FF0000000000000;
  v9 = v3;
  sub_1D81E05F8();

  return v9;
}

id ArtworkView.shadow.getter@<X0>(__int128 *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadow);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return (id)v4;
}

id sub_1D820A84C@<X0>(_QWORD *a1@<X0>, __int128 *a2@<X8>)
{
  __int128 *v3;
  __int128 v4;
  __int128 v5;

  v3 = (__int128 *)(*a1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadow);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return (id)v4;
}

void sub_1D820A8A0(uint64_t a1, _QWORD *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v7;

  v2 = *(void **)a1;
  v7 = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *a2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadow;
  swift_beginAccess();
  v5 = *(void **)v4;
  *(_QWORD *)v4 = v2;
  *(_OWORD *)(v4 + 8) = v7;
  *(_QWORD *)(v4 + 24) = v3;
  v6 = v2;

  sub_1D81DE9E4();
}

void (*ArtworkView.shadow.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D820A96C;
}

void sub_1D820A96C(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1D81DE9E4();
}

id ArtworkView.isImageHidden.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_isHidden);
}

id ArtworkView.image.getter()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image));
}

void sub_1D820A9F0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_roundedCorners);
  swift_beginAccess();
  v2 = *v1;
  if ((*v1 & 1) != 0)
  {
    if ((v2 & 2) != 0)
    {
      v3 = 3;
      if ((v2 & 8) == 0)
      {
LABEL_13:
        if ((v2 & 4) != 0 && (v3 & 4) == 0)
          goto LABEL_15;
        goto LABEL_16;
      }
      goto LABEL_12;
    }
    v3 = 1;
    if ((v2 & 8) != 0)
      goto LABEL_12;
  }
  else
  {
    if ((v2 & 2) != 0)
    {
      v3 = 2;
      if ((v2 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
    v3 = 0;
    if ((v2 & 8) != 0)
    {
LABEL_12:
      v3 |= 8uLL;
      goto LABEL_13;
    }
  }
  if ((v2 & 4) != 0)
LABEL_15:
    v3 |= 4uLL;
LABEL_16:
  v4 = *(void **)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView);
  if (v4)
  {
    v5 = objc_msgSend(v4, sel_layer);
    objc_msgSend(v5, sel_setMaskedCorners_, v3);

  }
  v6 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_layer);
  objc_msgSend(v6, sel_setMaskedCorners_, v3);

  sub_1D81E05F8();
}

void (*ArtworkView.roundedCorners.modify(_QWORD *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_1D81FDE50(v3);
  return sub_1D820AB4C;
}

void sub_1D820AB4C(_QWORD *a1, char a2)
{
  void *v3;

  v3 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  if ((a2 & 1) == 0)
    sub_1D820A9F0();
  free(v3);
}

id ArtworkView.placeholderColor.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_placeholderColor);
  swift_beginAccess();
  return *v1;
}

void ArtworkView.placeholderColor.setter(void *a1)
{
  sub_1D820C0DC(a1);

}

void (*ArtworkView.placeholderColor.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_placeholderColor;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1D820AC4C;
}

void sub_1D820AC4C(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = *(void **)(v4 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView);
    if (v5)
      objc_msgSend(v5, sel_setBackgroundColor_, *(_QWORD *)(v4 + v3[4]));
  }
  free(v3);
}

void *ArtworkView.backgroundColor.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor);
  v2 = v1;
  return v1;
}

void (*ArtworkView.backgroundColor.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  return sub_1D820AD68;
}

void sub_1D820AD68(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    ArtworkView.backgroundColor.setter(v2);

  }
  else
  {
    ArtworkView.backgroundColor.setter(*a1);
  }
}

void (*ArtworkView.frame.modify(objc_super **a1))(objc_super **a1, char a2)
{
  void *v1;
  objc_super *v3;
  uint64_t ObjectType;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;

  v3 = (objc_super *)malloc(0xA0uLL);
  *a1 = v3;
  v3[9].receiver = v1;
  ObjectType = swift_getObjectType();
  v3[9].super_class = (Class)ObjectType;
  v3[2].receiver = v1;
  v3[2].super_class = (Class)ObjectType;
  objc_msgSendSuper2(v3 + 2, sel_frame);
  v3->receiver = v5;
  v3->super_class = v6;
  v3[1].receiver = v7;
  v3[1].super_class = v8;
  return sub_1D820AE5C;
}

void sub_1D820AE5C(objc_super **a1, char a2)
{
  objc_super *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_class *super_class;
  id receiver;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v27;
  objc_super v28;

  v2 = *a1;
  v4 = *(double *)&(*a1)->receiver;
  v3 = *(double *)&(*a1)->super_class;
  v6 = *(double *)&(*a1)[1].receiver;
  v5 = *(double *)&(*a1)[1].super_class;
  receiver = (*a1)[9].receiver;
  super_class = (*a1)[9].super_class;
  if ((a2 & 1) != 0)
  {
    v2[3].receiver = receiver;
    v2[3].super_class = super_class;
    objc_msgSendSuper2(v2 + 3, sel_frame);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v2[4].receiver = receiver;
    v2[4].super_class = super_class;
    objc_msgSendSuper2(v2 + 4, sel_frame);
    if (v18 != v6 || v17 != v5)
      *((_BYTE *)v2[9].receiver + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid) = 1;
    v27 = v2[9];
    v2[5] = v27;
    objc_msgSendSuper2(v2 + 5, sel_setFrame_, v4, v3, v6, v5, v27);
  }
  else
  {
    v2[6].receiver = receiver;
    v2[6].super_class = super_class;
    objc_msgSendSuper2(v2 + 6, sel_frame);
    v10 = v20;
    v12 = v21;
    v14 = v22;
    v16 = v23;
    v2[7].receiver = receiver;
    v2[7].super_class = super_class;
    objc_msgSendSuper2(v2 + 7, sel_frame);
    if (v25 != v6 || v24 != v5)
      *((_BYTE *)v2[9].receiver + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid) = 1;
    v28 = v2[9];
    v2[8] = v28;
    objc_msgSendSuper2(v2 + 8, sel_setFrame_, v4, v3, v6, v5, v28);
  }
  sub_1D81DB83C(v10, v12, v14, v16);
  free(v2);
}

double ArtworkView.imageSize.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize;
  swift_beginAccess();
  return *(double *)v1;
}

void (*ArtworkView.imageSize.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  _OWORD *v5;

  v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize;
  *((_QWORD *)v3 + 5) = v1;
  *((_QWORD *)v3 + 6) = v4;
  v5 = (_OWORD *)(v1 + v4);
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *v5;
  return sub_1D820B084;
}

void sub_1D820B084(uint64_t a1)
{
  _QWORD *v1;
  double v2;
  double *v3;
  double v4;
  double v5;
  double v6;
  _BYTE *v8;

  v1 = *(_QWORD **)a1;
  v2 = *(double *)(*(_QWORD *)a1 + 24);
  v3 = (double *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48));
  v4 = *(double *)(*(_QWORD *)a1 + 32);
  v5 = *v3;
  v6 = v3[1];
  *v3 = v2;
  v3[1] = v4;
  if (v2 != v5 || v4 != v6)
  {
    v8 = (_BYTE *)v1[5];
    v8[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = 1;
    objc_msgSend(v8, sel_setNeedsLayout);
  }
  free(v1);
}

uint64_t ArtworkView.frameUpdatesImageSize.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_frameUpdatesImageSize);
  swift_beginAccess();
  return *v1;
}

id ArtworkView.frameUpdatesImageSize.setter(char a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  id result;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_frameUpdatesImageSize];
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = a1;
  if ((v6 & 1) == 0 && (a1 & 1) != 0)
  {
    v15.receiver = v1;
    v15.super_class = ObjectType;
    objc_msgSendSuper2(&v15, sel_frame);
    v8 = v7;
    v10 = v9;
    v11 = (double *)&v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize];
    swift_beginAccess();
    v12 = *v11;
    v13 = v11[1];
    *v11 = v8;
    v11[1] = v10;
    if (v8 != v12 || v10 != v13)
    {
      v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = 1;
      objc_msgSend(v1, sel_setNeedsLayout);
    }
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void (*ArtworkView.frameUpdatesImageSize.modify(_QWORD *a1))(objc_super **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t ObjectType;
  uint64_t v5;
  _BYTE *v6;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[8] = v1;
  ObjectType = swift_getObjectType();
  v5 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_frameUpdatesImageSize;
  v3[9] = ObjectType;
  v3[10] = v5;
  v6 = (_BYTE *)(v1 + v5);
  swift_beginAccess();
  *((_BYTE *)v3 + 88) = *v6;
  return sub_1D820B294;
}

void sub_1D820B294(objc_super **a1, char a2)
{
  objc_super *v2;
  int super_class_low;
  _BYTE *receiver;
  id v5;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double v13;
  _BYTE *v15;
  objc_super v16;

  v2 = *a1;
  super_class_low = LOBYTE((*a1)[5].super_class);
  if ((a2 & 1) != 0)
  {
    ArtworkView.frameUpdatesImageSize.setter(super_class_low);
  }
  else
  {
    receiver = v2[5].receiver;
    v5 = v2[4].receiver;
    v6 = receiver[(_QWORD)v5];
    receiver[(_QWORD)v5] = super_class_low;
    if ((v6 & 1) == 0 && super_class_low)
    {
      v16 = v2[4];
      v2[3] = v16;
      objc_msgSendSuper2(v2 + 3, sel_frame);
      v8 = v7;
      v10 = v9;
      v11 = (double *)((char *)v16.receiver + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize);
      swift_beginAccess();
      v12 = *v11;
      v13 = v11[1];
      *v11 = v8;
      v11[1] = v10;
      if (v8 != v12 || v10 != v13)
      {
        v15 = v2[4].receiver;
        v15[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid] = 1;
        objc_msgSend(v15, sel_setNeedsLayout);
      }
      objc_msgSend(v2[4].receiver, sel_setNeedsLayout);
    }
  }
  free(v2);
}

uint64_t ArtworkView.clipImageToBounds.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_clipImageToBounds);
  swift_beginAccess();
  return *v1;
}

id ArtworkView.clipImageToBounds.setter(char a1)
{
  char *v1;
  char *v3;

  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit11ArtworkView_clipImageToBounds];
  swift_beginAccess();
  *v3 = a1;
  return objc_msgSend(v1, sel_setNeedsLayout);
}

id (*ArtworkView.clipImageToBounds.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D82074C4;
}

uint64_t ArtworkView.shouldSymbolImageSelfSize.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shouldSymbolImageSelfSize);
  swift_beginAccess();
  return *v1;
}

void sub_1D820B4B8(unsigned __int8 *a1, _QWORD *a2)
{
  int v2;
  _BYTE *v3;
  int v4;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shouldSymbolImageSelfSize);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  if (v2 != v4)
    sub_1D81DE3F8(0);
}

void ArtworkView.shouldSymbolImageSelfSize.setter(char a1)
{
  uint64_t v1;
  int v3;
  _BYTE *v4;
  int v5;

  v3 = a1 & 1;
  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shouldSymbolImageSelfSize);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;
  if (v5 != v3)
    sub_1D81DE3F8(0);
}

void (*ArtworkView.shouldSymbolImageSelfSize.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shouldSymbolImageSelfSize;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return sub_1D820B5F4;
}

void sub_1D820B5F4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + 40);
  v5 = *(unsigned __int8 *)(v3 + v2);
  *(_BYTE *)(v3 + v2) = v4;
  if (v4 != v5)
    sub_1D81DE3F8(0);
  free(v1);
}

uint64_t ArtworkView.setImageDisablesAnimations.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_setImageDisablesAnimations);
  swift_beginAccess();
  return *v1;
}

uint64_t ArtworkView.setImageDisablesAnimations.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_setImageDisablesAnimations);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*ArtworkView.setImageDisablesAnimations.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ArtworkView.style.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

void sub_1D820B754(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style);
  swift_beginAccess();
  *v3 = v2;
  sub_1D81DCECC();
}

void (*ArtworkView.style.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return sub_1D820B85C;
}

void sub_1D820B85C(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)a1 + 24) + *(_QWORD *)(*(_QWORD *)a1 + 32)) = *(_BYTE *)(*(_QWORD *)a1 + 40);
  sub_1D81DCECC();
  free(v1);
}

void *ArtworkView.artworkTintColor.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1D820B904(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;

  v2 = *a1;
  v3 = *a2;
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor);
  swift_beginAccess();
  v5 = (void *)*v4;
  *v4 = v2;
  v6 = v2;

  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setTintColor_, *v4);
}

void ArtworkView.artworkTintColor.setter(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  id v5;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor);
  swift_beginAccess();
  v4 = (void *)*v3;
  *v3 = a1;
  v5 = a1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setTintColor_, *v3);
}

void (*ArtworkView.artworkTintColor.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1D820BA64;
}

void sub_1D820BA64(_QWORD **a1, char a2)
{
  _QWORD *v3;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(v3[3] + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setTintColor_, *(_QWORD *)(v3[3] + v3[4]));
  free(v3);
}

uint64_t ArtworkView.accessibilityIgnoresInvertColors.getter()
{
  return 1;
}

uint64_t (*ArtworkView.accessibilityIgnoresInvertColors.modify(_BYTE *a1))()
{
  *a1 = 1;
  return nullsub_1;
}

id ArtworkView.preferredSymbolConfiguration.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_preferredSymbolConfiguration);
}

void sub_1D820BB08(id *a1, _QWORD *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = *a1;
  v3 = *(void **)(*a2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView);
  v4 = *a1;
  objc_msgSend(v3, sel_setPreferredSymbolConfiguration_, v4);
  sub_1D81DE3F8(v2);

}

void ArtworkView.preferredSymbolConfiguration.setter(void *a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setPreferredSymbolConfiguration_, a1);
  sub_1D81DE3F8(a1);

}

void (*ArtworkView.preferredSymbolConfiguration.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView);
  a1[1] = v1;
  a1[2] = v3;
  *a1 = objc_msgSend(v3, sel_preferredSymbolConfiguration);
  return sub_1D820BC00;
}

void sub_1D820BC00(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 16);
  v5 = *(id *)a1;
  if ((a2 & 1) != 0)
  {
    v3 = v5;
    objc_msgSend(v2, sel_setPreferredSymbolConfiguration_, v3);
    sub_1D81DE3F8(v5);

    v4 = v3;
  }
  else
  {
    objc_msgSend(v2, sel_setPreferredSymbolConfiguration_, v5);
    sub_1D81DE3F8(v5);
    v4 = v5;
  }

}

uint64_t ArtworkView.imageBaselineOffsetFromBottom.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D8215898();

  return v3;
}

id ArtworkView.isDisplayingSymbolImage.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_isSymbolImage);

  return v3;
}

id ArtworkView.isImageHidden.setter(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setHidden_, a1 & 1);
}

id (*ArtworkView.isImageHidden.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v3, sel_isHidden);
  return sub_1D820BDC0;
}

id sub_1D820BDC0(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setHidden_, *(unsigned __int8 *)(a1 + 8));
}

void sub_1D820BDD8(id *a1)
{
  objc_class *v1;
  Swift::Bool v2;
  id v3;
  UIImage_optional v4;

  v1 = (objc_class *)*a1;
  v3 = *a1;
  v4.value.super.isa = v1;
  v4.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v4, v2);

}

void (*ArtworkView.image.modify(_QWORD *a1))(Class *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image);
  return sub_1D820BE68;
}

void sub_1D820BE68(Class *a1, char a2)
{
  Class v2;
  objc_class *v3;
  Swift::Bool v4;
  Class v5;
  Class v6;
  UIImage_optional v7;
  UIImage_optional v8;

  v2 = *a1;
  v6 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v6;
    v7.value.super.isa = v6;
    v7.is_nil = 0;
    ArtworkView.setImage(image:animated:)(v7, v4);

    v5 = v3;
  }
  else
  {
    v8.value.super.isa = *a1;
    v8.is_nil = 0;
    ArtworkView.setImage(image:animated:)(v8, (Swift::Bool)v2);
    v5 = v6;
  }

}

Swift::Void __swiftcall ArtworkView.show(image:isAnimationPermitted:)(UIImage_optional image, Swift::Bool isAnimationPermitted)
{
  uint64_t v2;
  objc_class *isa;
  id v4;
  UIImage_optional v5;

  isa = image.value.super.isa;
  if (image.is_nil)
  {
    v4 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image, isAnimationPermitted);
    if (!v4)
    {
      v5.is_nil = 1;
      goto LABEL_6;
    }

  }
  v5.is_nil = 0;
LABEL_6:
  v5.value.super.isa = isa;
  ArtworkView.setImage(image:animated:)(v5, isAnimationPermitted);
}

void sub_1D820BF20()
{
  uint64_t v0;

}

id ArtworkView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1D820C038()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image));
}

void sub_1D820C064(UIImage_optional a1, Swift::Bool a2)
{
  Class isa;

  isa = a1.value.super.isa;
  a1.is_nil = 0;
  ArtworkView.setImage(image:animated:)(a1, a2);

}

void (*sub_1D820C08C(_QWORD *a1))(Class *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_image);
  return sub_1D820BE68;
}

id sub_1D820C0DC(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  id v5;
  id result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_placeholderColor);
  swift_beginAccess();
  v4 = (void *)*v3;
  *v3 = a1;
  v5 = a1;

  result = *(id *)(v1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shadowView);
  if (result)
    return objc_msgSend(result, sel_setBackgroundColor_, *v3);
  return result;
}

uint64_t sub_1D820C158()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1D820C184@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_placeholderColor);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_1D820C1D4(id *a1)
{
  id v1;

  v1 = *a1;
  sub_1D820C0DC(v1);

}

__n128 sub_1D820C20C@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageSize);
  swift_beginAccess();
  result = *v3;
  *a2 = *v3;
  return result;
}

id sub_1D820C25C(double *a1)
{
  return ArtworkView.imageSize.setter(*a1, a1[1]);
}

uint64_t sub_1D820C280@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC11AppStoreKit11ArtworkView_frameUpdatesImageSize, a2);
}

id sub_1D820C28C(char *a1)
{
  return ArtworkView.frameUpdatesImageSize.setter(*a1);
}

uint64_t sub_1D820C2B0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC11AppStoreKit11ArtworkView_clipImageToBounds, a2);
}

id sub_1D820C2BC(char *a1, void **a2)
{
  char v2;
  void *v3;
  _BYTE *v4;

  v2 = *a1;
  v3 = *a2;
  v4 = (char *)*a2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_clipImageToBounds;
  swift_beginAccess();
  *v4 = v2;
  return objc_msgSend(v3, sel_setNeedsLayout);
}

uint64_t sub_1D820C320@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC11AppStoreKit11ArtworkView_shouldSymbolImageSelfSize, a2);
}

uint64_t keypath_get_11Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_1D820C37C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_style);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

id sub_1D820C3D0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_1D820C424@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_21Tm(a1, (SEL *)&selRef_preferredSymbolConfiguration, a2);
}

id sub_1D820C434@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_isHidden);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1D820C470(unsigned __int8 *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), sel_setHidden_, *a1);
}

id sub_1D820C494@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_21Tm(a1, (SEL *)&selRef_image, a2);
}

id keypath_get_21Tm@<X0>(_QWORD *a1@<X0>, SEL *a2@<X3>, _QWORD *a3@<X8>)
{
  id result;

  result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                                 + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_imageView), *a2));
  *a3 = result;
  return result;
}

uint64_t method lookup function for ArtworkView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PageRenderAssetLoadingObserver.didBeginFetchingAssets()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PageRenderAssetLoadingObserver.didFinishFetchingOnScreenAssets()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PageRenderAssetLoadingObserver.didFinishFetchingAllAssets()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PageRenderAssetLoader.assetObserver.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PageRenderAssetLoader.assetObserver.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

double sub_1D820C524(void *a1)
{
  id v1;
  double MaxY;
  CGRect v4;

  v1 = a1;
  objc_msgSend(v1, sel_frame);
  MaxY = CGRectGetMaxY(v4);

  return MaxY;
}

double UIView.firstBaselineFromTop.getter()
{
  void *v0;
  CGRect v2;

  objc_msgSend(v0, sel_frame);
  return CGRectGetMaxY(v2);
}

double sub_1D820C588()
{
  return 0.0;
}

double UIView.lastBaselineFromBottom.getter()
{
  return 0.0;
}

double sub_1D820C598(void *a1)
{
  id v1;
  double MaxY;
  double v3;
  double v4;
  CGRect v6;

  v1 = a1;
  objc_msgSend(v1, sel_frame);
  MaxY = CGRectGetMaxY(v6);
  objc_msgSend(v1, sel_lastBaselineFromBottom);
  v4 = v3;

  return MaxY - v4;
}

double UIView.lastBaselineMaxY.getter()
{
  void *v0;
  double MaxY;
  double v2;
  CGRect v4;

  objc_msgSend(v0, sel_frame);
  MaxY = CGRectGetMaxY(v4);
  objc_msgSend(v0, sel_lastBaselineFromBottom);
  return MaxY - v2;
}

id sub_1D820C634(void *a1)
{
  return objc_msgSend(a1, sel__firstBaselineOffsetFromTop);
}

id UILabel.firstBaselineFromTop.getter()
{
  void *v0;

  return objc_msgSend(v0, sel__firstBaselineOffsetFromTop);
}

id sub_1D820C650(void *a1)
{
  return objc_msgSend(a1, sel__baselineOffsetFromBottom);
}

id UILabel.lastBaselineFromBottom.getter()
{
  void *v0;

  return objc_msgSend(v0, sel__baselineOffsetFromBottom);
}

double sub_1D820C66C(void *a1)
{
  id v1;
  double v2;

  v1 = a1;
  v2 = UIButton.lastBaselineFromBottom.getter();

  return v2;
}

double UIButton.lastBaselineFromBottom.getter()
{
  void *v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double Height;
  double MaxY;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v28;
  CGRect v29;

  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(v0, sel_contentRectForBounds_);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v28.origin.x = v2;
  v28.origin.y = v4;
  v28.size.width = v6;
  v28.size.height = v8;
  Height = CGRectGetHeight(v28);
  v29.origin.x = v10;
  v29.origin.y = v12;
  v29.size.width = v14;
  v29.size.height = v16;
  MaxY = CGRectGetMaxY(v29);
  v19 = objc_msgSend(v0, sel_titleLabel);
  if (v19)
  {
    v20 = v19;
    objc_msgSend(v19, sel__baselineOffsetFromBottom);
    v22 = v21;

  }
  else
  {
    v22 = 0.0;
  }
  v23 = vabdd_f64(Height, MaxY);
  objc_msgSend(v0, sel_contentEdgeInsets);
  v25 = v24;
  objc_msgSend(v0, sel_titleEdgeInsets);
  return v23 + v22 + v25 + v26;
}

double sub_1D820C7BC(void *a1)
{
  id v1;
  double v2;

  v1 = a1;
  v2 = UIImageView.lastBaselineFromBottom.getter();

  return v2;
}

double UIImageView.lastBaselineFromBottom.getter()
{
  void *v0;
  id v1;
  double v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char v16;
  char v17;

  v1 = objc_msgSend(v0, sel_image);
  v2 = 0.0;
  if (v1)
  {
    v3 = v1;
    v4 = objc_msgSend(v0, sel_preferredSymbolConfiguration);
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v0, sel_traitCollection);
      v7 = objc_msgSend(v5, sel_configurationWithTraitCollection_, v6);

      v8 = objc_msgSend(v3, sel_imageByApplyingSymbolConfiguration_, v7);
      if (!v8)
      {

        return v2;
      }
      v9 = v8;
      v10 = sub_1D8215898();
      v12 = v11;

      v13 = v10;
      v14 = (v12 & 1) == 0;
    }
    else
    {
      v15 = sub_1D8215898();
      v17 = v16;

      v13 = v15;
      v14 = (v17 & 1) == 0;
    }
    if (v14)
      return *(double *)&v13;
    else
      return 0.0;
  }
  return v2;
}

double CGPoint.pointByMoving(x:y:)(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGPoint.rounded(_:toScaleOf:)(uint64_t a1, id a2, double a3, double a4)
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = objc_msgSend(a2, sel_traitCollection);
  objc_msgSend(v7, sel_displayScale);
  if (v8 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v9 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v7, sel_displayScale);
  }
  v10 = CGFloat.rounded(_:toScale:)(a1, v9, a3);
  objc_msgSend(v7, sel_displayScale);
  if (v11 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v12 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v7, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v12, a4);

  return v10;
}

{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a2, sel_displayScale);
  if (v8 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v9 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  v10 = CGFloat.rounded(_:toScale:)(a1, v9, a3);
  objc_msgSend(a2, sel_displayScale);
  if (v11 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v12 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v12, a4);
  return v10;
}

Swift::Void __swiftcall NSMutableAttributedString.convertLineSeparatorsIntoLineFeeds(at:paragraphRanges:)(Swift::OpaquePointer at, Swift::OpaquePointer paragraphRanges)
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  v3 = *((_QWORD *)at._rawValue + 2);
  if (v3)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v3; ++i)
    {
      v7 = *((_QWORD *)at._rawValue + i + 4);
      v8 = v7;
      sub_1D820D72C(&v8, v2, (unint64_t)paragraphRanges._rawValue);
    }
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall NSMutableAttributedString.convertWritingDirectionToBidiControlCharacters()()
{
  void *v0;

  if (qword_1F0167D00 != -1)
    swift_once();
  objc_msgSend(objc_retainAutorelease(v0), sel_performSelector_, qword_1F0168198);
}

Swift::Void __swiftcall NSMutableString.convertLineSeparatorsIntoLineFeeds(at:)(Swift::OpaquePointer at)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *((_QWORD *)at._rawValue + 2);
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = 0;
    do
    {
      v5 = *((_QWORD *)at._rawValue + v4++ + 4);
      v6 = (void *)sub_1D82156AC();
      objc_msgSend(v1, sel_replaceCharactersInRange_withString_, v5, 1, v6);

    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
  }
}

Swift::String __swiftcall NSAttributedString.convertedWritingDirectionToBidiControlCharacters()()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  Swift::String result;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v0);
  if (qword_1F0167D00 != -1)
    swift_once();
  v2 = qword_1F0168198;
  v3 = objc_retainAutorelease(v1);
  objc_msgSend(v3, sel_performSelector_, v2);
  v4 = objc_msgSend(v3, sel_string);
  v5 = sub_1D82156D0();
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result._object = v9;
  result._countAndFlagsBits = v8;
  return result;
}

id NSAttributedString.baseWritingDirection(forCharacterAt:)(uint64_t a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  if ((uint64_t)objc_msgSend(v1, sel_length) <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C288);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1D8218A40;
    *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
    v7 = sub_1D820D9C0();
    v8 = MEMORY[0x1E0DEB418];
    v9 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v6 + 32) = 0xD000000000000025;
    *(_QWORD *)(v6 + 40) = 0x80000001D821BF60;
    *(_QWORD *)(v6 + 96) = v8;
    *(_QWORD *)(v6 + 104) = v9;
    *(_QWORD *)(v6 + 64) = v7;
    *(_QWORD *)(v6 + 72) = a1;
    v10 = objc_msgSend(v1, sel_length);
    *(_QWORD *)(v6 + 136) = v8;
    *(_QWORD *)(v6 + 144) = v9;
    *(_QWORD *)(v6 + 112) = v10;
    sub_1D82156DC();
    v11 = (void *)*MEMORY[0x1E0C99858];
    v12 = objc_allocWithZone(MEMORY[0x1E0C99DA0]);
    v13 = v11;
    v14 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
    v4 = objc_msgSend(v12, sel_initWithName_reason_userInfo_, v13, v14, 0);

    objc_msgSend(v4, sel_raise);
    v5 = 0;
  }
  else
  {
    v3 = objc_msgSend(v1, sel_paragraphStyleAtIndex_effectiveRange_, a1, 0);
    if (!v3)
      return 0;
    v4 = v3;
    v5 = objc_msgSend(v3, sel_baseWritingDirection);
  }

  return v5;
}

uint64_t sub_1D820CF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t sub_1D820CF9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(__int128 *, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  __int128 v12;

  v9 = *(void (**)(__int128 *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v12 + 1) = swift_getObjectType();
    *(_QWORD *)&v11 = a2;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return sub_1D820DA2C((uint64_t)&v11);
}

uint64_t NSAttributedString.strongBaseWritingDirectionOfParagraph(atOrBefore:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[6];
  uint64_t v21;
  char v22;

  if ((uint64_t)objc_msgSend(v1, sel_length) <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C288);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1D8218A40;
    *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
    v11 = sub_1D820D9C0();
    v12 = MEMORY[0x1E0DEB418];
    v13 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v10 + 32) = 0xD000000000000032;
    *(_QWORD *)(v10 + 40) = 0x80000001D821BF90;
    *(_QWORD *)(v10 + 96) = v12;
    *(_QWORD *)(v10 + 104) = v13;
    *(_QWORD *)(v10 + 64) = v11;
    *(_QWORD *)(v10 + 72) = a1;
    v14 = objc_msgSend(v1, sel_length);
    *(_QWORD *)(v10 + 136) = v12;
    *(_QWORD *)(v10 + 144) = v13;
    *(_QWORD *)(v10 + 112) = v14;
    sub_1D82156DC();
    v15 = (void *)*MEMORY[0x1E0C99858];
    v16 = objc_allocWithZone(MEMORY[0x1E0C99DA0]);
    v17 = v15;
    v18 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v16, sel_initWithName_reason_userInfo_, v17, v18, 0);

    objc_msgSend(v19, sel_raise);
    return 0;
  }
  v21 = 0;
  v22 = 1;
  v3 = *MEMORY[0x1E0DC1178];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &v21;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1D820DA14;
  *(_QWORD *)(v5 + 24) = v4;
  v20[4] = sub_1D81F67BC;
  v20[5] = v5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 1107296256;
  v20[2] = sub_1D820CF9C;
  v20[3] = &block_descriptor_4;
  v6 = _Block_copy(v20);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_enumerateAttribute_inRange_options_usingBlock_, v3, 0, a1, 2, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v9 = v21;
    swift_release();
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t NSAttributedString.baseWritingDirectionForCharacterAtIndex(_:unknownStyle:)(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v4;

  result = (uint64_t)NSAttributedString.baseWritingDirection(forCharacterAt:)(a1);
  if (a2)
    *a2 = v4 & 1;
  if ((v4 & 1) != 0)
    return -1;
  return result;
}

uint64_t sub_1D820D308(void *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  char v8;
  uint64_t v9;

  v6 = a1;
  v7 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a3);
  if (a4)
    *a4 = v8 & 1;
  if ((v8 & 1) != 0)
    v9 = -1;
  else
    v9 = (uint64_t)v7;

  return v9;
}

void sub_1D820D35C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v1 = (void *)sub_1D82156AC();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  qword_1F0168190 = (uint64_t)v2;
}

id static NSAttributedString.empty.getter()
{
  if (qword_1F0167CF8 != -1)
    swift_once();
  return (id)qword_1F0168190;
}

id sub_1D820D3F8()
{
  if (qword_1F0167CF8 != -1)
    swift_once();
  return (id)qword_1F0168190;
}

uint64_t sub_1D820D438(void *a1)
{
  objc_msgSend(a1, sel_length);
  return 0;
}

uint64_t NSAttributedString.fullRange.getter()
{
  void *v0;

  objc_msgSend(v0, sel_length);
  return 0;
}

uint64_t NSAttributedString.paragraphStyle(at:effectiveRange:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  if (objc_msgSend(v2, sel_attribute_atIndex_effectiveRange_, *MEMORY[0x1E0DC1178], a1, a2))
  {
    sub_1D82158F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1D81FAC78((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    sub_1D81D898C(0, &qword_1EDA1C208);
    if (swift_dynamicCast())
      return v4;
    else
      return 0;
  }
  else
  {
    sub_1D820DA2C((uint64_t)v6);
    return 0;
  }
}

id sub_1D820D55C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;

  v6 = a1;
  v7 = (void *)NSAttributedString.paragraphStyle(at:effectiveRange:)(a3, a4);

  return v7;
}

void sub_1D820D5A8(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5)
{
  id v7;
  _BYTE v8[24];
  uint64_t v9;

  sub_1D820DBB0(a1, (uint64_t)v8);
  if (v9)
  {
    sub_1D81D898C(0, &qword_1EDA1C208);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (objc_msgSend(v7, sel_baseWritingDirection) == (id)1 || !objc_msgSend(v7, sel_baseWritingDirection))
      {
        *(_QWORD *)a5 = objc_msgSend(v7, sel_baseWritingDirection);
        *(_BYTE *)(a5 + 8) = 0;
        *a4 = 1;
      }

    }
  }
  else
  {
    sub_1D820DA2C((uint64_t)v8);
  }
}

uint64_t NSAttributedString.strongBaseWritingDirectionOfParagraphAtOrBeforeIndex(_:)(uint64_t a1)
{
  uint64_t result;
  char v2;

  result = NSAttributedString.strongBaseWritingDirectionOfParagraph(atOrBefore:)(a1);
  if ((v2 & 1) != 0)
    return -1;
  return result;
}

uint64_t sub_1D820D698(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = a1;
  v5 = NSAttributedString.strongBaseWritingDirectionOfParagraph(atOrBefore:)(a3);
  v7 = v6;

  if ((v7 & 1) != 0)
    return -1;
  else
    return v5;
}

void sub_1D820D6E0()
{
  NSString *v0;
  SEL v1;

  v0 = (NSString *)sub_1D82156AC();
  v1 = NSSelectorFromString(v0);

  qword_1F0168198 = (uint64_t)v1;
}

void sub_1D820D72C(uint64_t *a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v5 = *a1;
  v6 = (void *)sub_1D82156AC();
  objc_msgSend(a2, sel_replaceCharactersInRange_withString_, v5, 1, v6);

  if (!(a3 >> 62))
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_3;
LABEL_23:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_22:
  swift_bridgeObjectRetain();
  v7 = sub_1D82159C4();
  if (!v7)
    goto LABEL_23;
LABEL_3:
  v8 = 4;
  while (1)
  {
    if ((a3 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x1D82AA2D4](v8 - 4, a3);
    else
      v9 = *(id *)(a3 + 8 * v8);
    v10 = v9;
    v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
    {
      __break(1u);
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    objc_msgSend(v9, sel_directionalRangeValue);
    if (v5 >= v17)
    {
      if (__OFSUB__(v5, v17))
        goto LABEL_21;
      if (v5 - v17 < v18)
        break;
    }

    ++v8;
    if (v11 == v7)
      goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_directionalRangeValue);
  v12 = objc_msgSend(a2, sel_paragraphStyleAtIndex_effectiveRange_, v17, 0);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_paragraphSpacing);
    if (v14 == 0.0
      || (objc_msgSend(v13, sel_mutableCopy),
          sub_1D82158F8(),
          swift_unknownObjectRelease(),
          sub_1D81D898C(0, &qword_1EDA1BF40),
          (swift_dynamicCast() & 1) == 0))
    {

    }
    else
    {
      objc_msgSend(v19, sel_setParagraphSpacing_, 0.0);
      v15 = *MEMORY[0x1E0DC1178];
      v16 = v19;
      objc_msgSend(a2, sel_addAttribute_value_range_, v15, v16, v17, v18);

    }
  }

}

unint64_t sub_1D820D9C0()
{
  unint64_t result;

  result = qword_1EDA1C1D0;
  if (!qword_1EDA1C1D0)
  {
    result = MEMORY[0x1D82AAACC](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EDA1C1D0);
  }
  return result;
}

uint64_t sub_1D820DA04()
{
  return swift_deallocObject();
}

void sub_1D820DA14(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  sub_1D820D5A8(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t sub_1D820DA1C()
{
  return swift_deallocObject();
}

uint64_t sub_1D820DA2C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C290);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id NSParagraphStyle.withBaseWritingDirection(_:)(uint64_t a1)
{
  void *v1;
  id v4;

  objc_msgSend(v1, sel_mutableCopy);
  sub_1D82158F8();
  swift_unknownObjectRelease();
  sub_1D81D898C(0, &qword_1EDA1BF40);
  swift_dynamicCast();
  objc_msgSend(v4, sel_setBaseWritingDirection_, a1);
  objc_msgSend(v4, sel_copy);
  sub_1D82158F8();

  swift_unknownObjectRelease();
  sub_1D81D898C(0, &qword_1EDA1C208);
  swift_dynamicCast();
  return v4;
}

id sub_1D820DB6C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;

  v4 = a1;
  v5 = NSParagraphStyle.withBaseWritingDirection(_:)(a3);

  return v5;
}

NSTextAlignment __swiftcall UIUserInterfaceLayoutDirection.textAlignment(whenLeftToRight:rightToLeft:)(NSTextAlignment whenLeftToRight, NSTextAlignment rightToLeft)
{
  uint64_t v2;

  if (v2 == 1)
    return rightToLeft;
  return whenLeftToRight;
}

uint64_t sub_1D820DBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C290);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1D820DBF8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1D820DC3C()
{
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D820DD38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1D81EF90C(*a1, *a2);
}

uint64_t sub_1D820DD44()
{
  sub_1D8215AB4();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D820DDD8()
{
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D820DE48()
{
  sub_1D8215AB4();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

void sub_1D820DED8(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE300000000000000;
  v4 = 0xE500000000000000;
  v5 = 0x64656D616ELL;
  if (v2 != 1)
  {
    v5 = 0x63696D616E7964;
    v4 = 0xE700000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 6449010;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1D820DF3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;

  v0 = sub_1D8215538();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v15 - v5;
  v7 = sub_1D8215544();
  v8 = (void *)JSONObject.appStoreColor.getter(v7);
  v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v6, v0);
  if (v8)
  {
    v10 = sub_1D8215544();
    v11 = (void *)JSONObject.appStoreColor.getter(v10);
    v9(v4, v0);
    if (v11)
    {
      sub_1D81DEF94();
      if ((sub_1D82158A4() & 1) != 0)
      {

      }
      else
      {
        v12 = v8;
        v13 = v11;
        return sub_1D8215880();
      }
    }
  }
  return (uint64_t)v8;
}

ValueMetadata *_s9ColorTypeOMa()
{
  return &_s9ColorTypeON;
}

unint64_t sub_1D820E0B0()
{
  unint64_t result;

  result = qword_1F01681A0;
  if (!qword_1F01681A0)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D8219544, &_s9ColorTypeON);
    atomic_store(result, (unint64_t *)&qword_1F01681A0);
  }
  return result;
}

uint64_t sub_1D820E0F4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1D820E12C + 4 * byte_1D82194AD[a1]))(0x65526D6574737973, 0xE900000000000064);
}

uint64_t sub_1D820E12C()
{
  return 0x72476D6574737973;
}

uint64_t sub_1D820E1F4()
{
  return 0x72426D6574737973;
}

uint64_t sub_1D820E214(char *a1, char *a2)
{
  return sub_1D81EFCC4(*a1, *a2);
}

uint64_t sub_1D820E220()
{
  sub_1D8215AB4();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D820E278()
{
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D820E2A4()
{
  sub_1D8215AB4();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

void sub_1D820E2F8(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = *(_QWORD *)&aBlack_2[8 * *v1];
  a1[1] = 0xE500000000000000;
}

void sub_1D820E314(char *a1)
{
  sub_1D81EFA0C(*a1);
}

uint64_t sub_1D820E320()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1D8215AB4();
  sub_1D820DBF8((uint64_t)v3, v1);
  return sub_1D8215AE4();
}

void sub_1D820E364(uint64_t a1)
{
  char *v1;

  sub_1D820DBF8(a1, *v1);
}

uint64_t sub_1D820E36C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1D8215AB4();
  sub_1D820DBF8((uint64_t)v3, v1);
  return sub_1D8215AE4();
}

uint64_t sub_1D820E3AC@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1D820E0F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1D820E3D4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1D820E408 + 4 * byte_1D82194B6[a1]))(0x746E6954707061, 0xE700000000000000);
}

unint64_t sub_1D820E408()
{
  return 0xD000000000000011;
}

unint64_t sub_1D820E424()
{
  return 0xD000000000000013;
}

uint64_t sub_1D820E478()
{
  return 0x547972616D697270;
}

uint64_t sub_1D820E498()
{
  return 0x7261646E6F636573;
}

uint64_t sub_1D820E4BC()
{
  return 0x7972616974726574;
}

uint64_t sub_1D820E4DC()
{
  return 0x616E726574617571;
}

uint64_t sub_1D820E500()
{
  return 0x4C746C7561666564;
}

uint64_t sub_1D820E520(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_1D820E3D4(*a1);
  v5 = v4;
  if (v3 == sub_1D820E3D4(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_1D8215A3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1D820E5A8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_1D8215AB4();
  sub_1D820E3D4(v1);
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D820E608()
{
  unsigned __int8 *v0;

  sub_1D820E3D4(*v0);
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D820E648()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_1D8215AB4();
  sub_1D820E3D4(v1);
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D820E6A4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1D820E3D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s18SemanticNamedColorOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s18SemanticNamedColorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_1D820E7A8 + 4 * byte_1D82194CF[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1D820E7DC + 4 * byte_1D82194CA[v4]))();
}

uint64_t sub_1D820E7DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820E7E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D820E7ECLL);
  return result;
}

uint64_t sub_1D820E7F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D820E800);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_1D820E804(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820E80C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s18SemanticNamedColorOMa()
{
  return &_s18SemanticNamedColorON;
}

uint64_t _s16SystemNamedColorOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s16SystemNamedColorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_1D820E904 + 4 * byte_1D82194D9[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1D820E938 + 4 * byte_1D82194D4[v4]))();
}

uint64_t sub_1D820E938(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820E940(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D820E948);
  return result;
}

uint64_t sub_1D820E954(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D820E95CLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1D820E960(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820E968(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s16SystemNamedColorOMa()
{
  return &_s16SystemNamedColorON;
}

uint64_t _s9ColorTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D820E9D0 + 4 * byte_1D82194E3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D820EA04 + 4 * byte_1D82194DE[v4]))();
}

uint64_t sub_1D820EA04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820EA0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D820EA14);
  return result;
}

uint64_t sub_1D820EA20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D820EA28);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D820EA2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820EA34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s16StaticNamedColorOMa()
{
  return &_s16StaticNamedColorON;
}

unint64_t sub_1D820EA54()
{
  unint64_t result;

  result = qword_1F01681A8;
  if (!qword_1F01681A8)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D8219644, &_s16StaticNamedColorON);
    atomic_store(result, (unint64_t *)&qword_1F01681A8);
  }
  return result;
}

unint64_t sub_1D820EA9C()
{
  unint64_t result;

  result = qword_1F01681B0;
  if (!qword_1F01681B0)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D82196AC, &_s16SystemNamedColorON);
    atomic_store(result, (unint64_t *)&qword_1F01681B0);
  }
  return result;
}

unint64_t sub_1D820EAE4()
{
  unint64_t result;

  result = qword_1F01681B8;
  if (!qword_1F01681B8)
  {
    result = MEMORY[0x1D82AAACC](&unk_1D8219714, &_s18SemanticNamedColorON);
    atomic_store(result, (unint64_t *)&qword_1F01681B8);
  }
  return result;
}

uint64_t Unicode.BidiCategory.init(rawValue:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  v2 = 0;
  v3 = 5;
  switch(result)
  {
    case 0:
      goto LABEL_7;
    case 1:
      v2 = 1;
      goto LABEL_7;
    case 2:
      v2 = 2;
      goto LABEL_7;
    case 3:
      v2 = 3;
      goto LABEL_7;
    case 4:
      v2 = 4;
LABEL_7:
      v3 = v2;
      goto LABEL_8;
    case 5:
LABEL_8:
      *a2 = v3;
      break;
    case 6:
      *a2 = 6;
      break;
    case 7:
      *a2 = 7;
      break;
    case 8:
      *a2 = 8;
      break;
    case 9:
      *a2 = 9;
      break;
    case 10:
      *a2 = 10;
      break;
    case 11:
      *a2 = 11;
      break;
    case 12:
      *a2 = 12;
      break;
    case 13:
      *a2 = 13;
      break;
    case 14:
      *a2 = 14;
      break;
    case 15:
      *a2 = 15;
      break;
    case 16:
      *a2 = 16;
      break;
    case 17:
      *a2 = 17;
      break;
    case 18:
      *a2 = 18;
      break;
    case 19:
      *a2 = 19;
      break;
    case 20:
      *a2 = 20;
      break;
    case 21:
      *a2 = 21;
      break;
    case 22:
      *a2 = 22;
      break;
    default:
      *a2 = 23;
      break;
  }
  return result;
}

uint64_t Unicode.BidiCategory.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_1D820EC60@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return Unicode.BidiCategory.init(rawValue:)(*a1, a2);
}

void sub_1D820EC68(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t Unicode.Scalar.bidiCategory.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = AMPGetICUCharDirection();
  result = Unicode.BidiCategory.init(rawValue:)(v2, &v4);
  if (v4 == 23)
    __break(1u);
  else
    *a1 = v4;
  return result;
}

unint64_t sub_1D820ECBC()
{
  unint64_t result;

  result = qword_1F01681C0;
  if (!qword_1F01681C0)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Unicode.BidiCategory, &type metadata for Unicode.BidiCategory);
    atomic_store(result, (unint64_t *)&qword_1F01681C0);
  }
  return result;
}

uint64_t _s12BidiCategoryOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEA)
    goto LABEL_17;
  if (a2 + 22 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 22) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 22;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 22;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 22;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x17;
  v8 = v6 - 23;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s12BidiCategoryOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 22 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 22) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE9)
    return ((uint64_t (*)(void))((char *)&loc_1D820EDDC + 4 * byte_1D821981C[v4]))();
  *a1 = a2 + 22;
  return ((uint64_t (*)(void))((char *)sub_1D820EE10 + 4 * byte_1D8219817[v4]))();
}

uint64_t sub_1D820EE10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820EE18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D820EE20);
  return result;
}

uint64_t sub_1D820EE2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D820EE34);
  *(_BYTE *)result = a2 + 22;
  return result;
}

uint64_t sub_1D820EE38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820EE40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Unicode.BidiCategory()
{
  return &type metadata for Unicode.BidiCategory;
}

unint64_t sub_1D820EE5C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C268);
  v2 = sub_1D82159E8();
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
    sub_1D81E1C08(v6, (uint64_t)&v13, &qword_1EDA1C240);
    v7 = v13;
    result = sub_1D8204828(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_1D8205A44(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_1D820EF88(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F01681D0);
  v2 = (_QWORD *)sub_1D82159E8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (id *)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    v8 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1D81E7A1C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v14;
    if (!--v3)
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

uint64_t Artwork.URLTemplate.isBundleImage.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D82153E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D82153D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1D820F22C((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v7 = sub_1D82153C4();
    if (v8)
    {
      if (v7 == 0x656372756F736572 && v8 == 0xE800000000000000)
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        swift_bridgeObjectRelease();
        return 1;
      }
      v10 = sub_1D8215A3C();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
        return 1;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  return 0;
}

uint64_t sub_1D820F22C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Artwork.URLTemplate.isSystemImage.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D82153E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D82153D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1D820F22C((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v7 = sub_1D82153C4();
    if (v8)
    {
      if (v7 == 0x6D696D6574737973 && v8 == 0xEB00000000656761)
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        swift_bridgeObjectRelease();
        return 1;
      }
      v10 = sub_1D8215A3C();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
        return 1;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  return 0;
}

BOOL Artwork.URLTemplate.isLocalImage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v23;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1BFE8);
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v23 - v4;
  v6 = sub_1D82153E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v23 - v11;
  swift_bridgeObjectRetain();
  sub_1D82153D0();
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v13(v5, 1, v6) == 1)
  {
    sub_1D820F22C((uint64_t)v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    v14 = sub_1D82153C4();
    if (v15)
    {
      if (v14 == 0x656372756F736572 && v15 == 0xE800000000000000)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        swift_bridgeObjectRelease();
LABEL_25:
        swift_bridgeObjectRelease();
        return 1;
      }
      v17 = sub_1D8215A3C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        goto LABEL_25;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
  sub_1D82153D0();
  if (v13(v3, 1, v6) == 1)
  {
    sub_1D820F22C((uint64_t)v3);
LABEL_22:
    swift_bridgeObjectRelease();
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v3, v6);
  v18 = sub_1D82153C4();
  if (!v19)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_22;
  }
  if (v18 == 0x6D696D6574737973 && v19 == 0xEB00000000656761)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v21 = sub_1D8215A3C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v21 & 1) != 0;
}

uint64_t Artwork.URLTemplate.makeURL(withSubstitutions:)(Swift::OpaquePointer a1)
{
  Artwork.URLTemplate.makeString(withSubstitutions:)(a1);
  sub_1D82153D0();
  return swift_bridgeObjectRelease();
}

uint64_t Artwork.URLTemplate.Key.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1D8215A00();
  result = swift_bridgeObjectRelease();
  v4 = 4;
  if (v2 < 4)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t Artwork.URLTemplate.Key.rawValue.getter()
{
  char *v0;

  return qword_1D8219AE8[*v0];
}

uint64_t sub_1D820F7BC(char *a1, char *a2)
{
  return sub_1D81EFE3C(*a1, *a2);
}

uint64_t sub_1D820F7C8()
{
  sub_1D8215AB4();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D820F820()
{
  sub_1D821570C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D820F84C()
{
  sub_1D8215AB4();
  sub_1D821570C();
  swift_bridgeObjectRelease();
  return sub_1D8215AE4();
}

uint64_t sub_1D820F8A0@<X0>(char *a1@<X8>)
{
  return Artwork.URLTemplate.Key.init(rawValue:)(a1);
}

void sub_1D820F8AC(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_1D8219AE8[*v1];
  a1[1] = 0xE300000000000000;
}

uint64_t Artwork.URLTemplate.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t Artwork.URLTemplate.init(deserializing:using:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_1D821552C();
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    v10 = sub_1D821558C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a2, v10);
    v11 = sub_1D8215538();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
    *a3 = v8;
    a3[1] = v9;
  }
  else
  {
    v13 = sub_1D8215664();
    sub_1D820F9F8();
    swift_allocError();
    v14 = MEMORY[0x1E0DEE9D8];
    *v15 = &type metadata for Artwork.URLTemplate;
    v15[1] = v14;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0D414F0], v13);
    swift_willThrow();
    v16 = sub_1D821558C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
    v17 = sub_1D8215538();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a1, v17);
  }
  return result;
}

unint64_t sub_1D820F9F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA1C1C0;
  if (!qword_1EDA1C1C0)
  {
    v1 = sub_1D8215664();
    result = MEMORY[0x1D82AAACC](MEMORY[0x1E0D41508], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA1C1C0);
  }
  return result;
}

uint64_t Artwork.URLTemplate.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static Artwork.URLTemplate.systemImageScheme.getter()
{
  return 0x6D696D6574737973;
}

uint64_t sub_1D820FA8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v8 = sub_1D821552C();
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    v12 = sub_1D821558C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a2, v12);
    v13 = sub_1D8215538();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
    *a3 = v10;
    a3[1] = v11;
  }
  else
  {
    v15 = sub_1D8215664();
    sub_1D820F9F8();
    swift_allocError();
    v16 = MEMORY[0x1E0DEE9D8];
    *v17 = v4;
    v17[1] = v16;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x1E0D414F0], v15);
    swift_willThrow();
    v18 = sub_1D821558C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(a2, v18);
    v19 = sub_1D8215538();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a1, v19);
  }
  return result;
}

unint64_t sub_1D820FBBC()
{
  unint64_t result;

  result = qword_1EDA1BC78;
  if (!qword_1EDA1BC78)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.URLTemplate, &type metadata for Artwork.URLTemplate);
    atomic_store(result, (unint64_t *)&qword_1EDA1BC78);
  }
  return result;
}

uint64_t _s11URLTemplateV3KeyOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D820FC4C + 4 * byte_1D8219945[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1D820FC80 + 4 * byte_1D8219940[v4]))();
}

uint64_t sub_1D820FC80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820FC88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D820FC90);
  return result;
}

uint64_t sub_1D820FC9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D820FCA4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1D820FCA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D820FCB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *Artwork.Variant.init(format:quality:supportsWideGamut:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(_BYTE *)a5 = *result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a3 & 1;
  *(_BYTE *)(a5 + 17) = a4;
  return result;
}

void sub_1D820FCD8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t Artwork.Variant.supportsWideGamut.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

void Artwork.Variant.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_1D820FD40()
{
  int v0;

  sub_1D821570C();
  swift_bridgeObjectRelease();
  sub_1D8215ACC();
  if (!v0)
    sub_1D8215AC0();
  return sub_1D8215ACC();
}

void Artwork.Variant.hashValue.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1D8215AB4();
  __asm { BR              X9 }
}

uint64_t sub_1D820FE10()
{
  int v0;

  sub_1D821570C();
  swift_bridgeObjectRelease();
  sub_1D8215ACC();
  if (!v0)
    sub_1D8215AC0();
  sub_1D8215ACC();
  return sub_1D8215AE4();
}

void sub_1D820FEAC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1D8215AB4();
  __asm { BR              X9 }
}

uint64_t sub_1D820FF00()
{
  int v0;

  sub_1D821570C();
  swift_bridgeObjectRelease();
  sub_1D8215ACC();
  if (!v0)
    sub_1D8215AC0();
  sub_1D8215ACC();
  return sub_1D8215AE4();
}

uint64_t _s11AppStoreKit7ArtworkC7VariantV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  char v8;
  char v10;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a1 + 17);
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(unsigned __int8 *)(a2 + 16);
  v7 = *(unsigned __int8 *)(a2 + 17);
  sub_1D81EFD28(*(_BYTE *)a1);
  if ((v8 & 1) == 0)
    return 0;
  if ((v3 & 1) != 0)
  {
    if (!v6)
      return 0;
  }
  else
  {
    if (v2 == v5)
      v10 = v6;
    else
      v10 = 1;
    if ((v10 & 1) != 0)
      return 0;
  }
  return v4 ^ v7 ^ 1u;
}

unint64_t sub_1D8210008()
{
  unint64_t result;

  result = qword_1F01681D8;
  if (!qword_1F01681D8)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Artwork.Variant, &type metadata for Artwork.Variant);
    atomic_store(result, (unint64_t *)&qword_1F01681D8);
  }
  return result;
}

id ShadowView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *ShadowView.__allocating_init(radius:style:)(char *a1, double a2)
{
  objc_class *v2;
  char v4;
  _BYTE *v5;
  char *v6;
  char *v7;
  char *v8;

  v4 = *a1;
  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(double *)&v5[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius] = a2;
  v5[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle] = v4;
  v6 = v5;
  CornerStyle.apply(withRadius:to:)(v6, a2);
  v7 = &v6[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v8 = &v6[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
  swift_beginAccess();
  if (*(_QWORD *)v8)
    objc_msgSend(v6, sel_setNeedsLayout);

  return v6;
}

id sub_1D821017C@<X0>(_QWORD *a1@<X0>, __int128 *a2@<X8>)
{
  __int128 *v3;
  __int128 v4;
  __int128 v5;

  v3 = (__int128 *)(*a1 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return (id)v4;
}

id sub_1D82101D0(uint64_t a1, _QWORD *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v8;

  v2 = *(void **)a1;
  v8 = *(_OWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *a2 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow;
  swift_beginAccess();
  v5 = *(void **)v4;
  *(_QWORD *)v4 = v2;
  *(_OWORD *)(v4 + 8) = v8;
  *(_QWORD *)(v4 + 24) = v3;
  v6 = v2;

  return sub_1D81DED2C();
}

id sub_1D8210254@<X0>(__int128 *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return (id)v4;
}

id (*sub_1D82102A4(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D82102EC;
}

id sub_1D82102EC(uint64_t a1, char a2)
{
  id result;

  result = (id)swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_1D81DED2C();
  return result;
}

uint64_t sub_1D821031C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1D8210360(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1D82103A8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id ShadowView.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  char *v9;
  _OWORD *v10;
  objc_super v12;

  *(_QWORD *)&v4[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius] = 0;
  v4[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle] = 1;
  v9 = &v4[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  v10 = &v4[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
  *v10 = 0u;
  v10[1] = 0u;
  v4[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange] = 0;
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for ShadowView();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, a1, a2, a3, a4);
}

id ShadowView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ShadowView.init(coder:)(void *a1)
{
  _BYTE *v1;
  char *v3;
  _OWORD *v4;
  id v5;
  objc_super v7;

  *(_QWORD *)&v1[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius] = 0;
  v1[OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle] = 1;
  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v3[32] = 1;
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow];
  *v4 = 0u;
  v4[1] = 0u;
  v1[OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ShadowView();
  v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id ShadowView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShadowView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D82105E4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1D8210634(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for ShadowView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ShadowView.shadow.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ShadowView.shadow.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ShadowView.shouldAnimateBoundsChange.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ShadowView.shouldAnimateBoundsChange.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ShadowView.shouldAnimateBoundsChange.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

char *DynamicTypeTextField.__allocating_init(useCase:directionalTextAlignment:)(uint64_t a1, char *a2)
{
  objc_class *v2;
  objc_class *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  objc_class *v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  objc_super v26;
  objc_super v27;
  objc_super v28;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a2;
  v10 = (char *)objc_msgSend(objc_allocWithZone(v3), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v11 = &v10[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment];
  swift_beginAccess();
  *v11 = v9;
  v12 = sub_1D8215454();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v8, a1, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
  v14 = (uint64_t)&v10[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase];
  swift_beginAccess();
  v15 = v10;
  sub_1D81E9A28((uint64_t)v8, v14);
  swift_endAccess();
  sub_1D8210970();
  v16 = objc_msgSend(v15, sel_traitCollection);
  v17 = (void *)MEMORY[0x1D82AA1A8](a1, v16);

  v18 = (objc_class *)type metadata accessor for DynamicTypeTextField();
  v28.receiver = v15;
  v28.super_class = v18;
  objc_msgSendSuper2(&v28, sel_setFont_, v17);

  if (*v11)
  {
    if (*v11 == 1)
    {
      v19 = objc_msgSend(v15, sel_traitCollection);
      v20 = sub_1D8215820();

      if ((v20 & 1) != 0)
        v21 = 2;
      else
        v21 = 0;
      objc_msgSendSuper2(&v26, sel_setTextAlignment_, v21, v15, v18, v27.receiver, v27.super_class);
    }
    else
    {
      v22 = objc_msgSend(v15, sel_traitCollection);
      v23 = sub_1D8215820();

      if ((v23 & 1) != 0)
        v24 = 0;
      else
        v24 = 2;
      objc_msgSendSuper2(&v27, sel_setTextAlignment_, v24, v26.receiver, v26.super_class, v15, v18);
    }
  }

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
  return v15;
}

unint64_t sub_1D8210970()
{
  unint64_t result;

  result = qword_1EDA1C248;
  if (!qword_1EDA1C248)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDA1C248);
  }
  return result;
}

uint64_t type metadata accessor for DynamicTypeTextField()
{
  uint64_t result;

  result = qword_1F0168230;
  if (!qword_1F0168230)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D82109E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D81D9CD8(a1, (uint64_t)v4);
  return sub_1D8210AB4((uint64_t)v4);
}

uint64_t sub_1D8210A64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase;
  swift_beginAccess();
  return sub_1D81D9CD8(v3, a1);
}

uint64_t sub_1D8210AB4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  objc_class *v14;
  uint64_t v16;
  objc_super v17;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D8215454();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)v2 + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase;
  swift_beginAccess();
  sub_1D81D9920(a1, v11);
  swift_endAccess();
  sub_1D81D9CD8(v11, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1D8211368((uint64_t)v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_1D8210970();
    v12 = objc_msgSend(v2, sel_traitCollection);
    v13 = (void *)MEMORY[0x1D82AA1A8](v10, v12);

    v14 = (objc_class *)type metadata accessor for DynamicTypeTextField();
    v17.receiver = v2;
    v17.super_class = v14;
    objc_msgSendSuper2(&v17, sel_setFont_, v13);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return sub_1D8211368(a1);
}

void (*sub_1D8210C58(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[5] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  v3[6] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = sub_1D8215454();
  v3[7] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[8] = v6;
  v7 = malloc(*(_QWORD *)(v6 + 64));
  v8 = OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase;
  v3[9] = v7;
  v3[10] = v8;
  swift_beginAccess();
  return sub_1D8210CF8;
}

void sub_1D8210CF8(uint64_t *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(_QWORD *)(v3 + 56);
    v5 = *(_QWORD *)(v3 + 64);
    v6 = *(_QWORD *)(v3 + 48);
    sub_1D81D9CD8(*(_QWORD *)(v3 + 40) + *(_QWORD *)(v3 + 80), v6);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
    {
      sub_1D8211368(*(_QWORD *)(v3 + 48));
    }
    else
    {
      v8 = *(_QWORD *)(v3 + 64);
      v7 = *(_QWORD *)(v3 + 72);
      v9 = *(_QWORD *)(v3 + 56);
      v10 = *(void **)(v3 + 40);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 32))(v7, *(_QWORD *)(v3 + 48), v9);
      sub_1D8210970();
      v11 = objc_msgSend(v10, sel_traitCollection);
      v12 = (void *)MEMORY[0x1D82AA1A8](v7, v11);

      v13 = type metadata accessor for DynamicTypeTextField();
      *(_QWORD *)(v3 + 24) = v10;
      *(_QWORD *)(v3 + 32) = v13;
      objc_msgSendSuper2((objc_super *)(v3 + 24), sel_setFont_, v12);

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    }
  }
  v14 = *(void **)(v3 + 48);
  free(*(void **)(v3 + 72));
  free(v14);
  free((void *)v3);
}

id sub_1D8210E6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return objc_msgSendSuper2(&v2, sel_font);
}

void sub_1D8210F74(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  uint64_t v7;
  objc_super v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for DynamicTypeTextField();
  v8.receiver = v1;
  v8.super_class = v6;
  objc_msgSendSuper2(&v8, sel_setFont_, a1);
  v7 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_1D8210AB4((uint64_t)v5);

}

id sub_1D8211068()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return objc_msgSendSuper2(&v2, sel_textAlignment);
}

id sub_1D821112C(uint64_t a1)
{
  char *v1;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  objc_super v6;
  unsigned __int8 v7;

  v3 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment];
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;
  v7 = v4;
  sub_1D8211210(&v7);
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return objc_msgSendSuper2(&v6, sel_setTextAlignment_, a1);
}

id sub_1D82111AC(unsigned __int8 *a1, _QWORD *a2)
{
  unsigned __int8 v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  v2 = *a1;
  v3 = (unsigned __int8 *)(*a2 + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v6 = v4;
  return sub_1D8211210(&v6);
}

id sub_1D8211210(unsigned __int8 *a1)
{
  char *v1;
  void *v2;
  int v3;
  char *v4;
  id result;
  int v6;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  objc_super v14;
  objc_super v15;

  v2 = v1;
  v3 = *a1;
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment];
  result = (id)swift_beginAccess();
  v6 = *v4;
  if (v6 != v3 && v6 != 0)
  {
    if (v6 == 1)
    {
      v8 = objc_msgSend(v2, sel_traitCollection);
      v9 = sub_1D8215820();

      if ((v9 & 1) != 0)
        v10 = 2;
      else
        v10 = 0;
      v14.receiver = v2;
      v14.super_class = (Class)type metadata accessor for DynamicTypeTextField();
      return objc_msgSendSuper2(&v14, sel_setTextAlignment_, v10);
    }
    else
    {
      v11 = objc_msgSend(v2, sel_traitCollection);
      v12 = sub_1D8215820();

      if ((v12 & 1) != 0)
        v13 = 0;
      else
        v13 = 2;
      v15.receiver = v2;
      v15.super_class = (Class)type metadata accessor for DynamicTypeTextField();
      return objc_msgSendSuper2(&v15, sel_setTextAlignment_, v13);
    }
  }
  return result;
}

uint64_t sub_1D821131C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_1D8211368(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1D82113A8(unsigned __int8 *a1)
{
  char *v1;
  void *v2;
  int v3;
  char *v4;
  id result;
  int v6;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  objc_super v14;
  objc_super v15;

  v2 = v1;
  v3 = *a1;
  v4 = &v1[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment];
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = v3;
  if (v3 != v6 && v3 != 0)
  {
    if (v3 == 1)
    {
      v8 = objc_msgSend(v2, sel_traitCollection);
      v9 = sub_1D8215820();

      if ((v9 & 1) != 0)
        v10 = 2;
      else
        v10 = 0;
      v14.receiver = v2;
      v14.super_class = (Class)type metadata accessor for DynamicTypeTextField();
      return objc_msgSendSuper2(&v14, sel_setTextAlignment_, v10);
    }
    else
    {
      v11 = objc_msgSend(v2, sel_traitCollection);
      v12 = sub_1D8215820();

      if ((v12 & 1) != 0)
        v13 = 0;
      else
        v13 = 2;
      v15.receiver = v2;
      v15.super_class = (Class)type metadata accessor for DynamicTypeTextField();
      return objc_msgSendSuper2(&v15, sel_setTextAlignment_, v13);
    }
  }
  return result;
}

void (*sub_1D82114B4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return sub_1D8211520;
}

void sub_1D8211520(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  unsigned __int8 *v6;
  char v7;
  char v8;

  v2 = *(void **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(_BYTE *)(v4 + v3);
  *(_BYTE *)(v4 + v3) = *(_BYTE *)(*(_QWORD *)a1 + 40);
  if ((a2 & 1) != 0)
  {
    v7 = v5;
    v6 = (unsigned __int8 *)&v7;
  }
  else
  {
    v8 = v5;
    v6 = (unsigned __int8 *)&v8;
  }
  sub_1D8211210(v6);
  free(v2);
}

uint64_t sub_1D821157C(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  id v12;
  id v13;
  char *v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  void *v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D8215454();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (objc_class *)type metadata accessor for DynamicTypeTextField();
  v28.receiver = v2;
  v28.super_class = v11;
  objc_msgSendSuper2(&v28, sel_traitCollectionDidChange_, a1);
  v12 = objc_msgSend(v2, sel_traitCollection);
  v13 = objc_msgSend(v12, sel_layoutDirection);

  if (!a1 || v13 != objc_msgSend(a1, sel_layoutDirection))
  {
    v14 = &v2[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment];
    swift_beginAccess();
    if (*v14)
    {
      if (*v14 == 1)
      {
        v15 = objc_msgSend(v2, sel_traitCollection);
        v16 = sub_1D8215820();

        if ((v16 & 1) != 0)
          v17 = 2;
        else
          v17 = 0;
        objc_msgSendSuper2(&v25, sel_setTextAlignment_, v17, v2, v11);
      }
      else
      {
        v18 = objc_msgSend(v2, sel_traitCollection);
        v19 = sub_1D8215820();

        if ((v19 & 1) != 0)
          v20 = 0;
        else
          v20 = 2;
        v27.receiver = v2;
        v27.super_class = v11;
        objc_msgSendSuper2(&v27, sel_setTextAlignment_, v20, v25.receiver, v25.super_class);
      }
    }
  }
  v21 = (uint64_t)&v2[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase];
  swift_beginAccess();
  sub_1D81D9CD8(v21, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_1D8211368((uint64_t)v6);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  sub_1D8210970();
  v23 = objc_msgSend(v2, sel_traitCollection);
  v24 = (void *)MEMORY[0x1D82AA1A8](v10, v23);

  v26.receiver = v2;
  v26.super_class = v11;
  objc_msgSendSuper2(&v26, sel_setFont_, v24);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

id DynamicTypeTextField.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id DynamicTypeTextField.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  char *v9;
  uint64_t v10;
  objc_super v12;

  v9 = &v4[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase];
  v10 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v4[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment] = 0;
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, a1, a2, a3, a4);
}

id DynamicTypeTextField.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DynamicTypeTextField.init(coder:)(void *a1)
{
  _BYTE *v1;
  char *v3;
  uint64_t v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase];
  v4 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id DynamicTypeTextField.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicTypeTextField();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D8211BD0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_fontUseCase;
  swift_beginAccess();
  return sub_1D81D9CD8(v3, a2);
}

uint64_t sub_1D8211C28@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11AppStoreKit20DynamicTypeTextField_directionalTextAlignment);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1D8211C7C()
{
  return type metadata accessor for DynamicTypeTextField();
}

void sub_1D8211C84()
{
  unint64_t v0;

  sub_1D81D6290();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for DynamicTypeTextField()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DynamicTypeTextField.fontUseCase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of DynamicTypeTextField.fontUseCase.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DynamicTypeTextField.fontUseCase.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DynamicTypeTextField.directionalTextAlignment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DynamicTypeTextField.directionalTextAlignment.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DynamicTypeTextField.directionalTextAlignment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t sub_1D8211DAC(uint64_t a1)
{
  return sub_1D81D65C8(a1, qword_1F016A438);
}

uint64_t sub_1D8211DC8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1D8211DD0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1D8211DD8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1D8211DE0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1D8211DE8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1D8211DF0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_1D8211DF8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_1D8211E00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_1D8211E08(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_1D8211E10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_1D8211E18(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t sub_1D8211E20(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of ImageViewProtocol.image.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ImageViewProtocol.image.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ImageViewProtocol.image.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ImageViewProtocol.show(image:isAnimationPermitted:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

double CGRect.rounded(_:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v8;

  v8 = CGPoint.rounded(_:)(a1, a2, a3);
  CGSize.rounded(_:)(a1, a4, a5);
  return v8;
}

double CGRect.rounded(originRule:sizeRule:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double v9;

  v9 = CGPoint.rounded(_:)(a1, a3, a4);
  CGSize.rounded(_:)(a2, a5, a6);
  return v9;
}

double CGRect.rounded(_:toScaleOf:)(uint64_t a1, id a2, double a3, double a4, double a5, double a6)
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  objc_msgSend(a2, sel_displayScale);
  if (v12 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v13 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  v14 = CGFloat.rounded(_:toScale:)(a1, v13, a3);
  objc_msgSend(a2, sel_displayScale);
  if (v15 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v16 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v16, a4);
  objc_msgSend(a2, sel_displayScale);
  if (v17 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v18 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v18, a5);
  objc_msgSend(a2, sel_displayScale);
  if (v19 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v20 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v20, a6);
  return v14;
}

{
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v12 = objc_msgSend(a2, sel_traitCollection);
  objc_msgSend(v12, sel_displayScale);
  if (v13 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v14 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v12, sel_displayScale);
  }
  v15 = CGFloat.rounded(_:toScale:)(a1, v14, a3);
  objc_msgSend(v12, sel_displayScale);
  if (v16 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v17 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v12, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v17, a4);

  v18 = objc_msgSend(a2, sel_traitCollection);
  objc_msgSend(v18, sel_displayScale);
  if (v19 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v20 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v18, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v20, a5);
  objc_msgSend(v18, sel_displayScale);
  if (v21 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v22 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v18, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v22, a6);

  return v15;
}

double CGRect.rounded(originRule:sizeRule:toScaleOf:)(uint64_t a1, uint64_t a2, id a3, double a4, double a5, double a6, double a7)
{
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v14 = objc_msgSend(a3, sel_traitCollection);
  objc_msgSend(v14, sel_displayScale);
  if (v15 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v16 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v14, sel_displayScale);
  }
  v17 = CGFloat.rounded(_:toScale:)(a1, v16, a4);
  objc_msgSend(v14, sel_displayScale);
  if (v18 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v19 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v14, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v19, a5);

  v20 = objc_msgSend(a3, sel_traitCollection);
  objc_msgSend(v20, sel_displayScale);
  if (v21 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v22 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v20, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a2, v22, a6);
  objc_msgSend(v20, sel_displayScale);
  if (v23 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v24 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v20, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a2, v24, a7);

  return v17;
}

{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  objc_msgSend(a3, sel_displayScale);
  if (v14 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v15 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a3, sel_displayScale);
  }
  v16 = CGFloat.rounded(_:toScale:)(a1, v15, a4);
  objc_msgSend(a3, sel_displayScale);
  if (v17 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v18 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a3, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v18, a5);
  objc_msgSend(a3, sel_displayScale);
  if (v19 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v20 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a3, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a2, v20, a6);
  objc_msgSend(a3, sel_displayScale);
  if (v21 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v22 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a3, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a2, v22, a7);
  return v16;
}

uint64_t dispatch thunk of CornerStylable.applyCorner(radius:style:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

id sub_1D82126F8()
{
  id *v0;

  return objc_msgSend(*v0, sel_layoutMargins);
}

uint64_t sub_1D8212708()
{
  return LayoutMarginsAware<>.layoutFrame.getter();
}

uint64_t dispatch thunk of LayoutMarginsAware.layoutMargins.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LayoutMarginsAware.layoutFrame.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

double CGSize.rounded(_:toScaleOf:)(uint64_t a1, id a2, double a3, double a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a2, sel_displayScale);
  if (v8 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v9 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  v10 = CGFloat.rounded(_:toScale:)(a1, v9, a3);
  objc_msgSend(a2, sel_displayScale);
  if (v11 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v12 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(a2, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v12, a4);
  return v10;
}

{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = objc_msgSend(a2, sel_traitCollection);
  objc_msgSend(v7, sel_displayScale);
  if (v8 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v9 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v7, sel_displayScale);
  }
  v10 = CGFloat.rounded(_:toScale:)(a1, v9, a3);
  objc_msgSend(v7, sel_displayScale);
  if (v11 <= 0.0)
  {
    if (qword_1F0167CF0 != -1)
      swift_once();
    v12 = *(double *)&qword_1F0167EE0;
  }
  else
  {
    objc_msgSend(v7, sel_displayScale);
  }
  CGFloat.rounded(_:toScale:)(a1, v12, a4);

  return v10;
}

double CGSize.minDimension.getter(double result, double a2)
{
  if (a2 < result)
    return a2;
  return result;
}

double CGSize.sizeByModifying(width:height:)(double a1, double a2, double a3)
{
  return a1 + a3;
}

CGSize __swiftcall CGSize.clamped(atMost:)(CGSize atMost)
{
  double v1;
  double v2;

  if (atMost.width >= v1)
    atMost.width = v1;
  if (atMost.height >= v2)
    atMost.height = v2;
  return atMost;
}

void sub_1D8212998(uint64_t a1)
{
  uint64_t v1;
  __int16 v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  sub_1D8212A6C(a1);
  if ((unsigned __int16)((unsigned __int16)(v3 + 9216) >> 10) >= 0x3Fu)
  {
    v4 = *(_QWORD *)(v1 + 16);
    v5 = __OFSUB__(v4, 1);
    v6 = v4 - 1;
    if (v5)
    {
      __break(1u);
    }
    else if (v6 > a1)
    {
      sub_1D8212A6C(a1 + 1);
    }
  }
}

void sub_1D8212A6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFRange v12;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v3 = *(_QWORD *)(v1 + 16);
    if (v3 > a1)
    {
      if (*(_QWORD *)(v1 + 24))
      {
        if (!__OFADD__(a1, *(_QWORD *)(v1 + 8)))
          return;
        __break(1u);
        goto LABEL_25;
      }
      v4 = *(_QWORD *)(v1 + 32);
      if (v4)
      {
        v5 = *(_QWORD *)(v1 + 8);
        v6 = __OFADD__(a1, v5);
        v7 = a1 + v5;
        if (v6)
        {
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
        if (*(char *)(v4 + v7) < 0)
        {
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
      }
      else
      {
        if (*(_QWORD *)(v1 + 56) <= a1 || (v8 = *(_QWORD *)(v1 + 48), v8 > a1))
        {
          v9 = 4;
          if (a1 > 4)
            v9 = a1;
          v8 = v9 - 4;
          *(_QWORD *)(v1 + 48) = v9 - 4;
          v6 = __OFADD__(v9, 2044);
          v10 = v9 + 2044;
          if (v6)
            goto LABEL_28;
          if (v3 >= v10)
            v3 = v10;
          *(_QWORD *)(v1 + 56) = v3;
          v11 = *(_QWORD *)(v1 + 8);
          if (__OFADD__(v11, v8))
            goto LABEL_29;
          if (__OFSUB__(v3, v8))
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
          v12.location = v11 + v8;
          v12.length = v3 - v8;
          CFStringGetCharacters(*(CFStringRef *)v1, v12, *(UniChar **)(v1 + 40));
        }
        if (!*(_QWORD *)(v1 + 40))
        {
LABEL_31:
          __break(1u);
          return;
        }
        if (__OFSUB__(a1, v8))
        {
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
      }
    }
  }
}

void sub_1D8212B7C(void *a1@<X0>, __CFString *a2@<X1>, uint64_t a3@<X2>, __CFString **a4@<X8>)
{
  __CFString *v7;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  __CFString *v11;
  CFStringEncoding v12;
  int64_t v13;

  v7 = a1;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  if (CharactersPtr)
  {

    CStringPtr = 0;
    v10 = 0;
LABEL_9:
    *a4 = v7;
    a4[1] = a2;
    a4[2] = (__CFString *)a3;
    a4[3] = (__CFString *)CharactersPtr;
    a4[4] = (__CFString *)CStringPtr;
    a4[5] = (__CFString *)v10;
    a4[6] = 0;
    a4[7] = 0;
    return;
  }
  v11 = v7;
  v12 = sub_1D82153A0();
  CStringPtr = CFStringGetCStringPtr(v11, v12);

  if (CStringPtr)
  {

    v10 = 0;
    goto LABEL_9;
  }
  v13 = 2048;
  if (a3 < 2048)
    v13 = a3;
  if (v13 >= (uint64_t)0xC000000000000000)
  {
    v10 = swift_slowAlloc();

    CStringPtr = 0;
    goto LABEL_9;
  }
  __break(1u);
}

char *WritingDirectionsCounts.__allocating_init(natural:leftToRight:rightToLeft:)(char *a1, uint64_t a2, unint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(a1, a2, a3);
}

uint64_t sub_1D8212C98()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1D8215A0C();
  qword_1F0168240 = result;
  *(_QWORD *)algn_1F0168248 = v1;
  return result;
}

uint64_t sub_1D8212CE4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1D8215A0C();
  qword_1F0168250 = result;
  *(_QWORD *)algn_1F0168258 = v1;
  return result;
}

uint64_t WritingDirectionsCounts.natural.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_natural);
}

uint64_t WritingDirectionsCounts.leftToRight.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight);
}

uint64_t WritingDirectionsCounts.rightToLeft.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
}

uint64_t WritingDirectionsCounts.total.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_total);
}

uint64_t WritingDirectionsCounts.significantValues.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_significantValues);
}

uint64_t WritingDirectionsCounts.hasStronglyTypedCounts.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts);
}

uint64_t WritingDirectionsCounts.isRTLEnough.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough);
}

uint64_t WritingDirectionsCounts.isRTLMinimal.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___AMPWritingDirectionsCounts_isRTLMinimal);
}

char *WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(char *result, uint64_t a2, unint64_t a3)
{
  _BYTE *v3;
  char *v4;
  BOOL v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  objc_super v10;

  *(_QWORD *)&v3[OBJC_IVAR___AMPWritingDirectionsCounts_natural] = result;
  *(_QWORD *)&v3[OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight] = a2;
  *(_QWORD *)&v3[OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft] = a3;
  v4 = &result[a2];
  if (__CFADD__(result, a2))
  {
    __break(1u);
    goto LABEL_14;
  }
  v5 = __CFADD__(v4, a3);
  v6 = &v4[a3];
  if (v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(_QWORD *)&v3[OBJC_IVAR___AMPWritingDirectionsCounts_total] = v6;
  v7 = result != 0;
  if (!a3)
  {
    if (a2)
      ++v7;
    *(_QWORD *)&v3[OBJC_IVAR___AMPWritingDirectionsCounts_significantValues] = v7;
    v3[OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts] = a2 != 0;
    v3[OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough] = 0;
    v3[OBJC_IVAR___AMPWritingDirectionsCounts_isRTLMinimal] = 0;
    goto LABEL_12;
  }
  if (a2)
    v8 = 2;
  else
    v8 = 1;
  *(_QWORD *)&v3[OBJC_IVAR___AMPWritingDirectionsCounts_significantValues] = v8 + v7;
  v3[OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts] = 1;
  if (!__CFADD__(a3, a2))
  {
    v9 = (float)a3 / (float)(a3 + a2);
    v3[OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough] = v9 >= 0.4;
    v3[OBJC_IVAR___AMPWritingDirectionsCounts_isRTLMinimal] = v9 >= 0.15;
LABEL_12:
    v10.receiver = v3;
    v10.super_class = (Class)type metadata accessor for WritingDirectionsCounts();
    return (char *)objc_msgSendSuper2(&v10, sel_init);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for WritingDirectionsCounts()
{
  return objc_opt_self();
}

char *WritingDirectionsCounts.__allocating_init(summing:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  void **v5;
  void *v6;
  void *v7;
  char *result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = 0;
  v3 = 0;
  v4 = 0;
  if (!v1)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    v13 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
    return WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(v4, v3, v2);
  }
  v5 = (void **)(a1 + 32);
  while (1)
  {
    v7 = *v5++;
    v6 = v7;
    if (!v7)
      goto LABEL_3;
    result = (char *)objc_msgSend(v6, sel_writingDirectionsQuantities);
    v9 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_natural];
    v10 = __CFADD__(v4, v9);
    v4 += v9;
    if (v10)
      break;
    v11 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight];
    v10 = __CFADD__(v3, v11);
    v3 += v11;
    if (v10)
      goto LABEL_12;
    v12 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft];

    v10 = __CFADD__(v2, v12);
    v2 += v12;
    if (v10)
    {
      __break(1u);
      goto LABEL_10;
    }
LABEL_3:
    if (!--v1)
      goto LABEL_10;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void WritingDirectionsCounts.__allocating_init(counting:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  void **v5;
  BOOL v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  int v10;
  id v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
  {
LABEL_14:
    v2 = 0;
    v3 = 0;
    v4 = 0;
LABEL_15:
    swift_bridgeObjectRelease();
    v11 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
    WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(v4, v3, v2);
    return;
  }
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = (void **)(a1 + 32);
  while (1)
  {
    v8 = *v5++;
    v7 = v8;
    if (!v8)
      goto LABEL_4;
    v9 = objc_msgSend(v7, sel_writingDirectionsQuantities);
    if ((v9[OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough] & 1) != 0)
      break;
    v10 = v9[OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts];

    if (v10 == 1)
    {
      v6 = __CFADD__(v3++, 1);
      if (v6)
        goto LABEL_17;
    }
    else
    {
      v6 = __CFADD__(v4++, 1);
      if (v6)
      {
        __break(1u);
        goto LABEL_14;
      }
    }
LABEL_4:
    if (!--v1)
      goto LABEL_15;
  }

  v6 = __CFADD__(v2++, 1);
  if (!v6)
    goto LABEL_4;
  __break(1u);
LABEL_17:
  __break(1u);
}

BOOL sub_1D82131B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v5;
  _BYTE v6[24];
  uint64_t v7;

  sub_1D820DBB0(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for WritingDirectionsCounts();
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v1 + OBJC_IVAR___AMPWritingDirectionsCounts_natural) == *(_QWORD *)&v5[OBJC_IVAR___AMPWritingDirectionsCounts_natural]
        && *(_QWORD *)(v1 + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight) == *(_QWORD *)&v5[OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight])
      {
        v2 = *(_QWORD *)(v1 + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
        v3 = *(_QWORD *)&v5[OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft];

        return v2 == v3;
      }

    }
  }
  else
  {
    sub_1D820DA2C((uint64_t)v6);
  }
  return 0;
}

BOOL == infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + OBJC_IVAR___AMPWritingDirectionsCounts_natural) == *(_QWORD *)(a2
                                                                                       + OBJC_IVAR___AMPWritingDirectionsCounts_natural)
      && *(_QWORD *)(a1 + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight) == *(_QWORD *)(a2
                                                                                           + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight)
      && *(_QWORD *)(a1 + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft) == *(_QWORD *)(a2
                                                                                           + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
}

char *+ infix(_:_:)(char *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;

  v2 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_natural];
  v3 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_natural);
  v4 = (char *)(v2 + v3);
  if (__CFADD__(v2, v3))
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight];
  v6 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight);
  v7 = v5 + v6;
  if (__CFADD__(v5, v6))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v8 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft];
  v9 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
  v10 = v8 + v9;
  if (!__CFADD__(v8, v9))
  {
    v11 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
    return WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(v4, v7, v10);
  }
LABEL_7:
  __break(1u);
  return result;
}

char *sub_1D8213424()
{
  id v0;
  char *result;

  v0 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
  result = WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(0, 0, 0);
  qword_1EDA1BCC8 = (uint64_t)result;
  return result;
}

id static WritingDirectionsCounts.zero.getter()
{
  if (qword_1EDA1C2B0 != -1)
    swift_once();
  return (id)qword_1EDA1BCC8;
}

uint64_t sub_1D8213534()
{
  uint64_t v0;
  _QWORD v2[2];

  strcpy((char *)v2, "Natural: ");
  sub_1D8215A0C();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  strcpy((char *)v2, "{ Counts: { ");
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D821597C();
  swift_bridgeObjectRelease();
  sub_1D8215A0C();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0 = v2[0];
  sub_1D821597C();
  swift_bridgeObjectRelease();
  sub_1D8215A0C();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D821597C();
  swift_bridgeObjectRelease();
  v2[0] = 0x45204C5452207349;
  v2[1] = 0xEF28206867756F6ELL;
  if (qword_1F0167D10 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D821597C();
  swift_bridgeObjectRelease();
  v2[0] = 0xD000000000000010;
  v2[1] = 0x80000001D821C150;
  if (qword_1F0167D18 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  sub_1D8215724();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1D8215724();
  swift_bridgeObjectRelease();
  return v0;
}

id WritingDirectionsCounts.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WritingDirectionsCounts.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WritingDirectionsCounts.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WritingDirectionsCounts();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void += infix(_:_:)(void **a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;

  v2 = (char *)*a1;
  v3 = *(_QWORD *)((char *)*a1 + OBJC_IVAR___AMPWritingDirectionsCounts_natural);
  v4 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_natural);
  v5 = (char *)(v3 + v4);
  if (__CFADD__(v3, v4))
  {
    __break(1u);
    goto LABEL_6;
  }
  v7 = *(_QWORD *)&v2[OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight];
  v8 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight);
  v9 = v7 + v8;
  if (__CFADD__(v7, v8))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = *(_QWORD *)&v2[OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft];

  v12 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
  v13 = v11 + v12;
  if (!__CFADD__(v11, v12))
  {
    v14 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
    *a1 = WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(v5, v9, v13);
    return;
  }
LABEL_7:
  __break(1u);
}

char *sub_1D8213B84(char *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;

  v2 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_natural];
  v3 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_natural);
  v4 = (char *)(v2 + v3);
  if (__CFADD__(v2, v3))
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight];
  v6 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight);
  v7 = v5 + v6;
  if (__CFADD__(v5, v6))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v8 = *(_QWORD *)&result[OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft];
  v9 = *(_QWORD *)(a2 + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
  v10 = v8 + v9;
  if (!__CFADD__(v8, v9))
  {
    v11 = objc_allocWithZone((Class)type metadata accessor for WritingDirectionsCounts());
    return WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)(v4, v7, v10);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t method lookup function for WritingDirectionsCounts()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WritingDirectionsCounts.__allocating_init(natural:leftToRight:rightToLeft:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of static WritingDirectionsCounts.add(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1D8213C34@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

id sub_1D8213C80(char *a1)
{
  char *v1;
  char v2;
  char *v3;

  v2 = *a1;
  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment];
  swift_beginAccess();
  *v3 = v2;
  return objc_msgSend(v1, sel_setNeedsLayout);
}

id (*sub_1D8213CE0(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D82074C4;
}

uint64_t sub_1D8213D28()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1D8213D6C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1D8213DB4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1D8213DF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t (*sub_1D8213E40())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1D8213E84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler);
  swift_beginAccess();
  v2 = *v1;
  sub_1D81E3020(*v1);
  return v2;
}

uint64_t sub_1D8213EDC(uint64_t a1, uint64_t a2)
{
  sub_1D821468C(a1, a2);
  return sub_1D81E2E70(a1);
}

void (*sub_1D8213F10(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler;
  v3[5] = v1;
  v3[6] = v4;
  v5 = (uint64_t *)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  v3[3] = *v5;
  v3[4] = v7;
  sub_1D81E3020(v6);
  return sub_1D8213F80;
}

void sub_1D8213F80(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 24);
  v4 = *(char **)(*a1 + 40);
  v5 = *(_QWORD *)(*a1 + 32);
  v6 = (uint64_t *)&v4[*(_QWORD *)(*a1 + 48)];
  if ((a2 & 1) != 0)
  {
    sub_1D81E3020(*(_QWORD *)(*a1 + 24));
    objc_msgSend(v4, sel_removeTarget_action_forControlEvents_, v4, sel_didTriggerPrimaryAction_, 0x2000);
    v7 = *v6;
    *v6 = v3;
    v6[1] = v5;
    sub_1D81E3020(v3);
    sub_1D81E2E70(v7);
    if (*v6)
      objc_msgSend(*(id *)(v2 + 40), sel_addTarget_action_forControlEvents_, *(_QWORD *)(v2 + 40), sel_didTriggerPrimaryAction_, 0x2000);
    sub_1D81E2E70(v3);
    v8 = *(_QWORD *)(v2 + 24);
  }
  else
  {
    objc_msgSend(*(id *)(*a1 + 40), sel_removeTarget_action_forControlEvents_, v4, sel_didTriggerPrimaryAction_, 0x2000);
    v9 = *v6;
    *v6 = v3;
    v6[1] = v5;
    sub_1D81E3020(v3);
    sub_1D81E2E70(v9);
    if (*v6)
      objc_msgSend(*(id *)(v2 + 40), sel_addTarget_action_forControlEvents_, *(_QWORD *)(v2 + 40), sel_didTriggerPrimaryAction_, 0x2000);
    v8 = v3;
  }
  sub_1D81E2E70(v8);
  free((void *)v2);
}

BOOL static Button.ImageAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Button.ImageAlignment.hash(into:)()
{
  return sub_1D8215AC0();
}

uint64_t Button.ImageAlignment.hashValue.getter()
{
  sub_1D8215AB4();
  sub_1D8215AC0();
  return sub_1D8215AE4();
}

BOOL sub_1D8214148(CGFloat a1, CGFloat a2)
{
  char *v2;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint v15;
  CGRect v16;

  v5 = (double *)&v2[OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin];
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  objc_msgSend(v2, sel_bounds);
  v16.origin.x = v10 - v7;
  v16.origin.y = v11 - v6;
  v16.size.width = v7 + v9 + v12;
  v16.size.height = v6 + v8 + v13;
  v15.x = a1;
  v15.y = a2;
  return CGRectContainsPoint(v16, v15);
}

uint64_t sub_1D82142AC@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1D81F67BC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_1D81E3020(v4);
}

uint64_t sub_1D8214340(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1D81F67BC;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1D81E3020(v1);
  sub_1D821468C((uint64_t)v4, v3);
  return sub_1D81E2E70((uint64_t)v4);
}

id Button.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id Button.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  _OWORD *v9;
  __int128 v10;
  _QWORD *v11;
  objc_class *v12;
  objc_super v14;

  v4[OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment] = 0;
  v4[OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment] = 0;
  v9 = &v4[OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin];
  v10 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v9 = *MEMORY[0x1E0DC49E8];
  v9[1] = v10;
  v11 = &v4[OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler];
  v12 = (objc_class *)type metadata accessor for Button();
  *v11 = 0;
  v11[1] = 0;
  v14.receiver = v4;
  v14.super_class = v12;
  return objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
}

id Button.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Button.init(coder:)(void *a1)
{
  _BYTE *v1;
  _OWORD *v3;
  __int128 v4;
  _QWORD *v5;
  objc_class *v6;
  id v7;
  objc_super v9;

  v1[OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment] = 0;
  v1[OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment] = 0;
  v3 = &v1[OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin];
  v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v3 = *MEMORY[0x1E0DC49E8];
  v3[1] = v4;
  v5 = &v1[OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler];
  v6 = (objc_class *)type metadata accessor for Button();
  *v5 = 0;
  v5[1] = 0;
  v9.receiver = v1;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id Button.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Button();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1D821468C(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t *v5;
  uint64_t v6;
  id result;

  objc_msgSend(v2, sel_removeTarget_action_forControlEvents_, v2, sel_didTriggerPrimaryAction_, 0x2000);
  v5 = (uint64_t *)&v2[OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler];
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  sub_1D81E3020(a1);
  result = (id)sub_1D81E2E70(v6);
  if (*v5)
    return objc_msgSend(v2, sel_addTarget_action_forControlEvents_, v2, sel_didTriggerPrimaryAction_, 0x2000);
  return result;
}

unint64_t sub_1D8214758()
{
  unint64_t result;

  result = qword_1F01682C0;
  if (!qword_1F01682C0)
  {
    result = MEMORY[0x1D82AAACC](&protocol conformance descriptor for Button.ImageAlignment, &type metadata for Button.ImageAlignment);
    atomic_store(result, (unint64_t *)&qword_1F01682C0);
  }
  return result;
}

uint64_t sub_1D821479C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment, a2);
}

id sub_1D82147A8(char *a1, void **a2)
{
  char v2;
  void *v3;
  _BYTE *v4;

  v2 = *a1;
  v3 = *a2;
  v4 = (char *)*a2 + OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment;
  swift_beginAccess();
  *v4 = v2;
  return objc_msgSend(v3, sel_setNeedsLayout);
}

uint64_t sub_1D821480C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment, a2);
}

uint64_t sub_1D8214818(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

__n128 sub_1D8214864@<Q0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1 + OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin;
  swift_beginAccess();
  result = *(__n128 *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

__n128 sub_1D82148B4(__n128 *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = *a2 + OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin;
  swift_beginAccess();
  result = v6;
  *(__n128 *)v4 = v6;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

uint64_t method lookup function for Button()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Button.imageAlignment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of Button.imageAlignment.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of Button.imageAlignment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of Button.imageWantsBaselineAlignment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of Button.imageWantsBaselineAlignment.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of Button.imageWantsBaselineAlignment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of Button.touchOutsideMargin.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of Button.touchOutsideMargin.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of Button.primaryActionHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of Button.primaryActionHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of Button.primaryActionHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t storeEnumTagSinglePayload for Button.ImageAlignment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D8214AAC + 4 * byte_1D8219D35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D8214AE0 + 4 * byte_1D8219D30[v4]))();
}

uint64_t sub_1D8214AE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D8214AE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D8214AF0);
  return result;
}

uint64_t sub_1D8214AFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D8214B04);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D8214B08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D8214B10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Button.ImageAlignment()
{
  return &type metadata for Button.ImageAlignment;
}

uint64_t sub_1D8214B2C()
{
  swift_release();
  return swift_deallocObject();
}

id static Animation.fadeInPropertyAnimator.getter()
{
  id v0;
  id v1;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC36D8]), sel_init);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F38]), sel_initWithDuration_timingParameters_, v0, 0.15);

  return v1;
}

uint64_t Animation.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Animation.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Animation()
{
  return objc_opt_self();
}

uint64_t method lookup function for Animation()
{
  return swift_lookUpClassMethod();
}

double CGSize.scaledIntegral(screenScale:)(double a1, double a2)
{
  return floor(a2);
}

double CGSize.integral.getter(double a1)
{
  return floor(a1);
}

id sub_1D8214C18(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1C510, (id *)&qword_1EDA1BD00);
}

id sub_1D8214C34(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1C2F0, (id *)&qword_1EDA1BCF0);
}

id sub_1D8214C50(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4)
{
  if (*a3 != -1)
    swift_once();
  return *a4;
}

id sub_1D8214C8C(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_systemBackgroundColor, &qword_1EDA1BAD8);
}

id static UIColor.componentBackground.getter()
{
  return sub_1D81D8054(&qword_1EDA1BBF8, (id *)&qword_1EDA1BAD8);
}

id sub_1D8214CBC(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BBF8, (id *)&qword_1EDA1BAD8);
}

id sub_1D8214CD8(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_1EDA1BC10);
}

id static UIColor.componentBackgroundStandout.getter()
{
  return sub_1D81D8054(&qword_1EDA1BB18, (id *)&qword_1EDA1BC10);
}

id sub_1D8214D08(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BB18, (id *)&qword_1EDA1BC10);
}

id sub_1D8214D24(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1C2B8, (id *)&qword_1EDA1BCF8);
}

id sub_1D8214D40(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_tertiarySystemBackgroundColor, &qword_1EDA1BAE8);
}

id static UIColor.placeholderBackgroundStandout.getter()
{
  return sub_1D81D8054(&qword_1EDA1BC30, (id *)&qword_1EDA1BAE8);
}

id sub_1D8214D70(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BC30, (id *)&qword_1EDA1BAE8);
}

id sub_1D8214D8C(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1C500, (id *)&qword_1EDA1BCE0);
}

id sub_1D8214DA8(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1C508, (id *)&qword_1EDA1BCE8);
}

id sub_1D8214DC4(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_tertiaryLabelColor, &qword_1EDA1BA50);
}

id static UIColor.tertiaryText.getter()
{
  return sub_1D81D8054(&qword_1EDA1BB28, (id *)&qword_1EDA1BA50);
}

id sub_1D8214DF4(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BB28, (id *)&qword_1EDA1BA50);
}

id sub_1D8214E10(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_quaternaryLabelColor, &qword_1EDA1BC88);
}

id static UIColor.quaternaryText.getter()
{
  return sub_1D81D8054(&qword_1EDA1BC90, (id *)&qword_1EDA1BC88);
}

id sub_1D8214E40(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BC90, (id *)&qword_1EDA1BC88);
}

id sub_1D8214E5C(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1C4F0, (id *)&qword_1EDA1BCD0);
}

id sub_1D8214E78(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_1EDA1BA68);
}

id static UIColor.defaultButtonBackgroundColor.getter()
{
  return sub_1D81D8054(&qword_1EDA1BC18, (id *)&qword_1EDA1BA68);
}

id sub_1D8214EA8(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BC18, (id *)&qword_1EDA1BA68);
}

uint64_t sub_1D8214EC4()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t result;

  sub_1D81DEF94();
  if (qword_1EDA1C510 != -1)
    swift_once();
  v0 = (void *)qword_1EDA1BD00;
  v1 = (void *)objc_opt_self();
  v2 = v0;
  v3 = objc_msgSend(v1, sel_whiteColor);
  v4 = v2;
  v5 = v3;
  result = sub_1D8215880();
  qword_1EDA1BA58 = result;
  return result;
}

id static UIColor.defaultButtonTitleColor.getter()
{
  return sub_1D81D8054(&qword_1EDA1BC00, (id *)&qword_1EDA1BA58);
}

id sub_1D8214F98(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BC00, (id *)&qword_1EDA1BA58);
}

id sub_1D8214FB4(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1C4F8, (id *)&qword_1EDA1BCD8);
}

id sub_1D8214FD0(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_1F01682C8);
}

id static UIColor.reviewBackground.getter()
{
  return sub_1D81D8054(&qword_1F0167D20, (id *)&qword_1F01682C8);
}

id sub_1D8215000(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1F0167D20, (id *)&qword_1F01682C8);
}

id sub_1D821501C(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_systemGroupedBackgroundColor, &qword_1F01682D0);
}

id static UIColor.tableViewBackground.getter()
{
  return sub_1D81D8054(&qword_1F0167D28, (id *)&qword_1F01682D0);
}

id sub_1D821504C(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1F0167D28, (id *)&qword_1F01682D0);
}

id sub_1D8215068(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_secondarySystemGroupedBackgroundColor, &qword_1F01682D8);
}

id static UIColor.tableViewCellBackground.getter()
{
  return sub_1D81D8054(&qword_1F0167D30, (id *)&qword_1F01682D8);
}

id sub_1D8215098(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1F0167D30, (id *)&qword_1F01682D8);
}

id sub_1D82150B4(uint64_t a1)
{
  return sub_1D81D7514(a1, (SEL *)&selRef_systemGray4Color, &qword_1EDA1BA70);
}

id static UIColor.tableViewCellSelectedBackground.getter()
{
  return sub_1D81D8054(&qword_1EDA1BB20, (id *)&qword_1EDA1BA70);
}

id sub_1D82150E4(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BB20, (id *)&qword_1EDA1BA70);
}

id sub_1D8215100()
{
  if (qword_1EDA1BB28 != -1)
    swift_once();
  qword_1EDA1BAE0 = qword_1EDA1BA50;
  return (id)qword_1EDA1BA50;
}

id static UIColor.tableViewCellChevron.getter()
{
  return sub_1D81D8054(&qword_1EDA1BB00, (id *)&qword_1EDA1BAE0);
}

id sub_1D8215164(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BB00, (id *)&qword_1EDA1BAE0);
}

id sub_1D8215180()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 1.0, 0.82);
  qword_1EDA1BAD0 = (uint64_t)result;
  return result;
}

id static UIColor.lightNavigationBarBlurTint.getter()
{
  return sub_1D81D8054(&qword_1EDA1BB10, (id *)&qword_1EDA1BAD0);
}

id sub_1D82151D8(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BB10, (id *)&qword_1EDA1BAD0);
}

id sub_1D82151F4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, 0.0, 0.82);
  qword_1EDA1BCA8 = (uint64_t)result;
  return result;
}

id static UIColor.darkNavigationBarBlurTint.getter()
{
  return sub_1D81D8054(&qword_1EDA1BB08, (id *)&qword_1EDA1BCA8);
}

id sub_1D821524C(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BB08, (id *)&qword_1EDA1BCA8);
}

id sub_1D8215268(uint64_t a1, uint64_t a2)
{
  return sub_1D8214C50(a1, a2, &qword_1EDA1BC08, (id *)&qword_1EDA1BA60);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1D82152A4()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1D82152B0()
{
  return MEMORY[0x1E0CADEB8]();
}

uint64_t sub_1D82152BC()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1D82152C8()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t sub_1D82152D4()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1D82152E0()
{
  return MEMORY[0x1E0CADF18]();
}

uint64_t sub_1D82152EC()
{
  return MEMORY[0x1E0CADF20]();
}

uint64_t sub_1D82152F8()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1D8215304()
{
  return MEMORY[0x1E0CAE398]();
}

uint64_t sub_1D8215310()
{
  return MEMORY[0x1E0CAE3C0]();
}

uint64_t sub_1D821531C()
{
  return MEMORY[0x1E0CAE3F8]();
}

uint64_t sub_1D8215328()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1D8215334()
{
  return MEMORY[0x1E0D41888]();
}

uint64_t sub_1D8215340()
{
  return MEMORY[0x1E0CAE440]();
}

uint64_t sub_1D821534C()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1D8215358()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1D8215364()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1D8215370()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1D821537C()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1D8215388()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1D8215394()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1D82153A0()
{
  return MEMORY[0x1E0CAF998]();
}

uint64_t sub_1D82153AC()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1D82153B8()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1D82153C4()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_1D82153D0()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1D82153DC()
{
  return MEMORY[0x1E0D3F0D0]();
}

uint64_t sub_1D82153E8()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D82153F4()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1D8215400()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1D821540C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D8215418()
{
  return MEMORY[0x1E0CB0A00]();
}

uint64_t sub_1D8215424()
{
  return MEMORY[0x1E0D418C0]();
}

uint64_t sub_1D8215430()
{
  return MEMORY[0x1E0D41A00]();
}

uint64_t sub_1D821543C()
{
  return MEMORY[0x1E0D41A28]();
}

uint64_t _sSo6CGSizeV11AppStoreKitE11aspectRatio5JetUI06AspectF0Vvg_0()
{
  return MEMORY[0x1E0D41A40]();
}

uint64_t sub_1D8215454()
{
  return MEMORY[0x1E0D41A70]();
}

uint64_t sub_1D8215460()
{
  return MEMORY[0x1E0D41AB8]();
}

uint64_t sub_1D821546C()
{
  return MEMORY[0x1E0D41CC8]();
}

uint64_t sub_1D8215478()
{
  return MEMORY[0x1E0DC1DF8]();
}

uint64_t sub_1D8215484()
{
  return MEMORY[0x1E0DC1F58]();
}

uint64_t sub_1D8215490()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1D821549C()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1D82154A8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D82154B4()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D82154C0()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D82154CC()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1D82154D8()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1D82154E4()
{
  return MEMORY[0x1E0D3F458]();
}

uint64_t sub_1D82154F0()
{
  return MEMORY[0x1E0D3F478]();
}

uint64_t sub_1D82154FC()
{
  return MEMORY[0x1E0D3F480]();
}

uint64_t sub_1D8215508()
{
  return MEMORY[0x1E0D3F490]();
}

uint64_t sub_1D8215514()
{
  return MEMORY[0x1E0D3F4D0]();
}

uint64_t sub_1D8215520()
{
  return MEMORY[0x1E0D3F4D8]();
}

uint64_t sub_1D821552C()
{
  return MEMORY[0x1E0D3F4E8]();
}

uint64_t sub_1D8215538()
{
  return MEMORY[0x1E0D3F500]();
}

uint64_t sub_1D8215544()
{
  return MEMORY[0x1E0D3F518]();
}

uint64_t sub_1D8215550()
{
  return MEMORY[0x1E0D3F528]();
}

uint64_t sub_1D821555C()
{
  return MEMORY[0x1E0D3F538]();
}

uint64_t sub_1D8215568()
{
  return MEMORY[0x1E0D3F580]();
}

uint64_t sub_1D8215574()
{
  return MEMORY[0x1E0D3F598]();
}

uint64_t sub_1D8215580()
{
  return MEMORY[0x1E0D3F5A0]();
}

uint64_t sub_1D821558C()
{
  return MEMORY[0x1E0D3F660]();
}

uint64_t sub_1D8215598()
{
  return MEMORY[0x1E0D3FB30]();
}

uint64_t sub_1D82155A4()
{
  return MEMORY[0x1E0D40140]();
}

uint64_t sub_1D82155B0()
{
  return MEMORY[0x1E0D401F0]();
}

uint64_t sub_1D82155BC()
{
  return MEMORY[0x1E0D40A78]();
}

uint64_t sub_1D82155C8()
{
  return MEMORY[0x1E0D40A80]();
}

uint64_t sub_1D82155D4()
{
  return MEMORY[0x1E0D40BB0]();
}

uint64_t sub_1D82155E0()
{
  return MEMORY[0x1E0D40BD8]();
}

uint64_t sub_1D82155EC()
{
  return MEMORY[0x1E0D40C18]();
}

uint64_t sub_1D82155F8()
{
  return MEMORY[0x1E0D40C20]();
}

uint64_t sub_1D8215604()
{
  return MEMORY[0x1E0D41018]();
}

uint64_t sub_1D8215610()
{
  return MEMORY[0x1E0D41020]();
}

uint64_t sub_1D821561C()
{
  return MEMORY[0x1E0D41028]();
}

uint64_t sub_1D8215628()
{
  return MEMORY[0x1E0D41030]();
}

uint64_t sub_1D8215634()
{
  return MEMORY[0x1E0D413D0]();
}

uint64_t sub_1D8215640()
{
  return MEMORY[0x1E0D413D8]();
}

uint64_t sub_1D821564C()
{
  return MEMORY[0x1E0D413E0]();
}

uint64_t sub_1D8215658()
{
  return MEMORY[0x1E0D413F0]();
}

uint64_t sub_1D8215664()
{
  return MEMORY[0x1E0D41500]();
}

uint64_t sub_1D8215670()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D821567C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D8215688()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1D8215694()
{
  return MEMORY[0x1E0DEA518]();
}

uint64_t sub_1D82156A0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D82156AC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D82156B8()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1D82156C4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1D82156D0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D82156DC()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1D82156E8()
{
  return MEMORY[0x1E0DEA6A0]();
}

uint64_t sub_1D82156F4()
{
  return MEMORY[0x1E0DEA6A8]();
}

uint64_t sub_1D8215700()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1D821570C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D8215718()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1D8215724()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D8215730()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1D821573C()
{
  return MEMORY[0x1E0DEA8C0]();
}

uint64_t sub_1D8215748()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_1D8215754()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1D8215760()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1D821576C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D8215778()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D8215784()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D8215790()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1D821579C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1D82157A8()
{
  return MEMORY[0x1E0D41680]();
}

uint64_t sub_1D82157B4()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1D82157C0()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1D82157CC()
{
  return MEMORY[0x1E0DEAFF8]();
}

uint64_t sub_1D82157D8()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1D82157E4()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1D82157F0()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1D82157FC()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1D8215808()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1D8215814()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1D8215820()
{
  return MEMORY[0x1E0D42618]();
}

uint64_t sub_1D821582C()
{
  return MEMORY[0x1E0D42630]();
}

uint64_t sub_1D8215838()
{
  return MEMORY[0x1E0DC2C28]();
}

uint64_t sub_1D8215844()
{
  return MEMORY[0x1E0D42640]();
}

uint64_t sub_1D8215850()
{
  return MEMORY[0x1E0D42648]();
}

uint64_t sub_1D821585C()
{
  return MEMORY[0x1E0D42678]();
}

uint64_t sub_1D8215868()
{
  return MEMORY[0x1E0D42680]();
}

uint64_t sub_1D8215874()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1D8215880()
{
  return MEMORY[0x1E0D426B0]();
}

uint64_t sub_1D821588C()
{
  return MEMORY[0x1E0D426B8]();
}

uint64_t sub_1D8215898()
{
  return MEMORY[0x1E0DC2FE8]();
}

uint64_t sub_1D82158A4()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D82158B0()
{
  return MEMORY[0x1E0CB2168]();
}

uint64_t sub_1D82158BC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D82158C8()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_1D82158D4()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1D82158E0()
{
  return MEMORY[0x1E0CB2490]();
}

uint64_t sub_1D82158EC()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1D82158F8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D8215904()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1D8215910()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1D821591C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1D8215928()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D8215934()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D8215940()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D821594C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1D8215958()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1D8215964()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_1D8215970()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1D821597C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D8215988()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1D8215994()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D82159A0()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_1D82159AC()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1D82159B8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D82159C4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1D82159D0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1D82159DC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1D82159E8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D82159F4()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1D8215A00()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1D8215A0C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D8215A18()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1D8215A24()
{
  return MEMORY[0x1E0DED560]();
}

uint64_t sub_1D8215A30()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1D8215A3C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D8215A48()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1D8215A54()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1D8215A60()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1D8215A6C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1D8215A78()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D8215A84()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D8215A90()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D8215A9C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D8215AA8()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1D8215AB4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D8215AC0()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D8215ACC()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1D8215AD8()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1D8215AE4()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1D8215AF0()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1D8215AFC()
{
  return MEMORY[0x1E0DEE978]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode)
{
  return MEMORY[0x1E0C987E0](isoLangCode);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _MGCopyAnswerWithMode()
{
  return MEMORY[0x1E0DE2C98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85510](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1E0C855A0](__s1, __s2, __n);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x1E0DE5960](*(_QWORD *)&c);
}

uint64_t u_getDataVersion()
{
  return MEMORY[0x1E0DE59B0]();
}

int32_t u_getIntPropertyMaxValue(UProperty which)
{
  return MEMORY[0x1E0DE59B8](*(_QWORD *)&which);
}

uint64_t uenum_close()
{
  return MEMORY[0x1E0DE6240]();
}

uint64_t uenum_count()
{
  return MEMORY[0x1E0DE6248]();
}

uint64_t uenum_next()
{
  return MEMORY[0x1E0DE6250]();
}

uint64_t uloc_getCountry()
{
  return MEMORY[0x1E0DE63C0]();
}

uint64_t uloc_getISO3Country()
{
  return MEMORY[0x1E0DE6400]();
}

uint64_t uloc_getISO3Language()
{
  return MEMORY[0x1E0DE6408]();
}

uint64_t uloc_getLanguage()
{
  return MEMORY[0x1E0DE6430]();
}

uint64_t unum_close()
{
  return MEMORY[0x1E0DE6530]();
}

uint64_t unum_formatDecimal()
{
  return MEMORY[0x1E0DE6540]();
}

uint64_t unum_getAttribute()
{
  return MEMORY[0x1E0DE6568]();
}

uint64_t unum_open()
{
  return MEMORY[0x1E0DE6598]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x1E0DE65C8]();
}

uint64_t unum_setContext()
{
  return MEMORY[0x1E0DE65D0]();
}

uint64_t unum_toPattern()
{
  return MEMORY[0x1E0DE65F0]();
}

uint64_t unumsys_close()
{
  return MEMORY[0x1E0DE6678]();
}

uint64_t unumsys_getDescription()
{
  return MEMORY[0x1E0DE6680]();
}

uint64_t unumsys_getRadix()
{
  return MEMORY[0x1E0DE6690]();
}

uint64_t unumsys_isAlgorithmic()
{
  return MEMORY[0x1E0DE6698]();
}

uint64_t unumsys_openAvailableNames()
{
  return MEMORY[0x1E0DE66A8]();
}

uint64_t unumsys_openByName()
{
  return MEMORY[0x1E0DE66B0]();
}

uint64_t uregion_getAvailable()
{
  return MEMORY[0x1E0DE67E8]();
}

uint64_t ures_close()
{
  return MEMORY[0x1E0DE6838]();
}

uint64_t ures_getByKey()
{
  return MEMORY[0x1E0DE6840]();
}

uint64_t ures_getByKeyWithFallback()
{
  return MEMORY[0x1E0DE6848]();
}

uint64_t ures_getKey()
{
  return MEMORY[0x1E0DE6850]();
}

uint64_t ures_getNextResource()
{
  return MEMORY[0x1E0DE6858]();
}

uint64_t ures_getString()
{
  return MEMORY[0x1E0DE6860]();
}

uint64_t ures_getType()
{
  return MEMORY[0x1E0DE6870]();
}

uint64_t ures_open()
{
  return MEMORY[0x1E0DE6878]();
}

uint64_t uscript_getShortName()
{
  return MEMORY[0x1E0DE68A8]();
}

