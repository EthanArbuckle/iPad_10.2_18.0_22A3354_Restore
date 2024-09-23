double sub_1AC6FF360(uint64_t a1, double a2)
{
  return AppStore.FourLineTextLayout.measurements(fitting:in:)(a1, a2);
}

uint64_t sub_1AC6FF378@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + 16;
  swift_beginAccess();
  return sub_1AC68E218(v3, a2);
}

uint64_t sub_1AC6FF3C4(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.primaryText.setter(v2);
}

uint64_t sub_1AC6FF3F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC6FD924(v3 + 56, a2);
}

uint64_t sub_1AC6FF440(uint64_t a1)
{
  _BYTE v2[40];

  sub_1AC6FD924(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.middleStationaryText.setter((uint64_t)v2);
}

uint64_t sub_1AC6FF474@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 96, a2);
}

uint64_t sub_1AC6FF4BC(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.secondaryText.setter(v2);
}

uint64_t sub_1AC6FF4F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 136, a2);
}

uint64_t sub_1AC6FF538(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.primaryFirstLineSpace.setter(v2);
}

uint64_t sub_1AC6FF56C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 176, a2);
}

uint64_t sub_1AC6FF5B4(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.primarySecondLineSpace.setter(v2);
}

uint64_t sub_1AC6FF5E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 216, a2);
}

uint64_t sub_1AC6FF630(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.middleStationaryLineSpace.setter(v2);
}

uint64_t sub_1AC6FF668(uint64_t a1)
{
  _BYTE v2[40];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.secondaryFirstLineSpace.setter(v2);
}

uint64_t keypath_get_11Tm@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 256, a2);
}

uint64_t sub_1AC6FF6E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 336);
  return result;
}

uint64_t sub_1AC6FF72C(uint64_t *a1)
{
  return AppStore.FourLineTextLayout.numberOfLines.setter(*a1);
}

ValueMetadata *type metadata accessor for AppStore.FourLineTextLayout()
{
  return &type metadata for AppStore.FourLineTextLayout;
}

uint64_t _s18FourLineTextLayoutV7StorageVwxx(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 280);
}

uint64_t _s18FourLineTextLayoutV7StorageVwcp(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  _OWORD *v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = (_OWORD *)(a1 + 40);
  v6 = (_OWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 64);
  if (v7)
  {
    v8 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v7;
    *(_QWORD *)(a1 + 72) = v8;
    (**(void (***)(_OWORD *, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 56);
    *v5 = *v6;
    *(_OWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, a2 + 80);
  v11 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 120, a2 + 120);
  v12 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 160, a2 + 160);
  v13 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 200, a2 + 200);
  v14 = *(_QWORD *)(a2 + 264);
  v15 = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 264) = v14;
  *(_QWORD *)(a1 + 272) = v15;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 240, a2 + 240);
  v16 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 280, a2 + 280);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  return a1;
}

uint64_t _s18FourLineTextLayoutV7StorageVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  v4 = *(_QWORD *)(a2 + 64);
  if (!*(_QWORD *)(a1 + 64))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 64) = v4;
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
      goto LABEL_8;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 40);
    v6 = *(_OWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 40) = v5;
    *(_OWORD *)(a1 + 56) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)(a2 + 160));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 200), (uint64_t *)(a2 + 200));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)(a2 + 240));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 280), (uint64_t *)(a2 + 280));
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  return a1;
}

void *__swift_memcpy328_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x148uLL);
}

uint64_t _s18FourLineTextLayoutV7StorageVwta(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  v8 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v8;
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  v9 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v9;
  v10 = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = v10;
  return a1;
}

uint64_t _s18FourLineTextLayoutV7StorageVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 328))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s18FourLineTextLayoutV7StorageVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 328) = 1;
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
    *(_BYTE *)(result + 328) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s18FourLineTextLayoutV7StorageVMa()
{
  return &_s18FourLineTextLayoutV7StorageVN;
}

uint64_t Center.init(_:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1[3];
  v5 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  Measurable.placeable.getter(v4, v5, a2);
  a2[5] = 0;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t Center.init(_:filling:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a1[3];
  v7 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  Measurable.placeable.getter(v6, v7, a3);
  a3[5] = a2;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

UIFontDescriptor_optional __swiftcall UIFontDescriptor.withCompatibleSymbolicTraits(_:)(UIFontDescriptorSymbolicTraits a1)
{
  void *v1;
  objc_class *v2;
  Swift::Bool v3;
  UIFontDescriptor_optional result;

  v2 = (objc_class *)objc_msgSend(v1, sel_fontDescriptorWithSymbolicTraits_, *(_QWORD *)&a1);
  result.value.super.isa = v2;
  result.is_nil = v3;
  return result;
}

__n128 AppStore.ThreeLineTextLayout.init(primaryText:secondaryText:primaryRegularSpace:primaryCompressedSpace:secondarySpace:numberOfLines:)@<Q0>(__int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, __int128 *a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __n128 result;
  _OWORD v20[2];
  _OWORD v21[3];
  _OWORD v22[2];
  _OWORD v23[3];
  _OWORD v24[2];
  __int128 v25;

  sub_1AC68AAA4(a1, (uint64_t)v20);
  sub_1AC68AAA4(a2, (uint64_t)v21 + 8);
  sub_1AC68AAA4(a3, (uint64_t)v22);
  sub_1AC68AAA4(a4, (uint64_t)v23 + 8);
  sub_1AC68AAA4(a5, (uint64_t)v24);
  *((_QWORD *)&v25 + 1) = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD608);
  v13 = swift_allocObject();
  v14 = v24[1];
  *(_OWORD *)(v13 + 176) = v24[0];
  *(_OWORD *)(v13 + 192) = v14;
  *(_OWORD *)(v13 + 208) = v25;
  v15 = v23[0];
  *(_OWORD *)(v13 + 112) = v22[1];
  *(_OWORD *)(v13 + 128) = v15;
  v16 = v23[2];
  *(_OWORD *)(v13 + 144) = v23[1];
  *(_OWORD *)(v13 + 160) = v16;
  v17 = v21[1];
  *(_OWORD *)(v13 + 48) = v21[0];
  *(_OWORD *)(v13 + 64) = v17;
  v18 = v22[0];
  *(_OWORD *)(v13 + 80) = v21[2];
  *(_OWORD *)(v13 + 96) = v18;
  result = (__n128)v20[1];
  *(_OWORD *)(v13 + 16) = v20[0];
  *(__n128 *)(v13 + 32) = result;
  *a7 = v13;
  return result;
}

uint64_t AppStore.ThreeLineTextLayout.primaryText.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *v1 + 16;
  swift_beginAccess();
  return sub_1AC68E218(v3, a1);
}

uint64_t AppStore.ThreeLineTextLayout.primaryText.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[13];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC6FFF04(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v13, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC6FFF38((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD608);
    v5 = (_OWORD *)swift_allocObject();
    v6 = v13[11];
    v5[11] = v13[10];
    v5[12] = v6;
    v5[13] = v13[12];
    v7 = v13[7];
    v5[7] = v13[6];
    v5[8] = v7;
    v8 = v13[9];
    v5[9] = v13[8];
    v5[10] = v8;
    v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    v10 = v13[5];
    v5[5] = v13[4];
    v5[6] = v10;
    v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1AC6FFF04(uint64_t a1, uint64_t a2)
{
  _s19ThreeLineTextLayoutV7StorageVwcp(a2, a1);
  return a2;
}

uint64_t sub_1AC6FFF38(uint64_t a1, uint64_t a2)
{
  _s19ThreeLineTextLayoutV7StorageVwta(a2, a1);
  return a2;
}

void (*AppStore.ThreeLineTextLayout.primaryText.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  v4 = *v1 + 16;
  swift_beginAccess();
  sub_1AC68E218(v4, (uint64_t)v3);
  return sub_1AC6FFFD8;
}

void sub_1AC6FFFD8(uint64_t *a1, char a2)
{
  sub_1AC6A65C4(a1, a2, (void (*)(char *))AppStore.ThreeLineTextLayout.primaryText.setter);
}

uint64_t AppStore.ThreeLineTextLayout.secondaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 56, a1);
}

uint64_t AppStore.ThreeLineTextLayout.secondaryText.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[2];
  _OWORD v14[11];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC6FFF04(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14 + 1, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC6FFF38((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD608);
    v5 = (_OWORD *)swift_allocObject();
    v6 = v14[9];
    v5[11] = v14[8];
    v5[12] = v6;
    v5[13] = v14[10];
    v7 = v14[5];
    v5[7] = v14[4];
    v5[8] = v7;
    v8 = v14[7];
    v5[9] = v14[6];
    v5[10] = v8;
    v9 = v14[1];
    v5[3] = v14[0];
    v5[4] = v9;
    v10 = v14[3];
    v5[5] = v14[2];
    v5[6] = v10;
    v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.secondaryText.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  v4 = *v1;
  swift_beginAccess();
  sub_1AC68E218(v4 + 56, (uint64_t)v3);
  return sub_1AC7001A8;
}

void sub_1AC7001A8(uint64_t *a1, char a2)
{
  sub_1AC6A65C4(a1, a2, (void (*)(char *))AppStore.ThreeLineTextLayout.secondaryText.setter);
}

uint64_t AppStore.ThreeLineTextLayout.primaryRegularSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 96, a1);
}

uint64_t AppStore.ThreeLineTextLayout.primaryRegularSpace.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[5];
  _OWORD v14[8];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC6FFF04(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC6FFF38((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD608);
    v5 = (_OWORD *)swift_allocObject();
    v6 = v14[6];
    v5[11] = v14[5];
    v5[12] = v6;
    v5[13] = v14[7];
    v7 = v14[2];
    v5[7] = v14[1];
    v5[8] = v7;
    v8 = v14[4];
    v5[9] = v14[3];
    v5[10] = v8;
    v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    v10 = v14[0];
    v5[5] = v13[4];
    v5[6] = v10;
    v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.primaryRegularSpace.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  v4 = *v1;
  swift_beginAccess();
  sub_1AC68E218(v4 + 96, (uint64_t)v3);
  return sub_1AC700378;
}

void sub_1AC700378(uint64_t *a1, char a2)
{
  sub_1AC6A65C4(a1, a2, (void (*)(char *))AppStore.ThreeLineTextLayout.primaryRegularSpace.setter);
}

uint64_t AppStore.ThreeLineTextLayout.primaryCompressedSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 136, a1);
}

uint64_t AppStore.ThreeLineTextLayout.primaryCompressedSpace.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[7];
  _OWORD v14[6];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC6FFF04(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14 + 1, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC6FFF38((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD608);
    v5 = (_OWORD *)swift_allocObject();
    v6 = v14[4];
    v5[11] = v14[3];
    v5[12] = v6;
    v5[13] = v14[5];
    v7 = v14[0];
    v5[7] = v13[6];
    v5[8] = v7;
    v8 = v14[2];
    v5[9] = v14[1];
    v5[10] = v8;
    v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    v10 = v13[5];
    v5[5] = v13[4];
    v5[6] = v10;
    v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.primaryCompressedSpace.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  v4 = *v1;
  swift_beginAccess();
  sub_1AC68E218(v4 + 136, (uint64_t)v3);
  return sub_1AC700548;
}

void sub_1AC700548(uint64_t *a1, char a2)
{
  sub_1AC6A65C4(a1, a2, (void (*)(char *))AppStore.ThreeLineTextLayout.primaryCompressedSpace.setter);
}

uint64_t AppStore.ThreeLineTextLayout.secondarySpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 176, a1);
}

uint64_t AppStore.ThreeLineTextLayout.secondarySpace.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[10];
  _OWORD v14[3];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC6FFF04(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC6FFF38((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD608);
    v5 = (_OWORD *)swift_allocObject();
    v6 = v14[1];
    v5[11] = v14[0];
    v5[12] = v6;
    v5[13] = v14[2];
    v7 = v13[7];
    v5[7] = v13[6];
    v5[8] = v7;
    v8 = v13[9];
    v5[9] = v13[8];
    v5[10] = v8;
    v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    v10 = v13[5];
    v5[5] = v13[4];
    v5[6] = v10;
    v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.secondarySpace.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  v4 = *v1;
  swift_beginAccess();
  sub_1AC68E218(v4 + 176, (uint64_t)v3);
  return sub_1AC700718;
}

void sub_1AC700718(uint64_t *a1, char a2)
{
  sub_1AC6A65C4(a1, a2, (void (*)(char *))AppStore.ThreeLineTextLayout.secondarySpace.setter);
}

uint64_t AppStore.ThreeLineTextLayout.numberOfLines.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(_QWORD *)(v1 + 216);
}

uint64_t AppStore.ThreeLineTextLayout.numberOfLines.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[12];
  __int128 v14;

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC6FFF04(v3, (uint64_t)v13);
  *((_QWORD *)&v14 + 1) = a1;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC6FFF38((uint64_t)v13, v4);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD608);
    v6 = (_OWORD *)swift_allocObject();
    v7 = v13[11];
    v6[11] = v13[10];
    v6[12] = v7;
    v6[13] = v14;
    v8 = v13[7];
    v6[7] = v13[6];
    v6[8] = v8;
    v9 = v13[9];
    v6[9] = v13[8];
    v6[10] = v9;
    v10 = v13[3];
    v6[3] = v13[2];
    v6[4] = v10;
    v11 = v13[5];
    v6[5] = v13[4];
    v6[6] = v11;
    v12 = v13[1];
    v6[1] = v13[0];
    v6[2] = v12;
    result = swift_release();
    *v1 = v6;
  }
  return result;
}

void (*AppStore.ThreeLineTextLayout.numberOfLines.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = *v1;
  swift_beginAccess();
  v3[3] = *(_QWORD *)(v4 + 216);
  return sub_1AC7008BC;
}

void sub_1AC7008BC(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  AppStore.ThreeLineTextLayout.numberOfLines.setter(*(_QWORD *)(*(_QWORD *)a1 + 24));
  free(v1);
}

double AppStore.ThreeLineTextLayout.measurements(fitting:in:)(uint64_t a1, double a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_BYTE *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v5 = sub_1AC726A48();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = *v2;
  swift_beginAccess();
  sub_1AC68E218(v9 + 96, (uint64_t)v17);
  v10 = v18;
  v11 = v19;
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_1AC68E57C((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v10, v11);
  v12 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v12(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  sub_1AC68E218(v9 + 176, (uint64_t)v17);
  v13 = v18;
  v14 = v19;
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_1AC68E57C((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v13, v14);
  v12(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return a2;
}

double AppStore.ThreeLineTextLayout.placeChildren(relativeTo:in:)@<D0>(void *a1@<X0>, double a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat d;
  CGFloat tx;
  CGFloat v16;
  CGFloat v17;
  char v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double MinY;
  double Width;
  CGFloat v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  __n128 v61;
  CGFloat v62;
  CGFloat ty;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  CGFloat MaxX;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double MaxY;
  double v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  __n128 v83;
  __n128 v84;
  __n128 v85;
  __n128 v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  double v97;
  double v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double result;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  Swift::Int v120;
  CGFloat v121;
  CGFloat v122;
  uint64_t v123;
  CGFloat v124;
  CGFloat v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  Swift::Int v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  double v138;
  __int128 v139;
  double v140;
  __int128 v141;
  __int128 v142;
  CGFloat v143;
  double v144;
  CGFloat MinX;
  CGFloat v146;
  double v147;
  CGFloat v148;
  __int128 v149;
  CGFloat v150;
  CGFloat v151;
  CGFloat v152;
  CGFloat v153;
  CGFloat v154;
  CGAffineTransform v155;
  CGAffineTransform v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  JUMeasurements v179;
  JUMeasurements v180;

  v154 = a6;
  v153 = a5;
  v151 = a4;
  v152 = a3;
  v9 = sub_1AC726A48();
  *(_QWORD *)&v149 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v139 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v6;
  v13 = *v6 + 16;
  swift_beginAccess();
  sub_1AC68E218(v13, (uint64_t)&v156);
  d = v156.d;
  tx = v156.tx;
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  if (((*(uint64_t (**)(CGFloat, CGFloat))(*(_QWORD *)&tx + 88))(COERCE_CGFLOAT(*(_QWORD *)&d), COERCE_CGFLOAT(*(_QWORD *)&tx)) & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
LABEL_4:
    sub_1AC68E218(v13, (uint64_t)&v156);
    v19 = v156.d;
    v20 = v156.tx;
    __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
    (*(void (**)(uint64_t, CGFloat, CGFloat))(*(_QWORD *)&v20 + 24))(1, COERCE_CGFLOAT(*(_QWORD *)&v19), COERCE_CGFLOAT(*(_QWORD *)&v20));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
    sub_1AC68E218(v12 + 56, (uint64_t)&v156);
    v21 = v156.d;
    v22 = v156.tx;
    __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
    (*(void (**)(uint64_t, CGFloat, CGFloat))(*(_QWORD *)&v22 + 24))(1, COERCE_CGFLOAT(*(_QWORD *)&v21), COERCE_CGFLOAT(*(_QWORD *)&v22));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
    sub_1AC68E218(v13, (uint64_t)&v156);
    v23 = v156.d;
    v24 = v156.tx;
    __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
    v25 = v153;
    v26 = v154;
    v27 = (*(double (**)(void *, CGFloat, CGFloat, CGFloat))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v24 + 8)
                                                                                  + 8)
                                                                      + 8))(a1, COERCE_CGFLOAT(*(_QWORD *)&v23), v153, v154);
    v150 = v28;
    v30 = v29;
    v148 = v31;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
    sub_1AC68E218(v12 + 56, (uint64_t)&v156);
    v32 = v156.d;
    v33 = v156.tx;
    __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
    *(_QWORD *)&v142 = (*(double (**)(void *, CGFloat, double, double))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v33 + 8)
                                                                                             + 8)
                                                                                 + 8))(a1, COERCE_CGFLOAT(*(_QWORD *)&v32), v25, v26);
    v143 = v34;
    *(_QWORD *)&v141 = v35;
    v144 = v36;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
LABEL_5:
    sub_1AC68E218(v12 + 96, (uint64_t)&v156);
    v37 = *(_QWORD *)&v156.d;
    v38 = *(_QWORD *)&v156.tx;
    __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
    sub_1AC68E57C((uint64_t)v11);
    AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v11, v37, v38);
    v40 = v39;
    v41 = *(void (**)(char *, uint64_t))(v149 + 8);
    v41(v11, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
    goto LABEL_6;
  }
  sub_1AC68E218(v12 + 56, (uint64_t)&v155);
  v16 = v155.d;
  v17 = v155.tx;
  __swift_project_boxed_opaque_existential_1(&v155, *(uint64_t *)&v155.d);
  v18 = (*(uint64_t (**)(CGFloat, CGFloat))(*(_QWORD *)&v17 + 88))(COERCE_CGFLOAT(*(_QWORD *)&v16), COERCE_CGFLOAT(*(_QWORD *)&v17));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  if ((v18 & 1) != 0)
    goto LABEL_4;
  v146 = a2;
  sub_1AC68E218(v13, (uint64_t)&v156);
  v109 = v156.d;
  v110 = v156.tx;
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  (*(void (**)(_QWORD, CGFloat, CGFloat))(*(_QWORD *)&v110 + 24))(*(_QWORD *)(v12 + 216), COERCE_CGFLOAT(*(_QWORD *)&v109), COERCE_CGFLOAT(*(_QWORD *)&v110));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  sub_1AC68E218(v13, (uint64_t)&v156);
  v111 = v156.d;
  v112 = v156.tx;
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  v113 = (*(double (**)(void *, CGFloat, CGFloat, CGFloat))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v112 + 8)
                                                                                 + 8)
                                                                     + 8))(a1, COERCE_CGFLOAT(*(_QWORD *)&v111), v153, v154);
  v115 = v114;
  v117 = v116;
  v119 = v118;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  sub_1AC68E218(v13, (uint64_t)&v156);
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  v179.var0 = v113;
  v150 = v115;
  v179.var1 = v115;
  v179.var2 = v117;
  v148 = v119;
  v179.var3 = v119;
  v120 = LayoutTextView.estimatedNumberOfLines(from:)(v179);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  sub_1AC68E218(v12 + 56, (uint64_t)&v156);
  v121 = v156.d;
  v122 = v156.tx;
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  v147 = v117;
  MinX = v113;
  if (v120 <= 1)
    v123 = *(_QWORD *)(v12 + 216);
  else
    v123 = 1;
  (*(void (**)(uint64_t, CGFloat, CGFloat))(*(_QWORD *)&v122 + 24))(v123, COERCE_CGFLOAT(*(_QWORD *)&v121), COERCE_CGFLOAT(*(_QWORD *)&v122));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  sub_1AC68E218(v12 + 56, (uint64_t)&v156);
  v124 = v156.d;
  v125 = v156.tx;
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  v126 = (*(double (**)(void *, CGFloat, CGFloat, CGFloat))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v125 + 8)
                                                                                 + 8)
                                                                     + 8))(a1, COERCE_CGFLOAT(*(_QWORD *)&v124), v153, v154);
  v128 = v127;
  v130 = v129;
  v132 = v131;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  sub_1AC68E218(v12 + 56, (uint64_t)&v156);
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  *(double *)&v142 = v126;
  v180.var0 = v126;
  v143 = v128;
  v180.var1 = v128;
  *(double *)&v141 = v130;
  v180.var2 = v130;
  v144 = v132;
  v180.var3 = v132;
  v133 = LayoutTextView.estimatedNumberOfLines(from:)(v180);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  v134 = objc_msgSend(a1, sel_traitCollection);
  v135 = objc_msgSend(v134, sel_preferredContentSizeCategory);
  LOBYTE(v125) = sub_1AC726670();

  if ((LOBYTE(v125) & 1) == 0 && v120 <= 1 && v133 < 2)
  {
    a2 = v146;
    v30 = v147;
    v27 = MinX;
    goto LABEL_5;
  }
  sub_1AC68E218(v12 + 136, (uint64_t)&v156);
  v136 = *(_QWORD *)&v156.d;
  v137 = *(_QWORD *)&v156.tx;
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  sub_1AC68E57C((uint64_t)v11);
  AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v11, v136, v137);
  v40 = v138;
  v41 = *(void (**)(char *, uint64_t))(v149 + 8);
  v41(v11, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  a2 = v146;
  v30 = v147;
  v27 = MinX;
LABEL_6:
  sub_1AC68E218(v12 + 176, (uint64_t)&v156);
  v42 = *(_QWORD *)&v156.d;
  v43 = *(_QWORD *)&v156.tx;
  __swift_project_boxed_opaque_existential_1(&v156, *(uint64_t *)&v156.d);
  sub_1AC68E57C((uint64_t)v11);
  AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v11, v42, v43);
  v140 = v44;
  v41(v11, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  v45 = v152;
  v160.origin.x = v152;
  v46 = v151;
  v160.origin.y = v151;
  v47 = v153;
  v160.size.width = v153;
  v48 = v154;
  v160.size.height = v154;
  MinX = CGRectGetMinX(v160);
  v161.origin.x = v45;
  v161.origin.y = v46;
  v161.size.width = v47;
  v161.size.height = v48;
  MinY = CGRectGetMinY(v161);
  v162.origin.x = v45;
  v162.origin.y = v46;
  v162.size.width = v47;
  v162.size.height = v48;
  Width = CGRectGetWidth(v162);
  if (Width >= v27)
    v51 = v27;
  else
    v51 = Width;
  v52 = v30;
  v53 = v40 - v30 + MinY;
  sub_1AC68E218(v13, (uint64_t)&v157);
  v54 = v158;
  v55 = v159;
  __swift_project_boxed_opaque_existential_1(&v157, v158);
  v56 = objc_msgSend(a1, sel_traitCollection);
  v57 = objc_msgSend(v56, sel_layoutDirection);

  v147 = v52;
  v146 = v51;
  if (v57 == (id)1)
  {
    CGAffineTransformMakeScale(&v156, -1.0, 1.0);
    v149 = *(_OWORD *)&v156.a;
    v139 = *(_OWORD *)&v156.c;
    v62 = v156.tx;
    ty = v156.ty;
    v64 = v152;
    v163.origin.x = v152;
    v65 = v151;
    v163.origin.y = v151;
    v66 = v53;
    v67 = v153;
    v163.size.width = v153;
    v68 = v154;
    v163.size.height = v154;
    v69 = CGRectGetMinX(v163);
    v164.origin.x = v64;
    v164.origin.y = v65;
    v164.size.width = v67;
    v53 = v66;
    v164.size.height = v68;
    MaxX = CGRectGetMaxX(v164);
    *(_OWORD *)&v156.a = v149;
    *(_OWORD *)&v156.c = v139;
    v156.tx = v62;
    v156.ty = ty;
    CGAffineTransformTranslate(&v155, &v156, -(v69 + MaxX), 0.0);
    v156 = v155;
    v71 = MinX;
    v165.origin.x = MinX;
    v165.origin.y = v66;
    v51 = v146;
    v165.size.width = v146;
    v72 = v150;
    v165.size.height = v150;
    *(CGRect *)v58.n128_u64 = CGRectApplyAffineTransform(v165, &v156);
  }
  else
  {
    v61.n128_f64[0] = v150;
    v72 = v150;
    v71 = MinX;
    v58.n128_f64[0] = MinX;
    v59.n128_f64[0] = v53;
    v60.n128_f64[0] = v51;
  }
  (*(void (**)(uint64_t, __n128, __n128, __n128, __n128))(*(_QWORD *)(v55 + 8) + 24))(v54, v58, v59, v60, v61);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v157);
  v73 = v152;
  v166.origin.x = v152;
  v74 = v151;
  v166.origin.y = v151;
  v75 = v153;
  v166.size.width = v153;
  v76 = v154;
  v166.size.height = v154;
  v150 = CGRectGetMinX(v166);
  v167.origin.x = v71;
  v167.origin.y = v53;
  v167.size.width = v51;
  *(CGFloat *)&v139 = v72;
  v167.size.height = v72;
  MaxY = CGRectGetMaxY(v167);
  v168.origin.x = v73;
  v168.origin.y = v74;
  v168.size.width = v75;
  v168.size.height = v76;
  v78 = CGRectGetWidth(v168);
  if (v78 >= *(double *)&v142)
    v78 = *(double *)&v142;
  *(double *)&v149 = v78;
  v148 = v140 - *(double *)&v141 + MaxY - v148;
  sub_1AC68E218(v12 + 56, (uint64_t)&v157);
  v80 = v158;
  v79 = v159;
  __swift_project_boxed_opaque_existential_1(&v157, v158);
  v81 = objc_msgSend(a1, sel_traitCollection);
  v82 = objc_msgSend(v81, sel_layoutDirection);

  if (v82 == (id)1)
  {
    CGAffineTransformMakeScale(&v156, -1.0, 1.0);
    v142 = *(_OWORD *)&v156.a;
    v141 = *(_OWORD *)&v156.c;
    v87 = v156.tx;
    v88 = v156.ty;
    v89 = v151;
    v90 = v53;
    v91 = v152;
    v169.origin.x = v152;
    v169.origin.y = v151;
    v92 = v153;
    v169.size.width = v153;
    v93 = v154;
    v169.size.height = v154;
    v94 = CGRectGetMinX(v169);
    v170.origin.x = v91;
    v53 = v90;
    v170.origin.y = v89;
    v170.size.width = v92;
    v170.size.height = v93;
    v95 = CGRectGetMaxX(v170);
    *(_OWORD *)&v156.a = v142;
    *(_OWORD *)&v156.c = v141;
    v156.tx = v87;
    v156.ty = v88;
    v71 = MinX;
    CGAffineTransformTranslate(&v155, &v156, -(v94 + v95), 0.0);
    v156 = v155;
    v171.origin.x = v150;
    v171.origin.y = v148;
    *(_QWORD *)&v171.size.width = v149;
    v96 = v143;
    v171.size.height = v143;
    *(CGRect *)v83.n128_u64 = CGRectApplyAffineTransform(v171, &v156);
  }
  else
  {
    v86.n128_f64[0] = v143;
    v96 = v143;
    v83.n128_f64[0] = v150;
    v84.n128_f64[0] = v148;
    v85.n128_u64[0] = v149;
  }
  v97 = v147;
  (*(void (**)(uint64_t, __n128, __n128, __n128, __n128))(*(_QWORD *)(v79 + 8) + 24))(v80, v83, v84, v85, v86);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v157);
  v172.origin.x = v71;
  v172.origin.y = v53;
  v172.size.width = v146;
  *(_QWORD *)&v172.size.height = v139;
  v98 = CGRectGetMinY(v172);
  v99 = v152;
  v173.origin.x = v152;
  v100 = v151;
  v173.origin.y = v151;
  v101 = v153;
  v173.size.width = v153;
  v102 = v154;
  v173.size.height = v154;
  v147 = v97 + v98 - CGRectGetMinY(v173);
  v174.origin.x = v99;
  v174.origin.y = v100;
  v174.size.width = v101;
  v174.size.height = v102;
  v103 = CGRectGetMinX(v174);
  v175.origin.x = v99;
  v175.origin.y = v100;
  v175.size.width = v101;
  v175.size.height = v102;
  v104 = CGRectGetMinY(v175);
  v176.origin.x = v99;
  v176.origin.y = v100;
  v176.size.width = v101;
  v176.size.height = v102;
  v105 = CGRectGetWidth(v176);
  v177.origin.x = v150;
  v177.origin.y = v148;
  *(_QWORD *)&v177.size.width = v149;
  v177.size.height = v96;
  v106 = CGRectGetMaxY(v177);
  v178.origin.x = v99;
  v178.origin.y = v100;
  v178.size.width = v101;
  v178.size.height = v102;
  v107 = CGRectGetMinY(v178);
  **(CGFloat **)&a2 = v103;
  *(CGFloat *)(*(_QWORD *)&a2 + 8) = v104;
  *(CGFloat *)(*(_QWORD *)&a2 + 16) = v105;
  *(double *)(*(_QWORD *)&a2 + 24) = v106 - v107;
  result = v144;
  *(double *)(*(_QWORD *)&a2 + 32) = v147;
  *(double *)(*(_QWORD *)&a2 + 40) = result;
  return result;
}

double sub_1AC7016B4(uint64_t a1, double a2)
{
  return AppStore.ThreeLineTextLayout.measurements(fitting:in:)(a1, a2);
}

uint64_t sub_1AC7016CC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + 16;
  swift_beginAccess();
  return sub_1AC68E218(v3, a2);
}

uint64_t sub_1AC701718(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.primaryText.setter(v2);
}

uint64_t sub_1AC70174C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 56, a2);
}

uint64_t sub_1AC701794(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.secondaryText.setter(v2);
}

uint64_t sub_1AC7017C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 96, a2);
}

uint64_t sub_1AC701810(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.primaryRegularSpace.setter(v2);
}

uint64_t sub_1AC701844@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 136, a2);
}

uint64_t sub_1AC70188C(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.primaryCompressedSpace.setter(v2);
}

uint64_t sub_1AC7018C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  return sub_1AC68E218(v3 + 176, a2);
}

uint64_t sub_1AC701908(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.secondarySpace.setter(v2);
}

uint64_t sub_1AC70193C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 216);
  return result;
}

uint64_t sub_1AC701980(uint64_t *a1)
{
  return AppStore.ThreeLineTextLayout.numberOfLines.setter(*a1);
}

ValueMetadata *type metadata accessor for AppStore.ThreeLineTextLayout()
{
  return &type metadata for AppStore.ThreeLineTextLayout;
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwcp(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  return a1;
}

uint64_t *_s19ThreeLineTextLayoutV7StorageVwca(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  __swift_assign_boxed_opaque_existential_1(a1 + 15, a2 + 15);
  __swift_assign_boxed_opaque_existential_1(a1 + 20, a2 + 20);
  a1[25] = a2[25];
  return a1;
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwta(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  v7 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v7;
  return a1;
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 208))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 200) = 0;
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
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 208) = 1;
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
    *(_BYTE *)(result + 208) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s19ThreeLineTextLayoutV7StorageVMa()
{
  return &_s19ThreeLineTextLayoutV7StorageVN;
}

id Placeable.juPlaceable.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t, __n128);
  id v14;
  objc_class *v15;
  _QWORD v17[2];

  v3 = v2;
  v6 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v17 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16);
  v13((char *)v17 - v11, v3, a1, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B620);
  if (swift_dynamicCast() || swift_dynamicCast())
  {
    v14 = (id)v17[1];
  }
  else
  {
    v15 = (objc_class *)type metadata accessor for _PlaceableAsJUPlaceable();
    ((void (*)(char *, uint64_t, uint64_t))v13)(v8, v3, a1);
    v14 = sub_1AC702180((uint64_t)v8, v15, a1, a2);
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, a1);
  return v14;
}

uint64_t type metadata accessor for _PlaceableAsJUPlaceable()
{
  return objc_opt_self();
}

uint64_t _PlaceableAsJUPlaceable.base.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base, a1);
}

JUMeasurements __swiftcall _PlaceableAsJUPlaceable.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  uint64_t v2;
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  JUMeasurements result;

  height = toFit.height;
  width = toFit.width;
  v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 24);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base), v6);
  (*(void (**)(Class, uint64_t, uint64_t, double, double))(v7 + 8))(with.super.isa, v6, v7, width, height);
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

Swift::Void __swiftcall _PlaceableAsJUPlaceable.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  uint64_t v2;
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;

  height = at.size.height;
  width = at.size.width;
  y = at.origin.y;
  x = at.origin.x;
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 24);
  v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base), v8);
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v9 + 16))(with.super.isa, v8, v9, x, y, width, height);
}

uint64_t _PlaceableAsJUPlaceable.description.getter()
{
  uint64_t v0;
  _BYTE v2[40];

  sub_1AC68E218(v0 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base, (uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  return sub_1AC726268();
}

id _PlaceableAsJUPlaceable.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void _PlaceableAsJUPlaceable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _PlaceableAsJUPlaceable.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AC702180(uint64_t a1, objc_class *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_0;
  id v8;
  id v9;
  objc_super v11;
  uint64_t v12[5];

  v12[3] = a3;
  v12[4] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_0, a1, a3);
  v8 = objc_allocWithZone(a2);
  sub_1AC68E218((uint64_t)v12, (uint64_t)v8 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base);
  v11.receiver = v8;
  v11.super_class = a2;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9;
}

uint64_t method lookup function for _PlaceableAsJUPlaceable()
{
  return swift_lookUpClassMethod();
}

void sub_1AC702224(uint64_t a1)
{
  uint64_t v1;
  __int16 v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  sub_1AC7022F8(a1);
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
      sub_1AC7022F8(a1 + 1);
    }
  }
}

void sub_1AC7022F8(uint64_t a1)
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

void sub_1AC702408(void *a1@<X0>, __CFString *a2@<X1>, uint64_t a3@<X2>, __CFString **a4@<X8>)
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
  v12 = sub_1AC72586C();
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

uint64_t sub_1AC7024DC(uint64_t a1)
{
  return sub_1AC702578(a1, qword_1EEC8B630, MEMORY[0x1E0DDB3C0]);
}

uint64_t static JUContentUnavailableViewController.PresentationContext.placeholder.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1AC702630(&qword_1EEC897E0, (uint64_t)qword_1EEC8B630, a1);
}

uint64_t type metadata accessor for JUContentUnavailableViewController.PresentationContext(uint64_t a1)
{
  return sub_1AC68BB94(a1, (uint64_t *)&unk_1EEC8A158);
}

uint64_t sub_1AC702520(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AC702564(uint64_t a1)
{
  return sub_1AC702578(a1, qword_1EEC8B648, MEMORY[0x1E0DDB3C8]);
}

uint64_t sub_1AC702578(uint64_t a1, uint64_t *a2, unsigned int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  __swift_allocate_value_buffer(v5, a2);
  v6 = __swift_project_value_buffer(v5, (uint64_t)a2);
  v7 = *a3;
  v8 = sub_1AC725A28();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v6, v7, v8);
}

uint64_t static JUContentUnavailableViewController.PresentationContext.inline.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1AC702630(&qword_1EEC8A238, (uint64_t)qword_1EEC8B648, a1);
}

uint64_t sub_1AC702600(uint64_t a1)
{
  return sub_1AC702578(a1, qword_1EEC8B660, MEMORY[0x1E0DDB3D0]);
}

uint64_t static JUContentUnavailableViewController.PresentationContext.fullCover.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1AC702630(qword_1EEC8A240, (uint64_t)qword_1EEC8B660, a1);
}

uint64_t sub_1AC702630@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  v6 = __swift_project_value_buffer(v5, a2);
  return sub_1AC702520(v6, a3);
}

id JUContentUnavailableViewController.__allocating_init(error:presentationContext:retry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  id v11;
  objc_super v13;

  v9 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  sub_1AC702520(a2, (uint64_t)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  v10 = &v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *(_QWORD *)v10 = a3;
  *((_QWORD *)v10 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
  sub_1AC7027CC(a2);
  return v11;
}

id JUContentUnavailableViewController.init(error:presentationContext:retry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  id v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  sub_1AC702520(a2, (uint64_t)&v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  v10 = &v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *(_QWORD *)v10 = a3;
  *((_QWORD *)v10 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
  sub_1AC7027CC(a2);
  return v11;
}

uint64_t sub_1AC7027CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id JUContentUnavailableViewController.__allocating_init(error:retry:)(void *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  char *v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  objc_super v16;

  v4 = v3;
  v8 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v8[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  v9 = v8;
  v10 = a1;
  if (qword_1EEC8A238 != -1)
    swift_once();
  v11 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1EEC8B648);
  sub_1AC702520(v12, (uint64_t)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  v13 = (uint64_t *)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *v13 = a2;
  v13[1] = a3;
  sub_1AC6B83FC(a2);

  v16.receiver = v9;
  v16.super_class = v4;
  v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1AC68AD94(a2);

  return v14;
}

id JUContentUnavailableViewController.init(error:retry:)(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  objc_super v16;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  v9 = v4;
  v10 = a1;
  if (qword_1EEC8A238 != -1)
    swift_once();
  v11 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1EEC8B648);
  sub_1AC702520(v12, (uint64_t)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  v13 = (uint64_t *)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *v13 = a2;
  v13[1] = a3;
  sub_1AC6B83FC(a2);

  v16.receiver = v9;
  v16.super_class = ObjectType;
  v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1AC68AD94(a2);

  return v14;
}

id JUContentUnavailableViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void JUContentUnavailableViewController.init(coder:)()
{
  sub_1AC726910();
  __break(1u);
}

Swift::Void __swiftcall JUContentUnavailableViewController.encode(with:)(NSCoder with)
{
  sub_1AC726910();
  __break(1u);
}

Swift::Void __swiftcall JUContentUnavailableViewController.viewDidLoad()()
{
  void *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v46[2];
  objc_super v47;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8A188);
  *(_QWORD *)&v4 = MEMORY[0x1E0C80A78](v3).n128_u64[0];
  v6 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47.receiver = v1;
  v47.super_class = ObjectType;
  objc_msgSendSuper2(&v47, sel_viewDidLoad, v4);
  sub_1AC70303C((uint64_t)v1, (uint64_t)v6);
  v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8A178));
  v8 = (void *)sub_1AC725B60();
  objc_msgSend(v1, sel_addChildViewController_, v8);
  v9 = objc_msgSend(v8, sel_view);
  if (!v9)
  {
    __break(1u);
    goto LABEL_14;
  }
  v10 = v9;
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v11 = objc_msgSend(v1, sel_view);
  if (!v11)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v12 = v11;
  v13 = objc_msgSend(v8, sel_view);
  if (!v13)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v14 = v13;
  objc_msgSend(v12, sel_addSubview_, v13);

  __swift_instantiateConcreteTypeFromMangledName(qword_1ED0BDE00);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1AC72D690;
  v16 = objc_msgSend(v8, sel_view);
  if (!v16)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17 = v16;
  v18 = objc_msgSend(v16, sel_topAnchor);

  v19 = objc_msgSend(v1, sel_view);
  if (!v19)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, sel_topAnchor);

  v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
  *(_QWORD *)(v15 + 32) = v22;
  v23 = objc_msgSend(v8, sel_view);
  if (!v23)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v24 = v23;
  v25 = objc_msgSend(v23, sel_leadingAnchor);

  v26 = objc_msgSend(v1, sel_view);
  if (!v26)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v27 = v26;
  v28 = objc_msgSend(v26, sel_leadingAnchor);

  v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v28);
  *(_QWORD *)(v15 + 40) = v29;
  v30 = objc_msgSend(v8, sel_view);
  if (!v30)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v31 = v30;
  v32 = objc_msgSend(v30, sel_bottomAnchor);

  v33 = objc_msgSend(v1, sel_view);
  if (!v33)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v34 = v33;
  v35 = objc_msgSend(v33, sel_bottomAnchor);

  v36 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v35);
  *(_QWORD *)(v15 + 48) = v36;
  v37 = objc_msgSend(v8, sel_view);
  if (!v37)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, sel_trailingAnchor);

  v40 = objc_msgSend(v1, sel_view);
  if (v40)
  {
    v41 = v40;
    v42 = (void *)objc_opt_self();
    v43 = objc_msgSend(v41, sel_trailingAnchor);

    v44 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v43);
    *(_QWORD *)(v15 + 56) = v44;
    v46[1] = v15;
    sub_1AC7263AC();
    sub_1AC68CB18();
    v45 = (void *)sub_1AC726394();
    swift_bridgeObjectRelease();
    objc_msgSend(v42, sel_activateConstraints_, v45);

    objc_msgSend(v8, sel_didMoveToParentViewController_, v1);
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_1AC70303C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v49 = a2;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8A150);
  v40 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8A190);
  v42 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v41 = (char *)&v40 - v8;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8A180);
  MEMORY[0x1E0C80A78](v44);
  v46 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8A140);
  v13 = *(_QWORD *)(v43 - 8);
  MEMORY[0x1E0C80A78](v43);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8A198);
  v16 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v40 - v20;
  v22 = *(_QWORD *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry);
  if (v22)
  {
    v23 = *(_QWORD *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry + 8);
    v24 = *(void **)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error);
    sub_1AC6B83FC(*(_QWORD *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry));
    v42 = v23;
    sub_1AC6B83FC(v22);
    v25 = v24;
    sub_1AC725A04();
    sub_1AC702520(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext, (uint64_t)v12);
    v26 = sub_1AC703CB0(&qword_1EEC8A138, &qword_1EEC8A140);
    v27 = v43;
    sub_1AC725B78();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v27);
    v28 = sub_1AC725A28();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v12, v28);
    v29 = v45;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v18, v45);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v46, v21, v29);
    swift_storeEnumTagMultiPayload();
    v50 = v27;
    v51 = v26;
    swift_getOpaqueTypeConformance2();
    v30 = sub_1AC703CB0(&qword_1EEC8A148, &qword_1EEC8A150);
    v50 = v47;
    v51 = v30;
    swift_getOpaqueTypeConformance2();
    sub_1AC725B6C();
    sub_1AC68AD94(v22);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v21, v29);
  }
  else
  {
    v32 = *(id *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error);
    sub_1AC725A10();
    sub_1AC702520(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext, (uint64_t)v12);
    v33 = sub_1AC703CB0(&qword_1EEC8A148, &qword_1EEC8A150);
    v34 = v47;
    sub_1AC725B78();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v4, v34);
    v35 = sub_1AC725A28();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v12, v35);
    v37 = v41;
    v36 = v42;
    v38 = v48;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v6, v48);
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v46, v37, v38);
    swift_storeEnumTagMultiPayload();
    v39 = sub_1AC703CB0(&qword_1EEC8A138, &qword_1EEC8A140);
    v50 = v43;
    v51 = v39;
    swift_getOpaqueTypeConformance2();
    v50 = v34;
    v51 = v33;
    swift_getOpaqueTypeConformance2();
    sub_1AC725B6C();
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  }
}

id JUContentUnavailableViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1AC726208();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void JUContentUnavailableViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id JUContentUnavailableViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static ObjCFunctions.makeContentUnavailableViewController(with:retry:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  uint64_t *v13;
  id v14;
  objc_super v16;

  v6 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  sub_1AC6B83FC(a2);
  if (qword_1EEC897E0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_1EEC8B630);
  sub_1AC702520(v10, (uint64_t)v8);
  v11 = (objc_class *)type metadata accessor for JUContentUnavailableViewController(0);
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  sub_1AC702520((uint64_t)v8, (uint64_t)&v12[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *v13 = a2;
  v13[1] = a3;
  v16.receiver = v12;
  v16.super_class = v11;
  v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1AC7027CC((uint64_t)v8);
  return v14;
}

uint64_t type metadata accessor for JUContentUnavailableViewController(uint64_t a1)
{
  return sub_1AC68BB94(a1, qword_1EEC897E8);
}

uint64_t sub_1AC7037DC()
{
  return type metadata accessor for JUContentUnavailableViewController(0);
}

uint64_t sub_1AC7037E4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AC725A28();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for JUContentUnavailableViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JUContentUnavailableViewController.__allocating_init(error:presentationContext:retry:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of JUContentUnavailableViewController.__allocating_init(error:retry:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t initializeBufferWithCopyOfBuffer for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC725A28();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for JUContentUnavailableViewController.PresentationContext(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AC725A28();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC725A28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC725A28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC725A28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC725A28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for JUContentUnavailableViewController.PresentationContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC703A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC725A28();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for JUContentUnavailableViewController.PresentationContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AC703A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AC725A28();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1AC703A94()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AC725A28();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1AC703C80()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1AC703CA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1AC703CB0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1AF440830](MEMORY[0x1E0DDB378], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AC703CF0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PartialLayoutView()
{
  return objc_opt_self();
}

uint64_t sub_1AC703D3C(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  v7 = *(_QWORD *)(*(_QWORD *)v3 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)v3 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v3 + 16), v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double, double))(v8 + 8))(a1, v7, v8, a2, a3);
}

uint64_t sub_1AC703DA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_1AC703DEC(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;

  v9 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v10 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v4 + 56), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, double, double, double, double))(v10 + 24))(v9, v10, a1, a2, a3, a4);
}

void (*sub_1AC703E64(double **a1))(double **a1)
{
  _QWORD *v1;
  double *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (double *)malloc(0x28uLL);
  *a1 = v3;
  v4 = (_QWORD *)*v1;
  v3[4] = *(double *)v1;
  v5 = v4[10];
  v6 = v4[11];
  __swift_project_boxed_opaque_existential_1(v4 + 7, v5);
  *v3 = (*(double (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
  *((_QWORD *)v3 + 1) = v7;
  *((_QWORD *)v3 + 2) = v8;
  *((_QWORD *)v3 + 3) = v9;
  return sub_1AC703ED8;
}

void sub_1AC703ED8(double **a1)
{
  double *v1;
  _QWORD *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *a1;
  v2 = (_QWORD *)*((_QWORD *)*a1 + 4);
  v3 = **a1;
  v4 = (*a1)[1];
  v5 = (*a1)[2];
  v6 = (*a1)[3];
  v7 = v2[10];
  v8 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v7);
  (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v8 + 24))(v7, v8, v3, v4, v5, v6);
  free(v1);
}

uint64_t sub_1AC703F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2) & 1;
}

uint64_t sub_1AC703F9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v1 + 56), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, v3, v4);
}

uint64_t (*sub_1AC703FEC(uint64_t a1))(unsigned __int8 *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)*v1;
  *(_QWORD *)a1 = *v1;
  v4 = v3[10];
  v5 = v3[11];
  __swift_project_boxed_opaque_existential_1(v3 + 7, v4);
  *(_BYTE *)(a1 + 8) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5) & 1;
  return sub_1AC704050;
}

uint64_t sub_1AC704050(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1[8];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)a1 + 56), v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, v2, v3);
}

uint64_t sub_1AC7040A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2) & 1;
}

uint64_t sub_1AC7040F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
}

_QWORD *sub_1AC704138(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v15;
  double *v16;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a7;
  v20 = a8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(boxed_opaque_existential_0, a1, a7);
  v15 = (_QWORD *)swift_allocObject();
  v15[5] = &type metadata for StaticMeasurable;
  v15[6] = &protocol witness table for StaticMeasurable;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD610);
  v16 = (double *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  v15[2] = v16;
  sub_1AC68AAA4(&v18, (uint64_t)(v15 + 7));
  return v15;
}

uint64_t sub_1AC704208(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_0;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v12 = a4;
  v13 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  v9 = swift_allocObject();
  sub_1AC68AAA4(a1, v9 + 16);
  sub_1AC68AAA4(&v11, v9 + 56);
  return v9;
}

ValueMetadata *type metadata accessor for PartialMeasurableLayout()
{
  return &type metadata for PartialMeasurableLayout;
}

uint64_t sub_1AC7042A0(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t *v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  v11 = *v5;
  swift_beginAccess();
  sub_1AC68E218(v11 + 56, (uint64_t)v15);
  v12 = v16;
  v13 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double, double))(v13 + 8))(a1, v12, v13, a2, a3, a4, a5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

double sub_1AC704360(uint64_t a1, double a2, double a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v7 = *v3 + 16;
  swift_beginAccess();
  sub_1AC68E218(v7, (uint64_t)v12);
  v8 = v13;
  v9 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  v10 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v9 + 8))(a1, v8, v9, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

__n128 sub_1AC704424(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_0;
  uint64_t v8;
  __int128 v9;
  __n128 result;
  _OWORD v11[2];
  _OWORD v12[3];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v14 = a3;
  v15 = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_0, a2, a3);
  sub_1AC68AAA4(a1, (uint64_t)v11);
  sub_1AC68AAA4(&v13, (uint64_t)v12 + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B680);
  v8 = swift_allocObject();
  v9 = v12[1];
  *(_OWORD *)(v8 + 48) = v12[0];
  *(_OWORD *)(v8 + 64) = v9;
  *(_OWORD *)(v8 + 80) = v12[2];
  result = (__n128)v11[1];
  *(_OWORD *)(v8 + 16) = v11[0];
  *(__n128 *)(v8 + 32) = result;
  return result;
}

uint64_t initializeWithCopy for PartialMeasurableLayout.Storage(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for PartialMeasurableLayout.Storage(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for PartialMeasurableLayout.Storage(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for PartialMeasurableLayout.Storage(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PartialMeasurableLayout.Storage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PartialMeasurableLayout.Storage()
{
  return &type metadata for PartialMeasurableLayout.Storage;
}

uint64_t UIViewController.PresenterMultiplexer.init(presenters:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t UIViewController.PresenterMultiplexer.presenters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UIViewController.PresenterMultiplexer.add(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD **v2;
  _QWORD *v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  v5 = *v2;
  swift_unknownObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1AC6A3270(0, v5[2] + 1, 1, v5);
    v5 = (_QWORD *)result;
  }
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)sub_1AC6A3270((_QWORD *)(v7 > 1), v8 + 1, 1, v5);
    v5 = (_QWORD *)result;
  }
  v5[2] = v8 + 1;
  v9 = &v5[2 * v8];
  v9[4] = a1;
  v9[5] = a2;
  *v2 = v5;
  return result;
}

uint64_t UIViewController.PresenterMultiplexer.remove(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *i;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v2)
  {
    v3 = 0;
    for (i = (_QWORD *)(*(_QWORD *)v1 + 32); *i != result; i += 2)
    {
      if (v2 == ++v3)
        return result;
    }
    sub_1AC6BAE84(v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidLoad()()
{
  sub_1AC704860(MEMORY[0x1E0D409C8]);
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewWillAppear()()
{
  sub_1AC704860(MEMORY[0x1E0D409D8]);
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidAppear()()
{
  sub_1AC704860(MEMORY[0x1E0D409D0]);
}

uint64_t UIViewController.PresenterMultiplexer.viewWillDisappear(forReason:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    v3 = v1 + 40;
    do
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1AC725F8C();
      swift_unknownObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidDisappear()()
{
  sub_1AC704860(MEMORY[0x1E0D409E0]);
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidReceiveMemoryWarning()()
{
  sub_1AC704860(MEMORY[0x1E0D409F0]);
}

uint64_t sub_1AC704860(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t *v5;
  uint64_t v6;
  uint64_t ObjectType;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 16);
  if (v3)
  {
    v4 = (void (*)(uint64_t, uint64_t))result;
    swift_bridgeObjectRetain();
    v5 = (uint64_t *)(v2 + 40);
    do
    {
      v6 = *v5;
      ObjectType = swift_getObjectType();
      swift_unknownObjectRetain();
      v4(ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

ValueMetadata *type metadata accessor for UIViewController.PresenterMultiplexer()
{
  return &type metadata for UIViewController.PresenterMultiplexer;
}

uint64_t DisjointStack.Properties.topEdge.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6B7598(v1, a1);
}

uint64_t DisjointStack.Properties.leadingEdge.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6B7598(v1 + 40, a1);
}

uint64_t DisjointStack.Properties.bottomEdge.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6B7598(v1 + 80, a1);
}

uint64_t DisjointStack.Properties.trailingEdge.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6B7598(v1 + 120, a1);
}

double DisjointStack.Properties.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_WORD *)(a1 + 160) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t DisjointStack.Properties.topEdge.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC6B7B8C(a1, v1);
}

uint64_t DisjointStack.Properties.leadingEdge.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC6B7B8C(a1, v1 + 40);
}

uint64_t DisjointStack.Properties.bottomEdge.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC6B7B8C(a1, v1 + 80);
}

uint64_t DisjointStack.Properties.trailingEdge.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC6B7B8C(a1, v1 + 120);
}

void DisjointStack.Placements.union.getter(CGFloat *a1@<X8>)
{
  __int128 *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  __int128 v9;
  id v10;
  char v11;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGFloat r1;
  double v24;
  _OWORD v25[4];
  __int128 v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  char v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v3 = (void *)*((_QWORD *)v1 + 4);
  v4 = *((_QWORD *)v1 + 5);
  v5 = *((_QWORD *)v1 + 6);
  v6 = *((_QWORD *)v1 + 11);
  v7 = *((_BYTE *)v1 + 96);
  v8 = v1[1];
  v34 = *v1;
  v35 = v8;
  v36 = v3;
  v37 = v4;
  v9 = *(__int128 *)((char *)v1 + 72);
  v39 = *(__int128 *)((char *)v1 + 56);
  v40 = v9;
  v38 = v5;
  v41 = v6;
  v42 = v7;
  v10 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DisjointStack.Placements.next()((uint64_t)&v28);
  if (*((_QWORD *)&v29 + 1))
  {
    v11 = 0;
    y = 0.0;
    x = 0.0;
    height = 0.0;
    width = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    do
    {
      r1 = width;
      v24 = v16;
      v18 = v17;
      v19 = height;
      while (1)
      {
        v25[2] = v30;
        v25[3] = v31;
        v26 = v32;
        v27 = v33;
        v25[0] = v28;
        v25[1] = v29;
        v20 = *((double *)&v30 + 1);
        width = *((double *)&v31 + 1);
        v21 = *(double *)&v31;
        height = *(double *)&v32;
        v43.origin.x = *((CGFloat *)&v30 + 1);
        *(_OWORD *)&v43.origin.y = v31;
        *(_QWORD *)&v43.size.height = v32;
        if (!CGRectIsEmpty(v43))
          break;
        sub_1AC6929AC((uint64_t)v25);
        DisjointStack.Placements.next()((uint64_t)&v28);
        if (!*((_QWORD *)&v29 + 1))
        {
          height = v19;
          v17 = v18;
          width = r1;
          v16 = v24;
          goto LABEL_18;
        }
      }
      if ((v11 & 1) != 0)
      {
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = r1;
        v44.size.height = v19;
        v46.origin.x = v20;
        v46.origin.y = v21;
        v46.size.width = width;
        v46.size.height = height;
        v45 = CGRectUnion(v44, v46);
        x = v45.origin.x;
        y = v45.origin.y;
        width = v45.size.width;
        height = v45.size.height;
        if (v18 >= *((double *)&v26 + 1))
          v17 = *((double *)&v26 + 1);
        else
          v17 = v18;
        v16 = v24;
        if (v24 >= v27)
          v16 = v27;
      }
      else
      {
        v17 = *((double *)&v26 + 1);
        v16 = v27;
        x = v20;
        y = v21;
      }
      sub_1AC6929AC((uint64_t)v25);
      DisjointStack.Placements.next()((uint64_t)&v28);
      v11 = 1;
    }
    while (*((_QWORD *)&v29 + 1));
  }
  else
  {
    v17 = 0.0;
    v16 = 0.0;
    width = 0.0;
    height = 0.0;
    x = 0.0;
    y = 0.0;
  }
LABEL_18:
  v22 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *a1 = x;
  a1[1] = y;
  a1[2] = width;
  a1[3] = height;
  a1[4] = v17;
  a1[5] = v16;
}

void DisjointStack.Placements.next()(uint64_t a1@<X8>)
{
  char *v1;
  double v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double MinX;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double MaxX;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  BOOL v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double MinY;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  double v45;
  double MaxY;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  CGFloat v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  double v60;
  double v61;
  _QWORD v62[3];
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  double v70;
  _QWORD v71[3];
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[40];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[41];
  char v79;
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
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v5 = *((_QWORD *)v1 + 7);
  v6 = *((_QWORD *)v1 + 5);
  if (v5 >= *(_QWORD *)(v6 + 16))
  {
    *(_QWORD *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return;
  }
  if (v5 < 0)
  {
    __break(1u);
    goto LABEL_41;
  }
  v7 = v1;
  v8 = (uint64_t *)v74;
  sub_1AC7051B8(v6 + 208 * v5 + 32, (uint64_t)v74);
  if (v78[40] == 1)
  {
    v9 = sub_1AC7055A8();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    if ((v79 & 1) == 0)
      goto LABEL_5;
LABEL_13:
    sub_1AC68E218((uint64_t)v74, (uint64_t)v71);
    sub_1AC68E218((uint64_t)v71, (uint64_t)&v65);
    *((_QWORD *)&v67 + 1) = floor(v9);
    v68 = COERCE_UNSIGNED_INT64(floor(v11));
    *(_QWORD *)&v69 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
    *((_QWORD *)&v69 + 1) = 0;
    *(_QWORD *)(a1 + 80) = 0;
    v31 = v68;
    *(_OWORD *)(a1 + 32) = v67;
    *(_OWORD *)(a1 + 48) = v31;
    v32 = v66;
    *(_OWORD *)a1 = v65;
    *(_OWORD *)(a1 + 16) = v32;
    *(_OWORD *)(a1 + 64) = v69;
    sub_1AC6916CC((uint64_t)v74, &qword_1EEC89710);
    v33 = *((_QWORD *)v1 + 7);
    v34 = __OFADD__(v33, 1);
    v20 = v33 + 1;
    if (!v34)
    {
LABEL_37:
      *((_QWORD *)v7 + 7) = v20;
      return;
    }
    __break(1u);
    goto LABEL_16;
  }
  v9 = *(double *)v1;
  v11 = *((double *)v1 + 1);
  v13 = *((double *)v1 + 2);
  v15 = *((double *)v1 + 3);
  if ((v79 & 1) != 0)
    goto LABEL_13;
LABEL_5:
  v8 = &v75;
  sub_1AC7057B8(*((_QWORD *)v1 + 7));
  v2 = v16;
  v3 = v17;
  v60 = v19;
  v61 = v18;
  v1 = (char *)&v67 + 8;
  sub_1AC6B7598((uint64_t)&v76, (uint64_t)&v65);
  sub_1AC6B7598((uint64_t)v78, (uint64_t)&v67 + 8);
  v20 = v69;
  if (*((_QWORD *)&v66 + 1))
  {
    if ((_QWORD)v69)
    {
      sub_1AC68AAA4(&v65, (uint64_t)v71);
      sub_1AC68AAA4((__int128 *)((char *)&v67 + 8), (uint64_t)v62);
      v80.origin.x = v9;
      v80.origin.y = v11;
      v80.size.width = v13;
      v80.size.height = v15;
      MinX = CGRectGetMinX(v80);
      v22 = v72;
      v23 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      v24 = (void *)*((_QWORD *)v7 + 4);
      v25 = MinX + AnyDimension.value(with:)(v24, v22, v23);
      v81.origin.x = v9;
      v81.origin.y = v11;
      v81.size.width = v13;
      v81.size.height = v15;
      MaxX = CGRectGetMaxX(v81);
      v82.origin.y = 0.0;
      v82.size.width = 0.0;
      v82.size.height = 0.0;
      v82.origin.x = v25;
      v27 = MaxX - CGRectGetMinX(v82);
      if (v2 > v27)
        v28 = v2;
      else
        v28 = v27;
      v29 = v63;
      v30 = v64;
      __swift_project_boxed_opaque_existential_1(v62, v63);
      v2 = v28 - AnyDimension.value(with:)(v24, v29, v30);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    }
    else
    {
      sub_1AC68AAA4(&v65, (uint64_t)v71);
      v84.origin.x = v9;
      v84.origin.y = v11;
      v84.size.width = v13;
      v84.size.height = v15;
      v38 = CGRectGetMinX(v84);
      v39 = v72;
      v40 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      v25 = v38 + AnyDimension.value(with:)(*((void **)v7 + 4), v39, v40);
    }
    goto LABEL_19;
  }
LABEL_16:
  if (v20)
  {
    sub_1AC68AAA4((__int128 *)v1, (uint64_t)v71);
    v83.origin.x = v9;
    v83.origin.y = v11;
    v83.size.width = v13;
    v83.size.height = v15;
    v35 = CGRectGetMaxX(v83) - v2;
    v36 = v72;
    v37 = v73;
    __swift_project_boxed_opaque_existential_1(v71, v72);
    v25 = v35 - AnyDimension.value(with:)(*((void **)v7 + 4), v36, v37);
LABEL_19:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
    goto LABEL_20;
  }
  v92.origin.x = v9;
  v92.origin.y = v11;
  v92.size.width = v13;
  v92.size.height = v15;
  v25 = CGRectGetMidX(v92) + v2 * -0.5;
LABEL_20:
  sub_1AC6B7598((uint64_t)v8, (uint64_t)&v65);
  sub_1AC6B7598((uint64_t)&v77, (uint64_t)&v67 + 8);
  if (*((_QWORD *)&v66 + 1))
  {
    if ((_QWORD)v69)
    {
      sub_1AC68AAA4(&v65, (uint64_t)v71);
      sub_1AC68AAA4((__int128 *)((char *)&v67 + 8), (uint64_t)v62);
      v85.origin.x = v9;
      v85.origin.y = v11;
      v85.size.width = v13;
      v85.size.height = v15;
      MinY = CGRectGetMinY(v85);
      v42 = v72;
      v43 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      v44 = (void *)*((_QWORD *)v7 + 4);
      v45 = MinY + AnyDimension.value(with:)(v44, v42, v43);
      v86.origin.x = v9;
      v86.origin.y = v11;
      v86.size.width = v13;
      v86.size.height = v15;
      MaxY = CGRectGetMaxY(v86);
      v87.size.height = 0.0;
      v87.origin.x = v25;
      v87.origin.y = v45;
      v87.size.width = v2;
      v47 = MaxY - CGRectGetMinY(v87);
      if (v3 > v47)
        v48 = v3;
      else
        v48 = v47;
      v49 = v63;
      v50 = v64;
      __swift_project_boxed_opaque_existential_1(v62, v63);
      v3 = v48 - AnyDimension.value(with:)(v44, v49, v50);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    }
    else
    {
      sub_1AC68AAA4(&v65, (uint64_t)v71);
      v89.origin.x = v9;
      v89.origin.y = v11;
      v89.size.width = v13;
      v89.size.height = v15;
      v54 = CGRectGetMinY(v89);
      v55 = v72;
      v56 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      v45 = v54 + AnyDimension.value(with:)(*((void **)v7 + 4), v55, v56);
    }
  }
  else
  {
    if (!(_QWORD)v69)
    {
      v93.origin.x = v9;
      v93.origin.y = v11;
      v93.size.width = v13;
      v93.size.height = v15;
      v45 = CGRectGetMidY(v93) + v3 * -0.5;
      goto LABEL_30;
    }
    sub_1AC68AAA4((__int128 *)((char *)&v67 + 8), (uint64_t)v71);
    v88.origin.x = v9;
    v88.origin.y = v11;
    v88.size.width = v13;
    v88.size.height = v15;
    v51 = CGRectGetMaxY(v88) - v3;
    v52 = v72;
    v53 = v73;
    __swift_project_boxed_opaque_existential_1(v71, v72);
    v45 = v51 - AnyDimension.value(with:)(*((void **)v7 + 4), v52, v53);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
LABEL_30:
  v90.origin.x = v25;
  v90.origin.y = v45;
  v90.size.width = v2;
  v90.size.height = v3;
  if (CGRectGetMinX(v90) < 0.0 && CGRectGetWidth(*(CGRect *)v7) == 0.0)
    v25 = 0.0;
  v91.origin.x = v25;
  v91.origin.y = v45;
  v91.size.width = v2;
  v91.size.height = v3;
  if (CGRectGetMinY(v91) < 0.0 && CGRectGetHeight(*(CGRect *)v7) == 0.0)
    v45 = 0.0;
  sub_1AC68E218((uint64_t)v74, (uint64_t)v71);
  sub_1AC68E218((uint64_t)v71, (uint64_t)&v65);
  *((_QWORD *)&v67 + 1) = floor(v25);
  *(_QWORD *)&v68 = floor(v45);
  *((_QWORD *)&v68 + 1) = ceil(v2);
  *(_QWORD *)&v69 = ceil(v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  *((_QWORD *)&v69 + 1) = floor(v61);
  v70 = floor(v60);
  v57 = v68;
  *(_OWORD *)(a1 + 32) = v67;
  *(_OWORD *)(a1 + 48) = v57;
  v58 = v66;
  *(_OWORD *)a1 = v65;
  *(_OWORD *)(a1 + 16) = v58;
  *(_OWORD *)(a1 + 64) = v69;
  *(double *)(a1 + 80) = v70;
  sub_1AC6916CC((uint64_t)v74, &qword_1EEC89710);
  v59 = *((_QWORD *)v7 + 7);
  v34 = __OFADD__(v59, 1);
  v20 = v59 + 1;
  if (!v34)
    goto LABEL_37;
LABEL_41:
  __break(1u);
}

uint64_t sub_1AC7051B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC89710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DisjointStack.init(with:)@<X0>(void (*a1)(_OWORD *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  _OWORD v5[10];
  __int16 v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  if (a1)
    a1(v5);
  sub_1AC6B840C((uint64_t)v5, a2);
  sub_1AC68AD94((uint64_t)a1);
  result = sub_1AC6B7918((uint64_t)v5);
  *(_QWORD *)(a2 + 168) = MEMORY[0x1E0DEE9D8];
  return result;
}

uint64_t DisjointStack.insert(_:at:with:)(uint64_t a1, int64_t a2, char a3, void (*a4)(_BYTE *))
{
  uint64_t v4;
  int64_t *v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v23[11];
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  _BYTE v37[168];

  sub_1AC6B840C(v4, (uint64_t)v37);
  if (a4)
    a4(v37);
  v9 = (int64_t *)(v4 + 168);
  if ((a3 & 1) == 0)
  {
    sub_1AC68E218(a1, (uint64_t)&v25);
    sub_1AC6B840C((uint64_t)v37, (uint64_t)&v27 + 8);
    if (*(_QWORD *)(*v9 + 16) < a2)
    {
      __break(1u);
    }
    else if ((a2 & 0x8000000000000000) == 0)
    {
      v23[10] = v35;
      v24[0] = v36[0];
      *(_OWORD *)((char *)v24 + 10) = *(_OWORD *)((char *)v36 + 10);
      v23[6] = v31;
      v23[7] = v32;
      v23[8] = v33;
      v23[9] = v34;
      v23[2] = v27;
      v23[3] = v28;
      v23[4] = v29;
      v23[5] = v30;
      v23[0] = v25;
      v23[1] = v26;
      sub_1AC6A40BC(a2, a2, (uint64_t)v23);
      return sub_1AC6B7918((uint64_t)v37);
    }
    __break(1u);
    goto LABEL_14;
  }
  sub_1AC68E218(a1, (uint64_t)&v25);
  sub_1AC6B840C((uint64_t)v37, (uint64_t)&v27 + 8);
  a2 = *v9;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_14:
    a2 = (int64_t)sub_1AC6A2A90(0, *(_QWORD *)(a2 + 16) + 1, 1, (_QWORD *)a2);
  v11 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  if (v11 >= v10 >> 1)
    a2 = (int64_t)sub_1AC6A2A90((_QWORD *)(v10 > 1), v11 + 1, 1, (_QWORD *)a2);
  *(_QWORD *)(a2 + 16) = v11 + 1;
  v12 = (_OWORD *)(a2 + 208 * v11);
  v12[2] = v25;
  v13 = v26;
  v14 = v27;
  v15 = v29;
  v12[5] = v28;
  v12[6] = v15;
  v12[3] = v13;
  v12[4] = v14;
  v16 = v30;
  v17 = v31;
  v18 = v33;
  v12[9] = v32;
  v12[10] = v18;
  v12[7] = v16;
  v12[8] = v17;
  v19 = v34;
  v20 = v35;
  v21 = v36[0];
  *(_OWORD *)((char *)v12 + 218) = *(_OWORD *)((char *)v36 + 10);
  v12[12] = v20;
  v12[13] = v21;
  v12[11] = v19;
  *v9 = a2;
  return sub_1AC6B7918((uint64_t)v37);
}

void __swiftcall DisjointStack.layout(relativeTo:with:)(JetUI::DisjointStack::Placements *__return_ptr retstr, __C::CGRect relativeTo, UITraitCollection with)
{
  uint64_t v3;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *v9;
  uint64_t v10;
  objc_class *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  height = relativeTo.size.height;
  width = relativeTo.size.width;
  y = relativeTo.origin.y;
  x = relativeTo.origin.x;
  v9 = *(_QWORD **)(v3 + 168);
  v10 = v9[2];
  v11 = with.super.isa;
  swift_bridgeObjectRetain();
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC897B8);
    v12 = (_QWORD *)sub_1AC7263F4();
    v12[2] = v10;
    v13 = 4;
    do
    {
      v14 = &v12[v13];
      *(_OWORD *)v14 = 0uLL;
      *((_OWORD *)v14 + 1) = 0uLL;
      *((_BYTE *)v14 + 32) = 1;
      v13 += 5;
      --v10;
    }
    while (v10);
  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  retstr->boundingRect.origin.x = x;
  retstr->boundingRect.origin.y = y;
  retstr->boundingRect.size.width = width;
  retstr->boundingRect.size.height = height;
  retstr->traits.super.isa = v11;
  retstr->children._rawValue = v9;
  retstr->measurements._rawValue = v12;
  *(_OWORD *)&retstr->walkingChildIndex = 0u;
  *(_OWORD *)&retstr->$__lazy_storage_$_contentBoundingRect.value.origin.y = 0u;
  retstr->$__lazy_storage_$_contentBoundingRect.value.size.height = 0.0;
  retstr->$__lazy_storage_$_contentBoundingRect.is_nil = 1;
}

double (*DisjointStack.Properties.topEdge.modify())(void)
{
  return nullsub_1;
}

double (*DisjointStack.Properties.leadingEdge.modify())(void)
{
  return nullsub_1;
}

double (*DisjointStack.Properties.bottomEdge.modify())(void)
{
  return nullsub_1;
}

double (*DisjointStack.Properties.trailingEdge.modify())(void)
{
  return nullsub_1;
}

uint64_t DisjointStack.Properties.anchorsHugContent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 160);
}

uint64_t DisjointStack.Properties.anchorsHugContent.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 160) = result;
  return result;
}

double (*DisjointStack.Properties.anchorsHugContent.modify())(void)
{
  return nullsub_1;
}

uint64_t DisjointStack.Properties.shouldSkip.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 161);
}

uint64_t DisjointStack.Properties.shouldSkip.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 161) = result;
  return result;
}

double (*DisjointStack.Properties.shouldSkip.modify())(void)
{
  return nullsub_1;
}

double sub_1AC7055A8()
{
  uint64_t v0;
  double result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)(v0 + 96) & 1) == 0)
    return *(double *)(v0 + 64);
  sub_1AC7055E4(v0);
  *(double *)(v0 + 64) = result;
  *(_QWORD *)(v0 + 72) = v2;
  *(_QWORD *)(v0 + 80) = v3;
  *(_QWORD *)(v0 + 88) = v4;
  *(_BYTE *)(v0 + 96) = 0;
  return result;
}

void sub_1AC7055E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char *v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  char *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double (*v17)(double, double);
  id v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD v26[27];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    v5 = *(char **)(a1 + 48);
    v6 = 0.0;
    v7 = 32;
    v8 = 0.0;
    while (v4 < *((_QWORD *)v5 + 2))
    {
      v11 = &v5[v3];
      if ((v5[v3 + 64] & 1) != 0)
      {
        v12 = *(_QWORD *)(a1 + 40);
        if (v4 >= *(_QWORD *)(v12 + 16))
          goto LABEL_18;
        sub_1AC7051B8(v12 + v7, (uint64_t)v26);
        v13 = *(double *)(a1 + 16);
        v14 = *(double *)(a1 + 24);
        v15 = *(void **)(a1 + 32);
        v16 = v26[4];
        __swift_project_boxed_opaque_existential_1(v26, v26[3]);
        v17 = *(double (**)(double, double))(v16 + 8);
        v18 = v15;
        v10 = v17(v13, v14);
        v9 = v19;
        v21 = v20;
        v23 = v22;

        sub_1AC6916CC((uint64_t)v26, &qword_1EEC89710);
        v5 = *(char **)(a1 + 48);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(a1 + 48) = v5;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v5 = sub_1AC71ED98((uint64_t)v5);
        if (v4 >= *((_QWORD *)v5 + 2))
          goto LABEL_19;
        v25 = &v5[v3];
        *((double *)v25 + 4) = v10;
        *((double *)v25 + 5) = v9;
        *((_QWORD *)v25 + 6) = v21;
        *((_QWORD *)v25 + 7) = v23;
        v25[64] = 0;
        *(_QWORD *)(a1 + 48) = v5;
      }
      else
      {
        v10 = *((double *)v11 + 4);
        v9 = *((double *)v11 + 5);
      }
      ++v4;
      if (v8 <= v10)
        v8 = v10;
      if (v6 <= v9)
        v6 = v9;
      v3 += 40;
      v7 += 208;
      if (v2 == v4)
        goto LABEL_16;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    CGRectGetMidX(*(CGRect *)a1);
    CGRectGetMidY(*(CGRect *)a1);
  }
}

unint64_t sub_1AC7057B8(unint64_t result)
{
  double *v1;
  double *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double (*v15)(double, double);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  _QWORD v21[26];

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  v1 = v2;
  v3 = result;
  v9 = *((_QWORD *)v2 + 6);
  if (*(_QWORD *)(v9 + 16) <= result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v4 = 5 * result;
  if ((*(_BYTE *)(v9 + 40 * result + 64) & 1) == 0)
    return result;
  v10 = *((_QWORD *)v2 + 5);
  if (*(_QWORD *)(v10 + 16) > result)
  {
    sub_1AC7051B8(v10 + 208 * result + 32, (uint64_t)v21);
    v11 = v2[2];
    v12 = v2[3];
    v13 = (void *)*((_QWORD *)v2 + 4);
    v14 = v21[4];
    __swift_project_boxed_opaque_existential_1(v21, v21[3]);
    v15 = *(double (**)(double, double))(v14 + 8);
    v16 = v13;
    v8 = v15(v11, v12);
    v7 = v17;
    v6 = v18;
    v5 = v19;

    sub_1AC6916CC((uint64_t)v21, &qword_1EEC89710);
    v2 = (double *)*((_QWORD *)v2 + 6);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  result = (unint64_t)sub_1AC71ED98((uint64_t)v2);
  v2 = (double *)result;
LABEL_6:
  if (*((_QWORD *)v2 + 2) <= v3)
  {
    __break(1u);
  }
  else
  {
    v20 = &v2[v4];
    v20[4] = v8;
    *((_QWORD *)v20 + 5) = v7;
    *((_QWORD *)v20 + 6) = v6;
    *((_QWORD *)v20 + 7) = v5;
    *((_BYTE *)v20 + 64) = 0;
    *((_QWORD *)v1 + 6) = v2;
  }
  return result;
}

uint64_t DisjointStack.inserting(_:at:with:)@<X0>(uint64_t a1@<X0>, int64_t a2@<X1>, char a3@<W2>, void (*a4)(_BYTE *)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  char v9;

  v9 = a3 & 1;
  sub_1AC6CCC6C(v5, a5);
  return DisjointStack.insert(_:at:with:)(a1, a2, v9, a4);
}

void DisjointStack.add(_:with:)()
{
  sub_1AC726910();
  __break(1u);
}

void DisjointStack.adding(_:with:)()
{
  sub_1AC726910();
  __break(1u);
}

unint64_t sub_1AC705A34(uint64_t a1)
{
  unint64_t result;

  result = sub_1AC705A58();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1AC705A58()
{
  unint64_t result;

  result = qword_1EEC8B688;
  if (!qword_1EEC8B688)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for DisjointStack.Placements, &type metadata for DisjointStack.Placements);
    atomic_store(result, (unint64_t *)&qword_1EEC8B688);
  }
  return result;
}

unint64_t sub_1AC705AA0()
{
  unint64_t result;

  result = qword_1EEC8B690;
  if (!qword_1EEC8B690)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for DisjointStack.Placements, &type metadata for DisjointStack.Placements);
    atomic_store(result, (unint64_t *)&qword_1EEC8B690);
  }
  return result;
}

unint64_t sub_1AC705AE8()
{
  unint64_t result;

  result = qword_1EEC8B698;
  if (!qword_1EEC8B698)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for DisjointStack.Placements, &type metadata for DisjointStack.Placements);
    atomic_store(result, (unint64_t *)&qword_1EEC8B698);
  }
  return result;
}

uint64_t assignWithCopy for DisjointStack(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
    }
    else
    {
      sub_1AC6916CC(a1, &qword_1EEC8ACE8);
      v5 = *((_QWORD *)a2 + 4);
      v6 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
  }
  v9 = (_OWORD *)(a1 + 40);
  v10 = (__int128 *)((char *)a2 + 40);
  v11 = *((_QWORD *)a2 + 8);
  if (*(_QWORD *)(a1 + 64))
  {
    if (v11)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
    }
    else
    {
      sub_1AC6916CC(a1 + 40, &qword_1EEC8ACE8);
      v12 = *((_QWORD *)a2 + 9);
      v13 = *(__int128 *)((char *)a2 + 56);
      *v9 = *v10;
      *(_OWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 72) = v12;
    }
  }
  else if (v11)
  {
    *(_QWORD *)(a1 + 64) = v11;
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 40, (uint64_t)a2 + 40);
  }
  else
  {
    v14 = *v10;
    v15 = *(__int128 *)((char *)a2 + 56);
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    *v9 = v14;
    *(_OWORD *)(a1 + 56) = v15;
  }
  v16 = (_OWORD *)(a1 + 80);
  v17 = a2 + 5;
  v18 = *((_QWORD *)a2 + 13);
  if (*(_QWORD *)(a1 + 104))
  {
    if (v18)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
    }
    else
    {
      sub_1AC6916CC(a1 + 80, &qword_1EEC8ACE8);
      v19 = *((_QWORD *)a2 + 14);
      v20 = a2[6];
      *v16 = *v17;
      *(_OWORD *)(a1 + 96) = v20;
      *(_QWORD *)(a1 + 112) = v19;
    }
  }
  else if (v18)
  {
    *(_QWORD *)(a1 + 104) = v18;
    *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 80, (uint64_t)(a2 + 5));
  }
  else
  {
    v21 = *v17;
    v22 = a2[6];
    *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
    *v16 = v21;
    *(_OWORD *)(a1 + 96) = v22;
  }
  v23 = (_OWORD *)(a1 + 120);
  v24 = (__int128 *)((char *)a2 + 120);
  v25 = *((_QWORD *)a2 + 18);
  if (*(_QWORD *)(a1 + 144))
  {
    if (v25)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
    }
    else
    {
      sub_1AC6916CC(a1 + 120, &qword_1EEC8ACE8);
      v26 = *((_QWORD *)a2 + 19);
      v27 = *(__int128 *)((char *)a2 + 136);
      *v23 = *v24;
      *(_OWORD *)(a1 + 136) = v27;
      *(_QWORD *)(a1 + 152) = v26;
    }
  }
  else if (v25)
  {
    *(_QWORD *)(a1 + 144) = v25;
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v25 - 8))(a1 + 120, (uint64_t)a2 + 120);
  }
  else
  {
    v28 = *v24;
    v29 = *(__int128 *)((char *)a2 + 136);
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    *v23 = v28;
    *(_OWORD *)(a1 + 136) = v29;
  }
  *(_BYTE *)(a1 + 160) = *((_BYTE *)a2 + 160);
  *(_BYTE *)(a1 + 161) = *((_BYTE *)a2 + 161);
  *(_QWORD *)(a1 + 168) = *((_QWORD *)a2 + 21);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DisjointStack(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (*(_QWORD *)(a1 + 24))
  {
    if (*(_QWORD *)(a2 + 24))
      __swift_destroy_boxed_opaque_existential_1(a1);
    else
      sub_1AC6916CC(a1, &qword_1EEC8ACE8);
  }
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a2 + 64))
      __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    else
      sub_1AC6916CC(a1 + 40, &qword_1EEC8ACE8);
  }
  v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 104))
  {
    if (*(_QWORD *)(a2 + 104))
      __swift_destroy_boxed_opaque_existential_1(a1 + 80);
    else
      sub_1AC6916CC(a1 + 80, &qword_1EEC8ACE8);
  }
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 144))
  {
    if (*(_QWORD *)(a2 + 144))
      __swift_destroy_boxed_opaque_existential_1(a1 + 120);
    else
      sub_1AC6916CC(a1 + 120, &qword_1EEC8ACE8);
  }
  v7 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_BYTE *)(a1 + 161) = *(_BYTE *)(a2 + 161);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DisjointStack.EdgePosition()
{
  return &type metadata for DisjointStack.EdgePosition;
}

uint64_t initializeWithCopy for DisjointStack.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v7 = (_OWORD *)(a1 + 40);
  v8 = (_OWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 64);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v9;
    *(_QWORD *)(a1 + 72) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 56);
    *v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  v12 = (_OWORD *)(a1 + 80);
  v13 = (_OWORD *)(a2 + 80);
  v14 = *(_QWORD *)(a2 + 104);
  if (v14)
  {
    v15 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v14;
    *(_QWORD *)(a1 + 112) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
  }
  else
  {
    v16 = *(_OWORD *)(a2 + 96);
    *v12 = *v13;
    *(_OWORD *)(a1 + 96) = v16;
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  }
  v17 = (_OWORD *)(a1 + 120);
  v18 = (_OWORD *)(a2 + 120);
  v19 = *(_QWORD *)(a2 + 144);
  if (v19)
  {
    v20 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = v19;
    *(_QWORD *)(a1 + 152) = v20;
    (**(void (***)(_OWORD *, _OWORD *))(v19 - 8))(v17, v18);
  }
  else
  {
    v21 = *(_OWORD *)(a2 + 136);
    *v17 = *v18;
    *(_OWORD *)(a1 + 136) = v21;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  }
  *(_WORD *)(a1 + 160) = *(_WORD *)(a2 + 160);
  return a1;
}

uint64_t assignWithCopy for DisjointStack.Properties(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
    }
    else
    {
      sub_1AC6916CC(a1, &qword_1EEC8ACE8);
      v5 = *((_QWORD *)a2 + 4);
      v6 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
  }
  v9 = (_OWORD *)(a1 + 40);
  v10 = (__int128 *)((char *)a2 + 40);
  v11 = *((_QWORD *)a2 + 8);
  if (*(_QWORD *)(a1 + 64))
  {
    if (v11)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
    }
    else
    {
      sub_1AC6916CC(a1 + 40, &qword_1EEC8ACE8);
      v12 = *((_QWORD *)a2 + 9);
      v13 = *(__int128 *)((char *)a2 + 56);
      *v9 = *v10;
      *(_OWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 72) = v12;
    }
  }
  else if (v11)
  {
    *(_QWORD *)(a1 + 64) = v11;
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 40, (uint64_t)a2 + 40);
  }
  else
  {
    v14 = *v10;
    v15 = *(__int128 *)((char *)a2 + 56);
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    *v9 = v14;
    *(_OWORD *)(a1 + 56) = v15;
  }
  v16 = (_OWORD *)(a1 + 80);
  v17 = a2 + 5;
  v18 = *((_QWORD *)a2 + 13);
  if (*(_QWORD *)(a1 + 104))
  {
    if (v18)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
    }
    else
    {
      sub_1AC6916CC(a1 + 80, &qword_1EEC8ACE8);
      v19 = *((_QWORD *)a2 + 14);
      v20 = a2[6];
      *v16 = *v17;
      *(_OWORD *)(a1 + 96) = v20;
      *(_QWORD *)(a1 + 112) = v19;
    }
  }
  else if (v18)
  {
    *(_QWORD *)(a1 + 104) = v18;
    *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 80, (uint64_t)(a2 + 5));
  }
  else
  {
    v21 = *v17;
    v22 = a2[6];
    *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
    *v16 = v21;
    *(_OWORD *)(a1 + 96) = v22;
  }
  v23 = (_OWORD *)(a1 + 120);
  v24 = (__int128 *)((char *)a2 + 120);
  v25 = *((_QWORD *)a2 + 18);
  if (*(_QWORD *)(a1 + 144))
  {
    if (v25)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
    }
    else
    {
      sub_1AC6916CC(a1 + 120, &qword_1EEC8ACE8);
      v26 = *((_QWORD *)a2 + 19);
      v27 = *(__int128 *)((char *)a2 + 136);
      *v23 = *v24;
      *(_OWORD *)(a1 + 136) = v27;
      *(_QWORD *)(a1 + 152) = v26;
    }
  }
  else if (v25)
  {
    *(_QWORD *)(a1 + 144) = v25;
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v25 - 8))(a1 + 120, (uint64_t)a2 + 120);
  }
  else
  {
    v28 = *v24;
    v29 = *(__int128 *)((char *)a2 + 136);
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    *v23 = v28;
    *(_OWORD *)(a1 + 136) = v29;
  }
  *(_BYTE *)(a1 + 160) = *((_BYTE *)a2 + 160);
  *(_BYTE *)(a1 + 161) = *((_BYTE *)a2 + 161);
  return a1;
}

__n128 __swift_memcpy162_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[9];
  *(_WORD *)(a1 + 160) = *((_WORD *)a2 + 80);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for DisjointStack.Properties(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (*(_QWORD *)(a1 + 24))
  {
    if (*(_QWORD *)(a2 + 24))
      __swift_destroy_boxed_opaque_existential_1(a1);
    else
      sub_1AC6916CC(a1, &qword_1EEC8ACE8);
  }
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a2 + 64))
      __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    else
      sub_1AC6916CC(a1 + 40, &qword_1EEC8ACE8);
  }
  v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 104))
  {
    if (*(_QWORD *)(a2 + 104))
      __swift_destroy_boxed_opaque_existential_1(a1 + 80);
    else
      sub_1AC6916CC(a1 + 80, &qword_1EEC8ACE8);
  }
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 144))
  {
    if (*(_QWORD *)(a2 + 144))
      __swift_destroy_boxed_opaque_existential_1(a1 + 120);
    else
      sub_1AC6916CC(a1 + 120, &qword_1EEC8ACE8);
  }
  v7 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_BYTE *)(a1 + 161) = *(_BYTE *)(a2 + 161);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisjointStack.Properties(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 162))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DisjointStack.Properties(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 160) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 162) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 162) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DisjointStack.Properties()
{
  return &type metadata for DisjointStack.Properties;
}

ValueMetadata *type metadata accessor for DisjointStack.Placements()
{
  return &type metadata for DisjointStack.Placements;
}

uint64_t dispatch thunk of _PlaceableCompatibilityWrapper._unwrapped.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1AC7064C0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1AC7064E4()
{
  return swift_deallocObject();
}

uint64_t sub_1AC7064F4(void *a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v20[6];

  objc_msgSend(a1, sel_size);
  v5 = v4;
  objc_msgSend(a2, sel_size);
  if (v5 <= v6)
    v5 = v6;
  objc_msgSend(a1, sel_size);
  v8 = v7;
  objc_msgSend(a2, sel_size);
  v10 = v8 + v9;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3828]), sel_initWithSize_, v5, v10);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(double *)(v12 + 24) = v5;
  *(double *)(v12 + 32) = v10;
  *(_QWORD *)(v12 + 40) = a2;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1AC70679C;
  *(_QWORD *)(v13 + 24) = v12;
  v20[4] = sub_1AC7067BC;
  v20[5] = v13;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 1107296256;
  v20[2] = sub_1AC6AA94C;
  v20[3] = &block_descriptor_9;
  v14 = _Block_copy(v20);
  v15 = a1;
  v16 = a2;
  swift_retain();
  swift_release();
  v17 = objc_msgSend(v11, sel_imageWithActions_, v14);

  _Block_release(v14);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
    return (uint64_t)v17;
  __break(1u);
  return result;
}

id sub_1AC7066B8(int a1, id a2, double a3, double a4, void *a5)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend(a2, sel_size);
  v9 = a4 - v8;
  objc_msgSend(a2, sel_size);
  v11 = v10;
  objc_msgSend(a2, sel_size);
  objc_msgSend(a2, sel_drawInRect_, 0.0, v9, v11, v12);
  objc_msgSend(a5, sel_size);
  v14 = v13;
  objc_msgSend(a5, sel_size);
  return objc_msgSend(a5, sel_drawInRect_, 0.0, 0.0, v14, v15);
}

uint64_t sub_1AC706770()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1AC70679C(int a1)
{
  uint64_t v1;

  return sub_1AC7066B8(a1, *(id *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_1AC7067AC()
{
  return swift_deallocObject();
}

uint64_t sub_1AC7067BC(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC6AA92C(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t _s5JetUI8AdaptiveVyACxcAA12CustomLayoutRzlufC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;
  uint64_t result;

  v7 = *(_QWORD *)(a3 + 8);
  a4[3] = a2;
  a4[4] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a4);
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(boxed_opaque_existential_0, a1, a2);
  a4[5] = MEMORY[0x1E0DEE9D8];
  return result;
}

__n128 Adaptive.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __n128 result;

  a2[3] = (uint64_t)&type metadata for Adaptive;
  a2[4] = (uint64_t)&protocol witness table for Adaptive;
  v4 = swift_allocObject();
  *a2 = v4;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v4 + 32) = v5;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v4 + 48) = result;
  a2[5] = MEMORY[0x1E0DEE9D8];
  return result;
}

uint64_t sub_1AC706890()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AC7068C0(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a2;
}

__n128 _s5JetUI8AdaptiveV8onCustomyACSbSo17UITraitCollectionCc_xtAA0E6LayoutRzlF_0@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t *boxed_opaque_existential_0;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  __n128 result;
  __int128 v21;
  __n128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  sub_1AC7068C0(v6, a6);
  v13 = *(_QWORD *)(a5 + 8);
  *((_QWORD *)&v24 + 1) = a4;
  v25 = v13;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v23);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_0, a3, a4);
  v22.n128_u64[0] = a1;
  v22.n128_u64[1] = a2;
  v15 = *(char **)(a6 + 40);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v15 = sub_1AC6A3390(0, *((_QWORD *)v15 + 2) + 1, 1, v15);
  v17 = *((_QWORD *)v15 + 2);
  v16 = *((_QWORD *)v15 + 3);
  if (v17 >= v16 >> 1)
    v15 = sub_1AC6A3390((char *)(v16 > 1), v17 + 1, 1, v15);
  *((_QWORD *)v15 + 2) = v17 + 1;
  v18 = &v15[56 * v17];
  v19 = v25;
  result = v22;
  v21 = v24;
  *((_OWORD *)v18 + 3) = v23;
  *((_OWORD *)v18 + 4) = v21;
  *((__n128 *)v18 + 2) = v22;
  *((_QWORD *)v18 + 10) = v19;
  *(_QWORD *)(a6 + 40) = v15;
  return result;
}

__n128 Adaptive.onCustom(_:_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  __n128 result;
  __n128 v16;

  v5 = v4;
  sub_1AC7068C0(v5, a4);
  v10 = swift_allocObject();
  sub_1AC7068C0(a3, v10 + 16);
  v11 = *(char **)(a4 + 40);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v11 = sub_1AC6A3390(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
  v13 = *((_QWORD *)v11 + 2);
  v12 = *((_QWORD *)v11 + 3);
  if (v13 >= v12 >> 1)
    v11 = sub_1AC6A3390((char *)(v12 > 1), v13 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v13 + 1;
  v14 = &v11[56 * v13];
  *((_QWORD *)v14 + 4) = a1;
  *((_QWORD *)v14 + 5) = a2;
  *((_QWORD *)v14 + 6) = v10;
  result = v16;
  *(__n128 *)(v14 + 56) = v16;
  *((_QWORD *)v14 + 9) = &type metadata for Adaptive;
  *((_QWORD *)v14 + 10) = &protocol witness table for Adaptive;
  *(_QWORD *)(a4 + 40) = v11;
  return result;
}

uint64_t Adaptive.onAccessibleContentSize<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Adaptive.onCustom<A>(_:_:)(sub_1AC706B64, 0, a1, a2, a3);
}

{
  return Adaptive.onCustom<A>(_:_:)(sub_1AC706B64, 0, a1, a2, a3);
}

__n128 Adaptive.onAccessibleContentSize(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  __n128 result;
  __n128 v11;

  sub_1AC7068C0(v2, a2);
  v5 = swift_allocObject();
  sub_1AC7068C0(a1, v5 + 16);
  v6 = *(char **)(a2 + 40);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = sub_1AC6A3390(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
  v8 = *((_QWORD *)v6 + 2);
  v7 = *((_QWORD *)v6 + 3);
  if (v8 >= v7 >> 1)
    v6 = sub_1AC6A3390((char *)(v7 > 1), v8 + 1, 1, v6);
  *((_QWORD *)v6 + 2) = v8 + 1;
  v9 = &v6[56 * v8];
  *((_QWORD *)v9 + 4) = sub_1AC706B64;
  *((_QWORD *)v9 + 5) = 0;
  *((_QWORD *)v9 + 6) = v5;
  result = v11;
  *(__n128 *)(v9 + 56) = v11;
  *((_QWORD *)v9 + 9) = &type metadata for Adaptive;
  *((_QWORD *)v9 + 10) = &protocol witness table for Adaptive;
  *(_QWORD *)(a2 + 40) = v6;
  return result;
}

uint64_t sub_1AC706C88(void *a1)
{
  id v1;
  char v2;

  v1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  v2 = sub_1AC726670();

  return v2 & 1;
}

uint64_t Adaptive.bestLayout(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t v11;

  v4 = *(_QWORD *)(v2 + 40);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
    return sub_1AC68E218(v2, a2);
  v7 = v4 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1AC707344(v7, (uint64_t)&v10);
    v8 = v10;
    swift_retain();
    LOBYTE(v8) = v8(a1);
    swift_release();
    if ((v8 & 1) != 0)
      break;
    sub_1AC7073B0((uint64_t)&v10);
    v7 += 56;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      return sub_1AC68E218(v2, a2);
    }
  }
  swift_bridgeObjectRelease();
  sub_1AC68E218((uint64_t)&v11, a2);
  return sub_1AC7073B0((uint64_t)&v10);
}

uint64_t Adaptive._bestLayoutForTesting(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  _BYTE v10[40];

  v2 = *(_QWORD *)(v1 + 40);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v5 = v2 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1AC707344(v5, (uint64_t)&v8);
      v6 = v8;
      swift_retain();
      LOBYTE(v6) = v6(a1);
      swift_release();
      if ((v6 & 1) != 0)
        break;
      sub_1AC7073B0((uint64_t)&v8);
      v5 += 56;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    sub_1AC68E218((uint64_t)&v9, (uint64_t)v10);
    sub_1AC7073B0((uint64_t)&v8);
  }
  else
  {
LABEL_6:
    sub_1AC68E218(v1, (uint64_t)v10);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B1C8);
  return swift_dynamicCast();
}

JUMeasurements __swiftcall Adaptive.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  double height;
  double width;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  JUMeasurements result;

  height = toFit.height;
  width = toFit.width;
  Adaptive.bestLayout(with:)((uint64_t)with.super.isa, (uint64_t)v18);
  v5 = v19;
  v6 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  v7 = (*(double (**)(Class, uint64_t, uint64_t, double, double))(v6 + 8))(with.super.isa, v5, v6, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

Swift::Void __swiftcall Adaptive.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  height = at.size.height;
  width = at.size.width;
  y = at.origin.y;
  x = at.origin.x;
  Adaptive.bestLayout(with:)((uint64_t)with.super.isa, (uint64_t)v9);
  v7 = v10;
  v8 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v8 + 16))(with.super.isa, v7, v8, x, y, width, height);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

JetUI::_LayoutAlignment __swiftcall Adaptive._layoutAlignment(with:)(UITraitCollection with)
{
  _WORD *v1;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;
  JetUI::_LayoutAlignment v6;
  __int128 v7[2];
  uint64_t v8;
  _BYTE v9[40];
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v3 = v1;
  Adaptive.bestLayout(with:)((uint64_t)with.super.isa, (uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD538);
  if (swift_dynamicCast())
  {
    sub_1AC68AAA4(v7, (uint64_t)v10);
    v4 = v11;
    v5 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    (*(void (**)(Class, uint64_t, uint64_t))(v5 + 8))(with.super.isa, v4, v5);
    return (JetUI::_LayoutAlignment)__swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v8 = 0;
    memset(v7, 0, sizeof(v7));
    v6 = (JetUI::_LayoutAlignment)sub_1AC7073E0((uint64_t)v7);
    *v3 = 0;
  }
  return v6;
}

uint64_t Adaptive._eraseToAnyForTesting(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  Adaptive.bestLayout(with:)(a1, (uint64_t)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B1C8);
  swift_dynamicCast();
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(a1, v2, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

double sub_1AC707160(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  Adaptive.bestLayout(with:)(a1, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v8 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v7 + 8))(a1, v6, v7, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

uint64_t sub_1AC707204(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  Adaptive.bestLayout(with:)(a1, (uint64_t)v13);
  v10 = v14;
  v11 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double, double))(v11 + 16))(a1, v10, v11, a2, a3, a4, a5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_1AC70729C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  Adaptive.bestLayout(with:)(a1, (uint64_t)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B1C8);
  swift_dynamicCast();
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(a1, v2, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_1AC707344(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 8) = v3;
  v4 = a2 + 16;
  v5 = a1 + 16;
  v6 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 40) = v6;
  v7 = v6;
  v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_retain();
  v8(v4, v5, v7);
  return a2;
}

uint64_t sub_1AC7073B0(uint64_t a1)
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return a1;
}

uint64_t sub_1AC7073E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD540);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for Adaptive(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Adaptive(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for Adaptive(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Adaptive(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Adaptive()
{
  return &type metadata for Adaptive;
}

uint64_t destroy for Adaptive.Alternate(uint64_t a1)
{
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t initializeWithCopy for Adaptive.Alternate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = a2 + 16;
  v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 16, v4, v6);
  return a1;
}

_QWORD *assignWithCopy for Adaptive.Alternate(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
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

uint64_t assignWithTake for Adaptive.Alternate(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for Adaptive.Alternate(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Adaptive.Alternate(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Adaptive.Alternate()
{
  return &type metadata for Adaptive.Alternate;
}

uint64_t VerticalStack.add(_:with:)(_QWORD *a1, void (*a2)(_OWORD *))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];

  v3 = a1[3];
  v4 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  Measurable.placeable.getter(v3, v4, v6);
  VerticalStack.add(_:with:)((uint64_t)v6, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t VerticalStack.adding(_:with:)@<X0>(_QWORD *a1@<X0>, void (*a2)(_OWORD *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];

  v4 = v3;
  v7 = a1[3];
  v8 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  Measurable.placeable.getter(v7, v8, v10);
  sub_1AC6CCDCC(v4, a3);
  VerticalStack.add(_:with:)((uint64_t)v10, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t VerticalStack.insert(_:at:with:)(_QWORD *a1, int64_t a2, void (*a3)(_BYTE *))
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v5 = a1[3];
  v6 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  Measurable.placeable.getter(v5, v6, v8);
  VerticalStack.insert(_:at:with:)((uint64_t)v8, a2, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t VerticalStack.inserting(_:at:with:)@<X0>(_QWORD *a1@<X0>, int64_t a2@<X1>, void (*a3)(_BYTE *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];

  v5 = v4;
  v9 = a1[3];
  v10 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  Measurable.placeable.getter(v9, v10, v12);
  sub_1AC6CCDCC(v5, a4);
  VerticalStack.insert(_:at:with:)((uint64_t)v12, a2, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

__n128 FrameLayout.init(view:skipLayoutMeasurements:layoutMargins:)@<Q0>(__int128 *a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v13;
  __int128 v14;
  __n128 result;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;

  sub_1AC68AAA4(a1, (uint64_t)v16);
  BYTE8(v17) = a2;
  *(double *)&v18 = a4;
  *((double *)&v18 + 1) = a5;
  *(double *)&v19 = a6;
  *((double *)&v19 + 1) = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6A0);
  v13 = swift_allocObject();
  v14 = v18;
  *(_OWORD *)(v13 + 48) = v17;
  *(_OWORD *)(v13 + 64) = v14;
  *(_OWORD *)(v13 + 80) = v19;
  result = (__n128)v16[1];
  *(_OWORD *)(v13 + 16) = v16[0];
  *(__n128 *)(v13 + 32) = result;
  *a3 = v13;
  return result;
}

uint64_t FrameLayout.view.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  __int128 v5[5];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC707A28(v3, (uint64_t)v5);
  return sub_1AC68AAA4(v5, a1);
}

uint64_t sub_1AC707A28(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(_BYTE *)(a2 + 40) = *(_BYTE *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 64) = v5;
  return a2;
}

uint64_t sub_1AC707A7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v5[5];

  v3 = *a1 + 16;
  swift_beginAccess();
  sub_1AC707A28(v3, (uint64_t)v5);
  return sub_1AC68AAA4(v5, a2);
}

uint64_t FrameLayout.view.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v9[5];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC707A28(v3, (uint64_t)v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v9, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC707BBC(v9, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6A0);
    v5 = (_OWORD *)swift_allocObject();
    v6 = v9[3];
    v5[3] = v9[2];
    v5[4] = v6;
    v5[5] = v9[4];
    v7 = v9[1];
    v5[1] = v9[0];
    v5[2] = v7;
    swift_release();
    *v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1AC707BBC(__int128 *a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  __swift_destroy_boxed_opaque_existential_1(a2);
  v4 = *a1;
  v5 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v4;
  *(_OWORD *)(a2 + 16) = v5;
  *(_BYTE *)(a2 + 40) = *((_BYTE *)a1 + 40);
  v6 = a1[4];
  *(_OWORD *)(a2 + 48) = a1[3];
  *(_OWORD *)(a2 + 64) = v6;
  return a2;
}

void (*FrameLayout.view.modify(__int128 **a1))(uint64_t **a1, char a2)
{
  _QWORD *v1;
  __int128 *v3;
  uint64_t v4;

  v3 = (__int128 *)malloc(0x98uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 18) = v1;
  v4 = *v1 + 16;
  swift_beginAccess();
  sub_1AC707A28(v4, (uint64_t)v3);
  sub_1AC68AAA4(v3, (uint64_t)(v3 + 5));
  return sub_1AC707C84;
}

void sub_1AC707C84(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = *a1;
  v3 = (uint64_t)(*a1 + 10);
  if ((a2 & 1) != 0)
  {
    sub_1AC68E218((uint64_t)(*a1 + 10), (uint64_t)v2);
    FrameLayout.view.setter(v2);
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  else
  {
    FrameLayout.view.setter(*a1 + 10);
  }
  free(v2);
}

uint64_t FrameLayout.skipLayoutMeasurements.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 56);
}

uint64_t FrameLayout.skipLayoutMeasurements.setter(char a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC707A28(v3, (uint64_t)v9);
  BYTE8(v10) = a1;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC707BBC(v9, v4);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6A0);
    v6 = (_OWORD *)swift_allocObject();
    v7 = v11;
    v6[3] = v10;
    v6[4] = v7;
    v6[5] = v12;
    v8 = v9[1];
    v6[1] = v9[0];
    v6[2] = v8;
    result = swift_release();
    *v1 = v6;
  }
  return result;
}

void (*FrameLayout.skipLayoutMeasurements.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = *v1;
  swift_beginAccess();
  *((_BYTE *)v3 + 32) = *(_BYTE *)(v4 + 56);
  return sub_1AC707E58;
}

void sub_1AC707E58(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  FrameLayout.skipLayoutMeasurements.setter(*(_BYTE *)(*(_QWORD *)a1 + 32));
  free(v1);
}

double FrameLayout.layoutMargins.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(double *)(v1 + 64);
}

uint64_t FrameLayout.layoutMargins.setter(double a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15[3];
  __int128 v16;
  __int128 v17;

  v9 = *v4 + 16;
  swift_beginAccess();
  sub_1AC707A28(v9, (uint64_t)v15);
  *(double *)&v16 = a1;
  *((double *)&v16 + 1) = a2;
  *(double *)&v17 = a3;
  *((double *)&v17 + 1) = a4;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v10 = *v4 + 16;
    swift_beginAccess();
    sub_1AC707BBC(v15, v10);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6A0);
    v12 = (_OWORD *)swift_allocObject();
    v13 = v16;
    v12[3] = v15[2];
    v12[4] = v13;
    v12[5] = v17;
    v14 = v15[1];
    v12[1] = v15[0];
    v12[2] = v14;
    result = swift_release();
    *v4 = v12;
  }
  return result;
}

void (*FrameLayout.layoutMargins.modify(_QWORD *a1))(double **a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  v4 = *v1;
  swift_beginAccess();
  v5 = *(_OWORD *)(v4 + 80);
  *(_OWORD *)v3 = *(_OWORD *)(v4 + 64);
  *((_OWORD *)v3 + 1) = v5;
  return sub_1AC708018;
}

void sub_1AC708018(double **a1)
{
  double *v1;

  v1 = *a1;
  FrameLayout.layoutMargins.setter(**a1, (*a1)[1], (*a1)[2], (*a1)[3]);
  free(v1);
}

double FrameLayout.measurements(fitting:in:)(uint64_t a1, double a2, double a3)
{
  double **v3;
  double *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  __int128 v15[5];
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v7 = *v3;
  v8 = (uint64_t)(*v3 + 2);
  swift_beginAccess();
  v9 = a2 - (v7[9] + v7[11]);
  v10 = a3 - (v7[8] + v7[10]);
  sub_1AC707A28(v8, (uint64_t)v15);
  sub_1AC68AAA4(v15, (uint64_t)v16);
  v11 = v17;
  v12 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  v13 = (*(double (**)(uint64_t, uint64_t, double, double))(*(_QWORD *)(v12 + 8) + 8))(a1, v11, v9, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v13;
}

void FrameLayout.placeChildren(relativeTo:in:)(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t *v6;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat Height;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double MinX;
  CGFloat MinY;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  __int128 v36[5];
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v13 = *v6;
  swift_beginAccess();
  v14 = *(double *)(v13 + 64);
  v15 = *(double *)(v13 + 72);
  v16 = v15 + a3;
  v17 = v14 + a4;
  v18 = a5 - (v15 + *(double *)(v13 + 88));
  v19 = a6 - (v14 + *(double *)(v13 + 80));
  if (*(_BYTE *)(v13 + 56) == 1)
  {
    sub_1AC707A28(v13 + 16, (uint64_t)v36);
    sub_1AC68AAA4(v36, (uint64_t)v37);
    v20 = v38;
    v21 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v21 + 24))(v20, v21, v16, v17, v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v40.origin.x = v16;
    v40.origin.y = v17;
    v40.size.width = v18;
    v40.size.height = v19;
    Height = CGRectGetHeight(v40);
    v23 = 0;
  }
  else
  {
    sub_1AC707A28(v13 + 16, (uint64_t)v36);
    sub_1AC68AAA4(v36, (uint64_t)v37);
    v24 = v38;
    v25 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    v35 = (*(double (**)(uint64_t, uint64_t, double, double))(*(_QWORD *)(v25 + 8) + 8))(a1, v24, v18, v19);
    v27 = v26;
    Height = v28;
    v23 = v29;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v41.origin.x = v16;
    v41.origin.y = v17;
    v41.size.width = v18;
    v41.size.height = v19;
    MinX = CGRectGetMinX(v41);
    v42.origin.x = v16;
    v42.origin.y = v17;
    v42.size.width = v18;
    v42.size.height = v19;
    MinY = CGRectGetMinY(v42);
    sub_1AC707A28(v13 + 16, (uint64_t)v36);
    sub_1AC68AAA4(v36, (uint64_t)v37);
    v32 = v38;
    v33 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    v34 = MinY;
    v18 = v35;
    (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v33 + 24))(v32, v33, MinX, v34, v35, v27);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v19 = v27;
  }
  *(double *)a2 = v16;
  *(double *)(a2 + 8) = v17;
  *(double *)(a2 + 16) = v18;
  *(double *)(a2 + 24) = v19;
  *(CGFloat *)(a2 + 32) = Height;
  *(_QWORD *)(a2 + 40) = v23;
}

uint64_t sub_1AC70835C(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return FrameLayout.view.setter(v2);
}

uint64_t sub_1AC708390@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 56);
  return result;
}

uint64_t sub_1AC7083D4(char *a1)
{
  return FrameLayout.skipLayoutMeasurements.setter(*a1);
}

__n128 sub_1AC7083F8@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_beginAccess();
  result = *(__n128 *)(v3 + 64);
  v5 = *(_OWORD *)(v3 + 80);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_1AC70843C(double *a1)
{
  return FrameLayout.layoutMargins.setter(*a1, a1[1], a1[2], a1[3]);
}

ValueMetadata *type metadata accessor for FrameLayout()
{
  return &type metadata for FrameLayout;
}

uint64_t initializeWithCopy for FrameLayout.Storage(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

uint64_t assignWithCopy for FrameLayout.Storage(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t assignWithTake for FrameLayout.Storage(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

ValueMetadata *type metadata accessor for FrameLayout.Storage()
{
  return &type metadata for FrameLayout.Storage;
}

id sub_1AC708568(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MinX;
  double v16;
  double MinY;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v10 = objc_msgSend(a1, sel_layer);
  objc_msgSend(v10, sel_anchorPoint);
  v12 = v11;
  v14 = v13;

  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  MinX = CGRectGetMinX(v19);
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  v16 = MinX + v12 * CGRectGetWidth(v20);
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  MinY = CGRectGetMinY(v21);
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  objc_msgSend(a1, sel_setCenter_, v16, MinY + v14 * CGRectGetHeight(v22));
  objc_msgSend(a1, sel_bounds);
  return objc_msgSend(a1, sel_setBounds_);
}

CGFloat sub_1AC708684()
{
  id *v0;
  id v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGRect v12;
  CGRect v13;

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_layer);
  objc_msgSend(v2, sel_anchorPoint);
  v4 = v3;

  objc_msgSend(v1, sel_center);
  v6 = v5;
  objc_msgSend(v1, sel_frame);
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  v10 = v6 - v4 * CGRectGetWidth(v12);
  v13.origin.x = v10;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGRectGetHeight(v13);
  return v10;
}

id sub_1AC70875C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  void **v4;

  return sub_1AC708568(*v4, a1, a2, a3, a4);
}

void (*sub_1AC708764(double **a1))(CGFloat **a1)
{
  void **v1;
  double *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  CGRect v20;
  CGRect v21;

  v3 = (double *)malloc(0x28uLL);
  *a1 = v3;
  v4 = *v1;
  *((_QWORD *)v3 + 4) = v4;
  v5 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v5, sel_anchorPoint);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, sel_center);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, sel_frame);
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v17 = v11 - v7 * CGRectGetWidth(v20);
  v21.origin.x = v17;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v18 = CGRectGetHeight(v21);
  *v3 = v17;
  v3[1] = v13 - v9 * v18;
  v3[2] = width;
  v3[3] = height;
  return sub_1AC708864;
}

void sub_1AC708864(CGFloat **a1)
{
  CGFloat *v1;

  v1 = *a1;
  sub_1AC708568(*((void **)*a1 + 4), *v1, v1[1], v1[2], v1[3]);
  free(v1);
}

id sub_1AC708894()
{
  id *v0;

  return objc_msgSend(*v0, sel_jet_focusedFrame);
}

id UIView.withUntransformedFrame.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  a1[3] = &type metadata for UIViewAffineTransformAdapter;
  a1[4] = &off_1E5BF95C0;
  *a1 = v1;
  return v1;
}

ValueMetadata *type metadata accessor for UIViewAffineTransformAdapter()
{
  return &type metadata for UIViewAffineTransformAdapter;
}

__C::CGRect __swiftcall measuringBoundingRect(toFit:)(CGSize toFit)
{
  double height;
  double width;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect v8;
  __C::CGRect result;

  height = toFit.height;
  width = toFit.width;
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = width;
  v7.size.height = height;
  if (CGRectGetWidth(v7) == 1.79769313e308)
    width = 0.0;
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = width;
  v8.size.height = height;
  if (CGRectGetHeight(v8) == 1.79769313e308)
    v3 = 0.0;
  else
    v3 = height;
  v4 = 0.0;
  v5 = 0.0;
  v6 = width;
  result.size.height = v3;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

CGSize __swiftcall constrainWidth(of:toFit:)(CGSize of, CGSize toFit)
{
  double height;
  double width;
  CGFloat v4;
  double v5;
  double v7;
  double v8;
  CGSize result;
  char v10;

  height = toFit.height;
  width = toFit.width;
  v4 = of.height;
  v5 = of.width;
  if (qword_1ED0BE070 != -1)
    swift_once();
  sub_1AC726BD4();
  if ((v10 & 2) == 0)
  {
    if (width == 0.0)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (width != 0.0 || height != 0.0)
  {
LABEL_10:
    if (width < v5)
      v5 = width;
  }
LABEL_12:
  v7 = v5;
  v8 = v4;
  result.height = v8;
  result.width = v7;
  return result;
}

CGSize __swiftcall constrainHeight(of:toFit:)(CGSize of, CGSize toFit)
{
  double height;
  double width;
  double v4;
  CGFloat v5;
  double v7;
  double v8;
  CGSize result;
  char v10;

  height = toFit.height;
  width = toFit.width;
  v4 = of.height;
  v5 = of.width;
  if (qword_1ED0BE070 != -1)
    swift_once();
  sub_1AC726BD4();
  if ((v10 & 2) == 0)
  {
    if (height == 0.0)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (width != 0.0 || height != 0.0)
  {
LABEL_10:
    if (height < v4)
      v4 = height;
  }
LABEL_12:
  v7 = v5;
  v8 = v4;
  result.height = v8;
  result.width = v7;
  return result;
}

__n128 AspectFitLayout.init(view:aspectRatio:anchorPoint:)@<Q0>(__int128 *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  __n128 result;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v8 = *a2;
  v9 = a2[1];
  v10 = *((_BYTE *)a2 + 16);
  sub_1AC68AAA4(a1, (uint64_t)v14);
  *((_QWORD *)&v15 + 1) = v8;
  *(_QWORD *)&v16 = v9;
  BYTE8(v16) = v10;
  *(double *)&v17 = a4;
  *((double *)&v17 + 1) = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD438);
  v11 = swift_allocObject();
  v12 = v16;
  *(_OWORD *)(v11 + 48) = v15;
  *(_OWORD *)(v11 + 64) = v12;
  *(_OWORD *)(v11 + 80) = v17;
  result = (__n128)v14[1];
  *(_OWORD *)(v11 + 16) = v14[0];
  *(__n128 *)(v11 + 32) = result;
  *a3 = v11;
  return result;
}

uint64_t AspectFitLayout.view.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  __int128 v5[5];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC708BBC(v3, (uint64_t)v5);
  return sub_1AC68AAA4(v5, a1);
}

uint64_t sub_1AC708BBC(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  v5 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(a2 + 56) = *(_BYTE *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v5;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  return a2;
}

uint64_t sub_1AC708C18@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v5[5];

  v3 = *a1 + 16;
  swift_beginAccess();
  sub_1AC708BBC(v3, (uint64_t)v5);
  return sub_1AC68AAA4(v5, a2);
}

uint64_t AspectFitLayout.view.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v9[5];

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC708BBC(v3, (uint64_t)v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v9, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v4 = *v1 + 16;
    swift_beginAccess();
    sub_1AC708D58(v9, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD438);
    v5 = (_OWORD *)swift_allocObject();
    v6 = v9[3];
    v5[3] = v9[2];
    v5[4] = v6;
    v5[5] = v9[4];
    v7 = v9[1];
    v5[1] = v9[0];
    v5[2] = v7;
    swift_release();
    *v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1AC708D58(__int128 *a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  __swift_destroy_boxed_opaque_existential_1(a2);
  v4 = *a1;
  v5 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v4;
  *(_OWORD *)(a2 + 16) = v5;
  v6 = *(__int128 *)((char *)a1 + 40);
  *(_BYTE *)(a2 + 56) = *((_BYTE *)a1 + 56);
  *(_OWORD *)(a2 + 40) = v6;
  *(_OWORD *)(a2 + 64) = a1[4];
  return a2;
}

void (*AspectFitLayout.view.modify(__int128 **a1))(uint64_t **a1, char a2)
{
  _QWORD *v1;
  __int128 *v3;
  uint64_t v4;

  v3 = (__int128 *)malloc(0x98uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 18) = v1;
  v4 = *v1 + 16;
  swift_beginAccess();
  sub_1AC708BBC(v4, (uint64_t)v3);
  sub_1AC68AAA4(v3, (uint64_t)(v3 + 5));
  return sub_1AC708E28;
}

void sub_1AC708E28(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = *a1;
  v3 = (uint64_t)(*a1 + 10);
  if ((a2 & 1) != 0)
  {
    sub_1AC68E218((uint64_t)(*a1 + 10), (uint64_t)v2);
    AspectFitLayout.view.setter(v2);
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  else
  {
    AspectFitLayout.view.setter(*a1 + 10);
  }
  free(v2);
}

__n128 AspectFitLayout.explicitAspectRatio.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = *v1;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 72);
  result = *(__n128 *)(v3 + 56);
  *a1 = result;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t AspectFitLayout.explicitAspectRatio.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *v1 + 16;
  swift_beginAccess();
  sub_1AC708BBC(v5, (uint64_t)v11);
  *((_QWORD *)&v12 + 1) = v2;
  *(_QWORD *)&v13 = v3;
  BYTE8(v13) = v4;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v6 = *v1 + 16;
    swift_beginAccess();
    sub_1AC708D58(v11, v6);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD438);
    v8 = (_OWORD *)swift_allocObject();
    v9 = v13;
    v8[3] = v12;
    v8[4] = v9;
    v8[5] = v14;
    v10 = v11[1];
    v8[1] = v11[0];
    v8[2] = v10;
    result = swift_release();
    *v1 = v8;
  }
  return result;
}

void (*AspectFitLayout.explicitAspectRatio.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t *v1;
  char *v3;
  uint64_t v4;
  char v5;

  v3 = (char *)malloc(0xB8uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 22) = v1;
  v4 = *v1;
  swift_beginAccess();
  v5 = *(_BYTE *)(v4 + 72);
  *(_OWORD *)(v3 + 152) = *(_OWORD *)(v4 + 56);
  v3[168] = v5;
  return sub_1AC709024;
}

void sub_1AC709024(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 152);
  v4 = *(_QWORD *)(*a1 + 160);
  v5 = *(_BYTE *)(*a1 + 168);
  v6 = **(_QWORD **)(*a1 + 176) + 16;
  if ((a2 & 1) != 0)
  {
    swift_beginAccess();
    sub_1AC708BBC(v6, v2);
    *(_QWORD *)(v2 + 40) = v3;
    *(_QWORD *)(v2 + 48) = v4;
    *(_BYTE *)(v2 + 56) = v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *(_QWORD **)(v2 + 176);
    if (isUniquelyReferenced_nonNull_native)
    {
      v9 = *v8 + 16;
      swift_beginAccess();
      sub_1AC708D58((__int128 *)v2, v9);
      swift_endAccess();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD438);
      v13 = (_OWORD *)swift_allocObject();
      v13[1] = *(_OWORD *)v2;
      v14 = *(_OWORD *)(v2 + 64);
      v16 = *(_OWORD *)(v2 + 16);
      v15 = *(_OWORD *)(v2 + 32);
      v13[4] = *(_OWORD *)(v2 + 48);
      v13[5] = v14;
      v13[2] = v16;
      v13[3] = v15;
      swift_release();
      *v8 = v13;
    }
  }
  else
  {
    swift_beginAccess();
    sub_1AC708BBC(v6, v2);
    *(_QWORD *)(v2 + 40) = v3;
    *(_QWORD *)(v2 + 48) = v4;
    *(_BYTE *)(v2 + 56) = v5;
    v10 = swift_isUniquelyReferenced_nonNull_native();
    v11 = *(_QWORD **)(v2 + 176);
    if (v10)
    {
      v12 = *v11 + 16;
      swift_beginAccess();
      sub_1AC708D58((__int128 *)v2, v12);
      swift_endAccess();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD438);
      v17 = (_OWORD *)swift_allocObject();
      v17[1] = *(_OWORD *)v2;
      v18 = *(_OWORD *)(v2 + 64);
      v20 = *(_OWORD *)(v2 + 16);
      v19 = *(_OWORD *)(v2 + 32);
      v17[4] = *(_OWORD *)(v2 + 48);
      v17[5] = v18;
      v17[2] = v20;
      v17[3] = v19;
      swift_release();
      *v11 = v17;
    }
  }
  free((void *)v2);
}

double AspectFitLayout.anchorPoint.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(double *)(v1 + 80);
}

uint64_t AspectFitLayout.anchorPoint.setter(double a1, double a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11[4];
  __int128 v12;

  v5 = *v2 + 16;
  swift_beginAccess();
  sub_1AC708BBC(v5, (uint64_t)v11);
  *(double *)&v12 = a1;
  *((double *)&v12 + 1) = a2;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    v6 = *v2 + 16;
    swift_beginAccess();
    sub_1AC708D58(v11, v6);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD438);
    v8 = (_OWORD *)swift_allocObject();
    v9 = v11[3];
    v8[3] = v11[2];
    v8[4] = v9;
    v8[5] = v12;
    v10 = v11[1];
    v8[1] = v11[0];
    v8[2] = v10;
    result = swift_release();
    *v2 = v8;
  }
  return result;
}

void (*AspectFitLayout.anchorPoint.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)malloc(0x30uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 5) = v1;
  v4 = *v1;
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v4 + 80);
  return sub_1AC709358;
}

void sub_1AC709358(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  AspectFitLayout.anchorPoint.setter(*(double *)(*(_QWORD *)a1 + 24), *(double *)(*(_QWORD *)a1 + 32));
  free(v1);
}

void AspectFitLayout.measurements(fitting:in:)(void *a1, double a2, double a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14[5];
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  v7 = *v3;
  v8 = *v3 + 16;
  swift_beginAccess();
  if ((*(_BYTE *)(v7 + 72) & 1) != 0)
  {
    sub_1AC708BBC(v8, (uint64_t)v14);
    sub_1AC68AAA4(v14, (uint64_t)v15);
    v9 = v16;
    v10 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    v11 = (*(double (**)(void *, uint64_t, double, double))(*(_QWORD *)(v10 + 8) + 8))(a1, v9, a2, a3);
    v13 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    v11 = *(double *)(v7 + 56);
    v13 = *(_QWORD *)(v7 + 64);
  }
  *(double *)v14 = v11;
  *((_QWORD *)&v14[0] + 1) = v13;
  AspectFitMeasurable.measurements(fitting:in:)(a1, a2, a3);
}

double AspectFitLayout.placeChildren(relativeTo:in:)@<D0>(void *a1@<X0>, CGFloat *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double MinX;
  CGFloat Width;
  double v33;
  double v34;
  double Height;
  double v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  id v39;
  double v40;
  double v41;
  void (*v42)(char *, uint64_t);
  id v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, double, double, double, double);
  CGFloat v49;
  CGFloat v50;
  double MaxY;
  double v52;
  double v53;
  double result;
  CGFloat v55;
  uint64_t v56;
  CGFloat v57;
  CGFloat MinY;
  CGFloat v59;
  double v60;
  __int128 v61[5];
  _QWORD v62[3];
  uint64_t v63;
  uint64_t v64;
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

  v13 = sub_1AC726A48();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v56 - v18;
  v20 = *v6;
  v21 = *v6 + 16;
  swift_beginAccess();
  v22 = *(_BYTE *)(v20 + 72);
  v59 = *(double *)&v21;
  if ((v22 & 1) != 0)
  {
    sub_1AC708BBC(v21, (uint64_t)v61);
    sub_1AC68AAA4(v61, (uint64_t)v62);
    v24 = v63;
    v23 = v64;
    __swift_project_boxed_opaque_existential_1(v62, v63);
    v25 = (*(double (**)(void *, uint64_t, double, double))(*(_QWORD *)(v23 + 8) + 8))(a1, v24, a5, a6);
    v27 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    v25 = *(double *)(v20 + 56);
    v27 = *(_QWORD *)(v20 + 64);
  }
  *(double *)v61 = v25;
  *((_QWORD *)&v61[0] + 1) = v27;
  v28 = AspectFitMeasurable.measurements(fitting:in:)(a1, a5, a6);
  v30 = v29;
  v65.origin.x = a3;
  v65.origin.y = a4;
  v65.size.width = a5;
  v65.size.height = a6;
  MinX = CGRectGetMinX(v65);
  v66.origin.x = a3;
  v66.origin.y = a4;
  v66.size.width = a5;
  v66.size.height = a6;
  Width = CGRectGetWidth(v66);
  v33 = *(double *)(v20 + 80);
  v60 = v28;
  v34 = MinX + Width * v33 - v28 * v33;
  v67.origin.x = a3;
  v67.origin.y = a4;
  v67.size.width = a5;
  v67.size.height = a6;
  MinY = CGRectGetMinY(v67);
  v68.origin.x = a3;
  v68.origin.y = a4;
  v68.size.width = a5;
  v68.size.height = a6;
  Height = CGRectGetHeight(v68);
  v36 = *(double *)(v20 + 88);
  v37 = *MEMORY[0x1E0DED508];
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 104);
  v38(v19, v37, v13);
  v39 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v39, sel_displayScale);
  if (v40 <= 0.0)
    v40 = ForJetUIOnly_MainScreenScale();
  v41 = sub_1AC68EE10((uint64_t)v19, v40, v34);

  v42 = *(void (**)(char *, uint64_t))(v14 + 8);
  v42(v19, v13);
  v38(v16, v37, v13);
  v43 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v43, sel_displayScale);
  if (v44 <= 0.0)
    v44 = ForJetUIOnly_MainScreenScale();
  v45 = sub_1AC68EE10((uint64_t)v16, v44, MinY + Height * v36 - v30 * v36);

  v42(v16, v13);
  sub_1AC708BBC(*(uint64_t *)&v59, (uint64_t)v61);
  sub_1AC68AAA4(v61, (uint64_t)v62);
  v46 = v63;
  v47 = v64;
  __swift_project_boxed_opaque_existential_1(v62, v63);
  v48 = *(void (**)(uint64_t, uint64_t, double, double, double, double))(v47 + 24);
  v57 = v45;
  v49 = v60;
  v48(v46, v47, v41, v45, v60, v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  v69.origin.x = a3;
  v69.origin.y = a4;
  v69.size.width = a5;
  v69.size.height = a6;
  v59 = CGRectGetMinX(v69);
  v70.origin.x = a3;
  v70.origin.y = a4;
  v70.size.width = a5;
  v70.size.height = a6;
  MinY = CGRectGetMinY(v70);
  v71.origin.x = v41;
  v71.origin.y = v45;
  v71.size.width = v49;
  v71.size.height = v30;
  v50 = v41;
  MaxY = CGRectGetMaxY(v71);
  v72.origin.x = a3;
  v72.origin.y = a4;
  v72.size.width = a5;
  v72.size.height = a6;
  v52 = MaxY - CGRectGetMinY(v72);
  v73.origin.x = a3;
  v73.origin.y = a4;
  v73.size.width = a5;
  v73.size.height = a6;
  v53 = CGRectGetMaxY(v73);
  v74.origin.x = v50;
  v74.origin.y = v57;
  v74.size.width = v49;
  v74.size.height = v30;
  result = v53 - CGRectGetMaxY(v74);
  v55 = MinY;
  *a2 = v59;
  a2[1] = v55;
  a2[2] = v49;
  a2[3] = v30;
  a2[4] = v52;
  a2[5] = result;
  return result;
}

uint64_t sub_1AC70988C(uint64_t a1)
{
  uint64_t v2[5];

  sub_1AC68E218(a1, (uint64_t)v2);
  return AspectFitLayout.view.setter(v2);
}

__n128 sub_1AC7098C0@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 72);
  result = *(__n128 *)(v3 + 56);
  *a2 = result;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_1AC70990C(__int128 *a1)
{
  char v1;
  __int128 v3;
  char v4;

  v1 = *((_BYTE *)a1 + 16);
  v3 = *a1;
  v4 = v1;
  return AspectFitLayout.explicitAspectRatio.setter((uint64_t *)&v3);
}

__n128 sub_1AC709948@<Q0>(__n128 **a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = *a1;
  swift_beginAccess();
  result = v3[5];
  *a2 = result;
  return result;
}

uint64_t sub_1AC70998C(double *a1)
{
  return AspectFitLayout.anchorPoint.setter(*a1, a1[1]);
}

ValueMetadata *type metadata accessor for AspectFitLayout()
{
  return &type metadata for AspectFitLayout;
}

uint64_t initializeWithCopy for AspectFitLayout.Storage(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for AspectFitLayout.Storage(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  v4 = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t assignWithTake for AspectFitLayout.Storage(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

ValueMetadata *type metadata accessor for AspectFitLayout.Storage()
{
  return &type metadata for AspectFitLayout.Storage;
}

void sub_1AC709ABC()
{
  uint64_t v1;

  v1 = sub_1AC726A48();
  MEMORY[0x1E0C80A78](v1);
  __asm { BR              X10 }
}

double sub_1AC709B48()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetMinY(v5);
}

uint64_t sub_1AC709B7C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  id v10;
  double v11;
  CGRect v13;

  v13.origin.x = v8;
  v13.origin.y = v7;
  v13.size.width = v6;
  v13.size.height = v4;
  CGRectGetMidY(v13);
  v9 = v5 * 0.5;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x1E0DED508], v0);
  v10 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v10, sel_displayScale);
  if (v11 <= 0.0)
    v11 = ForJetUIOnly_MainScreenScale();
  sub_1AC68EE10(v2, v11, v9);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v0);
}

JetUI::FlankedHorizontalLayout::ViewAlignment_optional __swiftcall FlankedHorizontalLayout.ViewAlignment.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (JetUI::FlankedHorizontalLayout::ViewAlignment_optional)rawValue;
}

uint64_t FlankedHorizontalLayout.ViewAlignment.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

JetUI::FlankedHorizontalLayout::ViewAlignment_optional sub_1AC709C84(Swift::Int *a1)
{
  return FlankedHorizontalLayout.ViewAlignment.init(rawValue:)(*a1);
}

uint64_t FlankedHorizontalLayout.init(sublayout:leadingView:leadingMargin:leadingAlignment:trailingView:trailingMargin:trailingAlignment:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, __int128 *a6@<X5>, char *a7@<X6>, uint64_t a8@<X8>)
{
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v13 = *a4;
  v14 = *a7;
  *(_OWORD *)(a8 + 56) = 0u;
  *(_OWORD *)(a8 + 40) = 0u;
  v15 = a8 + 40;
  *(_QWORD *)(a8 + 72) = 0;
  *(_OWORD *)(a8 + 144) = 0u;
  *(_QWORD *)(a8 + 160) = 0;
  *(_OWORD *)(a8 + 128) = 0u;
  v16 = a8 + 128;
  sub_1AC68AAA4(a1, a8);
  sub_1AC6D9850(a2, v15);
  sub_1AC68AAA4(a3, a8 + 80);
  *(_BYTE *)(a8 + 120) = v13;
  sub_1AC6D9850(a5, v16);
  result = sub_1AC68AAA4(a6, a8 + 168);
  *(_BYTE *)(a8 + 208) = v14;
  return result;
}

uint64_t FlankedHorizontalLayout.sublayout.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1, a1);
}

uint64_t FlankedHorizontalLayout.sublayout.setter(__int128 *a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v1);
  return sub_1AC68AAA4(a1, v1);
}

double (*FlankedHorizontalLayout.sublayout.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.leadingView.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6D9918(v1 + 40, a1);
}

uint64_t FlankedHorizontalLayout.leadingView.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC6D9850(a1, v1 + 40);
}

double (*FlankedHorizontalLayout.leadingView.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.leadingMargin.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1 + 80, a1);
}

uint64_t FlankedHorizontalLayout.leadingMargin.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 80;
  __swift_destroy_boxed_opaque_existential_1(v3);
  return sub_1AC68AAA4(a1, v3);
}

double (*FlankedHorizontalLayout.leadingMargin.modify())(void)
{
  return nullsub_1;
}

void FlankedHorizontalLayout.leadingAlignment.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 120);
}

_BYTE *FlankedHorizontalLayout.leadingAlignment.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 120) = *result;
  return result;
}

double (*FlankedHorizontalLayout.leadingAlignment.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.trailingView.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6D9918(v1 + 128, a1);
}

uint64_t FlankedHorizontalLayout.trailingView.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC6D9850(a1, v1 + 128);
}

double (*FlankedHorizontalLayout.trailingView.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.trailingMargin.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1 + 168, a1);
}

uint64_t FlankedHorizontalLayout.trailingMargin.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 168;
  __swift_destroy_boxed_opaque_existential_1(v3);
  return sub_1AC68AAA4(a1, v3);
}

double (*FlankedHorizontalLayout.trailingMargin.modify())(void)
{
  return nullsub_1;
}

void FlankedHorizontalLayout.trailingAlignment.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 208);
}

_BYTE *FlankedHorizontalLayout.trailingAlignment.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 208) = *result;
  return result;
}

double (*FlankedHorizontalLayout.trailingAlignment.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.placeChildren(relativeTo:in:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double Height;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double MinX;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  CGFloat v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v69;
  int v70;
  CGFloat v71;
  CGFloat v72;
  _QWORD v73[3];
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  _QWORD v78[3];
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[3];
  uint64_t v82;
  uint64_t v83;
  _BYTE v84[40];
  _BYTE v85[16];
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v7 = v6;
  v71 = a4;
  v72 = a3;
  v12 = sub_1AC726A48();
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)&v14 = MEMORY[0x1E0C80A78](v12).n128_u64[0];
  v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(a1, sel_traitCollection, v14);
  v18 = objc_msgSend(v17, sel_layoutDirection);

  if (v18 == (id)1)
  {
    sub_1AC6D9918(v7 + 128, (uint64_t)v85);
    sub_1AC6D9918(v7 + 40, (uint64_t)v84);
    v19 = *(unsigned __int8 *)(v7 + 208);
    v70 = *(unsigned __int8 *)(v7 + 120);
    sub_1AC68E218(v7 + 168, (uint64_t)v81);
    v20 = v7 + 80;
  }
  else
  {
    sub_1AC6D9918(v7 + 40, (uint64_t)v85);
    sub_1AC6D9918(v7 + 128, (uint64_t)v84);
    v19 = *(unsigned __int8 *)(v7 + 120);
    v70 = *(unsigned __int8 *)(v7 + 208);
    sub_1AC68E218(v7 + 80, (uint64_t)v81);
    v20 = v7 + 168;
  }
  sub_1AC68E218(v20, (uint64_t)v78);
  sub_1AC6D9918((uint64_t)v85, (uint64_t)&v76);
  if (v77)
  {
    sub_1AC68AAA4(&v76, (uint64_t)v73);
    v21 = v74;
    v22 = v75;
    __swift_project_boxed_opaque_existential_1(v73, v74);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v22 + 40))(v21, v22) & 1) == 0)
    {
      v25 = v74;
      v26 = v75;
      __swift_project_boxed_opaque_existential_1(v73, v74);
      v28 = (*(double (**)(void *, uint64_t, CGFloat, CGFloat))(*(_QWORD *)(v26 + 8) + 8))(a1, v25, a5, a6);
      if (v19 == 3)
      {
        v86.origin.x = v72;
        v86.origin.y = v71;
        v86.size.width = a5;
        v86.size.height = a6;
        Height = CGRectGetHeight(v86);
      }
      else
      {
        Height = v27;
      }
      LOBYTE(v76) = v19;
      v30 = v72;
      v31 = v71;
      sub_1AC709ABC();
      v33 = v32;
      v87.origin.x = v30;
      v87.origin.y = v31;
      v87.size.width = a5;
      v87.size.height = a6;
      MinX = CGRectGetMinX(v87);
      v35 = v74;
      v36 = v75;
      __swift_project_boxed_opaque_existential_1(v73, v74);
      (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v36 + 24))(v35, v36, MinX, v33, v28, Height);
      v37 = v82;
      v38 = v83;
      __swift_project_boxed_opaque_existential_1(v81, v82);
      sub_1AC68E57C((uint64_t)v16);
      AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v16, v37, v38);
      v39 = a5;
      v40 = a6;
      v42 = v41;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      v88.origin.x = MinX;
      v88.origin.y = v33;
      v88.size.width = v28;
      v88.size.height = Height;
      v43 = v42 + CGRectGetWidth(v88) + v30;
      v89.origin.x = MinX;
      v24 = v43;
      v89.origin.y = v33;
      v89.size.width = v28;
      v89.size.height = Height;
      v44 = v42 + CGRectGetWidth(v89);
      a6 = v40;
      a5 = v39;
      v23 = v39 - v44;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
      goto LABEL_13;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
  }
  else
  {
    sub_1AC6DA314((uint64_t)&v76);
  }
  v23 = a5;
  v24 = v72;
LABEL_13:
  sub_1AC6D9918((uint64_t)v84, (uint64_t)&v76);
  if (v77)
  {
    sub_1AC68AAA4(&v76, (uint64_t)v73);
    v45 = v74;
    v46 = v75;
    __swift_project_boxed_opaque_existential_1(v73, v74);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v46 + 40))(v45, v46) & 1) != 0)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
    }
    else
    {
      v47 = v74;
      v48 = v75;
      __swift_project_boxed_opaque_existential_1(v73, v74);
      v50 = (*(double (**)(void *, uint64_t, CGFloat, CGFloat))(*(_QWORD *)(v48 + 8) + 8))(a1, v47, a5, a6);
      v69 = v24;
      if (v70 == 3)
      {
        v90.origin.x = v72;
        v90.origin.y = v71;
        v90.size.width = a5;
        v90.size.height = a6;
        v51 = CGRectGetHeight(v90);
      }
      else
      {
        v51 = v49;
      }
      LOBYTE(v76) = v70;
      v52 = v72;
      v53 = v71;
      sub_1AC709ABC();
      v55 = v54;
      v91.origin.x = v52;
      v91.origin.y = v53;
      v91.size.width = a5;
      v91.size.height = a6;
      v56 = CGRectGetMaxX(v91) - v50;
      v57 = v74;
      v58 = v75;
      __swift_project_boxed_opaque_existential_1(v73, v74);
      (*(void (**)(uint64_t, uint64_t, CGFloat, double, double, double))(v58 + 24))(v57, v58, v56, v55, v50, v51);
      v59 = v79;
      v60 = v80;
      __swift_project_boxed_opaque_existential_1(v78, v79);
      sub_1AC68E57C((uint64_t)v16);
      AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v16, v59, v60);
      v62 = v61;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      v92.origin.x = v56;
      v92.origin.y = v55;
      v92.size.width = v50;
      v92.size.height = v51;
      v23 = v23 - (v62 + CGRectGetWidth(v92));
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
      v24 = v69;
    }
  }
  else
  {
    sub_1AC6DA314((uint64_t)&v76);
  }
  v63 = *(_QWORD *)(v7 + 24);
  v64 = *(_QWORD *)(v7 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v7, v63);
  v65 = v71;
  (*(void (**)(_QWORD *__return_ptr, void *, uint64_t, uint64_t, double, CGFloat, double, CGFloat))(v64 + 8))(v73, a1, v63, v64, v24, v71, v23, a6);
  v66 = v72;
  v93.origin.x = v72;
  v93.origin.y = v65;
  v93.size.width = a5;
  v93.size.height = a6;
  v67 = CGRectGetHeight(v93);
  *(CGFloat *)a2 = v66;
  *(CGFloat *)(a2 + 8) = v65;
  *(CGFloat *)(a2 + 16) = a5;
  *(CGFloat *)(a2 + 24) = a6;
  *(CGFloat *)(a2 + 32) = v67;
  *(_QWORD *)(a2 + 40) = 0;
  sub_1AC6DA314((uint64_t)v84);
  sub_1AC6DA314((uint64_t)v85);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
}

unint64_t sub_1AC70A52C()
{
  unint64_t result;

  result = qword_1EEC8B6A8;
  if (!qword_1EEC8B6A8)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for FlankedHorizontalLayout.ViewAlignment, &type metadata for FlankedHorizontalLayout.ViewAlignment);
    atomic_store(result, (unint64_t *)&qword_1EEC8B6A8);
  }
  return result;
}

uint64_t destroy for FlankedHorizontalLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  if (*(_QWORD *)(a1 + 152))
    __swift_destroy_boxed_opaque_existential_1(a1 + 128);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 168);
}

uint64_t initializeWithCopy for FlankedHorizontalLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  _OWORD *v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = (_OWORD *)(a1 + 40);
  v6 = (_OWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 64);
  if (v7)
  {
    v8 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v7;
    *(_QWORD *)(a1 + 72) = v8;
    (**(void (***)(_OWORD *, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 56);
    *v5 = *v6;
    *(_OWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, a2 + 80);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v11 = (_OWORD *)(a1 + 128);
  v12 = (_OWORD *)(a2 + 128);
  v13 = *(_QWORD *)(a2 + 152);
  if (v13)
  {
    v14 = *(_QWORD *)(a2 + 160);
    *(_QWORD *)(a1 + 152) = v13;
    *(_QWORD *)(a1 + 160) = v14;
    (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
  }
  else
  {
    v15 = *(_OWORD *)(a2 + 144);
    *v11 = *v12;
    *(_OWORD *)(a1 + 144) = v15;
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  }
  v16 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 192) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 168, a2 + 168);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  return a1;
}

uint64_t assignWithCopy for FlankedHorizontalLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  v4 = *(_QWORD *)(a2 + 64);
  if (*(_QWORD *)(a1 + 64))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 64) = v4;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
    goto LABEL_8;
  }
  v5 = *(_OWORD *)(a2 + 40);
  v6 = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 56) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v7 = *(_QWORD *)(a2 + 152);
  if (!*(_QWORD *)(a1 + 152))
  {
    if (v7)
    {
      *(_QWORD *)(a1 + 152) = v7;
      *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 128, a2 + 128);
      goto LABEL_15;
    }
LABEL_14:
    v8 = *(_OWORD *)(a2 + 128);
    v9 = *(_OWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 128) = v8;
    *(_OWORD *)(a1 + 144) = v9;
    goto LABEL_15;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 128);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 128), (uint64_t *)(a2 + 128));
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 168), (uint64_t *)(a2 + 168));
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  return a1;
}

__n128 __swift_memcpy209_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t assignWithTake for FlankedHorizontalLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  if (*(_QWORD *)(a1 + 152))
    __swift_destroy_boxed_opaque_existential_1(a1 + 128);
  v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v7;
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 168);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlankedHorizontalLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 209))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FlankedHorizontalLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 200) = 0;
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
    *(_BYTE *)(result + 208) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 209) = 1;
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
    *(_BYTE *)(result + 209) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FlankedHorizontalLayout()
{
  return &type metadata for FlankedHorizontalLayout;
}

uint64_t storeEnumTagSinglePayload for FlankedHorizontalLayout.ViewAlignment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC70AA14 + 4 * byte_1AC72ECD5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AC70AA48 + 4 * asc_1AC72ECD0[v4]))();
}

uint64_t sub_1AC70AA48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70AA50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC70AA58);
  return result;
}

uint64_t sub_1AC70AA64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC70AA6CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AC70AA70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70AA78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FlankedHorizontalLayout.ViewAlignment()
{
  return &type metadata for FlankedHorizontalLayout.ViewAlignment;
}

__C::CGRect __swiftcall CGRect.adding(outsets:)(UIEdgeInsets outsets)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __C::CGRect result;

  v5 = v2 - outsets.top;
  v6 = outsets.left + outsets.right + v3;
  v7 = outsets.top + outsets.bottom + v4;
  v8 = v1 - outsets.left;
  v9 = v5;
  v10 = v6;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

Swift::Void __swiftcall CGRect.add(outsets:)(UIEdgeInsets outsets)
{
  double *v1;
  double v2;
  CGFloat v3;

  v2 = v1[1] - outsets.top;
  *v1 = *v1 - outsets.left;
  v1[1] = v2;
  v3 = outsets.top + outsets.bottom + v1[3];
  v1[2] = outsets.left + outsets.right + v1[2];
  v1[3] = v3;
}

uint64_t static Locale.withMockLocaleForStorefront(_:_:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4;
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
  uint64_t (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v21[4];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  char *v29;
  uint64_t v30;

  v27 = a3;
  v28 = a2;
  v4 = sub_1AC725B9C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v29 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v21 - v8;
  if (qword_1ED0BD770 != -1)
    swift_once();
  v21[1] = qword_1ED0BD5D0;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD758);
  v11 = *(unsigned __int8 *)(v5 + 80);
  v24 = ((v11 + 32) & ~v11) + *(_QWORD *)(v5 + 72);
  v25 = v10;
  v23 = v11 | 7;
  v12 = swift_allocObject();
  v22 = xmmword_1AC727FC0;
  *(_OWORD *)(v12 + 16) = xmmword_1AC727FC0;
  sub_1AC725B90();
  v30 = v12;
  v13 = sub_1AC688D20(&qword_1ED0BE090, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BE098);
  sub_1AC689088(&qword_1ED0BE0A0, &qword_1ED0BE098);
  v21[3] = v14;
  v26 = v13;
  v15 = sub_1AC72676C();
  MEMORY[0x1E0C80A78](v15);
  v21[-2] = a1;
  sub_1AC726640();
  v16 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  v17 = v16(v9, v4);
  v28(v17);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v22;
  sub_1AC725B90();
  v30 = v18;
  v19 = v29;
  sub_1AC72676C();
  sub_1AC726640();
  return v16(v19, v4);
}

uint64_t sub_1AC70ADE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v17;

  v2 = v1;
  v4 = sub_1AC725968();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1AC725938();
  if (!v9)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
  if (v8 == 29281 && v9 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_1AC726A78();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
  }
  sub_1AC72595C();
  v11 = sub_1AC725938();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!v13)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
  if (v11 == 29281 && v13 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = sub_1AC726A78();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
  }
  return sub_1AC72595C();
}

uint64_t sub_1AC70AF40()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD5F0);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED0BD778 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED0BD5D8);
  v4 = sub_1AC725968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 1, 1, v4);
  swift_beginAccess();
  sub_1AC697520((uint64_t)v2, v3);
  return swift_endAccess();
}

uint64_t sub_1AC70B034(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD5F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AC70B074()
{
  return sub_1AC6975D0();
}

void sub_1AC70B088(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1AC70B0C8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1AC70B120 + 4 * byte_1AC72EE14[a2]))(0x64656D616ELL);
}

uint64_t sub_1AC70B120(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x64656D616ELL && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_1AC726A78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1AC70B1BC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1AC70B218(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1AC70B304 + 4 * byte_1AC72EE20[a2]))(0x72476D6574737973);
}

uint64_t sub_1AC70B304(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x72476D6574737973 && v1 == 0xEB000000006E6565)
    v2 = 1;
  else
    v2 = sub_1AC726A78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1AC70B444(char a1, char a2)
{
  char v2;

  if (*(_QWORD *)&aBlack_1[8 * a1] == *(_QWORD *)&aBlack_1[8 * a2])
    v2 = 1;
  else
    v2 = sub_1AC726A78();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

BOOL sub_1AC70B4A8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_1AC70B4B4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1AC70B4F4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1AC70B568 + 4 * byte_1AC72EE2D[a2]))(0x7265746E6563);
}

uint64_t sub_1AC70B568(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x7265746E6563 && v1 == 0xE600000000000000)
    v2 = 1;
  else
    v2 = sub_1AC726A78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1AC70B610(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6C6961746564;
  else
    v3 = 0x776569767265766FLL;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6C6961746564;
  else
    v5 = 0x776569767265766FLL;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1AC726A78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1AC70B6B0(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000015;
  else
    v3 = 0x616C702F74786574;
  if (v2)
    v4 = 0xEA00000000006E69;
  else
    v4 = 0x80000001AC7301E0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000015;
  else
    v5 = 0x616C702F74786574;
  if ((a2 & 1) != 0)
    v6 = 0x80000001AC7301E0;
  else
    v6 = 0xEA00000000006E69;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1AC726A78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1AC70B75C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 1954047348;
  else
    v3 = 0x646E696B24;
  if (v2)
    v4 = 0xE500000000000000;
  else
    v4 = 0xE400000000000000;
  if ((a2 & 1) != 0)
    v5 = 1954047348;
  else
    v5 = 0x646E696B24;
  if ((a2 & 1) != 0)
    v6 = 0xE400000000000000;
  else
    v6 = 0xE500000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1AC726A78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_1AC70B7F4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1AC70B838()
{
  sub_1AC7262A4();
  return swift_bridgeObjectRelease();
}

void sub_1AC70B914(uint64_t a1, char a2)
{
  sub_1AC726AFC();
  __asm { BR              X10 }
}

uint64_t sub_1AC70B964()
{
  sub_1AC7262A4();
  swift_bridgeObjectRelease();
  return sub_1AC726B2C();
}

void static UIColor.tryToMakeInstance(byDeserializing:using:)()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6B0);
  MEMORY[0x1E0C80A78](v0);
  if ((sub_1AC725C5C() & 1) == 0)
    static UIColor.makeInstance(byDeserializing:using:)();
}

uint64_t UIColor.StaticNamedColor.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1AC726994();
  result = swift_bridgeObjectRelease();
  v4 = 3;
  if (v2 < 3)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t UIColor.StaticNamedColor.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aBlack_1[8 * *v0];
}

uint64_t sub_1AC70BC14(char *a1, char *a2)
{
  return sub_1AC70B444(*a1, *a2);
}

uint64_t sub_1AC70BC20()
{
  sub_1AC726AFC();
  sub_1AC7262A4();
  swift_bridgeObjectRelease();
  return sub_1AC726B2C();
}

uint64_t sub_1AC70BC78()
{
  sub_1AC7262A4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC70BCA4()
{
  sub_1AC726AFC();
  sub_1AC7262A4();
  swift_bridgeObjectRelease();
  return sub_1AC726B2C();
}

uint64_t sub_1AC70BCF8@<X0>(char *a1@<X8>)
{
  return UIColor.StaticNamedColor.init(rawValue:)(a1);
}

void sub_1AC70BD04(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = *(_QWORD *)&aBlack_1[8 * *v1];
  a1[1] = 0xE500000000000000;
}

id sub_1AC70BD20()
{
  char *v0;

  return objc_msgSend((id)objc_opt_self(), *off_1E5C00198[*v0]);
}

uint64_t UIColor.SystemNamedColor.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1AC726994();
  result = swift_bridgeObjectRelease();
  v4 = 8;
  if (v2 < 8)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t UIColor.SystemNamedColor.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1AC70BDEC + 4 * byte_1AC72EE42[*v0]))(0x65526D6574737973, 0xE900000000000064);
}

uint64_t sub_1AC70BDEC()
{
  return 0x72476D6574737973;
}

void sub_1AC70BEB4(char *a1)
{
  sub_1AC70B1BC(*a1);
}

void sub_1AC70BEC0()
{
  char *v0;

  sub_1AC70B914(0, *v0);
}

void sub_1AC70BECC(uint64_t a1)
{
  char *v1;

  sub_1AC70B7F4(a1, *v1);
}

void sub_1AC70BED4(uint64_t a1)
{
  char *v1;

  sub_1AC70B914(a1, *v1);
}

uint64_t sub_1AC70BEDC@<X0>(char *a1@<X8>)
{
  return UIColor.SystemNamedColor.init(rawValue:)(a1);
}

uint64_t sub_1AC70BEE8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1AC70BF1C + 4 * byte_1AC72EE4A[*v0]))();
}

void sub_1AC70BF1C(_QWORD *a1@<X8>)
{
  *a1 = 0x72476D6574737973;
  a1[1] = 0xEB000000006E6565;
}

void sub_1AC70BFFC(char *a1)
{
  sub_1AC70B088(*a1);
}

void sub_1AC70C008()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1AC726AFC();
  __asm { BR              X9 }
}

uint64_t sub_1AC70C04C()
{
  sub_1AC7262A4();
  swift_bridgeObjectRelease();
  return sub_1AC726B2C();
}

void sub_1AC70C0B0()
{
  __asm { BR              X10 }
}

uint64_t sub_1AC70C0E4()
{
  sub_1AC7262A4();
  return swift_bridgeObjectRelease();
}

void sub_1AC70C134()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1AC726AFC();
  __asm { BR              X9 }
}

uint64_t sub_1AC70C174()
{
  sub_1AC7262A4();
  swift_bridgeObjectRelease();
  return sub_1AC726B2C();
}

uint64_t sub_1AC70C1D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC70D238();
  *a1 = result;
  return result;
}

uint64_t sub_1AC70C204()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1AC70C22C + 4 * byte_1AC72EE5E[*v0]))();
}

void sub_1AC70C22C(_QWORD *a1@<X8>)
{
  *a1 = 0x64656D616ELL;
  a1[1] = 0xE500000000000000;
}

void sub_1AC70C244(_QWORD *a1@<X8>)
{
  *a1 = 0x63696D616E7964;
  a1[1] = 0xE700000000000000;
}

void sub_1AC70C260(_QWORD *a1@<X8>)
{
  *a1 = 1819112552;
  a1[1] = 0xE400000000000000;
}

void static UIColor.makeInstance(byDeserializing:using:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v0 = sub_1AC725C74();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v5 - v3;
  sub_1AC725C80();
  sub_1AC70C584();
  sub_1AC725C14();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  __asm { BR              X10 }
}

id sub_1AC70C358()
{
  uint64_t v0;

  return sub_1AC70C5C8(v0);
}

uint64_t sub_1AC70C4FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AC70C544(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AC70C584()
{
  unint64_t result;

  result = qword_1EEC8B6C8;
  if (!qword_1EEC8B6C8)
  {
    result = MEMORY[0x1AF440830](&unk_1AC72F0A8, &_s9ColorKindON);
    atomic_store(result, (unint64_t *)&qword_1EEC8B6C8);
  }
  return result;
}

id sub_1AC70C5C8(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t);
  char *v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  char v27;
  double v28;
  char v29;
  double v30;
  double v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  unsigned int *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  double v47[8];

  v2 = sub_1AC725C74();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v47 - v7;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v47 - v10;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v47 - v13;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)v47 - v16;
  *(_QWORD *)&v47[7] = a1;
  sub_1AC725C80();
  v18 = sub_1AC725C50();
  LOBYTE(a1) = v19;
  v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v17, v2);
  if ((a1 & 1) != 0)
  {
    v36 = sub_1AC726118();
    sub_1AC6AE968();
    swift_allocError();
    v38 = v37;
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6D0);
    *v38 = 6579570;
    v40 = 0xE300000000000000;
LABEL_10:
    v38[1] = v40;
LABEL_11:
    v38[2] = v39;
    v42 = (unsigned int *)MEMORY[0x1E0D414E8];
    goto LABEL_12;
  }
  v21 = v5;
  sub_1AC725C80();
  v22 = sub_1AC725C50();
  v24 = v23;
  v20(v14, v2);
  if ((v24 & 1) != 0)
  {
    v36 = sub_1AC726118();
    sub_1AC6AE968();
    swift_allocError();
    v38 = v41;
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6D0);
    *v38 = 0x6E65657267;
    v40 = 0xE500000000000000;
    goto LABEL_10;
  }
  *(_QWORD *)&v47[0] = v22;
  sub_1AC725C80();
  v25 = sub_1AC725C50();
  v27 = v26;
  v20(v11, v2);
  if ((v27 & 1) != 0)
  {
    v36 = sub_1AC726118();
    sub_1AC6AE968();
    swift_allocError();
    v38 = v43;
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6D0);
    *v38 = 1702194274;
    v38[1] = 0xE400000000000000;
    goto LABEL_11;
  }
  v28 = *(double *)&v25;
  sub_1AC725C80();
  v29 = sub_1AC725C5C();
  v20(v8, v2);
  v30 = 1.0;
  v31 = *(double *)&v18;
  if ((v29 & 1) != 0)
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithRed_green_blue_alpha_, v31, v47[0], v28, v30);
  sub_1AC725C80();
  v32 = sub_1AC725C50();
  v34 = v33;
  v20(v21, v2);
  if ((v34 & 1) == 0)
  {
    v30 = *(double *)&v32;
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithRed_green_blue_alpha_, v31, v47[0], v28, v30);
  }
  v36 = sub_1AC726118();
  sub_1AC6AE968();
  swift_allocError();
  v38 = v44;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B6D0);
  *v38 = 0x6168706C61;
  v38[1] = 0xE500000000000000;
  v46 = MEMORY[0x1E0DEE9D8];
  v38[2] = v45;
  v38[3] = v46;
  v42 = (unsigned int *)MEMORY[0x1E0D414F8];
LABEL_12:
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *v42, v36);
  return (id)swift_willThrow();
}

void sub_1AC70C9BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v5[16];

  v0 = sub_1AC725C74();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v5[-v3];
  sub_1AC725C80();
  sub_1AC70D280();
  sub_1AC725C14();
  (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v4, v0);
  __asm { BR              X10 }
}

id sub_1AC70CA94()
{
  return objc_msgSend((id)objc_opt_self(), sel_blackColor);
}

void sub_1AC70CC38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  void (*v18)(char *, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  UIColor v23;
  char *v24;
  UIColor v25;
  UIColor v26;
  char *v27;
  char *v28;
  UIColor v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = sub_1AC725C74();
  v5 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v26 - v9;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v26 - v12;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v26 - v15;
  sub_1AC6C5970();
  v31 = a1;
  sub_1AC725C80();
  v30 = a2;
  v17 = (objc_class *)static UIColor.makeInstance(byDeserializing:using:)(v16, a2);
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v32);
  }
  else
  {
    v28 = v10;
    v29.super.isa = v17;
    v27 = v7;
    v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19 = v16;
    v20 = v32;
    v18(v19, v32);
    sub_1AC725C80();
    v21 = v30;
    v26.super.isa = (Class)static UIColor.makeInstance(byDeserializing:using:)(v13, v30);
    v18(v13, v20);
    v22 = v28;
    sub_1AC725C80();
    v23.super.isa = (Class)static UIColor.makeInstance(byDeserializing:using:)(v22, v21);
    v18(v22, v20);
    v24 = v27;
    sub_1AC725C80();
    v25.super.isa = (Class)static UIColor.makeInstance(byDeserializing:using:)(v24, v21);
    v18(v24, v32);
    UIColor.init(light:lightHighContrast:dark:darkHighContrast:)(v29, v26, v23, v25);
  }
}

unint64_t sub_1AC70CF00()
{
  unint64_t result;

  result = qword_1EEC8B6D8;
  if (!qword_1EEC8B6D8)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for UIColor.StaticNamedColor, &type metadata for UIColor.StaticNamedColor);
    atomic_store(result, (unint64_t *)&qword_1EEC8B6D8);
  }
  return result;
}

unint64_t sub_1AC70CF48()
{
  unint64_t result;

  result = qword_1EEC8B6E0;
  if (!qword_1EEC8B6E0)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for UIColor.SystemNamedColor, &type metadata for UIColor.SystemNamedColor);
    atomic_store(result, (unint64_t *)&qword_1EEC8B6E0);
  }
  return result;
}

uint64_t _s16StaticNamedColorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC70CFD8 + 4 * byte_1AC72EE6C[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1AC70D00C + 4 * byte_1AC72EE67[v4]))();
}

uint64_t sub_1AC70D00C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70D014(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC70D01CLL);
  return result;
}

uint64_t sub_1AC70D028(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC70D030);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1AC70D034(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70D03C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UIColor.StaticNamedColor()
{
  return &type metadata for UIColor.StaticNamedColor;
}

uint64_t _s16SystemNamedColorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1AC70D0A4 + 4 * byte_1AC72EE76[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1AC70D0D8 + 4 * byte_1AC72EE71[v4]))();
}

uint64_t sub_1AC70D0D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70D0E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC70D0E8);
  return result;
}

uint64_t sub_1AC70D0F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC70D0FCLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1AC70D100(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70D108(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UIColor.SystemNamedColor()
{
  return &type metadata for UIColor.SystemNamedColor;
}

uint64_t _s9ColorKindOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC70D170 + 4 * byte_1AC72EE80[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AC70D1A4 + 4 * byte_1AC72EE7B[v4]))();
}

uint64_t sub_1AC70D1A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70D1AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC70D1B4);
  return result;
}

uint64_t sub_1AC70D1C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC70D1C8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AC70D1CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70D1D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s9ColorKindOMa()
{
  return &_s9ColorKindON;
}

unint64_t sub_1AC70D1F4()
{
  unint64_t result;

  result = qword_1EEC8B6E8;
  if (!qword_1EEC8B6E8)
  {
    result = MEMORY[0x1AF440830](&unk_1AC72F080, &_s9ColorKindON);
    atomic_store(result, (unint64_t *)&qword_1EEC8B6E8);
  }
  return result;
}

uint64_t sub_1AC70D238()
{
  unint64_t v0;

  v0 = sub_1AC726994();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_1AC70D280()
{
  unint64_t result;

  result = qword_1EEC8B6F0;
  if (!qword_1EEC8B6F0)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for UIColor.StaticNamedColor, &type metadata for UIColor.StaticNamedColor);
    atomic_store(result, (unint64_t *)&qword_1EEC8B6F0);
  }
  return result;
}

unint64_t sub_1AC70D2C4()
{
  unint64_t result;

  result = qword_1EEC8B6F8;
  if (!qword_1EEC8B6F8)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for UIColor.SystemNamedColor, &type metadata for UIColor.SystemNamedColor);
    atomic_store(result, (unint64_t *)&qword_1EEC8B6F8);
  }
  return result;
}

uint64_t dispatch thunk of DiffableDataPresenter.onApplySnapshot.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DiffableDataPresenter.reapplySnapshot()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1AC70D318(uint64_t result, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[48];
  char v42;

  v4 = result;
  v5 = v3[5];
  *(_OWORD *)&v41[16] = v3[4];
  *(_OWORD *)&v41[32] = v5;
  v42 = *((_BYTE *)v3 + 96);
  v6 = v3[1];
  v38 = *v3;
  v39 = v6;
  v7 = v3[3];
  v40 = v3[2];
  *(_OWORD *)v41 = v7;
  if (!a2)
  {
    v8 = 0;
    *(_BYTE *)(result + 96) = *((_BYTE *)v3 + 96);
    v16 = v3[5];
    *(_OWORD *)(result + 64) = v3[4];
    *(_OWORD *)(result + 80) = v16;
    v17 = v3[1];
    *(_OWORD *)result = *v3;
    *(_OWORD *)(result + 16) = v17;
    v18 = v3[3];
    *(_OWORD *)(result + 32) = v3[2];
    *(_OWORD *)(result + 48) = v18;
    return v8;
  }
  v8 = a3;
  if (!a3)
    goto LABEL_10;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v9 = a2;
    DisjointStack.Placements.next()((uint64_t)&v26);
    if (!*((_QWORD *)&v27 + 1))
    {
      v10 = 0;
LABEL_12:
      sub_1AC6916CC((uint64_t)&v26, &qword_1EEC8AF98);
      v23 = *(_QWORD *)v41;
      v24 = *(_QWORD *)&v41[40];
      v21 = v42;
      v25 = v39;
      *(_OWORD *)v4 = v38;
      *(_OWORD *)(v4 + 16) = v25;
      *(_OWORD *)(v4 + 32) = v40;
      *(_QWORD *)(v4 + 48) = v23;
      *(_OWORD *)(v4 + 56) = *(_OWORD *)&v41[8];
      *(_OWORD *)(v4 + 72) = *(_OWORD *)&v41[24];
      *(_QWORD *)(v4 + 88) = v24;
      v8 = v10;
      goto LABEL_13;
    }
    v10 = 0;
    while (1)
    {
      v11 = v29;
      v12 = v30;
      v35 = v29;
      v36 = v30;
      v13 = v31;
      v37 = v31;
      v14 = v26;
      v15 = v27;
      v32 = v26;
      v33 = v27;
      v34 = v28;
      *(_OWORD *)(v9 + 32) = v28;
      *(_OWORD *)(v9 + 48) = v11;
      *(_OWORD *)(v9 + 64) = v12;
      *(_QWORD *)(v9 + 80) = v13;
      *(_OWORD *)v9 = v14;
      *(_OWORD *)(v9 + 16) = v15;
      if (v8 - 1 == v10)
        break;
      v9 += 88;
      DisjointStack.Placements.next()((uint64_t)&v26);
      ++v10;
      if (!*((_QWORD *)&v27 + 1))
        goto LABEL_12;
    }
LABEL_10:
    v19 = *(_QWORD *)v41;
    v20 = *(_QWORD *)&v41[40];
    v21 = v42;
    v22 = v39;
    *(_OWORD *)v4 = v38;
    *(_OWORD *)(v4 + 16) = v22;
    *(_OWORD *)(v4 + 32) = v40;
    *(_QWORD *)(v4 + 48) = v19;
    *(_OWORD *)(v4 + 56) = *(_OWORD *)&v41[8];
    *(_OWORD *)(v4 + 72) = *(_OWORD *)&v41[24];
    *(_QWORD *)(v4 + 88) = v20;
LABEL_13:
    *(_BYTE *)(v4 + 96) = v21;
    return v8;
  }
  __break(1u);
  return result;
}

__int128 *sub_1AC70D4C0(__int128 *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AC70D4D8(a1, a2, a3, (_QWORD *(*)(__int128 *__return_ptr))VerticalStack.Placements.next());
}

__int128 *sub_1AC70D4CC(__int128 *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AC70D4D8(a1, a2, a3, (_QWORD *(*)(__int128 *__return_ptr))HorizontalStack.Placements.next());
}

__int128 *sub_1AC70D4D8(__int128 *result, uint64_t a2, uint64_t a3, _QWORD *(*a4)(__int128 *__return_ptr))
{
  __int128 *v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v5 = result;
  v6 = v4[1];
  v36 = *v4;
  v37 = v6;
  v7 = v4[3];
  v38 = v4[2];
  v39 = v7;
  if (!a2)
  {
    v8 = 0;
    v18 = v4[1];
    *result = *v4;
    result[1] = v18;
    v19 = v4[3];
    result[2] = v4[2];
    result[3] = v19;
    return (__int128 *)v8;
  }
  v8 = a3;
  if (!a3)
  {
LABEL_10:
    v20 = v39;
    v21 = v37;
    *v5 = v36;
    v5[1] = v21;
    v5[2] = v38;
    v5[3] = v20;
    return (__int128 *)v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v10 = a2;
    v11 = a4(&v24);
    if (!*((_QWORD *)&v25 + 1))
    {
      v12 = 0;
LABEL_12:
      sub_1AC6916CC((uint64_t)&v24, &qword_1EEC8AF98);
      v22 = v39;
      v23 = v37;
      *v5 = v36;
      v5[1] = v23;
      v5[2] = v38;
      v5[3] = v22;
      return (__int128 *)v12;
    }
    v12 = 0;
    while (1)
    {
      v13 = v27;
      v14 = v28;
      v33 = v27;
      v34 = v28;
      v15 = v29;
      v35 = v29;
      v16 = v24;
      v17 = v25;
      v30 = v24;
      v31 = v25;
      v32 = v26;
      *(_OWORD *)(v10 + 32) = v26;
      *(_OWORD *)(v10 + 48) = v13;
      *(_OWORD *)(v10 + 64) = v14;
      *(_QWORD *)(v10 + 80) = v15;
      *(_OWORD *)v10 = v16;
      *(_OWORD *)(v10 + 16) = v17;
      if (v8 - 1 == v12)
        goto LABEL_10;
      v10 += 88;
      v11 = ((_QWORD *(*)(__int128 *__return_ptr, _QWORD *))a4)(&v24, v11);
      ++v12;
      if (!*((_QWORD *)&v25 + 1))
        goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC70D640(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v4 = (uint64_t)v3;
  v8 = v3[3];
  v9 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v8);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
  result = sub_1AC6CCF24(v4);
  v12 = 0;
  if (!a2 || !a3)
  {
LABEL_12:
    *a1 = v10;
    return v12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_1AC726958();
    if (*((_QWORD *)&v19 + 1))
    {
      v12 = 0;
      while (1)
      {
        v13 = v21;
        v14 = v22;
        v27 = v21;
        v28 = v22;
        v15 = v23;
        v29 = v23;
        v16 = v18;
        v17 = v19;
        v24 = v18;
        v25 = v19;
        v26 = v20;
        *(_OWORD *)(a2 + 32) = v20;
        *(_OWORD *)(a2 + 48) = v13;
        *(_OWORD *)(a2 + 64) = v14;
        *(_QWORD *)(a2 + 80) = v15;
        *(_OWORD *)a2 = v16;
        *(_OWORD *)(a2 + 16) = v17;
        if (a3 - 1 == v12)
          break;
        a2 += 88;
        sub_1AC726958();
        ++v12;
        if (!*((_QWORD *)&v19 + 1))
          goto LABEL_10;
      }
      v12 = a3;
    }
    else
    {
      v12 = 0;
LABEL_10:
      sub_1AC6916CC((uint64_t)&v18, &qword_1EEC8AF98);
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC70D768(uint64_t result, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[8];
  char v34;

  v4 = result;
  v5 = v3[7];
  v33[6] = v3[6];
  v33[7] = v5;
  v34 = *((_BYTE *)v3 + 128);
  v6 = v3[3];
  v33[2] = v3[2];
  v33[3] = v6;
  v7 = v3[5];
  v33[4] = v3[4];
  v33[5] = v7;
  v8 = v3[1];
  v33[0] = *v3;
  v33[1] = v8;
  if (!a2)
  {
    v9 = 0;
LABEL_13:
    v17 = v3[7];
    *(_OWORD *)(v4 + 96) = v3[6];
    *(_OWORD *)(v4 + 112) = v17;
    *(_BYTE *)(v4 + 128) = *((_BYTE *)v3 + 128);
    v18 = v3[3];
    *(_OWORD *)(v4 + 32) = v3[2];
    *(_OWORD *)(v4 + 48) = v18;
    v19 = v3[5];
    *(_OWORD *)(v4 + 64) = v3[4];
    *(_OWORD *)(v4 + 80) = v19;
    v20 = v3[1];
    *(_OWORD *)v4 = *v3;
    *(_OWORD *)(v4 + 16) = v20;
    return v9;
  }
  v9 = a3;
  if (!a3)
  {
LABEL_10:
    v3 = v33;
    goto LABEL_13;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v10 = a2;
    Pin.Placements.next()((uint64_t)&v21);
    if (!*((_QWORD *)&v22 + 1))
    {
      v11 = 0;
LABEL_12:
      sub_1AC6916CC((uint64_t)&v21, &qword_1EEC8AF98);
      v3 = v33;
      v9 = v11;
      goto LABEL_13;
    }
    v11 = 0;
    while (1)
    {
      v12 = v24;
      v13 = v25;
      v30 = v24;
      v31 = v25;
      v14 = v26;
      v32 = v26;
      v15 = v21;
      v16 = v22;
      v27 = v21;
      v28 = v22;
      v29 = v23;
      *(_OWORD *)(v10 + 32) = v23;
      *(_OWORD *)(v10 + 48) = v12;
      *(_OWORD *)(v10 + 64) = v13;
      *(_QWORD *)(v10 + 80) = v14;
      *(_OWORD *)v10 = v15;
      *(_OWORD *)(v10 + 16) = v16;
      if (v9 - 1 == v11)
        goto LABEL_10;
      v10 += 88;
      Pin.Placements.next()((uint64_t)&v21);
      ++v11;
      if (!*((_QWORD *)&v22 + 1))
        goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

void *sub_1AC70D8BC(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  void *result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE __dst[272];

  result = memcpy(__dst, v3, sizeof(__dst));
  if (!a2)
  {
    a3 = 0;
LABEL_13:
    memcpy(a1, v3, 0x110uLL);
    return (void *)a3;
  }
  if (!a3)
  {
LABEL_10:
    v3 = __dst;
    goto LABEL_13;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    Resize.Placements.next()((uint64_t)&v14);
    if (!*((_QWORD *)&v15 + 1))
    {
      v8 = 0;
LABEL_12:
      sub_1AC6916CC((uint64_t)&v14, &qword_1EEC8AF98);
      v3 = __dst;
      a3 = v8;
      goto LABEL_13;
    }
    v8 = 0;
    while (1)
    {
      v9 = v17;
      v10 = v18;
      v23 = v17;
      v24 = v18;
      v11 = v19;
      v25 = v19;
      v12 = v14;
      v13 = v15;
      v20 = v14;
      v21 = v15;
      v22 = v16;
      *(_OWORD *)(a2 + 32) = v16;
      *(_OWORD *)(a2 + 48) = v9;
      *(_OWORD *)(a2 + 64) = v10;
      *(_QWORD *)(a2 + 80) = v11;
      *(_OWORD *)a2 = v12;
      *(_OWORD *)(a2 + 16) = v13;
      if (a3 - 1 == v8)
        goto LABEL_10;
      a2 += 88;
      Resize.Placements.next()((uint64_t)&v14);
      ++v8;
      if (!*((_QWORD *)&v15 + 1))
        goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

BOOL static Pin.Edge.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Pin.Edge.hash(into:)()
{
  return sub_1AC726B08();
}

uint64_t Pin.Edge.hashValue.getter()
{
  sub_1AC726AFC();
  sub_1AC726B08();
  return sub_1AC726B2C();
}

uint64_t sub_1AC70DA64@<X0>(uint64_t result@<X0>, _WORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6[2];
  uint64_t v7;
  _BYTE v8[40];
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)(v2 + 40) & 1) == 0)
  {
    sub_1AC68E218(result, (uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD538);
    if (swift_dynamicCast())
    {
      sub_1AC68AAA4(v6, (uint64_t)v9);
      v4 = v10;
      v5 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v5 + 8))(*(_QWORD *)(v2 + 32), v4, v5);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    v7 = 0;
    memset(v6, 0, sizeof(v6));
    result = sub_1AC6916CC((uint64_t)v6, &qword_1ED0BD540);
  }
  *a2 = 0;
  return result;
}

uint64_t Pin.Placements.union.getter@<X0>(CGFloat *a1@<X8>)
{
  uint64_t v1;
  CGFloat x;
  CGFloat width;
  CGFloat y;
  CGFloat i;
  double v7;
  double v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  _BYTE v22[136];
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  if ((*(_BYTE *)(v1 + 41) & 1) != 0)
  {
    sub_1AC6CCBF8(v1, (uint64_t)v22);
    Pin.Placements.next()((uint64_t)&v16);
    if (*((_QWORD *)&v17 + 1))
    {
      v12 = v18;
      v13 = v19;
      v14 = v20;
      v15 = v21;
      v10 = v16;
      v11 = v17;
      x = *((double *)&v18 + 1);
      width = *((double *)&v19 + 1);
      y = *(double *)&v19;
      v7 = *((double *)&v20 + 1);
      for (i = *(double *)&v20; ; i = v24.size.height)
      {
        v8 = v15;
        sub_1AC6929AC((uint64_t)&v10);
        Pin.Placements.next()((uint64_t)&v16);
        if (!*((_QWORD *)&v17 + 1))
          break;
        v12 = v18;
        v13 = v19;
        v14 = v20;
        v15 = v21;
        v10 = v16;
        v11 = v17;
        v27.origin.x = *((CGFloat *)&v18 + 1);
        *(_OWORD *)&v27.origin.y = v19;
        *(_QWORD *)&v27.size.height = v20;
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = i;
        v24 = CGRectUnion(v23, v27);
        x = v24.origin.x;
        y = v24.origin.y;
        width = v24.size.width;
      }
      goto LABEL_15;
    }
LABEL_14:
    v7 = 0.0;
    v8 = 0.0;
    width = 0.0;
    i = 0.0;
    x = 0.0;
    y = 0.0;
    goto LABEL_15;
  }
  sub_1AC6CCBF8(v1, (uint64_t)v22);
  Pin.Placements.next()((uint64_t)&v16);
  if (!*((_QWORD *)&v17 + 1))
    goto LABEL_14;
  v12 = v18;
  v13 = v19;
  v14 = v20;
  v15 = v21;
  v10 = v16;
  v11 = v17;
  x = *((double *)&v18 + 1);
  width = *((double *)&v19 + 1);
  y = *(double *)&v19;
  v7 = *((double *)&v20 + 1);
  i = *(double *)&v20;
  v8 = v21;
  while (1)
  {
    sub_1AC6929AC((uint64_t)&v10);
    Pin.Placements.next()((uint64_t)&v16);
    if (!*((_QWORD *)&v17 + 1))
      break;
    v12 = v18;
    v13 = v19;
    v14 = v20;
    v15 = v21;
    v10 = v16;
    v11 = v17;
    v28.origin.x = *((CGFloat *)&v18 + 1);
    *(_OWORD *)&v28.origin.y = v19;
    *(_QWORD *)&v28.size.height = v20;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = i;
    v26 = CGRectUnion(v25, v28);
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    i = v26.size.height;
    if (v7 >= *((double *)&v14 + 1))
      v7 = *((double *)&v14 + 1);
    if (v8 >= v15)
      v8 = v15;
  }
LABEL_15:
  result = sub_1AC6CCC34((uint64_t)v22);
  *a1 = x;
  a1[1] = y;
  a1[2] = width;
  a1[3] = i;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

uint64_t Pin.Placements.next()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _OWORD *v3;
  uint64_t result;
  CGPoint v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double MinX;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  double MaxX;
  CGFloat v58;
  CGFloat v59;
  double v60;
  double v61;
  double MinY;
  double v63;
  __int128 v64;
  __int128 v65;
  _QWORD *v66;
  __int128 v67;
  __int128 v68;
  double v69;
  double v70;
  _BYTE v71[40];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  double v77;
  _QWORD v78[3];
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[3];
  uint64_t v82;
  uint64_t v83;
  __int128 v84[2];
  CGPoint v85;
  double v86;
  double v87;
  char v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v3 = (_OWORD *)(v1 + 48);
  result = sub_1AC70E24C(v1 + 48, (uint64_t)v84);
  if (!v88)
  {
    sub_1AC68AAA4(v84, (uint64_t)v81);
    sub_1AC68AAA4((__int128 *)&v85, (uint64_t)v78);
    v27 = v79;
    v28 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    v30 = *(double *)(v1 + 16);
    v29 = *(double *)(v1 + 24);
    v31 = (*(double (**)(_QWORD, uint64_t, uint64_t, double, double))(v28 + 8))(*(_QWORD *)(v1 + 32), v27, v28, v30, v29);
    v33 = v32;
    v70 = v34;
    v36 = v35;
    if ((*(_BYTE *)(v1 + 41) & 1) != 0)
    {
      sub_1AC70DA64((uint64_t)v78, &v72);
      v38 = *(double *)v1;
      v37 = *(double *)(v1 + 8);
      v39 = *(double *)v1;
      v40 = v37;
      v41 = v30;
      v42 = v29;
      if (v72 >= 2u)
      {
        if (v72 == 2)
          MinX = CGRectGetMidX(*(CGRect *)&v39) + v31 * -0.5;
        else
          MinX = CGRectGetMaxX(*(CGRect *)&v39) - v31;
      }
      else
      {
        MinX = CGRectGetMinX(*(CGRect *)&v39);
      }
      v94.origin.x = v38;
      v94.origin.y = v37;
      v94.size.width = v30;
      v94.size.height = v29;
      MinY = CGRectGetMaxY(v94) - v33;
    }
    else
    {
      v56 = *(double *)v1;
      v55 = *(double *)(v1 + 8);
      v92.origin.x = *(CGFloat *)v1;
      v92.origin.y = v55;
      v92.size.width = v30;
      v92.size.height = v29;
      MaxX = CGRectGetMaxX(v92);
      sub_1AC70DA64((uint64_t)v78, &v72);
      v58 = v56;
      v59 = v55;
      v60 = v30;
      v61 = v29;
      if (v72 >= 2u)
      {
        if (v72 == 2)
          MinY = CGRectGetMidY(*(CGRect *)&v58) + v33 * -0.5;
        else
          MinY = CGRectGetMaxY(*(CGRect *)&v58) - v33;
      }
      else
      {
        MinY = CGRectGetMinY(*(CGRect *)&v58);
      }
      MinX = MaxX - v31;
    }
    sub_1AC70E280((uint64_t)v3);
    sub_1AC68E218((uint64_t)v81, (uint64_t)v3);
    *(double *)(v1 + 88) = MinX;
    *(double *)(v1 + 96) = MinY;
    *(double *)(v1 + 104) = v31;
    *(double *)(v1 + 112) = v33;
    *(_BYTE *)(v1 + 128) = 1;
    sub_1AC68E218((uint64_t)v78, (uint64_t)v71);
    sub_1AC68E218((uint64_t)v71, (uint64_t)&v72);
    *((_QWORD *)&v74 + 1) = floor(MinX);
    *(_QWORD *)&v75 = floor(MinY);
    *((_QWORD *)&v75 + 1) = ceil(v31);
    *(_QWORD *)&v76 = ceil(v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
    *((_QWORD *)&v76 + 1) = floor(v36);
    v77 = floor(v70);
    v67 = v75;
    *(_OWORD *)(a1 + 32) = v74;
    *(_OWORD *)(a1 + 48) = v67;
    v68 = v73;
    *(_OWORD *)a1 = v72;
    *(_OWORD *)(a1 + 16) = v68;
    *(_OWORD *)(a1 + 64) = v76;
    *(double *)(a1 + 80) = v77;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
    v66 = v78;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
  }
  if (v88 != 1)
  {
    *(_QWORD *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return result;
  }
  v5 = v85;
  v7 = v86;
  v6 = v87;
  sub_1AC68AAA4(v84, (uint64_t)v81);
  v9 = *(double *)(v1 + 16);
  v8 = *(double *)(v1 + 24);
  if ((*(_BYTE *)(v1 + 41) & 1) != 0)
  {
    v10 = *(double *)(v1 + 24);
    if (v8 != 0.0)
    {
      v89.origin = v5;
      v89.size.width = v7;
      v89.size.height = v6;
      v11 = v8 - CGRectGetHeight(v89);
      if (v11 < 0.0)
        v10 = 0.0;
      else
        v10 = v11;
    }
    v12 = v82;
    v13 = v83;
    __swift_project_boxed_opaque_existential_1(v81, v82);
    v14 = (*(double (**)(_QWORD, uint64_t, uint64_t, double, double))(v13 + 8))(*(_QWORD *)(v1 + 32), v12, v13, v9, v10);
    v16 = v15;
    v69 = v17;
    v19 = v18;
    sub_1AC70DA64((uint64_t)v81, &v72);
    v21 = *(double *)v1;
    v20 = *(double *)(v1 + 8);
    v22 = *(double *)v1;
    v23 = v20;
    v24 = v9;
    v25 = v8;
    if (v72 >= 2u)
    {
      if (v72 == 2)
        v26 = CGRectGetMidX(*(CGRect *)&v22) + v14 * -0.5;
      else
        v26 = CGRectGetMaxX(*(CGRect *)&v22) - v14;
    }
    else
    {
      v26 = CGRectGetMinX(*(CGRect *)&v22);
    }
  }
  else
  {
    v44 = *(double *)(v1 + 16);
    if (v9 != 0.0)
    {
      v90.origin = v5;
      v90.size.width = v7;
      v90.size.height = v6;
      v45 = v9 - CGRectGetWidth(v90);
      if (v45 < 0.0)
        v44 = 0.0;
      else
        v44 = v45;
    }
    v46 = v82;
    v47 = v83;
    __swift_project_boxed_opaque_existential_1(v81, v82);
    v14 = (*(double (**)(_QWORD, uint64_t, uint64_t, double, double))(v47 + 8))(*(_QWORD *)(v1 + 32), v46, v47, v44, v8);
    v16 = v48;
    v69 = v49;
    v19 = v50;
    v21 = *(double *)v1;
    v20 = *(double *)(v1 + 8);
    v91.origin.x = *(CGFloat *)v1;
    v91.origin.y = v20;
    v91.size.width = v9;
    v91.size.height = v8;
    v26 = CGRectGetMinX(v91);
    sub_1AC70DA64((uint64_t)v81, &v72);
    if (v72 >= 2u)
    {
      v51 = v21;
      v52 = v20;
      v53 = v9;
      v54 = v8;
      if (v72 == 2)
        v63 = CGRectGetMidY(*(CGRect *)&v51) + v16 * -0.5;
      else
        v63 = CGRectGetMaxY(*(CGRect *)&v51) - v16;
      goto LABEL_34;
    }
  }
  v93.origin.x = v21;
  v93.origin.y = v20;
  v93.size.width = v9;
  v93.size.height = v8;
  v63 = CGRectGetMinY(v93);
LABEL_34:
  sub_1AC70E280((uint64_t)v3);
  *v3 = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_BYTE *)(v1 + 128) = 2;
  sub_1AC68E218((uint64_t)v81, (uint64_t)v78);
  sub_1AC68E218((uint64_t)v78, (uint64_t)&v72);
  *((_QWORD *)&v74 + 1) = floor(v26);
  *(_QWORD *)&v75 = floor(v63);
  *((_QWORD *)&v75 + 1) = ceil(v14);
  *(_QWORD *)&v76 = ceil(v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
  *((_QWORD *)&v76 + 1) = floor(v69);
  v77 = floor(v19);
  v64 = v75;
  *(_OWORD *)(a1 + 32) = v74;
  *(_OWORD *)(a1 + 48) = v64;
  v65 = v73;
  *(_OWORD *)a1 = v72;
  *(_OWORD *)(a1 + 16) = v65;
  *(_OWORD *)(a1 + 64) = v76;
  *(double *)(a1 + 80) = v77;
  v66 = v81;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
}

uint64_t sub_1AC70E24C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for Pin.Placements.LayoutState(a2, a1);
  return a2;
}

uint64_t sub_1AC70E280(uint64_t a1)
{
  destroy for Pin.Placements.LayoutState(a1);
  return a1;
}

__n128 sub_1AC70E2B4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v2;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(v1 + 128);
  v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  v4 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  result = *(__n128 *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1AC70E2E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1AC7102D0(v0);
  sub_1AC6CCC34(v0);
  return v1;
}

unint64_t sub_1AC70E314()
{
  return 0xD000000000000080;
}

unint64_t sub_1AC70E330()
{
  return 0xD00000000000007ELL;
}

uint64_t Pin.init(_:to:of:)@<X0>(__int128 *a1@<X0>, char *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  char v7;
  uint64_t v8;
  _QWORD v10[13];
  _BYTE v11[40];

  v7 = *a2;
  sub_1AC68E218((uint64_t)a1, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  v8 = swift_dynamicCast();
  if ((_DWORD)v8)
  {
    *(_OWORD *)v10 = *(_OWORD *)&v10[7];
    *(_OWORD *)&v10[2] = *(_OWORD *)&v10[9];
    *(_OWORD *)&v10[4] = *(_OWORD *)&v10[11];
    MEMORY[0x1E0C80A78](v8);
    sub_1AC7260D0();
    sub_1AC70E488((uint64_t)v10);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  sub_1AC68AAA4(a1, a4);
  *(_BYTE *)(a4 + 40) = v7;
  return sub_1AC68AAA4(a3, a4 + 48);
}

uint64_t sub_1AC70E488(uint64_t a1)
{
  destroy for Constrain();
  return a1;
}

BOOL sub_1AC70E4BC()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40) == 0;
}

JUMeasurements __swiftcall Pin.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  uint64_t v2;
  CGFloat height;
  double width;
  char v6;
  objc_class *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16[6];
  _QWORD v17[5];
  char v18;
  char v19;
  uint64_t v20;
  _BYTE v21[48];
  CGRect v22;
  CGRect v23;
  JUMeasurements result;

  height = toFit.height;
  width = toFit.width;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = width;
  v22.size.height = height;
  if (CGRectGetWidth(v22) == 1.79769313e308)
    width = 0.0;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = width;
  v23.size.height = height;
  if (CGRectGetHeight(v23) == 1.79769313e308)
    height = 0.0;
  v6 = *(_BYTE *)(v2 + 40);
  sub_1AC68E218(v2 + 48, (uint64_t)&v20);
  sub_1AC68E218(v2, (uint64_t)v21);
  v17[0] = 0;
  v17[1] = 0;
  *(double *)&v17[2] = width;
  *(CGFloat *)&v17[3] = height;
  v17[4] = with.super.isa;
  v18 = 1;
  v19 = v6;
  v21[40] = 0;
  v7 = with.super.isa;
  Pin.Placements.union.getter(v16);
  v8 = ceil(v16[2]);
  v9 = ceil(v16[3]);
  v10 = floor(v16[4]);
  v11 = floor(v16[5]);
  sub_1AC6CCC34((uint64_t)v17);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.var3 = v15;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

id Pin.layout(relativeTo:with:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v6;
  char v12;

  v12 = *(_BYTE *)(v6 + 40);
  sub_1AC68E218(v6 + 48, a2 + 48);
  sub_1AC68E218(v6, a2 + 88);
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(_QWORD *)(a2 + 32) = a1;
  *(_BYTE *)(a2 + 40) = 0;
  *(_BYTE *)(a2 + 41) = v12;
  *(_BYTE *)(a2 + 128) = 0;
  return a1;
}

JetUI::_LayoutAlignment __swiftcall Pin._layoutAlignment(with:)(UITraitCollection with)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  JetUI::_LayoutAlignment v13;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16[2];
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  v4 = v1;
  sub_1AC68E218(v2, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD538);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v17 = 0;
    memset(v16, 0, sizeof(v16));
    v13 = (JetUI::_LayoutAlignment)sub_1AC6916CC((uint64_t)v16, &qword_1ED0BD540);
LABEL_12:
    v12 = 0;
    v11 = 0;
    goto LABEL_13;
  }
  sub_1AC68AAA4(v16, (uint64_t)v21);
  sub_1AC68E218(v2 + 48, (uint64_t)v16);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_1AC6916CC((uint64_t)v14, &qword_1ED0BD540);
    v13 = (JetUI::_LayoutAlignment)__swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    goto LABEL_12;
  }
  sub_1AC68AAA4(v14, (uint64_t)v18);
  v5 = v22;
  v6 = v23;
  __swift_project_boxed_opaque_existential_1(v21, v22);
  (*(void (**)(__int128 *__return_ptr, Class, uint64_t, uint64_t))(v6 + 8))(v16, with.super.isa, v5, v6);
  v7 = LOBYTE(v16[0]);
  v8 = BYTE1(v16[0]);
  v9 = v19;
  v10 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  (*(void (**)(__int128 *__return_ptr, Class, uint64_t, uint64_t))(v10 + 8))(v16, with.super.isa, v9, v10);
  if (v7 == LOBYTE(v16[0]))
    v11 = v7;
  else
    v11 = 0;
  if (v8 == BYTE1(v16[0]))
    v12 = v8;
  else
    v12 = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  v13 = (JetUI::_LayoutAlignment)__swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
LABEL_13:
  *v4 = v11;
  v4[1] = v12;
  return v13;
}

unint64_t sub_1AC70E81C()
{
  unint64_t result;

  result = qword_1EEC8B700;
  if (!qword_1EEC8B700)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for Pin.Edge, &type metadata for Pin.Edge);
    atomic_store(result, (unint64_t *)&qword_1EEC8B700);
  }
  return result;
}

unint64_t sub_1AC70E860(uint64_t a1)
{
  unint64_t result;

  result = sub_1AC70E884();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1AC70E884()
{
  unint64_t result;

  result = qword_1EEC8B708;
  if (!qword_1EEC8B708)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for Pin.Placements, &type metadata for Pin.Placements);
    atomic_store(result, (unint64_t *)&qword_1EEC8B708);
  }
  return result;
}

unint64_t sub_1AC70E8CC()
{
  unint64_t result;

  result = qword_1EEC8B710;
  if (!qword_1EEC8B710)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for Pin.Placements, &type metadata for Pin.Placements);
    atomic_store(result, (unint64_t *)&qword_1EEC8B710);
  }
  return result;
}

unint64_t sub_1AC70E914()
{
  unint64_t result;

  result = qword_1EEC8B718;
  if (!qword_1EEC8B718)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for Pin.Placements, &type metadata for Pin.Placements);
    atomic_store(result, (unint64_t *)&qword_1EEC8B718);
  }
  return result;
}

id sub_1AC70E958@<X0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v6;
  char v12;

  v12 = *(_BYTE *)(v6 + 40);
  sub_1AC68E218(v6 + 48, a2 + 48);
  sub_1AC68E218(v6, a2 + 88);
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(_QWORD *)(a2 + 32) = a1;
  *(_BYTE *)(a2 + 40) = 0;
  *(_BYTE *)(a2 + 41) = v12;
  *(_BYTE *)(a2 + 128) = 0;
  return a1;
}

uint64_t destroy for Pin(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 48);
}

uint64_t initializeWithCopy for Pin(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 48, a2 + 48);
  return a1;
}

uint64_t assignWithCopy for Pin(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 48), (uint64_t *)(a2 + 48));
  return a1;
}

uint64_t assignWithTake for Pin(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for Pin(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Pin(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Pin()
{
  return &type metadata for Pin;
}

uint64_t storeEnumTagSinglePayload for Pin.Edge(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC70EBFC + 4 * byte_1AC72F139[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AC70EC30 + 4 * asc_1AC72F134[v4]))();
}

uint64_t sub_1AC70EC30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70EC38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC70EC40);
  return result;
}

uint64_t sub_1AC70EC4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC70EC54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AC70EC58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC70EC60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t destroy for Pin.Placements(uint64_t a1)
{
  uint64_t result;

  result = a1 + 48;
  if (*(_BYTE *)(a1 + 128) != 1)
  {
    if (*(_BYTE *)(a1 + 128))
      return result;
    __swift_destroy_boxed_opaque_existential_1(result);
    result = a1 + 88;
  }
  return __swift_destroy_boxed_opaque_existential_1(result);
}

uint64_t initializeWithCopy for Pin.Placements(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v6 = a1 + 48;
  v7 = a2 + 48;
  v8 = *(unsigned __int8 *)(a2 + 128);
  v9 = v5;
  if (v8 == 1)
  {
    v12 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 72) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(v6, v7);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_BYTE *)(a1 + 128) = 1;
  }
  else if (v8)
  {
    v13 = *(_OWORD *)(v7 + 48);
    *(_OWORD *)(v6 + 32) = *(_OWORD *)(v7 + 32);
    *(_OWORD *)(v6 + 48) = v13;
    *(_OWORD *)(v6 + 64) = *(_OWORD *)(v7 + 64);
    *(_BYTE *)(v6 + 80) = *(_BYTE *)(v7 + 80);
    v14 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)v6 = *(_OWORD *)v7;
    *(_OWORD *)(v6 + 16) = v14;
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 72) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(v6, v7);
    v11 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 112) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 88, a2 + 88);
    *(_BYTE *)(a1 + 128) = 0;
  }
  return a1;
}

uint64_t assignWithCopy for Pin.Placements(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(void **)(a2 + 32);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  if (a1 != a2)
  {
    sub_1AC70E280(a1 + 48);
    if (*(_BYTE *)(a2 + 128) == 1)
    {
      v9 = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 72) = v9;
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 48, a2 + 48);
      v10 = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 104) = v10;
      *(_BYTE *)(a1 + 128) = 1;
    }
    else if (*(_BYTE *)(a2 + 128))
    {
      v11 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 64) = v11;
      v12 = *(_OWORD *)(a2 + 80);
      v13 = *(_OWORD *)(a2 + 96);
      v14 = *(_OWORD *)(a2 + 112);
      *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
      *(_OWORD *)(a1 + 96) = v13;
      *(_OWORD *)(a1 + 112) = v14;
      *(_OWORD *)(a1 + 80) = v12;
    }
    else
    {
      v7 = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 72) = v7;
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 48, a2 + 48);
      v8 = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 112) = v8;
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 88, a2 + 88);
      *(_BYTE *)(a1 + 128) = 0;
    }
  }
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
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
  v7 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for Pin.Placements(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  if (a1 != a2)
  {
    sub_1AC70E280(a1 + 48);
    v6 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v6;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
    v7 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Pin.Placements(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 129))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Pin.Placements(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 128) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 129) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 129) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Pin.Placements()
{
  return &type metadata for Pin.Placements;
}

uint64_t destroy for Pin.Placements.LayoutState(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;

  v1 = result;
  v2 = *(unsigned __int8 *)(result + 80);
  if (v2 >= 2)
    v2 = *(_DWORD *)result + 2;
  if (v2 != 1)
  {
    if (v2)
      return result;
    __swift_destroy_boxed_opaque_existential_1(result);
    v1 += 40;
  }
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t initializeWithCopy for Pin.Placements.LayoutState(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(unsigned __int8 *)(a2 + 80);
  if (v4 >= 2)
    v4 = *(_DWORD *)a2 + 2;
  if (v4 == 1)
  {
    v7 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_BYTE *)(a1 + 80) = 1;
  }
  else if (v4)
  {
    v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    v6 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 64) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 40, a2 + 40);
    *(_BYTE *)(a1 + 80) = 0;
  }
  return a1;
}

uint64_t assignWithCopy for Pin.Placements.LayoutState(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v2 = a1;
  if (a1 == a2)
    return v2;
  v4 = *(unsigned __int8 *)(a1 + 80);
  if (v4 >= 2)
    v4 = *(_DWORD *)a1 + 2;
  if (v4 == 1)
    goto LABEL_7;
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    a1 = v2 + 40;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  v5 = *(unsigned __int8 *)(a2 + 80);
  if (v5 >= 2)
    v5 = *(_DWORD *)a2 + 2;
  if (v5 == 1)
  {
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(v2 + 24) = v8;
    *(_QWORD *)(v2 + 32) = *(_QWORD *)(a2 + 32);
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v2, a2);
    v9 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(v2 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(v2 + 56) = v9;
    *(_BYTE *)(v2 + 80) = 1;
  }
  else if (v5)
  {
    v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)v2 = *(_OWORD *)a2;
    *(_OWORD *)(v2 + 16) = v10;
    v11 = *(_OWORD *)(a2 + 32);
    v12 = *(_OWORD *)(a2 + 48);
    v13 = *(_OWORD *)(a2 + 64);
    *(_BYTE *)(v2 + 80) = *(_BYTE *)(a2 + 80);
    *(_OWORD *)(v2 + 48) = v12;
    *(_OWORD *)(v2 + 64) = v13;
    *(_OWORD *)(v2 + 32) = v11;
  }
  else
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(v2 + 24) = v6;
    *(_QWORD *)(v2 + 32) = *(_QWORD *)(a2 + 32);
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(v2, a2);
    v7 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(v2 + 64) = v7;
    *(_QWORD *)(v2 + 72) = *(_QWORD *)(a2 + 72);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(v2 + 40, a2 + 40);
    *(_BYTE *)(v2 + 80) = 0;
  }
  return v2;
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

uint64_t assignWithTake for Pin.Placements.LayoutState(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = a1;
  if (a1 == a2)
    return v2;
  v4 = *(unsigned __int8 *)(a1 + 80);
  if (v4 >= 2)
    v4 = *(_DWORD *)a1 + 2;
  if (v4 == 1)
    goto LABEL_7;
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    a1 = v2 + 40;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  v5 = *(unsigned __int8 *)(a2 + 80);
  if (v5 >= 2)
    v5 = *(_DWORD *)a2 + 2;
  if (v5 == 1)
  {
    v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v2 + 48) = v8;
    *(_QWORD *)(v2 + 64) = *(_QWORD *)(a2 + 64);
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)v2 = *(_OWORD *)a2;
    *(_OWORD *)(v2 + 16) = v9;
    *(_BYTE *)(v2 + 80) = 1;
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v2 + 48) = v6;
    *(_OWORD *)(v2 + 64) = *(_OWORD *)(a2 + 64);
    if (v5)
    {
      *(_BYTE *)(v2 + 80) = *(_BYTE *)(a2 + 80);
      v10 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)v2 = *(_OWORD *)a2;
      *(_OWORD *)(v2 + 16) = v10;
    }
    else
    {
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)v2 = *(_OWORD *)a2;
      *(_OWORD *)(v2 + 16) = v7;
      *(_BYTE *)(v2 + 80) = 0;
    }
  }
  return v2;
}

uint64_t getEnumTagSinglePayload for Pin.Placements.LayoutState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Pin.Placements.LayoutState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_1AC70F488(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_1AC70F4A4(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Pin.Placements.LayoutState()
{
  return &type metadata for Pin.Placements.LayoutState;
}

_QWORD *sub_1AC70F4E0(__int128 *a1)
{
  return sub_1AC70FEE4(a1, sub_1AC710AD0, (_QWORD *(*)(__int128 *__return_ptr, uint64_t))HorizontalStack.Placements.next());
}

uint64_t sub_1AC70F4F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  int v4;
  double v5;
  int v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  unsigned __int8 v12;
  int v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  int v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinX;
  double MinY;
  double v33;
  double v34;
  uint64_t result;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  const void *v43;
  uint64_t v44;
  BOOL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  double v64;
  _BYTE v65[40];
  _QWORD v66[3];
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  double v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  double v80;
  CGRect v81;
  uint64_t v82;
  double v83;
  unsigned __int8 v84;
  double v85;
  unsigned __int8 v86;
  double v87;
  unsigned __int8 v88;
  double v89;
  unsigned __int8 v90;
  _BYTE v91[32];
  uint64_t v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  sub_1AC6A48BC(a1, (uint64_t)&v81);
  sub_1AC695DFC((uint64_t)v91, (uint64_t)&v59);
  v53 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v1 = 0;
  if (*((_QWORD *)&v60 + 1))
  {
    v2 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      v58 = v1;
      sub_1AC68AAA4(&v59, (uint64_t)v66);
      sub_1AC6916CC((uint64_t)v91, &qword_1ED0BD568);
      memset(v91, 0, sizeof(v91));
      v92 = 0;
      v3 = v83;
      v4 = v84;
      v5 = v85;
      v6 = v86;
      x = v81.origin.x;
      y = v81.origin.y;
      width = v81.size.width;
      height = v81.size.height;
      v11 = CGRectGetWidth(v81);
      v12 = v4 ^ 1;
      v13 = (v4 ^ 1) & (v11 < v3);
      v57 = v3;
      if (v13)
        v14 = v3;
      else
        v14 = v11;
      v54 = v5;
      if (v11 > v5)
        v11 = v5;
      if ((v6 & 1) != 0)
        v11 = v14;
      if ((v13 & 1) != 0)
        v15 = v14;
      else
        v15 = v11;
      v16 = v87;
      v17 = v88;
      v18 = v89;
      v19 = v90;
      v93.origin.x = x;
      v93.origin.y = y;
      v93.size.width = width;
      v93.size.height = height;
      v20 = CGRectGetHeight(v93);
      v21 = (v17 ^ 1) & (v20 < v16);
      if (v21)
        v22 = v16;
      else
        v22 = v20;
      if (v20 > v18)
        v20 = v18;
      if (v19)
        v20 = v22;
      if ((v21 & 1) != 0)
        v23 = v22;
      else
        v23 = v20;
      v24 = v67;
      v25 = v68;
      __swift_project_boxed_opaque_existential_1(v66, v67);
      v26 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v25 + 8))(v82, v24, v25, v15, v23);
      v28 = v27;
      v55 = v30;
      v56 = v29;
      v94.origin.x = x;
      v94.origin.y = y;
      v94.size.width = width;
      v94.size.height = height;
      MinX = CGRectGetMinX(v94);
      v95.origin.x = x;
      v95.origin.y = y;
      v95.size.width = width;
      v95.size.height = height;
      MinY = CGRectGetMinY(v95);
      if ((v12 & (v26 < v57)) != 0)
        v33 = v57;
      else
        v33 = v26;
      if ((v12 & (v26 < v57) | v6) != 1)
      {
        v33 = v54;
        if (v26 <= v54)
          v33 = v26;
      }
      if (((v17 ^ 1) & (v28 < v16)) != 0)
        v34 = v16;
      else
        v34 = v28;
      v1 = v58;
      if (((v17 ^ 1) & (v28 < v16) | v19) != 1)
      {
        v34 = v18;
        if (v28 <= v18)
          v34 = v28;
      }
      sub_1AC68E218((uint64_t)v66, (uint64_t)v65);
      sub_1AC68E218((uint64_t)v65, (uint64_t)&v59);
      *((_QWORD *)&v61 + 1) = floor(MinX);
      *(_QWORD *)&v62 = floor(MinY);
      *((_QWORD *)&v62 + 1) = ceil(v33);
      *(_QWORD *)&v63 = ceil(v34);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      *((_QWORD *)&v63 + 1) = floor(v56);
      v64 = floor(v55);
      v71 = v61;
      v72 = v62;
      v69 = v59;
      v70 = v60;
      v73 = v63;
      v74 = v64;
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
      if (!*((_QWORD *)&v70 + 1))
        break;
      v77 = v71;
      v78 = v72;
      v79 = v73;
      v80 = v74;
      v75 = v69;
      v76 = v70;
      if (v58)
      {
        v1 = v58 - 1;
        if (__OFSUB__(v58, 1))
          goto LABEL_56;
      }
      else
      {
        v36 = v53[3];
        if ((uint64_t)((v36 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_57;
        v37 = v36 & 0xFFFFFFFFFFFFFFFELL;
        if (v37 <= 1)
          v38 = 1;
        else
          v38 = v37;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v39 = (_QWORD *)swift_allocObject();
        v40 = (uint64_t)(_swift_stdlib_malloc_size(v39) - 32) / 88;
        v39[2] = v38;
        v39[3] = 2 * v40;
        v41 = (unint64_t)(v39 + 4);
        v42 = v53[3] >> 1;
        if (v53[2])
        {
          v43 = v53 + 4;
          if (v39 != v53 || v41 >= (unint64_t)v43 + 88 * v42)
            memmove(v39 + 4, v43, 88 * v42);
          v53[2] = 0;
        }
        v2 = v41 + 88 * v42;
        v44 = (v40 & 0x7FFFFFFFFFFFFFFFLL) - v42;
        result = swift_release();
        v53 = v39;
        v45 = __OFSUB__(v44, 1);
        v1 = v44 - 1;
        if (v45)
        {
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          goto LABEL_58;
        }
      }
      v46 = v76;
      *(_OWORD *)v2 = v75;
      *(_OWORD *)(v2 + 16) = v46;
      v47 = v77;
      v48 = v78;
      v49 = v79;
      *(double *)(v2 + 80) = v80;
      *(_OWORD *)(v2 + 48) = v48;
      *(_OWORD *)(v2 + 64) = v49;
      *(_OWORD *)(v2 + 32) = v47;
      v2 += 88;
      sub_1AC695DFC((uint64_t)v91, (uint64_t)&v59);
      if (!*((_QWORD *)&v60 + 1))
        goto LABEL_51;
    }
  }
  else
  {
LABEL_51:
    sub_1AC6916CC((uint64_t)&v59, &qword_1ED0BD568);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0.0;
  }
  sub_1AC6A4BA8((uint64_t)&v81);
  sub_1AC6916CC((uint64_t)&v69, &qword_1EEC8AF98);
  result = (uint64_t)v53;
  v50 = v53[3];
  if (v50 >= 2)
  {
    v51 = v50 >> 1;
    v45 = __OFSUB__(v51, v1);
    v52 = v51 - v1;
    if (v45)
LABEL_58:
      __break(1u);
    else
      v53[2] = v52;
  }
  return result;
}

uint64_t sub_1AC70F970(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  uint64_t result;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  const void *v25;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double v41;
  _BYTE v42[40];
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  double v61;
  uint64_t v62;
  _BYTE v63[32];
  uint64_t v64;
  CGRect v65;
  CGRect v66;

  sub_1AC69628C(a1, (uint64_t)&v58);
  sub_1AC695DFC((uint64_t)v63, (uint64_t)&v36);
  v1 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v2 = 0;
  if (*((_QWORD *)&v37 + 1))
  {
    v3 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      sub_1AC68AAA4(&v36, (uint64_t)v43);
      sub_1AC6916CC((uint64_t)v63, &qword_1ED0BD568);
      memset(v63, 0, sizeof(v63));
      v64 = 0;
      v4 = v44;
      v5 = v45;
      __swift_project_boxed_opaque_existential_1(v43, v44);
      v6 = v60;
      v7 = v61;
      v8 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v5 + 8))(v62, v4, v5, v60, v61);
      v10 = v9;
      v34 = v12;
      v35 = v11;
      v13 = v58;
      v14 = v59;
      v65.origin.x = v58;
      v65.origin.y = v59;
      v65.size.width = v6;
      v65.size.height = v7;
      v15 = CGRectGetMidX(v65) - v8 * 0.5;
      v66.origin.x = v13;
      v66.origin.y = v14;
      v66.size.width = v6;
      v66.size.height = v7;
      v16 = CGRectGetMidY(v66) - v10 * 0.5;
      sub_1AC68E218((uint64_t)v43, (uint64_t)v42);
      sub_1AC68E218((uint64_t)v42, (uint64_t)&v36);
      *((_QWORD *)&v38 + 1) = floor(v15);
      *(_QWORD *)&v39 = floor(v16);
      *((_QWORD *)&v39 + 1) = ceil(v8);
      *(_QWORD *)&v40 = ceil(v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      *((_QWORD *)&v40 + 1) = floor(v35);
      v41 = floor(v34);
      v48 = v38;
      v49 = v39;
      v46 = v36;
      v47 = v37;
      v50 = v40;
      v51 = v41;
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      if (!*((_QWORD *)&v47 + 1))
        break;
      v54 = v48;
      v55 = v49;
      v56 = v50;
      v57 = v51;
      v52 = v46;
      v53 = v47;
      if (!v2)
      {
        v18 = v1[3];
        if ((uint64_t)((v18 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_23;
        v19 = v18 & 0xFFFFFFFFFFFFFFFELL;
        if (v19 <= 1)
          v20 = 1;
        else
          v20 = v19;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v21 = (_QWORD *)swift_allocObject();
        v22 = (uint64_t)(_swift_stdlib_malloc_size(v21) - 32) / 88;
        v21[2] = v20;
        v21[3] = 2 * v22;
        v23 = (unint64_t)(v21 + 4);
        v24 = v1[3] >> 1;
        if (v1[2])
        {
          v25 = v1 + 4;
          if (v21 != v1 || v23 >= (unint64_t)v25 + 88 * v24)
            memmove(v21 + 4, v25, 88 * v24);
          v1[2] = 0;
        }
        v3 = v23 + 88 * v24;
        v2 = (v22 & 0x7FFFFFFFFFFFFFFFLL) - v24;
        result = swift_release();
        v1 = v21;
      }
      v26 = __OFSUB__(v2--, 1);
      if (v26)
      {
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      v27 = v53;
      *(_OWORD *)v3 = v52;
      *(_OWORD *)(v3 + 16) = v27;
      v28 = v54;
      v29 = v55;
      v30 = v56;
      *(double *)(v3 + 80) = v57;
      *(_OWORD *)(v3 + 48) = v29;
      *(_OWORD *)(v3 + 64) = v30;
      *(_OWORD *)(v3 + 32) = v28;
      v3 += 88;
      sub_1AC695DFC((uint64_t)v63, (uint64_t)&v36);
      if (!*((_QWORD *)&v37 + 1))
        goto LABEL_17;
    }
  }
  else
  {
LABEL_17:
    sub_1AC6916CC((uint64_t)&v36, &qword_1ED0BD568);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0.0;
  }
  sub_1AC694D3C((uint64_t)&v58);
  result = sub_1AC6916CC((uint64_t)&v46, &qword_1EEC8AF98);
  v31 = v1[3];
  if (v31 < 2)
    return (uint64_t)v1;
  v32 = v31 >> 1;
  v26 = __OFSUB__(v32, v2);
  v33 = v32 - v2;
  if (!v26)
  {
    v1[2] = v33;
    return (uint64_t)v1;
  }
LABEL_24:
  __break(1u);
  return result;
}

void sub_1AC70FCC8(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;

  v1 = *(_OWORD *)(a1 + 80);
  v40 = *(_OWORD *)(a1 + 64);
  v41 = v1;
  v42 = *(_BYTE *)(a1 + 96);
  v2 = *(_OWORD *)(a1 + 16);
  v36 = *(_OWORD *)a1;
  v37 = v2;
  v3 = *(_OWORD *)(a1 + 48);
  v38 = *(_OWORD *)(a1 + 32);
  v39 = v3;
  sub_1AC710A8C(a1);
  DisjointStack.Placements.next()((uint64_t)&v24);
  v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v5 = 0;
  if (*((_QWORD *)&v25 + 1))
  {
    v6 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      v33 = v27;
      v34 = v28;
      v35 = v29;
      v30 = v24;
      v31 = v25;
      v32 = v26;
      if (!v5)
      {
        v7 = v4[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_24;
        v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1)
          v9 = 1;
        else
          v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v10 = (_QWORD *)swift_allocObject();
        v11 = (uint64_t)(_swift_stdlib_malloc_size(v10) - 32) / 88;
        v10[2] = v9;
        v10[3] = 2 * v11;
        v12 = (unint64_t)(v10 + 4);
        v13 = v4[3] >> 1;
        if (v4[2])
        {
          if (v10 != v4 || v12 >= (unint64_t)&v4[11 * v13 + 4])
            memmove(v10 + 4, v4 + 4, 88 * v13);
          v4[2] = 0;
        }
        v6 = v12 + 88 * v13;
        v5 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - v13;
        swift_release();
        v4 = v10;
      }
      v15 = __OFSUB__(v5--, 1);
      if (v15)
        break;
      v16 = v31;
      *(_OWORD *)v6 = v30;
      *(_OWORD *)(v6 + 16) = v16;
      v17 = v32;
      v18 = v33;
      v19 = v34;
      *(_QWORD *)(v6 + 80) = v35;
      *(_OWORD *)(v6 + 48) = v18;
      *(_OWORD *)(v6 + 64) = v19;
      *(_OWORD *)(v6 + 32) = v17;
      v6 += 88;
      DisjointStack.Placements.next()((uint64_t)&v24);
      if (!*((_QWORD *)&v25 + 1))
        goto LABEL_19;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  v20 = (void *)v38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1AC6916CC((uint64_t)&v24, &qword_1EEC8AF98);
  v21 = v4[3];
  if (v21 >= 2)
  {
    v22 = v21 >> 1;
    v15 = __OFSUB__(v22, v5);
    v23 = v22 - v5;
    if (v15)
    {
LABEL_25:
      __break(1u);
      return;
    }
    v4[2] = v23;
  }
}

_QWORD *sub_1AC70FED0(__int128 *a1)
{
  return sub_1AC70FEE4(a1, (uint64_t (*)(void))sub_1AC710688, (_QWORD *(*)(__int128 *__return_ptr, uint64_t))VerticalStack.Placements.next());
}

_QWORD *sub_1AC70FEE4(__int128 *a1, uint64_t (*a2)(void), _QWORD *(*a3)(__int128 *__return_ptr, uint64_t))
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _QWORD *result;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v4 = a1[1];
  v40 = *a1;
  v41 = v4;
  v5 = a1[3];
  v42 = a1[2];
  v43 = v5;
  v6 = a2();
  result = a3(&v28, v6);
  v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v9 = 0;
  if (*((_QWORD *)&v29 + 1))
  {
    v10 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      v37 = v31;
      v38 = v32;
      v39 = v33;
      v34 = v28;
      v35 = v29;
      v36 = v30;
      if (!v9)
      {
        v11 = v8[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_24;
        v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v12 <= 1)
          v13 = 1;
        else
          v13 = v12;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v14 = (_QWORD *)swift_allocObject();
        v15 = (uint64_t)(_swift_stdlib_malloc_size(v14) - 32) / 88;
        v14[2] = v13;
        v14[3] = 2 * v15;
        v16 = (unint64_t)(v14 + 4);
        v17 = v8[3] >> 1;
        if (v8[2])
        {
          if (v14 != v8 || v16 >= (unint64_t)&v8[11 * v17 + 4])
            memmove(v14 + 4, v8 + 4, 88 * v17);
          v8[2] = 0;
        }
        v10 = v16 + 88 * v17;
        v9 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - v17;
        result = (_QWORD *)swift_release();
        v8 = v14;
      }
      v19 = __OFSUB__(v9--, 1);
      if (v19)
        break;
      v20 = v35;
      *(_OWORD *)v10 = v34;
      *(_OWORD *)(v10 + 16) = v20;
      v21 = v36;
      v22 = v37;
      v23 = v38;
      *(_QWORD *)(v10 + 80) = v39;
      *(_OWORD *)(v10 + 48) = v22;
      *(_OWORD *)(v10 + 64) = v23;
      *(_OWORD *)(v10 + 32) = v21;
      v10 += 88;
      result = a3(&v28, (uint64_t)result);
      if (!*((_QWORD *)&v29 + 1))
        goto LABEL_19;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  v24 = (void *)v42;
  swift_bridgeObjectRelease();

  result = (_QWORD *)sub_1AC6916CC((uint64_t)&v28, &qword_1EEC8AF98);
  v25 = v8[3];
  if (v25 < 2)
    return v8;
  v26 = v25 >> 1;
  v19 = __OFSUB__(v26, v9);
  v27 = v26 - v9;
  if (!v19)
  {
    v8[2] = v27;
    return v8;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1AC7100D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  sub_1AC6CCEE8(a1, (uint64_t)&v29);
  v1 = *((_QWORD *)&v30 + 1);
  v2 = v31;
  __swift_project_boxed_opaque_existential_1(&v29, *((uint64_t *)&v30 + 1));
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
  sub_1AC6CCF24((uint64_t)&v29);
  result = sub_1AC726958();
  v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v5 = 0;
  if (*((_QWORD *)&v24 + 1))
  {
    v6 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      v32 = v26;
      v33 = v27;
      v34 = v28;
      v29 = v23;
      v30 = v24;
      v31 = v25;
      if (!v5)
      {
        v7 = v4[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_24;
        v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1)
          v9 = 1;
        else
          v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v10 = (_QWORD *)swift_allocObject();
        v11 = (uint64_t)(_swift_stdlib_malloc_size(v10) - 32) / 88;
        v10[2] = v9;
        v10[3] = 2 * v11;
        v12 = (unint64_t)(v10 + 4);
        v13 = v4[3] >> 1;
        if (v4[2])
        {
          if (v10 != v4 || v12 >= (unint64_t)&v4[11 * v13 + 4])
            memmove(v10 + 4, v4 + 4, 88 * v13);
          v4[2] = 0;
        }
        v6 = v12 + 88 * v13;
        v5 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - v13;
        result = swift_release();
        v4 = v10;
      }
      v15 = __OFSUB__(v5--, 1);
      if (v15)
        break;
      v16 = v30;
      *(_OWORD *)v6 = v29;
      *(_OWORD *)(v6 + 16) = v16;
      v17 = v31;
      v18 = v32;
      v19 = v33;
      *(_QWORD *)(v6 + 80) = v34;
      *(_OWORD *)(v6 + 48) = v18;
      *(_OWORD *)(v6 + 64) = v19;
      *(_OWORD *)(v6 + 32) = v17;
      v6 += 88;
      result = sub_1AC726958();
      if (!*((_QWORD *)&v24 + 1))
        goto LABEL_19;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  swift_release();
  result = sub_1AC6916CC((uint64_t)&v23, &qword_1EEC8AF98);
  v20 = v4[3];
  if (v20 < 2)
    return (uint64_t)v4;
  v21 = v20 >> 1;
  v15 = __OFSUB__(v21, v5);
  v22 = v21 - v5;
  if (!v15)
  {
    v4[2] = v22;
    return (uint64_t)v4;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1AC7102D0(uint64_t a1)
{
  uint64_t result;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[152];

  sub_1AC6CCBF8(a1, (uint64_t)v33);
  result = Pin.Placements.next()((uint64_t)&v21);
  v2 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v3 = 0;
  if (*((_QWORD *)&v22 + 1))
  {
    v4 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      v30 = v24;
      v31 = v25;
      v32 = v26;
      v27 = v21;
      v28 = v22;
      v29 = v23;
      if (!v3)
      {
        v5 = v2[3];
        if ((uint64_t)((v5 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_24;
        v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
        if (v6 <= 1)
          v7 = 1;
        else
          v7 = v6;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v8 = (_QWORD *)swift_allocObject();
        v9 = (uint64_t)(_swift_stdlib_malloc_size(v8) - 32) / 88;
        v8[2] = v7;
        v8[3] = 2 * v9;
        v10 = (unint64_t)(v8 + 4);
        v11 = v2[3] >> 1;
        if (v2[2])
        {
          if (v8 != v2 || v10 >= (unint64_t)&v2[11 * v11 + 4])
            memmove(v8 + 4, v2 + 4, 88 * v11);
          v2[2] = 0;
        }
        v4 = v10 + 88 * v11;
        v3 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - v11;
        result = swift_release();
        v2 = v8;
      }
      v13 = __OFSUB__(v3--, 1);
      if (v13)
        break;
      v14 = v28;
      *(_OWORD *)v4 = v27;
      *(_OWORD *)(v4 + 16) = v14;
      v15 = v29;
      v16 = v30;
      v17 = v31;
      *(_QWORD *)(v4 + 80) = v32;
      *(_OWORD *)(v4 + 48) = v16;
      *(_OWORD *)(v4 + 64) = v17;
      *(_OWORD *)(v4 + 32) = v15;
      v4 += 88;
      result = Pin.Placements.next()((uint64_t)&v21);
      if (!*((_QWORD *)&v22 + 1))
        goto LABEL_19;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  sub_1AC6CCC34((uint64_t)v33);
  result = sub_1AC6916CC((uint64_t)&v21, &qword_1EEC8AF98);
  v18 = v2[3];
  if (v18 < 2)
    return (uint64_t)v2;
  v19 = v18 >> 1;
  v13 = __OFSUB__(v19, v3);
  v20 = v19 - v3;
  if (!v13)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1AC7104AC(uint64_t a1)
{
  uint64_t result;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[288];

  sub_1AC695324(a1, (uint64_t)v33);
  result = Resize.Placements.next()((uint64_t)&v21);
  v2 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v3 = 0;
  if (*((_QWORD *)&v22 + 1))
  {
    v4 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      v30 = v24;
      v31 = v25;
      v32 = v26;
      v27 = v21;
      v28 = v22;
      v29 = v23;
      if (!v3)
      {
        v5 = v2[3];
        if ((uint64_t)((v5 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_24;
        v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
        if (v6 <= 1)
          v7 = 1;
        else
          v7 = v6;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v8 = (_QWORD *)swift_allocObject();
        v9 = (uint64_t)(_swift_stdlib_malloc_size(v8) - 32) / 88;
        v8[2] = v7;
        v8[3] = 2 * v9;
        v10 = (unint64_t)(v8 + 4);
        v11 = v2[3] >> 1;
        if (v2[2])
        {
          if (v8 != v2 || v10 >= (unint64_t)&v2[11 * v11 + 4])
            memmove(v8 + 4, v2 + 4, 88 * v11);
          v2[2] = 0;
        }
        v4 = v10 + 88 * v11;
        v3 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - v11;
        result = swift_release();
        v2 = v8;
      }
      v13 = __OFSUB__(v3--, 1);
      if (v13)
        break;
      v14 = v28;
      *(_OWORD *)v4 = v27;
      *(_OWORD *)(v4 + 16) = v14;
      v15 = v29;
      v16 = v30;
      v17 = v31;
      *(_QWORD *)(v4 + 80) = v32;
      *(_OWORD *)(v4 + 48) = v16;
      *(_OWORD *)(v4 + 64) = v17;
      *(_OWORD *)(v4 + 32) = v15;
      v4 += 88;
      result = Resize.Placements.next()((uint64_t)&v21);
      if (!*((_QWORD *)&v22 + 1))
        goto LABEL_19;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  sub_1AC695048((uint64_t)v33);
  result = sub_1AC6916CC((uint64_t)&v21, &qword_1EEC8AF98);
  v18 = v2[3];
  if (v18 < 2)
    return (uint64_t)v2;
  v19 = v18 >> 1;
  v13 = __OFSUB__(v19, v3);
  v20 = v19 - v3;
  if (!v13)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1AC710688(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1AC7106B8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t result;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  const void *v36;
  BOOL v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  double v54;
  _BYTE v55[40];
  _QWORD v56[3];
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  double v70;
  CGRect v71;
  void *v72;
  _BYTE v73[32];
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  sub_1AC693A88(a1, (uint64_t)&v71);
  sub_1AC695DFC((uint64_t)v73, (uint64_t)&v49);
  v1 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v2 = 0;
  if (*((_QWORD *)&v50 + 1))
  {
    v3 = MEMORY[0x1E0DEE9D8] + 32;
    while (1)
    {
      sub_1AC68AAA4(&v49, (uint64_t)v56);
      sub_1AC6916CC((uint64_t)v73, &qword_1ED0BD568);
      memset(v73, 0, sizeof(v73));
      v74 = 0;
      v4 = v72;
      v5 = sub_1AC69388C(v72);
      v47 = v6;
      v48 = v7;
      v8 = v7;
      x = v71.origin.x;
      y = v71.origin.y;
      width = v71.size.width;
      height = v71.size.height;
      v14 = CGRectGetWidth(v71) - (v6 + v13);
      v75.origin.x = x;
      v75.origin.y = y;
      v75.size.width = width;
      v75.size.height = height;
      v15 = CGRectGetHeight(v75) - (v5 + v8);
      v16 = v14 < 0.0 ? 0.0 : v14;
      v17 = v15 < 0.0 ? 0.0 : v15;
      v18 = v57;
      v19 = v58;
      __swift_project_boxed_opaque_existential_1(v56, v57);
      v20 = (*(double (**)(void *, uint64_t, uint64_t, double, double))(v19 + 8))(v4, v18, v19, v16, v17);
      v45 = v21;
      v46 = v20;
      v23 = v22;
      v25 = v24;
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = height;
      v26 = v47 + CGRectGetMinX(v76);
      v77.origin.x = x;
      v77.origin.y = y;
      v77.size.width = width;
      v77.size.height = height;
      v27 = v5 + CGRectGetMinY(v77);
      sub_1AC68E218((uint64_t)v56, (uint64_t)v55);
      sub_1AC68E218((uint64_t)v55, (uint64_t)&v49);
      *((_QWORD *)&v51 + 1) = floor(v26);
      *(_QWORD *)&v52 = floor(v27);
      *((_QWORD *)&v52 + 1) = ceil(v46);
      *(_QWORD *)&v53 = ceil(v45);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
      *((_QWORD *)&v53 + 1) = floor(v5 + v23);
      v54 = floor(v48 + v25);
      v61 = v51;
      v62 = v52;
      v59 = v49;
      v60 = v50;
      v63 = v53;
      v64 = v54;
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
      if (!*((_QWORD *)&v60 + 1))
        break;
      v67 = v61;
      v68 = v62;
      v69 = v63;
      v70 = v64;
      v65 = v59;
      v66 = v60;
      if (!v2)
      {
        v29 = v1[3];
        if ((uint64_t)((v29 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_29;
        v30 = v29 & 0xFFFFFFFFFFFFFFFELL;
        if (v30 <= 1)
          v31 = 1;
        else
          v31 = v30;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8B720);
        v32 = (_QWORD *)swift_allocObject();
        v33 = (uint64_t)(_swift_stdlib_malloc_size(v32) - 32) / 88;
        v32[2] = v31;
        v32[3] = 2 * v33;
        v34 = (unint64_t)(v32 + 4);
        v35 = v1[3] >> 1;
        if (v1[2])
        {
          v36 = v1 + 4;
          if (v32 != v1 || v34 >= (unint64_t)v36 + 88 * v35)
            memmove(v32 + 4, v36, 88 * v35);
          v1[2] = 0;
        }
        v3 = v34 + 88 * v35;
        v2 = (v33 & 0x7FFFFFFFFFFFFFFFLL) - v35;
        result = swift_release();
        v1 = v32;
      }
      v37 = __OFSUB__(v2--, 1);
      if (v37)
      {
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      v38 = v66;
      *(_OWORD *)v3 = v65;
      *(_OWORD *)(v3 + 16) = v38;
      v39 = v67;
      v40 = v68;
      v41 = v69;
      *(double *)(v3 + 80) = v70;
      *(_OWORD *)(v3 + 48) = v40;
      *(_OWORD *)(v3 + 64) = v41;
      *(_OWORD *)(v3 + 32) = v39;
      v3 += 88;
      sub_1AC695DFC((uint64_t)v73, (uint64_t)&v49);
      if (!*((_QWORD *)&v50 + 1))
        goto LABEL_23;
    }
  }
  else
  {
LABEL_23:
    sub_1AC6916CC((uint64_t)&v49, &qword_1ED0BD568);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0.0;
  }
  sub_1AC693804((uint64_t)&v71);
  result = sub_1AC6916CC((uint64_t)&v59, &qword_1EEC8AF98);
  v42 = v1[3];
  if (v42 < 2)
    return (uint64_t)v1;
  v43 = v42 >> 1;
  v37 = __OFSUB__(v43, v2);
  v44 = v43 - v2;
  if (!v37)
  {
    v1[2] = v44;
    return (uint64_t)v1;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1AC710A8C(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t DisjointStack.insert(_:at:with:)(_QWORD *a1, int64_t a2, char a3, void (*a4)(_BYTE *))
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];

  v6 = a3 & 1;
  v7 = a1[3];
  v8 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  Measurable.placeable.getter(v7, v8, v10);
  DisjointStack.insert(_:at:with:)((uint64_t)v10, a2, v6, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t DisjointStack.inserting(_:at:with:)@<X0>(_QWORD *a1@<X0>, int64_t a2@<X1>, char a3@<W2>, void (*a4)(_BYTE *)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];

  v6 = v5;
  v10 = a3 & 1;
  v11 = a1[3];
  v12 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  Measurable.placeable.getter(v11, v12, v14);
  sub_1AC6CCC6C(v6, a5);
  DisjointStack.insert(_:at:with:)((uint64_t)v14, a2, v10, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

id sub_1AC710C18(uint64_t a1, uint64_t a2)
{
  return sub_1AC710D2C(a1, a2, (SEL *)&selRef_frame);
}

id sub_1AC710C24()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)v0;
  objc_msgSend(*(id *)(v0 + 16), sel_convertRect_toCoordinateSpace_, *(_QWORD *)(v0 + 8));
  return objc_msgSend(v1, sel_setFrame_);
}

void (*sub_1AC710C5C(_QWORD *a1))(double **a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = *(void **)v1;
  v5 = *(_QWORD *)(v1 + 8);
  v3[4] = *(_QWORD *)v1;
  v3[5] = v5;
  v6 = *(void **)(v1 + 16);
  v3[6] = v6;
  objc_msgSend(v4, sel_frame);
  objc_msgSend(v6, sel_convertRect_fromCoordinateSpace_, v5);
  *v3 = v7;
  v3[1] = v8;
  v3[2] = v9;
  v3[3] = v10;
  return sub_1AC710CD4;
}

void sub_1AC710CD4(double **a1)
{
  double *v1;
  void *v2;

  v1 = *a1;
  v2 = (void *)*((_QWORD *)*a1 + 4);
  objc_msgSend(*((id *)*a1 + 6), sel_convertRect_toCoordinateSpace_, *((_QWORD *)*a1 + 5), *v1, v1[1], v1[2], v1[3]);
  objc_msgSend(v2, sel_setFrame_);
  free(v1);
}

id sub_1AC710D20(uint64_t a1, uint64_t a2)
{
  return sub_1AC710D2C(a1, a2, (SEL *)&selRef_jet_focusedFrame);
}

id sub_1AC710D2C(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = *(void **)v3;
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(void **)(v3 + 16);
  objc_msgSend(v4, *a3);
  return objc_msgSend(v6, sel_convertRect_fromCoordinateSpace_, v5);
}

double UIView.withCoordinateSpace(_:)@<D0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  id v5;
  id v6;
  double result;

  v5 = v2;
  swift_unknownObjectRetain();
  v6 = objc_msgSend(v5, sel_superview);
  if (v6)
  {
    *a2 = v5;
    a2[1] = v6;
    a2[3] = &type metadata for UIViewCoordinateSpaceAdapter;
    a2[4] = &off_1E5BF9650;
    a2[2] = a1;
  }
  else
  {

    swift_unknownObjectRelease();
    a2[4] = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
  }
  return result;
}

uint64_t destroy for UIViewCoordinateSpaceAdapter(id *a1)
{

  return swift_unknownObjectRelease();
}

_QWORD *_s5JetUI28UIViewCoordinateSpaceAdapterVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  v6 = v4;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UIViewCoordinateSpaceAdapter(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for UIViewCoordinateSpaceAdapter(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for UIViewCoordinateSpaceAdapter()
{
  return &type metadata for UIViewCoordinateSpaceAdapter;
}

id sub_1AC710F64()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString;
  v2 = *(void **)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString);
  }
  else
  {
    v4 = sub_1AC71101C(*(void **)(v0 + OBJC_IVAR___JULanguageAwareString_baseAttributedString), *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_paragraphs));
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1AC71101C(void *a1, unint64_t a2)
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
    v18 = sub_1AC726928();
    swift_bridgeObjectRelease();
    if (v18 != 1)
      goto LABEL_15;
    swift_bridgeObjectRetain();
    if (!sub_1AC726928())
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
    for (i = *(id *)(v3 + 32); ; i = (id)MEMORY[0x1AF43FE40](0, v3))
    {
      v6 = i;
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_juDirectionalRangeValue);

      swift_bridgeObjectRetain();
      v7 = sub_1AC726304();
      swift_bridgeObjectRelease();
      if (!v32 && v33 == v7)
      {
        v8 = (void *)sub_1AC714234(v34);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1AC727FC0;
        v10 = (void *)*MEMORY[0x1E0DC1178];
        *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1178];
        *(_QWORD *)(inited + 64) = sub_1AC69C244(0, (unint64_t *)&unk_1EEC8BA90);
        *(_QWORD *)(inited + 40) = v8;
        v11 = v8;
        swift_bridgeObjectRetain();
        v12 = v11;
        v13 = v10;
        sub_1AC6A9404(inited);
        v14 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
        v15 = (void *)sub_1AC726208();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_1AC690AA0();
        v16 = (void *)sub_1AC726178();
        swift_bridgeObjectRelease();
        v17 = objc_msgSend(v14, sel_initWithString_attributes_, v15, v16);

        return v17;
      }
LABEL_15:
      v19 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
      swift_bridgeObjectRetain();
      v20 = (void *)sub_1AC726208();
      swift_bridgeObjectRelease();
      v31 = objc_msgSend(v19, sel_initWithString_, v20);

      if (v4)
      {
        swift_bridgeObjectRetain();
        v21 = sub_1AC726928();
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
        v28 = v22 ? (id)MEMORY[0x1AF43FE40](v23 - 4, v3) : *(id *)(v3 + 8 * v23);
        v29 = v28;
        v3 = v23 - 3;
        if (__OFADD__(v4, 1))
          break;
        objc_msgSend(v28, sel_juDirectionalRangeValue);
        if (v34 == -1)
        {
          v26 = &qword_1EEC95CD8;
          if (qword_1EEC8A260 != -1)
          {
            swift_once();
            v26 = &qword_1EEC95CD8;
          }
        }
        else if (v34 == 1)
        {
          v26 = &qword_1EEC95CE0;
          if (qword_1EEC8A268 != -1)
          {
            swift_once();
            v26 = &qword_1EEC95CE0;
          }
        }
        else
        {
          if (v34)
            goto LABEL_38;
          v26 = &qword_1EEC95CD0;
          if (qword_1EEC8A258 != -1)
          {
            swift_once();
            v26 = &qword_1EEC95CD0;
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
  sub_1AC726868();
  swift_bridgeObjectRelease();
  sub_1AC726A30();
  sub_1AC7262C8();
  swift_bridgeObjectRelease();
  result = (id)sub_1AC726910();
  __break(1u);
  return result;
}

uint64_t LanguageAwareString.string.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1AC711604()
{
  return sub_1AC7116FC(&OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase, MEMORY[0x1E0CB2470]);
}

id LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_1AC71466C(a1, a2, a3, a4, a5);

  return v12;
}

id sub_1AC7116E8()
{
  return sub_1AC7116FC(&OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase, MEMORY[0x1E0CB2478]);
}

id sub_1AC7116FC(uint64_t *a1, uint64_t (*a2)(_QWORD, unint64_t))
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
    v8 = sub_1AC68F334();
    v9 = a2(MEMORY[0x1E0DEA968], v8);
    v11 = v10;
    swift_beginAccess();
    v12 = byte_1EEC8B790;
    swift_beginAccess();
    v13 = byte_1EEC8B791;
    v14 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    v15 = sub_1AC71466C(v9, v11, 0, v12, v13);
    v16 = *(void **)(v7 + v3);
    *(_QWORD *)(v7 + v3) = v15;
    v5 = v15;

    v4 = 0;
  }
  v17 = v4;
  return v5;
}

id sub_1AC711868()
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

  v1 = OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace;
  v2 = *(void **)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  }
  else
  {
    v4 = v0;
    sub_1AC68F334();
    v5 = sub_1AC726718();
    v7 = v6;
    swift_beginAccess();
    v8 = byte_1EEC8B790;
    swift_beginAccess();
    v9 = byte_1EEC8B791;
    v10 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    v11 = sub_1AC71466C(v5, v7, 0, v8, v9);
    v12 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v11;
    v3 = v11;

    v2 = 0;
  }
  v13 = v2;
  return v3;
}

id sub_1AC711A18()
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
  v2 = sub_1AC725854();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed;
  v7 = *(void **)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed);
  if (v7)
  {
    v8 = *(id *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string + 8);
    v21 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
    v22 = v9;
    swift_bridgeObjectRetain();
    sub_1AC725824();
    sub_1AC68F334();
    v10 = sub_1AC72670C();
    v12 = v11;
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v13 = byte_1EEC8B790;
    swift_beginAccess();
    v14 = byte_1EEC8B791;
    v15 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    v16 = sub_1AC71466C(v10, v12, 0, v13, v14);
    v17 = *(void **)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v16;
    v8 = v16;

    v7 = 0;
  }
  v18 = v7;
  return v8;
}

uint64_t LanguageAwareString.numbers.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_1AC711C28()
{
  void *v0;

  sub_1AC69C244(0, &qword_1EEC8B2C8);
  swift_bridgeObjectRetain();
  v0 = (void *)sub_1AC726394();
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

uint64_t sub_1AC711CF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange;
  if (*(_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange + 16) != 1)
    return *(_QWORD *)v1;
  v2 = sub_1AC711E04();
  result = 0;
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = v2;
  *(_BYTE *)(v1 + 16) = 0;
  return result;
}

BOOL sub_1AC711D78()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty);
  if (v1 != 2)
    return v1 & 1;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string + 8);
  if ((v2 & 0x2000000000000000) != 0)
    v3 = HIBYTE(v2) & 0xF;
  else
    v3 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string) & 0xFFFFFFFFFFFFLL;
  result = v3 == 0;
  *(_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty) = result;
  return result;
}

uint64_t sub_1AC711E04()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count);
  if (*(_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count + 8) != 1)
    return *(_QWORD *)v1;
  swift_bridgeObjectRetain();
  v2 = sub_1AC726304();
  swift_bridgeObjectRelease();
  *(_QWORD *)v1 = v2;
  v1[8] = 0;
  return v2;
}

unint64_t sub_1AC711EB8()
{
  uint64_t v0;
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count);
  if (*(_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count + 8) != 1)
    return *(_QWORD *)v1;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string + 8);
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
  v5 = 7;
  if (((v3 >> 60) & ((v2 & 0x800000000000000) == 0)) != 0)
    v5 = 11;
  result = sub_1AC713F1C(0xFuLL, v5 | (v4 << 16), v2, v3);
  *(_QWORD *)v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t sub_1AC711F84()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount);
  if (*(_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount + 8) != 1)
    return *(_QWORD *)v1;
  result = sub_1AC7262B0();
  *(_QWORD *)v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t static LanguageAwareString.alwaysGenerateAttributedString.getter()
{
  swift_beginAccess();
  return byte_1EEC8B790;
}

uint64_t static LanguageAwareString.alwaysGenerateAttributedString.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1EEC8B790 = a1;
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
  return byte_1EEC8B791;
}

uint64_t type metadata accessor for LanguageAwareString()
{
  return objc_opt_self();
}

uint64_t static LanguageAwareString.keepStatisticsOnLanguageComponents.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1EEC8B791 = a1;
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
  qword_1EEC8B798 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*static LanguageAwareString.delegate.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AC712414()
{
  char v0;
  char v1;
  id v2;
  id result;

  swift_beginAccess();
  v0 = byte_1EEC8B790;
  swift_beginAccess();
  v1 = byte_1EEC8B791;
  v2 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
  result = sub_1AC71466C(0, 0xE000000000000000, 0, v0, v1);
  qword_1EEC8B7A0 = (uint64_t)result;
  return result;
}

id static LanguageAwareString.empty.getter()
{
  if (qword_1EEC8A250 != -1)
    swift_once();
  return (id)qword_1EEC8B7A0;
}

id LanguageAwareString.__allocating_init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(void *a1, void *a2, char a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_1AC714EE0(a1, a2, a3);

  return v8;
}

id LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(void *a1, void *a2, char a3)
{
  id v5;

  v5 = sub_1AC714EE0(a1, a2, a3);

  return v5;
}

id LanguageAwareString.__allocating_init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_1AC7152E0(a1, a2, a3, a4, a5);

  return v12;
}

id LanguageAwareString.init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  id v6;

  v6 = sub_1AC7152E0(a1, a2, a3, a4, a5);

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
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(ObjectType + 504))(a1, a2, a3, a4 & 1, byte_1EEC8B791);
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
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(ObjectType + 504))(a1, a2, a3, a4 & 1, byte_1EEC8B791);
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

  v6 = sub_1AC71466C(a1, a2, a3, a4, a5);

  return v6;
}

id LanguageAwareString.__allocating_init(_:attributes:keepStatisticsOnLanguageComponents:)(void *a1, uint64_t a2, char a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_1AC715768((uint64_t)a1, a2, a3);

  return v8;
}

id LanguageAwareString.init(_:attributes:keepStatisticsOnLanguageComponents:)(void *a1, uint64_t a2, char a3)
{
  id v4;

  v4 = sub_1AC715768((uint64_t)a1, a2, a3);

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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  char *v22;
  int v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
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
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  int v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v80;
  objc_super v81;
  uint64_t v82[3];
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;

  v3 = OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString;
  *(_QWORD *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  v4 = OBJC_IVAR___JULanguageAwareString_cachedTextStorage;
  *(_QWORD *)&v1[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  v5 = OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase;
  *(_QWORD *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  v6 = OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase;
  *(_QWORD *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  v75 = OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace;
  *(_QWORD *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  v77 = OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed;
  *(_QWORD *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  v7 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  v8 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v80 = v1;
  sub_1AC726B38();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v82, v83);
    sub_1AC726A84();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
    swift_beginAccess();
    v15 = (void *)qword_1EEC8B798;
    if (qword_1EEC8B798)
    {
      swift_unknownObjectRetain();
      v16 = (void *)sub_1AC726208();
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v15, sel_preprocessForLanguageAwarenessString_, v16);

      sub_1AC72622C();
      swift_unknownObjectRelease();

    }
    swift_beginAccess();
    if (byte_1EEC8B790 == 1)
    {
      v18 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
      swift_bridgeObjectRetain();
      v19 = (void *)sub_1AC726208();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend(v18, sel_initWithString_, v19);

      v21 = 0;
    }
    else
    {
      v21 = (void *)sub_1AC726208();
      v20 = 0;
    }
    v22 = v80;
    swift_beginAccess();
    v23 = byte_1EEC8B791;
    v24 = v20;
    v72 = v21;
    sub_1AC6E066C(v20, v21, 0, v23, (uint64_t)v82);
    v25 = v82[2];
    v73 = v82[0];
    v74 = v82[1];
    v76 = v83;
    v71 = v84;
    v26 = v85;

    v78 = v25;
    if (v20)
    {
      if (v26)
      {
        v27 = *(_QWORD *)(v26 + 16);
        if (v27)
        {
          v68 = v24;
          v28 = v24;
          swift_bridgeObjectRetain();
          for (i = 0; i != v27; ++i)
          {
            v30 = *(_QWORD *)(v26 + 8 * i + 32);
            v82[0] = v30;
            sub_1AC6AE018(v82, v28, v78);
          }

          swift_bridgeObjectRelease_n();
          v24 = v68;
LABEL_22:
          v25 = v78;
          v39 = v71;
          if (!v20)
          {
            if ((v71 & 1) != 0)
              goto LABEL_24;
LABEL_41:
            *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = 0;
            goto LABEL_43;
          }
LABEL_28:
          objc_msgSend(v24, sel_copy, v67);
          sub_1AC726724();
          swift_unknownObjectRelease();
          sub_1AC69C244(0, &qword_1ED0BD780);
          if (swift_dynamicCast())
            v44 = v86;
          else
            v44 = 0;
          if (v39)
          {
            v70 = v24;
            v45 = v24;
            swift_bridgeObjectRelease();
            *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v44;
            v46 = qword_1EEC8A1C0;
            v47 = v44;
            if (v46 != -1)
              swift_once();
            v48 = qword_1EEC8A9B0;
            v49 = objc_retainAutorelease(v45);
            objc_msgSend(v49, sel_performSelector_, v48);
            v50 = objc_msgSend(v49, sel_string);
            v51 = sub_1AC72622C();
            v53 = v52;

            v54 = &v22[OBJC_IVAR___JULanguageAwareString_string];
            *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_string] = v51;
            v24 = v70;
          }
          else
          {
            *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v44;
            if (!v44)
            {
              v25 = v78;
LABEL_43:
              v42 = sub_1AC71101C(0, v25);
              swift_bridgeObjectRelease();
              v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v42);
              if (qword_1EEC8A1C0 == -1)
              {
LABEL_44:
                v62 = qword_1EEC8A9B0;
                v63 = objc_retainAutorelease(v43);
                objc_msgSend(v63, sel_performSelector_, v62);
                v64 = objc_msgSend(v63, sel_string);
                v65 = sub_1AC72622C();
                v53 = v66;

                v54 = &v22[OBJC_IVAR___JULanguageAwareString_string];
                *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_string] = v65;
                goto LABEL_45;
              }
LABEL_46:
              swift_once();
              goto LABEL_44;
            }
            v55 = v44;
            swift_bridgeObjectRelease();
            v56 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v55);
            if (qword_1EEC8A1C0 != -1)
              swift_once();
            v57 = qword_1EEC8A9B0;
            v58 = objc_retainAutorelease(v56);
            objc_msgSend(v58, sel_performSelector_, v57);
            v59 = objc_msgSend(v58, sel_string);
            v60 = sub_1AC72622C();
            v53 = v61;

            v54 = &v22[OBJC_IVAR___JULanguageAwareString_string];
            *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_string] = v60;
          }
          v25 = v78;
LABEL_45:
          *((_QWORD *)v54 + 1) = v53;
          *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_paragraphs] = v25;
          *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_numbers] = v73;
          *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_words] = v74;
          *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v76;

          v81.receiver = v22;
          v81.super_class = (Class)type metadata accessor for LanguageAwareString();
          v13 = objc_msgSendSuper2(&v81, sel_init);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
          return v13;
        }
        swift_bridgeObjectRelease();
      }
      v39 = v71;
      goto LABEL_28;
    }
    if (!v26)
    {
      if ((v71 & 1) != 0)
      {
LABEL_24:
        v40 = sub_1AC71101C(0, v25);
        swift_bridgeObjectRelease();
        *(_QWORD *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v40;
        v41 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
        v42 = v40;
        v43 = objc_msgSend(v41, sel_initWithAttributedString_, v42);
        if (qword_1EEC8A1C0 == -1)
          goto LABEL_44;
        goto LABEL_46;
      }
      goto LABEL_41;
    }
    v31 = (void *)sub_1AC726208();
    swift_bridgeObjectRelease();
    objc_msgSend(v31, sel_mutableCopy);

    sub_1AC726724();
    swift_unknownObjectRelease();
    sub_1AC69C244(0, &qword_1EEC8B838);
    v32 = MEMORY[0x1E0DEE9B8] + 8;
    swift_dynamicCast();
    v33 = v86;
    v34 = *(_QWORD *)(v26 + 16);
    if (v34)
    {
      v67 = v32;
      v69 = v24;
      swift_bridgeObjectRetain();
      v35 = 0;
      do
      {
        v36 = *(_QWORD *)(v26 + 8 * v35++ + 32);
        v37 = (void *)sub_1AC726208();
        objc_msgSend(v33, sel_replaceCharactersInRange_withString_, v36, 1, v37);

      }
      while (v34 != v35);
      swift_bridgeObjectRelease();
      v22 = v80;
      v24 = v69;
    }
    swift_bridgeObjectRelease();
    objc_msgSend(v33, sel_copy);
    sub_1AC726724();
    swift_unknownObjectRelease();
    sub_1AC69C244(0, (unint64_t *)&qword_1EEC8A970);
    swift_dynamicCast();
    v38 = v86;
    sub_1AC72622C();

    goto LABEL_22;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

  v12 = *(void **)&v1[v77];
  v13 = v80;

  type metadata accessor for LanguageAwareString();
  swift_deallocPartialClassInstance();
  return v13;
}

uint64_t sub_1AC71354C(uint64_t a1)
{
  id v2;
  id v3;
  char v4;
  char v5;

  v2 = sub_1AC710F64();
  v3 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a1);
  v5 = v4;

  if ((v5 & 1) != 0)
    return -1;
  else
    return (uint64_t)v3;
}

uint64_t sub_1AC71360C()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection);
  if (*(_BYTE *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection + 8) != 1)
    return *(_QWORD *)v1;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
  if (*(_BYTE *)(v2 + OBJC_IVAR___JUWritingDirectionsCounts_hasStronglyTypedCounts) == 1)
    result = *(unsigned __int8 *)(v2 + OBJC_IVAR___JUWritingDirectionsCounts_isRTLEnough);
  else
    result = -1;
  *(_QWORD *)v1 = result;
  v1[8] = 0;
  return result;
}

void sub_1AC71368C(uint64_t a1, id a2, id a3, char a4, double a5)
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

  v6 = *(_QWORD *)(v5 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
  if (*(_BYTE *)(v6 + OBJC_IVAR___JUWritingDirectionsCounts_hasStronglyTypedCounts) == 1)
  {
    v12 = *(_QWORD *)(v6 + OBJC_IVAR___JUWritingDirectionsCounts_leftToRight);
    v13 = *(_QWORD *)(v6 + OBJC_IVAR___JUWritingDirectionsCounts_rightToLeft);
    if (v12)
    {
      if (!v13)
        return;
    }
    else if (v13)
    {
      return;
    }
    if ((a4 & 1) == 0 || (v14 = *(void **)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage)) == 0)
    {
      v35 = sub_1AC710F64();
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
        v34 = *(void **)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage);
        *(_QWORD *)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage) = v15;
      }
      else
      {

        v34 = *(void **)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage);
        *(_QWORD *)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage) = 0;
      }
      goto LABEL_35;
    }
    v15 = v14;
    v16 = objc_msgSend(v15, sel_layoutManagers);
    sub_1AC69C244(0, &qword_1EEC8B5F8);
    v17 = sub_1AC7263A0();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = (id)sub_1AC726928();
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
          sub_1AC69C244(0, &qword_1EEC8B600);
          v17 = sub_1AC7263A0();

          if (!(v17 >> 62))
          {
            if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_16;
            goto LABEL_42;
          }
LABEL_41:
          swift_bridgeObjectRetain();
          v40 = sub_1AC726928();
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

                      objc_msgSend(v15, sel_juWritingDirectionOfLine_usingLayoutManager_textContainer_, a1, v18, v24);
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

                    v38 = objc_msgSend(v15, sel_juFullRange);
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
            v22 = (id)MEMORY[0x1AF43FE40](0, v17);
            goto LABEL_19;
          }
LABEL_42:
          swift_bridgeObjectRelease();
          __break(1u);
          goto LABEL_43;
        }
LABEL_39:
        v19 = (id)MEMORY[0x1AF43FE40](0, v17);
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

id sub_1AC713C10()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
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

uint64_t sub_1AC713DB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 528))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_1AC713DE0()
{
  uint64_t result;

  result = sub_1AC713E20(0);
  qword_1EEC95CD0 = result;
  return result;
}

uint64_t sub_1AC713E00()
{
  uint64_t result;

  result = sub_1AC713E20(-1);
  qword_1EEC95CD8 = result;
  return result;
}

uint64_t sub_1AC713E20(uint64_t a1)
{
  id v2;
  uint64_t v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
  objc_msgSend(v2, sel_setAlignment_, 4);
  objc_msgSend(v2, sel_setBaseWritingDirection_, a1);
  objc_msgSend(v2, sel_setLineBreakMode_, 0);
  objc_msgSend(v2, sel_copy);
  sub_1AC726724();

  swift_unknownObjectRelease();
  sub_1AC69C244(0, (unint64_t *)&unk_1EEC8BA90);
  swift_dynamicCast();
  return v4;
}

uint64_t sub_1AC713EFC()
{
  uint64_t result;

  result = sub_1AC713E20(1);
  qword_1EEC95CE0 = result;
  return result;
}

unint64_t sub_1AC713F1C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
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

  v7 = sub_1AC71412C(a1, a3, a4);
  result = sub_1AC71412C(a2, a3, a4);
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
        result = sub_1AC726280();
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
            result = sub_1AC7268B0();
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
        result = sub_1AC72628C();
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
            result = sub_1AC7268B0();
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

unint64_t sub_1AC71412C(unint64_t result, unint64_t a2, unint64_t a3)
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
    result = sub_1AC7141C8(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_1AC6E0400(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_1AC7141C8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_1AC6E01A4(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
    __break(1u);
  return result;
}

uint64_t sub_1AC714234(uint64_t a1)
{
  uint64_t *v1;
  uint64_t result;

  switch(a1)
  {
    case -1:
      if (qword_1EEC8A260 != -1)
        swift_once();
      v1 = &qword_1EEC95CD8;
      return *v1;
    case 1:
      if (qword_1EEC8A268 != -1)
        swift_once();
      v1 = &qword_1EEC95CE0;
      return *v1;
    case 0:
      if (qword_1EEC8A258 != -1)
        swift_once();
      v1 = &qword_1EEC95CD0;
      return *v1;
  }
  sub_1AC726868();
  swift_bridgeObjectRelease();
  sub_1AC726A30();
  sub_1AC7262C8();
  swift_bridgeObjectRelease();
  result = sub_1AC726910();
  __break(1u);
  return result;
}

id sub_1AC7143A8(void *a1, int a2)
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
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  uint64_t v34[5];
  uint64_t v35;

  *(_QWORD *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  v5 = OBJC_IVAR___JULanguageAwareString_cachedTextStorage;
  *(_QWORD *)&v2[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  v6 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  v7 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = v2;
  sub_1AC6E066C(a1, 0, 0, a2, (uint64_t)v34);
  v12 = v34[2];
  v30 = v34[0];
  v31 = v34[1];
  v32 = v34[3];
  v13 = v35;
  if (v35)
  {
    v14 = *(_QWORD *)(v35 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain();
      for (i = 0; i != v14; ++i)
      {
        v16 = *(_QWORD *)(v13 + 8 * i + 32);
        v34[0] = v16;
        sub_1AC6AE018(v34, a1, v12);
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&v11[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = a1;
  v17 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v18 = a1;
  v19 = objc_msgSend(v17, sel_initWithAttributedString_, v18);
  if (qword_1EEC8A1C0 != -1)
    swift_once();
  v20 = qword_1EEC8A9B0;
  v21 = objc_retainAutorelease(v19);
  objc_msgSend(v21, sel_performSelector_, v20);
  v22 = objc_msgSend(v21, sel_string);
  v23 = sub_1AC72622C();
  v25 = v24;

  v26 = (uint64_t *)&v11[OBJC_IVAR___JULanguageAwareString_string];
  *v26 = v23;
  v26[1] = v25;
  v27 = *(void **)&v2[v5];
  *(_QWORD *)&v2[v5] = a1;
  v28 = v18;

  *(_QWORD *)&v11[OBJC_IVAR___JULanguageAwareString_paragraphs] = v12;
  *(_QWORD *)&v11[OBJC_IVAR___JULanguageAwareString_numbers] = v30;
  *(_QWORD *)&v11[OBJC_IVAR___JULanguageAwareString_words] = v31;
  *(_QWORD *)&v11[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v32;

  v33.receiver = v11;
  v33.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v33, sel_init);
}

id sub_1AC71466C(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
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
  id v20;
  id v21;
  void *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t i;
  uint64_t v30;
  int v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  objc_super v75;
  id v76;
  uint64_t v77[4];
  unsigned __int8 v78;
  uint64_t v79;

  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  v9 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  v10 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  swift_beginAccess();
  v14 = (void *)qword_1EEC8B798;
  if (qword_1EEC8B798)
  {
    v15 = v5;
    swift_unknownObjectRetain();
    v16 = (void *)sub_1AC726208();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v14, sel_preprocessForLanguageAwarenessString_, v16);

    sub_1AC72622C();
    swift_unknownObjectRelease();

    if ((a4 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v18 = v5;
    if ((a4 & 1) != 0)
      goto LABEL_7;
  }
  if (!a3)
  {
    v19 = (void *)sub_1AC726208();
    v20 = 0;
    goto LABEL_8;
  }
LABEL_7:
  v21 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  swift_bridgeObjectRetain();
  v22 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v21, sel_initWithString_, v22);

  v19 = 0;
LABEL_8:
  v23 = v20;
  v72 = v19;
  sub_1AC6E066C(v20, v19, a3, a5 & 1, (uint64_t)v77);
  v24 = v77[2];
  v73 = v77[0];
  v74 = v77[1];
  v25 = v77[3];
  v71 = v78;
  v26 = v79;

  if (!v20)
  {
    if (v26)
    {
      v42 = (void *)sub_1AC726208();
      swift_bridgeObjectRelease();
      objc_msgSend(v42, sel_mutableCopy);

      sub_1AC726724();
      swift_unknownObjectRelease();
      sub_1AC69C244(0, &qword_1EEC8B838);
      swift_dynamicCast();
      v43 = *(_QWORD *)(v26 + 16);
      if (v43)
      {
        v68 = v23;
        swift_bridgeObjectRetain();
        v44 = 0;
        do
        {
          v45 = *(_QWORD *)(v26 + 8 * v44++ + 32);
          v46 = (void *)sub_1AC726208();
          objc_msgSend(v76, sel_replaceCharactersInRange_withString_, v45, 1, v46);

        }
        while (v43 != v44);
        swift_bridgeObjectRelease();
        v23 = v68;
      }
      swift_bridgeObjectRelease();
      objc_msgSend(v76, sel_copy);
      sub_1AC726724();
      swift_unknownObjectRelease();
      sub_1AC69C244(0, (unint64_t *)&qword_1EEC8A970);
      swift_dynamicCast();
      sub_1AC72622C();

      if ((v71 & 1) != 0)
        goto LABEL_15;
    }
    else if ((v71 & 1) != 0)
    {
LABEL_15:
      v32 = sub_1AC71101C(0, v24);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v32;
      v33 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
      v34 = v32;
      v35 = objc_msgSend(v33, sel_initWithAttributedString_, v34);
      if (qword_1EEC8A1C0 != -1)
        swift_once();
      v36 = qword_1EEC8A9B0;
      v37 = objc_retainAutorelease(v35);
      objc_msgSend(v37, sel_performSelector_, v36);
      v38 = objc_msgSend(v37, sel_string);
      v39 = sub_1AC72622C();
      v41 = v40;

      goto LABEL_43;
    }
    *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = 0;
    goto LABEL_39;
  }
  if (v26)
  {
    v27 = *(_QWORD *)(v26 + 16);
    if (v27)
    {
      v67 = v23;
      v69 = v25;
      v28 = v23;
      swift_bridgeObjectRetain();
      for (i = 0; i != v27; ++i)
      {
        v30 = *(_QWORD *)(v26 + 8 * i + 32);
        v77[0] = v30;
        sub_1AC6AE018(v77, v28, v24);
      }

      swift_bridgeObjectRelease_n();
      v23 = v67;
      v25 = v69;
      v31 = v71;
      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
  }
  v31 = v71;
LABEL_26:
  objc_msgSend(v23, sel_copy);
  sub_1AC726724();
  swift_unknownObjectRelease();
  sub_1AC69C244(0, &qword_1ED0BD780);
  if (swift_dynamicCast())
    v47 = v76;
  else
    v47 = 0;
  if (!v31)
  {
    *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v47;
    if (v47)
    {
      v57 = v47;
      swift_bridgeObjectRelease();
      v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v57);
      if (qword_1EEC8A1C0 != -1)
        swift_once();
      v59 = qword_1EEC8A9B0;
      v60 = objc_retainAutorelease(v58);
      objc_msgSend(v60, sel_performSelector_, v59);
      v61 = objc_msgSend(v60, sel_string);
      v39 = sub_1AC72622C();
      v41 = v62;

LABEL_42:
LABEL_43:

      v56 = &v5[OBJC_IVAR___JULanguageAwareString_string];
      *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_string] = v39;
      goto LABEL_44;
    }
LABEL_39:
    v57 = sub_1AC71101C(0, v24);
    swift_bridgeObjectRelease();
    v63 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v57);
    if (qword_1EEC8A1C0 != -1)
      swift_once();
    v64 = qword_1EEC8A9B0;
    v60 = objc_retainAutorelease(v63);
    objc_msgSend(v60, sel_performSelector_, v64);
    v61 = objc_msgSend(v60, sel_string);
    v39 = sub_1AC72622C();
    v41 = v65;
    goto LABEL_42;
  }
  v70 = v25;
  v48 = v23;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v47;
  v49 = qword_1EEC8A1C0;
  v50 = v47;
  if (v49 != -1)
    swift_once();
  v51 = qword_1EEC8A9B0;
  v52 = objc_retainAutorelease(v48);
  objc_msgSend(v52, sel_performSelector_, v51);
  v53 = objc_msgSend(v52, sel_string);
  v54 = sub_1AC72622C();
  v41 = v55;

  v56 = &v5[OBJC_IVAR___JULanguageAwareString_string];
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_string] = v54;
  v25 = v70;
LABEL_44:
  *((_QWORD *)v56 + 1) = v41;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_paragraphs] = v24;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_numbers] = v73;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_words] = v74;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v25;

  v75.receiver = v5;
  v75.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v75, sel_init);
}

id sub_1AC714EE0(void *a1, void *a2, char a3)
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
  unint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;
  uint64_t v47[4];
  unsigned __int8 v48;
  uint64_t v49;

  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  v7 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  v8 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  swift_beginAccess();
  v12 = (void *)qword_1EEC8B798;
  if (qword_1EEC8B798
    && (objc_msgSend((id)qword_1EEC8B798, sel_respondsToSelector_, sel_preprocessForLanguageAwarenessAttributedString_) & 1) != 0)
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
  sub_1AC6E066C(v17, 0, a2, a3 & 1, (uint64_t)v47);
  v19 = v47[2];
  v44 = v47[0];
  v45 = v47[1];
  v20 = v47[3];
  v21 = v48;
  v22 = v49;

  if (v22)
  {
    v23 = v20;
    v24 = *(_QWORD *)(v22 + 16);
    if (v24)
    {
      swift_bridgeObjectRetain();
      for (i = 0; i != v24; ++i)
      {
        v26 = *(_QWORD *)(v22 + 8 * i + 32);
        v47[0] = v26;
        sub_1AC6AE018(v47, v18, v19);
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v20 = v23;
  }
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v18);
  v28 = v27;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v27;
  if (v21)
  {
    v29 = qword_1EEC8A1C0;
    v30 = v27;
    if (v29 != -1)
      swift_once();
    v31 = qword_1EEC8A9B0;
    v32 = objc_retainAutorelease(v18);
    objc_msgSend(v32, sel_performSelector_, v31);
    v18 = objc_msgSend(v32, sel_string);
    v33 = sub_1AC72622C();
    v35 = v34;
  }
  else
  {
    v36 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    v37 = v28;
    v38 = objc_msgSend(v36, sel_initWithAttributedString_, v37);
    if (qword_1EEC8A1C0 != -1)
      swift_once();
    v39 = qword_1EEC8A9B0;
    v32 = objc_retainAutorelease(v38);
    objc_msgSend(v32, sel_performSelector_, v39);
    v40 = objc_msgSend(v32, sel_string);
    v33 = sub_1AC72622C();
    v35 = v41;

    v30 = v16;
    v16 = v40;
  }

  v42 = (uint64_t *)&v3[OBJC_IVAR___JULanguageAwareString_string];
  *v42 = v33;
  v42[1] = v35;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString_paragraphs] = v19;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString_numbers] = v44;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString_words] = v45;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v20;

  v46.receiver = v3;
  v46.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v46, sel_init);
}

id sub_1AC7152E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
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
  unint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v49;
  objc_super v50;
  uint64_t v51[4];
  unsigned __int8 v52;
  uint64_t v53;

  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  v9 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  v10 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  swift_beginAccess();
  v14 = (void *)qword_1EEC8B798;
  if (qword_1EEC8B798)
  {
    v15 = v5;
    swift_unknownObjectRetain();
    v16 = (void *)sub_1AC726208();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v14, sel_preprocessForLanguageAwarenessString_, v16);

    sub_1AC72622C();
    swift_unknownObjectRelease();

  }
  else
  {
    v18 = v5;
  }
  v19 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_1AC690AA0();
    v20 = (void *)sub_1AC726178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithString_attributes_, v19, v20);

  v22 = v21;
  sub_1AC6E066C(v21, 0, a4, a5 & 1, (uint64_t)v51);
  v23 = v51[1];
  v49 = v51[0];
  v24 = v51[2];
  v25 = v51[3];
  v26 = v52;
  v27 = v53;

  if (v27)
  {
    v28 = *(_QWORD *)(v27 + 16);
    if (v28)
    {
      v29 = v23;
      v30 = v25;
      swift_bridgeObjectRetain();
      for (i = 0; i != v28; ++i)
      {
        v32 = *(_QWORD *)(v27 + 8 * i + 32);
        v51[0] = v32;
        sub_1AC6AE018(v51, v22, v24);
      }
      swift_bridgeObjectRelease();
      v25 = v30;
      v23 = v29;
    }
    swift_bridgeObjectRelease();
  }
  v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v22);
  v34 = v33;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v33;
  if (v26)
  {
    v35 = qword_1EEC8A1C0;
    v36 = v33;
    if (v35 != -1)
      swift_once();
    v37 = qword_1EEC8A9B0;
    v38 = objc_retainAutorelease(v22);
    objc_msgSend(v38, sel_performSelector_, v37);
    v22 = objc_msgSend(v38, sel_string);
    v39 = sub_1AC72622C();
    v41 = v40;
  }
  else
  {
    v42 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    v43 = v34;
    v44 = objc_msgSend(v42, sel_initWithAttributedString_, v43);
    if (qword_1EEC8A1C0 != -1)
      swift_once();
    v45 = qword_1EEC8A9B0;
    v36 = objc_retainAutorelease(v44);
    objc_msgSend(v36, sel_performSelector_, v45);
    v38 = objc_msgSend(v36, sel_string);
    v39 = sub_1AC72622C();
    v41 = v46;

  }
  v47 = (uint64_t *)&v5[OBJC_IVAR___JULanguageAwareString_string];
  *v47 = v39;
  v47[1] = v41;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_paragraphs] = v24;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_numbers] = v49;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_words] = v23;
  *(_QWORD *)&v5[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v25;

  v50.receiver = v5;
  v50.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v50, sel_init);
}

id sub_1AC715768(uint64_t a1, uint64_t a2, char a3)
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
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  objc_super v35;

  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  v7 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  v8 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = v3;
  v13 = sub_1AC710F64();
  v14 = v13;
  if (a2)
  {
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v13);
    type metadata accessor for Key(0);
    sub_1AC690AA0();
    v16 = (void *)sub_1AC726178();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v14, sel_juFullRange);
    objc_msgSend(v15, sel_addAttributes_range_, v16, v17, v18);

    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v15);
  }
  else
  {
    v19 = v13;
  }
  *(_QWORD *)&v12[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v19;
  v20 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v21 = v19;
  v22 = objc_msgSend(v20, sel_initWithAttributedString_, v21);
  if (qword_1EEC8A1C0 != -1)
    swift_once();
  v23 = qword_1EEC8A9B0;
  v24 = objc_retainAutorelease(v22);
  objc_msgSend(v24, sel_performSelector_, v23);
  v25 = objc_msgSend(v24, sel_string);
  v26 = sub_1AC72622C();
  v28 = v27;

  v29 = (uint64_t *)&v12[OBJC_IVAR___JULanguageAwareString_string];
  *v29 = v26;
  v29[1] = v28;
  if ((a3 & 1) != 0)
  {
    *(_QWORD *)&v12[OBJC_IVAR___JULanguageAwareString_paragraphs] = *(_QWORD *)(a1
                                                                              + OBJC_IVAR___JULanguageAwareString_paragraphs);
    *(_QWORD *)&v12[OBJC_IVAR___JULanguageAwareString_numbers] = *(_QWORD *)(a1
                                                                           + OBJC_IVAR___JULanguageAwareString_numbers);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();

    v30 = OBJC_IVAR___JULanguageAwareString_words;
    v31 = *(_QWORD *)(a1 + OBJC_IVAR___JULanguageAwareString_words);
    swift_bridgeObjectRetain();
  }
  else
  {
    v31 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)&v12[OBJC_IVAR___JULanguageAwareString_paragraphs] = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)&v12[OBJC_IVAR___JULanguageAwareString_numbers] = v31;

    v30 = OBJC_IVAR___JULanguageAwareString_words;
  }
  *(_QWORD *)&v12[v30] = v31;
  v32 = *(void **)(a1 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
  *(_QWORD *)&v12[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v32;
  v33 = v32;

  v35.receiver = v12;
  v35.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v35, sel_init);
}

id sub_1AC715AAC@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1AC710F64();
  *a1 = result;
  return result;
}

void sub_1AC715AD4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString);
}

id sub_1AC715AE0@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1AC711604();
  *a1 = result;
  return result;
}

void sub_1AC715B08(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase);
}

id sub_1AC715B14@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1AC7116E8();
  *a1 = result;
  return result;
}

void sub_1AC715B3C(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase);
}

id sub_1AC715B48@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1AC711868();
  *a1 = result;
  return result;
}

void sub_1AC715B70(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
}

id sub_1AC715B7C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1AC711A18();
  *a1 = result;
  return result;
}

void sub_1AC715BA4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed);
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

uint64_t sub_1AC715BE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1AC711CF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

__n128 sub_1AC715C10(__n128 *a1, _QWORD *a2)
{
  uint64_t v2;
  __n128 result;

  v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange;
  result = *a1;
  *(__n128 *)v2 = *a1;
  *(_BYTE *)(v2 + 16) = 0;
  return result;
}

BOOL sub_1AC715C30@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_1AC711D78();
  *a1 = result;
  return result;
}

_BYTE *sub_1AC715C5C(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty) = *result;
  return result;
}

uint64_t sub_1AC715C74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC711E04();
  *a1 = result;
  return result;
}

_QWORD *sub_1AC715C9C(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count;
  *(_QWORD *)v2 = *result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

unint64_t sub_1AC715CBC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_1AC711EB8();
  *a1 = result;
  return result;
}

_QWORD *sub_1AC715CE4(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count;
  *(_QWORD *)v2 = *result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_1AC715D04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC711F84();
  *a1 = result;
  return result;
}

_QWORD *sub_1AC715D2C(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount;
  *(_QWORD *)v2 = *result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_1AC715D4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AC71360C();
  *a1 = result;
  return result;
}

_QWORD *sub_1AC715D74(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
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

uint64_t dispatch thunk of LanguageAwareString.localizedLowercase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedUppercase.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of LanguageAwareString.newlinesCollapsedToSpace.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of LanguageAwareString.trimmed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of LanguageAwareString.juFullRange.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of LanguageAwareString.isEmpty.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of LanguageAwareString.utf16Count.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of LanguageAwareString.utf32Count.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of LanguageAwareString.characterCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
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

unint64_t JUComponentMenuBuilder.init()@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_1AC6A9654(MEMORY[0x1E0DEE9D8]);
  *a1 = result;
  return result;
}

uint64_t JUComponentMenuBuilder.addTemplate(for:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = v4;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v5;
  *v5 = 0x8000000000000000;
  sub_1AC69EECC((uint64_t)&unk_1EEC8B848, v10, a1, a2, isUniquelyReferenced_nonNull_native);
  *v5 = v13;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC71604C(uint64_t a1, uint64_t a2, uint64_t *a3, int *a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  *(_QWORD *)(v4 + 16) = a1;
  v6 = *a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v7;
  *v7 = v4;
  v7[1] = sub_1AC7160BC;
  return v9(a2, v6);
}

uint64_t sub_1AC7160BC(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v5;

  v3 = *(_QWORD **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();
  *v3 = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1AC71610C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC716130(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;

  v8 = *(int **)(v3 + 16);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1AC718220;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, int *))((char *)&dword_1EEC8B840 + dword_1EEC8B840))(a1, a2, a3, v8);
}

uint64_t JUComponentMenuBuilder.addingTemplate(for:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t *v5;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;

  v11 = *v5;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a5 = 0x8000000000000000;
  sub_1AC69EECC((uint64_t)&unk_1EEC8B850, v12, a1, a2, isUniquelyReferenced_nonNull_native);
  *a5 = v11;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t JUComponentMenuBuilder.buildContextMenu(forContentsOf:withMetrics:asPartOf:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16[2];

  v16[0] = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B858);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AC7260B8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AC725E48();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1AC6916CC((uint64_t)v8, &qword_1EEC8B858);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v16[1] = v13;
    v14 = sub_1AC7163E4((uint64_t)v12, (uint64_t)a1, a2, v16[0]);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v14;
}

uint64_t sub_1AC7163E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void (*v39)(_QWORD *, char *, uint64_t);
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  _QWORD *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char v61;
  _QWORD *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t result;
  _QWORD v69[2];
  char *v70;
  int v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(_QWORD *, char *, uint64_t);
  uint64_t v91;
  int v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t aBlock;
  unint64_t v101;
  uint64_t (*v102)(uint64_t, void *);
  void *v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  _QWORD *v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;

  v86 = a4;
  v85 = a3;
  v77 = a2;
  v84 = sub_1AC7260B8();
  v6 = *(_QWORD *)(v84 - 8);
  MEMORY[0x1E0C80A78](v84);
  v8 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1EEC8ABA8);
  MEMORY[0x1E0C80A78](v9);
  v76 = (uint64_t)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_1AC7260A0();
  v88 = *(_QWORD *)(v83 - 8);
  MEMORY[0x1E0C80A78](v83);
  v70 = (char *)v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B860);
  MEMORY[0x1E0C80A78](v82);
  v13 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8B868);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v89 = (uint64_t)v69 - v18;
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)v69 - v20;
  v22 = sub_1AC72607C();
  v94 = *(_QWORD *)(v22 - 8);
  v95 = v22;
  MEMORY[0x1E0C80A78](v22);
  v93 = (char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1AC726088();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v96 = (char *)v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v27);
  v99 = (char *)v69 - v28;
  v75 = *v4;
  v108 = MEMORY[0x1E0DEE9D8];
  v29 = sub_1AC7260AC();
  v30 = *(_QWORD *)(v29 + 16);
  if (!v30)
  {
LABEL_33:
    swift_bridgeObjectRelease();
    sub_1AC69C244(0, &qword_1EEC8B870);
    sub_1AC726094();
    sub_1AC726040();
    sub_1AC726208();
    swift_bridgeObjectRelease();
    return sub_1AC72667C();
  }
  v74 = v6;
  v87 = v21;
  v72 = v16;
  v73 = v8;
  v69[1] = a1;
  v31 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v69[0] = v29;
  v32 = v29 + v31;
  v92 = *MEMORY[0x1E0D410C0];
  v79 = *MEMORY[0x1E0D410C8];
  v71 = *MEMORY[0x1E0D410D0];
  v78 = *MEMORY[0x1E0D410E8];
  v91 = *(_QWORD *)(v25 + 72);
  v90 = *(void (**)(_QWORD *, char *, uint64_t))(v25 + 16);
  v98 = v13;
  v33 = v89;
  v34 = v96;
  v35 = v84;
  v81 = v24;
  v80 = v25;
  while (1)
  {
    v38 = v99;
    v39 = v90;
    v90(v99, (char *)v32, v24);
    v39(v34, v38, v24);
    v40 = (*(uint64_t (**)(_QWORD *, uint64_t))(v25 + 88))(v34, v24);
    if (v40 == v92)
    {
      v97 = v30;
      (*(void (**)(_QWORD *, uint64_t))(v25 + 96))(v34, v24);
      (*(void (**)(char *, _QWORD *, uint64_t))(v94 + 32))(v93, v34, v95);
      v41 = (uint64_t)v87;
      sub_1AC726058();
      v42 = v88;
      v43 = v83;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v88 + 104))(v33, v78, v83);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56))(v33, 0, 1, v43);
      v44 = (uint64_t)&v13[*(int *)(v82 + 48)];
      sub_1AC6902E4(v41, (uint64_t)v13, &qword_1EEC8B868);
      sub_1AC6902E4(v33, v44, &qword_1EEC8B868);
      v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48);
      if (v45((uint64_t)v13, 1, v43) == 1)
      {
        sub_1AC6916CC(v33, &qword_1EEC8B868);
        sub_1AC6916CC(v41, &qword_1EEC8B868);
        if (v45(v44, 1, v43) == 1)
        {
          sub_1AC6916CC((uint64_t)v13, &qword_1EEC8B868);
          goto LABEL_24;
        }
      }
      else
      {
        v49 = (uint64_t)v72;
        sub_1AC6902E4((uint64_t)v13, (uint64_t)v72, &qword_1EEC8B868);
        if (v45(v44, 1, v43) != 1)
        {
          v55 = v88;
          v56 = v70;
          (*(void (**)(char *, uint64_t, uint64_t))(v88 + 32))(v70, v44, v43);
          sub_1AC717CD4();
          sub_1AC7261FC();
          v57 = *(void (**)(char *, uint64_t))(v55 + 8);
          v57(v56, v43);
          v58 = v89;
          sub_1AC6916CC(v89, &qword_1EEC8B868);
          sub_1AC6916CC((uint64_t)v87, &qword_1EEC8B868);
          v59 = v49;
          v33 = v58;
          v57((char *)v59, v43);
          sub_1AC6916CC((uint64_t)v98, &qword_1EEC8B868);
LABEL_24:
          v60 = v93;
          sub_1AC726070();
          if (v107)
          {
            sub_1AC68AAA4(&v106, (uint64_t)&aBlock);
            sub_1AC68E218((uint64_t)&aBlock, (uint64_t)&v106);
            v36 = v76;
            sub_1AC6902E4(v85, v76, qword_1EEC8ABA8);
            type metadata accessor for JUActionPerformer();
            v37 = swift_allocObject();
            sub_1AC68AAA4(&v106, v37 + 16);
            sub_1AC6B35E8(v36, v37 + OBJC_IVAR____TtC5JetUI17JUActionPerformer_metricsContext);
            *(_QWORD *)(v37 + OBJC_IVAR____TtC5JetUI17JUActionPerformer_objectGraph) = v86;
            sub_1AC69C244(0, &qword_1EEC8B878);
            swift_retain();
            sub_1AC726064();
            sub_1AC72604C();
            sub_1AC726208();
            swift_bridgeObjectRelease();
            swift_retain();
            sub_1AC7266AC();
            MEMORY[0x1AF43F93C]();
            if (*(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1AC7263D0();
            sub_1AC72640C();
            sub_1AC7263AC();
            swift_release();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
            (*(void (**)(char *, uint64_t))(v94 + 8))(v60, v95);
            v25 = v80;
            v24 = v81;
            (*(void (**)(char *, uint64_t))(v80 + 8))(v99, v81);
            v35 = v84;
            v33 = v89;
          }
          else
          {
            sub_1AC6916CC((uint64_t)&v106, &qword_1EEC8ABA0);
            sub_1AC69C244(0, &qword_1EEC8B878);
            sub_1AC726064();
            sub_1AC72604C();
            sub_1AC726208();
            swift_bridgeObjectRelease();
            sub_1AC7266AC();
            MEMORY[0x1AF43F93C]();
            if (*(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1AC7263D0();
            sub_1AC72640C();
            sub_1AC7263AC();
            (*(void (**)(char *, uint64_t))(v94 + 8))(v60, v95);
            v25 = v80;
            v24 = v81;
            (*(void (**)(char *, uint64_t))(v80 + 8))(v99, v81);
            v35 = v84;
          }
          goto LABEL_6;
        }
        v50 = v89;
        sub_1AC6916CC(v89, &qword_1EEC8B868);
        sub_1AC6916CC((uint64_t)v87, &qword_1EEC8B868);
        v51 = v49;
        v33 = v50;
        (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v51, v43);
      }
      sub_1AC6916CC((uint64_t)v13, &qword_1EEC8B860);
      goto LABEL_24;
    }
    if (v40 == v79)
    {
      (*(void (**)(_QWORD *, uint64_t))(v25 + 96))(v34, v24);
      v46 = v74;
      v47 = v34;
      v48 = v73;
      (*(void (**)(char *, _QWORD *, uint64_t))(v74 + 32))(v73, v47, v35);
      aBlock = v75;
      sub_1AC7163E4(v48, v77, v85, v86);
      MEMORY[0x1AF43F93C]();
      if (*(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1AC7263D0();
      sub_1AC72640C();
      sub_1AC7263AC();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v35);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v99, v24);
      v34 = v96;
      v33 = v89;
      goto LABEL_7;
    }
    if (v40 != v71)
      break;
    (*(void (**)(_QWORD *, uint64_t))(v25 + 96))(v34, v24);
    v53 = *v34;
    v52 = v34[1];
    if (sub_1AC726034() == v53 && v54 == v52)
    {
      swift_bridgeObjectRelease();
LABEL_29:
      (*(void (**)(char *, uint64_t))(v25 + 8))(v99, v24);
      swift_bridgeObjectRelease();
      v34 = v96;
      goto LABEL_7;
    }
    v61 = sub_1AC726A78();
    swift_bridgeObjectRelease();
    if ((v61 & 1) != 0)
      goto LABEL_29;
    v97 = v30;
    sub_1AC68E218(v77, (uint64_t)&v106);
    v62 = (_QWORD *)swift_allocObject();
    sub_1AC68AAA4(&v106, (uint64_t)(v62 + 2));
    v62[7] = v75;
    v62[8] = v53;
    v63 = v86;
    v62[9] = v52;
    v62[10] = v63;
    v104 = sub_1AC717CC0;
    v105 = v62;
    aBlock = MEMORY[0x1E0C809B0];
    v101 = 1107296256;
    v102 = sub_1AC717AF0;
    v103 = &block_descriptor_10;
    v64 = _Block_copy(&aBlock);
    v65 = (void *)objc_opt_self();
    swift_retain();
    swift_bridgeObjectRetain();
    v66 = objc_msgSend(v65, sel_elementWithProvider_, v64, v69[0]);
    _Block_release(v64);
    v67 = swift_release();
    MEMORY[0x1AF43F93C](v67);
    if (*(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1AC7263D0();
    sub_1AC72640C();
    sub_1AC7263AC();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v99, v24);
LABEL_6:
    v34 = v96;
    v30 = v97;
LABEL_7:
    v32 += v91;
    --v30;
    v13 = v98;
    if (!v30)
      goto LABEL_33;
  }
  aBlock = 0;
  v101 = 0xE000000000000000;
  sub_1AC726868();
  sub_1AC7262C8();
  sub_1AC726904();
  result = sub_1AC726910();
  __break(1u);
  return result;
}

uint64_t sub_1AC7170C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  _OWORD v24[2];
  uint64_t v25;
  _BYTE v26[40];

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BDBC0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1AC7264CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_1AC68E218(a3, (uint64_t)v26);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a1;
  *(_QWORD *)(v18 + 24) = a2;
  sub_1AC6902E4((uint64_t)v26, (uint64_t)v24, &qword_1EEC8B898);
  sub_1AC7264B4();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v19 = sub_1AC7264A8();
  sub_1AC6916CC((uint64_t)v26, &qword_1EEC8B898);
  v20 = swift_allocObject();
  v21 = v24[1];
  *(_OWORD *)(v20 + 56) = v24[0];
  v22 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v20 + 16) = v19;
  *(_QWORD *)(v20 + 24) = v22;
  *(_QWORD *)(v20 + 32) = a4;
  *(_QWORD *)(v20 + 40) = a5;
  *(_QWORD *)(v20 + 48) = a6;
  *(_OWORD *)(v20 + 72) = v21;
  *(_QWORD *)(v20 + 88) = v25;
  *(_QWORD *)(v20 + 96) = a7;
  *(_QWORD *)(v20 + 104) = sub_1AC6E4ACC;
  *(_QWORD *)(v20 + 112) = v18;
  sub_1AC7179A4((uint64_t)v16, (uint64_t)&unk_1EEC8B8A0, v20);
  return swift_release();
}

uint64_t sub_1AC717264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;

  v8[3] = v16;
  v8[4] = v17;
  v8[5] = sub_1AC7264B4();
  v8[6] = sub_1AC7264A8();
  v8[2] = a4;
  v14 = (_QWORD *)swift_task_alloc();
  v8[7] = v14;
  *v14 = v8;
  v14[1] = sub_1AC717308;
  return sub_1AC7173E4(a5, a6, a7, a8);
}

uint64_t sub_1AC717308(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  sub_1AC72649C();
  return swift_task_switch();
}

uint64_t sub_1AC717380()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t *);
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(void (**)(uint64_t *))(v0 + 24);
  swift_release();
  v4 = v1;
  swift_retain();
  v2(&v4);
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC7173E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[10] = a3;
  v5[11] = a4;
  v5[8] = a1;
  v5[9] = a2;
  sub_1AC725CE0();
  v5[12] = swift_task_alloc();
  v6 = sub_1AC72610C();
  v5[13] = v6;
  v5[14] = *(_QWORD *)(v6 - 8);
  v5[15] = swift_task_alloc();
  v7 = sub_1AC725FF8();
  v5[16] = v7;
  v5[17] = *(_QWORD *)(v7 - 8);
  v5[18] = swift_task_alloc();
  v8 = swift_task_alloc();
  v9 = *v4;
  v5[19] = v8;
  v5[20] = v9;
  sub_1AC7264B4();
  v5[21] = sub_1AC7264A8();
  v5[22] = sub_1AC72649C();
  v5[23] = v10;
  return swift_task_switch();
}

uint64_t sub_1AC7174D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 160) + 16))
  {
    v2 = *(_QWORD *)(v0 + 64);
    v1 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRetain();
    v3 = sub_1AC6B4F00(v2, v1);
    if ((v4 & 1) != 0)
    {
      v5 = *(_QWORD *)(v0 + 88);
      v6 = *(_QWORD *)(*(_QWORD *)(v0 + 160) + 56) + 16 * v3;
      v7 = *(int **)v6;
      *(_QWORD *)(v0 + 192) = *(_QWORD *)(v6 + 8);
      swift_retain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 48) = v5;
      v24 = (int *)((char *)v7 + *v7);
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v8;
      *v8 = v0;
      v8[1] = sub_1AC7178E0;
      return ((uint64_t (*)(uint64_t, _QWORD, uint64_t))v24)(v0 + 56, *(_QWORD *)(v0 + 80), v0 + 48);
    }
    swift_bridgeObjectRelease();
  }
  swift_release();
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(_QWORD *)(v0 + 152);
  v12 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 136);
  sub_1AC725FEC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v10, *MEMORY[0x1E0D40AD0], v12);
  v14 = sub_1AC725FE0();
  v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v15(v10, v12);
  v15(v11, v12);
  if ((v14 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED0BDE00);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1AC727FB0;
    sub_1AC69C244(0, &qword_1EEC8B878);
    sub_1AC726868();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AC7262C8();
    swift_bridgeObjectRelease();
    sub_1AC7262C8();
    *(_QWORD *)(v16 + 32) = sub_1AC7266AC();
    sub_1AC7263AC();
    v17 = v16;
  }
  else
  {
    if (qword_1EEC8A210 != -1)
      swift_once();
    v19 = *(_QWORD *)(v0 + 112);
    v18 = *(_QWORD *)(v0 + 120);
    v20 = *(_QWORD *)(v0 + 104);
    v22 = *(_QWORD *)(v0 + 64);
    v21 = *(_QWORD *)(v0 + 72);
    v23 = __swift_project_value_buffer(v20, (uint64_t)qword_1EEC95CB8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v23, v20);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8A5E0);
    sub_1AC725D10();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1AC727FC0;
    sub_1AC725CD4();
    sub_1AC725CC8();
    *(_QWORD *)(v0 + 40) = MEMORY[0x1E0D41088];
    *(_QWORD *)(v0 + 16) = v22;
    *(_QWORD *)(v0 + 24) = v21;
    swift_bridgeObjectRetain();
    sub_1AC725C98();
    sub_1AC6916CC(v0 + 16, (uint64_t *)&unk_1ED0BE0D0);
    sub_1AC725CC8();
    sub_1AC725CEC();
    sub_1AC726028();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    v17 = MEMORY[0x1E0DEE9D8];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v17);
}

uint64_t sub_1AC7178E0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(_QWORD *)(v1 + 208) = *(_QWORD *)(v1 + 56);
  return swift_task_switch();
}

uint64_t sub_1AC71793C()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_1AC7179A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1AC7264CC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1AC7264C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1AC6916CC(a1, &qword_1ED0BDBC0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AC72649C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1AC717AF0(uint64_t a1, void *aBlock)
{
  void (*v2)(void (*)(uint64_t), uint64_t);
  void *v3;
  uint64_t v4;

  v2 = *(void (**)(void (*)(uint64_t), uint64_t))(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1AC717D40, v4);
  swift_release();
  return swift_release();
}

void sub_1AC717B60(uint64_t a1, uint64_t a2)
{
  id v3;

  sub_1AC69C244(0, &qword_1EEC8B888);
  v3 = (id)sub_1AC726394();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

uint64_t sub_1AC717BC4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1AC717C28;
  return v6(a1);
}

uint64_t sub_1AC717C28()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

ValueMetadata *type metadata accessor for JUComponentMenuBuilder()
{
  return &type metadata for JUComponentMenuBuilder;
}

uint64_t sub_1AC717C84()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC717CC0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1AC7170C8(a1, a2, (uint64_t)(v2 + 2), v2[7], v2[8], v2[9], v2[10]);
}

unint64_t sub_1AC717CD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC8B880;
  if (!qword_1EEC8B880)
  {
    v1 = sub_1AC7260A0();
    result = MEMORY[0x1AF440830](MEMORY[0x1E0D41100], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC8B880);
  }
  return result;
}

uint64_t sub_1AC717D1C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1AC717D40(uint64_t a1)
{
  uint64_t v1;

  sub_1AC717B60(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1AC717D48()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC717D94(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = v1[3];
  v11 = v1[2];
  v5 = v1[4];
  v6 = v1[5];
  v7 = v1[6];
  v8 = v1[12];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1AC717E40;
  return sub_1AC717264(a1, v11, v4, v5, v6, v7, (uint64_t)(v1 + 7), v8);
}

uint64_t sub_1AC717E40()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AC717E88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AC717E40;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEC8B8A8 + dword_1EEC8B8A8))(a1, v4);
}

uint64_t sub_1AC717EF8()
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

uint64_t sub_1AC717F64(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1AC718014 + 4 * byte_1AC72F3B0[(v7 - 1)]))();
}

void sub_1AC718064(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for Send(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Send);
}

JUMeasurements __swiftcall UIImageView.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  char v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  JUMeasurements result;

  objc_msgSend(v2, sel_sizeThatFits_, toFit.width, toFit.height);
  v4 = v3;
  v6 = v5;
  v7 = objc_msgSend(v2, sel_image);
  if (v7)
  {
    v8 = v7;
    v9 = COERCE_DOUBLE(sub_1AC726688());
    v11 = v10;

    if ((v11 & 1) != 0)
      v12 = 0.0;
    else
      v12 = v9;
  }
  else
  {
    v12 = 0.0;
  }
  v13 = v4;
  v14 = v6;
  v15 = v6;
  result.var3 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

double sub_1AC7182C4()
{
  id *v0;
  id v1;
  double v2;
  double v3;
  id v4;
  void *v5;

  v1 = *v0;
  objc_msgSend(*v0, sel_sizeThatFits_);
  v3 = v2;
  v4 = objc_msgSend(v1, sel_image);
  if (v4)
  {
    v5 = v4;
    sub_1AC726688();

  }
  return v3;
}

BOOL static Separator.Position.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Separator.Position.hash(into:)()
{
  return sub_1AC726B08();
}

uint64_t Separator.Position.hashValue.getter()
{
  sub_1AC726AFC();
  sub_1AC726B08();
  return sub_1AC726B2C();
}

void Separator.position.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *Separator.position.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

double (*Separator.position.modify())(void)
{
  return nullsub_1;
}

double Separator.leadingInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void Separator.leadingInset.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

double (*Separator.leadingInset.modify())(void)
{
  return nullsub_1;
}

uint64_t Separator.withLeadingInset(_:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  char *v2;
  char v5;
  uint64_t v6;
  uint64_t result;

  v5 = *v2;
  v6 = *((_QWORD *)v2 + 2);
  result = sub_1AC68E218((uint64_t)(v2 + 24), a1 + 24);
  *(_BYTE *)a1 = v5;
  *(double *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = v6;
  return result;
}

double Separator.trailingInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void Separator.trailingInset.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

double (*Separator.trailingInset.modify())(void)
{
  return nullsub_1;
}

uint64_t Separator.withTrailingInset(_:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  char *v2;
  char v5;
  uint64_t v6;
  uint64_t result;

  v5 = *v2;
  v6 = *((_QWORD *)v2 + 1);
  result = sub_1AC68E218((uint64_t)(v2 + 24), a1 + 24);
  *(_BYTE *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(double *)(a1 + 16) = a2;
  return result;
}

uint64_t Separator.withInsets(of:)@<X0>(uint64_t a1@<X8>, double a2@<D1>, double a3@<D3>)
{
  char *v3;
  char v7;
  uint64_t result;

  v7 = *v3;
  result = sub_1AC68E218((uint64_t)(v3 + 24), a1 + 24);
  *(_BYTE *)a1 = v7;
  *(double *)(a1 + 8) = a2;
  *(double *)(a1 + 16) = a3;
  return result;
}

uint64_t Separator.verticalOutset.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1 + 24, a1);
}

uint64_t Separator.verticalOutset.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 24;
  __swift_destroy_boxed_opaque_existential_1(v3);
  return sub_1AC68AAA4(a1, v3);
}

double (*Separator.verticalOutset.modify())(void)
{
  return nullsub_1;
}

uint64_t Separator.withVerticalOutset(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char *v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *v2;
  v5 = *((_QWORD *)v2 + 1);
  v6 = *((_QWORD *)v2 + 2);
  result = sub_1AC68E218(a1, a2 + 24);
  *(_BYTE *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v6;
  return result;
}

double Separator.height(in:)(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  char v10;
  double v11;
  double v12;
  double v13;
  float v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v21;

  v3 = sub_1AC726A48();
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)&v5 = MEMORY[0x1E0C80A78](v3).n128_u64[0];
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_traitCollection, v5);
  v9 = objc_msgSend(v8, sel_preferredContentSizeCategory);
  v10 = sub_1AC726670();

  if ((v10 & 1) != 0)
  {

    v11 = 1.0;
  }
  else
  {
    objc_msgSend(v8, sel_displayScale);
    if (v12 <= 0.0)
    {
      v14 = ForJetUIOnly_MainScreenScale();

      v13 = v14;
    }
    else
    {
      v13 = v12;

    }
    v11 = 1.0 / v13;
  }
  v15 = v1 + 3;
  v17 = v1[6];
  v16 = v1[7];
  __swift_project_boxed_opaque_existential_1(v15, v17);
  sub_1AC68E57C((uint64_t)v7);
  AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v7, v17, v16);
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v11 + v19 + v19;
}

BOOL static Separator.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[8];
  _BYTE v12[16];
  double v13;
  _BYTE v14[8];
  double v15;
  _BYTE v16[8];
  double v17;

  v4 = *a1;
  v5 = *a2;
  sub_1AC7189F8((uint64_t)a1, (uint64_t)v16);
  sub_1AC7189F8((uint64_t)a2, (uint64_t)v14);
  if (v4 == v5)
  {
    v6 = v17;
    sub_1AC718A4C((uint64_t)v16);
    v7 = v15;
    sub_1AC718A4C((uint64_t)v14);
    sub_1AC7189F8((uint64_t)a1, (uint64_t)v12);
    sub_1AC7189F8((uint64_t)a2, (uint64_t)v11);
    if (v6 == v7)
    {
      v8 = v13;
      sub_1AC718A4C((uint64_t)v12);
      v9 = *(double *)&v11[2];
      sub_1AC718A4C((uint64_t)v11);
      return v8 == v9;
    }
  }
  else
  {
    sub_1AC718A4C((uint64_t)v14);
    sub_1AC718A4C((uint64_t)v16);
    sub_1AC7189F8((uint64_t)a1, (uint64_t)v12);
    sub_1AC7189F8((uint64_t)a2, (uint64_t)v11);
  }
  sub_1AC718A4C((uint64_t)v11);
  sub_1AC718A4C((uint64_t)v12);
  return 0;
}

double CGSize.add(separator:in:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  double result;

  result = Separator.height(in:)(a2) + *(double *)(v2 + 8);
  *(double *)(v2 + 8) = result;
  return result;
}

double CGSize.adding(separator:in:)(double a1, uint64_t a2, void *a3)
{
  Separator.height(in:)(a3);
  return a1;
}

double CGRect.inset(bySeparator:in:)(_BYTE *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  double result;

  v3 = v2;
  result = Separator.height(in:)(a2);
  *(double *)(v3 + 24) = *(double *)(v3 + 24) - result;
  if ((*a1 & 1) == 0)
  {
    result = result + *(double *)(v3 + 8);
    *(double *)(v3 + 8) = result;
  }
  return result;
}

double CGRect.insetting(bySeparator:in:)(double a1, uint64_t a2, void *a3)
{
  Separator.height(in:)(a3);
  return a1;
}

double JUMeasurements.add(separator:in:)(_BYTE *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  double v5;
  uint64_t v6;
  double result;

  v3 = v2;
  v5 = Separator.height(in:)(a2);
  *(double *)(v3 + 8) = v5 + *(double *)(v3 + 8);
  v6 = 16;
  if (*a1)
    v6 = 24;
  result = v5 + *(double *)(v3 + v6);
  *(double *)(v3 + v6) = result;
  return result;
}

double JUMeasurements.adding(separator:in:)(double a1, uint64_t a2, void *a3)
{
  Separator.height(in:)(a3);
  return a1;
}

uint64_t sub_1AC7189F8(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  *(_BYTE *)a2 = *(_BYTE *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 48) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2 + 24, a1 + 24);
  return a2;
}

uint64_t sub_1AC718A4C(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  return a1;
}

unint64_t sub_1AC718A78()
{
  unint64_t result;

  result = qword_1EEC8B940;
  if (!qword_1EEC8B940)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for Separator.Position, &type metadata for Separator.Position);
    atomic_store(result, (unint64_t *)&qword_1EEC8B940);
  }
  return result;
}

uint64_t initializeWithCopy for Separator(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 24, a2 + 24);
  return a1;
}

uint64_t assignWithCopy for Separator(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  return a1;
}

uint64_t assignWithTake for Separator(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for Separator(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Separator(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Separator.Position(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC718C8C + 4 * byte_1AC72F421[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AC718CC0 + 4 * byte_1AC72F41C[v4]))();
}

uint64_t sub_1AC718CC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC718CC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC718CD0);
  return result;
}

uint64_t sub_1AC718CDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC718CE4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AC718CE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC718CF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC718CFC(uint64_t a1)
{
  _QWORD v3[5];
  uint64_t v4;
  unint64_t v5;

  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_1AC726868();
  v4 = 0;
  v5 = 0xE000000000000000;
  sub_1AC7262C8();
  swift_beginAccess();
  sub_1AC68E218(a1 + 16, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BDBD0);
  sub_1AC726904();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  sub_1AC7262C8();
  return v4;
}

uint64_t sub_1AC718DC4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v6);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1AC718E48(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC68E218(v3, (uint64_t)v7);
  v4 = v8;
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1AC718ECC(_QWORD *a1))(uint64_t *a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v4 = *v1;
  v3[9] = *v1;
  v5 = v4 + 16;
  swift_beginAccess();
  sub_1AC68E218(v5, (uint64_t)v3);
  v6 = v3[3];
  v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  v3[8] = v8;
  return sub_1AC718F6C;
}

void sub_1AC718F6C(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)*a1;
  v2 = *(_QWORD *)(*a1 + 64);
  sub_1AC68E218(*(_QWORD *)(*a1 + 72) + 16, *a1);
  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  free(v1);
}

uint64_t sub_1AC718FD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v6);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1AC71905C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC68E218(v3, (uint64_t)v7);
  v4 = v8;
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1AC7190E0(_QWORD *a1))(uint64_t *a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v4 = *v1;
  v3[9] = *v1;
  v5 = v4 + 16;
  swift_beginAccess();
  sub_1AC68E218(v5, (uint64_t)v3);
  v6 = v3[3];
  v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 40))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  v3[8] = v8;
  return sub_1AC719180;
}

void sub_1AC719180(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)*a1;
  v2 = *(_QWORD *)(*a1 + 64);
  sub_1AC68E218(*(_QWORD *)(*a1 + 72) + 16, *a1);
  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  free(v1);
}

uint64_t sub_1AC7191EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v6);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 64))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1AC719270(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC68E218(v3, (uint64_t)v7);
  v4 = v8;
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 72))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1AC7192F4(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v4 = *v1;
  v3[9] = *v1;
  v5 = v4 + 16;
  swift_beginAccess();
  sub_1AC68E218(v5, (uint64_t)v3);
  v6 = v3[3];
  v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  v3[8] = v8;
  return sub_1AC719394;
}

void sub_1AC719394(uint64_t *a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void *, uint64_t, uint64_t);
  id v8;

  v3 = *a1;
  v4 = *(void **)(*a1 + 64);
  sub_1AC68E218(*(_QWORD *)(*a1 + 72) + 16, *a1);
  v5 = *(_QWORD *)(v3 + 24);
  v6 = *(_QWORD *)(v3 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v3, v5);
  v7 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 72);
  if ((a2 & 1) != 0)
  {
    v8 = v4;
    v7(v4, v5, v6);
    __swift_destroy_boxed_opaque_existential_1(v3);

  }
  else
  {
    v7(v4, v5, v6);
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  free((void *)v3);
}

uint64_t sub_1AC71944C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v5);
  v2 = v6;
  v3 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v2 & 1;
}

double sub_1AC7194D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v6);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(double (**)(uint64_t, uint64_t))(v3 + 96))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1AC71957C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v6);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 104))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1AC719600()
{
  uint64_t *v0;

  return sub_1AC718CFC(*v0);
}

void (*sub_1AC719608(double **a1))(uint64_t *a1)
{
  double *v1;
  double *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (double *)malloc(0x68uLL);
  *a1 = v3;
  v4 = *v1;
  v3[12] = *v1;
  v5 = *(_QWORD *)&v4 + 16;
  swift_beginAccess();
  sub_1AC68E218(v5, (uint64_t)v3);
  v6 = *((_QWORD *)v3 + 3);
  v7 = *((_QWORD *)v3 + 4);
  __swift_project_boxed_opaque_existential_1(v3, v6);
  v8 = (*(double (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 16))(v6);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  v3[5] = v8;
  *((_QWORD *)v3 + 6) = v10;
  v3 += 5;
  *((_QWORD *)v3 + 2) = v12;
  *((_QWORD *)v3 + 3) = v14;
  return sub_1AC7196C8;
}

void sub_1AC7196C8(uint64_t *a1)
{
  _QWORD *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (_QWORD *)*a1;
  v2 = *(double *)(*a1 + 40);
  v3 = *(double *)(*a1 + 48);
  v4 = *(double *)(*a1 + 56);
  v5 = *(double *)(*a1 + 64);
  sub_1AC68E218(*(_QWORD *)(*a1 + 96) + 16, *a1);
  v7 = v1[3];
  v6 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v7);
  (*(void (**)(uint64_t, double, double, double, double))(*(_QWORD *)(v6 + 8) + 24))(v7, v2, v3, v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  free(v1);
}

uint64_t sub_1AC719754()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v5);
  v2 = v6;
  v3 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 40))(v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v2 & 1;
}

uint64_t sub_1AC7197D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v3 = *v1 + 16;
  swift_beginAccess();
  sub_1AC68E218(v3, (uint64_t)v7);
  v4 = v8;
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 + 8) + 48))(a1, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1AC719854(_QWORD *a1))(uint64_t *a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v4 = *v1;
  v3[8] = *v1;
  v5 = v4 + 16;
  swift_beginAccess();
  sub_1AC68E218(v5, (uint64_t)v3);
  v6 = v3[3];
  v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  LOBYTE(v6) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 40))(v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  *((_BYTE *)v3 + 72) = v6 & 1;
  return sub_1AC7198F8;
}

void sub_1AC7198F8(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)*a1;
  v2 = *(unsigned __int8 *)(*a1 + 72);
  sub_1AC68E218(*(_QWORD *)(*a1 + 64) + 16, *a1);
  v3 = v1[3];
  v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 + 8) + 48))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  free(v1);
}

double sub_1AC719968()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v1 = *v0 + 16;
  swift_beginAccess();
  sub_1AC68E218(v1, (uint64_t)v6);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(double (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 72))(v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

ValueMetadata *type metadata accessor for LanguageAwareLayoutTextView()
{
  return &type metadata for LanguageAwareLayoutTextView;
}

id UILabel.hasContent.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  result = objc_msgSend(v0, sel_text);
  if (result)
  {
    v2 = result;
    v3 = sub_1AC72622C();
    v5 = v4;

    swift_bridgeObjectRelease();
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v3 & 0xFFFFFFFFFFFFLL;
    return (id)(v6 != 0);
  }
  return result;
}

uint64_t UILabel.isTextExtraTall.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;

  v1 = objc_msgSend(v0, sel_text);
  if (!v1)
    return 0;
  v2 = v1;
  sub_1AC72622C();

  if (qword_1ED0BE2A8 != -1)
    swift_once();
  v3 = sub_1AC725854();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED0BE180);
  sub_1AC68F334();
  v4 = 1;
  sub_1AC726700();
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 0;
  return v4;
}

double UILabel.languageAwareOutsets.getter()
{
  void *v0;
  double v1;

  objc_msgSend(v0, sel__contentInsetsFromFonts);
  return fabs(v1);
}

uint64_t sub_1AC719BA0(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  v2 = objc_msgSend(v1, sel_text);
  if (v2)
  {
    v3 = v2;
    sub_1AC72622C();

    v4 = sub_1AC7262B0();
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {

    return 0;
  }
}

id UILabel.textLength.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend(v0, sel_text);
  if (result)
  {
    v2 = result;
    sub_1AC72622C();

    v3 = sub_1AC7262B0();
    swift_bridgeObjectRelease();
    return (id)v3;
  }
  return result;
}

id sub_1AC719C8C()
{
  id *v0;

  return objc_msgSend(*v0, sel_numberOfLines);
}

id (*sub_1AC719C9C(_QWORD *a1))(uint64_t a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = objc_msgSend(v3, sel_numberOfLines);
  return sub_1AC719CDC;
}

id sub_1AC719CDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setNumberOfLines_, *(_QWORD *)a1);
}

id sub_1AC719CF0()
{
  id *v0;

  return objc_msgSend(*v0, sel_lineBreakMode);
}

id (*sub_1AC719D00(_QWORD *a1))(uint64_t a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = objc_msgSend(v3, sel_lineBreakMode);
  return sub_1AC719D40;
}

id sub_1AC719D40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setLineBreakMode_, *(_QWORD *)a1);
}

void (*sub_1AC719D54(_QWORD *a1))(id *a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = objc_msgSend(v3, sel_font);
  return sub_1AC719D9C;
}

void sub_1AC719D9C(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setFont_);

}

id sub_1AC719DD0()
{
  id *v0;

  return objc_msgSend(*v0, sel_jet_textLength);
}

JetUI::_LayoutAlignment __swiftcall _LayoutAlignment.init(horizontal:vertical:)(JetUI::_LayoutAlignment::Horizontal horizontal, JetUI::_LayoutAlignment::Vertical vertical)
{
  _BYTE *v2;
  char v3;
  JetUI::_LayoutAlignment result;

  v3 = *(_BYTE *)vertical;
  *v2 = *(_BYTE *)horizontal;
  v2[1] = v3;
  result.horizontal = horizontal;
  return result;
}

void static _LayoutAlignment.unspecified.getter(_WORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL static _LayoutAlignment.Horizontal.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _LayoutAlignment.Horizontal.hash(into:)()
{
  return sub_1AC726B08();
}

void _LayoutAlignment.horizontal.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *_LayoutAlignment.horizontal.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

double (*_LayoutAlignment.horizontal.modify())(void)
{
  return nullsub_1;
}

void _LayoutAlignment.vertical.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

_BYTE *_LayoutAlignment.vertical.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = *result;
  return result;
}

double (*_LayoutAlignment.vertical.modify())(void)
{
  return nullsub_1;
}

BOOL static _LayoutAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

unint64_t sub_1AC719EB4()
{
  unint64_t result;

  result = qword_1EEC8B948;
  if (!qword_1EEC8B948)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for _LayoutAlignment.Horizontal, &type metadata for _LayoutAlignment.Horizontal);
    atomic_store(result, (unint64_t *)&qword_1EEC8B948);
  }
  return result;
}

unint64_t sub_1AC719EFC()
{
  unint64_t result;

  result = qword_1EEC8B950;
  if (!qword_1EEC8B950)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for _LayoutAlignment.Vertical, &type metadata for _LayoutAlignment.Vertical);
    atomic_store(result, (unint64_t *)&qword_1EEC8B950);
  }
  return result;
}

BOOL sub_1AC719F40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _LayoutAlignment(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65283 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65283 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65283;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65283;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65283;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for _LayoutAlignment(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65283 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65283 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1AC71A04C + 4 * byte_1AC72F585[v4]))();
  *a1 = a2 - 253;
  return ((uint64_t (*)(void))((char *)sub_1AC71A080 + 4 * byte_1AC72F580[v4]))();
}

uint64_t sub_1AC71A080(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1AC71A088(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x1AC71A090);
  return result;
}

uint64_t sub_1AC71A09C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x1AC71A0A4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AC71A0A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1AC71A0B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for _LayoutAlignment()
{
  return &type metadata for _LayoutAlignment;
}

ValueMetadata *type metadata accessor for _LayoutAlignment.Horizontal()
{
  return &type metadata for _LayoutAlignment.Horizontal;
}

uint64_t _s5JetUI16_LayoutAlignmentV10HorizontalOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC71A130 + 4 * byte_1AC72F58F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AC71A164 + 4 * byte_1AC72F58A[v4]))();
}

uint64_t sub_1AC71A164(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71A16C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC71A174);
  return result;
}

uint64_t sub_1AC71A180(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC71A188);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AC71A18C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71A194(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for _LayoutAlignment.Vertical()
{
  return &type metadata for _LayoutAlignment.Vertical;
}

uint64_t dispatch thunk of _AlignableLayout._layoutAlignment(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

BOOL static VerticalFlowLayout.VerticalPlacement.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t VerticalFlowLayout.VerticalPlacement.hash(into:)()
{
  return sub_1AC726B08();
}

uint64_t VerticalFlowLayout.VerticalPlacement.hashValue.getter()
{
  sub_1AC726AFC();
  sub_1AC726B08();
  return sub_1AC726B2C();
}

BOOL static VerticalFlowLayout.HorizontalPlacement.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t VerticalFlowLayout.HorizontalPlacement.hash(into:)()
{
  return sub_1AC726B08();
}

uint64_t VerticalFlowLayout.HorizontalPlacement.hashValue.getter()
{
  sub_1AC726AFC();
  sub_1AC726B08();
  return sub_1AC726B2C();
}

JetUI::VerticalFlowLayout::ExclusionCondition __swiftcall VerticalFlowLayout.ExclusionCondition.init(rawValue:)(JetUI::VerticalFlowLayout::ExclusionCondition rawValue)
{
  JetUI::VerticalFlowLayout::ExclusionCondition *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t VerticalFlowLayout.ExclusionCondition.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static VerticalFlowLayout.ExclusionCondition.isHidden.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

uint64_t static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, char *a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X8>)
{
  char v10;
  char v11;
  uint64_t v12;
  uint64_t result;

  v10 = *a4;
  v11 = *a5;
  v12 = *a6;
  sub_1AC68E218(a1, a7);
  sub_1AC68E218(a2, a7 + 40);
  result = sub_1AC6A6A94(a3, a7 + 80);
  *(_BYTE *)(a7 + 120) = v10;
  *(_BYTE *)(a7 + 121) = v11;
  *(_QWORD *)(a7 + 128) = v12;
  return result;
}

uint64_t VerticalFlowLayout.Child.view.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1, a1);
}

uint64_t VerticalFlowLayout.Child.topSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1 + 40, a1);
}

uint64_t VerticalFlowLayout.Child.bottomSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6A6A94(v1 + 80, a1);
}

void VerticalFlowLayout.Child.verticalPlacement.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 120);
}

void VerticalFlowLayout.Child.horizontalPlacement.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 121);
}

void VerticalFlowLayout.Child.excludeWhen.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 128);
}

JetUI::VerticalFlowLayout __swiftcall VerticalFlowLayout.init(expandChildrenToFit:children:)(Swift::Bool expandChildrenToFit, Swift::OpaquePointer children)
{
  uint64_t v2;
  JetUI::VerticalFlowLayout result;

  *(_BYTE *)v2 = expandChildrenToFit;
  *(Swift::OpaquePointer *)(v2 + 8) = children;
  result.children = children;
  result.expandChildrenToFit = expandChildrenToFit;
  return result;
}

uint64_t VerticalFlowLayout.expandChildrenToFit.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t VerticalFlowLayout.expandChildrenToFit.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

double (*VerticalFlowLayout.expandChildrenToFit.modify())(void)
{
  return nullsub_1;
}

uint64_t VerticalFlowLayout.children.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 VerticalFlowLayout.addChild(_:)(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;
  _OWORD v12[8];
  uint64_t v13;

  sub_1AC6A477C(a1, (uint64_t)v12);
  v2 = *(char **)(v1 + 8);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1AC6A34AC(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_1AC6A34AC((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v5 = &v2[136 * v4];
  *((_OWORD *)v5 + 2) = v12[0];
  v6 = v12[1];
  v7 = v12[2];
  v8 = v12[4];
  *((_OWORD *)v5 + 5) = v12[3];
  *((_OWORD *)v5 + 6) = v8;
  *((_OWORD *)v5 + 3) = v6;
  *((_OWORD *)v5 + 4) = v7;
  result = (__n128)v12[5];
  v10 = v12[6];
  v11 = v12[7];
  *((_QWORD *)v5 + 20) = v13;
  *((_OWORD *)v5 + 8) = v10;
  *((_OWORD *)v5 + 9) = v11;
  *((__n128 *)v5 + 7) = result;
  *(_QWORD *)(v1 + 8) = v2;
  return result;
}

unint64_t VerticalFlowLayout.insertChild(_:at:)(unint64_t result, int64_t a2)
{
  uint64_t v2;
  _BYTE v4[136];

  if (*(_QWORD *)(*(_QWORD *)(v2 + 8) + 16) < a2)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0)
  {
    sub_1AC6A477C(result, (uint64_t)v4);
    return sub_1AC6A4628(a2, a2, (uint64_t)v4);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall VerticalFlowLayout.removeChild(at:)(Swift::Int at)
{
  _BYTE v1[136];

  sub_1AC6BAF0C(at, (uint64_t)v1);
  sub_1AC71B1F8((uint64_t)v1);
}

Swift::Void __swiftcall VerticalFlowLayout.removeAllChildren()()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 8) = MEMORY[0x1E0DEE9D8];
}

void VerticalFlowLayout.measurements(fitting:in:)(uint64_t a1, double a2, double a3)
{
  unsigned __int8 *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  double v39;
  char v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  _DWORD v51[4];
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  int v61;
  double v62;
  _QWORD v63[3];
  uint64_t v64;
  uint64_t v65;
  char v66;
  _BYTE v67[136];
  _QWORD v68[3];
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[3];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  char v79;

  v7 = sub_1AC726A48();
  v57 = *(_QWORD *)(v7 - 8);
  v58 = v7;
  MEMORY[0x1E0C80A78](v7);
  v56 = (uint64_t)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *((_QWORD *)v3 + 1);
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v51[3] = *v3;
    v54 = &v77;
    v55 = &v74;
    swift_bridgeObjectRetain();
    v11 = 0;
    v12 = 0;
    v13 = v9 + 32;
    v62 = 0.0;
    v14 = 0.0;
    v59 = 0.0;
    v15 = 0.0;
    v52 = v9 + 32;
    v53 = v10 - 1;
LABEL_4:
    v61 = v11;
    v60 = v14;
    v16 = v13 + 136 * v12;
    v17 = v12;
    while (1)
    {
      if (v17 >= *(_QWORD *)(v9 + 16))
      {
        __break(1u);
        return;
      }
      sub_1AC6A477C(v16, (uint64_t)v71);
      v18 = v72;
      v19 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      v20 = (*(double (**)(uint64_t, uint64_t, double, double))(*(_QWORD *)(v19 + 8) + 8))(a1, v18, a2, a3);
      v22 = v21;
      v24 = v23;
      v14 = v25;
      v26 = v79;
      sub_1AC6A477C((uint64_t)v71, (uint64_t)v68);
      if ((v26 & 2) != 0)
      {
        v28 = v69;
        v27 = v70;
        __swift_project_boxed_opaque_existential_1(v68, v69);
        v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 64))(v28, v27);
        sub_1AC71B1F8((uint64_t)v68);
        sub_1AC6A477C((uint64_t)v71, (uint64_t)v67);
        if ((v29 & 1) == 0)
        {
          sub_1AC71B1F8((uint64_t)v67);
          sub_1AC6A477C((uint64_t)v71, (uint64_t)v63);
LABEL_6:
          sub_1AC71B1F8((uint64_t)v63);
          goto LABEL_7;
        }
      }
      else
      {
        sub_1AC71B1F8((uint64_t)v68);
        sub_1AC6A477C((uint64_t)v71, (uint64_t)v67);
      }
      v30 = v67[128];
      sub_1AC6A477C((uint64_t)v67, (uint64_t)v63);
      if ((v30 & 1) != 0)
      {
        v31 = v64;
        v32 = v65;
        __swift_project_boxed_opaque_existential_1(v63, v64);
        v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 40))(v31, v32);
        sub_1AC71B1F8((uint64_t)v67);
        sub_1AC71B1F8((uint64_t)v63);
        sub_1AC6A477C((uint64_t)v71, (uint64_t)v63);
        if ((v33 & 1) != 0)
          goto LABEL_6;
      }
      else
      {
        sub_1AC71B1F8((uint64_t)v67);
        sub_1AC71B1F8((uint64_t)v63);
        sub_1AC6A477C((uint64_t)v71, (uint64_t)v63);
      }
      if ((v66 & 8) == 0)
      {
        sub_1AC71B1F8((uint64_t)v63);
LABEL_19:
        v34 = v78;
        v35 = v75;
        v36 = v76;
        __swift_project_boxed_opaque_existential_1(v55, v75);
        if ((v34 & 1) != 0)
        {
          v37 = AnyDimension.topMargin(from:in:)(a1, v35, v36, v20, v22, v24);
        }
        else
        {
          v38 = v56;
          sub_1AC68E57C(v56);
          AnyDimension.value(in:rounded:)(a1, v38, v35, v36);
          v37 = v39;
          (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v38, v58);
        }
        v40 = v61;
        v41 = 0.0;
        if (v37 >= 0.0)
          v41 = v37;
        v42 = v22 + floor(v62 + v41);
        if (v20 > v15)
          v15 = v20;
        sub_1AC6A6A94((uint64_t)v54, (uint64_t)v68);
        v43 = v69;
        if (v69)
        {
          v44 = v70;
          __swift_project_boxed_opaque_existential_1(v68, v69);
          v45 = AnyDimension.bottomMargin(from:in:)(a1, v43, v44, v20, v22, v24, v14);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
          v62 = v42 + v45;
          if ((v40 & 1) == 0)
            goto LABEL_30;
        }
        else
        {
          sub_1AC6A6C44((uint64_t)v68);
          v62 = v42 - v14;
          if ((v40 & 1) == 0)
          {
LABEL_30:
            v59 = v24;
            if ((v78 & 1) == 0)
            {
              v46 = v75;
              v47 = v76;
              __swift_project_boxed_opaque_existential_1(v55, v75);
              v48 = v56;
              sub_1AC68E57C(v56);
              AnyDimension.value(in:rounded:)(a1, v48, v46, v47);
              v50 = v49;
              (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v48, v58);
              v59 = v24 + v50;
            }
          }
        }
        v12 = v17 + 1;
        sub_1AC71B1F8((uint64_t)v71);
        v11 = 1;
        v13 = v52;
        if (v53 != v17)
          goto LABEL_4;
LABEL_32:
        swift_bridgeObjectRelease();
        return;
      }
      sub_1AC71B1F8((uint64_t)v63);
      if (v22 >= COERCE_DOUBLE(1))
        goto LABEL_19;
LABEL_7:
      ++v17;
      sub_1AC71B1F8((uint64_t)v71);
      v16 += 136;
      if (v10 == v17)
        goto LABEL_32;
    }
  }
}

void VerticalFlowLayout.placeChildren(relativeTo:in:)(void *a1@<X0>, CGFloat *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  unsigned __int8 *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double MinY;
  uint64_t v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;
  CGFloat d;
  CGFloat tx;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double MinX;
  char v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  double v53;
  double v54;
  CGFloat v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  __n128 v60;
  __n128 v61;
  __n128 v62;
  __n128 v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  uint64_t v67;
  uint64_t v68;
  double MaxX;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat MaxY;
  double v78;
  double v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  char v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  CGFloat v93;
  CGFloat ty;
  CGFloat v95;
  __int128 v96;
  CGFloat *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  CGFloat v106;
  CGFloat v107;
  double v108;
  int v109;
  __int128 v110;
  double v111;
  double Width;
  double v113;
  CGFloat v114;
  _QWORD v115[3];
  uint64_t v116;
  uint64_t v117;
  char v118;
  CGAffineTransform v119[2];
  char v120;
  CGAffineTransform v121;
  _QWORD v122[3];
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  char v130;
  char v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  v13 = sub_1AC726A48();
  v103 = *(_QWORD *)(v13 - 8);
  v104 = v13;
  MEMORY[0x1E0C80A78](v13);
  v102 = (uint64_t)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = *v6;
  v15 = *((_QWORD *)v6 + 1);
  v114 = a3;
  v132.origin.x = a3;
  v132.origin.y = a4;
  v132.size.width = a5;
  v132.size.height = a6;
  MinY = CGRectGetMinY(v132);
  v17 = *(_QWORD *)(v15 + 16);
  if (v17)
  {
    *(double *)&v110 = MinY;
    v113 = a4;
    v97 = a2;
    v100 = &v128;
    v101 = &v125;
    swift_bridgeObjectRetain();
    v18 = 0;
    v19 = 0;
    v20 = v15 + 32;
    v21 = 0.0;
    v108 = 0.0;
    v22 = 0.0;
    v111 = 0.0;
    v98 = v15 + 32;
    v99 = v17 - 1;
LABEL_4:
    v109 = v18;
    v23 = v21;
    v24 = v20 + 136 * v19;
    v25 = v19;
    while (1)
    {
      if (v25 >= *(_QWORD *)(v15 + 16))
      {
        __break(1u);
        return;
      }
      sub_1AC6A477C(v24, (uint64_t)v122);
      v26 = v123;
      v27 = v124;
      __swift_project_boxed_opaque_existential_1(v122, v123);
      v28 = (*(double (**)(void *, uint64_t, CGFloat, CGFloat))(*(_QWORD *)(v27 + 8) + 8))(a1, v26, a5, a6);
      v30 = v29;
      v32 = v31;
      v21 = v33;
      v34 = v131;
      sub_1AC6A477C((uint64_t)v122, (uint64_t)&v121);
      if ((v34 & 2) != 0)
      {
        d = v121.d;
        tx = v121.tx;
        __swift_project_boxed_opaque_existential_1(&v121, *(uint64_t *)&v121.d);
        v37 = (*(uint64_t (**)(CGFloat, CGFloat))(*(_QWORD *)&tx + 64))(COERCE_CGFLOAT(*(_QWORD *)&d), COERCE_CGFLOAT(*(_QWORD *)&tx));
        sub_1AC71B1F8((uint64_t)&v121);
        sub_1AC6A477C((uint64_t)v122, (uint64_t)v119);
        if ((v37 & 1) == 0)
        {
          sub_1AC71B1F8((uint64_t)v119);
          sub_1AC6A477C((uint64_t)v122, (uint64_t)v115);
LABEL_6:
          sub_1AC71B1F8((uint64_t)v115);
          goto LABEL_7;
        }
      }
      else
      {
        sub_1AC71B1F8((uint64_t)&v121);
        sub_1AC6A477C((uint64_t)v122, (uint64_t)v119);
      }
      v38 = v120;
      sub_1AC6A477C((uint64_t)v119, (uint64_t)v115);
      if ((v38 & 1) != 0)
      {
        v39 = v116;
        v40 = v117;
        __swift_project_boxed_opaque_existential_1(v115, v116);
        v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 40))(v39, v40);
        sub_1AC71B1F8((uint64_t)v119);
        sub_1AC71B1F8((uint64_t)v115);
        sub_1AC6A477C((uint64_t)v122, (uint64_t)v115);
        if ((v41 & 1) != 0)
          goto LABEL_6;
      }
      else
      {
        sub_1AC71B1F8((uint64_t)v119);
        sub_1AC71B1F8((uint64_t)v115);
        sub_1AC6A477C((uint64_t)v122, (uint64_t)v115);
      }
      if ((v118 & 8) == 0)
      {
        sub_1AC71B1F8((uint64_t)v115);
LABEL_19:
        Width = v28;
        v42 = v113;
        if (v105)
        {
          v133.origin.x = v114;
          v133.origin.y = v113;
          v133.size.width = a5;
          v133.size.height = a6;
          Width = CGRectGetWidth(v133);
        }
        if (v130)
        {
          v43 = v114;
          v44 = v42;
          v45 = a5;
          v46 = a6;
          if (v130 == 1)
            MinX = floor(CGRectGetMidX(*(CGRect *)&v43) + Width * -0.5);
          else
            MinX = CGRectGetMaxX(*(CGRect *)&v43) - Width;
        }
        else
        {
          v134.origin.x = v114;
          v134.origin.y = v42;
          v134.size.width = a5;
          v134.size.height = a6;
          MinX = CGRectGetMinX(v134);
        }
        v48 = v129;
        v49 = v126;
        v50 = v127;
        __swift_project_boxed_opaque_existential_1(v101, v126);
        if ((v48 & 1) != 0)
        {
          v51 = AnyDimension.topMargin(from:in:)((uint64_t)a1, v49, v50, v28, v30, v32);
        }
        else
        {
          v52 = v102;
          sub_1AC68E57C(v102);
          AnyDimension.value(in:rounded:)((uint64_t)a1, v52, v49, v50);
          v51 = v53;
          (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v52, v104);
        }
        v54 = 0.0;
        if (v51 >= 0.0)
          v54 = v51;
        v55 = floor(*(double *)&v110 + v54);
        v56 = v123;
        v57 = v124;
        __swift_project_boxed_opaque_existential_1(v122, v123);
        v58 = objc_msgSend(a1, sel_traitCollection);
        v59 = objc_msgSend(v58, sel_layoutDirection);

        v106 = v55;
        v107 = MinX;
        v60.n128_f64[0] = MinX;
        v61.n128_f64[0] = v55;
        v62.n128_f64[0] = Width;
        v63.n128_f64[0] = v30;
        if (v59 == (id)1)
        {
          CGAffineTransformMakeScale(&v121, -1.0, 1.0);
          v110 = *(_OWORD *)&v121.a;
          v96 = *(_OWORD *)&v121.c;
          ty = v121.ty;
          v95 = v121.tx;
          v65 = v113;
          v64 = v114;
          v135.origin.x = v114;
          v135.origin.y = v113;
          v135.size.width = a5;
          v135.size.height = a6;
          v93 = CGRectGetMinX(v135);
          v136.origin.x = v64;
          v136.origin.y = v65;
          v136.size.width = a5;
          v136.size.height = a6;
          v66 = -(v93 + CGRectGetMaxX(v136));
          *(_OWORD *)&v121.a = v110;
          *(_OWORD *)&v121.c = v96;
          v121.tx = v95;
          v121.ty = ty;
          CGAffineTransformTranslate(v119, &v121, v66, 0.0);
          v121 = v119[0];
          v137.origin.y = v106;
          v137.origin.x = v107;
          v137.size.width = Width;
          v137.size.height = v30;
          *(CGRect *)v60.n128_u64 = CGRectApplyAffineTransform(v137, &v121);
        }
        (*(void (**)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v57 + 24))(v56, v57, v60, v61, v62, v63);
        v67 = v123;
        v68 = v124;
        __swift_project_boxed_opaque_existential_1(v122, v123);
        v138.origin.x = (*(double (**)(uint64_t, uint64_t))(v68 + 16))(v67, v68);
        MaxX = CGRectGetMaxX(v138);
        v139.origin.y = v113;
        v139.origin.x = v114;
        v139.size.width = a5;
        v139.size.height = a6;
        v70 = MaxX - CGRectGetMinX(v139);
        v71 = v111;
        if (v70 > v111)
          v71 = v70;
        v111 = v71;
        sub_1AC6A6A94((uint64_t)v100, (uint64_t)&v121);
        v72 = *(_QWORD *)&v121.d;
        if (*(_QWORD *)&v121.d)
        {
          v73 = *(_QWORD *)&v121.tx;
          __swift_project_boxed_opaque_existential_1(&v121, *(uint64_t *)&v121.d);
          v95 = AnyDimension.bottomMargin(from:in:)((uint64_t)a1, v72, v73, v28, v30, v32, v21);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v121);
          v74 = v106;
          v75 = v107;
          v140.origin.x = v107;
          v140.origin.y = v106;
          v76 = Width;
          v140.size.width = Width;
          v140.size.height = v30;
          MaxY = CGRectGetMaxY(v140);
          *(CGFloat *)&v96 = a6;
          v78 = v95;
          *(double *)&v110 = v95 + MaxY;
          v141.origin.x = v75;
          v141.origin.y = v74;
          v141.size.width = v76;
          v141.size.height = v30;
          v79 = v78 + CGRectGetMaxY(v141);
          a6 = *(double *)&v96;
        }
        else
        {
          sub_1AC6A6C44((uint64_t)&v121);
          v81 = v106;
          v80 = v107;
          v142.origin.x = v107;
          v142.origin.y = v106;
          v82 = Width;
          v142.size.width = Width;
          v142.size.height = v30;
          *(double *)&v110 = CGRectGetMaxY(v142) - v21;
          v143.origin.x = v80;
          v143.origin.y = v81;
          v143.size.width = v82;
          v143.size.height = v30;
          v79 = CGRectGetMaxY(v143);
        }
        v83 = v109;
        v144.origin.y = v113;
        v144.origin.x = v114;
        v144.size.width = a5;
        v144.size.height = a6;
        v84 = CGRectGetMinY(v144);
        if ((v83 & 1) == 0)
        {
          v108 = v32;
          if ((v129 & 1) == 0)
          {
            v85 = v126;
            v86 = v127;
            __swift_project_boxed_opaque_existential_1(v101, v126);
            v87 = v102;
            sub_1AC68E57C(v102);
            AnyDimension.value(in:rounded:)((uint64_t)a1, v87, v85, v86);
            v89 = v88;
            (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v87, v104);
            v108 = v32 + v89;
          }
        }
        v19 = v25 + 1;
        v22 = v79 - v84;
        sub_1AC71B1F8((uint64_t)v122);
        v18 = 1;
        v20 = v98;
        if (v99 == v25)
          goto LABEL_42;
        goto LABEL_4;
      }
      sub_1AC71B1F8((uint64_t)v115);
      if (v30 >= COERCE_DOUBLE(1))
        goto LABEL_19;
LABEL_7:
      ++v25;
      sub_1AC71B1F8((uint64_t)v122);
      v24 += 136;
      if (v17 == v25)
      {
        v21 = v23;
LABEL_42:
        swift_bridgeObjectRelease();
        a2 = v97;
        a4 = v113;
        v90 = v111;
        v91 = v108;
        goto LABEL_44;
      }
    }
  }
  v21 = 0.0;
  v91 = 0.0;
  v22 = 0.0;
  v90 = 0.0;
LABEL_44:
  *a2 = v114;
  a2[1] = a4;
  a2[2] = v90;
  a2[3] = v22;
  a2[4] = v91;
  a2[5] = v21;
}

uint64_t sub_1AC71B1F8(uint64_t a1)
{
  destroy for VerticalFlowLayout.Child(a1);
  return a1;
}

unint64_t sub_1AC71B228()
{
  unint64_t result;

  result = qword_1EEC8B958;
  if (!qword_1EEC8B958)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for VerticalFlowLayout.VerticalPlacement, &type metadata for VerticalFlowLayout.VerticalPlacement);
    atomic_store(result, (unint64_t *)&qword_1EEC8B958);
  }
  return result;
}

unint64_t sub_1AC71B270()
{
  unint64_t result;

  result = qword_1EEC8B960;
  if (!qword_1EEC8B960)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for VerticalFlowLayout.HorizontalPlacement, &type metadata for VerticalFlowLayout.HorizontalPlacement);
    atomic_store(result, (unint64_t *)&qword_1EEC8B960);
  }
  return result;
}

unint64_t sub_1AC71B2B8()
{
  unint64_t result;

  result = qword_1EEC8B968;
  if (!qword_1EEC8B968)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition, &type metadata for VerticalFlowLayout.ExclusionCondition);
    atomic_store(result, (unint64_t *)&qword_1EEC8B968);
  }
  return result;
}

unint64_t sub_1AC71B300()
{
  unint64_t result;

  result = qword_1EEC8B970;
  if (!qword_1EEC8B970)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition, &type metadata for VerticalFlowLayout.ExclusionCondition);
    atomic_store(result, (unint64_t *)&qword_1EEC8B970);
  }
  return result;
}

unint64_t sub_1AC71B348()
{
  unint64_t result;

  result = qword_1ED0BE080;
  if (!qword_1ED0BE080)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition, &type metadata for VerticalFlowLayout.ExclusionCondition);
    atomic_store(result, (unint64_t *)&qword_1ED0BE080);
  }
  return result;
}

unint64_t sub_1AC71B390()
{
  unint64_t result;

  result = qword_1ED0BE088;
  if (!qword_1ED0BE088)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition, &type metadata for VerticalFlowLayout.ExclusionCondition);
    atomic_store(result, (unint64_t *)&qword_1ED0BE088);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VerticalFlowLayout(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VerticalFlowLayout(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for VerticalFlowLayout(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout()
{
  return &type metadata for VerticalFlowLayout;
}

uint64_t storeEnumTagSinglePayload for VerticalFlowLayout.VerticalPlacement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC71B4DC + 4 * byte_1AC72F715[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AC71B510 + 4 * byte_1AC72F710[v4]))();
}

uint64_t sub_1AC71B510(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71B518(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC71B520);
  return result;
}

uint64_t sub_1AC71B52C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC71B534);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AC71B538(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71B540(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout.VerticalPlacement()
{
  return &type metadata for VerticalFlowLayout.VerticalPlacement;
}

uint64_t storeEnumTagSinglePayload for VerticalFlowLayout.HorizontalPlacement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC71B5A8 + 4 * byte_1AC72F71F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1AC71B5DC + 4 * byte_1AC72F71A[v4]))();
}

uint64_t sub_1AC71B5DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71B5E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC71B5ECLL);
  return result;
}

uint64_t sub_1AC71B5F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC71B600);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1AC71B604(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71B60C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout.HorizontalPlacement()
{
  return &type metadata for VerticalFlowLayout.HorizontalPlacement;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout.ExclusionCondition()
{
  return &type metadata for VerticalFlowLayout.ExclusionCondition;
}

uint64_t destroy for VerticalFlowLayout.Child(uint64_t a1)
{
  uint64_t result;

  __swift_destroy_boxed_opaque_existential_1(a1);
  result = __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  if (*(_QWORD *)(a1 + 104))
    return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  return result;
}

uint64_t initializeWithCopy for VerticalFlowLayout.Child(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  v6 = (_OWORD *)(a1 + 80);
  v7 = (_OWORD *)(a2 + 80);
  v8 = *(_QWORD *)(a2 + 104);
  if (v8)
  {
    v9 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v8;
    *(_QWORD *)(a1 + 112) = v9;
    (**(void (***)(_OWORD *, _OWORD *))(v8 - 8))(v6, v7);
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 96);
    *v6 = *v7;
    *(_OWORD *)(a1 + 96) = v10;
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  }
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_BYTE *)(a1 + 121) = *(_BYTE *)(a2 + 121);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  return a1;
}

uint64_t assignWithCopy for VerticalFlowLayout.Child(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  v4 = *(_QWORD *)(a2 + 104);
  if (!*(_QWORD *)(a1 + 104))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 104) = v4;
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 80, a2 + 80);
      goto LABEL_8;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 80);
    v6 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 80) = v5;
    *(_OWORD *)(a1 + 96) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 80);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
LABEL_8:
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_BYTE *)(a1 + 121) = *(_BYTE *)(a2 + 121);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
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
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for VerticalFlowLayout.Child(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 104))
    __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_BYTE *)(a1 + 121) = *(_BYTE *)(a2 + 121);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for VerticalFlowLayout.Child(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 136))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VerticalFlowLayout.Child(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
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
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout.Child()
{
  return &type metadata for VerticalFlowLayout.Child;
}

uint64_t StackChild.subscript.getter()
{
  return swift_getAtKeyPath();
}

JUMeasurements __swiftcall StackChild.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  _QWORD *v2;
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  JUMeasurements result;

  height = toFit.height;
  width = toFit.width;
  v6 = v2[3];
  v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  (*(void (**)(Class, uint64_t, uint64_t, double, double))(v7 + 8))(with.super.isa, v6, v7, width, height);
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

uint64_t StackChild.init(_:with:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_1AC68AAA4(a1, a4);
  v9 = a4 + *(int *)(type metadata accessor for StackChild(0, a3, v7, v8) + 28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(v9, a2, a3);
}

uint64_t StackChild.base.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1, a1);
}

uint64_t StackChild.properties.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 28));
}

uint64_t StackChild.properties.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2 + *(int *)(a2 + 28), a1);
}

double (*StackChild.properties.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_1AC71BA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for StackChild(0, *(_QWORD *)(a4 + a3 - 16), a3, a4);
  swift_retain();
  sub_1AC71BD4C(a1);
  return swift_release();
}

uint64_t StackChild.subscript.setter(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  sub_1AC71BD4C(a1);
  swift_release();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*MEMORY[0x1E0DEC880] + v3 + 8) - 8) + 8))(a1);
}

void (*StackChild.subscript.modify(_QWORD *a1, _QWORD *a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  v8 = *(_QWORD *)(*MEMORY[0x1E0DEC880] + *a2 + 8);
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v7[6] = malloc(v10);
  swift_getAtKeyPath();
  return sub_1AC71BBFC;
}

void sub_1AC71BBFC(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void *, uint64_t);

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 40);
  v4 = *(void **)(*(_QWORD *)a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 40), v4, v5);
    swift_retain();
    sub_1AC71BD4C((uint64_t)v3);
    swift_release();
    v7 = *(void (**)(void *, uint64_t))(v6 + 8);
    v7(v3, v5);
  }
  else
  {
    swift_retain();
    sub_1AC71BD4C((uint64_t)v4);
    swift_release();
    v7 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v7(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

Swift::Void __swiftcall StackChild.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  _QWORD *v2;
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;

  height = at.size.height;
  width = at.size.width;
  y = at.origin.y;
  x = at.origin.x;
  v8 = v2[3];
  v9 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v8);
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v9 + 16))(with.super.isa, v8, v9, x, y, width, height);
}

uint64_t sub_1AC71BD4C(uint64_t a1)
{
  __n128 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *, __n128))(v2 + 16))((char *)&v5 - v3, v1);
  return swift_setAtWritableKeyPath();
}

uint64_t sub_1AC71BDDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for StackChild(0, *(_QWORD *)(a3 + a2 - 16), a3, a4);
  return StackChild.subscript.getter();
}

uint64_t sub_1AC71BE30()
{
  return 16;
}

__n128 sub_1AC71BE3C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

_QWORD *sub_1AC71BE48(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  __int128 v11;

  v4 = (_QWORD *)a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + 40) & (unint64_t)~v7) + *(_QWORD *)(v6 + 64) > 0x18)
  {
    v10 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v10 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v11;
    (**(void (***)(uint64_t, uint64_t *))(v11 - 8))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(((unint64_t)v4 + v7 + 40) & ~v7, ((unint64_t)a2 + v7 + 40) & ~v7, v5);
  }
  return v4;
}

uint64_t *sub_1AC71BF1C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1AC71BF78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v5 + 32))((*(unsigned __int8 *)(v5 + 80) + 40 + a1) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (*(unsigned __int8 *)(v5 + 80) + 40 + a2) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return a1;
}

uint64_t sub_1AC71BFD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(unsigned __int8 *)(v7 + 80) + 40 + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(unsigned __int8 *)(v7 + 80) + 40 + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1AC71C03C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
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
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 40) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v7 + 40) & ~v7);
      v15 = *(_QWORD *)(a1 + 24);
      if (v15 >= 0xFFFFFFFF)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1AC71C110 + 4 * byte_1AC72FA70[(v9 - 1)]))();
}

void sub_1AC71C180(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0u;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

_QWORD *LayoutTextViewPlaceholder.__allocating_init(text:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  _QWORD *v15;
  void **v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;

  v14 = swift_allocObject();
  v15 = (_QWORD *)v14;
  *(_QWORD *)(v14 + 104) = 0;
  v16 = (void **)(v14 + 104);
  if (a2)
    v17 = a1;
  else
    v17 = 0;
  v18 = 0xE000000000000000;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_BYTE *)(v14 + 80) = 0;
  if (a2)
    v18 = a2;
  *(_QWORD *)(v14 + 16) = v17;
  *(_QWORD *)(v14 + 24) = v18;
  swift_beginAccess();
  v19 = *v16;
  *v16 = a3;

  v15[4] = a4;
  v15[5] = a6;
  v15[11] = a7;
  v15[12] = a5;
  return v15;
}

uint64_t LayoutTextViewPlaceholder.text.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LayoutTextViewPlaceholder.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*LayoutTextViewPlaceholder.text.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.textAlignment.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 32);
}

uint64_t LayoutTextViewPlaceholder.textAlignment.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.textAlignment.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.lineSpacing.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 40);
}

uint64_t LayoutTextViewPlaceholder.lineSpacing.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.lineSpacing.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  void *v3;
  id v4;
  id v5;

  sub_1AC726868();
  v1 = sub_1AC726BEC();
  swift_bridgeObjectRelease();
  sub_1AC7262C8();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1AC7262C8();
  swift_bridgeObjectRelease();
  sub_1AC7262C8();
  result = swift_beginAccess();
  v3 = *(void **)(v0 + 104);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v4, sel_description);
    sub_1AC72622C();

    sub_1AC7262C8();
    swift_bridgeObjectRelease();
    sub_1AC7262C8();
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL LayoutTextViewPlaceholder.hasContent.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  return v2 != 0;
}

double _s5JetUI25LayoutTextViewPlaceholderC12focusedFrameSo6CGRectVvg_0()
{
  uint64_t v0;

  swift_beginAccess();
  return *(double *)(v0 + 48);
}

uint64_t LayoutTextViewPlaceholder.frame.setter(double a1, double a2, double a3, double a4)
{
  double *v4;
  uint64_t result;

  result = swift_beginAccess();
  v4[6] = a1;
  v4[7] = a2;
  v4[8] = a3;
  v4[9] = a4;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.frame.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.isHidden.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t LayoutTextViewPlaceholder.isHidden.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 80) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.isHidden.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.numberOfLines.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 88);
}

uint64_t LayoutTextViewPlaceholder.numberOfLines.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 88) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.numberOfLines.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.lineBreakMode.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 96);
}

uint64_t LayoutTextViewPlaceholder.lineBreakMode.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 96) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.lineBreakMode.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *LayoutTextViewPlaceholder.font.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 104);
  v2 = v1;
  return v1;
}

void LayoutTextViewPlaceholder.font.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 104);
  *(_QWORD *)(v1 + 104) = a1;

}

uint64_t (*LayoutTextViewPlaceholder.font.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

BOOL LayoutTextViewPlaceholder.isTextExtraTall.getter()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BOOL8 v3;

  swift_beginAccess();
  v0 = qword_1ED0BE2A8;
  swift_bridgeObjectRetain();
  if (v0 != -1)
    swift_once();
  v1 = sub_1AC725854();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED0BE180);
  sub_1AC68F334();
  sub_1AC726700();
  v3 = (v2 & 1) == 0;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t LayoutTextViewPlaceholder.textLength.getter()
{
  uint64_t v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = sub_1AC7262B0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutTextViewPlaceholder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_1AC71CCD0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(_QWORD *)(v1 + 96);
}

uint64_t sub_1AC71CD0C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 96) = a1;
  return result;
}

void *sub_1AC71CD4C()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(void **)(v1 + 104);
  v3 = v2;
  return v2;
}

void sub_1AC71CD90(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  void *v4;

  v3 = *v1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = a1;

}

uint64_t (*sub_1AC71CDD8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

BOOL sub_1AC71CE18()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BOOL8 v3;

  swift_beginAccess();
  v0 = qword_1ED0BE2A8;
  swift_bridgeObjectRetain();
  if (v0 != -1)
    swift_once();
  v1 = sub_1AC725854();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED0BE180);
  sub_1AC68F334();
  sub_1AC726700();
  v3 = (v2 & 1) == 0;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1AC71CEDC()
{
  uint64_t v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = sub_1AC7262B0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AC71CF3C()
{
  return LayoutTextViewPlaceholder.description.getter();
}

uint64_t sub_1AC71CF60(double a1, double a2, double a3, double a4)
{
  double **v4;
  double *v9;
  uint64_t result;

  v9 = *v4;
  result = swift_beginAccess();
  v9[6] = a1;
  v9[7] = a2;
  v9[8] = a3;
  v9[9] = a4;
  return result;
}

uint64_t (*sub_1AC71CFC0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AC71D000()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 80);
}

uint64_t sub_1AC71D03C(char a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 80) = a1;
  return result;
}

double sub_1AC71D07C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(double *)(v1 + 48);
}

uint64_t method lookup function for LayoutTextViewPlaceholder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LayoutTextViewPlaceholder.__allocating_init(text:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

void __swiftcall NQMLConfiguration.init(font:)(JetUI::NQMLConfiguration *__return_ptr retstr, UIFont font)
{
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;

  v3 = font.super.isa;
  v4 = (objc_class *)sub_1AC6DA8C4();
  v5 = (objc_class *)sub_1AC6DA9F8();
  v6 = (objc_class *)sub_1AC6DA9F8();

  retstr->newline._countAndFlagsBits = 10;
  retstr->newline._object = (void *)0xE100000000000000;
  retstr->font.super.isa = v3;
  retstr->paragraphStyle.super.isa = v4;
  retstr->listItemBullet._countAndFlagsBits = 161644770;
  retstr->listItemBullet._object = (void *)0xA400000000000000;
  retstr->listItemStyle.super.isa = v5;
  retstr->orderedListItemBulletFormat._countAndFlagsBits = 606245;
  retstr->orderedListItemBulletFormat._object = (void *)0xE300000000000000;
  retstr->orderedListItemStyle.super.isa = v6;
  retstr->behavior = JetUI_NQMLConfiguration_Behavior_default;
}

id NSAttributedString.ju_byCollapsingNewlines.getter()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v0);
  v2 = objc_msgSend(v1, sel_length);
  v3 = objc_msgSend(v1, sel_mutableString);
  v4 = (void *)sub_1AC726208();
  v5 = (void *)sub_1AC726208();
  objc_msgSend(v3, sel_replaceOccurrencesOfString_withString_options_range_, v4, v5, 1024, 0, v2);

  return v1;
}

NSAttributedString __swiftcall NSAttributedString.init(ju_nqml:configuration:)(Swift::String ju_nqml, JetUI::NQMLConfiguration *configuration)
{
  void *object;
  uint64_t countAndFlagsBits;
  Class isa;
  uint64_t v5;
  uint64_t v6;
  JetUI::NQMLConfiguration::Behavior behavior;
  id v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  __int128 v15;
  Class v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  JetUI::NQMLConfiguration::Behavior v21;

  object = ju_nqml._object;
  countAndFlagsBits = ju_nqml._countAndFlagsBits;
  isa = configuration->paragraphStyle.super.isa;
  v5 = configuration->listItemBullet._countAndFlagsBits;
  v6 = configuration->orderedListItemBulletFormat._countAndFlagsBits;
  behavior = configuration->behavior;
  v14 = configuration->newline._countAndFlagsBits;
  v15 = *(_OWORD *)&configuration->newline._object;
  v16 = isa;
  v17 = v5;
  v18 = *(_OWORD *)&configuration->listItemBullet._object;
  v19 = v6;
  v20 = *(_OWORD *)&configuration->orderedListItemBulletFormat._object;
  v21 = behavior;
  v8 = objc_allocWithZone((Class)type metadata accessor for NQMLStringGenerator());
  v9 = sub_1AC71D9DC(countAndFlagsBits, (uint64_t)object, &v14);
  objc_msgSend(*(id *)&v9[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser], sel_parse);
  v10 = OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator;
  v11 = objc_msgSend(*(id *)&v9[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator], sel_mutableString);
  if (qword_1EEC8A278 != -1)
    swift_once();
  sub_1AC6D5BAC((void *)qword_1EEC8B988);

  v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAttributedString_, *(_QWORD *)&v9[v10]);
  return (NSAttributedString)v12;
}

id sub_1AC71D360(uint64_t a1)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInteger_, a1);
}

id sub_1AC71D394()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB38E8]);
  result = sub_1AC71ECC0(0x745C725C6E5C5B28, 0xEC000000292B5D20, 0);
  qword_1EEC8B980 = (uint64_t)result;
  return result;
}

uint64_t sub_1AC71D40C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = sub_1AC725854();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC725824();
  v4 = sub_1AC725818();
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_1EEC8B988 = v4;
  return result;
}

BOOL static NQMLConfiguration.Behavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t NQMLConfiguration.Behavior.hash(into:)()
{
  return sub_1AC726B08();
}

uint64_t NQMLConfiguration.Behavior.hashValue.getter()
{
  sub_1AC726AFC();
  sub_1AC726B08();
  return sub_1AC726B2C();
}

uint64_t NQMLConfiguration.newline.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id NQMLConfiguration.font.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

id NQMLConfiguration.paragraphStyle.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t NQMLConfiguration.listItemBullet.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

id NQMLConfiguration.listItemStyle.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 48);
}

uint64_t NQMLConfiguration.orderedListItemBulletFormat.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

id NQMLConfiguration.orderedListItemStyle.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 72);
}

void NQMLConfiguration.behavior.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 80);
}

void __swiftcall NQMLConfiguration.withBehavior(_:)(JetUI::NQMLConfiguration *__return_ptr retstr, JetUI::NQMLConfiguration::Behavior a2)
{
  uint64_t *v2;
  JetUI::NQMLConfiguration::Behavior v3;
  void *v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;

  v3 = *(_BYTE *)a2;
  v4 = (void *)v2[1];
  v5 = (objc_class *)v2[2];
  v6 = (objc_class *)v2[3];
  v7 = v2[4];
  v8 = (void *)v2[5];
  v10 = (objc_class *)v2[6];
  v9 = v2[7];
  v11 = (void *)v2[8];
  v16 = (objc_class *)v2[9];
  retstr->newline._countAndFlagsBits = *v2;
  retstr->newline._object = v4;
  retstr->font.super.isa = v5;
  retstr->paragraphStyle.super.isa = v6;
  retstr->listItemBullet._countAndFlagsBits = v7;
  retstr->listItemBullet._object = v8;
  retstr->listItemStyle.super.isa = v10;
  retstr->orderedListItemBulletFormat._countAndFlagsBits = v9;
  retstr->orderedListItemBulletFormat._object = v11;
  retstr->orderedListItemStyle.super.isa = v16;
  retstr->behavior = v3;
  swift_bridgeObjectRetain();
  v12 = v5;
  v13 = v6;
  swift_bridgeObjectRetain();
  v14 = v10;
  swift_bridgeObjectRetain();
  v15 = v16;
}

uint64_t sub_1AC71D64C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  void (*v10)(_BYTE *, uint64_t);
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[16];

  v1 = v0;
  v2 = sub_1AC725968();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v22[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v8 = &v22[-v7];
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  if (qword_1ED0BD770 != -1)
    swift_once();
  sub_1AC72664C();
  sub_1AC70ADE8((uint64_t)v5);
  v10 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
  v10(v8, v2);
  v11 = (void *)sub_1AC725950();
  v10(v5, v2);
  objc_msgSend(v9, sel_setLocale_, v11);

  objc_msgSend(v9, sel_setNumberStyle_, 1);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, *(_QWORD *)(v1 + 16));
  v13 = objc_msgSend(v9, sel_stringFromNumber_, v12);

  if (!v13)
  {
    v14 = (void *)objc_opt_self();
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, *(_QWORD *)(v1 + 16));
    v13 = objc_msgSend(v14, sel_localizedStringFromNumber_numberStyle_, v15, 1);

  }
  v16 = sub_1AC72622C();
  v18 = v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8A828);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1AC727FC0;
  *(_QWORD *)(v19 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v19 + 64) = sub_1AC6AD6AC();
  *(_QWORD *)(v19 + 32) = v16;
  *(_QWORD *)(v19 + 40) = v18;
  v20 = sub_1AC726244();

  return v20;
}

uint64_t sub_1AC71D8C4()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1AC71D8E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_1AC7260E8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1AC72610C();
  __swift_allocate_value_buffer(v4, qword_1EEC8B990);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EEC8B990);
  if (qword_1EEC8A208 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_1EEC95CA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_1AC726100();
}

char *sub_1AC71D9DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  char *v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v5 = *a3;
  v6 = a3[4];
  v18 = a3[3];
  v19 = a3[7];
  v7 = *((unsigned __int8 *)a3 + 80);
  *(_QWORD *)&v3[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker] = 0;
  v8 = OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator;
  v9 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v10 = v3;
  *(_QWORD *)&v3[v8] = objc_msgSend(v9, sel_init);
  *(_QWORD *)&v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack] = MEMORY[0x1E0DEE9D8];
  v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_didParseEverything] = 1;
  v11 = OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor;
  *(_QWORD *)&v10[v11] = objc_msgSend((id)objc_opt_self(), sel_systemGrayColor);
  v12 = objc_allocWithZone((Class)JUNQMLParser);
  v13 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithString_behavior_, v13, v7);

  *(_QWORD *)&v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser] = v14;
  v15 = &v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration];
  *(_QWORD *)v15 = v5;
  *(_OWORD *)(v15 + 8) = *(_OWORD *)(a3 + 1);
  *((_QWORD *)v15 + 3) = v18;
  *((_QWORD *)v15 + 4) = v6;
  *(_OWORD *)(v15 + 40) = *(_OWORD *)(a3 + 5);
  *((_QWORD *)v15 + 7) = v19;
  *((_OWORD *)v15 + 4) = *((_OWORD *)a3 + 4);
  v15[80] = v7;

  v20.receiver = v10;
  v20.super_class = (Class)type metadata accessor for NQMLStringGenerator();
  v16 = (char *)objc_msgSendSuper2(&v20, sel_init);
  objc_msgSend(*(id *)&v16[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser], sel_setDelegate_, v16);
  return v16;
}

uint64_t sub_1AC71DB9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  _OWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  char isUniquelyReferenced_nonNull_native;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t result;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int64_t v41;
  _OWORD v42[2];
  uint64_t v43;
  void *v44;
  __int128 v45;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack);
  swift_beginAccess();
  v4 = (_QWORD *)*v3;
  v5 = *(_QWORD *)(*v3 + 16);
  if (v5)
  {
    v6 = (_QWORD *)v4[v5 + 3];
    v39 = v3;
    v40 = a1 + 64;
    v7 = 1 << *(_BYTE *)(a1 + 32);
    v8 = -1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    v9 = v8 & *(_QWORD *)(a1 + 64);
    v4 = (_QWORD *)v42 + 1;
    v41 = (unint64_t)(v7 + 63) >> 6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = 0;
    while (!v9)
    {
      v17 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_50;
      if (v17 < v41)
      {
        v18 = *(_QWORD *)(v40 + 8 * v17);
        if (v18)
          goto LABEL_13;
        v19 = v10 + 2;
        ++v10;
        if (v17 + 1 < v41)
        {
          v18 = *(_QWORD *)(v40 + 8 * v19);
          if (v18)
            goto LABEL_16;
          v10 = v17 + 1;
          if (v17 + 2 < v41)
          {
            v18 = *(_QWORD *)(v40 + 8 * (v17 + 2));
            if (v18)
            {
              v17 += 2;
              goto LABEL_13;
            }
            v19 = v17 + 3;
            v10 = v17 + 2;
            if (v17 + 3 < v41)
            {
              v18 = *(_QWORD *)(v40 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  v17 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    break;
                  if (v17 >= v41)
                  {
                    v10 = v41 - 1;
                    goto LABEL_27;
                  }
                  v18 = *(_QWORD *)(v40 + 8 * v17);
                  ++v19;
                  if (v18)
                    goto LABEL_13;
                }
                __break(1u);
LABEL_55:
                type metadata accessor for Key(0);
                result = sub_1AC726AB4();
                __break(1u);
                return result;
              }
LABEL_16:
              v17 = v19;
LABEL_13:
              v9 = (v18 - 1) & v18;
              v13 = __clz(__rbit64(v18)) + (v17 << 6);
              v10 = v17;
LABEL_9:
              v14 = *(_QWORD *)(a1 + 56);
              *(_QWORD *)&v42[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v13);
              v15 = *(void **)&v42[0];
              sub_1AC69FE7C(v14 + 32 * v13, (uint64_t)v42 + 8);
              v16 = v15;
              goto LABEL_28;
            }
          }
        }
      }
LABEL_27:
      v9 = 0;
      v43 = 0;
      memset(v42, 0, sizeof(v42));
LABEL_28:
      sub_1AC71F2E0((uint64_t)v42, (uint64_t)&v44);
      v20 = v44;
      if (!v44)
      {
        swift_release();
        v3 = v39;
        v4 = (_QWORD *)*v39;
        result = swift_isUniquelyReferenced_nonNull_native();
        *v39 = (uint64_t)v4;
        if ((result & 1) != 0)
          goto LABEL_41;
LABEL_51:
        result = (uint64_t)sub_1AC6A35C0(0, v4[2] + 1, 1, v4);
        v4 = (_QWORD *)result;
        *v3 = result;
LABEL_41:
        v36 = v4[2];
        v35 = v4[3];
        v37 = v36 + 1;
        if (v36 < v35 >> 1)
          goto LABEL_47;
        result = (uint64_t)sub_1AC6A35C0((_QWORD *)(v35 > 1), v36 + 1, 1, v4);
        v4 = (_QWORD *)result;
LABEL_53:
        *v3 = (uint64_t)v4;
        goto LABEL_47;
      }
      sub_1AC6900D4(&v45, v42);
      v3 = v20;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v23 = sub_1AC6B4D78((uint64_t)v3);
      v24 = v6[2];
      v25 = (v22 & 1) == 0;
      v26 = v24 + v25;
      if (__OFADD__(v24, v25))
      {
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      v27 = v22;
      if (v6[3] >= v26)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v22 & 1) != 0)
            goto LABEL_5;
        }
        else
        {
          sub_1AC69F1B0();
          if ((v27 & 1) != 0)
            goto LABEL_5;
        }
      }
      else
      {
        sub_1AC69CEB8(v26, isUniquelyReferenced_nonNull_native);
        v28 = sub_1AC6B4D78((uint64_t)v3);
        if ((v27 & 1) != (v29 & 1))
          goto LABEL_55;
        v23 = v28;
        if ((v27 & 1) != 0)
        {
LABEL_5:
          v11 = (_OWORD *)(v6[7] + 32 * v23);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
          sub_1AC6900D4(v42, v11);
          goto LABEL_6;
        }
      }
      v6[(v23 >> 6) + 8] |= 1 << v23;
      *(_QWORD *)(v6[6] + 8 * v23) = v3;
      sub_1AC6900D4(v42, (_OWORD *)(v6[7] + 32 * v23));
      v30 = v6[2];
      v31 = __OFADD__(v30, 1);
      v32 = v30 + 1;
      if (v31)
        goto LABEL_49;
      v6[2] = v32;
      v33 = v3;
LABEL_6:

      swift_bridgeObjectRelease();
    }
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v13 = v12 | (v10 << 6);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *v3 = (uint64_t)v4;
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1AC6A35C0(0, v4[2] + 1, 1, v4);
    v4 = (_QWORD *)result;
    *v3 = result;
  }
  v36 = v4[2];
  v38 = v4[3];
  v37 = v36 + 1;
  if (v36 >= v38 >> 1)
  {
    result = (uint64_t)sub_1AC6A35C0((_QWORD *)(v38 > 1), v36 + 1, 1, v4);
    v4 = (_QWORD *)result;
    v6 = (_QWORD *)a1;
    goto LABEL_53;
  }
  v6 = (_QWORD *)a1;
LABEL_47:
  v4[2] = v37;
  v4[v36 + 4] = v6;
  return result;
}

void sub_1AC71DFEC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator);
  v2 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v4 = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1AC726208();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1AC688D20((unint64_t *)&qword_1ED0BDC10, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1AC728C28);
    v6 = (void *)sub_1AC726178();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

    objc_msgSend(v4, sel_appendAttributedString_, v7);
  }
  else
  {
    __break(1u);
  }
}

id sub_1AC71E138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (!v3 || (v4 = *(_QWORD *)(*(_QWORD *)v2 + 8 * v3 + 24), !*(_QWORD *)(v4 + 16)))
  {
    v11 = 0u;
    v12 = 0u;
LABEL_10:
    sub_1AC690CC0((uint64_t)&v11);
    return objc_retain(*(id *)(v1
                             + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                             + 16));
  }
  v5 = (void *)*MEMORY[0x1E0DC1138];
  swift_bridgeObjectRetain();
  v6 = v5;
  v7 = sub_1AC6B4D78((uint64_t)v6);
  if ((v8 & 1) != 0)
  {
    sub_1AC69FE7C(*(_QWORD *)(v4 + 56) + 32 * v7, (uint64_t)&v11);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v12 + 1))
    goto LABEL_10;
  sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
  if (swift_dynamicCast())
    return (id)v10;
  return objc_retain(*(id *)(v1
                           + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                           + 16));
}

id sub_1AC71E26C(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[3];
  uint64_t v18;

  v2 = sub_1AC72610C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1AC71E138();
  v7 = objc_msgSend(v6, sel_fontDescriptor);
  v8 = objc_msgSend(v7, sel_symbolicTraits) | a1;
  v9 = objc_msgSend(v7, sel_fontDescriptorWithSymbolicTraits_, v8);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v6, sel_pointSize);
    v12 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v10, v11);

    return v12;
  }
  else
  {
    if (qword_1EEC8A280 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v2, (uint64_t)qword_1EEC8B990);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8A5E0);
    sub_1AC725D10();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1AC7293C0;
    sub_1AC725C8C();
    v18 = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
    v17[0] = v6;
    v16 = v6;
    sub_1AC725CF8();
    sub_1AC690CC0((uint64_t)v17);
    sub_1AC725C8C();
    v18 = MEMORY[0x1E0DEE0F8];
    LODWORD(v17[0]) = v8;
    sub_1AC725CF8();
    sub_1AC690CC0((uint64_t)v17);
    sub_1AC726004();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v16;
  }
}

id sub_1AC71E50C()
{
  id v0;
  uint64_t inited;
  void *v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  id v15;

  v0 = sub_1AC71E26C(2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AC729820;
  v2 = (void *)*MEMORY[0x1E0DC13D8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC13D8];
  *(_QWORD *)(inited + 40) = 6;
  v3 = (void *)*MEMORY[0x1E0DC13D0];
  *(_QWORD *)(inited + 48) = *MEMORY[0x1E0DC13D0];
  *(_QWORD *)(inited + 56) = 0;
  v4 = v2;
  v5 = v3;
  v6 = sub_1AC6A977C(inited);
  v7 = objc_msgSend(v0, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BE2A0);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_1AC727FC0;
  v9 = (void *)*MEMORY[0x1E0DC1380];
  *(_QWORD *)(v8 + 32) = *MEMORY[0x1E0DC1380];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8BA60);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1AC727FC0;
  *(_QWORD *)(v10 + 32) = v6;
  *(_QWORD *)(v8 + 64) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA68);
  *(_QWORD *)(v8 + 40) = v10;
  v11 = v9;
  sub_1AC690388(v8);
  type metadata accessor for AttributeName(0);
  sub_1AC688D20((unint64_t *)&qword_1ED0BE270, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1AC7292E0);
  v12 = (void *)sub_1AC726178();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v7, sel_fontDescriptorByAddingAttributes_, v12);

  objc_msgSend(v0, sel_pointSize);
  v15 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v13, v14);

  return v15;
}

id sub_1AC71EBC8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NQMLStringGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AC71ECC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_1AC725860();

    swift_willThrow();
  }
  return v6;
}

char *sub_1AC71ED98(uint64_t a1)
{
  return sub_1AC6A2614(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AC71EDAC(uint64_t a1)
{
  return sub_1AC6A2BC8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_1AC71EDC0(_QWORD *a1)
{
  return sub_1AC6A2CE0(0, a1[2], 0, a1);
}

char *sub_1AC71EDD4(uint64_t a1)
{
  return sub_1AC6A3080(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_1AC71EDE8(_QWORD *a1)
{
  return sub_1AC6A3270(0, a1[2], 0, a1);
}

char *sub_1AC71EDFC(uint64_t a1)
{
  return sub_1AC6A34AC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_1AC71EE10(_QWORD *a1)
{
  return sub_1AC6A35C0(0, a1[2], 0, a1);
}

uint64_t sub_1AC71EE24()
{
  _QWORD **v0;
  _QWORD *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
  {
    v3 = v1[2];
    if (v3)
    {
LABEL_3:
      v4 = v3 - 1;
      result = v1[v4 + 4];
      v1[2] = v4;
      *v0 = v1;
      return result;
    }
  }
  else
  {
    result = (uint64_t)sub_1AC71EE10(v1);
    v1 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 16);
    if (v3)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for NQMLStringGenerator()
{
  return objc_opt_self();
}

unint64_t sub_1AC71EEA4()
{
  unint64_t result;

  result = qword_1EEC8B9B8;
  if (!qword_1EEC8B9B8)
  {
    result = MEMORY[0x1AF440830](&protocol conformance descriptor for NQMLConfiguration.Behavior, &type metadata for NQMLConfiguration.Behavior);
    atomic_store(result, (unint64_t *)&qword_1EEC8B9B8);
  }
  return result;
}

void destroy for NQMLConfiguration(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for NQMLConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v8 = *(void **)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v7;
  v9 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRetain();
  v10 = v4;
  v11 = v5;
  swift_bridgeObjectRetain();
  v12 = v8;
  swift_bridgeObjectRetain();
  v13 = v9;
  return a1;
}

uint64_t assignWithCopy for NQMLConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(void **)(a2 + 48);
  v11 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v10;
  v12 = v10;

  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = *(void **)(a2 + 72);
  v14 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v13;
  v15 = v13;

  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

uint64_t assignWithTake for NQMLConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for NQMLConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 81))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NQMLConfiguration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 81) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NQMLConfiguration()
{
  return &type metadata for NQMLConfiguration;
}

uint64_t storeEnumTagSinglePayload for NQMLConfiguration.Behavior(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AC71F240 + 4 * byte_1AC72FBE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AC71F274 + 4 * byte_1AC72FBE0[v4]))();
}

uint64_t sub_1AC71F274(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71F27C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AC71F284);
  return result;
}

uint64_t sub_1AC71F290(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AC71F298);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AC71F29C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AC71F2A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NQMLConfiguration.Behavior()
{
  return &type metadata for NQMLConfiguration.Behavior;
}

uint64_t type metadata accessor for NQMLOrderedListTracker()
{
  return objc_opt_self();
}

uint64_t sub_1AC71F2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8BA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_1AC71F328(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __CFString *v7;
  uint64_t v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  char v16;
  double *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  double v23;
  BOOL v24;
  double v25;
  void *v26;
  id v27;
  uint64_t v29;
  unsigned __int8 *v30;
  int v31;
  id v32[2];
  char v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;

  v32[0] = a2;
  v3 = sub_1AC72610C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
    return v32[0];
  v7 = CFSTR("font-name");
  v8 = sub_1AC690328();
  if ((v9 & 1) != 0)
  {
    v10 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v8);
    v12 = *v10;
    v11 = v10[1];
    swift_bridgeObjectRetain();
  }
  else
  {

    v7 = (__CFString *)objc_msgSend(v32[0], sel_fontName);
    *(double *)&v12 = COERCE_DOUBLE(sub_1AC72622C());
    v11 = v13;
  }

  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_20;
  v14 = CFSTR("font-size");
  v15 = sub_1AC690328();
  if ((v16 & 1) == 0)
  {

    goto LABEL_20;
  }
  v17 = (double *)(*(_QWORD *)(a1 + 56) + 16 * v15);
  v18 = *v17;
  v19 = *((_QWORD *)v17 + 1);
  swift_bridgeObjectRetain();

  v34 = 0.0;
  MEMORY[0x1E0C80A78](v20);
  v32[-2] = &v34;
  if ((v19 & 0x1000000000000000) != 0 || !(v19 & 0x2000000000000000 | *(_QWORD *)&v18 & 0x1000000000000000))
  {
    sub_1AC726844();
    swift_bridgeObjectRelease();
    if ((v33 & 1) == 0)
      goto LABEL_20;
  }
  else
  {
    if ((v19 & 0x2000000000000000) == 0)
    {
      if ((*(_QWORD *)&v18 & 0x1000000000000000) != 0)
        v21 = (_BYTE *)((v19 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v21 = (_BYTE *)sub_1AC7268B0();
      sub_1AC72047C(v21, (BOOL *)&v35);
      v22 = LOBYTE(v35);
      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
        goto LABEL_13;
LABEL_20:
      objc_msgSend(v32[0], sel_pointSize, v32[0]);
      v23 = v25;
      goto LABEL_21;
    }
    v35 = v18;
    v36 = v19 & 0xFFFFFFFFFFFFFFLL;
    v24 = LOBYTE(v18) > 0x20u || ((1 << SLOBYTE(v18)) & 0x100003E01) == 0;
    if (!v24 || (v30 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v31 = *v30;
    swift_bridgeObjectRelease();
    if (v31)
      goto LABEL_20;
  }
LABEL_13:
  v23 = v34;
LABEL_21:
  swift_bridgeObjectRetain();
  v26 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  v27 = objc_msgSend((id)objc_opt_self(), sel_fontWithName_size_, v26, v23);

  if (v27)
  {
    swift_bridgeObjectRelease();
    return v27;
  }
  if (qword_1EEC8A280 != -1)
    swift_once();
  v29 = __swift_project_value_buffer(v3, (uint64_t)qword_1EEC8B990);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v29, v3);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8A5E0);
  sub_1AC725D10();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1AC7293C0;
  sub_1AC725C8C();
  v37 = MEMORY[0x1E0DEA968];
  v35 = *(double *)&v12;
  v36 = v11;
  sub_1AC725CF8();
  sub_1AC690CC0((uint64_t)&v35);
  sub_1AC725C8C();
  v37 = MEMORY[0x1E0DEF040];
  v35 = v23;
  sub_1AC725CF8();
  sub_1AC690CC0((uint64_t)&v35);
  sub_1AC72601C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v32[0];
}

uint64_t sub_1AC71F788()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AC729820;
  v2 = (void *)*MEMORY[0x1E0DC1178];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1178];
  v3 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration;
  v4 = *(void **)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration + 24);
  v5 = sub_1AC69C244(0, (unint64_t *)&unk_1EEC8BA90);
  *(_QWORD *)(inited + 40) = v4;
  v6 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 64) = v5;
  *(_QWORD *)(inited + 72) = v6;
  v7 = *(void **)(v3 + 16);
  *(_QWORD *)(inited + 104) = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
  *(_QWORD *)(inited + 80) = v7;
  v8 = v2;
  v9 = v4;
  v10 = v6;
  v11 = v7;
  v12 = sub_1AC6A9404(inited);
  sub_1AC71DB9C(v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC71F874()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_0;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13[4];

  v1 = v0;
  v2 = sub_1AC72610C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EEC8A280 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1EEC8B990);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8A5E0);
  sub_1AC725D10();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1AC729820;
  sub_1AC725C8C();
  swift_getErrorValue();
  v7 = v11;
  v8 = v12;
  v13[3] = v12;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_0, v7, v8);
  sub_1AC725D04();
  sub_1AC690CC0((uint64_t)v13);
  sub_1AC72601C();
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_didParseEverything) = 0;
  return result;
}

id sub_1AC71FA2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id result;
  id v6;
  id v7;
  uint64_t inited;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  void **v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34;

  result = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_beginEditing);
  switch(a1)
  {
    case 0:
      v6 = sub_1AC71E26C(2);
      v7 = sub_1AC71F328(a2, v6);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1AC729820;
      v9 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
      v10 = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
      *(_QWORD *)(inited + 40) = v7;
      v11 = (void *)*MEMORY[0x1E0DC1140];
      *(_QWORD *)(inited + 64) = v10;
      *(_QWORD *)(inited + 72) = v11;
      v12 = *(id *)(v2 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor);
      *(_QWORD *)(inited + 104) = sub_1AC69C244(0, (unint64_t *)&qword_1EEC8AF08);
      *(_QWORD *)(inited + 80) = v12;
      v13 = v9;
      v14 = v7;
      goto LABEL_9;
    case 1:
      v15 = sub_1AC71E26C(1);
      v12 = sub_1AC71F328(a2, v15);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1AC727FC0;
      v11 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
      *(_QWORD *)(inited + 64) = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
      *(_QWORD *)(inited + 40) = v12;
      goto LABEL_8;
    case 2:
      v16 = sub_1AC71E138();
      v12 = sub_1AC71F328(a2, v16);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
      v17 = swift_initStackObject();
      inited = v17;
      v18 = xmmword_1AC729820;
      v19 = (void **)MEMORY[0x1E0DC1248];
      goto LABEL_6;
    case 3:
      v20 = sub_1AC71E138();
      v12 = sub_1AC71F328(a2, v20);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
      v17 = swift_initStackObject();
      inited = v17;
      v18 = xmmword_1AC729820;
      v19 = (void **)MEMORY[0x1E0DC11A8];
LABEL_6:
      *(_OWORD *)(v17 + 16) = v18;
      v21 = *v19;
      *(_QWORD *)(v17 + 32) = *v19;
      v22 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
      v23 = v21;
      v24 = objc_msgSend(v22, sel_initWithInteger_, 1);
      v25 = sub_1AC69C244(0, (unint64_t *)&unk_1EEC8BAA0);
      *(_QWORD *)(inited + 40) = v24;
      v11 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(inited + 64) = v25;
      *(_QWORD *)(inited + 72) = v11;
      *(_QWORD *)(inited + 104) = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
      *(_QWORD *)(inited + 80) = v12;
      goto LABEL_8;
    case 4:
      v26 = sub_1AC71E138();
      v12 = sub_1AC71F328(a2, v26);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1AC729820;
      v27 = (void *)*MEMORY[0x1E0DC1178];
      *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1178];
      v28 = *(void **)(v2
                     + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                     + 24);
      v29 = sub_1AC69C244(0, (unint64_t *)&unk_1EEC8BA90);
      *(_QWORD *)(inited + 40) = v28;
      v11 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(inited + 64) = v29;
      *(_QWORD *)(inited + 72) = v11;
      *(_QWORD *)(inited + 104) = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
      *(_QWORD *)(inited + 80) = v12;
      v30 = v27;
      v31 = v28;
LABEL_8:
      v14 = v12;
LABEL_9:
      v32 = v11;
      v33 = v12;
      v34 = sub_1AC6A9404(inited);
      sub_1AC71DB9C(v34);

      result = (id)swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AC71FDC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;

  if (a1 == 4)
    sub_1AC71DFEC();
  v2 = v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  v3 = *(_QWORD **)v2;
  if (!*(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    __break(1u);
LABEL_8:
    result = (uint64_t)sub_1AC71EE10(v3);
    v3 = (_QWORD *)result;
    v5 = *(_QWORD *)(result + 16);
    if (v5)
      goto LABEL_6;
    goto LABEL_9;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_8;
  v5 = v3[2];
  if (v5)
  {
LABEL_6:
    v3[2] = v5 - 1;
    *(_QWORD *)v2 = v3;
    swift_bridgeObjectRelease();
    return (uint64_t)objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_endEditing);
  }
LABEL_9:
  __break(1u);
  return result;
}

char *sub_1AC71FE90()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  char *result;
  unsigned __int8 v7;
  void *v8;
  id v9;
  void *v10;

  v1 = objc_allocWithZone(MEMORY[0x1E0CB37A0]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithString_, v2);

  v4 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_mutableString);
  if (qword_1EEC8A278 != -1)
    swift_once();
  v5 = (void *)qword_1EEC8B988;
  if ((uint64_t)objc_msgSend(v4, sel_length) < 1)
  {

  }
  else
  {
    result = (char *)objc_msgSend(v4, sel_length);
    if (__OFSUB__(result, 1))
    {
      __break(1u);
      return result;
    }
    v7 = objc_msgSend(v5, sel_characterIsMember_, objc_msgSend(v4, sel_characterAtIndex_, result - 1));

    if ((v7 & 1) != 0)
      sub_1AC6D5CE4((void *)qword_1EEC8B988);
  }
  if (qword_1EEC8A270 != -1)
    swift_once();
  v8 = (void *)qword_1EEC8B980;
  if (qword_1EEC8B980)
  {
    v9 = objc_msgSend(v3, sel_length);
    v10 = (void *)sub_1AC726208();
    objc_msgSend(v8, sel_replaceMatchesInString_options_range_withTemplate_, v3, 0, 0, v9, v10);

  }
  sub_1AC72622C();
  sub_1AC71DFEC();

  return (char *)swift_bridgeObjectRelease();
}

id sub_1AC720070(uint64_t a1)
{
  uint64_t v1;
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t inited;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;

  result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_beginEditing);
  if (a1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AC727FC0;
    v9 = (void *)*MEMORY[0x1E0DC1178];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1178];
    v10 = *(void **)(v1
                   + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                   + 48);
  }
  else
  {
    if (a1)
      return result;
    v4 = v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration;
    v6 = *(_QWORD *)(v1
                   + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                   + 56);
    v5 = *(_QWORD *)(v1
                   + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                   + 64);
    type metadata accessor for NQMLOrderedListTracker();
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = 1;
    v7[3] = v6;
    v7[4] = v5;
    *(_QWORD *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker) = v7;
    swift_bridgeObjectRetain();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AC727FC0;
    v9 = (void *)*MEMORY[0x1E0DC1178];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1178];
    v10 = *(void **)(v4 + 72);
  }
  *(_QWORD *)(inited + 64) = sub_1AC69C244(0, (unint64_t *)&unk_1EEC8BA90);
  *(_QWORD *)(inited + 40) = v10;
  v11 = v9;
  v12 = v10;
  v13 = sub_1AC6A9404(inited);
  sub_1AC71DB9C(v13);
  return (id)swift_bridgeObjectRelease();
}

void sub_1AC7201D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  v1 = v0;
  if (!*(_QWORD *)(v0
                  + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker))
  {
    sub_1AC71DFEC();
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8BA80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AC729820;
  v3 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  v4 = v3;
  swift_retain();
  v5 = sub_1AC71E50C();
  v6 = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BD740);
  *(_QWORD *)(inited + 40) = v5;
  v7 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 64) = v6;
  *(_QWORD *)(inited + 72) = v7;
  v8 = *(void **)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor);
  *(_QWORD *)(inited + 104) = sub_1AC69C244(0, (unint64_t *)&qword_1EEC8AF08);
  *(_QWORD *)(inited + 80) = v8;
  v9 = v7;
  v10 = v8;
  v11 = sub_1AC6A9404(inited);
  sub_1AC71DB9C(v11);
  swift_bridgeObjectRelease();
  sub_1AC71D64C();
  sub_1AC71DFEC();
  swift_bridgeObjectRelease();
  v12 = v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  v13 = *(_QWORD **)v12;
  if (*(_QWORD *)(*(_QWORD *)v12 + 16))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      v14 = v13[2];
      if (v14)
      {
LABEL_5:
        v13[2] = v14 - 1;
        *(_QWORD *)v12 = v13;
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  v13 = sub_1AC71EE10(v13);
  v14 = v13[2];
  if (v14)
    goto LABEL_5;
LABEL_9:
  __break(1u);
}

uint64_t sub_1AC7203A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;

  sub_1AC71DFEC();
  v1 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  v2 = *(_QWORD **)v1;
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_1AC71EE10(v2);
    v2 = (_QWORD *)result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
      goto LABEL_4;
    goto LABEL_7;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v4 = v2[2];
  if (v4)
  {
LABEL_4:
    v2[2] = v4 - 1;
    *(_QWORD *)v1 = v2;
    swift_bridgeObjectRelease();
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_endEditing);
    *(_QWORD *)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker) = 0;
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

_BYTE *sub_1AC72047C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

id DynamicTextAppearance.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  void *v4;

  v4 = (void *)*MEMORY[0x1E0DC4A88];
  a1[3] = (uint64_t)&type metadata for FontSource;
  a1[4] = (uint64_t)&protocol witness table for FontSource;
  v2 = swift_allocObject();
  *a1 = v2;
  *(_QWORD *)(v2 + 16) = v4;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_BYTE *)(v2 + 56) = 0;
  a1[5] = 4;
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  return v4;
}

uint64_t sub_1AC72056C()
{
  uint64_t v0;

  sub_1AC68D860(*(id *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject();
}

uint64_t DynamicTextAppearance.withNumberOfLines(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1AC6B9A14(v2, a2);
  *(_QWORD *)(a2 + 56) = a1;
  return result;
}

uint64_t DynamicTextAppearance.withLineBreakMode(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1AC6B9A14(v2, a2);
  *(_QWORD *)(a2 + 48) = a1;
  return result;
}

__n128 DynamicTextAppearance.textAppearance(compatibleWith:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;

  v3 = v2;
  v6 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x1E0DC4A88], 0);
  *a2 = (uint64_t)v6;
  a2[1] = 4;
  a2[3] = 0;
  a2[4] = 0;
  a2[2] = 0;
  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(_QWORD *)(v3 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v3, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, v7, v8);

  *a2 = v9;
  *(_OWORD *)(a2 + 1) = *(_OWORD *)(v3 + 40);
  result = *(__n128 *)(v3 + 56);
  *(__n128 *)(a2 + 3) = result;
  return result;
}

uint64_t DynamicTextAppearance.customTextStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1, a1);
}

uint64_t DynamicTextAppearance.customTextStyle.setter(__int128 *a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v1);
  return sub_1AC68AAA4(a1, v1);
}

double (*DynamicTextAppearance.customTextStyle.modify())(void)
{
  return nullsub_1;
}

uint64_t *DynamicTextAppearance.withCustomTextStyle(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_1AC6B9A14(v2, (uint64_t)a2);
  return __swift_assign_boxed_opaque_existential_1(a2, a1);
}

uint64_t DynamicTextAppearance.withFontUseCase(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;

  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 40);
  sub_1AC6B9A14(v2, a2);
  v13 = &type metadata for FontSource;
  v14 = &protocol witness table for FontSource;
  v10 = swift_allocObject();
  *(_QWORD *)&v12 = v10;
  *(_QWORD *)(v10 + 16) = v4;
  *(_QWORD *)(v10 + 24) = v5;
  *(_QWORD *)(v10 + 32) = v6;
  *(_QWORD *)(v10 + 40) = v7;
  *(_QWORD *)(v10 + 48) = v8;
  *(_BYTE *)(v10 + 56) = v9 | 0x80;
  sub_1AC692480(v4, v5, v6, v7, v8, v9);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return sub_1AC68AAA4(&v12, a2);
}

uint64_t DynamicTextAppearance.withTextStyle(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  __int128 v8;
  ValueMetadata *v9;
  _UNKNOWN **v10;

  sub_1AC6B9A14(v2, a2);
  v9 = &type metadata for FontSource;
  v10 = &protocol witness table for FontSource;
  v5 = swift_allocObject();
  *(_QWORD *)&v8 = v5;
  *(_QWORD *)(v5 + 16) = a1;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_BYTE *)(v5 + 56) = 0;
  v6 = a1;
  __swift_destroy_boxed_opaque_existential_1(a2);
  return sub_1AC68AAA4(&v8, a2);
}

uint64_t DynamicTextAppearance.textAlignment.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t DynamicTextAppearance.textAlignment.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

double (*DynamicTextAppearance.textAlignment.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.withTextAlignment(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1AC6B9A14(v2, a2);
  *(_QWORD *)(a2 + 40) = a1;
  return result;
}

uint64_t DynamicTextAppearance.lineBreakMode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t DynamicTextAppearance.lineBreakMode.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

double (*DynamicTextAppearance.lineBreakMode.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.numberOfLines.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t DynamicTextAppearance.numberOfLines.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

double (*DynamicTextAppearance.numberOfLines.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.lineSpacing.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t DynamicTextAppearance.lineSpacing.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = result;
  return result;
}

double (*DynamicTextAppearance.lineSpacing.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.withLineSpacing(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1AC6B9A14(v2, a2);
  *(_QWORD *)(a2 + 64) = a1;
  return result;
}

uint64_t initializeWithCopy for DynamicTextAppearance(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t *assignWithCopy for DynamicTextAppearance(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
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

uint64_t assignWithTake for DynamicTextAppearance(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicTextAppearance(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicTextAppearance(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicTextAppearance()
{
  return &type metadata for DynamicTextAppearance;
}

double JUMeasurements.contentHeight.getter(double a1, double a2, double a3, double a4)
{
  return a2 - a4;
}

void JUMeasurements.baselines.getter(double *a1@<X8>, double a2@<D2>, double a3@<D3>)
{
  *a1 = a2;
  a1[1] = a3;
}

JUMeasurements __swiftcall JUMeasurements.init(representing:)(CGSize representing)
{
  double v1;
  CGFloat height;
  JUMeasurements result;

  v1 = 0.0;
  height = representing.height;
  result.var1 = representing.height;
  result.var0 = representing.width;
  result.var3 = v1;
  result.var2 = height;
  return result;
}

uint64_t JUMeasurements.isEmpty.getter(double a1, double a2)
{
  _BOOL4 v2;

  v2 = fabs(a1) < COERCE_DOUBLE(1);
  return fabs(a2) < COERCE_DOUBLE(1) || v2;
}

double JUMeasurements.edgeInsets.getter(double a1, double a2, double a3)
{
  return a3;
}

BOOL static JUMeasurements.== infix(_:_:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return JUMeasurementsEqual(a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL sub_1AC720BB4(double *a1, double *a2)
{
  return JUMeasurementsEqual(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

Swift::Void __swiftcall JUMeasurements.round()()
{
  float64x2_t *v0;
  double v1;

  *v0 = vrndpq_f64(*v0);
  v1 = floor(v0[1].f64[1]);
  v0[1].f64[0] = ceil(v0[1].f64[0]);
  v0[1].f64[1] = v1;
}

JUMeasurements __swiftcall JUMeasurements.rounded()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  JUMeasurements result;

  v4 = ceil(v0);
  v5 = ceil(v1);
  v6 = ceil(v2);
  v7 = floor(v3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

uint64_t sub_1AC720C0C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1AC720C30()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t _MeasurableLayoutPlaceable.base.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC6DAD08(v1, a1);
}

JUMeasurements __swiftcall _MeasurableLayoutPlaceable.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  _QWORD *v2;
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  objc_class *v12;
  char *v13;
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
  objc_super v26;
  uint64_t v27;
  JUMeasurements result;

  height = toFit.height;
  width = toFit.width;
  v6 = v2[3];
  v7 = v2[5];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED0BDE00);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1AC727FB0;
  *(UITraitCollection *)(v8 + 32) = with;
  v27 = v8;
  sub_1AC7263AC();
  sub_1AC69232C();
  v9 = with.super.isa;
  v10 = (void *)sub_1AC726394();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithTraitsFromCollections_, v10);

  v12 = (objc_class *)type metadata accessor for TraitEnvironmentPlaceholder();
  v13 = (char *)objc_allocWithZone(v12);
  *(_QWORD *)&v13[OBJC_IVAR____TtC5JetUI27TraitEnvironmentPlaceholder_traitCollection] = v11;
  v26.receiver = v13;
  v26.super_class = v12;
  v14 = objc_msgSendSuper2(&v26, sel_init);
  v15 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v7 + 8))(v14, v6, v7, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.var3 = v25;
  result.var2 = v24;
  result.var1 = v23;
  result.var0 = v22;
  return result;
}

Swift::Void __swiftcall _MeasurableLayoutPlaceable.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  _QWORD *v2;
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id v13;
  objc_class *v14;
  char *v15;
  id v16;
  objc_super v17;
  uint64_t v18[6];

  height = at.size.height;
  width = at.size.width;
  y = at.origin.y;
  x = at.origin.x;
  v8 = v2[3];
  v9 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v8);
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED0BDE00);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1AC727FB0;
  *(UITraitCollection *)(v10 + 32) = with;
  v18[0] = v10;
  sub_1AC7263AC();
  sub_1AC69232C();
  v11 = with.super.isa;
  v12 = (void *)sub_1AC726394();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithTraitsFromCollections_, v12);

  v14 = (objc_class *)type metadata accessor for TraitEnvironmentPlaceholder();
  v15 = (char *)objc_allocWithZone(v14);
  *(_QWORD *)&v15[OBJC_IVAR____TtC5JetUI27TraitEnvironmentPlaceholder_traitCollection] = v13;
  v17.receiver = v15;
  v17.super_class = v14;
  v16 = objc_msgSendSuper2(&v17, sel_init);
  (*(void (**)(uint64_t *__return_ptr, id, uint64_t, uint64_t, double, double, double, double))(v9 + 8))(v18, v16, v8, v9, x, y, width, height);

}

uint64_t _MeasurableLayoutPlaceable.description.getter()
{
  uint64_t v0;
  uint64_t v2;

  sub_1AC6DAD08(v0, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD458);
  return sub_1AC726268();
}

uint64_t sub_1AC720F64()
{
  uint64_t v0;
  uint64_t v2;

  sub_1AC6DAD08(v0, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD458);
  return sub_1AC726268();
}

uint64_t _LayoutViewPlaceable.base.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1, a1);
}

Swift::Void __swiftcall _LayoutViewPlaceable.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  _QWORD *v2;
  double height;
  double width;
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;

  height = at.size.height;
  width = at.size.width;
  y = at.origin.y;
  x = at.origin.x;
  v7 = v2[3];
  v8 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v7);
  (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v8 + 24))(v7, v8, x, y, width, height);
}

uint64_t _LayoutViewPlaceable.description.getter()
{
  return sub_1AC7211BC(qword_1ED0BE1A0);
}

uint64_t sub_1AC72103C(uint64_t a1, uint64_t a2)
{
  return sub_1AC721210(a1, a2, qword_1ED0BE1A0);
}

JUMeasurements __swiftcall _MeasurablePlaceable.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  _QWORD *v2;
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  objc_class *v12;
  char *v13;
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
  objc_super v26;
  uint64_t v27;
  JUMeasurements result;

  height = toFit.height;
  width = toFit.width;
  v6 = v2[3];
  v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED0BDE00);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1AC727FB0;
  *(UITraitCollection *)(v8 + 32) = with;
  v27 = v8;
  sub_1AC7263AC();
  sub_1AC69232C();
  v9 = with.super.isa;
  v10 = (void *)sub_1AC726394();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithTraitsFromCollections_, v10);

  v12 = (objc_class *)type metadata accessor for TraitEnvironmentPlaceholder();
  v13 = (char *)objc_allocWithZone(v12);
  *(_QWORD *)&v13[OBJC_IVAR____TtC5JetUI27TraitEnvironmentPlaceholder_traitCollection] = v11;
  v26.receiver = v13;
  v26.super_class = v12;
  v14 = objc_msgSendSuper2(&v26, sel_init);
  v15 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v7 + 8))(v14, v6, v7, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.var3 = v25;
  result.var2 = v24;
  result.var1 = v23;
  result.var0 = v22;
  return result;
}

uint64_t _MeasurablePlaceable.description.getter()
{
  return sub_1AC7211BC(&qword_1ED0BDD38);
}

uint64_t sub_1AC7211BC(uint64_t *a1)
{
  uint64_t v1;
  _BYTE v4[40];

  sub_1AC68E218(v1, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  return sub_1AC726268();
}

uint64_t sub_1AC721204(uint64_t a1, uint64_t a2)
{
  return sub_1AC721210(a1, a2, &qword_1ED0BDD38);
}

uint64_t sub_1AC721210(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  _BYTE v6[40];

  sub_1AC68E218(v3, (uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_1AC726268();
}

uint64_t destroy for _MeasurableLayoutPlaceable(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for _MeasurableLayoutPlaceable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 40);
  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 40) = v3;
  (**(void (***)(void))(v4 - 8))();
  return a1;
}

uint64_t *assignWithCopy for _MeasurableLayoutPlaceable(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_2(a1, a2);
  return a1;
}

_OWORD *assignWithTake for _MeasurableLayoutPlaceable(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for _MeasurableLayoutPlaceable()
{
  return &type metadata for _MeasurableLayoutPlaceable;
}

ValueMetadata *type metadata accessor for _LayoutViewPlaceable()
{
  return &type metadata for _LayoutViewPlaceable;
}

ValueMetadata *type metadata accessor for _MeasurablePlaceable()
{
  return &type metadata for _MeasurablePlaceable;
}

id sub_1AC72134C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  qword_1EEC89730 = (uint64_t)result;
  return result;
}

__n128 ImagePlaceholder.init(_:with:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  __n128 result;

  *(_QWORD *)a3 = a1;
  result = *a2;
  *(__n128 *)(a3 + 8) = *a2;
  return result;
}

double _s5JetUI16ImagePlaceholderV7measure5toFit4withSo14JUMeasurementsVSo6CGSizeV_So17UITraitCollectionCtF_0(double a1, double a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v5 = sub_1AC725BC0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *v2;
  v10 = (void *)v2[1];
  v11 = v2[2];
  sub_1AC690B38();
  *v8 = sub_1AC726634();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DEF740], v5);
  v12 = sub_1AC725BCC();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5);
  if ((v12 & 1) != 0)
  {
    if (qword_1EEC89688 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v13 = (void *)qword_1EEC89730;
  v14 = v10;
  objc_msgSend(v13, sel_setContentMode_, v11);
  objc_msgSend(v13, sel_setPreferredSymbolConfiguration_, v14);

  v15 = (void *)qword_1EEC89730;
  objc_msgSend((id)qword_1EEC89730, sel_setImage_, v9);
  objc_msgSend(v15, sel_sizeThatFits_, a1, a2);
  v17 = v16;
  v18 = objc_msgSend(v15, sel_image);
  if (v18)
  {
    v19 = v18;
    sub_1AC726688();

  }
  v20 = (void *)qword_1EEC89730;
  objc_msgSend((id)qword_1EEC89730, sel_setContentMode_, 4);
  objc_msgSend(v20, sel_setPreferredSymbolConfiguration_, 0);
  objc_msgSend(v20, sel_setImage_, 0);
  return v17;
}

_QWORD *initializeBufferWithCopyOfBuffer for ImagePlaceholder(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for ImagePlaceholder(id *a1)
{

}

uint64_t assignWithCopy for ImagePlaceholder(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for ImagePlaceholder(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImagePlaceholder(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ImagePlaceholder(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImagePlaceholder()
{
  return &type metadata for ImagePlaceholder;
}

uint64_t FontUseCase.hashValue.getter()
{
  sub_1AC726AFC();
  FontUseCase.hash(into:)();
  return sub_1AC726B2C();
}

uint64_t sub_1AC7217D0()
{
  sub_1AC726AFC();
  FontUseCase.hash(into:)();
  return sub_1AC726B2C();
}

uint64_t sub_1AC721828()
{
  sub_1AC726AFC();
  FontUseCase.hash(into:)();
  return sub_1AC726B2C();
}

uint64_t sub_1AC72187C()
{
  uint64_t v0;

  sub_1AC6921AC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject();
}

uint64_t assignWithTake for FontUseCase(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_1AC6921AC(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_1AC7218FC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t StaticDimension.init(constant:source:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  uint64_t v10;
  uint64_t result;
  __int128 v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;

  v13 = &type metadata for FontSource;
  v14 = &protocol witness table for FontSource;
  v6 = swift_allocObject();
  *(_QWORD *)&v12 = v6;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 32) = v9;
  *(_QWORD *)(v6 + 48) = v7;
  *(_BYTE *)(v6 + 56) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BE170);
  v10 = swift_allocObject();
  result = sub_1AC68AAA4(&v12, v10 + 16);
  *(double *)a2 = a3;
  *(_QWORD *)(a2 + 8) = v10;
  return result;
}

uint64_t sub_1AC7219AC()
{
  uint64_t v0;

  sub_1AC68D860(*(id *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject();
}

void StaticDimension.value(for:roundingRule:)()
{
  sub_1AC726910();
  __break(1u);
}

double StaticDimension.rawValue(in:)(void *a1)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v3 = *(double *)v1;
  v4 = *(_QWORD *)(v1 + 8) + 16;
  swift_beginAccess();
  sub_1AC68E218(v4, (uint64_t)v12);
  v5 = objc_msgSend(a1, sel_traitCollection);
  v6 = v13;
  v7 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  v8 = CustomTextStyle.scalingValues(compatibleWith:)(v5, v6, v7);
  v10 = v9;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10 * (v3 / v8);
}

UIEdgeInsets __swiftcall StaticDimension.languageAwareOutsets(compatibleWith:)(UITraitCollection compatibleWith)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  UIEdgeInsets result;

  v3 = *(_QWORD *)(v1 + 8) + 16;
  swift_beginAccess();
  sub_1AC68E218(v3, (uint64_t)v18);
  v4 = v19;
  v5 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  v6 = (void *)(*(uint64_t (**)(Class, uint64_t, uint64_t))(v5 + 8))(compatibleWith.super.isa, v4, v5);
  v7 = UIFont.languageAwareOutsets.getter();
  v9 = v8;
  v11 = v10;
  v13 = v12;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

uint64_t StaticDimension.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 8);
  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_1AC726868();
  v4 = 0;
  v5 = 0xE000000000000000;
  sub_1AC7262C8();
  sub_1AC7264D8();
  sub_1AC7262C8();
  swift_bridgeObjectRelease();
  sub_1AC7262C8();
  swift_beginAccess();
  sub_1AC68E218(v1 + 16, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BE178);
  sub_1AC726904();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  sub_1AC7262C8();
  return v4;
}

double sub_1AC721CD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(v1 + 8) + 16;
  swift_beginAccess();
  sub_1AC68E218(v3, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  v7 = UIFont.languageAwareOutsets.getter();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

double StaticDimension.constant.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

_QWORD *assignWithTake for StaticDimension(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_1AC721DDC(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1AC726928())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x1AF43FE40](0, a2);
LABEL_5:
      v6 = v5;
      sub_1AC722040();
      v7 = sub_1AC7266A0();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_1AC7266A0();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x1AF43FE40](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_1AC7266A0();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void static ViewWillDisappearReason.inferred(for:)(void *a1)
{
  id v2;
  id v3;
  unint64_t v4;
  id v5;

  v2 = objc_msgSend(a1, sel_navigationController);
  if (v2)
  {
    v5 = v2;
    v3 = objc_msgSend(v2, sel_viewControllers);
    sub_1AC722040();
    v4 = sub_1AC7263A0();

    LOBYTE(v3) = sub_1AC721DDC((uint64_t)a1, v4);
    swift_bridgeObjectRelease();
    if ((v3 & 1) == 0)
    {
      sub_1AC725FB0();

      return;
    }

  }
  if (objc_msgSend(a1, sel_isBeingDismissed))
    sub_1AC725FA4();
  else
    sub_1AC725F98();
}

unint64_t sub_1AC722040()
{
  unint64_t result;

  result = qword_1ED0BDDE8;
  if (!qword_1ED0BDDE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0BDDE8);
  }
  return result;
}

uint64_t CollectionContent.observeReloadTriggers<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[3];
  _QWORD v19[5];

  v18[1] = *v5;
  v18[2] = a1;
  swift_getAssociatedTypeWitness();
  v10 = sub_1AC725ECC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v18 - v12;
  v14 = sub_1AC69C244(0, (unint64_t *)&qword_1ED0BE0C0);
  v15 = sub_1AC726634();
  v19[3] = v14;
  v19[4] = MEMORY[0x1E0D416D8];
  v19[0] = v15;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  sub_1AC725DD0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_1AC7221C8()
{
  return swift_deallocObject();
}

void (*sub_1AC7221D8(uint64_t a1))(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;

  v3 = swift_allocObject();
  v4 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = a1;
  swift_retain();
  return sub_1AC722E64;
}

void sub_1AC722238(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t ObjectType;
  uint64_t (*v43)(uint64_t, uint64_t);
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  id v49;
  void *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  id v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[2];
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  __int128 v88;
  uint64_t v89;
  char *v90;
  id v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t AssociatedTypeWitness;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105[3];
  uint64_t v106;

  v5 = v4;
  v102 = a4;
  v103 = a1;
  v7 = sub_1AC725DB8();
  v8 = sub_1AC725DB8();
  v9 = MEMORY[0x1E0D3F890];
  v105[0] = v7;
  v105[1] = v8;
  v105[2] = MEMORY[0x1AF440830](MEMORY[0x1E0D3F890], v7);
  v106 = MEMORY[0x1AF440830](v9, v8);
  v78 = sub_1AC725AA0();
  v77 = *(_QWORD *)(v78 - 8);
  MEMORY[0x1E0C80A78](v78);
  v76 = (char *)v75 - v10;
  v11 = sub_1AC725CE0();
  MEMORY[0x1E0C80A78](v11);
  v90 = (char *)v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_1AC72610C();
  v94 = *(_QWORD *)(v89 - 8);
  MEMORY[0x1E0C80A78](v89);
  v93 = (char *)v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_1AC7266C4();
  v81 = *(_QWORD *)(v82 - 8);
  v14 = MEMORY[0x1E0C80A78](v82);
  v84 = (char *)v75 - v15;
  v83 = *(_QWORD *)(v8 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v80 = (char *)v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v79 = (char *)v75 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8BAC8);
  MEMORY[0x1E0C80A78](v19);
  v92 = (char *)v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = sub_1AC7259A4();
  v98 = *(_QWORD *)(v96 - 8);
  v21 = MEMORY[0x1E0C80A78](v96);
  v87 = (char *)v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v21);
  v95 = (char *)v75 - v24;
  v25 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1AC725BC0();
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v31 = (unint64_t)v75 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AC69C244(0, (unint64_t *)&qword_1ED0BE0C0);
  *(_QWORD *)v31 = sub_1AC726634();
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v29 + 104))(v31, *MEMORY[0x1E0DEF740], v28);
  LOBYTE(v7) = sub_1AC725BCC();
  (*(void (**)(unint64_t, uint64_t))(v29 + 8))(v31, v28);
  if ((v7 & 1) == 0)
  {
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
    v33 = sub_1AC726928();
    swift_bridgeObjectRelease();
    v35 = v95;
    v34 = v96;
    if (v33)
      goto LABEL_4;
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v105[0] = v104;
    v71 = sub_1AC72646C();
    MEMORY[0x1AF440830](MEMORY[0x1E0DEAF50], v71);
    if ((sub_1AC7265B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v72 = (uint64_t)v76;
      v73 = v97;
      CollectionContent.snapshot()();
      v74 = v78;
      sub_1AC725A40();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      CollectionContent.apply(_:animatingDifferences:completion:)(v72, *(unsigned __int8 *)(v73 + 41), 0, 0);
      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v72, v74);
    }
    return;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v25 + 16))(v27, v103, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v101 = sub_1AC72655C();
  v104 = sub_1AC726154();
  v91 = *(id *)(v5 + 32);
  v32 = objc_msgSend(v91, sel_visibleCells);
  sub_1AC69C244(0, &qword_1EEC8BAD0);
  v31 = sub_1AC7263A0();

  v85 = v8;
  v97 = v5;
  if (v31 >> 62)
    goto LABEL_35;
  v33 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
  v35 = v95;
  v34 = v96;
  if (!v33)
    goto LABEL_36;
LABEL_4:
  if (v33 >= 1)
  {
    v36 = 0;
    v103 = v31 & 0xC000000000000001;
    v88 = xmmword_1AC727FC0;
    v86 = 0x80000001AC7329A0;
    v75[1] = 0x80000001AC7329C0;
    v99 = v31;
    while (1)
    {
      if (v103)
        v37 = (id)MEMORY[0x1AF43FE40](v36, v31);
      else
        v37 = *(id *)(v31 + 8 * v36 + 32);
      v38 = v37;
      swift_getObjectType();
      v39 = swift_conformsToProtocol2();
      if (v39)
        v40 = v39;
      else
        v40 = 0;
      if (v39)
        v41 = v38;
      else
        v41 = 0;
      if (!v41)
      {

        goto LABEL_8;
      }
      ObjectType = swift_getObjectType();
      v43 = *(uint64_t (**)(uint64_t, uint64_t))(v40 + 8);
      v44 = v38;
      v45 = v43(ObjectType, v40);
      v46 = sub_1AC7267E4();
      v47 = sub_1AC723140(v46, v45);
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v47 + 16))
      {
        v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v47, ObjectType, v40);
        swift_release();
        if ((v48 & 1) != 0)
        {

        }
        else
        {
          v49 = objc_msgSend(v91, sel_indexPathForCell_, v44);
          if (!v49)
          {
            v54 = (uint64_t)v92;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56))(v92, 1, 1, v34);
LABEL_30:
            sub_1AC6916CC(v54, &qword_1EEC8BAC8);
            if (qword_1EEC8A210 != -1)
              swift_once();
            v65 = v89;
            v66 = __swift_project_value_buffer(v89, (uint64_t)qword_1EEC95CB8);
            v68 = v93;
            v67 = v94;
            (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v93, v66, v65);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8A5E0);
            sub_1AC725D10();
            *(_OWORD *)(swift_allocObject() + 16) = v88;
            sub_1AC725CD4();
            sub_1AC725CC8();
            sub_1AC725CB0();
            sub_1AC725CC8();
            v69 = v44;
            sub_1AC725CB0();

            sub_1AC725CC8();
            sub_1AC725CEC();
            sub_1AC726028();

            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v65);
            v35 = v95;
            v34 = v96;
            goto LABEL_7;
          }
          v50 = v49;
          v51 = v87;
          sub_1AC725980();

          v52 = v98;
          v53 = *(void (**)(char *, char *, uint64_t))(v98 + 32);
          v54 = (uint64_t)v92;
          v53(v92, v51, v34);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v52 + 56))(v54, 0, 1, v34);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v54, 1, v34) == 1)
            goto LABEL_30;
          v53(v35, (char *)v54, v34);
          v55 = v84;
          CollectionContent.item(for:)();
          v56 = v55;
          v57 = v83;
          v58 = v55;
          v59 = v85;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(v58, 1, v85) == 1)
          {
            (*(void (**)(char *, uint64_t))(v81 + 8))(v56, v82);
            if (qword_1EEC8A210 != -1)
              swift_once();
            v60 = v89;
            v61 = __swift_project_value_buffer(v89, (uint64_t)qword_1EEC95CB8);
            (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v93, v61, v60);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC8A5E0);
            sub_1AC725D10();
            *(_OWORD *)(swift_allocObject() + 16) = v88;
            sub_1AC725CD4();
            sub_1AC725CC8();
            sub_1AC725CB0();
            sub_1AC725CC8();
            v34 = v96;
            v106 = v96;
            boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v105);
            v63 = v98;
            v35 = v95;
            (*(void (**)(uint64_t *, char *, uint64_t))(v98 + 16))(boxed_opaque_existential_0, v95, v34);
            sub_1AC725CA4();
            sub_1AC6916CC((uint64_t)v105, (uint64_t *)&unk_1ED0BE0D0);
            sub_1AC725CC8();
            sub_1AC725CEC();
            v64 = v93;
            sub_1AC726028();

            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v94 + 8))(v64, v60);
            (*(void (**)(char *, uint64_t))(v63 + 8))(v35, v34);
          }
          else
          {
            v70 = v79;
            (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v79, v56, v59);
            (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v80, v70, v59);
            sub_1AC72646C();
            sub_1AC726430();

            (*(void (**)(char *, uint64_t))(v57 + 8))(v70, v59);
            (*(void (**)(char *, uint64_t))(v98 + 8))(v35, v34);
          }
        }
      }
      else
      {

        swift_release();
      }
LABEL_7:
      v31 = v99;
LABEL_8:
      if (v33 == ++v36)
        goto LABEL_36;
    }
  }
  __break(1u);
}

uint64_t CollectionContent.observeReloadTriggers(publishedIn:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8BAC0);
  v2 = sub_1AC725E90();
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return swift_bridgeObjectRelease();
  v4 = v2 + 32;
  do
  {
    sub_1AC68E218(v4, (uint64_t)v8);
    v5 = v9;
    v6 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    (*(void (**)(uint64_t *, _QWORD, _QWORD, uint64_t, uint64_t))(v6 + 8))(v0, *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    v4 += 40;
    --v3;
  }
  while (v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AC722E40()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1AC722E64(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_1AC722238(a1, AssociatedTypeWitness, v3, v4);
}

uint64_t sub_1AC722EC0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  unint64_t *v30;
  _OWORD v31[2];
  uint64_t v32;

  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC8BAD8);
  result = sub_1AC72682C();
  v6 = result;
  v30 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= a2)
      {
LABEL_37:
        swift_release();
        return v6;
      }
      v16 = v30[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= a2)
          goto LABEL_37;
        v16 = v30[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= a2)
            goto LABEL_37;
          v16 = v30[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= a2)
              goto LABEL_37;
            v16 = v30[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= a2)
                  goto LABEL_37;
                v16 = v30[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    sub_1AC6FB960(*(_QWORD *)(a4 + 48) + 40 * v14, (uint64_t)v31);
    result = sub_1AC7267F0();
    v18 = -1 << *(_BYTE *)(v6 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v12 + 8 * (v19 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v12 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v12 + 8 * v20);
      }
      while (v25 == -1);
      v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(_QWORD *)(v12 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v6 + 48) + 40 * v21;
    v27 = v31[0];
    v28 = v31[1];
    *(_QWORD *)(v26 + 32) = v32;
    *(_OWORD *)v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(_QWORD *)(v6 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1AC723140(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_1AC7232C0((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_1AC7232C0((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x1AF4408FC](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_1AC7232C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  BOOL v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t *v42;
  uint64_t v43;
  _BYTE v44[40];
  _OWORD v45[2];
  uint64_t v46;
  _OWORD v47[2];
  uint64_t v48;
  int64_t v49;

  v42 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v43 = 0;
    v6 = 0;
    v40 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v49 = (unint64_t)(v7 + 63) >> 6;
    v10 = a3 + 56;
    do
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
LABEL_62:
            __break(1u);
            goto LABEL_63;
          }
          if (v13 >= v49)
            goto LABEL_60;
          v14 = *(_QWORD *)(v40 + 8 * v13);
          ++v6;
          if (!v14)
          {
            v6 = v13 + 1;
            if (v13 + 1 >= v49)
              goto LABEL_60;
            v14 = *(_QWORD *)(v40 + 8 * v6);
            if (!v14)
            {
              v6 = v13 + 2;
              if (v13 + 2 >= v49)
                goto LABEL_60;
              v14 = *(_QWORD *)(v40 + 8 * v6);
              if (!v14)
              {
                v15 = v13 + 3;
                if (v15 >= v49)
                {
LABEL_60:
                  swift_retain();
                  return sub_1AC722EC0(v42, a2, v43, a3);
                }
                v14 = *(_QWORD *)(v40 + 8 * v15);
                if (!v14)
                {
                  while (1)
                  {
                    v6 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v6 >= v49)
                      goto LABEL_60;
                    v14 = *(_QWORD *)(v40 + 8 * v6);
                    ++v15;
                    if (v14)
                      goto LABEL_22;
                  }
LABEL_63:
                  __break(1u);
                  goto LABEL_64;
                }
                v6 = v15;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v12 = __clz(__rbit64(v14)) + (v6 << 6);
        }
        sub_1AC6FB960(*(_QWORD *)(a4 + 48) + 40 * v12, (uint64_t)v47);
        v45[0] = v47[0];
        v45[1] = v47[1];
        v46 = v48;
        v16 = sub_1AC7267F0();
        v17 = -1 << *(_BYTE *)(a3 + 32);
        v18 = v16 & ~v17;
        if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
          break;
LABEL_6:
        result = sub_1AC6FB99C((uint64_t)v45);
      }
      v19 = ~v17;
      while (1)
      {
        sub_1AC6FB960(*(_QWORD *)(a3 + 48) + 40 * v18, (uint64_t)v44);
        v20 = MEMORY[0x1AF43FDB0](v44, v45);
        sub_1AC6FB99C((uint64_t)v44);
        if ((v20 & 1) != 0)
          break;
        v18 = (v18 + 1) & v19;
        if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          goto LABEL_6;
      }
      result = sub_1AC6FB99C((uint64_t)v45);
      *(unint64_t *)((char *)v42 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v21 = __OFADD__(v43++, 1);
    }
    while (!v21);
    __break(1u);
  }
  v43 = 0;
  v22 = 0;
  v39 = a3 + 56;
  v23 = 1 << *(_BYTE *)(a3 + 32);
  if (v23 < 64)
    v24 = ~(-1 << v23);
  else
    v24 = -1;
  v25 = v24 & *(_QWORD *)(a3 + 56);
  v41 = (unint64_t)(v23 + 63) >> 6;
  v26 = a4 + 56;
  while (v25)
  {
    v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    v49 = v22;
    v28 = v27 | (v22 << 6);
LABEL_52:
    sub_1AC6FB960(*(_QWORD *)(a3 + 48) + 40 * v28, (uint64_t)v47);
    v33 = sub_1AC7267F0();
    v34 = -1 << *(_BYTE *)(a4 + 32);
    v35 = v33 & ~v34;
    if (((*(_QWORD *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) != 0)
    {
      v36 = ~v34;
      while (1)
      {
        sub_1AC6FB960(*(_QWORD *)(a4 + 48) + 40 * v35, (uint64_t)v45);
        v37 = MEMORY[0x1AF43FDB0](v45, v47);
        sub_1AC6FB99C((uint64_t)v45);
        if ((v37 & 1) != 0)
          break;
        v35 = (v35 + 1) & v36;
        if (((*(_QWORD *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
          goto LABEL_35;
      }
      result = sub_1AC6FB99C((uint64_t)v47);
      *(unint64_t *)((char *)v42 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      v21 = __OFADD__(v43++, 1);
      v22 = v49;
      if (v21)
      {
        __break(1u);
        goto LABEL_60;
      }
    }
    else
    {
LABEL_35:
      result = sub_1AC6FB99C((uint64_t)v47);
      v22 = v49;
    }
  }
  v29 = v22 + 1;
  if (__OFADD__(v22, 1))
    goto LABEL_62;
  if (v29 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v29);
  v31 = v22 + 1;
  if (v30)
    goto LABEL_51;
  v31 = v22 + 2;
  if (v22 + 2 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v31);
  if (v30)
    goto LABEL_51;
  v31 = v22 + 3;
  if (v22 + 3 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v31);
  if (v30)
  {
LABEL_51:
    v25 = (v30 - 1) & v30;
    v49 = v31;
    v28 = __clz(__rbit64(v30)) + (v31 << 6);
    goto LABEL_52;
  }
  v32 = v22 + 4;
  if (v22 + 4 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v32);
  if (v30)
  {
    v31 = v22 + 4;
    goto LABEL_51;
  }
  while (1)
  {
    v31 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v31 >= v41)
      goto LABEL_60;
    v30 = *(_QWORD *)(v39 + 8 * v31);
    ++v32;
    if (v30)
      goto LABEL_51;
  }
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_1AC723760()
{
  return sub_1AC725DC4();
}

uint64_t TableContent.__allocating_init<A>(_:tableView:cellProvider:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1AC6C9BD4(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1AC7244C0);
}

uint64_t TableContent.init<A>(_:tableView:cellProvider:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1AC6C9BD4(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1AC7241A0);
}

uint64_t sub_1AC72379C(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 120));
  swift_beginAccess();
  return TableContent.apply(_:animatingDifferences:completion:)(a1, *v3, 0, 0);
}

char *TableContent.__allocating_init<A>(_:tableView:cellProvider:)(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;

  v9 = *a1;
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v4 + 80);
  *(_QWORD *)(v10 + 32) = a3;
  *(_QWORD *)(v10 + 40) = a4;
  *(_QWORD *)(v10 + 48) = a1;
  v11 = *(_QWORD *)(v9 + 80);
  v12 = *(_QWORD *)(v9 + 88);
  swift_allocObject();
  v13 = swift_unknownObjectRetain();
  v14 = sub_1AC7241A0(v13, a2, (uint64_t)sub_1AC724564, v10, v11, v12);
  swift_unknownObjectRelease();

  swift_release();
  return v14;
}

uint64_t sub_1AC7238C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BE050);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  DiffableDataStatePresenter.lens(for:)(a1);
  v12 = a4(a1, a2, v11, a3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v12;
}

id TableContent.view.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 112));
}

uint64_t TableContent.animatePresenterChanges.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120));
  swift_beginAccess();
  return *v1;
}

uint64_t TableContent.animatePresenterChanges.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 120));
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*TableContent.animatePresenterChanges.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t TableContent.onSnapshotApplied.getter()
{
  return swift_retain();
}

uint64_t TableContent.snapshot()()
{
  return sub_1AC725AD0();
}

uint64_t TableContent.apply(_:animatingDifferences:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v7 = *v4;
  v8 = (uint64_t)v4 + *(_QWORD *)(*v4 + 104);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 + 80);
  v10 = sub_1AC725DB8();
  v11 = *(_QWORD *)(v7 + 88);
  v12 = sub_1AC725DB8();
  v13 = MEMORY[0x1E0D3F890];
  MEMORY[0x1AF440830](MEMORY[0x1E0D3F890], v10);
  MEMORY[0x1AF440830](v13, v12);
  v14 = sub_1AC725AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v8, a1, v14);
  swift_endAccess();
  v15 = swift_allocObject();
  swift_weakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v9;
  v16[3] = v11;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = v15;
  sub_1AC6B83FC(a3);
  swift_retain();
  sub_1AC725AC4();
  swift_release();
  return swift_release();
}

uint64_t sub_1AC723C20(void (*a1)(void))
{
  uint64_t result;

  if (a1)
    a1();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1AC725BD8();
    return swift_release();
  }
  return result;
}

uint64_t TableContent.section(for:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *v1;
  v4 = sub_1AC725DB8();
  v5 = sub_1AC725DB8();
  v6 = MEMORY[0x1E0D3F890];
  v18 = v4;
  v19 = v5;
  v20 = MEMORY[0x1AF440830](MEMORY[0x1E0D3F890], v4);
  v21 = MEMORY[0x1AF440830](v6, v5);
  v7 = sub_1AC725AA0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v15 - v9;
  v11 = (char *)v1 + *(_QWORD *)(v3 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = sub_1AC725A88();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(_QWORD *)&v16 = v12;
  v13 = sub_1AC72646C();
  MEMORY[0x1AF440830](MEMORY[0x1E0DEAF48], v13);
  sub_1AC726574();
  v16 = v17;
  v15[1] = sub_1AC725998();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EEC8BAE0);
  if ((sub_1AC726604() & 1) != 0)
  {
    sub_1AC725998();
    sub_1AC726490();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 0, 1, v4);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
    return swift_bridgeObjectRelease();
  }
}

uint64_t TableContent.indexPath(forSection:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *v1;
  v4 = sub_1AC725DB8();
  v5 = sub_1AC725DB8();
  v6 = MEMORY[0x1E0D3F890];
  v19 = v4;
  v20 = v5;
  v21 = MEMORY[0x1AF440830](MEMORY[0x1E0D3F890], v4);
  v22 = MEMORY[0x1AF440830](v6, v5);
  v7 = sub_1AC725AA0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v17 - v9;
  v11 = (char *)v1 + *(_QWORD *)(v3 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = sub_1AC725A88();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v17[1] = v12;
  v13 = sub_1AC72646C();
  MEMORY[0x1AF440830](MEMORY[0x1E0DEAF50], v13);
  MEMORY[0x1AF440830](MEMORY[0x1E0D3F898], v4);
  sub_1AC7265BC();
  swift_bridgeObjectRelease();
  if ((v18 & 1) != 0)
  {
    v14 = sub_1AC7259A4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
  else
  {
    MEMORY[0x1AF43EF40](0, v17[2]);
    v16 = sub_1AC7259A4();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a1, 0, 1, v16);
  }
}

uint64_t TableContent.item(for:)()
{
  return sub_1AC725AB8();
}

uint64_t TableContent.indexPath(forItem:)()
{
  return sub_1AC725ADC();
}

id *TableContent.deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (char *)v0 + *((_QWORD *)*v0 + 13);
  v2 = sub_1AC725DB8();
  v3 = sub_1AC725DB8();
  v4 = MEMORY[0x1E0D3F890];
  MEMORY[0x1AF440830](MEMORY[0x1E0D3F890], v2);
  MEMORY[0x1AF440830](v4, v3);
  v5 = sub_1AC725AA0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v1, v5);

  swift_release();
  return v0;
}

uint64_t TableContent.__deallocating_deinit()
{
  TableContent.deinit();
  return swift_deallocClassInstance();
}

char *sub_1AC7241A0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
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
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v7 = v6;
  v37 = a5;
  v38 = a3;
  v39 = a4;
  v40 = a2;
  v43 = a1;
  v9 = *(_QWORD *)(*(_QWORD *)v6 + 80);
  v41 = *(_QWORD *)v6;
  v10 = sub_1AC725DB8();
  v11 = *(_QWORD *)(v41 + 88);
  v12 = sub_1AC725DB8();
  v13 = MEMORY[0x1E0D3F890];
  v14 = MEMORY[0x1AF440830](MEMORY[0x1E0D3F890], v10);
  v15 = MEMORY[0x1AF440830](v13, v12);
  v46 = v10;
  v47 = v12;
  v48 = v14;
  v49 = v15;
  v36 = sub_1AC725AA0();
  v16 = sub_1AC725ECC();
  v44 = *(_QWORD *)(v16 - 8);
  v45 = v16;
  MEMORY[0x1E0C80A78](v16);
  v42 = (char *)&v35 - v17;
  v18 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v35 - v20;
  v46 = v10;
  v47 = v12;
  v48 = v14;
  v49 = v15;
  sub_1AC725AE8();
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v9;
  v22[3] = v11;
  v24 = v37;
  v23 = v38;
  v22[4] = v37;
  v22[5] = a6;
  v25 = v39;
  v22[6] = v23;
  v22[7] = v25;
  v26 = v40;
  swift_retain();
  v27 = (void *)sub_1AC725AAC();
  *((_QWORD *)v7 + 2) = v27;
  v28 = v27;
  sub_1AC725AD0();

  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v7[*(_QWORD *)(*(_QWORD *)v7 + 104)], v21, v36);
  *(_QWORD *)&v7[*(_QWORD *)(*(_QWORD *)v7 + 112)] = v26;
  v7[*(_QWORD *)(*(_QWORD *)v7 + 120)] = 1;
  sub_1AC725BF0();
  v29 = v26;
  *(_QWORD *)&v7[*(_QWORD *)(*(_QWORD *)v7 + 128)] = sub_1AC725BE4();
  (*(void (**)(uint64_t, uint64_t))(a6 + 32))(v24, a6);
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v24;
  *(_QWORD *)(v30 + 24) = a6;
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = v24;
  v31[3] = a6;
  v31[4] = sub_1AC724724;
  v31[5] = v30;
  v32 = sub_1AC725BF0();
  MEMORY[0x1AF440830](MEMORY[0x1E0D3F3D8], v32);
  sub_1AC725DC4();
  v33 = v42;
  sub_1AC725DD0();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v45);
  (*(void (**)(uint64_t, uint64_t))(a6 + 40))(v24, a6);
  return v7;
}

char *sub_1AC7244C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  return sub_1AC7241A0(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1AC724538()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC724564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1AC7238C8(a1, a2, a3, *(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t))(v3 + 32));
}

uint64_t sub_1AC724574()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1AC724598()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC7245CC()
{
  uint64_t v0;

  return sub_1AC723C20(*(void (**)(void))(v0 + 32));
}

uint64_t sub_1AC7245DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  unint64_t v4;

  v0 = sub_1AC725DB8();
  v1 = sub_1AC725DB8();
  v2 = MEMORY[0x1E0D3F890];
  MEMORY[0x1AF440830](MEMORY[0x1E0D3F890], v0);
  MEMORY[0x1AF440830](v2, v1);
  result = sub_1AC725AA0();
  if (v4 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for TableContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TableContent);
}

uint64_t method lookup function for TableContent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TableContent.__allocating_init<A>(_:tableView:cellProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_1AC7246F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC724714()
{
  return swift_deallocObject();
}

uint64_t (*sub_1AC724724(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v3 + 32) = a1;
  swift_retain();
  return sub_1AC7247CC;
}

uint64_t sub_1AC724784()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC7247A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC7247CC(uint64_t a1)
{
  return sub_1AC72379C(a1);
}

void UICollectionView.registerComponent<A>(_:)()
{
  void *v0;
  uint64_t ObjCClassFromMetadata;
  id v2;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  swift_getAssociatedTypeWitness();
  sub_1AC726BEC();
  v2 = (id)sub_1AC726208();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v2);

}

void UICollectionView.registerComponent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for JUComponentCollectionViewCell(0, a2, a3, a4);
  UICollectionView.registerComponent<A>(_:)();
}

uint64_t UICollectionView.dequeueComponent(forContentsOf:with:at:asPartOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  id v14;
  uint64_t result;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BE020);
  sub_1AC725D94();
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  swift_getDynamicType();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  sub_1AC726BEC();
  v8 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1AC725974();
  v10 = objc_msgSend(v4, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v8, v9);

  type metadata accessor for JUAnyComponentCollectionViewCell();
  v11 = (_QWORD *)swift_dynamicCastClass();
  if (v11)
  {
    v12 = v11;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v11) + 0x50);
    v14 = v10;
    v13(a1, a2, a4);

    return (uint64_t)v12;
  }
  else
  {
    v16 = objc_msgSend(v10, sel_description);
    v17 = sub_1AC72622C();
    v19 = v18;

    v20[0] = v17;
    v20[1] = v19;
    sub_1AC7262C8();
    swift_getObjectType();
    sub_1AC726BEC();
    sub_1AC7262C8();
    swift_bridgeObjectRelease();
    result = sub_1AC726910();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AC724A70()
{
  uint64_t result;

  result = sub_1AC726208();
  qword_1EEC8BB68 = result;
  return result;
}

id static CustomLayoutView.didInvalidateMeasurementsNotification.getter()
{
  if (qword_1EEC8A290 != -1)
    swift_once();
  return (id)qword_1EEC8BB68;
}

uint64_t sub_1AC724AE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  a1[3] = (uint64_t)&type metadata for VerticalStack;
  a1[4] = (uint64_t)&protocol witness table for VerticalStack;
  result = swift_allocObject();
  *a1 = result;
  *(_QWORD *)(result + 40) = &type metadata for ZeroDimension;
  *(_QWORD *)(result + 48) = &protocol witness table for ZeroDimension;
  *(_QWORD *)(result + 80) = &type metadata for ZeroDimension;
  *(_QWORD *)(result + 88) = &protocol witness table for ZeroDimension;
  *(_BYTE *)(result + 96) = 0;
  *(_QWORD *)(result + 104) = 0;
  *(_BYTE *)(result + 112) = 0;
  *(_QWORD *)(result + 120) = MEMORY[0x1E0DEE9D8];
  return result;
}

uint64_t sub_1AC724B5C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1AC724B90()
{
  void *v0;
  id v1;
  id v2;
  _QWORD *v3;
  id v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1EEC8A290 != -1)
    swift_once();
  objc_msgSend(v1, sel_postNotificationName_object_, qword_1EEC8BB68, v0);

  objc_msgSend(v0, sel_setNeedsLayout);
  objc_msgSend(v0, sel_invalidateIntrinsicContentSize);
  v2 = objc_msgSend(v0, sel_superview);
  if (!v2)
    goto LABEL_7;
  v4 = v2;
  type metadata accessor for CustomLayoutView();
  v3 = (_QWORD *)swift_dynamicCastClass();
  if (!v3)
  {

LABEL_7:
    v4 = objc_msgSend(v0, sel_superview);
    objc_msgSend(v4, sel_setNeedsLayout);
    goto LABEL_8;
  }
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x58))();
LABEL_8:

}

JUMeasurements __swiftcall CustomLayoutView.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  _QWORD *v2;
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  double v8;
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
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  JUMeasurements result;

  height = toFit.height;
  width = toFit.width;
  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x50))(v19);
  v6 = v20;
  v7 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  v8 = (*(double (**)(Class, uint64_t, uint64_t, double, double))(v7 + 8))(with.super.isa, v6, v7, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

double CustomLayoutView.intrinsicContentSize.getter()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v1 = objc_msgSend(v0, sel_traitCollection);
  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50))(v6);
  v2 = v7;
  v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v4 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v3 + 8))(v1, v2, v3, 0.0, 0.0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);

  return v4;
}

id CustomLayoutView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id CustomLayoutView.init(frame:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for CustomLayoutView();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id CustomLayoutView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id CustomLayoutView.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for CustomLayoutView();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id CustomLayoutView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CustomLayoutView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for CustomLayoutView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CustomLayoutView.customLayout.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50))();
}

uint64_t dispatch thunk of CustomLayoutView.invalidateMeasurements()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of CustomLayoutView.willLayout()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CustomLayoutView.didLayout()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t Constrain.init(_:width:height:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, unsigned __int8 a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  __int128 v24[2];

  v16 = a1[3];
  v17 = a1[5];
  v18 = a3 | a5;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  v19 = Measurable.placeable.getter(v16, v17, v24);
  if ((v18 & 1) == 0)
  {
    MEMORY[0x1E0C80A78](v19);
    v19 = sub_1AC7260D0();
  }
  if (((a7 | a10) & 1) == 0)
  {
    MEMORY[0x1E0C80A78](v19);
    sub_1AC7260D0();
  }
  sub_1AC68AAA4(v24, a9);
  *(_QWORD *)(a9 + 40) = a2;
  *(_BYTE *)(a9 + 48) = a3 & 1;
  *(_QWORD *)(a9 + 56) = a4;
  *(_BYTE *)(a9 + 64) = a5 & 1;
  *(_QWORD *)(a9 + 72) = a6;
  *(_BYTE *)(a9 + 80) = a7 & 1;
  *(_QWORD *)(a9 + 88) = a8;
  *(_BYTE *)(a9 + 96) = a10 & 1;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

BOOL sub_1AC7253C4()
{
  uint64_t v0;

  return sub_1AC6A4C3C(*(double *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t Placement.init(child:frame:baselines:)@<X0>(uint64_t a1@<X0>, double *a2@<X1>, double *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  double v13;
  double v14;
  uint64_t result;

  v13 = *a2;
  v14 = a2[1];
  sub_1AC68E218(a1, (uint64_t)a3);
  a3[5] = floor(a4);
  a3[6] = floor(a5);
  a3[7] = ceil(a6);
  a3[8] = ceil(a7);
  result = __swift_destroy_boxed_opaque_existential_1(a1);
  a3[9] = floor(v13);
  a3[10] = floor(v14);
  return result;
}

Swift::Void __swiftcall Placement.place(inCoordinateSpaceOf:with:)(__C::CGRect inCoordinateSpaceOf, UITraitCollection with)
{
  double *v2;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat MinX;
  double v15;
  CGFloat MaxX;
  CGFloat ty;
  CGFloat tx;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = inCoordinateSpaceOf.size.height;
  width = inCoordinateSpaceOf.size.width;
  y = inCoordinateSpaceOf.origin.y;
  x = inCoordinateSpaceOf.origin.x;
  sub_1AC68E218((uint64_t)v2, (uint64_t)v23);
  v8 = v24;
  v9 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  v10 = v2[5];
  v11 = v2[6];
  v12 = v2[7];
  v13 = v2[8];
  if (-[objc_class layoutDirection](with.super.isa, sel_layoutDirection) == (id)1)
  {
    CGAffineTransformMakeScale(&v22, -1.0, 1.0);
    v19 = *(_OWORD *)&v22.c;
    v20 = *(_OWORD *)&v22.a;
    ty = v22.ty;
    tx = v22.tx;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MinX = CGRectGetMinX(v26);
    v27.size.height = height;
    v15 = MinX;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    MaxX = CGRectGetMaxX(v27);
    *(_OWORD *)&v22.a = v20;
    *(_OWORD *)&v22.c = v19;
    v22.tx = tx;
    v22.ty = ty;
    CGAffineTransformTranslate(&v21, &v22, -(v15 + MaxX), 0.0);
    v22 = v21;
    v28.origin.x = v10;
    v28.origin.y = v11;
    v28.size.width = v12;
    v28.size.height = v13;
    v29 = CGRectApplyAffineTransform(v28, &v22);
    v10 = v29.origin.x;
    v11 = v29.origin.y;
    v12 = v29.size.width;
    v13 = v29.size.height;
  }
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v9 + 16))(with.super.isa, v8, v9, v10, v11, v12, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t Placement.init(child:verbatimFrame:verbatimBaselines:)@<X0>(__int128 *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  v12 = *a2;
  v13 = a2[1];
  result = sub_1AC68AAA4(a1, a3);
  *(double *)(a3 + 40) = a4;
  *(double *)(a3 + 48) = a5;
  *(double *)(a3 + 56) = a6;
  *(double *)(a3 + 64) = a7;
  *(_QWORD *)(a3 + 72) = v12;
  *(_QWORD *)(a3 + 80) = v13;
  return result;
}

uint64_t Placement.child.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AC68E218(v1, a1);
}

uint64_t Placement.child.setter(__int128 *a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v1);
  return sub_1AC68AAA4(a1, v1);
}

double (*Placement.child.modify())(void)
{
  return nullsub_1;
}

double Placement.frame.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

void Placement.frame.setter(double a1, double a2, double a3, double a4)
{
  double *v4;

  v4[5] = a1;
  v4[6] = a2;
  v4[7] = a3;
  v4[8] = a4;
}

double (*Placement.frame.modify())(void)
{
  return nullsub_1;
}

__n128 Placement.baselines.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)(v1 + 72);
  *a1 = result;
  return result;
}

__n128 Placement.baselines.setter(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  result = *a1;
  *(__n128 *)(v1 + 72) = *a1;
  return result;
}

double (*Placement.baselines.modify())(void)
{
  return nullsub_1;
}

uint64_t initializeWithCopy for Placement(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

uint64_t *assignWithCopy for Placement(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  return a1;
}

uint64_t assignWithTake for Placement(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

ValueMetadata *type metadata accessor for Placement()
{
  return &type metadata for Placement;
}

uint64_t sub_1AC7257DC()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1AC7257E8()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1AC7257F4()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1AC725800()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1AC72580C()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1AC725818()
{
  return MEMORY[0x1E0CAE410]();
}

uint64_t sub_1AC725824()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1AC725830()
{
  return MEMORY[0x1E0CAE438]();
}

uint64_t sub_1AC72583C()
{
  return MEMORY[0x1E0CAE490]();
}

uint64_t sub_1AC725848()
{
  return MEMORY[0x1E0CAE4A8]();
}

uint64_t sub_1AC725854()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1AC725860()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1AC72586C()
{
  return MEMORY[0x1E0CAF998]();
}

uint64_t sub_1AC725878()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1AC725884()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1AC725890()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1AC72589C()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1AC7258A8()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1AC7258B4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1AC7258C0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1AC7258CC()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1AC7258D8()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1AC7258E4()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1AC7258F0()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1AC7258FC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1AC725908()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1AC725914()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1AC725920()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1AC72592C()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1AC725938()
{
  return MEMORY[0x1E0CB0B28]();
}

uint64_t sub_1AC725944()
{
  return MEMORY[0x1E0CB0BD0]();
}

uint64_t sub_1AC725950()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1AC72595C()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1AC725968()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1AC725974()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1AC725980()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1AC72598C()
{
  return MEMORY[0x1E0DC1A38]();
}

uint64_t sub_1AC725998()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_1AC7259A4()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1AC7259B0()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_1AC7259BC()
{
  return MEMORY[0x1E0CB1720]();
}

uint64_t sub_1AC7259C8()
{
  return MEMORY[0x1E0CB1728]();
}

uint64_t sub_1AC7259D4()
{
  return MEMORY[0x1E0CB1738]();
}

uint64_t sub_1AC7259E0()
{
  return MEMORY[0x1E0DDB338]();
}

uint64_t sub_1AC7259EC()
{
  return MEMORY[0x1E0DDB348]();
}

uint64_t sub_1AC7259F8()
{
  return MEMORY[0x1E0DDB358]();
}

uint64_t sub_1AC725A04()
{
  return MEMORY[0x1E0DDB360]();
}

uint64_t sub_1AC725A10()
{
  return MEMORY[0x1E0DDB368]();
}

uint64_t sub_1AC725A1C()
{
  return MEMORY[0x1E0DDB3B0]();
}

uint64_t sub_1AC725A28()
{
  return MEMORY[0x1E0DDB3D8]();
}

uint64_t sub_1AC725A34()
{
  return MEMORY[0x1E0DC23E0]();
}

uint64_t sub_1AC725A40()
{
  return MEMORY[0x1E0DC2418]();
}

uint64_t sub_1AC725A4C()
{
  return MEMORY[0x1E0DC2430]();
}

uint64_t sub_1AC725A58()
{
  return MEMORY[0x1E0DC2448]();
}

uint64_t sub_1AC725A64()
{
  return MEMORY[0x1E0DC2460]();
}

uint64_t sub_1AC725A70()
{
  return MEMORY[0x1E0DC2468]();
}

uint64_t sub_1AC725A7C()
{
  return MEMORY[0x1E0DC2470]();
}

uint64_t sub_1AC725A88()
{
  return MEMORY[0x1E0DC2490]();
}

uint64_t sub_1AC725A94()
{
  return MEMORY[0x1E0DC24D0]();
}

uint64_t sub_1AC725AA0()
{
  return MEMORY[0x1E0DC24D8]();
}

uint64_t sub_1AC725AAC()
{
  return MEMORY[0x1E0DC2590]();
}

uint64_t sub_1AC725AB8()
{
  return MEMORY[0x1E0DC25A8]();
}

uint64_t sub_1AC725AC4()
{
  return MEMORY[0x1E0DC25B8]();
}

uint64_t sub_1AC725AD0()
{
  return MEMORY[0x1E0DC25C0]();
}

uint64_t sub_1AC725ADC()
{
  return MEMORY[0x1E0DC25C8]();
}

uint64_t sub_1AC725AE8()
{
  return MEMORY[0x1E0DC25D0]();
}

uint64_t sub_1AC725AF4()
{
  return MEMORY[0x1E0DC2720]();
}

uint64_t sub_1AC725B00()
{
  return MEMORY[0x1E0DC2738]();
}

uint64_t sub_1AC725B0C()
{
  return MEMORY[0x1E0DC2750]();
}

uint64_t sub_1AC725B18()
{
  return MEMORY[0x1E0DC2758]();
}

uint64_t sub_1AC725B24()
{
  return MEMORY[0x1E0DC27A0]();
}

uint64_t sub_1AC725B30()
{
  return MEMORY[0x1E0DC27B8]();
}

uint64_t sub_1AC725B3C()
{
  return MEMORY[0x1E0DC27C8]();
}

uint64_t sub_1AC725B48()
{
  return MEMORY[0x1E0DC27D0]();
}

uint64_t sub_1AC725B54()
{
  return MEMORY[0x1E0DC27D8]();
}

uint64_t sub_1AC725B60()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1AC725B6C()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1AC725B78()
{
  return MEMORY[0x1E0DDB3E8]();
}

uint64_t sub_1AC725B84()
{
  return MEMORY[0x1E0DDB3F8]();
}

uint64_t sub_1AC725B90()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_1AC725B9C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1AC725BA8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1AC725BB4()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1AC725BC0()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1AC725BCC()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1AC725BD8()
{
  return MEMORY[0x1E0D3F3B0]();
}

uint64_t sub_1AC725BE4()
{
  return MEMORY[0x1E0D3F3B8]();
}

uint64_t sub_1AC725BF0()
{
  return MEMORY[0x1E0D3F3C8]();
}

uint64_t sub_1AC725BFC()
{
  return MEMORY[0x1E0D3F458]();
}

uint64_t sub_1AC725C08()
{
  return MEMORY[0x1E0D3F460]();
}

uint64_t sub_1AC725C14()
{
  return MEMORY[0x1E0D3F478]();
}

uint64_t sub_1AC725C20()
{
  return MEMORY[0x1E0D3F480]();
}

uint64_t sub_1AC725C2C()
{
  return MEMORY[0x1E0D3F488]();
}

uint64_t sub_1AC725C38()
{
  return MEMORY[0x1E0D3F490]();
}

uint64_t sub_1AC725C44()
{
  return MEMORY[0x1E0D3F4A0]();
}

uint64_t sub_1AC725C50()
{
  return MEMORY[0x1E0D3F4D0]();
}

uint64_t sub_1AC725C5C()
{
  return MEMORY[0x1E0D3F4D8]();
}

uint64_t sub_1AC725C68()
{
  return MEMORY[0x1E0D3F4E8]();
}

uint64_t sub_1AC725C74()
{
  return MEMORY[0x1E0D3F500]();
}

uint64_t sub_1AC725C80()
{
  return MEMORY[0x1E0D3F518]();
}

uint64_t sub_1AC725C8C()
{
  return MEMORY[0x1E0D3F528]();
}

uint64_t sub_1AC725C98()
{
  return MEMORY[0x1E0D3F540]();
}

uint64_t sub_1AC725CA4()
{
  return MEMORY[0x1E0D3F548]();
}

uint64_t sub_1AC725CB0()
{
  return MEMORY[0x1E0D3F550]();
}

uint64_t sub_1AC725CBC()
{
  return MEMORY[0x1E0D3F558]();
}

uint64_t sub_1AC725CC8()
{
  return MEMORY[0x1E0D3F560]();
}

uint64_t sub_1AC725CD4()
{
  return MEMORY[0x1E0D3F568]();
}

uint64_t sub_1AC725CE0()
{
  return MEMORY[0x1E0D3F570]();
}

uint64_t sub_1AC725CEC()
{
  return MEMORY[0x1E0D3F578]();
}

uint64_t sub_1AC725CF8()
{
  return MEMORY[0x1E0D3F580]();
}

uint64_t sub_1AC725D04()
{
  return MEMORY[0x1E0D3F598]();
}

uint64_t sub_1AC725D10()
{
  return MEMORY[0x1E0D3F5A0]();
}

uint64_t sub_1AC725D1C()
{
  return MEMORY[0x1E0D3F5B0]();
}

uint64_t sub_1AC725D28()
{
  return MEMORY[0x1E0D3F5B8]();
}

uint64_t sub_1AC725D34()
{
  return MEMORY[0x1E0D3F5C0]();
}

uint64_t sub_1AC725D40()
{
  return MEMORY[0x1E0D3F630]();
}

uint64_t sub_1AC725D4C()
{
  return MEMORY[0x1E0D3F650]();
}

uint64_t sub_1AC725D58()
{
  return MEMORY[0x1E0D3F660]();
}

uint64_t sub_1AC725D64()
{
  return MEMORY[0x1E0D3F678]();
}

uint64_t sub_1AC725D70()
{
  return MEMORY[0x1E0D3F6B8]();
}

uint64_t sub_1AC725D7C()
{
  return MEMORY[0x1E0D3F700]();
}

uint64_t sub_1AC725D88()
{
  return MEMORY[0x1E0D3F850]();
}

uint64_t sub_1AC725D94()
{
  return MEMORY[0x1E0D3F858]();
}

uint64_t sub_1AC725DA0()
{
  return MEMORY[0x1E0D3F868]();
}

uint64_t sub_1AC725DAC()
{
  return MEMORY[0x1E0D3F870]();
}

uint64_t sub_1AC725DB8()
{
  return MEMORY[0x1E0D3F878]();
}

uint64_t sub_1AC725DC4()
{
  return MEMORY[0x1E0D3F8B0]();
}

uint64_t sub_1AC725DD0()
{
  return MEMORY[0x1E0D3F8B8]();
}

uint64_t sub_1AC725DDC()
{
  return MEMORY[0x1E0D3F988]();
}

uint64_t sub_1AC725DE8()
{
  return MEMORY[0x1E0D3F998]();
}

uint64_t sub_1AC725DF4()
{
  return MEMORY[0x1E0D3F9A8]();
}

uint64_t sub_1AC725E00()
{
  return MEMORY[0x1E0D3F9B0]();
}

uint64_t sub_1AC725E0C()
{
  return MEMORY[0x1E0D3F9B8]();
}

uint64_t sub_1AC725E18()
{
  return MEMORY[0x1E0D3F9C8]();
}

uint64_t sub_1AC725E24()
{
  return MEMORY[0x1E0D3FAE8]();
}

uint64_t sub_1AC725E30()
{
  return MEMORY[0x1E0D3FAF0]();
}

uint64_t sub_1AC725E3C()
{
  return MEMORY[0x1E0D3FAF8]();
}

uint64_t sub_1AC725E48()
{
  return MEMORY[0x1E0D3FB08]();
}

uint64_t sub_1AC725E54()
{
  return MEMORY[0x1E0D3FB10]();
}

uint64_t sub_1AC725E60()
{
  return MEMORY[0x1E0D3FB20]();
}

uint64_t sub_1AC725E6C()
{
  return MEMORY[0x1E0D3FC08]();
}

uint64_t sub_1AC725E78()
{
  return MEMORY[0x1E0D3FC28]();
}

uint64_t sub_1AC725E84()
{
  return MEMORY[0x1E0D3FC50]();
}

uint64_t sub_1AC725E90()
{
  return MEMORY[0x1E0D3FCE0]();
}

uint64_t sub_1AC725E9C()
{
  return MEMORY[0x1E0D3FD20]();
}

uint64_t sub_1AC725EA8()
{
  return MEMORY[0x1E0D3FED0]();
}

uint64_t sub_1AC725EB4()
{
  return MEMORY[0x1E0D3FEF8]();
}

uint64_t sub_1AC725EC0()
{
  return MEMORY[0x1E0D3FF08]();
}

uint64_t sub_1AC725ECC()
{
  return MEMORY[0x1E0D40120]();
}

uint64_t sub_1AC725ED8()
{
  return MEMORY[0x1E0D40140]();
}

uint64_t sub_1AC725EE4()
{
  return MEMORY[0x1E0D40148]();
}

uint64_t sub_1AC725EF0()
{
  return MEMORY[0x1E0D401F0]();
}

uint64_t sub_1AC725EFC()
{
  return MEMORY[0x1E0D40250]();
}

uint64_t sub_1AC725F08()
{
  return MEMORY[0x1E0D40258]();
}

uint64_t sub_1AC725F14()
{
  return MEMORY[0x1E0D40268]();
}

uint64_t sub_1AC725F20()
{
  return MEMORY[0x1E0D40278]();
}

uint64_t sub_1AC725F2C()
{
  return MEMORY[0x1E0D40280]();
}

uint64_t sub_1AC725F38()
{
  return MEMORY[0x1E0D40338]();
}

uint64_t sub_1AC725F44()
{
  return MEMORY[0x1E0D40360]();
}

uint64_t sub_1AC725F50()
{
  return MEMORY[0x1E0D40378]();
}

uint64_t sub_1AC725F5C()
{
  return MEMORY[0x1E0D40380]();
}

uint64_t sub_1AC725F68()
{
  return MEMORY[0x1E0D40388]();
}

uint64_t sub_1AC725F74()
{
  return MEMORY[0x1E0D40570]();
}

uint64_t sub_1AC725F80()
{
  return MEMORY[0x1E0D40948]();
}

uint64_t sub_1AC725F8C()
{
  return MEMORY[0x1E0D409E8]();
}

uint64_t sub_1AC725F98()
{
  return MEMORY[0x1E0D40A28]();
}

uint64_t sub_1AC725FA4()
{
  return MEMORY[0x1E0D40A30]();
}

uint64_t sub_1AC725FB0()
{
  return MEMORY[0x1E0D40A38]();
}

uint64_t sub_1AC725FBC()
{
  return MEMORY[0x1E0D40A58]();
}

uint64_t sub_1AC725FC8()
{
  return MEMORY[0x1E0D40A78]();
}

uint64_t sub_1AC725FD4()
{
  return MEMORY[0x1E0D40A80]();
}

uint64_t sub_1AC725FE0()
{
  return MEMORY[0x1E0D40AC8]();
}

uint64_t sub_1AC725FEC()
{
  return MEMORY[0x1E0D40AD8]();
}

uint64_t sub_1AC725FF8()
{
  return MEMORY[0x1E0D40AE0]();
}

uint64_t sub_1AC726004()
{
  return MEMORY[0x1E0D41018]();
}

uint64_t sub_1AC726010()
{
  return MEMORY[0x1E0D41020]();
}

uint64_t sub_1AC72601C()
{
  return MEMORY[0x1E0D41028]();
}

uint64_t sub_1AC726028()
{
  return MEMORY[0x1E0D41030]();
}

uint64_t sub_1AC726034()
{
  return MEMORY[0x1E0D41078]();
}

uint64_t sub_1AC726040()
{
  return MEMORY[0x1E0D41090]();
}

uint64_t sub_1AC72604C()
{
  return MEMORY[0x1E0D41098]();
}

uint64_t sub_1AC726058()
{
  return MEMORY[0x1E0D410A0]();
}

uint64_t sub_1AC726064()
{
  return MEMORY[0x1E0D410A8]();
}

uint64_t sub_1AC726070()
{
  return MEMORY[0x1E0D410B0]();
}

uint64_t sub_1AC72607C()
{
  return MEMORY[0x1E0D410B8]();
}

uint64_t sub_1AC726088()
{
  return MEMORY[0x1E0D410D8]();
}

uint64_t sub_1AC726094()
{
  return MEMORY[0x1E0D410E0]();
}

uint64_t sub_1AC7260A0()
{
  return MEMORY[0x1E0D410F0]();
}

uint64_t sub_1AC7260AC()
{
  return MEMORY[0x1E0D41108]();
}

uint64_t sub_1AC7260B8()
{
  return MEMORY[0x1E0D41110]();
}

uint64_t sub_1AC7260C4()
{
  return MEMORY[0x1E0D412F0]();
}

uint64_t sub_1AC7260D0()
{
  return MEMORY[0x1E0D41380]();
}

uint64_t sub_1AC7260DC()
{
  return MEMORY[0x1E0D413B8]();
}

uint64_t sub_1AC7260E8()
{
  return MEMORY[0x1E0D413D0]();
}

uint64_t sub_1AC7260F4()
{
  return MEMORY[0x1E0D413D8]();
}

uint64_t sub_1AC726100()
{
  return MEMORY[0x1E0D413E0]();
}

uint64_t sub_1AC72610C()
{
  return MEMORY[0x1E0D413F0]();
}

uint64_t sub_1AC726118()
{
  return MEMORY[0x1E0D41500]();
}

uint64_t sub_1AC726124()
{
  return MEMORY[0x1E0D415E8]();
}

uint64_t sub_1AC726130()
{
  return MEMORY[0x1E0D41610]();
}

uint64_t sub_1AC72613C()
{
  return MEMORY[0x1E0D41620]();
}

uint64_t sub_1AC726148()
{
  return MEMORY[0x1E0D41640]();
}

uint64_t sub_1AC726154()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1AC726160()
{
  return MEMORY[0x1E0DE9E18]();
}

uint64_t sub_1AC72616C()
{
  return MEMORY[0x1E0DE9E28]();
}

uint64_t sub_1AC726178()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1AC726184()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1AC726190()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1AC72619C()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1AC7261A8()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1AC7261B4()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1AC7261C0()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1AC7261CC()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1AC7261D8()
{
  return MEMORY[0x1E0DEA398]();
}

uint64_t sub_1AC7261E4()
{
  return MEMORY[0x1E0DEA3A0]();
}

uint64_t sub_1AC7261F0()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1AC7261FC()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1AC726208()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1AC726214()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1AC726220()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1AC72622C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1AC726238()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1AC726244()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1AC726250()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1AC72625C()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1AC726268()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1AC726274()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1AC726280()
{
  return MEMORY[0x1E0DEA6A0]();
}

uint64_t sub_1AC72628C()
{
  return MEMORY[0x1E0DEA6A8]();
}

uint64_t sub_1AC726298()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1AC7262A4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1AC7262B0()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1AC7262BC()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1AC7262C8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1AC7262D4()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1AC7262E0()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1AC7262EC()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1AC7262F8()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1AC726304()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_1AC726310()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1AC72631C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1AC726328()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1AC726334()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1AC726340()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1AC72634C()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1AC726358()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1AC726364()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_1AC726370()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1AC72637C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1AC726388()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1AC726394()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1AC7263A0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1AC7263AC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1AC7263B8()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1AC7263C4()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1AC7263D0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1AC7263DC()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1AC7263E8()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1AC7263F4()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1AC726400()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1AC72640C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1AC726418()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1AC726424()
{
  return MEMORY[0x1E0DEAE78]();
}

uint64_t sub_1AC726430()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1AC72643C()
{
  return MEMORY[0x1E0DEAE88]();
}

uint64_t sub_1AC726448()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1AC726454()
{
  return MEMORY[0x1E0DEAEA0]();
}

uint64_t sub_1AC726460()
{
  return MEMORY[0x1E0DEAEB8]();
}

uint64_t sub_1AC72646C()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1AC726478()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1AC726484()
{
  return MEMORY[0x1E0DEAF08]();
}

uint64_t sub_1AC726490()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1AC72649C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1AC7264A8()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1AC7264B4()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1AC7264C0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1AC7264CC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1AC7264D8()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1AC7264E4()
{
  return MEMORY[0x1E0DEAFF8]();
}

uint64_t sub_1AC7264F0()
{
  return MEMORY[0x1E0DEB060]();
}

uint64_t sub_1AC7264FC()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1AC726508()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1AC726514()
{
  return MEMORY[0x1E0DEB2E0]();
}

uint64_t sub_1AC726520()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_1AC72652C()
{
  return MEMORY[0x1E0DEB300]();
}

uint64_t sub_1AC726538()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1AC726544()
{
  return MEMORY[0x1E0DEB340]();
}

uint64_t sub_1AC726550()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1AC72655C()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1AC726568()
{
  return MEMORY[0x1E0DEB498]();
}

uint64_t sub_1AC726574()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_1AC726580()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1AC72658C()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1AC726598()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1AC7265A4()
{
  return MEMORY[0x1E0DEB5D0]();
}

uint64_t sub_1AC7265B0()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1AC7265BC()
{
  return MEMORY[0x1E0DEB6A8]();
}

uint64_t sub_1AC7265C8()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1AC7265D4()
{
  return MEMORY[0x1E0DEB748]();
}

uint64_t sub_1AC7265E0()
{
  return MEMORY[0x1E0DEB7A0]();
}

uint64_t sub_1AC7265EC()
{
  return MEMORY[0x1E0DEB7F8]();
}

uint64_t sub_1AC7265F8()
{
  return MEMORY[0x1E0DEB810]();
}

uint64_t sub_1AC726604()
{
  return MEMORY[0x1E0DEB838]();
}

uint64_t sub_1AC726610()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1AC72661C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1AC726628()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1AC726634()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1AC726640()
{
  return MEMORY[0x1E0DEF8F0]();
}

uint64_t sub_1AC72664C()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1AC726658()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1AC726664()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1AC726670()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1AC72667C()
{
  return MEMORY[0x1E0DC2F48]();
}

uint64_t sub_1AC726688()
{
  return MEMORY[0x1E0DC2FE8]();
}

uint64_t sub_1AC726694()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1AC7266A0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1AC7266AC()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_1AC7266B8()
{
  return MEMORY[0x1E0CB2168]();
}

uint64_t sub_1AC7266C4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1AC7266D0()
{
  return MEMORY[0x1E0DEBA80]();
}

uint64_t sub_1AC7266DC()
{
  return MEMORY[0x1E0DEBAD8]();
}

uint64_t sub_1AC7266E8()
{
  return MEMORY[0x1E0DEBB58]();
}

uint64_t sub_1AC7266F4()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1AC726700()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_1AC72670C()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1AC726718()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1AC726724()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1AC726730()
{
  return MEMORY[0x1E0DEBEA8]();
}

uint64_t sub_1AC72673C()
{
  return MEMORY[0x1E0DEBEE0]();
}

uint64_t sub_1AC726748()
{
  return MEMORY[0x1E0DEBF08]();
}

uint64_t sub_1AC726754()
{
  return MEMORY[0x1E0DEBF58]();
}

uint64_t sub_1AC726760()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1AC72676C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1AC726778()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1AC726784()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1AC726790()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1AC72679C()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1AC7267A8()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1AC7267B4()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1AC7267C0()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1AC7267CC()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1AC7267D8()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1AC7267E4()
{
  return MEMORY[0x1E0DEC140]();
}

uint64_t sub_1AC7267F0()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1AC7267FC()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1AC726808()
{
  return MEMORY[0x1E0DEC1D0]();
}

uint64_t sub_1AC726814()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1AC726820()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1AC72682C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1AC726838()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1AC726844()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1AC726850()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_1AC72685C()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1AC726868()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1AC726874()
{
  return MEMORY[0x1E0DEC2F0]();
}

uint64_t sub_1AC726880()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1AC72688C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1AC726898()
{
  return MEMORY[0x1E0DEC440]();
}

uint64_t sub_1AC7268A4()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1AC7268B0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1AC7268BC()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_1AC7268C8()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t sub_1AC7268D4()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1AC7268E0()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1AC7268EC()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1AC7268F8()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1AC726904()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1AC726910()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1AC72691C()
{
  return MEMORY[0x1E0DECC10]();
}

uint64_t sub_1AC726928()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1AC726934()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1AC726940()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1AC72694C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1AC726958()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1AC726964()
{
  return MEMORY[0x1E0DECDC8]();
}

uint64_t sub_1AC726970()
{
  return MEMORY[0x1E0DECDE0]();
}

uint64_t sub_1AC72697C()
{
  return MEMORY[0x1E0DECDF0]();
}

uint64_t sub_1AC726988()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1AC726994()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1AC7269A0()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1AC7269AC()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1AC7269B8()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1AC7269C4()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1AC7269D0()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1AC7269DC()
{
  return MEMORY[0x1E0DED030]();
}

uint64_t sub_1AC7269E8()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1AC7269F4()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1AC726A00()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1AC726A0C()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1AC726A18()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1AC726A24()
{
  return MEMORY[0x1E0DED160]();
}

uint64_t sub_1AC726A30()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1AC726A3C()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1AC726A48()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1AC726A54()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1AC726A60()
{
  return MEMORY[0x1E0DED560]();
}

uint64_t sub_1AC726A6C()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1AC726A78()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1AC726A84()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1AC726A90()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1AC726A9C()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1AC726AA8()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1AC726AB4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1AC726AC0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1AC726ACC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1AC726AD8()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1AC726AE4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1AC726AF0()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1AC726AFC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1AC726B08()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1AC726B14()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1AC726B20()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1AC726B2C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1AC726B38()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1AC726B44()
{
  return MEMORY[0x1E0DEE238]();
}

uint64_t sub_1AC726B50()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1AC726B5C()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1AC726B68()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1AC726B74()
{
  return MEMORY[0x1E0DEE400]();
}

uint64_t sub_1AC726B80()
{
  return MEMORY[0x1E0DEE580]();
}

uint64_t sub_1AC726B8C()
{
  return MEMORY[0x1E0DEE5A8]();
}

uint64_t sub_1AC726B98()
{
  return MEMORY[0x1E0DEE6E0]();
}

uint64_t sub_1AC726BA4()
{
  return MEMORY[0x1E0DEE6F0]();
}

uint64_t sub_1AC726BB0()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1AC726BBC()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1AC726BC8()
{
  return MEMORY[0x1E0DF0F28]();
}

uint64_t sub_1AC726BD4()
{
  return MEMORY[0x1E0DF0F38]();
}

uint64_t sub_1AC726BE0()
{
  return MEMORY[0x1E0DF0F40]();
}

uint64_t sub_1AC726BEC()
{
  return MEMORY[0x1E0DEE978]();
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

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC318](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1E0CA79F8]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

htmlParserCtxtPtr htmlCreateMemoryParserCtxt(const char *buffer, int size)
{
  return (htmlParserCtxtPtr)MEMORY[0x1E0DE8C10](buffer, *(_QWORD *)&size);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x1E0DE8C20](ctxt, *(_QWORD *)&options);
}

int htmlParseDocument(htmlParserCtxtPtr ctxt)
{
  return MEMORY[0x1E0DE8C38](ctxt);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1E0DEEE68]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
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

xmlErrorPtr xmlCtxtGetLastError(void *ctx)
{
  return (xmlErrorPtr)MEMORY[0x1E0DE8CC8](ctx);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x1E0DE8D38](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x1E0DE8D50](ctxt);
}

void xmlInitParser(void)
{
  MEMORY[0x1E0DE8DC0]();
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x1E0DE8FF0](ctxt);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x1E0DE8FF8](str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x1E0DE9010](str);
}

