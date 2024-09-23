double Look.GradientOptions.init()@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 1.0;
  *a1 = xmmword_223137710;
  return result;
}

double Look.GradientOptions.backlightProgress.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void Look.GradientOptions.backlightProgress.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*Look.GradientOptions.backlightProgress.modify())()
{
  return nullsub_1;
}

double Look.GradientOptions.unlockProgress.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void Look.GradientOptions.unlockProgress.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*Look.GradientOptions.unlockProgress.modify())()
{
  return nullsub_1;
}

void sub_22312F704()
{
  __asm { BR              X10 }
}

uint64_t sub_22312F738()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_223137720;
  v1 = *MEMORY[0x24BDE5D28];
  v2 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 32) = objc_msgSend(v2, sel_functionWithName_, v1);
  *(_QWORD *)(v0 + 40) = objc_msgSend(v2, sel_functionWithName_, *MEMORY[0x24BDE5D18]);
  sub_223137204();
  return v0;
}

uint64_t sub_22312F944()
{
  char *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v9;

  v1 = (uint64_t)*(&off_24EC19548 + *v0);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_223136780(0, v2, 0);
    v4 = 0;
    v3 = v9;
    v5 = *(_QWORD *)(v9 + 16);
    do
    {
      v6 = *(double *)(v1 + 8 * v4 + 32);
      v7 = *(_QWORD *)(v9 + 24);
      if (v5 >= v7 >> 1)
        sub_223136780((char *)(v7 > 1), v5 + 1, 1);
      ++v4;
      *(_QWORD *)(v9 + 16) = v5 + 1;
      *(double *)(v9 + 8 * v5++ + 32) = v6 + (0.5 - v6) * 0.0;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
  }
  return v3;
}

GradientPoster::Look::Variant_optional __swiftcall Look.Variant.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  GradientPoster::Look::Variant_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2231372B8();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static Look.Variant.allCases.getter()
{
  return &unk_24EC18B78;
}

unint64_t Look.Variant.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((unint64_t)*v0 << 48) + 0x31746573657270;
}

uint64_t sub_22312FAD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22312FADC(*a1, *a2);
}

uint64_t sub_22312FADC(unsigned __int8 a1, unsigned __int8 a2)
{
  char v2;

  if ((unint64_t)a1 << 48 == (unint64_t)a2 << 48)
    v2 = 1;
  else
    v2 = sub_2231372C4();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_22312FB50()
{
  return sub_22312FB58();
}

uint64_t sub_22312FB58()
{
  sub_2231372D0();
  sub_2231371E0();
  swift_bridgeObjectRelease();
  return sub_2231372E8();
}

uint64_t sub_22312FBBC()
{
  sub_2231371E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22312FBF0()
{
  return sub_22312FBF8();
}

uint64_t sub_22312FBF8()
{
  sub_2231372D0();
  sub_2231371E0();
  swift_bridgeObjectRelease();
  return sub_2231372E8();
}

GradientPoster::Look::Variant_optional sub_22312FC58(Swift::String *a1)
{
  return Look.Variant.init(rawValue:)(*a1);
}

void sub_22312FC64(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = ((unint64_t)*v1 << 48) + 0x31746573657270;
  a1[1] = 0xE700000000000000;
}

void sub_22312FC88(_QWORD *a1@<X8>)
{
  *a1 = &unk_24EC18B78;
}

id Look.baseColor.getter()
{
  id *v0;

  return *v0;
}

void Look.variant.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

void static Look.load(userInfo:bundle:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6;
  char v7;
  Swift::String v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  id v12;
  unint64_t v13;
  char v14;
  id v15;
  void *v16;
  _BYTE v17[40];
  __int128 v18;
  __int128 v19;

  sub_223137240();
  if (*(_QWORD *)(a1 + 16) && (v6 = sub_223130AA4((uint64_t)v17), (v7 & 1) != 0))
  {
    sub_223130ECC(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_223130AD4((uint64_t)v17);
  if (!*((_QWORD *)&v19 + 1))
  {
    sub_223130B08((uint64_t)&v18);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    LOBYTE(v9) = 0;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = 0x746E6169726176;
  v8._object = (void *)0xE700000000000000;
  Look.Variant.init(rawValue:)(v8);
  LOBYTE(v9) = v17[0];
  if (v17[0] == 6)
    v9 = 0x40302010005uLL >> (8 * sub_223130E84());
  else
    swift_bridgeObjectRelease();
LABEL_11:
  sub_223137240();
  if (*(_QWORD *)(a1 + 16) && (v10 = sub_223130AA4((uint64_t)v17), (v11 & 1) != 0))
  {
    sub_223130ECC(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_223130AD4((uint64_t)v17);
  if (*((_QWORD *)&v19 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2A98);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = _sSo7UIColorC14GradientPosterE4load8userInfoABSgSDys11AnyHashableVypG_tFZ_0(0x6F6C6F4365736162);
      swift_bridgeObjectRelease();
      if (!v12)
        goto LABEL_30;
      goto LABEL_31;
    }
  }
  else
  {
    sub_223130B08((uint64_t)&v18);
  }
  sub_223137240();
  if (*(_QWORD *)(a1 + 16) && (v13 = sub_223130AA4((uint64_t)v17), (v14 & 1) != 0))
  {
    sub_223130ECC(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_223130AD4((uint64_t)v17);
  if (*((_QWORD *)&v19 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v15 = a2;
      v16 = (void *)sub_2231371C8();
      swift_bridgeObjectRelease();
      v12 = objc_msgSend((id)objc_opt_self(), sel_colorNamed_inBundle_compatibleWithTraitCollection_, v16, v15, 0);

      if (v12)
        goto LABEL_31;
    }
  }
  else
  {
    sub_223130B08((uint64_t)&v18);
  }
  v12 = _sSo7UIColorC14GradientPosterE4load8userInfoABSgSDys11AnyHashableVypG_tFZ_0(a1);
  if (!v12)
  {
LABEL_30:
    v12 = 0;
    LOBYTE(v9) = 0;
  }
LABEL_31:
  *(_QWORD *)a3 = v12;
  *(_BYTE *)(a3 + 8) = v9;
}

GradientPoster::Look __swiftcall Look.init(baseColor:variant:)(UIColor baseColor, GradientPoster::Look::Variant variant)
{
  uint64_t v2;
  char v3;
  GradientPoster::Look result;

  v3 = *(_BYTE *)variant;
  *(UIColor *)v2 = baseColor;
  *(_BYTE *)(v2 + 8) = v3;
  result.baseColor = baseColor;
  result.variant = variant;
  return result;
}

unint64_t Look.userInfo.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  unint64_t v4;

  v1 = *(unsigned __int8 *)(v0 + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B90);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_223137730;
  v3 = MEMORY[0x24BEE0D00];
  sub_223137240();
  v4 = UIColor.userInfo.getter();
  *(_QWORD *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2A98);
  *(_QWORD *)(inited + 72) = v4;
  sub_223137240();
  *(_QWORD *)(inited + 168) = v3;
  *(_QWORD *)(inited + 144) = (v1 << 48) + 0x31746573657270;
  *(_QWORD *)(inited + 152) = 0xE700000000000000;
  return sub_223130100(inited);
}

unint64_t sub_223130100(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B80);
  v2 = sub_2231372AC();
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
    sub_22313136C(v6, (uint64_t)v15);
    result = sub_223130AA4((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_2231313B4(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

id Look.upperColor.getter()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64_t v13;
  double v14;
  double v15;
  double v16;
  id v17;
  float64x2_t v19;

  v0 = sub_22313161C(1.0);
  sub_223131744();
  v1 = swift_bridgeObjectRetain();
  sub_223130C4C(v1, (uint64_t)&unk_24EC19088, (double (*)(uint64_t, double, double))sub_223131474);
  v3 = v2;
  swift_bridgeObjectRelease();
  v4 = (_QWORD *)sub_2231324AC(v3);
  swift_bridgeObjectRelease();
  sub_2231317EC(v4);
  v19 = v5;
  swift_bridgeObjectRelease();
  v6.f64[0] = sub_223130930((float64x2_t)0, 0.0, v19);
  v7 = v6;
  __asm { FMOV            V0.2D, #1.0 }
  v13 = sub_2231309E4(_Q0, _Q0.f64[0], v7);
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v13, v14, v15, v16);

  return v17;
}

void Look.gradientIn(bounds:options:)(double *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(v1 + 8);
  sub_22313161C(*a1);
  sub_223131744();
  __asm { BR              X9 }
}

uint64_t sub_2231303D4()
{
  uint64_t v0;
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  char v6;
  __int128 v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  long double v11;
  long double v12;
  __int128 v13;
  _QWORD *v14;
  __int128 v15;
  __int128 v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  float64x2_t v35;
  float64x2_t v36;
  __int128 v42;
  __int128 v43;
  float64x2_t v44;
  __int128 v45;
  __int128 v46;
  float64x2_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t result;

  v6 = sub_2231372C4();
  swift_bridgeObjectRelease();
  v7 = *(_OWORD *)(v4 - 176);
  *(_OWORD *)(v4 - 224) = *(_OWORD *)(v4 - 192);
  *(_OWORD *)(v4 - 208) = v7;
  if ((v6 & 1) == 0)
  {
    if (qword_2540B2A88 != -1)
      swift_once();
    v8 = (_QWORD *)swift_bridgeObjectRetain();
    sub_2231317EC(v8);
    *(_OWORD *)(v4 - 224) = v10;
    *(_OWORD *)(v4 - 208) = v9;
    swift_bridgeObjectRelease();
    v11 = pow(*(long double *)(v4 - 208), 10.0) * 0.1;
    v12 = pow(1.0 - *(double *)(v4 - 208), 10.0);
    v13 = *(_OWORD *)(v4 - 208);
    *(double *)&v13 = *(double *)&v13 + v12 * 0.1 - v11;
    *(_OWORD *)(v4 - 208) = v13;
    if (qword_2540B2A90 != -1)
      swift_once();
    v14 = (_QWORD *)swift_bridgeObjectRetain();
    sub_2231317EC(v14);
    *(_OWORD *)(v4 - 224) = v16;
    *(_OWORD *)(v4 - 208) = v15;
    swift_bridgeObjectRelease();
  }
  v17 = 1.0 - v5;
  if (v5 < 0.5)
    v17 = v5;
  v18 = v17 + v17;
  v19 = (uint64_t)*(&off_24EC19548 + v3);
  *(_BYTE *)(v4 - 160) = v2;
  swift_bridgeObjectRetain();
  v20 = sub_22312F944();
  MEMORY[0x24BDAC7A8]();
  sub_223130C4C(v19, v20, (double (*)(uint64_t, double, double))sub_223130F08);
  v22 = v21;
  swift_bridgeObjectRelease();
  v23 = swift_bridgeObjectRelease();
  if (v18 <= 1.0)
    v24.n128_f64[0] = v18 * (v18 * v18) * (v18 * (v18 * 6.0 + -15.0) + 10.0);
  else
    v24.n128_f64[0] = 1.0;
  if (v18 < 0.0)
    v24.n128_f64[0] = 0.0;
  MEMORY[0x24BDAC7A8](v23, v24);
  v25 = swift_bridgeObjectRetain();
  sub_223130C4C(v25, (uint64_t)&unk_24EC190C0, (double (*)(uint64_t, double, double))sub_223131474);
  v27 = v26;
  swift_bridgeObjectRelease();
  v28 = (_QWORD *)sub_2231324AC(v22);
  swift_bridgeObjectRelease();
  v29 = (_QWORD *)sub_2231324AC(v27);
  swift_bridgeObjectRelease();
  sub_2231317EC(v29);
  *(_OWORD *)(v4 - 256) = v30;
  *(_OWORD *)(v4 - 272) = v31;
  swift_bridgeObjectRelease();
  sub_2231317EC(v28);
  *(_OWORD *)(v4 - 192) = v32;
  *(_OWORD *)(v4 - 240) = v33;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_223137740;
  v35.f64[0] = sub_223130930((float64x2_t)0, 0.0, *(float64x2_t *)(v4 - 256));
  v36 = v35;
  __asm { FMOV            V0.2D, #1.0 }
  *(float64x2_t *)(v4 - 176) = _Q0;
  *(double *)&v42 = sub_2231309E4(_Q0, _Q0.f64[0], v36);
  *(_OWORD *)(v4 - 272) = v42;
  *(_OWORD *)(v4 - 256) = v43;
  *(_QWORD *)(v34 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, *(double *)(v4 - 272), *((double *)&v42 + 1), *(double *)(v4 - 256), *((double *)&v43 + 1));
  v44.f64[0] = sub_223130930((float64x2_t)0, 0.0, *(float64x2_t *)(v4 - 208));
  *(double *)&v45 = sub_2231309E4(*(float64x2_t *)(v4 - 176), *(double *)(v4 - 176), v44);
  *(_OWORD *)(v4 - 224) = v45;
  *(_OWORD *)(v4 - 208) = v46;
  *(_QWORD *)(v34 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, *(double *)(v4 - 224), *((double *)&v45 + 1), *(double *)(v4 - 208), *((double *)&v46 + 1));
  v47.f64[0] = sub_223130930((float64x2_t)0, 0.0, *(float64x2_t *)(v4 - 192));
  *(double *)&v48 = sub_2231309E4(*(float64x2_t *)(v4 - 176), *(double *)(v4 - 176), v47);
  *(_OWORD *)(v4 - 192) = v48;
  *(_OWORD *)(v4 - 176) = v49;
  *(_QWORD *)(v34 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, *(double *)(v4 - 192), *((double *)&v48 + 1), *(double *)(v4 - 176), *((double *)&v49 + 1));
  *(_QWORD *)(v4 - 160) = v34;
  sub_223137204();
  sub_22313476C(*(_QWORD *)(v4 - 160), v0);
  *(_OWORD *)(v0 + 24) = xmmword_223137750;
  *(_OWORD *)(v0 + 40) = xmmword_223137760;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD0);
  v50 = swift_allocObject();
  v51 = v50;
  *(_OWORD *)(v50 + 16) = xmmword_223137770;
  *(_QWORD *)(v50 + 32) = 0;
  v52 = 0.33;
  if (v2 != 2)
    v52 = 0.5;
  *(double *)(v50 + 40) = v52;
  *(_QWORD *)(v50 + 48) = 0x3FF0000000000000;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 16) = v51;
  *(_BYTE *)(v4 - 160) = v2;
  sub_22312F704();
  v54 = v53;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 64) = v54;
  return result;
}

BOOL sub_223130900(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_223130914@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_223130924(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

float64_t sub_223130930(float64x2_t a1, double a2, float64x2_t a3)
{
  double v3;
  unsigned __int8 v4;

  v3 = a1.f64[0];
  v4 = vmovn_s64(vcgtq_f64(a1, a3)).u8[0];
  if ((*(_QWORD *)&a3.f64[0] & 0xFFFFFFFFFFFFFLL) == 0)
    a1.f64[0] = a3.f64[0];
  if ((~*(_QWORD *)&a3.f64[0] & 0x7FF0000000000000) != 0)
    a1.f64[0] = a3.f64[0];
  if ((v4 & 1) != 0)
    a1.f64[0] = v3;
  return a1.f64[0];
}

float64_t sub_2231309E4(float64x2_t a1, double a2, float64x2_t a3)
{
  double v3;
  unsigned __int8 v4;

  v3 = a1.f64[0];
  v4 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(a3, a1))).u8[0];
  if ((*(_QWORD *)&a3.f64[0] & 0xFFFFFFFFFFFFFLL) == 0)
    a1.f64[0] = a3.f64[0];
  if ((~*(_QWORD *)&a3.f64[0] & 0x7FF0000000000000) != 0)
    a1.f64[0] = a3.f64[0];
  if ((v4 & 1) == 0)
    a1.f64[0] = v3;
  return a1.f64[0];
}

unint64_t sub_223130AA4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_223137228();
  return sub_223130B88(a1, v2);
}

uint64_t sub_223130AD4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_223130B08(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255788040);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227683880]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_223130B88(uint64_t a1, uint64_t a2)
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
      sub_2231313C4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2276834CC](v9, a1);
      sub_223130AD4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_223130C4C(uint64_t a1, uint64_t a2, double (*a3)(uint64_t, double, double))
{
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  double *v9;
  double *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v33;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a2 + 16);
  if (v6 >= v5)
    v7 = *(_QWORD *)(a1 + 16);
  else
    v7 = *(_QWORD *)(a2 + 16);
  v33 = MEMORY[0x24BEE4AF8];
  sub_223136780(0, v7, 0);
  v27 = v6;
  v29 = a2;
  v30 = a1;
  v28 = v5;
  v26 = v7;
  if (v7)
  {
    v8 = v5;
    v9 = (double *)(a1 + 32);
    v10 = (double *)(a2 + 32);
    swift_bridgeObjectRetain();
    v11 = swift_bridgeObjectRetain();
    v12 = v6;
    v13 = v8;
    while (v13)
    {
      if (!v12)
        goto LABEL_26;
      v14 = a3(v11, *v9, *v10);
      v16 = *(_QWORD *)(v33 + 16);
      v15 = *(_QWORD *)(v33 + 24);
      if (v16 >= v15 >> 1)
        v11 = (uint64_t)sub_223136780((char *)(v15 > 1), v16 + 1, 1);
      --v12;
      *(_QWORD *)(v33 + 16) = v16 + 1;
      *(double *)(v33 + 8 * v16 + 32) = v14;
      --v13;
      ++v10;
      ++v9;
      if (!--v7)
        goto LABEL_13;
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = swift_bridgeObjectRetain();
LABEL_13:
    if (v28 <= v27)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    v17 = 0;
    if (v26 <= v27)
      v18 = v27;
    else
      v18 = v26;
    v31 = v18 - v26;
    v19 = v28 - v26;
    v20 = 8 * v26 + 32;
    v21 = v30 + v20;
    v22 = v29 + v20;
    while (v19 != v17)
    {
      if (v27 - v26 == v17)
        goto LABEL_24;
      if (v31 == v17)
        goto LABEL_28;
      v23 = a3(v11, *(double *)(v21 + 8 * v17), *(double *)(v22 + 8 * v17));
      v25 = *(_QWORD *)(v33 + 16);
      v24 = *(_QWORD *)(v33 + 24);
      if (v25 >= v24 >> 1)
        v11 = (uint64_t)sub_223136780((char *)(v24 > 1), v25 + 1, 1);
      *(_QWORD *)(v33 + 16) = v25 + 1;
      *(double *)(v33 + 8 * v25 + 32) = v23;
      if (v19 == ++v17)
        goto LABEL_24;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_223130E84()
{
  unint64_t v0;

  v0 = sub_2231372B8();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_223130ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double sub_223130F08(double a1, double a2)
{
  uint64_t v2;

  return (a2 - a1) * *(double *)(v2 + 16) + a1;
}

unint64_t sub_223130F20()
{
  unint64_t result;

  result = qword_2540B2BA0;
  if (!qword_2540B2BA0)
  {
    result = MEMORY[0x227683898](&protocol conformance descriptor for Look.Variant, &type metadata for Look.Variant);
    atomic_store(result, (unint64_t *)&qword_2540B2BA0);
  }
  return result;
}

unint64_t sub_223130F68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255788048;
  if (!qword_255788048)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255788050);
    result = MEMORY[0x227683898](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255788048);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22768388C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Look(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = v3;
  return a1;
}

void destroy for Look(id *a1)
{

}

uint64_t assignWithCopy for Look(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for Look(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Look(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Look(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Look()
{
  return &type metadata for Look;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Look.GradientOptions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Look.GradientOptions(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Look.GradientOptions()
{
  return &type metadata for Look.GradientOptions;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Look.Variant(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Look.Variant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2231312B4 + 4 * byte_22313779B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2231312E8 + 4 * byte_223137796[v4]))();
}

uint64_t sub_2231312E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2231312F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2231312F8);
  return result;
}

uint64_t sub_223131304(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22313130CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_223131310(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_223131318(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_223131324(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22313132C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Look.Variant()
{
  return &type metadata for Look.Variant;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_223131428(a1, &qword_255788058);
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
  sub_223131428(a1, &qword_255788060);
}

uint64_t sub_22313136C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2231313B4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2231313C4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_223131428(a1, &qword_2540B2AA8);
}

void type metadata accessor for ATXPosterDescriptorFocus(uint64_t a1)
{
  sub_223131428(a1, &qword_2540B2B68);
}

void sub_223131428(uint64_t a1, unint64_t *a2)
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

unint64_t UIColor.userInfo.getter()
{
  void *v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[42];

  v11[41] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11[0] = 0;
  v8 = 0;
  v9 = 0;
  if ((objc_msgSend(v0, sel_getRed_green_blue_alpha_, v11, &v10, &v9, &v8) & 1) == 0)
  {
    v10 = 0x3FF0000000000000;
    v11[0] = 0x3FF0000000000000;
    v8 = 0x3FF0000000000000;
    v9 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B90);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2231379B0;
  sub_223137240();
  v2 = v11[0];
  v3 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE50B0];
  *(_QWORD *)(inited + 72) = v2;
  sub_223137240();
  v4 = v10;
  *(_QWORD *)(inited + 168) = v3;
  *(_QWORD *)(inited + 144) = v4;
  sub_223137240();
  v5 = v9;
  *(_QWORD *)(inited + 240) = v3;
  *(_QWORD *)(inited + 216) = v5;
  sub_223137240();
  v6 = v8;
  *(_QWORD *)(inited + 312) = v3;
  *(_QWORD *)(inited + 288) = v6;
  return sub_223130100(inited);
}

id sub_22313161C(double a1)
{
  void *v1;
  void *v2;
  double v5;
  double v6;
  double v7;
  double v8[2];

  v2 = v1;
  v8[1] = *(double *)MEMORY[0x24BDAC8D0];
  if (a1 < 1.0)
  {
    v7 = 0.0;
    v8[0] = 0.0;
    v5 = 1.0;
    v6 = 0.0;
    if (objc_msgSend(v1, sel_getHue_saturation_brightness_alpha_, v8, &v7, &v6, &v5))
      return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, v8[0], v7, v6 * 0.5 + (v6 - v6 * 0.5) * a1, v5);
    v2 = v1;
  }
  return v2;
}

double sub_223131744()
{
  void *v0;
  double result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10[0] = 0;
  v7 = 0;
  v8 = 0;
  if (objc_msgSend(v0, sel_getRed_green_blue_alpha_, v10, &v9, &v8, &v7))
    return *(double *)v10;
  result = 1.0;
  __asm { FMOV            V2.2D, #1.0 }
  return result;
}

uint64_t sub_2231317EC(_QWORD *a1)
{
  uint64_t result;

  result = sub_2231325EC(a1);
  if (*(_QWORD *)(result + 16) >= 4uLL)
    return swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2231318C0(uint64_t a1, double a2)
{
  __double2 v3;
  uint64_t inited;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v3 = __sincos_stret(a2 * 3.14159265 + a2 * 3.14159265 + -3.14159265);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2231379B0;
  *(_QWORD *)(inited + 32) = &unk_24EC18D70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2231379C0;
  *(_QWORD *)(v5 + 32) = 0;
  *(double *)(v5 + 40) = v3.__cosval + -1.0 + 1.0;
  *(double *)(v5 + 48) = -v3.__sinval;
  *(_QWORD *)(v5 + 56) = 0;
  v6 = (v3.__cosval + -1.0) * 0.5;
  *(double *)(v5 + 64) = v3.__sinval * 0.5 - v6;
  *(_QWORD *)(inited + 40) = v5;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2231379C0;
  *(_QWORD *)(v7 + 32) = 0;
  *(double *)(v7 + 40) = v3.__sinval;
  *(double *)(v7 + 48) = v3.__cosval + -1.0 + 1.0;
  *(_QWORD *)(v7 + 56) = 0;
  *(double *)(v7 + 64) = v3.__sinval * -0.5 - v6;
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = &unk_24EC18DB8;
  v8 = sub_2231320B8((_QWORD *)inited, a1);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AA0);
  swift_arrayDestroy();
  return v8;
}

uint64_t sub_223131A30(uint64_t a1, double a2)
{
  double v3;
  double v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2 + a2;
  v4 = 0.5 - (a2 + a2) * 0.5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2231379B0;
  *(_QWORD *)(inited + 32) = &unk_24EC18E00;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2231379C0;
  *(_QWORD *)(v6 + 32) = 0;
  *(double *)(v6 + 40) = v3;
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  *(double *)(v6 + 64) = v4;
  *(_QWORD *)(inited + 40) = v6;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2231379C0;
  *(_QWORD *)(v7 + 32) = 0;
  *(_QWORD *)(v7 + 40) = 0;
  *(double *)(v7 + 48) = v3;
  *(_QWORD *)(v7 + 56) = 0;
  *(double *)(v7 + 64) = v4;
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = &unk_24EC18E48;
  v8 = sub_2231320B8((_QWORD *)inited, a1);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AA0);
  swift_arrayDestroy();
  return v8;
}

uint64_t sub_223131B54(uint64_t a1, double a2)
{
  double v3;
  uint64_t inited;
  uint64_t v5;
  double v6;
  uint64_t v7;

  v3 = a2 + a2 + -1.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2231379B0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2231379C0;
  *(double *)(v5 + 32) = 1.0 - fabs(v3);
  v6 = 0.0;
  if (v3 >= 0.0)
    v6 = v3;
  *(_QWORD *)(v5 + 48) = 0;
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(double *)(v5 + 64) = v6;
  *(_QWORD *)(inited + 32) = v5;
  *(_QWORD *)(inited + 40) = &unk_24EC18E90;
  *(_QWORD *)(inited + 48) = &unk_24EC18ED8;
  *(_QWORD *)(inited + 56) = &unk_24EC18F20;
  v7 = sub_2231320B8((_QWORD *)inited, a1);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AA0);
  swift_arrayDestroy();
  return v7;
}

double sub_223131C64()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD8);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_2231379B0;
  *(_QWORD *)(v0 + 32) = &unk_24EC18C50;
  *(_QWORD *)(v0 + 40) = &unk_24EC18C98;
  *(_QWORD *)(v0 + 48) = &unk_24EC18CE0;
  *(_QWORD *)(v0 + 56) = &unk_24EC18D28;
  qword_2540B2CB0 = v0;
  return result;
}

double sub_223131CC8()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD8);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_2231379B0;
  *(_QWORD *)(v0 + 32) = &unk_24EC18F68;
  *(_QWORD *)(v0 + 40) = &unk_24EC18FB0;
  *(_QWORD *)(v0 + 48) = &unk_24EC18FF8;
  *(_QWORD *)(v0 + 56) = &unk_24EC19040;
  qword_2540B2CB8 = v0;
  return result;
}

uint64_t sub_223131D2C()
{
  void *v0;
  unsigned int v1;
  double v2;
  uint64_t v4;
  double v5;
  double v6;
  double v7[2];

  v7[1] = *(double *)MEMORY[0x24BDAC8D0];
  v7[0] = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0;
  v1 = objc_msgSend(v0, sel_getRed_green_blue_alpha_, v7, &v6, &v5, &v4);
  v2 = 0.0;
  if (v1)
    v2 = v7[0] * 0.299 + v6 * 0.587 + v5 * 0.114;
  return *(_QWORD *)&v2;
}

char *sub_223131DE8(uint64_t a1)
{
  return sub_2231369B4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

id _sSo7UIColorC14GradientPosterE4load8userInfoABSgSDys11AnyHashableVypG_tFZ_0(uint64_t a1)
{
  unint64_t v2;
  char v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  _BYTE v11[40];
  __int128 v12;
  __int128 v13;

  sub_223137240();
  if (*(_QWORD *)(a1 + 16) && (v2 = sub_223130AA4((uint64_t)v11), (v3 & 1) != 0))
  {
    sub_223130ECC(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)&v12);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  sub_223130AD4((uint64_t)v11);
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_26;
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  sub_223137240();
  if (*(_QWORD *)(a1 + 16) && (v4 = sub_223130AA4((uint64_t)v11), (v5 & 1) != 0))
  {
    sub_223130ECC(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v12);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  sub_223130AD4((uint64_t)v11);
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_26;
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  sub_223137240();
  if (*(_QWORD *)(a1 + 16) && (v6 = sub_223130AA4((uint64_t)v11), (v7 & 1) != 0))
  {
    sub_223130ECC(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v12);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  sub_223130AD4((uint64_t)v11);
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_26;
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  sub_223137240();
  if (*(_QWORD *)(a1 + 16) && (v8 = sub_223130AA4((uint64_t)v11), (v9 & 1) != 0))
  {
    sub_223130ECC(*(_QWORD *)(a1 + 56) + 32 * v8, (uint64_t)&v12);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  sub_223130AD4((uint64_t)v11);
  if (!*((_QWORD *)&v13 + 1))
  {
LABEL_26:
    sub_223130B08((uint64_t)&v12);
    return 0;
  }
  if ((swift_dynamicCast() & 1) != 0)
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, COERCE_DOUBLE(6579570), COERCE_DOUBLE(0x6E65657267), COERCE_DOUBLE(1702194274), COERCE_DOUBLE(0x6168706C61));
  return 0;
}

uint64_t sub_2231320B8(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  double v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t result;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;

  v6 = sub_223137210();
  *(_QWORD *)(v6 + 16) = 5;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_QWORD *)(v6 + 64) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AA0);
  v7 = (_QWORD *)sub_223137210();
  v7[2] = 4;
  v7[4] = v6;
  v7[5] = v6;
  v7[6] = v6;
  v7[7] = v6;
  if (a1[2] < 4uLL)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (*(_QWORD *)(a2 + 16) < 4uLL)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v2 = v7;
  v30 = a1;
  v32 = *(_QWORD *)(a2 + 56);
  v33 = a1 + 4;
  v8 = *(_QWORD *)(a2 + 48);
  v10 = a2 + 32;
  a2 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(v10 + 8);
  swift_bridgeObjectRetain_n();
  v11 = 0;
  while (2)
  {
    v12 = 0;
    v31 = v11 + 1;
    do
    {
      v13 = v33[v12];
      if (*(_QWORD *)(v13 + 16) < 4uLL)
      {
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      if (v11 >= *(_QWORD *)(v32 + 16))
        goto LABEL_35;
      if (v11 >= *(_QWORD *)(v8 + 16))
        goto LABEL_36;
      if (v11 >= *(_QWORD *)(v9 + 16))
        goto LABEL_37;
      if (v11 >= *(_QWORD *)(a2 + 16))
        goto LABEL_38;
      if (v12 >= v2[2])
        goto LABEL_39;
      v3 = *(double *)(v32 + 32 + 8 * v11);
      v14 = *(double *)(v13 + 48);
      v15 = *(double *)(v13 + 56);
      v16 = *(double *)(v8 + 32 + 8 * v11);
      v17 = *(double *)(v9 + 32 + 8 * v11);
      v18 = *(double *)(v13 + 32);
      v19 = *(double *)(v13 + 40);
      v20 = *(double *)(a2 + 32 + 8 * v11);
      v21 = v2;
      v2 += v12;
      v6 = v2[4];
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v2[4] = v6;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v6 = (uint64_t)sub_223131DE8(v6);
        v2[4] = v6;
      }
      if (v11 >= *(_QWORD *)(v6 + 16))
        goto LABEL_40;
      v2 = v21;
      ++v12;
      *(double *)(v6 + 8 * v11 + 32) = v15 * v3 + v14 * v16 + v19 * v17 + v18 * v20;
    }
    while (v12 != 4);
    ++v11;
    if (v31 != 5)
      continue;
    break;
  }
  if (*(_QWORD *)(*v33 + 16) < 5uLL)
    goto LABEL_43;
  if (!v21[2])
    goto LABEL_44;
  v3 = *(double *)(*v33 + 64);
  v6 = v21[4];
  v23 = swift_isUniquelyReferenced_nonNull_native();
  v21[4] = v6;
  if ((v23 & 1) == 0)
LABEL_45:
    v6 = (uint64_t)sub_223131DE8(v6);
  if (*(_QWORD *)(v6 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_47;
  }
  *(double *)(v6 + 64) = v3 + *(double *)(v6 + 64);
  v2[4] = v6;
  v24 = v30[5];
  if (*(_QWORD *)(v24 + 16) < 5uLL)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v2[2] >= 2uLL)
  {
    v3 = *(double *)(v24 + 64);
    v6 = v2[5];
    v25 = swift_isUniquelyReferenced_nonNull_native();
    v2[5] = v6;
    if ((v25 & 1) != 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  v6 = (uint64_t)sub_223131DE8(v6);
LABEL_24:
  if (*(_QWORD *)(v6 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_51;
  }
  *(double *)(v6 + 64) = v3 + *(double *)(v6 + 64);
  v2[5] = v6;
  v26 = v30[6];
  if (*(_QWORD *)(v26 + 16) < 5uLL)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v2[2] >= 3uLL)
  {
    v3 = *(double *)(v26 + 64);
    v6 = v2[6];
    v27 = swift_isUniquelyReferenced_nonNull_native();
    v2[6] = v6;
    if ((v27 & 1) != 0)
      goto LABEL_28;
    goto LABEL_53;
  }
LABEL_52:
  __break(1u);
LABEL_53:
  v6 = (uint64_t)sub_223131DE8(v6);
LABEL_28:
  if (*(_QWORD *)(v6 + 16) < 5uLL)
  {
    __break(1u);
    goto LABEL_55;
  }
  *(double *)(v6 + 64) = v3 + *(double *)(v6 + 64);
  v2[6] = v6;
  v28 = v30[7];
  if (*(_QWORD *)(v28 + 16) < 5uLL)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (v2[2] >= 4uLL)
  {
    v3 = *(double *)(v28 + 64);
    a2 = v2[7];
    result = swift_isUniquelyReferenced_nonNull_native();
    v2[7] = a2;
    if ((result & 1) != 0)
      goto LABEL_32;
    goto LABEL_57;
  }
LABEL_56:
  __break(1u);
LABEL_57:
  result = (uint64_t)sub_223131DE8(a2);
  a2 = result;
LABEL_32:
  if (*(_QWORD *)(a2 + 16) < 5uLL)
  {
    __break(1u);
  }
  else
  {
    *(double *)(a2 + 64) = v3 + *(double *)(a2 + 64);
    v2[7] = a2;
    return (uint64_t)v2;
  }
  return result;
}

uint64_t sub_2231324AC(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  if (qword_2540B2A88 != -1)
    swift_once();
  if (*(_QWORD *)(a1 + 16) == 3)
  {
    v2 = *(double *)(a1 + 32);
    v3 = swift_bridgeObjectRetain();
    v4 = sub_2231318C0(v3, v2);
    v5 = sub_223131A30(v4, *(double *)(a1 + 40));
    swift_bridgeObjectRelease();
    v6 = sub_223131B54(v5, *(double *)(a1 + 48));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2540B2A90 != -1)
      swift_once();
    v7 = sub_2231320B8((_QWORD *)qword_2540B2CB8, v6);
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    result = sub_223137294();
    __break(1u);
  }
  return result;
}

uint64_t sub_2231325EC(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AF8);
  result = sub_223137210();
  *(_QWORD *)(result + 16) = 4;
  if (a1[2] < 4uLL)
  {
    __break(1u);
    goto LABEL_24;
  }
  v3 = a1[4];
  v4 = *(_QWORD *)(v3 + 16);
  if (!v4)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v4 == 1)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v4 < 3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v4 == 3)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v4 < 5)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v5 = *(_OWORD *)(v3 + 48);
  v6 = *(_QWORD *)(v3 + 64);
  *(_OWORD *)(result + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(result + 48) = v5;
  *(_QWORD *)(result + 64) = v6;
  v7 = a1[5];
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v8 == 1)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v8 < 3)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v8 == 3)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v8 < 5)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v9 = *(_OWORD *)(v7 + 48);
  v10 = *(_QWORD *)(v7 + 64);
  *(_OWORD *)(result + 80) = *(_OWORD *)(v7 + 32);
  *(_OWORD *)(result + 96) = v9;
  *(_QWORD *)(result + 112) = v10;
  v11 = a1[6];
  v12 = *(_QWORD *)(v11 + 16);
  if (!v12)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v12 == 1)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v12 < 3)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v12 == 3)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v12 < 5)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v13 = *(_OWORD *)(v11 + 48);
  v14 = *(_QWORD *)(v11 + 64);
  *(_OWORD *)(result + 128) = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(result + 144) = v13;
  *(_QWORD *)(result + 160) = v14;
  v15 = a1[7];
  v16 = *(_QWORD *)(v15 + 16);
  if (!v16)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v16 == 1)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v16 < 3)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v16 == 3)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v16 >= 5)
  {
    v17 = *(_OWORD *)(v15 + 48);
    v18 = *(_QWORD *)(v15 + 64);
    *(_OWORD *)(result + 176) = *(_OWORD *)(v15 + 32);
    *(_OWORD *)(result + 192) = v17;
    *(_QWORD *)(result + 208) = v18;
    return result;
  }
LABEL_43:
  __break(1u);
  return result;
}

Swift::Void __swiftcall UIView.applyFullscreenConstraints(forView:)(UIView *forView)
{
  void *v1;
  void *v2;
  void *v4;
  uint64_t v5;
  id v6;
  NSLayoutXAxisAnchor *v7;
  id v8;
  id v9;
  NSLayoutXAxisAnchor *v10;
  id v11;
  id v12;
  NSLayoutYAxisAnchor *v13;
  id v14;
  id v15;
  NSLayoutYAxisAnchor *v16;
  id v17;
  id v18;

  v2 = v1;
  v4 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_223137A00;
  v6 = objc_msgSend(v2, sel_leadingAnchor);
  v7 = -[UIView leadingAnchor](forView, sel_leadingAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(_QWORD *)(v5 + 32) = v8;
  v9 = objc_msgSend(v2, sel_trailingAnchor);
  v10 = -[UIView trailingAnchor](forView, sel_trailingAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v5 + 40) = v11;
  v12 = objc_msgSend(v2, sel_topAnchor);
  v13 = -[UIView topAnchor](forView, sel_topAnchor);
  v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(_QWORD *)(v5 + 48) = v14;
  v15 = objc_msgSend(v2, sel_bottomAnchor);
  v16 = -[UIView bottomAnchor](forView, sel_bottomAnchor);
  v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(_QWORD *)(v5 + 56) = v17;
  sub_223137204();
  sub_223134728(0, &qword_2540B2AB8);
  v18 = (id)sub_2231371F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);

}

id sub_223132AC8()
{
  return sub_223134308(type metadata accessor for GradientLayerView);
}

double sub_223132AD4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_223132B18(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_223132B68())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_223132BAC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_223132BF0(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_223132C40())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_223132C88()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_223132CCC(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_223132D1C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_223132D60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView);
  }
  else
  {
    type metadata accessor for GradientLayerView();
    v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_223132DD0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v1 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer);
  }
  else
  {
    v4 = sub_223132D60();
    v5 = objc_msgSend(v4, sel_layer);

    objc_opt_self();
    v3 = swift_dynamicCastObjCClassUnconditional();
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v7 = v5;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

uint64_t sub_223132E78(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[3];
  __int128 v18;
  __int128 v19;
  char v20;
  uint64_t v21;

  v3 = v2;
  sub_223134954((uint64_t)v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_223137740;
  v7 = (void *)objc_opt_self();
  *(_QWORD *)(v6 + 32) = objc_msgSend(v7, sel_whiteColor);
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a1;
  sub_223137204();
  v8 = v6;
  v9 = a1;
  swift_bridgeObjectRelease();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_223137740;
  *(_QWORD *)(v10 + 32) = objc_msgSend(v7, sel_blackColor);
  *(_QWORD *)(v10 + 40) = v9;
  *(_QWORD *)(v10 + 48) = v9;
  sub_223137204();
  v11 = v9;
  swift_bridgeObjectRelease();
  v12 = v17[2];
  v13 = v20;
  v14 = v21;
  v15 = v3 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  *(_QWORD *)v15 = v8;
  *(_QWORD *)(v15 + 8) = v10;
  *(_QWORD *)(v15 + 16) = v12;
  *(_OWORD *)(v15 + 24) = v18;
  *(_OWORD *)(v15 + 40) = v19;
  *(_BYTE *)(v15 + 56) = v13;
  *(_QWORD *)(v15 + 64) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle) = a2;
  sub_223134018(1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_223133064(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_BYTE *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  *(_QWORD *)v8 = *(_QWORD *)a1;
  *(_QWORD *)(v8 + 8) = v4;
  *(_QWORD *)(v8 + 16) = v5;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_223134018(a2);
}

void sub_22313312C(CGFloat a1, double a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  double *v10;
  double v11;
  double *v12;
  double v13;
  double *v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;

  v3 = v2;
  v6 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  v7 = *(void **)&v2[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView];
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v8, sel_removeFromSuperview);
    v9 = *(void **)&v3[v6];
    *(_QWORD *)&v3[v6] = 0;

  }
  v10 = (double *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress];
  swift_beginAccess();
  v11 = *v10;
  v12 = (double *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress];
  swift_beginAccess();
  v13 = *v12;
  v14 = (double *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle];
  swift_beginAccess();
  v15 = *v14;
  *v14 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16 = (void *)sub_223132DD0();
  v17 = OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle;
  sub_223134B00(v16, *(_QWORD *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle], 0, a1, v11, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (a2 > 0.0)
  {
    *(CFTimeInterval *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp] = CACurrentMediaTime() + a2;
    *(CGFloat *)&v3[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = v15;
    v18 = *(void **)&v3[v6];
    if (v18
      || (objc_msgSend(v3, sel_bounds),
          v23 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for GradientLayerView()), sel_initWithFrame_, v19, v20, v21, v22), objc_msgSend(v3, sel_addSubview_, v23), v24 = *(void **)&v3[v6], *(_QWORD *)&v3[v6] = v23, v24, (v18 = *(void **)&v3[v6]) != 0))
    {
      v25 = objc_msgSend(v18, sel_layer);
      if (v25)
      {
        v26 = v25;
        objc_opt_self();
        v27 = swift_dynamicCastObjCClass();
        if (v27)
        {
          v28 = (void *)v27;
          v29 = *(_QWORD *)&v3[v17];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_223134B00(v28, v29, 0, v15, v11, v13);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v30 = *(void **)&v3[v6];
          if (v30)
          {
            v31 = v30;
            objc_msgSend(v31, sel_setAlpha_, 0.0);

          }
        }

      }
    }
  }
}

void sub_22313347C(double a1)
{
  char *v1;
  char *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  CGFloat v27;
  void *v28;
  double v29;

  v2 = v1;
  v4 = (void *)sub_223132DD0();
  v5 = OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle;
  v6 = *(_QWORD *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle];
  v7 = (CGFloat *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle];
  swift_beginAccess();
  sub_223134B00(v4, v6, 0, *v7, 0.0, 1.0);

  v8 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  v9 = *(void **)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView];
  if (v9)
    goto LABEL_9;
  objc_msgSend(v1, sel_bounds);
  v11 = v10;
  v13 = v12;
  v14 = a1;
  v16 = v15;
  v18 = v17;
  v19 = objc_allocWithZone((Class)type metadata accessor for GradientLayerView());
  v20 = v16;
  a1 = v14;
  v21 = objc_msgSend(v19, sel_initWithFrame_, v11, v13, v20, v18);
  objc_msgSend(v2, sel_addSubview_, v21);
  v22 = *(void **)&v2[v8];
  *(_QWORD *)&v2[v8] = v21;

  v9 = *(void **)&v2[v8];
  if (v9)
  {
LABEL_9:
    v23 = objc_msgSend(v9, sel_layer);
    if (v23)
    {
      v24 = v23;
      objc_opt_self();
      v25 = (void *)swift_dynamicCastObjCClass();
      if (v25)
      {
        v26 = v25;
        v27 = *v7;
        *(CGFloat *)&v2[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = *v7;
        sub_223134B00(v25, *(_QWORD *)&v2[v5], 0, v27, 0.0, 1.0);
        v28 = (void *)objc_opt_self();
        objc_msgSend(v28, sel_begin);
        objc_msgSend(v28, sel_setDisableActions_, 1);
        *(float *)&v29 = a1;
        objc_msgSend(v26, sel_setOpacity_, v29);
        objc_msgSend(v28, sel_commit);
      }

    }
  }
}

void sub_223133720(uint64_t a1, char a2)
{
  uint64_t v2;

  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle) != a1)
  {
    *(_QWORD *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle) = a1;
    sub_223134018(a2 & 1);
  }
}

void sub_223133744(double a1)
{
  char *v1;
  uint64_t v2;
  CFTimeInterval v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  _QWORD v11[6];

  v2 = OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer;
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer])
  {
    v4 = CACurrentMediaTime();
    v5 = (void *)objc_opt_self();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v1;
    *(CFTimeInterval *)(v6 + 24) = v4;
    *(double *)(v6 + 32) = a1;
    v11[4] = sub_223134400;
    v11[5] = v6;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_22313390C;
    v11[3] = &block_descriptor;
    v7 = _Block_copy(v11);
    v8 = v1;
    swift_release();
    v9 = objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v7, 0.0166666667);
    _Block_release(v7);
    v10 = *(void **)&v1[v2];
    *(_QWORD *)&v1[v2] = v9;

  }
}

void sub_22313385C(void *a1, uint64_t a2, double a3, double a4)
{
  CFTimeInterval v8;
  double *v9;
  double v10;
  void *v11;

  v8 = CACurrentMediaTime();
  v9 = (double *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
  v10 = (v8 - a3) / a4;
  swift_beginAccess();
  *v9 = v10;
  sub_223134018(0);
  if (*v9 > 1.0)
  {
    objc_msgSend(a1, sel_invalidate, *v9);
    v11 = *(void **)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer) = 0;

    *v9 = 0.0;
  }
}

void sub_22313390C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_22313395C(double a1)
{
  char *v1;
  uint64_t v2;
  double *v4;
  double v5;
  double v6;
  CFTimeInterval v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  _QWORD aBlock[6];

  v2 = OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer;
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer])
  {
    v4 = (double *)&v1[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress];
    swift_beginAccess();
    v5 = *v4;
    if (*v4 <= 0.5)
      v6 = 1.0;
    else
      v6 = 0.0;
    v7 = CACurrentMediaTime();
    v8 = (void *)objc_opt_self();
    v9 = swift_allocObject();
    *(CFTimeInterval *)(v9 + 16) = v7;
    *(double *)(v9 + 24) = a1;
    *(_QWORD *)(v9 + 32) = v1;
    *(double *)(v9 + 40) = v5;
    *(double *)(v9 + 48) = v6;
    aBlock[4] = sub_223134448;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22313390C;
    aBlock[3] = &block_descriptor_6;
    v10 = _Block_copy(aBlock);
    v11 = v1;
    swift_release();
    v12 = objc_msgSend(v8, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v10, 0.0166666667);
    _Block_release(v10);
    v13 = *(void **)&v1[v2];
    *(_QWORD *)&v1[v2] = v12;

  }
}

void sub_223133AB8(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  CFTimeInterval v10;
  double *v11;
  void *v12;

  v10 = (CACurrentMediaTime() - a3) / a4;
  v11 = (double *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
  swift_beginAccess();
  *v11 = (a6 - a5) * v10 + a5;
  sub_223134018(0);
  if (v10 > 1.0)
  {
    objc_msgSend(a1, sel_invalidate);
    v12 = *(void **)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer) = 0;

    *v11 = a6;
  }
}

id GradientView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id GradientView.init(frame:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;

  v9 = (uint64_t)v4 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  v10 = v4;
  sub_223134954(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle] = 1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress] = 0x3FF0000000000000;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView] = 0;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for GradientView();
  v11 = objc_msgSendSuper2(&v16, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v12 = sub_223132D60();
  objc_msgSend(v11, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);

  v13 = v11;
  v14 = sub_223132D60();
  objc_msgSend(v13, sel_addSubview_, v14);

  sub_223134018(0);
  return v13;
}

id GradientView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t GradientView.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (uint64_t)v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_gradient;
  v4 = v1;
  sub_223134954(v3);

  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle] = 1;
  v5 = OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_animTimer] = 0;
  v6 = OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeTimer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress] = 0x3FF0000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle] = 0;
  v7 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayerView] = 0;
  v8 = OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView____lazy_storage___gradientLayer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp] = 0;
  v9 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView] = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v10 = *(void **)&v4[v9];
  type metadata accessor for GradientView();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_223133F44()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for GradientView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  v1 = sub_223132D60();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  v2 = *(void **)&v0[OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView];
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v3, sel_setFrame_);

  }
}

void sub_223134018(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  double *v7;
  double v8;
  double *v9;
  double v10;
  void *v11;
  uint64_t v12;
  CGFloat *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  CGFloat v20;
  uint64_t v21;

  v2 = v1;
  v3 = OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC14GradientPoster12GradientView_transitionView);
  if (v4)
  {
    v5 = v4;
    if (*(double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewEndTimestamp) <= CACurrentMediaTime())
    {
      objc_msgSend(v5, sel_removeFromSuperview);
      v6 = *(void **)(v2 + v3);
      *(_QWORD *)(v2 + v3) = 0;

      v5 = v6;
    }

  }
  v7 = (double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
  swift_beginAccess();
  v8 = *v7;
  v9 = (double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
  swift_beginAccess();
  v10 = *v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = (void *)sub_223132DD0();
  v21 = OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle;
  v12 = *(_QWORD *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_currentStyle);
  v13 = (CGFloat *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle);
  swift_beginAccess();
  sub_223134B00(v11, v12, a1 & 1, *v13, v8, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v14 = *(void **)(v2 + v3);
  if (v14)
  {
    v15 = objc_msgSend(v14, sel_layer);
    if (v15)
    {
      v16 = v15;
      objc_opt_self();
      v17 = swift_dynamicCastObjCClass();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = *(_QWORD *)(v2 + v21);
        v20 = *(double *)(v2 + OBJC_IVAR____TtC14GradientPoster12GradientView_transitionViewRotationAngle);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_223134B00(v18, v19, a1 & 1, v20, v8, v10);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }

    }
  }
}

uint64_t type metadata accessor for GradientLayerView()
{
  return objc_opt_self();
}

id GradientView.__deallocating_deinit()
{
  return sub_223134308(type metadata accessor for GradientView);
}

id sub_223134308(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_2231343DC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_223134400(void *a1)
{
  uint64_t v1;

  sub_22313385C(a1, *(_QWORD *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32));
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

uint64_t sub_223134424()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_223134448(void *a1)
{
  uint64_t v1;

  sub_223133AB8(a1, *(_QWORD *)(v1 + 32), *(double *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t type metadata accessor for GradientView()
{
  return objc_opt_self();
}

double sub_223134478@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress, a2);
}

uint64_t sub_223134484(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC14GradientPoster12GradientView_rollingAnimProgress);
}

double sub_223134490@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress, a2);
}

uint64_t sub_22313449C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC14GradientPoster12GradientView_wakeProgress);
}

double sub_2231344A8@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle, a2);
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

uint64_t sub_223134500(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC14GradientPoster12GradientView_rotationAngle);
}

uint64_t keypath_setTm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t method lookup function for GradientView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GradientView.rollingAnimProgress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of GradientView.rollingAnimProgress.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of GradientView.rollingAnimProgress.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of GradientView.wakeProgress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of GradientView.wakeProgress.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of GradientView.wakeProgress.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of GradientView.rotationAngle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of GradientView.rotationAngle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of GradientView.rotationAngle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of GradientView.setupFromCaseColor(_:style:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of GradientView.setupGradient(_:animated:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of GradientView.updateGradientLayerRotationAngle(_:duration:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of GradientView.updateTransition(from:to:progress:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of GradientView.updateStyle(_:animated:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of GradientView.runUnlockAnimation(duration:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of GradientView.runWakeAnimation(duration:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t sub_223134728(uint64_t a1, unint64_t *a2)
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

double sub_22313476C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t inited;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_223137740;
  v5 = (void *)objc_opt_self();
  *(_QWORD *)(inited + 32) = objc_msgSend(v5, sel_whiteColor);
  *(_QWORD *)(inited + 40) = objc_msgSend(v5, sel_systemBlueColor);
  *(_QWORD *)(inited + 48) = objc_msgSend(v5, sel_whiteColor);
  sub_223137204();
  v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_223137740;
  *(_QWORD *)(v6 + 32) = objc_msgSend(v5, sel_blackColor);
  *(_QWORD *)(v6 + 40) = objc_msgSend(v5, sel_systemBlueColor);
  *(_QWORD *)(v6 + 48) = objc_msgSend(v5, sel_blackColor);
  sub_223137204();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_223137770;
  *(_OWORD *)(v7 + 32) = xmmword_223137A60;
  *(_QWORD *)(v7 + 48) = 0x3FF0000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  *(_QWORD *)a2 = a1;
  *(_QWORD *)(a2 + 8) = a1;
  *(_QWORD *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 24) = xmmword_223137750;
  result = 0.5;
  *(_OWORD *)(a2 + 40) = xmmword_223137760;
  *(_BYTE *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = MEMORY[0x24BEE4AF8];
  return result;
}

double sub_223134954@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_223137740;
  v3 = (void *)objc_opt_self();
  *(_QWORD *)(v2 + 32) = objc_msgSend(v3, sel_whiteColor);
  *(_QWORD *)(v2 + 40) = objc_msgSend(v3, sel_systemBlueColor);
  *(_QWORD *)(v2 + 48) = objc_msgSend(v3, sel_whiteColor);
  sub_223137204();
  v4 = v2;
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_223137740;
  *(_QWORD *)(v5 + 32) = objc_msgSend(v3, sel_blackColor);
  *(_QWORD *)(v5 + 40) = objc_msgSend(v3, sel_systemBlueColor);
  *(_QWORD *)(v5 + 48) = objc_msgSend(v3, sel_blackColor);
  sub_223137204();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_223137770;
  *(_OWORD *)(v6 + 32) = xmmword_223137A60;
  *(_QWORD *)(v6 + 48) = 0x3FF0000000000000;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 24) = xmmword_223137750;
  result = 0.5;
  *(_OWORD *)(a1 + 40) = xmmword_223137760;
  *(_BYTE *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = MEMORY[0x24BEE4AF8];
  return result;
}

void sub_223134B00(void *a1, uint64_t a2, char a3, CGFloat a4, double a5, double a6)
{
  double *v6;
  double v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  id v21;
  void *v22;
  CGFloat a;
  CGFloat v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  CGFloat v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t inited;
  _QWORD *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  unint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  CGFloat v66;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat ty;
  CGFloat tx;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CGFloat v75;
  CGFloat v76;
  CGPoint v77;
  __int128 v78;
  CGFloat v79;
  CGFloat v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  CGFloat v85;
  CGFloat v86;
  CGPoint v87;
  double v88;
  double v89;
  void *v90;
  id v91;
  void *v92;
  uint64_t v93;
  CGFloat v94;
  id v95;
  void *v96;
  id v97;
  CGFloat v98;
  unint64_t v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  uint64_t v119;
  double v121;
  CGFloat anglea[2];
  double v125;
  double v126;
  CGAffineTransform v127;
  CGAffineTransform t2;
  CGAffineTransform t1;
  uint64_t v130;
  CGPoint v131;
  CGPoint v132;

  v130 = *MEMORY[0x24BDAC8D0];
  v10 = *v6;
  v11 = *((_QWORD *)v6 + 1);
  v12 = *((_QWORD *)v6 + 2);
  v115 = v6[4];
  v116 = v6[3];
  v117 = v6[6];
  v118 = v6[5];
  v119 = *((char *)v6 + 56);
  v13 = v6[8];
  if ((a3 & 1) == 0)
  {
    v14 = (void *)objc_opt_self();
    objc_msgSend(v14, sel_begin);
    objc_msgSend(v14, sel_setDisableActions_, 1);
  }
  v15 = 0.0;
  if (a5 >= 0.0)
    v15 = a5;
  if (a5 >= 1.0)
    v16 = 1.0;
  else
    v16 = v15;
  if (a2 == 2)
    v17 = v11;
  else
    v17 = *(_QWORD *)&v10;
  swift_bridgeObjectRetain();
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    v18 = sub_2231372A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v18 != 3)
  {
    sub_223137294();
    __break(1u);
    return;
  }
  v19 = v16 * v16 * (3.0 - (v16 + v16));
  *(_QWORD *)&t1.a = MEMORY[0x24BEE4AF8];
  sub_223137270();
  v20 = 0;
  do
  {
    if ((v17 & 0xC000000000000001) != 0)
      v21 = (id)MEMORY[0x2276834E4](v20, v17);
    else
      v21 = *(id *)(v17 + 8 * v20 + 32);
    v22 = v21;
    if (a6 < 1.0)
    {
      t2.a = 0.0;
      v126 = 0.0;
      v127.a = 0.0;
      v125 = 1.0;
      if (objc_msgSend(v21, sel_getHue_saturation_brightness_alpha_, &t2, &v127, &v126, &v125))
      {
        v16 = v126 * 0.5 + (v126 - v126 * 0.5) * a6;
        objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, t2.a, v127.a, v16, v125);

      }
    }
    ++v20;
    sub_223137258();
    sub_22313727C();
    sub_223137288();
    sub_223137264();
  }
  while (v20 != 3);
  a = t1.a;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v12 + 16) == 3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AD0);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_223137770;
    *(_OWORD *)(v12 + 32) = xmmword_223137A60;
    *(_QWORD *)(v12 + 48) = 0x3FF0000000000000;
  }
  v24 = v13;
  if (*(_QWORD *)&v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v25 = sub_2231372A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v25 = *(_QWORD *)((*(_QWORD *)&v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v25 == 2)
  {
    swift_bridgeObjectRetain();
    v26 = *(_QWORD *)(v12 + 16);
    if (v26)
      goto LABEL_29;
LABEL_35:
    swift_bridgeObjectRelease();
    v28 = MEMORY[0x24BEE4AF8];
    goto LABEL_36;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_223137720;
  v32 = *MEMORY[0x24BDE5D28];
  v33 = (void *)objc_opt_self();
  *(_QWORD *)(v31 + 32) = objc_msgSend(v33, sel_functionWithName_, v32);
  *(_QWORD *)(v31 + 40) = objc_msgSend(v33, sel_functionWithName_, *MEMORY[0x24BDE5D18]);
  *(_QWORD *)&t1.a = v31;
  sub_223137204();
  v24 = t1.a;
  v26 = *(_QWORD *)(v12 + 16);
  if (!v26)
    goto LABEL_35;
LABEL_29:
  *(_QWORD *)&t1.a = MEMORY[0x24BEE4AF8];
  sub_223136780(0, v26, 0);
  v27 = 0;
  v28 = t1.a;
  v29 = *(_QWORD *)(*(_QWORD *)&t1.a + 16);
  a6 = 3.0;
  do
  {
    v16 = *(double *)(v12 + 8 * v27 + 32);
    t1.a = v28;
    v30 = *(_QWORD *)(*(_QWORD *)&v28 + 24);
    if (v29 >= v30 >> 1)
    {
      sub_223136780((char *)(v30 > 1), v29 + 1, 1);
      v28 = t1.a;
    }
    ++v27;
    *(_QWORD *)(*(_QWORD *)&v28 + 16) = v29 + 1;
    *(double *)(*(_QWORD *)&v28 + 8 * v29++ + 32) = v16 / 3.0;
  }
  while (v26 != v27);
  swift_bridgeObjectRelease();
LABEL_36:
  v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE8);
  inited = swift_initStackObject();
  v36 = (_QWORD *)inited;
  *(_OWORD *)(inited + 16) = xmmword_223137A70;
  if ((*(_QWORD *)&a & 0xC000000000000001) != 0)
  {
    *(_QWORD *)(inited + 32) = MEMORY[0x2276834E4](0, *(_QWORD *)&a);
    v36[5] = MEMORY[0x2276834E4](1, *(_QWORD *)&a);
    v36[6] = MEMORY[0x2276834E4](2, *(_QWORD *)&a);
    v36[7] = MEMORY[0x2276834E4](1, *(_QWORD *)&a);
    v36[8] = MEMORY[0x2276834E4](0, *(_QWORD *)&a);
    v36[9] = MEMORY[0x2276834E4](1, *(_QWORD *)&a);
    v52 = (id)MEMORY[0x2276834E4](2, *(_QWORD *)&a);
    goto LABEL_41;
  }
  v37 = *(_QWORD *)((*(_QWORD *)&a & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v37)
  {
    __break(1u);
    goto LABEL_62;
  }
  v38 = *(void **)(*(_QWORD *)&a + 32);
  *(_QWORD *)(inited + 32) = v38;
  if (v37 == 1)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  v39 = *(void **)(*(_QWORD *)&a + 40);
  *(_QWORD *)(inited + 40) = v39;
  if (v37 < 3)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  v40 = *(void **)(*(_QWORD *)&a + 48);
  *(_QWORD *)(inited + 48) = v40;
  v41 = *(void **)(*(_QWORD *)&a + 40);
  *(_QWORD *)(inited + 56) = v41;
  v42 = *(void **)(*(_QWORD *)&a + 32);
  *(_QWORD *)(inited + 64) = v42;
  v43 = v24;
  v44 = *(void **)(*(_QWORD *)&a + 40);
  *(_QWORD *)(inited + 72) = v44;
  v45 = *(void **)(*(_QWORD *)&a + 48);
  v46 = v38;
  v47 = v39;
  v48 = v40;
  v49 = v41;
  v50 = v42;
  v51 = v44;
  v24 = v43;
  v52 = v45;
LABEL_41:
  v34 = v52;
  swift_bridgeObjectRelease();
  v36[10] = v34;
  *(_QWORD *)&t1.a = v36;
  sub_223137204();
  a = t1.a;
  v36 = (_QWORD *)*MEMORY[0x24BDE5D20];
  v53 = objc_msgSend((id)objc_opt_self(), sel_functionWithName_, *MEMORY[0x24BDE5D20]);
  v54 = *(_QWORD *)(*(_QWORD *)&v28 + 16);
  if (!v54)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v54 == 1)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (v54 < 3)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v34 = v53;
  v55 = *(double *)(*(_QWORD *)&v28 + 32);
  v16 = *(double *)(*(_QWORD *)&v28 + 40);
  a6 = *(double *)(*(_QWORD *)&v28 + 48);
  swift_bridgeObjectRelease();
  v56 = swift_allocObject();
  v36 = (_QWORD *)v56;
  *(_OWORD *)(v56 + 16) = xmmword_223137A80;
  v113 = v55;
  v114 = v19;
  if ((*(_QWORD *)&v24 & 0xC000000000000001) == 0)
  {
    v57 = *(_QWORD *)((*(_QWORD *)&v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v57)
    {
      v58 = *(void **)(*(_QWORD *)&v24 + 32);
      *(_QWORD *)(v56 + 32) = v58;
      if (v57 != 1)
      {
        v59 = *(void **)(*(_QWORD *)&v24 + 40);
        *(_QWORD *)(v56 + 40) = v59;
        *(_QWORD *)(v56 + 48) = v34;
        *(_QWORD *)(v56 + 56) = v34;
        *(_QWORD *)(v56 + 64) = v58;
        v60 = v34;
        v61 = v58;
        v62 = v59;
        v63 = v61;
        v64 = v62;
        goto LABEL_48;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
LABEL_67:
  v36[4] = MEMORY[0x2276834E4](0, *(_QWORD *)&v24);
  v36[5] = MEMORY[0x2276834E4](1, *(_QWORD *)&v24);
  v36[6] = v34;
  v36[7] = v34;
  v104 = v34;
  v36[8] = MEMORY[0x2276834E4](0, *(_QWORD *)&v24);
  v64 = (id)MEMORY[0x2276834E4](1, *(_QWORD *)&v24);
LABEL_48:
  v65 = v64;
  swift_bridgeObjectRelease();
  v108 = v16 + 0.333333333;
  v109 = a6 + 0.333333333;
  v110 = v16;
  v111 = v16 + 0.666666667;
  v112 = a6;
  v121 = a6 + 0.666666667;
  v36[9] = v65;
  *(_QWORD *)&t1.a = v36;
  sub_223137204();
  CGAffineTransformMakeTranslation(&t1, -0.5, -0.5);
  v66 = t1.a;
  b = t1.b;
  c = t1.c;
  d = t1.d;
  tx = t1.tx;
  ty = t1.ty;
  CGAffineTransformMakeRotation(&t1, a4);
  v72 = *(_OWORD *)&t1.a;
  v73 = *(_OWORD *)&t1.c;
  v74 = *(_OWORD *)&t1.tx;
  t1.a = v66;
  t1.b = b;
  t1.c = c;
  t1.d = d;
  t1.tx = tx;
  t1.ty = ty;
  *(_OWORD *)&t2.a = v72;
  *(_OWORD *)&t2.c = v73;
  *(_OWORD *)&t2.tx = v74;
  CGAffineTransformConcat(&v127, &t1, &t2);
  v105 = *(_OWORD *)&v127.c;
  v106 = *(_OWORD *)&v127.a;
  v76 = v127.tx;
  v75 = v127.ty;
  t1.a = v66;
  t1.b = b;
  t1.c = c;
  t1.d = d;
  t1.tx = tx;
  t1.ty = ty;
  CGAffineTransformInvert(&t2, &t1);
  *(_OWORD *)&t1.a = v106;
  *(_OWORD *)&t1.c = v105;
  t1.tx = v76;
  t1.ty = v75;
  CGAffineTransformConcat(&v127, &t1, &t2);
  t1 = v127;
  v131.y = v115;
  v131.x = v116;
  v77 = CGPointApplyAffineTransform(v131, &t1);
  CGAffineTransformMakeTranslation(&t1, -0.5, -0.5);
  v78 = *(_OWORD *)&t1.a;
  v79 = t1.c;
  v80 = t1.d;
  v81 = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeRotation(&t1, a4);
  v82 = *(_OWORD *)&t1.a;
  v83 = *(_OWORD *)&t1.c;
  v84 = *(_OWORD *)&t1.tx;
  *(_OWORD *)&t1.a = v78;
  t1.c = v79;
  t1.d = v80;
  *(_OWORD *)&t1.tx = v81;
  *(_OWORD *)&t2.a = v82;
  *(_OWORD *)&t2.c = v83;
  *(_OWORD *)&t2.tx = v84;
  CGAffineTransformConcat(&v127, &t1, &t2);
  *(_OWORD *)anglea = *(_OWORD *)&v127.a;
  v107 = *(_OWORD *)&v127.c;
  v85 = v127.tx;
  v86 = v127.ty;
  *(_OWORD *)&t1.a = v78;
  t1.c = v79;
  t1.d = v80;
  *(_OWORD *)&t1.tx = v81;
  CGAffineTransformInvert(&t2, &t1);
  *(_OWORD *)&t1.a = *(_OWORD *)anglea;
  *(_OWORD *)&t1.c = v107;
  t1.tx = v85;
  t1.ty = v86;
  CGAffineTransformConcat(&v127, &t1, &t2);
  t1 = v127;
  v132.y = v117;
  v132.x = v118;
  v87 = CGPointApplyAffineTransform(v132, &t1);
  v88 = v87.x - v77.x;
  v89 = v87.y - v77.y;
  v90 = (void *)**((_QWORD **)&unk_24EC19818 + v119);
  sub_2231371D4();
  v91 = v90;
  v92 = (void *)sub_2231371C8();
  swift_bridgeObjectRelease();

  objc_msgSend(a1, sel_setType_, v92);
  *(_QWORD *)&t2.a = MEMORY[0x24BEE4AF8];
  sub_22313679C(0, 7, 0);
  v93 = 0;
  v94 = t2.a;
  do
  {
    if ((*(_QWORD *)&a & 0xC000000000000001) != 0)
      v95 = (id)MEMORY[0x2276834E4](v93, *(_QWORD *)&a);
    else
      v95 = *(id *)(*(_QWORD *)&a + 8 * v93 + 32);
    v96 = v95;
    v97 = objc_msgSend(v95, sel_CGColor);
    type metadata accessor for CGColor(0);
    t1.d = v98;

    *(_QWORD *)&t1.a = v97;
    t2.a = v94;
    v100 = *(_QWORD *)(*(_QWORD *)&v94 + 16);
    v99 = *(_QWORD *)(*(_QWORD *)&v94 + 24);
    if (v100 >= v99 >> 1)
    {
      sub_22313679C((char *)(v99 > 1), v100 + 1, 1);
      v94 = t2.a;
    }
    ++v93;
    *(_QWORD *)(*(_QWORD *)&v94 + 16) = v100 + 1;
    sub_2231313B4(&t1, (_OWORD *)(*(_QWORD *)&v94 + 32 * v100 + 32));
  }
  while (v93 != 7);
  swift_bridgeObjectRelease();
  v101 = (void *)sub_2231371F8();
  swift_release();
  objc_msgSend(a1, sel_setColors_, v101);

  sub_223134728(0, &qword_2540B2AC0);
  v102 = (void *)sub_2231371F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInterpolations_, v102);

  *(_QWORD *)&t1.a = MEMORY[0x24BEE4AF8];
  sub_223137270();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v113);
  sub_223137258();
  sub_22313727C();
  sub_223137288();
  sub_223137264();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v110);
  sub_223137258();
  sub_22313727C();
  sub_223137288();
  sub_223137264();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v112);
  sub_223137258();
  sub_22313727C();
  sub_223137288();
  sub_223137264();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v108);
  sub_223137258();
  sub_22313727C();
  sub_223137288();
  sub_223137264();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v109);
  sub_223137258();
  sub_22313727C();
  sub_223137288();
  sub_223137264();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v111);
  sub_223137258();
  sub_22313727C();
  sub_223137288();
  sub_223137264();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v121);
  sub_223137258();
  sub_22313727C();
  sub_223137288();
  sub_223137264();
  sub_223134728(0, &qword_2540B2AC8);
  v103 = (void *)sub_2231371F8();
  swift_release();
  objc_msgSend(a1, sel_setLocations_, v103);

  objc_msgSend(a1, sel_setStartPoint_, v77.x - (v114 * v88 + v114 * v88), v77.y - (v114 * v89 + v114 * v89));
  objc_msgSend(a1, sel_setEndPoint_, v87.x + (2.0 - (v114 + v114)) * v88, v87.y + (2.0 - (v114 + v114)) * v89);
  if ((a3 & 1) == 0)
    objc_msgSend((id)objc_opt_self(), sel_commit);

}

BOOL static GradientType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GradientType.hash(into:)()
{
  return sub_2231372DC();
}

uint64_t GradientType.hashValue.getter()
{
  sub_2231372D0();
  sub_2231372DC();
  return sub_2231372E8();
}

BOOL sub_223135994(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2231359A8()
{
  sub_2231372D0();
  sub_2231372DC();
  return sub_2231372E8();
}

uint64_t sub_2231359EC()
{
  return sub_2231372DC();
}

uint64_t sub_223135A14()
{
  sub_2231372D0();
  sub_2231372DC();
  return sub_2231372E8();
}

BOOL sub_223135A58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  double *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (double *)(a1 + 40);
  v6 = (double *)(a2 + 40);
  do
  {
    v7 = *v5++;
    v8 = v7;
    v9 = *v6++;
    v10 = v9;
    v12 = v4-- != 0;
    result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

id sub_223135ACC(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v24;
  void **v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;

  v4 = a2;
  v5 = a1;
  v6 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v29 = sub_2231372A0();
    swift_bridgeObjectRelease();
    if (v7 == v29)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v7) = 0;
    return (id)(v7 & 1);
  }
  swift_bridgeObjectRetain();
  v7 = sub_2231372A0();
  swift_bridgeObjectRelease();
  v8 = (unint64_t)v4 >> 62;
  if ((unint64_t)v4 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v7 != *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v7)
    goto LABEL_37;
  v9 = v5 & 0xFFFFFFFFFFFFFF8;
  if (v5 < 0)
    v9 = v5;
  if (!v6)
    v9 = (v5 & 0xFFFFFFFFFFFFFF8) + 32;
  v10 = v4 & 0xFFFFFFFFFFFFFF8;
  v11 = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v4 < 0)
    v12 = v4;
  else
    v12 = v4 & 0xFFFFFFFFFFFFFF8;
  if (v8)
    v11 = v12;
  if (v9 == v11)
  {
LABEL_37:
    LOBYTE(v7) = 1;
    return (id)(v7 & 1);
  }
  if ((v7 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v30 = v5 & 0xC000000000000001;
  if ((v5 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v5 + 32); ; result = (id)MEMORY[0x2276834E4](0, v5))
  {
    v14 = result;
    if ((v4 & 0xC000000000000001) == 0)
      break;
    v15 = (id)MEMORY[0x2276834E4](0, v4);
LABEL_21:
    v16 = v15;
    sub_223134728(0, (unint64_t *)a3);
    a3 = sub_22313721C();

    if ((a3 & 1) == 0)
      goto LABEL_48;
    v17 = v7 - 1;
    if (v7 == 1)
      return (id)(v7 & 1);
    if (((v4 | v5) & 0xC000000000000001) != 0)
    {
      v18 = 0;
      v19 = v7 - 2;
      while (v17 != v18)
      {
        v7 = v18 + 1;
        if (v30)
          v20 = (id)MEMORY[0x2276834E4](v18 + 1, v5);
        else
          v20 = *(id *)(v5 + 40 + 8 * v18);
        a3 = (uint64_t)v20;
        if ((v4 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x2276834E4](v18 + 1, v4);
        }
        else
        {
          if (v7 >= *(_QWORD *)(v10 + 16))
            goto LABEL_53;
          v21 = *(id *)(v4 + 40 + 8 * v18);
        }
        v22 = v21;
        v7 = sub_22313721C();

        if ((v7 & 1) != 0 && v19 != v18++)
          continue;
        return (id)(v7 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v10 + 16);
      if (v24 <= 1)
        v24 = 1;
      a3 = v24 - 1;
      v25 = (void **)(v5 + 40);
      v10 = v4 + 40;
      while (v17)
      {
        if (!a3)
          goto LABEL_52;
        v27 = *v25++;
        v26 = v27;
        v28 = *(void **)v10;
        v10 += 8;
        v4 = v26;
        v5 = v28;
        v7 = sub_22313721C();

        if ((v7 & 1) != 0)
        {
          --a3;
          if (--v17)
            continue;
        }
        return (id)(v7 & 1);
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
  if (*(_QWORD *)(v10 + 16))
  {
    v15 = *(id *)(v4 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

_QWORD *static Gradient.defaultGradientColors.getter()
{
  uint64_t ObjCClassFromMetadata;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  id v14;

  type metadata accessor for GradientView();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v1 = (void *)objc_opt_self();
  v2 = 0;
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v4 = *(_QWORD *)((char *)&unk_24EC190F8 + v2 + 32);
    v5 = *(_QWORD *)((char *)&unk_24EC190F8 + v2 + 40);
    v6 = *((_BYTE *)&unk_24EC190F8 + v2 + 48);
    swift_bridgeObjectRetain_n();
    v7 = v14;
    v8 = (void *)sub_2231371C8();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v1, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v8, v7, 0);

    if (v9)
    {
      swift_bridgeObjectRetain();
      sub_2231371EC();
      swift_bridgeObjectRetain();
      sub_2231371EC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_223136AAC(0, v3[2] + 1, 1, v3);
      v11 = v3[2];
      v10 = v3[3];
      if (v11 >= v10 >> 1)
        v3 = sub_223136AAC((_QWORD *)(v10 > 1), v11 + 1, 1, v3);
      v3[2] = v11 + 1;
      v12 = &v3[5 * v11];
      v12[4] = v4;
      v12[5] = v5;
      v12[6] = v9;
      *((_BYTE *)v12 + 56) = v6;
      v12[8] = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v2 += 24;
  }
  while (v2 != 216);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B98);
  swift_arrayDestroy();
  return v3;
}

void Gradient.luminance(for:in:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  unint64_t *v8;
  unint64_t v17;
  double MidY;
  unint64_t v19;
  id v20;
  void *v21;
  char v22;
  char v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  char v28;
  void *v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v17 = *v8;
  if (*v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v30 = sub_2231372A0();
    swift_bridgeObjectRelease();
    if (v30 != 3)
      return;
  }
  else if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10) != 3)
  {
    return;
  }
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  MidY = CGRectGetMidY(v31);
  v32.origin.x = a5;
  v32.origin.y = a6;
  v32.size.width = a7;
  v32.size.height = a8;
  if (MidY / CGRectGetMaxY(v32) >= 0.5)
  {
    v19 = v17 & 0xC000000000000001;
    if ((v17 & 0xC000000000000001) == 0)
    {
      if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        return;
      }
      v25 = *(id *)(v17 + 40);
      goto LABEL_13;
    }
LABEL_25:
    v25 = (id)MEMORY[0x2276834E4](1, v17);
LABEL_13:
    v26 = v25;
    sub_223131D2C();
    v28 = v27;

    if ((v28 & 1) == 0)
    {
      if (v19)
      {
        v24 = (id)MEMORY[0x2276834E4](2, v17);
        goto LABEL_20;
      }
      if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
      {
        v24 = *(id *)(v17 + 48);
        goto LABEL_20;
      }
      goto LABEL_28;
    }
    return;
  }
  v19 = v17 & 0xC000000000000001;
  if ((v17 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v20 = *(id *)(v17 + 32);
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_25;
  }
  v20 = (id)MEMORY[0x2276834E4](0, v17);
LABEL_7:
  v21 = v20;
  sub_223131D2C();
  v23 = v22;

  if ((v23 & 1) == 0)
  {
    if (v19)
    {
      v24 = (id)MEMORY[0x2276834E4](1, v17);
LABEL_20:
      v29 = v24;
      sub_223131D2C();

      return;
    }
    if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      v24 = *(id *)(v17 + 40);
      goto LABEL_20;
    }
    goto LABEL_27;
  }
}

id sub_223136270()
{
  uint64_t v0;
  id result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B88);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_223137A90;
  *(_QWORD *)(v0 + 32) = 0x6C616E6F73726570;
  *(_QWORD *)(v0 + 40) = 0xE800000000000000;
  *(_QWORD *)(v0 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, 0.0611111111, 0.421501706, 0.9376, 1.0);
  *(_BYTE *)(v0 + 56) = 0;
  *(_OWORD *)(v0 + 64) = xmmword_223137AA0;
  *(_QWORD *)(v0 + 80) = 0xE400000000000000;
  *(_QWORD *)(v0 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, 0.552777778, 0.779134295, 0.901, 1.0);
  *(_BYTE *)(v0 + 96) = 0;
  *(_OWORD *)(v0 + 104) = xmmword_223137AB0;
  *(_QWORD *)(v0 + 120) = 0xE500000000000000;
  *(_QWORD *)(v0 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, 0.597222222, 0.907103825, 0.2928, 1.0);
  *(_BYTE *)(v0 + 136) = 1;
  *(_OWORD *)(v0 + 144) = xmmword_223137AC0;
  *(_QWORD *)(v0 + 160) = 0xE700000000000000;
  *(_QWORD *)(v0 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, 0.375, 0.742138365, 0.7791, 1.0);
  *(_BYTE *)(v0 + 176) = 0;
  *(_OWORD *)(v0 + 184) = xmmword_223137AD0;
  *(_QWORD *)(v0 + 200) = 0xE600000000000000;
  *(_QWORD *)(v0 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, 0.583333333, 0.72, 1.0, 1.0);
  *(_BYTE *)(v0 + 216) = 4;
  *(_OWORD *)(v0 + 224) = xmmword_223137AE0;
  *(_QWORD *)(v0 + 240) = 0xEB00000000737365;
  *(_QWORD *)(v0 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, 0.491666667, 1.0, 0.78, 1.0);
  *(_BYTE *)(v0 + 256) = 4;
  *(_QWORD *)(v0 + 264) = 9;
  *(_QWORD *)(v0 + 272) = 0x676E6964616572;
  *(_QWORD *)(v0 + 280) = 0xE700000000000000;
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, 0.0972222222, 0.66, 1.0, 1.0);
  *(_QWORD *)(v0 + 288) = result;
  *(_BYTE *)(v0 + 296) = 0;
  *(_QWORD *)(v0 + 304) = 7;
  qword_2540B2B58 = v0;
  return result;
}

id UIColor.init(h:s:l:)(double a1, double a2, double a3)
{
  double v3;
  double v4;
  double v5;

  v3 = 1.0 - a3;
  if (1.0 - a3 >= a3)
    v3 = a3;
  v4 = v3 * a2 + a3;
  v5 = 0.0;
  if (v4 > 0.0)
    v5 = 1.0 - a3 / v4 + 1.0 - a3 / v4;
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHue_saturation_brightness_alpha_, a1 / 360.0, v5, v4, 1.0);
}

uint64_t static Gradient.focusConfigs.getter()
{
  if (qword_2540B2B50 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static Gradient.focusConfigs.setter(uint64_t a1)
{
  if (qword_2540B2B50 != -1)
    swift_once();
  swift_beginAccess();
  qword_2540B2B58 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Gradient.focusConfigs.modify())()
{
  if (qword_2540B2B50 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

UIColor __swiftcall UIColor.init(r:g:b:)(Swift::Int r, Swift::Int g, Swift::Int b)
{
  return (UIColor)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, (double)r / 255.0, (double)g / 255.0, (double)b / 255.0, 1.0);
}

UIColor __swiftcall UIColor.init(packedRGB:)(Swift::UInt32 packedRGB)
{
  return (UIColor)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, (double)BYTE2(packedRGB) / 255.0, (double)BYTE1(packedRGB) / 255.0, (double)packedRGB / 255.0, 1.0);
}

char *sub_223136780(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2231367B8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_22313679C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2231368B0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2231367B8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE0);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  swift_release();
  return v10;
}

char *sub_2231368B0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AF0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2231369B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2AE0);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

_QWORD *sub_223136AAC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B88);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2B60);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _s14GradientPoster0A0V2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  BOOL v10;
  unsigned __int8 v11;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v16 = *(float64x2_t *)(a1 + 24);
  v17 = *(float64x2_t *)(a1 + 40);
  v14 = *(float64x2_t *)(a2 + 24);
  v15 = *(float64x2_t *)(a2 + 40);
  v8 = *(unsigned __int8 *)(a2 + 56);
  v9 = *(_QWORD *)(a2 + 64);
  if ((sub_223135ACC(*(_QWORD *)a1, *(_QWORD *)a2, (uint64_t)&unk_2540B2B70) & 1) != 0
    && (sub_223135ACC(v2, v6, (uint64_t)&unk_2540B2B70) & 1) != 0)
  {
    v10 = sub_223135A58(v3, v7);
    v11 = 0;
    if (v10
      && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v16, v14), (int32x4_t)vceqq_f64(v17, v15))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) == 0&& v4 == v8)
    {
      v11 = sub_223135ACC(v5, v9, (uint64_t)&qword_2540B2AC0);
    }
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

unint64_t sub_223136D24()
{
  unint64_t result;

  result = qword_2557880C8;
  if (!qword_2557880C8)
  {
    result = MEMORY[0x227683898](&protocol conformance descriptor for GradientType, &type metadata for GradientType);
    atomic_store(result, (unint64_t *)&qword_2557880C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GradientType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GradientType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_223136E44 + 4 * byte_223137B7D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_223136E78 + 4 * byte_223137B78[v4]))();
}

uint64_t sub_223136E78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_223136E80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x223136E88);
  return result;
}

uint64_t sub_223136E94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x223136E9CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_223136EA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_223136EA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GradientType()
{
  return &type metadata for GradientType;
}

uint64_t initializeBufferWithCopyOfBuffer for Gradient(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Gradient()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Gradient(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Gradient(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Gradient(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Gradient(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Gradient(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Gradient()
{
  return &type metadata for Gradient;
}

uint64_t sub_223137198()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_2231371C8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2231371D4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2231371E0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2231371EC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2231371F8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_223137204()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_223137210()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22313721C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_223137228()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_223137234()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_223137240()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_22313724C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_223137258()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_223137264()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_223137270()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_22313727C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_223137288()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_223137294()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2231372A0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2231372AC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2231372B8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2231372C4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2231372D0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2231372DC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2231372E8()
{
  return MEMORY[0x24BEE4328]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x24BDBEF90](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

