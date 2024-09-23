BOOL HKUIEqualDoubles(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

double HKUIOnePixel()
{
  double result;
  void *v1;
  double v2;

  result = *(double *)&HKUIOnePixel___onePixel;
  if (*(double *)&HKUIOnePixel___onePixel == 2.22507386e-308)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", *(double *)&HKUIOnePixel___onePixel);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "scale");
    *(double *)&HKUIOnePixel___onePixel = 1.0 / v2;

    return *(double *)&HKUIOnePixel___onePixel;
  }
  return result;
}

id HKHealthKitUIFrameworkBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)HKHealthKitUIFrameworkBundle___HKUIClassBundle;
  if (!HKHealthKitUIFrameworkBundle___HKUIClassBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)HKHealthKitUIFrameworkBundle___HKUIClassBundle;
    HKHealthKitUIFrameworkBundle___HKUIClassBundle = v1;

    v0 = (void *)HKHealthKitUIFrameworkBundle___HKUIClassBundle;
  }
  return v0;
}

double HKUIFloorToScreenScale(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&HKUIFloorToScreenScale___mainscreenScale;
  if (*(double *)&HKUIFloorToScreenScale___mainscreenScale == 2.22507386e-308)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", *(double *)&HKUIFloorToScreenScale___mainscreenScale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    HKUIFloorToScreenScale___mainscreenScale = v4;

    v2 = *(double *)&HKUIFloorToScreenScale___mainscreenScale;
  }
  return floor(v2 * a1) / v2;
}

uint64_t View.healthDataAccessRequest<A>(store:shareTypes:readTypes:trigger:completion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  id v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a7;
  v30 = a2;
  v31 = a5;
  v28 = a4;
  v29 = (void *)a1;
  v32 = a9;
  v33 = a10;
  sub_21446CB24(0, &qword_254D76290, MEMORY[0x24BDEB580]);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = (uint64_t *)((char *)&v28 - v15);
  v17 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for HealthStoreAuthorizationOverlayModifier(0, a8, a11, v20);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v28 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v28, a8);
  sub_21446BBF0(v16);
  v25 = v29;
  sub_21446BC40((uint64_t)v29, v30, a3, (uint64_t)v19, v31, a6, (uint64_t)v16, a8, v24, a11);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  v26 = v25;
  MEMORY[0x2199CDBE4](v24, v34, v21, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
}

uint64_t type metadata accessor for HealthStoreAuthorizationOverlayModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HealthStoreAuthorizationOverlayModifier);
}

uint64_t sub_21446BBF0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_21446CB24(0, &qword_254D76298, MEMORY[0x24BDEB560]);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21446BC40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  int *v16;
  char *v17;

  *(_QWORD *)a9 = a1;
  *((_QWORD *)a9 + 1) = a2;
  *((_QWORD *)a9 + 2) = a3;
  v16 = (int *)type metadata accessor for HealthStoreAuthorizationOverlayModifier(0, a8, a10, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(&a9[v16[11]], a4, a8);
  v17 = &a9[v16[12]];
  *(_QWORD *)v17 = a5;
  *((_QWORD *)v17 + 1) = a6;
  return sub_21446EFB4(a7, (uint64_t)&a9[v16[13]]);
}

uint64_t View.healthDataAccessRequest<A>(store:readTypes:trigger:completion:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = a8;
  v31 = a9;
  v32 = a6;
  v29 = a2;
  v30 = a4;
  v28 = a3;
  sub_21446CB24(0, &qword_254D76290, MEMORY[0x24BDEB580]);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (uint64_t *)((char *)&v27 - v15);
  v17 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for HealthStoreAuthorizationOverlayModifier(0, a7, a10, v20);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v27 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v28, a7);
  sub_21446BBF0(v16);
  sub_21446BC40((uint64_t)a1, 0, v29, (uint64_t)v19, v30, a5, (uint64_t)v16, a7, v24, a10);
  v25 = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  MEMORY[0x2199CDBE4](v24, v32, v21, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
}

uint64_t View.healthDataAccessRequest<A>(store:objectType:predicate:trigger:completion:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  char *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = a7;
  v36 = a5;
  v37 = a6;
  v35 = a2;
  v38 = a9;
  v39 = a10;
  sub_21446CB24(0, &qword_254D76290, MEMORY[0x24BDEB580]);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (uint64_t *)((char *)&v34 - v17);
  v19 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (int *)type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier(0, a8, a11, v22);
  v24 = *((_QWORD *)v23 - 1);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v34 - v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a4, a8);
  *v18 = swift_getKeyPath();
  sub_21446CB24(0, &qword_254D76298, MEMORY[0x24BDEB560]);
  swift_storeEnumTagMultiPayload();
  v27 = v35;
  *(_QWORD *)v26 = a1;
  *((_QWORD *)v26 + 1) = v27;
  *((_QWORD *)v26 + 2) = a3;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v26[v23[11]], v21, a8);
  v28 = &v26[v23[12]];
  v29 = v37;
  *(_QWORD *)v28 = v36;
  *((_QWORD *)v28 + 1) = v29;
  sub_21446EFB4((uint64_t)v18, (uint64_t)&v26[v23[13]]);
  v30 = a3;
  swift_retain();
  v31 = a1;
  v32 = v27;
  MEMORY[0x2199CDBE4](v26, v40, v23, v39);
  return (*(uint64_t (**)(char *, int *))(v24 + 8))(v26, v23);
}

uint64_t type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HealthStorePerObjectAuthorizationOverlayModifier);
}

uint64_t sub_21446C04C(_QWORD *a1)
{
  return get_witness_table_7SwiftUI4ViewRzSQRd__r__lAA15ModifiedContentVyx09HealthKitB00F33StoreAuthorizationOverlayModifier33_214B0F285CDA8168FBED6EA091EA168CLLVyqd__GGAaBHPxAaBHD1__AiA0cK0HPyHCHCTm(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD))type metadata accessor for HealthStoreAuthorizationOverlayModifier, (uint64_t)&unk_21446FA48);
}

uint64_t sub_21446C060(_QWORD *a1)
{
  return get_witness_table_7SwiftUI4ViewRzSQRd__r__lAA15ModifiedContentVyx09HealthKitB00F33StoreAuthorizationOverlayModifier33_214B0F285CDA8168FBED6EA091EA168CLLVyqd__GGAaBHPxAaBHD1__AiA0cK0HPyHCHCTm(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier, (uint64_t)&unk_21446F9F8);
}

uint64_t get_witness_table_7SwiftUI4ViewRzSQRd__r__lAA15ModifiedContentVyx09HealthKitB00F33StoreAuthorizationOverlayModifier33_214B0F285CDA8168FBED6EA091EA168CLLVyqd__GGAaBHPxAaBHD1__AiA0cK0HPyHCHCTm(_QWORD *a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v4 = a1[2];
  v5 = a2(255, a1[1], a1[3]);
  v6 = sub_21446F120();
  v8[0] = v4;
  v8[1] = MEMORY[0x2199CDFC8](a3, v5);
  return MEMORY[0x2199CDFC8](MEMORY[0x24BDED308], v6, v8);
}

uint64_t sub_21446C0F0()
{
  return swift_allocateGenericValueMetadata();
}

void sub_21446C0F8()
{
  sub_21446CB88();
}

void **sub_21446C108(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char *v16;
  _QWORD *v19;
  void **v20;
  void *v21;
  _QWORD *v22;
  void **v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  char *v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = v7;
  v9 = *(_QWORD *)(v6 + 64) + 7;
  v10 = sub_21446F168();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = v12 & 0xF8 | 7;
  if (*(_QWORD *)(v11 + 64) <= 8uLL)
    v14 = 8;
  else
    v14 = *(_QWORD *)(v11 + 64);
  v15 = (v12 | v7) & 0x100000;
  v16 = (char *)*a2;
  *a1 = *a2;
  if ((v13 | v7) != 7
    || v15 != 0
    || v14
     + ((v13
       + ((v9 + ((v7 + 24) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8)
       + 16) & ~v13)
     + 1 > 0x18)
  {
    a1 = (void **)&v16[((v13 | v7) + 16) & ~(v13 | v7)];
LABEL_21:
    swift_retain();
    return a1;
  }
  v39 = v10;
  v40 = v11;
  v19 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFF8);
  v20 = (void **)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  v21 = *v20;
  *v19 = *v20;
  v22 = (_QWORD *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  v23 = (void **)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  v24 = *v23;
  *v22 = *v23;
  v25 = ((unint64_t)v22 + v8 + 8) & ~v8;
  v26 = ((unint64_t)v23 + v8 + 8) & ~v8;
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v28 = v16;
  v29 = v21;
  v30 = v24;
  v27(v25, v26, v5);
  v31 = (_QWORD *)((v9 + v25) & 0xFFFFFFFFFFFFFFF8);
  v32 = (_QWORD *)((v9 + v26) & 0xFFFFFFFFFFFFFFF8);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = (_QWORD *)(((unint64_t)v31 + v13 + 16) & ~v13);
  v35 = (_QWORD *)(((unint64_t)v32 + v13 + 16) & ~v13);
  v36 = *((unsigned __int8 *)v35 + v14);
  swift_retain();
  if (v36 >= 2)
  {
    if (v14 <= 3)
      v37 = v14;
    else
      v37 = 4;
    __asm { BR              X11 }
  }
  if (v36 != 1)
  {
    *v34 = *v35;
    *((_BYTE *)v34 + v14) = 0;
    goto LABEL_21;
  }
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v40 + 16))(v34, v35, v39);
  *((_BYTE *)v34 + v14) = 1;
  return a1;
}

uint64_t sub_21446C34C(id *a1, uint64_t a2)
{
  unint64_t v3;
  id *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v3 = (unint64_t)a1 + 15;

  v3 &= 0xFFFFFFFFFFFFF8uLL;
  v4 = (id *)((v3 + 15) & 0xFFFFFFFFFFFFFFF8);

  v5 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v6 = ((unint64_t)v4 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t))(v5 + 8))(v6);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  v8 = *(_QWORD *)(sub_21446F168() - 8);
  v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v10 = (v7 + v9 + 16) & ~v9;
  v11 = *(_QWORD *)(v8 + 64);
  if (v11 <= 8)
    v11 = 8;
  v12 = *(unsigned __int8 *)(v10 + v11);
  if (v12 >= 2)
  {
    if (v11 <= 3)
      v13 = v11;
    else
      v13 = 4;
    __asm { BR              X14 }
  }
  if (v12 == 1)
    return (*(uint64_t (**)(void))(v8 + 8))();
  else
    return swift_release();
}

void **sub_21446C498(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  _QWORD *v5;
  void **v6;
  void *v7;
  _QWORD *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  char v35;

  v4 = *a2;
  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFF8);
  v6 = (void **)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFF8);
  v7 = *v6;
  *v5 = *v6;
  v8 = (_QWORD *)(((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  v9 = (void **)(((unint64_t)v6 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = *v9;
  *v8 = *v9;
  v11 = *(_QWORD *)(a3 + 16);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = ((unint64_t)v8 + v13 + 8) & ~v13;
  v15 = ((unint64_t)v9 + v13 + 8) & ~v13;
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v17 = v4;
  v18 = v7;
  v19 = v10;
  v16(v14, v15, v11);
  v20 = *(_QWORD *)(v12 + 64) + 7;
  v21 = (_QWORD *)((v20 + v14) & 0xFFFFFFFFFFFFFFF8);
  v22 = (_QWORD *)((v20 + v15) & 0xFFFFFFFFFFFFFFF8);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = sub_21446F168();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(_DWORD *)(v25 + 80) & 0xF8;
  v27 = v26 + 23;
  v28 = (unint64_t)v21 + v26 + 23;
  v29 = ~v26 & 0xFFFFFFFFFFFFFFF8;
  v30 = (_QWORD *)(v28 & v29);
  v31 = (_QWORD *)(((unint64_t)v22 + v27) & v29);
  if (*(_QWORD *)(v25 + 64) <= 8uLL)
    v32 = 8;
  else
    v32 = *(_QWORD *)(v25 + 64);
  v33 = *((unsigned __int8 *)v31 + v32);
  swift_retain();
  if (v33 >= 2)
  {
    if (v32 <= 3)
      v34 = v32;
    else
      v34 = 4;
    __asm { BR              X11 }
  }
  if (v33 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v25 + 16))(v30, v31, v24);
    v35 = 1;
  }
  else
  {
    *v30 = *v31;
    swift_retain();
    v35 = 0;
  }
  *((_BYTE *)v30 + v32) = v35;
  return a1;
}

void **sub_21446C650(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  void **v14;
  void **v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;

  v6 = (unint64_t)a2 + 15;
  v5 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = (unint64_t)a1 + 15;
  v9 = v5;

  v10 = (_QWORD *)(v8 & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFF8uLL;
  v11 = *(void **)v6;
  v12 = *(void **)(v8 & 0xFFFFFFFFFFFFFFF8);
  *v10 = *(_QWORD *)v6;
  v13 = v11;

  v14 = (void **)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  v15 = (void **)((v6 + 15) & 0xFFFFFFFFFFFFFFF8);
  v16 = *v15;
  v17 = *v14;
  *v14 = *v15;
  v18 = v16;

  v19 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = ((unint64_t)v14 + v20 + 8) & ~v20;
  v22 = ((unint64_t)v15 + v20 + 8) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v21, v22);
  v23 = *(_QWORD *)(v19 + 64) + 7;
  v24 = (_QWORD *)((v23 + v21) & 0xFFFFFFFFFFFFFFF8);
  v25 = (_QWORD *)((v23 + v22) & 0xFFFFFFFFFFFFFFF8);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_release();
  v27 = sub_21446F168();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(_DWORD *)(v28 + 80) & 0xF8;
  v30 = v29 + 23;
  v31 = (unint64_t)v24 + v29 + 23;
  v32 = ~v29 & 0xFFFFFFFFFFFFFFF8;
  v33 = (_QWORD *)(v31 & v32);
  v34 = (unint64_t)v25 + v30;
  v35 = (_QWORD *)(v34 & v32);
  if ((v31 & v32) != (v34 & v32))
  {
    v36 = v27;
    if (*(_QWORD *)(v28 + 64) <= 8uLL)
      v37 = 8;
    else
      v37 = *(_QWORD *)(v28 + 64);
    v38 = *((unsigned __int8 *)v33 + v37);
    if (v38 >= 2)
    {
      if (v37 <= 3)
        v39 = v37;
      else
        v39 = 4;
      __asm { BR              X12 }
    }
    if (v38 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v28 + 8))(v33, v27);
    else
      swift_release();
    v40 = *((unsigned __int8 *)v35 + v37);
    if (v40 >= 2)
    {
      if (v37 <= 3)
        v41 = v37;
      else
        v41 = 4;
      __asm { BR              X12 }
    }
    if (v40 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v28 + 16))(v33, v35, v36);
      *((_BYTE *)v33 + v37) = 1;
    }
    else
    {
      *v33 = *v35;
      *((_BYTE *)v33 + v37) = 0;
      swift_retain();
    }
  }
  return a1;
}

void **sub_21446C8C4(void **a1, void **a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void **v9;
  void **v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  char v34;

  v5 = (unint64_t)a2 + 15;
  v6 = *a1;
  *a1 = *a2;
  v7 = (unint64_t)a1 + 15;

  v7 &= 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFF8uLL;
  v8 = *(void **)v7;
  *(_QWORD *)v7 = *(_QWORD *)v5;

  v9 = (void **)((v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (void **)((v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = *v9;
  *v9 = *v10;

  v12 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = ((unint64_t)v9 + v13 + 8) & ~v13;
  v15 = ((unint64_t)v10 + v13 + 8) & ~v13;
  (*(void (**)(uint64_t, uint64_t))(v12 + 40))(v14, v15);
  v16 = *(_QWORD *)(v12 + 64) + 7;
  v17 = (_OWORD *)((v16 + v14) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_OWORD *)((v16 + v15) & 0xFFFFFFFFFFFFFFF8);
  *v17 = *v18;
  swift_release();
  v19 = sub_21446F168();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_DWORD *)(v20 + 80) & 0xF8;
  v22 = v21 + 23;
  v23 = (unint64_t)v17 + v21 + 23;
  v24 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  v25 = (_QWORD *)(v23 & v24);
  v26 = (unint64_t)v18 + v22;
  v27 = (_QWORD *)(v26 & v24);
  if ((v23 & v24) != (v26 & v24))
  {
    v28 = v19;
    if (*(_QWORD *)(v20 + 64) <= 8uLL)
      v29 = 8;
    else
      v29 = *(_QWORD *)(v20 + 64);
    v30 = *((unsigned __int8 *)v25 + v29);
    if (v30 >= 2)
    {
      if (v29 <= 3)
        v31 = v29;
      else
        v31 = 4;
      __asm { BR              X12 }
    }
    if (v30 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v20 + 8))(v25, v19);
    else
      swift_release();
    v32 = *((unsigned __int8 *)v27 + v29);
    if (v32 >= 2)
    {
      if (v29 <= 3)
        v33 = v29;
      else
        v33 = 4;
      __asm { BR              X12 }
    }
    if (v32 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v20 + 32))(v25, v27, v28);
      v34 = 1;
    }
    else
    {
      v34 = 0;
      *v25 = *v27;
    }
    *((_BYTE *)v25 + v29) = v34;
  }
  return a1;
}

void sub_21446CB24(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_21446F168();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_21446CB7C()
{
  sub_21446CB88();
}

void sub_21446CB88()
{
  unint64_t v0;
  unint64_t v1;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_21446CB24(319, &qword_254D76298, MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void **sub_21446CC48(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char *v15;
  void **v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(unint64_t, unint64_t, uint64_t);
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  v9 = sub_21446F168();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = v11 & 0xF8 | 7;
  if (*(_QWORD *)(v10 + 64) <= 8uLL)
    v13 = 8;
  else
    v13 = *(_QWORD *)(v10 + 64);
  v14 = (v11 | v7) & 0x100000;
  v15 = (char *)*a2;
  *a1 = *a2;
  if ((v12 | v7) != 7
    || v14 != 0
    || v13
     + ((v12
       + ((v8 + ((v7 + 24) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8)
       + 16) & ~v12)
     + 1 > 0x18)
  {
    v18 = (void **)&v15[((v12 | v7) + 16) & ~(v12 | v7)];
LABEL_21:
    swift_retain();
    return v18;
  }
  v35 = v9;
  v36 = v10;
  v19 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFF8);
  v20 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v19 = *v20;
  v21 = (_QWORD *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  v22 = (_QWORD *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v21 = *v22;
  v23 = ((unint64_t)v21 + v7 + 8) & ~(unint64_t)v7;
  v24 = ((unint64_t)v22 + v7 + 8) & ~(unint64_t)v7;
  v25 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  v26 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25(v23, v24, v5);
  v27 = (_QWORD *)((v8 + v23) & 0xFFFFFFFFFFFFFFF8);
  v28 = (_QWORD *)((v8 + v24) & 0xFFFFFFFFFFFFFFF8);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = (_QWORD *)(((unint64_t)v27 + v12 + 16) & ~v12);
  v31 = (_QWORD *)(((unint64_t)v28 + v12 + 16) & ~v12);
  v32 = *((unsigned __int8 *)v31 + v13);
  swift_retain();
  if (v32 >= 2)
  {
    if (v13 <= 3)
      v33 = v13;
    else
      v33 = 4;
    __asm { BR              X11 }
  }
  v18 = a1;
  if (v32 != 1)
  {
    *v30 = *v31;
    *((_BYTE *)v30 + v13) = 0;
    goto LABEL_21;
  }
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v36 + 16))(v30, v31, v35);
  *((_BYTE *)v30 + v13) = 1;
  return v18;
}

uint64_t sub_21446CE94(id *a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v3 = (unint64_t)a1 + 15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v5 = ((((v3 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  v7 = *(_QWORD *)(sub_21446F168() - 8);
  v8 = *(_DWORD *)(v7 + 80) & 0xF8 | 7;
  v9 = (v6 + v8 + 16) & ~v8;
  v10 = *(_QWORD *)(v7 + 64);
  if (v10 <= 8)
    v10 = 8;
  v11 = *(unsigned __int8 *)(v9 + v10);
  if (v11 >= 2)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X14 }
  }
  if (v11 == 1)
    return (*(uint64_t (**)(void))(v7 + 8))();
  else
    return swift_release();
}

void **sub_21446CFE0(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  id v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  char v31;

  v4 = *a2;
  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = (_QWORD *)(((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)v6 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = ((unint64_t)v7 + v11 + 8) & ~v11;
  v13 = ((unint64_t)v8 + v11 + 8) & ~v11;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v15 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v12, v13, v9);
  v16 = *(_QWORD *)(v10 + 64) + 7;
  v17 = (_QWORD *)((v16 + v12) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)((v16 + v13) & 0xFFFFFFFFFFFFFFF8);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = sub_21446F168();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(_DWORD *)(v21 + 80) & 0xF8;
  v23 = v22 + 23;
  v24 = (unint64_t)v17 + v22 + 23;
  v25 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  v26 = (_QWORD *)(v24 & v25);
  v27 = (_QWORD *)(((unint64_t)v18 + v23) & v25);
  if (*(_QWORD *)(v21 + 64) <= 8uLL)
    v28 = 8;
  else
    v28 = *(_QWORD *)(v21 + 64);
  v29 = *((unsigned __int8 *)v27 + v28);
  swift_retain();
  if (v29 >= 2)
  {
    if (v28 <= 3)
      v30 = v28;
    else
      v30 = 4;
    __asm { BR              X11 }
  }
  if (v29 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v21 + 16))(v26, v27, v20);
    v31 = 1;
  }
  else
  {
    *v26 = *v27;
    swift_retain();
    v31 = 0;
  }
  *((_BYTE *)v26 + v28) = v31;
  return a1;
}

void **sub_21446D1A0(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;

  v6 = (unint64_t)a2 + 15;
  v5 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = (unint64_t)a1 + 15;
  v9 = v5;

  *(_QWORD *)(v8 & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(v6 & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = (_QWORD *)(((v8 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((v6 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = ((unint64_t)v10 + v13 + 8) & ~v13;
  v15 = ((unint64_t)v11 + v13 + 8) & ~v13;
  (*(void (**)(uint64_t, uint64_t))(v12 + 24))(v14, v15);
  v16 = *(_QWORD *)(v12 + 64) + 7;
  v17 = (_QWORD *)((v16 + v14) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)((v16 + v15) & 0xFFFFFFFFFFFFFFF8);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  v20 = sub_21446F168();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(_DWORD *)(v21 + 80) & 0xF8;
  v23 = v22 + 23;
  v24 = (unint64_t)v17 + v22 + 23;
  v25 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  v26 = (_QWORD *)(v24 & v25);
  v27 = (unint64_t)v18 + v23;
  v28 = (_QWORD *)(v27 & v25);
  if ((v24 & v25) != (v27 & v25))
  {
    v29 = v20;
    if (*(_QWORD *)(v21 + 64) <= 8uLL)
      v30 = 8;
    else
      v30 = *(_QWORD *)(v21 + 64);
    v31 = *((unsigned __int8 *)v26 + v30);
    if (v31 >= 2)
    {
      if (v30 <= 3)
        v32 = v30;
      else
        v32 = 4;
      __asm { BR              X12 }
    }
    if (v31 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v21 + 8))(v26, v20);
    else
      swift_release();
    v33 = *((unsigned __int8 *)v28 + v30);
    if (v33 >= 2)
    {
      if (v30 <= 3)
        v34 = v30;
      else
        v34 = 4;
      __asm { BR              X12 }
    }
    if (v33 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v21 + 16))(v26, v28, v29);
      *((_BYTE *)v26 + v30) = 1;
    }
    else
    {
      *v26 = *v28;
      *((_BYTE *)v26 + v30) = 0;
      swift_retain();
    }
  }
  return a1;
}

_QWORD *sub_21446D418(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  char v25;

  *a1 = *a2;
  v4 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFF8);
  v5 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = (_QWORD *)(((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)v6 + v9 + 8) & ~v9;
  v11 = ((unint64_t)v7 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v10, v11);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (_OWORD *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v15 = *(_QWORD *)(sub_21446F168() - 8);
  v16 = *(_DWORD *)(v15 + 80) & 0xF8;
  v17 = v16 + 23;
  v18 = (unint64_t)v13 + v16 + 23;
  v19 = ~v16 & 0xFFFFFFFFFFFFFFF8;
  v20 = (_QWORD *)(v18 & v19);
  v21 = (_QWORD *)(((unint64_t)v14 + v17) & v19);
  if (*(_QWORD *)(v15 + 64) <= 8uLL)
    v22 = 8;
  else
    v22 = *(_QWORD *)(v15 + 64);
  v23 = *((unsigned __int8 *)v21 + v22);
  if (v23 >= 2)
  {
    if (v22 <= 3)
      v24 = v22;
    else
      v24 = 4;
    __asm { BR              X13 }
  }
  if (v23 == 1)
  {
    (*(void (**)(_QWORD *))(v15 + 32))(v20);
    v25 = 1;
  }
  else
  {
    v25 = 0;
    *v20 = *v21;
  }
  *((_BYTE *)v20 + v22) = v25;
  return a1;
}

void **sub_21446D59C(void **a1, void **a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  char v32;

  v5 = (unint64_t)a2 + 15;
  v6 = *a1;
  *a1 = *a2;
  v7 = (unint64_t)a1 + 15;

  v7 &= 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFF8uLL;
  *(_QWORD *)v7 = *(_QWORD *)v5;
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)((v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v9 = (_QWORD *)((v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v8 = *v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = ((unint64_t)v8 + v11 + 8) & ~v11;
  v13 = ((unint64_t)v9 + v11 + 8) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v10 + 40))(v12, v13);
  v14 = *(_QWORD *)(v10 + 64) + 7;
  v15 = (_OWORD *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_OWORD *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  swift_release();
  v17 = sub_21446F168();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_DWORD *)(v18 + 80) & 0xF8;
  v20 = v19 + 23;
  v21 = (unint64_t)v15 + v19 + 23;
  v22 = ~v19 & 0xFFFFFFFFFFFFFFF8;
  v23 = (_QWORD *)(v21 & v22);
  v24 = (unint64_t)v16 + v20;
  v25 = (_QWORD *)(v24 & v22);
  if ((v21 & v22) != (v24 & v22))
  {
    v26 = v17;
    if (*(_QWORD *)(v18 + 64) <= 8uLL)
      v27 = 8;
    else
      v27 = *(_QWORD *)(v18 + 64);
    v28 = *((unsigned __int8 *)v23 + v27);
    if (v28 >= 2)
    {
      if (v27 <= 3)
        v29 = v27;
      else
        v29 = 4;
      __asm { BR              X12 }
    }
    if (v28 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v18 + 8))(v23, v17);
    else
      swift_release();
    v30 = *((unsigned __int8 *)v25 + v27);
    if (v30 >= 2)
    {
      if (v27 <= 3)
        v31 = v27;
      else
        v31 = 4;
      __asm { BR              X12 }
    }
    if (v30 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v18 + 32))(v23, v25, v26);
      v32 = 1;
    }
    else
    {
      v32 = 0;
      *v23 = *v25;
    }
    *((_BYTE *)v23 + v27) = v32;
  }
  return a1;
}

uint64_t sub_21446D7F4(_QWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  unsigned int v17;
  int v18;
  uint64_t v19;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v6 + 84);
  v9 = *(_QWORD *)(sub_21446F168() - 8);
  v10 = 8;
  if (*(_QWORD *)(v9 + 64) > 8uLL)
    v10 = *(_QWORD *)(v9 + 64);
  if (!a2)
    return 0;
  v11 = *(unsigned __int8 *)(v6 + 80);
  if (a2 <= v8)
    goto LABEL_24;
  v12 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  v13 = v10 + ((v12 + ((*(_QWORD *)(v6 + 64) + ((v11 + 24) & ~v11) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v12) + 1;
  v14 = 8 * v13;
  if (v13 <= 3)
  {
    v17 = ((a2 - v8 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v17))
    {
      v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15)
        goto LABEL_24;
      goto LABEL_17;
    }
    if (v17 > 0xFF)
    {
      v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(_WORD *)((char *)a1 + v13))
        goto LABEL_24;
      goto LABEL_17;
    }
    if (v17 < 2)
    {
LABEL_24:
      if ((v7 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(((((((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + v11 + 8) & ~v11, v7, v5);
      v19 = *a1;
      if (*a1 >= 0xFFFFFFFFuLL)
        LODWORD(v19) = -1;
      return (v19 + 1);
    }
  }
  v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((_BYTE *)a1 + v13))
    goto LABEL_24;
LABEL_17:
  v18 = (v15 - 1) << v14;
  if (v13 > 3)
    v18 = 0;
  if ((_DWORD)v13)
  {
    if (v13 > 3)
      LODWORD(v13) = 4;
    __asm { BR              X11 }
  }
  return v8 + v18 + 1;
}

void sub_21446D9CC(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v7 + 84) <= 0x7FFFFFFFu)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(sub_21446F168() - 8);
  v10 = 8;
  if (*(_QWORD *)(v9 + 64) > 8uLL)
    v10 = *(_QWORD *)(v9 + 64);
  v11 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  v12 = v10
      + ((v11
        + ((*(_QWORD *)(v7 + 64)
          + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
          + 7) & 0xFFFFFFFFFFFFFFF8)
        + 16) & ~v11)
      + 1;
  if (a3 <= v8)
  {
    v13 = 0;
  }
  else if (v12 <= 3)
  {
    v15 = ((a3 - v8 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v13 = 4u;
    }
    else if (v15 >= 0x100)
    {
      v13 = 2;
    }
    else
    {
      v13 = v15 > 1;
    }
  }
  else
  {
    v13 = 1u;
  }
  if (v8 < a2)
  {
    v14 = ~v8 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        v16 = v14 & ~(-1 << (8 * v12));
        bzero(a1, v12);
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v12);
      *(_DWORD *)a1 = v14;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t sub_21446DC30()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21446DC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD aBlock[6];

  v17 = a3;
  v18 = a4;
  v6 = type metadata accessor for HealthStoreAuthorizationOverlayModifier(0, a3, a4, a4);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - v8;
  v19 = *(id *)a2;
  objc_msgSend(v19, sel_setAuthorizationViewControllerPresenter_, a1);
  v10 = *(void **)(a2 + 8);
  if (v10)
  {
    sub_21446E588(0, &qword_254D762B0);
    sub_21446E5C0(&qword_254D762B8, &qword_254D762B0);
    v10 = (void *)sub_21446F1A4();
  }
  v11 = *(void **)(a2 + 16);
  if (v11)
  {
    sub_21446E588(0, &qword_254D762A0);
    sub_21446E5C0(&qword_254D762A8, &qword_254D762A0);
    v11 = (void *)sub_21446F1A4();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  v14 = v18;
  *(_QWORD *)(v13 + 16) = v17;
  *(_QWORD *)(v13 + 24) = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, v9, v6);
  aBlock[4] = sub_21446E564;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21446DE80;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v19, sel_requestAuthorizationToShareTypes_readTypes_completion_, v10, v11, v15);
  _Block_release(v15);

}

void sub_21446DE80(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_21446DEE8()
{
  return sub_21446F114();
}

uint64_t sub_21446DF00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return sub_21446DF2C(a1, a2, (uint64_t)&unk_24D191A90, (uint64_t)sub_21446E43C, a3);
}

uint64_t sub_21446DF2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, char *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _QWORD v45[4];

  v41 = a3;
  v42 = a4;
  v43 = a1;
  v44 = a5;
  v7 = *(_QWORD *)(*(_QWORD *)(a2 - 8) + 64);
  v8 = *(_QWORD *)(a2 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v38 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v10 + 16);
  v35 = *(_QWORD *)(v11 - 8);
  v12 = v35;
  MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x2199CDFC8](v15);
  v16 = sub_21446F150();
  v37 = v16;
  v39 = MEMORY[0x2199CDFC8](MEMORY[0x24BDEFB78], v16);
  v17 = *(_QWORD *)(a2 + 24);
  v45[0] = v16;
  v45[1] = v11;
  v45[2] = v39;
  v45[3] = v17;
  v18 = v17;
  v19 = MEMORY[0x2199CDFBC](0, v45, MEMORY[0x24BDF38E8], 0);
  v40 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v36 = (char *)&v35 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v5 + *(int *)(a2 + 44), v11);
  v24 = v8;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v26 = v38;
  v25(v38, v5, a2);
  v27 = v24;
  v28 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v11;
  *(_QWORD *)(v29 + 24) = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v29 + v28, v26, a2);
  swift_checkMetadataState();
  sub_21446F18C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v11);
  v30 = v40;
  v31 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v32 = v36;
  v31(v36, v22, v19);
  v33 = *(void (**)(char *, uint64_t))(v30 + 8);
  v33(v22, v19);
  v31(v44, v32, v19);
  return ((uint64_t (*)(char *, uint64_t))v33)(v32, v19);
}

uint64_t sub_21446E19C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = sub_21446F168();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  a4(0, a2, a3);
  sub_21446E600((uint64_t)v11);
  v14 = a2;
  v15 = a3;
  v16 = a1;
  sub_21446F15C();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_21446E268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v8 = type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier(0, a3, a4, a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - v10;
  v12 = *(id *)a2;
  objc_msgSend(*(id *)a2, sel_setAuthorizationViewControllerPresenter_, a1);
  v13 = *(_QWORD *)(a2 + 16);
  v18 = *(_QWORD *)(a2 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v14, v11, v8);
  aBlock[4] = sub_21446EF0C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21446DE80;
  aBlock[3] = &block_descriptor_14;
  v16 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v12, sel_requestPerObjectReadAuthorizationForType_predicate_completion_, v18, v13, v16);
  _Block_release(v16);
}

uint64_t sub_21446E3D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return sub_21446DF2C(a1, a2, (uint64_t)&unk_24D191B08, (uint64_t)sub_21446ED78, a3);
}

uint64_t sub_21446E404()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21446E43C(uint64_t a1, uint64_t a2)
{
  return sub_21446ED8C(a1, a2, (void (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for HealthStoreAuthorizationOverlayModifier);
}

void sub_21446E450(uint64_t a1)
{
  uint64_t *v1;

  sub_21446DC64(a1, v1[4], v1[2], v1[3]);
}

uint64_t objectdestroyTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  char *v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for HealthStoreAuthorizationOverlayModifier(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (id *)(v4 + ((v7 + 32) & ~v7));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((char *)v8 + *(int *)(v6 + 44), v5);
  swift_release();
  v9 = (char *)v8 + *(int *)(v6 + 52);
  sub_21446CB24(0, &qword_254D76298, MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_21446F168();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_21446E564(char a1, void *a2)
{
  return sub_21446EF18(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for HealthStoreAuthorizationOverlayModifier);
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

uint64_t sub_21446E588(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21446E5C0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_21446E588(255, a2);
    result = MEMORY[0x2199CDFC8](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21446E600@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_21446F144();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21446CB24(0, &qword_254D76298, MEMORY[0x24BDEB560]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - v9;
  sub_21446E810(v2, (uint64_t)&v17 - v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_21446F168();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_21446F1B0();
    v14 = sub_21446F174();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_21446E884(0xD000000000000022, 0x800000021446FCD0, &v18);
      _os_log_impl(&dword_214468000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199CE010](v16, -1, -1);
      MEMORY[0x2199CE010](v15, -1, -1);
    }

    sub_21446F138();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_21446E810(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21446CB24(0, &qword_254D76298, MEMORY[0x24BDEB560]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21446E864()
{
  return sub_21446F12C();
}

unint64_t sub_21446E884(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21446E954(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21446EA70((uint64_t)v12, *a3);
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
      sub_21446EA70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_21446E954(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_21446EAAC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_21446F1C8();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21446EA70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21446EAAC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21446EB40(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_21446EC38(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_21446EC38((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21446EB40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21446EBD8(v2, 0);
      result = sub_21446F1BC();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_21446F198();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21446EBD8(uint64_t a1, uint64_t a2)
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
  sub_21446ED1C();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21446EC38(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
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
    sub_21446ED1C();
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_21446ED1C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D762C0)
  {
    v0 = sub_21446F1D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D762C0);
  }
}

uint64_t sub_21446ED78(uint64_t a1, uint64_t a2)
{
  return sub_21446ED8C(a1, a2, (void (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier);
}

uint64_t sub_21446ED8C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD, uint64_t, uint64_t))a3)(0, v5, v6) - 8) + 80);
  return sub_21446E19C(v3 + ((v7 + 32) & ~v7), v5, v6, a3);
}

void sub_21446EDF8(uint64_t a1)
{
  uint64_t *v1;

  sub_21446E268(a1, v1[4], v1[2], v1[3]);
}

uint64_t objectdestroy_7Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  char *v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (id *)(v4 + ((v7 + 32) & ~v7));

  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((char *)v8 + *(int *)(v6 + 44), v5);
  swift_release();
  v9 = (char *)v8 + *(int *)(v6 + 52);
  sub_21446CB24(0, &qword_254D76298, MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_21446F168();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_21446EF0C(char a1, void *a2)
{
  return sub_21446EF18(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier);
}

uint64_t sub_21446EF18(char a1, void *a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);
  id v11;

  v6 = a3(0, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  v7 = v6;
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v9 = v3 + ((v8 + 32) & ~v8);
  if (a2)
  {
    v10 = *(void (**)(void *, uint64_t))(v9 + *(int *)(v6 + 48));
    v11 = a2;
    v10(a2, 1);

  }
  return (*(uint64_t (**)(_QWORD, _QWORD))(v9 + *(int *)(v7 + 48)))(a1 & 1, 0);
}

uint64_t sub_21446EFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21446CB24(0, &qword_254D76290, MEMORY[0x24BDEB580]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199CDF80](a1, v6, a5);
}

uint64_t sub_21446F034(_QWORD *a1)
{
  return get_witness_table_SQRzlqd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___Sbyqd___qd__tctSQRd__lFQOyAA01_C16Modifier_ContentVy09HealthKitB00j25StoreAuthorizationOverlayH033_214B0F285CDA8168FBED6EA091EA168CLLVyxGG_xQo_HOTm(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD))type metadata accessor for HealthStoreAuthorizationOverlayModifier, (uint64_t)&unk_21446FA48);
}

uint64_t sub_21446F048(_QWORD *a1)
{
  return get_witness_table_SQRzlqd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___Sbyqd___qd__tctSQRd__lFQOyAA01_C16Modifier_ContentVy09HealthKitB00j25StoreAuthorizationOverlayH033_214B0F285CDA8168FBED6EA091EA168CLLVyxGG_xQo_HOTm(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier, (uint64_t)&unk_21446F9F8);
}

uint64_t get_witness_table_SQRzlqd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___Sbyqd___qd__tctSQRd__lFQOyAA01_C16Modifier_ContentVy09HealthKitB00j25StoreAuthorizationOverlayH033_214B0F285CDA8168FBED6EA091EA168CLLVyxGG_xQo_HOTm(_QWORD *a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;

  v4 = a2(255, *a1, a1[1]);
  MEMORY[0x2199CDFC8](a3, v4);
  v6 = sub_21446F150();
  MEMORY[0x2199CDFC8](MEMORY[0x24BDEFB78], v6);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21446F0FC()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_21446F108()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_21446F114()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_21446F120()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_21446F12C()
{
  return MEMORY[0x24BDEE318]();
}

uint64_t sub_21446F138()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_21446F144()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_21446F150()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_21446F15C()
{
  return MEMORY[0x24BDF1308]();
}

uint64_t sub_21446F168()
{
  return MEMORY[0x24BDF1310]();
}

uint64_t sub_21446F174()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_21446F180()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_21446F18C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_21446F198()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21446F1A4()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_21446F1B0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21446F1BC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21446F1C8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21446F1D4()
{
  return MEMORY[0x24BEE3598]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HKProgramSDKAtLeast()
{
  return MEMORY[0x24BDD3320]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

