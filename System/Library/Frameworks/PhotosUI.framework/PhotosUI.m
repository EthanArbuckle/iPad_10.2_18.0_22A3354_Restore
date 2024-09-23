double OUTLINED_FUNCTION_30(uint64_t a1)
{
  uint64_t v1;
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(v1 + 128) = a1;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_OWORD *)(v1 + 152) = 0u;
  *(_OWORD *)(v1 + 168) = 0u;
  *(_OWORD *)(v1 + 184) = 0u;
  *(_OWORD *)(v1 + 200) = 0u;
  *(_OWORD *)(v1 + 216) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_6@<X0>(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 56) = v7;
  *(_QWORD *)(v2 + 64) = v6;
  *(_QWORD *)(v2 + 72) = v5;
  *(_QWORD *)(v2 + 80) = v1;
  *(_QWORD *)(v2 + 88) = v4;
  *(_BYTE *)(v2 + 96) = a1 & 1;
  *(_QWORD *)(v2 + 104) = v3;
  return sub_20D1EA4AC();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_20D206E60();
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return 1;
}

void OUTLINED_FUNCTION_14(uint64_t a1)
{
  uint64_t *v1;

  sub_20D1EC51C(a1, v1);
}

id OUTLINED_FUNCTION_14_0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3272), v1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_20D206F80();
}

id OUTLINED_FUNCTION_0_0()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

void OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20D1EC48C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return 0;
}

void OUTLINED_FUNCTION_2()
{
  JUMPOUT(0x212B9F8A4);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_7(uint64_t a1)
{
  uint64_t *v1;

  sub_20D1EC51C(a1, v1);
}

id OUTLINED_FUNCTION_7_0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return sub_20D206F80();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t *v10;
  uint64_t v11;
  va_list va;

  va_start(va, a10);
  sub_20D1EC48C(v11 - 88, (uint64_t)va, v10);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_getObjectType();
}

void OUTLINED_FUNCTION_8(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_20D206F74();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(_QWORD *)(v0 + 120) = 0;
  return swift_allocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BA0048]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_20D206F8C();
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return sub_20D1EDF84((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_20D206F68();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_20D206E60();
}

void OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_20D1EC48C(a1, (uint64_t)va, a3);
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  return sub_20D1EDF3C(v2, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_20D206EF0();
}

double OUTLINED_FUNCTION_39()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 + 32) = 0;
  result = 0.0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return swift_beginAccess();
}

unint64_t OUTLINED_FUNCTION_22()
{
  return sub_20D1EA4AC();
}

double OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)v0 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_20D206EC0();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return sub_20D1EA570((uint64_t)va);
}

void OUTLINED_FUNCTION_26(uint64_t a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(__n128 *)v5 = a3;
  *(_QWORD *)(v5 + 16) = a1;
  *(__n128 *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 40) = v3;
  *(_QWORD *)(v5 + 48) = v4;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_28(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_20D1EA570((uint64_t)&a9);
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_20D206EC0();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_20D206F80();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes();
}

void OUTLINED_FUNCTION_35(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  sub_20D1EC51C((uint64_t)va, a2);
}

void *__swift_memcpy328_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x148uLL);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_20D206EC0();
}

void static PHPickerMode.default.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static PHPickerMode.compact.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_88();
  *a1 = qword_2549AD120;
  OUTLINED_FUNCTION_62();
}

void static PHPickerMode.compact.setter(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  OUTLINED_FUNCTION_88();
  qword_2549AD120 = v1;
  OUTLINED_FUNCTION_62();
}

void static PHPickerMode.compact.modify()
{
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_11();
}

BOOL static PHPickerMode.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_20D1E4BA8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void PHPickerMode.hash(into:)()
{
  sub_20D206F74();
  OUTLINED_FUNCTION_11();
}

void PHPickerMode.hashValue.getter()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

uint64_t sub_20D1E4C0C()
{
  sub_20D206F68();
  sub_20D206F74();
  return sub_20D206F8C();
}

void sub_20D1E4C4C(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_imagesFilter, &qword_2549AD130);
}

id static PHPickerFilter.images.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD128, (void **)&qword_2549AD130, a1);
}

void sub_20D1E4C84(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_videosFilter, &qword_2549AD140);
}

id static PHPickerFilter.videos.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD138, (void **)&qword_2549AD140, a1);
}

id sub_20D1E4CBC@<X0>(_QWORD *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  void *v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  *a3 = *a2;
  return v5;
}

void sub_20D1E4CFC(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_livePhotosFilter, &qword_2549AD150);
}

id static PHPickerFilter.livePhotos.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD148, (void **)&qword_2549AD150, a1);
}

void sub_20D1E4D34(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_depthEffectPhotosFilter, &qword_2549AD160);
}

id static PHPickerFilter.depthEffectPhotos.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD158, (void **)&qword_2549AD160, a1);
}

void sub_20D1E4D6C(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_burstsFilter, &qword_2549AD170);
}

id static PHPickerFilter.bursts.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD168, (void **)&qword_2549AD170, a1);
}

void sub_20D1E4DA4(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_panoramasFilter, &qword_2549AD180);
}

id static PHPickerFilter.panoramas.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD178, (void **)&qword_2549AD180, a1);
}

void sub_20D1E4DDC(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_screenshotsFilter, &qword_2549AD190);
}

id static PHPickerFilter.screenshots.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD188, (void **)&qword_2549AD190, a1);
}

void sub_20D1E4E14(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_screenRecordingsFilter, &qword_2549AD1A0);
}

id static PHPickerFilter.screenRecordings.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD198, (void **)&qword_2549AD1A0, a1);
}

void sub_20D1E4E4C(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_slomoVideosFilter, &qword_2549AD1B0);
}

id static PHPickerFilter.slomoVideos.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD1A8, (void **)&qword_2549AD1B0, a1);
}

void sub_20D1E4E84(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_timelapseVideosFilter, &qword_2549AD1C0);
}

id static PHPickerFilter.timelapseVideos.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD1B8, (void **)&qword_2549AD1C0, a1);
}

void sub_20D1E4EBC(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_cinematicVideosFilter, &qword_2549AD1D0);
}

id static PHPickerFilter.cinematicVideos.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD1C8, (void **)&qword_2549AD1D0, a1);
}

void sub_20D1E4EF4(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef_spatialMediaFilter, &qword_2549AD1E0);
}

id static PHPickerFilter.spatialMedia.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD1D8, (void **)&qword_2549AD1E0, a1);
}

void static PHPickerFilter.playbackStyle(_:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = objc_msgSend((id)objc_opt_self(), sel_playbackStyleFilter_, a1);
  OUTLINED_FUNCTION_11();
}

void static PHPickerFilter.any(of:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_20D1E5210(a1, (SEL *)&selRef_anyFilterMatchingSubfilters_, a2);
}

uint64_t sub_20D1E4F7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    sub_20D206F2C();
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = v5;
      sub_20D206F14();
      sub_20D206F38();
      sub_20D206F44();
      sub_20D206F20();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_20D1E5028(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_20D206F2C();
    v4 = (_QWORD *)(a1 + 80);
    do
    {
      v5 = (void *)*(v4 - 2);
      v11 = *((unsigned __int8 *)v4 - 8);
      if (*v4)
      {
        sub_20D1EC458(0, &qword_2549AD628);
        swift_bridgeObjectRetain();
        v6 = sub_20D1E9DD0();
      }
      else
      {
        v6 = objc_msgSend(objc_allocWithZone((Class)_PHPickerCollectionConfiguration), sel_init);
      }
      v7 = v6;
      v8 = (void *)sub_20D206E90();
      objc_msgSend(v7, sel_setSuggestedIdentifiers_, v8);

      v9 = (void *)sub_20D206E90();
      objc_msgSend(v7, sel_setPreselectedIdentifiers_, v9);

      v10 = (void *)sub_20D206E90();
      objc_msgSend(v7, sel_setDisabledIdentifiers_, v10);

      if (v5)
        v5 = (void *)sub_20D206E60();
      v4 += 7;
      objc_msgSend(v7, sel_setPurpose_, v5);

      objc_msgSend(v7, sel_setAllowsEditingCollection_, v11);
      sub_20D206F14();
      sub_20D206F38();
      sub_20D206F44();
      sub_20D206F20();
      --v2;
    }
    while (v2);
    return v12;
  }
  return result;
}

void static PHPickerFilter.all(of:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_20D1E5210(a1, (SEL *)&selRef_allFilterMatchingSubfilters_, a2);
}

void sub_20D1E5210(uint64_t a1@<X0>, SEL *a2@<X1>, _QWORD *a3@<X8>)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_opt_self();
  sub_20D1E4F7C(a1);
  sub_20D1EC458(0, &qword_2549AD2A8);
  v7 = (void *)sub_20D206E90();
  OUTLINED_FUNCTION_29();
  v8 = objc_msgSend(v6, *a2, v7);

  *a3 = v8;
}

void static PHPickerFilter.not(_:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = objc_msgSend((id)objc_opt_self(), sel_notFilterOfSubfilter_, *a1);
  OUTLINED_FUNCTION_11();
}

void sub_20D1E5304(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef__stickersFilter, &qword_2549AD1F0);
}

id static PHPickerFilter._stickers.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD1E8, (void **)&qword_2549AD1F0, a1);
}

void sub_20D1E533C(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)off_24C62AD20, (SEL *)&selRef__styleabilityFilter, &qword_2549AD200);
}

id static PHPickerFilter._styleability.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD1F8, (void **)&qword_2549AD200, a1);
}

void static PHPickerFilter._itemIdentifiers(_:)(_QWORD *a1@<X8>)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_20D206E90();
  v4 = objc_msgSend(v2, sel__itemIdentifiersFilter_, v3);

  *a1 = v4;
  OUTLINED_FUNCTION_5();
}

void PHPickerFilter.hash(into:)()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  OUTLINED_FUNCTION_45();

}

BOOL static PHPickerConfiguration.AssetRepresentationMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void PHPickerConfiguration.AssetRepresentationMode.hash(into:)()
{
  sub_20D206F74();
  OUTLINED_FUNCTION_11();
}

void _s8PhotosUI21PHPickerConfigurationV23AssetRepresentationModeO9hashValueSivg_0()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

void sub_20D1E54A4()
{
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

uint64_t PHPickerConfiguration.Update.selectionLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PHPickerConfiguration.Update.selectionLimit.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*PHPickerConfiguration.Update.selectionLimit.modify())()
{
  return nullsub_1;
}

uint64_t PHPickerConfiguration.Update.edgesWithoutContentMargins.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t PHPickerConfiguration.Update.edgesWithoutContentMargins.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*PHPickerConfiguration.Update.edgesWithoutContentMargins.modify())()
{
  return nullsub_1;
}

PhotosUI::PHPickerConfiguration::Update __swiftcall PHPickerConfiguration.Update.init()()
{
  uint64_t v0;
  PhotosUI::PHPickerConfiguration::Update result;

  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 1;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 1;
  return result;
}

void PHPickerConfiguration.Update.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  if (*(_BYTE *)(v0 + 24) != 1)
  {
    OUTLINED_FUNCTION_51();
    sub_20D206F74();
    if (!v1)
      goto LABEL_3;
LABEL_5:
    OUTLINED_FUNCTION_52();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_52();
  if (v1)
    goto LABEL_5;
LABEL_3:
  OUTLINED_FUNCTION_51();
  sub_20D206F74();
LABEL_6:
  OUTLINED_FUNCTION_5();
}

uint64_t static PHPickerConfiguration.Update.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2;
  char v4;

  v2 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(_QWORD *)a1 != *(_QWORD *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
      v4 = *(_BYTE *)(a2 + 24);
    else
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  return 1;
}

void PHPickerConfiguration.Update.hashValue.getter()
{
  uint64_t v0;
  int v1;
  char v2;

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(_BYTE *)(v0 + 24);
  OUTLINED_FUNCTION_10();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_52();
  }
  else
  {
    OUTLINED_FUNCTION_51();
    sub_20D206F74();
  }
  if (v1)
  {
    OUTLINED_FUNCTION_52();
  }
  else
  {
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_18();
  }
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_50();
}

uint64_t sub_20D1E567C()
{
  uint64_t v0;
  int v1;
  char v2;

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(_BYTE *)(v0 + 24);
  sub_20D206F68();
  sub_20D206F80();
  if ((v2 & 1) == 0)
    sub_20D206F74();
  sub_20D206F80();
  if (!v1)
    sub_20D206F74();
  return sub_20D206F8C();
}

void PHPickerConfiguration.preferredAssetRepresentationMode.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *PHPickerConfiguration.preferredAssetRepresentationMode.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*PHPickerConfiguration.preferredAssetRepresentationMode.modify())()
{
  return nullsub_1;
}

void PHPickerConfiguration.selection.getter(uint64_t a1@<X1>, uint64_t a2@<X3>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;

  OUTLINED_FUNCTION_66(v3 + 40, a1, &qword_2549AD2B8, a2);
  if (!v9)
  {
    OUTLINED_FUNCTION_49(v5, &qword_2549AD2B8, v6);
    goto LABEL_5;
  }
  if (!OUTLINED_FUNCTION_16())
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = v8;
LABEL_6:
  *a3 = v7;
  OUTLINED_FUNCTION_33();
}

void sub_20D1E57B0(uint64_t a1@<X1>, uint64_t a2@<X3>, _BYTE *a3@<X8>)
{
  PHPickerConfiguration.selection.getter(a1, a2, a3);
}

void sub_20D1E57D0()
{
  PHPickerConfiguration.selection.setter();
}

void PHPickerConfiguration.selection.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20D1EA37C();
  v1 = sub_20D206EFC();
  OUTLINED_FUNCTION_73(v1, v0 + 40, v2);
  OUTLINED_FUNCTION_62();
}

void PHPickerConfiguration.selection.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  char v4;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[5] = v1;
  sub_20D1EC48C(v1 + 40, (uint64_t)v3, &qword_2549AD2B8);
  if (!v3[3])
  {
    sub_20D1EC51C((uint64_t)v3, &qword_2549AD2B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = *((_BYTE *)v3 + 48);
LABEL_6:
  *((_BYTE *)v3 + 49) = v4;
  OUTLINED_FUNCTION_5();
}

void sub_20D1E58E4(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_BYTE *)(*(_QWORD *)a1 + 48) = *(_BYTE *)(*(_QWORD *)a1 + 49);
  sub_20D1EA37C();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_8(v1);
}

uint64_t PHPickerConfiguration.selectionLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t PHPickerConfiguration.selectionLimit.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*PHPickerConfiguration.selectionLimit.modify())()
{
  return nullsub_1;
}

id PHPickerConfiguration.filter.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

void PHPickerConfiguration.filter.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *a1;

  *(_QWORD *)(v1 + 16) = v2;
  OUTLINED_FUNCTION_11();
}

uint64_t (*PHPickerConfiguration.filter.modify())()
{
  return nullsub_1;
}

void PHPickerConfiguration.preselectedAssetIdentifiers.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
}

void sub_20D1E59C4(_QWORD *a1@<X8>)
{
  uint64_t v2;

  PHPickerConfiguration.preselectedAssetIdentifiers.getter();
  *a1 = v2;
}

void sub_20D1E59EC()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  PHPickerConfiguration.preselectedAssetIdentifiers.setter(v0);
}

void PHPickerConfiguration.preselectedAssetIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = a1;
  OUTLINED_FUNCTION_11();
}

void PHPickerConfiguration.preselectedAssetIdentifiers.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v1 + 80))
    v2 = *(_QWORD *)(v1 + 80);
  *a1 = v2;
  a1[1] = v1;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
}

void sub_20D1E5A7C(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_29();
    *(_QWORD *)(v3 + 80) = v2;
    OUTLINED_FUNCTION_19();
  }
  else
  {
    OUTLINED_FUNCTION_29();
    *(_QWORD *)(v3 + 80) = v2;
    OUTLINED_FUNCTION_5();
  }
}

void PHPickerConfiguration.mode.getter(uint64_t a1@<X1>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_66(v3 + 88, a1, &qword_2549AD2B8, a2);
  if (!v9)
  {
    OUTLINED_FUNCTION_49(v5, &qword_2549AD2B8, v6);
    goto LABEL_5;
  }
  if (!OUTLINED_FUNCTION_16())
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = v8;
LABEL_6:
  *a3 = v7;
  OUTLINED_FUNCTION_33();
}

void sub_20D1E5B30(uint64_t a1@<X1>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  PHPickerConfiguration.mode.getter(a1, a2, a3);
}

void sub_20D1E5B50(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  PHPickerConfiguration.mode.setter(&v1);
}

void PHPickerConfiguration.mode.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  sub_20D1EA400();
  v2 = sub_20D206EFC();
  OUTLINED_FUNCTION_73(v2, v1 + 88, v3, v4);
  OUTLINED_FUNCTION_62();
}

void PHPickerConfiguration.mode.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  sub_20D1EC48C(v1 + 88, (uint64_t)v3, &qword_2549AD2B8);
  if (!v3[3])
  {
    sub_20D1EC51C((uint64_t)v3, &qword_2549AD2B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = v3[5];
LABEL_6:
  v3[6] = v4;
  OUTLINED_FUNCTION_5();
}

void sub_20D1E5C64(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)a1 + 40) = *(_QWORD *)(*(_QWORD *)a1 + 48);
  sub_20D1EA400();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_8(v1);
}

uint64_t sub_20D1E5CB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration.edgesWithoutContentMargins.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D1E5CDC(_QWORD *a1)
{
  return PHPickerConfiguration.edgesWithoutContentMargins.setter(*a1);
}

uint64_t (*PHPickerConfiguration.edgesWithoutContentMargins.modify(_QWORD *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 16);
  return j__OUTLINED_FUNCTION_57;
}

uint64_t sub_20D1E5D2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration.disabledCapabilities.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D1E5D54(_QWORD *a1)
{
  return PHPickerConfiguration.disabledCapabilities.setter(*a1);
}

uint64_t (*PHPickerConfiguration.disabledCapabilities.modify(_QWORD *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 24);
  return j__OUTLINED_FUNCTION_56;
}

void PHPickerConfiguration.init()(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_20D20A010;
  *(_WORD *)(a1 + 32) = 514;
  OUTLINED_FUNCTION_44();
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_QWORD *)(a1 + 120) = 0;
  v2 = OUTLINED_FUNCTION_36();
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_QWORD *)(a1 + 128) = v2;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_WORD *)(a1 + 232) = 514;
  *(_BYTE *)(a1 + 234) = 2;
  *(_QWORD *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_QWORD *)(a1 + 320) = 0;
  OUTLINED_FUNCTION_11();
}

void PHPickerConfiguration.init(photoLibrary:)(uint64_t a1@<X8>)
{
  uint64_t v2;
  __n128 v3;

  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_20D20A010;
  *(_WORD *)(a1 + 32) = 514;
  OUTLINED_FUNCTION_44();
  v2 = OUTLINED_FUNCTION_21();
  v3.n128_f64[0] = OUTLINED_FUNCTION_30(v2);
  *(_WORD *)(a1 + 232) = 514;
  *(_BYTE *)(a1 + 234) = 2;
  OUTLINED_FUNCTION_48(v3);
  OUTLINED_FUNCTION_5();
}

void PHPickerConfiguration.photoLibrary.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  if (v1)
  {
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      v2 = v1;
  }
  OUTLINED_FUNCTION_11();
}

void PHPickerConfiguration._suggestionGroup.getter(uint64_t a1@<X1>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_66(v3 + 136, a1, &qword_2549AD2B8, a2);
  if (!v9)
  {
    OUTLINED_FUNCTION_49(v5, &qword_2549AD2B8, v6);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = v8;
LABEL_6:
  *a3 = v7;
  OUTLINED_FUNCTION_33();
}

void sub_20D1E5F48(uint64_t a1@<X1>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  PHPickerConfiguration._suggestionGroup.getter(a1, a2, a3);
}

uint64_t sub_20D1E5F68(id *a1)
{
  id v1;
  id v3;

  v3 = *a1;
  v1 = v3;
  return PHPickerConfiguration._suggestionGroup.setter(&v3);
}

uint64_t PHPickerConfiguration._suggestionGroup.setter(_QWORD *a1)
{
  uint64_t v1;
  _OWORD v3[2];
  uint64_t v4;

  if (*a1)
  {
    sub_20D1EA45C();
    sub_20D206EFC();
  }
  else
  {
    v4 = 0;
    memset(v3, 0, sizeof(v3));
  }
  return sub_20D1EA3B8((uint64_t)v3, v1 + 136);
}

void PHPickerConfiguration._suggestionGroup.modify()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = OUTLINED_FUNCTION_76();
  *v0 = v2;
  v2[7] = v1;
  OUTLINED_FUNCTION_91(v1 + 136, v3, &qword_2549AD2B8);
  if (!v2[3])
  {
    OUTLINED_FUNCTION_89(v4, &qword_2549AD2B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = v2[5];
LABEL_6:
  v2[6] = v5;
  OUTLINED_FUNCTION_5();
}

void sub_20D1E6088(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 48);
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      *((_QWORD *)v2 + 5) = v3;
      sub_20D1EA45C();
      v4 = v3;
      sub_20D206EFC();
    }
    else
    {
      *((_QWORD *)v2 + 4) = 0;
      *(_OWORD *)v2 = 0u;
      *((_OWORD *)v2 + 1) = 0u;
    }
    OUTLINED_FUNCTION_63();

  }
  else
  {
    if (v3)
    {
      *((_QWORD *)v2 + 5) = v3;
      sub_20D1EA45C();
      sub_20D206EFC();
    }
    else
    {
      *((_QWORD *)v2 + 4) = 0;
      *(_OWORD *)v2 = 0u;
      *((_OWORD *)v2 + 1) = 0u;
    }
    OUTLINED_FUNCTION_63();
  }
  OUTLINED_FUNCTION_8(v2);
}

uint64_t PHPickerConfiguration._disabledPrivateCapabilities.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 128) + 32);
}

uint64_t sub_20D1E6148@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._disabledPrivateCapabilities.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D1E6170(uint64_t *a1)
{
  return PHPickerConfiguration._disabledPrivateCapabilities.setter(*a1);
}

uint64_t PHPickerConfiguration._disabledPrivateCapabilities.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(v1 + 128) + 32) = result;
  return result;
}

_QWORD *(*PHPickerConfiguration._disabledPrivateCapabilities.modify(_QWORD *a1))(_QWORD *result)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 32);
  return sub_20D1E61C0;
}

_QWORD *sub_20D1E61C0(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[1] + 128) + 32) = *result;
  return result;
}

uint64_t PHPickerConfiguration._sourceType.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_66(v4 + 176, a2, &qword_2549AD2B8, a4);
  if (v9)
  {
    OUTLINED_FUNCTION_79();
    if (OUTLINED_FUNCTION_16())
      return v8;
  }
  else
  {
    OUTLINED_FUNCTION_49(v5, &qword_2549AD2B8, v6);
  }
  return 0;
}

uint64_t sub_20D1E6238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._sourceType.getter(a1, a2, a3, a4);
  *a5 = result;
  return result;
}

void sub_20D1E6260(uint64_t *a1)
{
  PHPickerConfiguration._sourceType.setter(*a1);
}

void PHPickerConfiguration._sourceType.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_79();
  sub_20D1EC084(&qword_2549AD2D8, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerSourceType, (uint64_t)&unk_20D20AE5C);
  v2 = sub_20D206EFC();
  OUTLINED_FUNCTION_73(v2, v1 + 176, v3, a1);
  OUTLINED_FUNCTION_33();
}

void PHPickerConfiguration._sourceType.modify()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = OUTLINED_FUNCTION_76();
  *v0 = v2;
  v2[7] = v1;
  v2[5] = PHPickerConfiguration._sourceType.getter((uint64_t)v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void sub_20D1E631C(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)a1 + 48) = *(_QWORD *)(*(_QWORD *)a1 + 40);
  OUTLINED_FUNCTION_79();
  sub_20D1EC084(&qword_2549AD2D8, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerSourceType, (uint64_t)&unk_20D20AE5C);
  sub_20D206EFC();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_8(v1);
}

void PHPickerConfiguration._containerIdentifier.getter()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_11();
}

void sub_20D1E63AC(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  PHPickerConfiguration._containerIdentifier.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_20D1E63D4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  PHPickerConfiguration._containerIdentifier.setter(v1, v2);
}

void PHPickerConfiguration._containerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 216) = a1;
  *(_QWORD *)(v2 + 224) = a2;
  OUTLINED_FUNCTION_5();
}

void PHPickerConfiguration._containerIdentifier.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  v3 = *(_QWORD *)(v1 + 224);
  *a1 = *(_QWORD *)(v1 + 216);
  a1[1] = v3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
}

void sub_20D1E6474(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[2];
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_29();
    *(_QWORD *)(v3 + 216) = v4;
    *(_QWORD *)(v3 + 224) = v2;
    OUTLINED_FUNCTION_19();
  }
  else
  {
    OUTLINED_FUNCTION_29();
    *(_QWORD *)(v3 + 216) = v4;
    *(_QWORD *)(v3 + 224) = v2;
    OUTLINED_FUNCTION_5();
  }
}

uint64_t PHPickerConfiguration._alwaysShowLoadingPlaceholder.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_78(*(_BYTE *)(v0 + 232));
}

uint64_t sub_20D1E64C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._alwaysShowLoadingPlaceholder.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20D1E64F0(unsigned __int8 *a1)
{
  return PHPickerConfiguration._alwaysShowLoadingPlaceholder.setter(*a1);
}

uint64_t PHPickerConfiguration._alwaysShowLoadingPlaceholder.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 232) = result;
  return result;
}

_BYTE *(*PHPickerConfiguration._alwaysShowLoadingPlaceholder.modify(uint64_t a1))(_BYTE *result)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(v1 + 232) & 1;
  return sub_20D1E653C;
}

_BYTE *sub_20D1E653C(_BYTE *result)
{
  *(_BYTE *)(*(_QWORD *)result + 232) = result[8];
  return result;
}

uint64_t PHPickerConfiguration._allowsDownscaling.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_78(*(_BYTE *)(v0 + 233));
}

uint64_t sub_20D1E6554@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._allowsDownscaling.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20D1E6580(unsigned __int8 *a1)
{
  return PHPickerConfiguration._allowsDownscaling.setter(*a1);
}

uint64_t PHPickerConfiguration._allowsDownscaling.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 233) = result;
  return result;
}

_BYTE *(*PHPickerConfiguration._allowsDownscaling.modify(uint64_t a1))(_BYTE *result)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(v1 + 233) & 1;
  return sub_20D1E65CC;
}

_BYTE *sub_20D1E65CC(_BYTE *result)
{
  *(_BYTE *)(*(_QWORD *)result + 233) = result[8];
  return result;
}

uint64_t PHPickerConfiguration._allowsEncodingPolicyModification.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_78((*(_BYTE *)(v0 + 234) == 2) | *(_BYTE *)(v0 + 234));
}

uint64_t sub_20D1E65F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._allowsEncodingPolicyModification.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20D1E661C(unsigned __int8 *a1)
{
  return PHPickerConfiguration._allowsEncodingPolicyModification.setter(*a1);
}

uint64_t PHPickerConfiguration._allowsEncodingPolicyModification.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 234) = result;
  return result;
}

_BYTE *(*PHPickerConfiguration._allowsEncodingPolicyModification.modify(uint64_t a1))(_BYTE *result)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = (*(_BYTE *)(v1 + 234) == 2) | *(_BYTE *)(v1 + 234) & 1;
  return sub_20D1E6674;
}

_BYTE *sub_20D1E6674(_BYTE *result)
{
  *(_BYTE *)(*(_QWORD *)result + 234) = result[8];
  return result;
}

void PHPickerConfiguration._albumsConfiguration.getter()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  __n128 v3;
  _BYTE v4[24];
  uint64_t v5;

  sub_20D1EC48C(v0 + 240, (uint64_t)v4, &qword_2549AD2B8);
  if (!v5)
  {
    sub_20D1EC51C((uint64_t)v4, &qword_2549AD2B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    OUTLINED_FUNCTION_25();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_26(v2, v3, v1);
LABEL_6:
  OUTLINED_FUNCTION_42();
}

void sub_20D1E6710(uint64_t a1@<X8>)
{
  sub_20D1E6940((void (*)(_OWORD *__return_ptr))PHPickerConfiguration._albumsConfiguration.getter, a1);
}

void sub_20D1E671C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D1E6990(a1, a2, a3, a4, PHPickerConfiguration._albumsConfiguration.setter);
}

void PHPickerConfiguration._albumsConfiguration.setter(_QWORD *a1)
{
  uint64_t v1;
  _OWORD v2[2];
  uint64_t v3;

  if (*a1)
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_72();
  }
  else
  {
    v3 = 0;
    memset(v2, 0, sizeof(v2));
  }
  sub_20D1EA3B8((uint64_t)v2, v1 + 240);
  OUTLINED_FUNCTION_42();
}

void PHPickerConfiguration._albumsConfiguration.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_77((uint64_t)v2);
  OUTLINED_FUNCTION_91(v1 + 240, v3, &qword_2549AD2B8);
  if (!*(_QWORD *)(v0 + 136))
  {
    OUTLINED_FUNCTION_89(v4, &qword_2549AD2B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    OUTLINED_FUNCTION_25();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_26(*(_QWORD *)(v0 + 72), *(__n128 *)(v0 + 80), *(__n128 *)(v0 + 56));
LABEL_6:
  OUTLINED_FUNCTION_5();
}

void sub_20D1E6808()
{
  void *v0;
  uint64_t v1;
  char v2;
  char v3;

  OUTLINED_FUNCTION_37();
  if ((v3 & 1) != 0)
  {
    if (v1)
    {
      OUTLINED_FUNCTION_6(v2);
      OUTLINED_FUNCTION_87();
      OUTLINED_FUNCTION_86();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_55();
    }
    else
    {
      OUTLINED_FUNCTION_39();
    }
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_46();
  }
  else
  {
    if (v1)
    {
      OUTLINED_FUNCTION_6(v2);
      OUTLINED_FUNCTION_64();
    }
    else
    {
      OUTLINED_FUNCTION_39();
    }
    OUTLINED_FUNCTION_58();
  }
  OUTLINED_FUNCTION_28(v0);
}

void PHPickerConfiguration._peopleConfiguration.getter()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  __n128 v3;
  _BYTE v4[24];
  uint64_t v5;

  sub_20D1EC48C(v0 + 280, (uint64_t)v4, &qword_2549AD2B8);
  if (!v5)
  {
    sub_20D1EC51C((uint64_t)v4, &qword_2549AD2B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    OUTLINED_FUNCTION_25();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_26(v2, v3, v1);
LABEL_6:
  OUTLINED_FUNCTION_42();
}

void sub_20D1E6934(uint64_t a1@<X8>)
{
  sub_20D1E6940((void (*)(_OWORD *__return_ptr))PHPickerConfiguration._peopleConfiguration.getter, a1);
}

void sub_20D1E6940(void (*a1)(_OWORD *__return_ptr)@<X3>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  _OWORD v5[3];
  uint64_t v6;

  a1(v5);
  v3 = v6;
  v4 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = v5[2];
  *(_QWORD *)(a2 + 48) = v3;
  OUTLINED_FUNCTION_81();
}

void sub_20D1E6984(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D1E6990(a1, a2, a3, a4, PHPickerConfiguration._peopleConfiguration.setter);
}

void sub_20D1E6990(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12[7];

  v6 = a1[1];
  v7 = a1[2];
  v8 = a1[3];
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  v12[0] = *a1;
  v12[1] = v6;
  v12[2] = v7;
  v12[3] = v8;
  v12[4] = v9;
  v12[5] = v10;
  v12[6] = v11;
  sub_20D1EC3FC(v12[0]);
  a5(v12);
  OUTLINED_FUNCTION_81();
}

void PHPickerConfiguration._peopleConfiguration.setter(_QWORD *a1)
{
  uint64_t v1;
  _OWORD v2[2];
  uint64_t v3;

  if (*a1)
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_72();
  }
  else
  {
    v3 = 0;
    memset(v2, 0, sizeof(v2));
  }
  sub_20D1EA3B8((uint64_t)v2, v1 + 280);
  OUTLINED_FUNCTION_42();
}

void PHPickerConfiguration._peopleConfiguration.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_77((uint64_t)v2);
  OUTLINED_FUNCTION_91(v1 + 280, v3, &qword_2549AD2B8);
  if (!*(_QWORD *)(v0 + 136))
  {
    OUTLINED_FUNCTION_89(v4, &qword_2549AD2B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_16() & 1) == 0)
  {
LABEL_5:
    OUTLINED_FUNCTION_25();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_26(*(_QWORD *)(v0 + 72), *(__n128 *)(v0 + 80), *(__n128 *)(v0 + 56));
LABEL_6:
  OUTLINED_FUNCTION_5();
}

void sub_20D1E6AC4()
{
  void *v0;
  uint64_t v1;
  char v2;
  char v3;

  OUTLINED_FUNCTION_37();
  if ((v3 & 1) != 0)
  {
    if (v1)
    {
      OUTLINED_FUNCTION_6(v2);
      OUTLINED_FUNCTION_87();
      OUTLINED_FUNCTION_86();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_55();
    }
    else
    {
      OUTLINED_FUNCTION_39();
    }
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_46();
  }
  else
  {
    if (v1)
    {
      OUTLINED_FUNCTION_6(v2);
      OUTLINED_FUNCTION_64();
    }
    else
    {
      OUTLINED_FUNCTION_39();
    }
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_28(v0);
}

uint64_t PHPickerConfiguration._followupPeopleConfigurations.getter()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 320);
  if (result)
    return sub_20D1E6C08(result);
  return result;
}

uint64_t sub_20D1E6B74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._followupPeopleConfigurations.getter();
  *a1 = result;
  return result;
}

void sub_20D1E6B9C()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  PHPickerConfiguration._followupPeopleConfigurations.setter(v0);
}

void PHPickerConfiguration._followupPeopleConfigurations.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
  {
    v2 = sub_20D1E6D84(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 320) = v2;
  OUTLINED_FUNCTION_5();
}

uint64_t sub_20D1E6C08(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _BYTE v15[40];
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  v16 = MEMORY[0x24BEE4AF8];
  sub_20D1EA5C0(0, v2, 0);
  v3 = v16;
  if (v2)
  {
    for (i = a1 + 32; ; i += 40)
    {
      sub_20D1EC554(i, (uint64_t)v15);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20D1EA5C0(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v16;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_20D1EA5C0((char *)(v5 > 1), v6 + 1, 1);
        v3 = v16;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      v7 = v3 + 56 * v6;
      *(_OWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 48) = v10;
      *(_QWORD *)(v7 + 56) = v11;
      *(_QWORD *)(v7 + 64) = v12;
      *(_BYTE *)(v7 + 72) = v13 & 1;
      *(_QWORD *)(v7 + 80) = v14;
      if (!--v2)
        return v3;
    }
    swift_release();
    sub_20D1EA4E8(0);
    return 0;
  }
  return v3;
}

uint64_t sub_20D1E6D84(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_20D1EA5DC(0, v1, 0);
    v2 = v12;
    v4 = a1 + 80;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20D1EA5DC(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v12;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_20D1EA5DC((char *)(v5 > 1), v6 + 1, 1);
        v2 = v12;
      }
      v4 += 56;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      v7 = v2 + 40 * v6;
      *(_QWORD *)(v7 + 64) = v11;
      *(_OWORD *)(v7 + 32) = v9;
      *(_OWORD *)(v7 + 48) = v10;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_20D1E6EF4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_20D1EA614(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD618);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20D1EA614(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_20D1EA614((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_20D1EABD8(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void PHPickerConfiguration._followupPeopleConfigurations.modify(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  v3 = *(_QWORD *)(v1 + 320);
  if (v3)
    v3 = sub_20D1E6C08(v3);
  *a1 = v3;
  OUTLINED_FUNCTION_11();
}

void sub_20D1E7054(uint64_t *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = OUTLINED_FUNCTION_65();
      v5 = sub_20D1E6D84(v4);
      OUTLINED_FUNCTION_29();
    }
    else
    {
      v5 = 0;
    }
    OUTLINED_FUNCTION_70();
    a1[40] = v5;
    OUTLINED_FUNCTION_19();
  }
  else
  {
    if (v3)
    {
      v6 = sub_20D1E6D84(*a1);
      OUTLINED_FUNCTION_29();
    }
    else
    {
      v6 = 0;
    }
    OUTLINED_FUNCTION_70();
    a1[40] = v6;
    OUTLINED_FUNCTION_5();
  }
}

uint64_t PHPickerConfiguration._excludedCollections.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 128) + 40);
}

uint64_t sub_20D1E70D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._excludedCollections.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D1E7100(uint64_t *a1)
{
  return PHPickerConfiguration._excludedCollections.setter(*a1);
}

uint64_t PHPickerConfiguration._excludedCollections.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(v1 + 128) + 40) = result;
  return result;
}

_QWORD *(*PHPickerConfiguration._excludedCollections.modify(_QWORD *a1))(_QWORD *result)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 40);
  return sub_20D1E7150;
}

_QWORD *sub_20D1E7150(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[1] + 128) + 40) = *result;
  return result;
}

void PHPickerConfiguration.init(photoLibraryAndOnlyReturnsIdentifiers:)(uint64_t a1@<X8>)
{
  uint64_t v2;
  __n128 v3;

  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_20D20A010;
  *(_BYTE *)(a1 + 33) = 2;
  OUTLINED_FUNCTION_44();
  v2 = OUTLINED_FUNCTION_21();
  v3.n128_f64[0] = OUTLINED_FUNCTION_30(v2);
  *(_WORD *)(a1 + 232) = 514;
  *(_BYTE *)(a1 + 234) = 2;
  OUTLINED_FUNCTION_48(v3);
  *(_BYTE *)(a1 + 32) = 1;
  OUTLINED_FUNCTION_5();
}

void PHPickerConfiguration.init(photoLibraryAndOnlyForOpenPanel:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _BYTE v7[40];

  v3 = a2;
  *(_BYTE *)a2 = 0;
  *(_OWORD *)(a2 + 8) = xmmword_20D20A010;
  *(_BYTE *)(a2 + 32) = 2;
  OUTLINED_FUNCTION_44();
  *(_OWORD *)(v3 + 40) = 0u;
  v3 += 40;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_QWORD *)(v3 + 80) = 0;
  v4 = OUTLINED_FUNCTION_36();
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_QWORD *)(v3 + 88) = v4;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 144) = 0u;
  *(_OWORD *)(v3 + 160) = 0u;
  *(_OWORD *)(v3 + 176) = 0u;
  *(_WORD *)(v3 + 192) = 514;
  *(_BYTE *)(v3 + 194) = 2;
  *(_OWORD *)(v3 + 200) = 0u;
  *(_OWORD *)(v3 + 216) = 0u;
  *(_OWORD *)(v3 + 232) = 0u;
  *(_OWORD *)(v3 + 248) = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  *(_QWORD *)(v3 + 280) = 0;
  *(_QWORD *)(v3 - 16) = a1;
  *(_BYTE *)(v3 - 7) = 1;
  sub_20D1EA37C();
  v5 = a1;
  sub_20D206EFC();
  sub_20D1EA3B8((uint64_t)v7, v3);
  v6 = *(_QWORD *)(v3 + 88);
  *(_QWORD *)(v6 + 16) = 15;

  *(_QWORD *)(v6 + 24) = 15;
  OUTLINED_FUNCTION_81();
}

void sub_20D1E72B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
}

uint64_t static PHPickerConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t result;
  int v15;
  int v16;
  int v17;
  int v18;
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
  _QWORD *v40;
  _QWORD *v41;
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
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
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
  char v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  _BYTE v172[24];
  uint64_t v173;
  uint64_t v174;
  _BYTE v175[40];
  _BYTE v176[40];

  if (*a1 != *a2 || *((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1))
    return 0;
  v5 = (void *)*((_QWORD *)a1 + 2);
  v6 = (void *)*((_QWORD *)a2 + 2);
  if (!v5)
  {
    if (!v6)
      goto LABEL_9;
    v9 = 0;
LABEL_14:

    return 0;
  }
  if (!v6)
  {
    v9 = v5;
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_54((uint64_t)a1, &qword_2549AD2B0);
  v7 = v5;
  v8 = v6;
  v2 = OUTLINED_FUNCTION_74();

  if ((v2 & 1) == 0)
    return 0;
LABEL_9:
  v10 = (void *)*((_QWORD *)a1 + 3);
  v11 = (void *)*((_QWORD *)a2 + 3);
  if (v10)
  {
    if (!v11)
      return 0;
    OUTLINED_FUNCTION_54((uint64_t)a1, &qword_2549AD2B0);
    v12 = v11;
    v13 = v10;
    v2 = sub_20D206EB4();

    if ((v2 & 1) == 0)
      return 0;
  }
  else if (v11)
  {
    return 0;
  }
  if (a1[32] == 2)
  {
    if (a2[32] != 2)
      return 0;
  }
  else
  {
    result = OUTLINED_FUNCTION_31();
    if (v15 == 2 || ((v16 ^ v15) & 1) == 0)
      return result;
  }
  if (a1[33] == 2)
  {
    if (a2[33] != 2)
      return 0;
  }
  else
  {
    result = OUTLINED_FUNCTION_31();
    if (v17 == 2 || ((v18 ^ v17) & 1) == 0)
      return result;
  }
  OUTLINED_FUNCTION_4((uint64_t)(a1 + 40), (uint64_t)v176);
  OUTLINED_FUNCTION_4((uint64_t)(a2 + 40), (uint64_t)v175);
  OUTLINED_FUNCTION_3(v19, v20, v21, v22, v23, v24, v25, v26, v136, v148);
  OUTLINED_FUNCTION_4((uint64_t)v175, v2);
  if (v173)
  {
    OUTLINED_FUNCTION_13((uint64_t)v172, v27, &qword_2549AD2B8, v28, v29, v30, v31, v32);
    if (v174)
      OUTLINED_FUNCTION_2();
    sub_20D1EC51C((uint64_t)v175, &qword_2549AD2B8);
    sub_20D1EC51C((uint64_t)v176, &qword_2549AD2B8);
    v33 = OUTLINED_FUNCTION_34(v121, v122, v123, v124, v125);
    goto LABEL_64;
  }
  OUTLINED_FUNCTION_14((uint64_t)v175);
  OUTLINED_FUNCTION_14((uint64_t)v176);
  if (v174)
  {
LABEL_64:
    OUTLINED_FUNCTION_35(v33, &qword_2549AD2E8, v34, v35, v36, v37, v38, v39, v137, v149, v160, v166);
    return 0;
  }
  OUTLINED_FUNCTION_35(v33, &qword_2549AD2B8, v34, v35, v36, v37, v38, v39, v137, v149, v160, v166);
  v40 = (_QWORD *)*((_QWORD *)a1 + 10);
  v41 = (_QWORD *)*((_QWORD *)a2 + 10);
  if (v40)
  {
    if (!v41 || (sub_20D1E8FF4(v40, v41) & 1) == 0)
      return 0;
  }
  else if (v41)
  {
    return 0;
  }
  OUTLINED_FUNCTION_4((uint64_t)(a1 + 88), (uint64_t)v176);
  OUTLINED_FUNCTION_4((uint64_t)(a2 + 88), (uint64_t)v175);
  OUTLINED_FUNCTION_3(v42, v43, v44, v45, v46, v47, v48, v49, v138, v150);
  OUTLINED_FUNCTION_4((uint64_t)v175, (uint64_t)&qword_2549AD2B8);
  OUTLINED_FUNCTION_14((uint64_t)v175);
  OUTLINED_FUNCTION_14((uint64_t)v176);
  OUTLINED_FUNCTION_35(v50, &qword_2549AD2B8, v51, v52, v53, v54, v55, v56, v139, v151, v161, v167);
  v57 = OUTLINED_FUNCTION_44();
  if (!sub_20D1E79E4(*((_QWORD **)a1 + 16), *((_QWORD **)a2 + 16)))
    return 0;
  OUTLINED_FUNCTION_4((uint64_t)(a1 + 136), (uint64_t)v176);
  OUTLINED_FUNCTION_4((uint64_t)(a2 + 136), (uint64_t)v175);
  OUTLINED_FUNCTION_3(v58, v59, v60, v61, v62, v63, v64, v65, v140, v152);
  OUTLINED_FUNCTION_4((uint64_t)v175, v57);
  OUTLINED_FUNCTION_14((uint64_t)v175);
  OUTLINED_FUNCTION_14((uint64_t)v176);
  OUTLINED_FUNCTION_35(v66, &qword_2549AD2B8, v67, v68, v69, v70, v71, v72, v141, v153, v162, v168);
  OUTLINED_FUNCTION_4((uint64_t)(a1 + 176), (uint64_t)v176);
  OUTLINED_FUNCTION_4((uint64_t)(a2 + 176), (uint64_t)v175);
  OUTLINED_FUNCTION_3(v73, v74, v75, v76, v77, v78, v79, v80, v142, v154);
  OUTLINED_FUNCTION_4((uint64_t)v175, (uint64_t)&qword_2549AD2B8);
  OUTLINED_FUNCTION_14((uint64_t)v175);
  OUTLINED_FUNCTION_14((uint64_t)v176);
  OUTLINED_FUNCTION_35(v81, &qword_2549AD2B8, v82, v83, v84, v85, v86, v87, v143, v155, v163, v169);
  v88 = *((_QWORD *)a1 + 28);
  v89 = *((_QWORD *)a2 + 28);
  if (v88)
  {
    if (!v89)
      return 0;
    if (*((_QWORD *)a1 + 27) != *((_QWORD *)a2 + 27) || v88 != v89)
    {
      v91 = sub_20D206F5C();
      result = 0;
      if ((v91 & 1) == 0)
        return result;
    }
  }
  else if (v89)
  {
    return 0;
  }
  if (a1[232] == 2)
  {
    if (a2[232] != 2)
      return 0;
  }
  else
  {
    result = OUTLINED_FUNCTION_31();
    if (v92 == 2 || ((v93 ^ v92) & 1) == 0)
      return result;
  }
  if (a1[233] == 2)
  {
    if (a2[233] != 2)
      return 0;
  }
  else
  {
    result = OUTLINED_FUNCTION_31();
    if (v94 == 2 || ((v95 ^ v94) & 1) == 0)
      return result;
  }
  if (a1[234] == 2)
  {
    if (a2[234] == 2)
      goto LABEL_62;
    return 0;
  }
  result = OUTLINED_FUNCTION_31();
  if (v96 != 2 && ((v97 ^ v96) & 1) != 0)
  {
LABEL_62:
    OUTLINED_FUNCTION_4((uint64_t)(a1 + 240), (uint64_t)v176);
    OUTLINED_FUNCTION_4((uint64_t)(a2 + 240), (uint64_t)v175);
    OUTLINED_FUNCTION_3(v98, v99, v100, v101, v102, v103, v104, v105, v144, v156);
    OUTLINED_FUNCTION_4((uint64_t)v175, (uint64_t)&qword_2549AD2B8);
    OUTLINED_FUNCTION_14((uint64_t)v175);
    OUTLINED_FUNCTION_14((uint64_t)v176);
    OUTLINED_FUNCTION_35(v106, &qword_2549AD2B8, v107, v108, v109, v110, v111, v112, v145, v157, v164, v170);
    OUTLINED_FUNCTION_4((uint64_t)(a1 + 280), (uint64_t)v176);
    OUTLINED_FUNCTION_4((uint64_t)(a2 + 280), (uint64_t)v175);
    OUTLINED_FUNCTION_3(v113, v114, v115, v116, v117, v118, v119, v120, v146, v158);
    OUTLINED_FUNCTION_4((uint64_t)v175, (uint64_t)&qword_2549AD2B8);
    OUTLINED_FUNCTION_14((uint64_t)v175);
    OUTLINED_FUNCTION_14((uint64_t)v176);
    OUTLINED_FUNCTION_35(v126, &qword_2549AD2B8, v127, v128, v129, v130, v131, v132, v147, v159, v165, v171);
    v133 = *((_QWORD *)a2 + 40);
    if (*((_QWORD *)a1 + 40))
    {
      if (!v133)
        return 0;
      OUTLINED_FUNCTION_60();
      v134 = OUTLINED_FUNCTION_65();
      v135 = sub_20D1E90C0(v134, v133);
      OUTLINED_FUNCTION_29();
      swift_bridgeObjectRelease();
      if ((v135 & 1) == 0)
        return 0;
    }
    else if (v133)
    {
      return 0;
    }
    return 1;
  }
  return result;
}

BOOL sub_20D1E79E4(_QWORD *a1, _QWORD *a2)
{
  return a1[2] == a2[2] && a1[3] == a2[3] && a1[4] == a2[4] && a1[5] == a2[5];
}

uint64_t PHPickerConfiguration.hash(into:)(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  void *v5;
  id v6;
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
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v94;
  uint64_t v95;

  sub_20D206F74();
  sub_20D206F74();
  v3 = *(void **)(v1 + 16);
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    v4 = v3;
    OUTLINED_FUNCTION_40();

  }
  v5 = *(void **)(v1 + 24);
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    v6 = v5;
    OUTLINED_FUNCTION_40();

  }
  if (*(_BYTE *)(v1 + 32) != 2)
    OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();
  if (*(_BYTE *)(v1 + 33) != 2)
    OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13(v1 + 40, v7, &qword_2549AD2B8, v8, v9, v10, v11, v12);
  if (v95)
  {
    OUTLINED_FUNCTION_0();
    v13 = OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15(v13, v14, v15, v16, v17, v18, v19, v20, v94);
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  v21 = *(_QWORD *)(v1 + 80);
  OUTLINED_FUNCTION_1();
  if (v21)
  {
    OUTLINED_FUNCTION_41();
    sub_20D1EAAC0((uint64_t)a1, v21);
    OUTLINED_FUNCTION_75();
  }
  OUTLINED_FUNCTION_13(v1 + 88, v22, &qword_2549AD2B8, v23, v24, v25, v26, v27);
  if (v95)
  {
    OUTLINED_FUNCTION_0();
    v28 = OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15(v28, v29, v30, v31, v32, v33, v34, v35, v94);
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  sub_20D1E9B5C();
  OUTLINED_FUNCTION_13(v1 + 136, v36, &qword_2549AD2B8, v37, v38, v39, v40, v41);
  if (v95)
  {
    OUTLINED_FUNCTION_0();
    v42 = OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15(v42, v43, v44, v45, v46, v47, v48, v49, v94);
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_13(v1 + 176, v50, &qword_2549AD2B8, v51, v52, v53, v54, v55);
  if (v95)
  {
    OUTLINED_FUNCTION_0();
    v56 = OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15(v56, v57, v58, v59, v60, v61, v62, v63, v94);
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  if (*(_QWORD *)(v1 + 224))
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_75();
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  if (*(_BYTE *)(v1 + 232) != 2)
    OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();
  if (*(_BYTE *)(v1 + 233) != 2)
    OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();
  if (*(_BYTE *)(v1 + 234) != 2)
    OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13(v1 + 240, v64, &qword_2549AD2B8, v65, v66, v67, v68, v69);
  if (v95)
  {
    OUTLINED_FUNCTION_0();
    v70 = OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15(v70, v71, v72, v73, v74, v75, v76, v77, v94);
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_13(v1 + 280, v78, &qword_2549AD2B8, v79, v80, v81, v82, v83);
  if (v95)
  {
    OUTLINED_FUNCTION_0();
    v84 = OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15(v84, v85, v86, v87, v88, v89, v90, v91, v94);
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  v92 = *(_QWORD *)(v1 + 320);
  if (!v92)
    return OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();
  swift_bridgeObjectRetain();
  sub_20D1EAB34((uint64_t)a1, v92);
  return swift_bridgeObjectRelease();
}

void PHPickerConfiguration.hashValue.getter()
{
  _BYTE v0[72];

  OUTLINED_FUNCTION_10();
  PHPickerConfiguration.hash(into:)(v0);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

uint64_t sub_20D1E7D8C()
{
  _BYTE v1[72];

  sub_20D206F68();
  PHPickerConfiguration.hash(into:)(v1);
  return sub_20D206F8C();
}

id PHPickerResult.itemProvider.getter()
{
  id *v0;

  return *v0;
}

void PHPickerResult.assetIdentifier.getter()
{
  uint64_t v0;

  sub_20D1EAA70(*(void **)(v0 + 8), (SEL *)&selRef_assetIdentifier);
}

void PHPickerResult.itemIdentifier.getter()
{
  uint64_t v0;

  sub_20D1EAA70(*(void **)(v0 + 8), (SEL *)&selRef_itemIdentifier);
}

void PHPickerResult._requestThumbnailImageURL(preferredSize:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v7 = *(void **)(v3 + 8);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v10[4] = sub_20D1EABAC;
  v10[5] = v8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_20D1E8100;
  v10[3] = &block_descriptor;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel__requestThumbnailImageURLForPreferredSize_resultHandler_, a1, v9);
  _Block_release(v9);
}

void sub_20D1E7EDC(uint64_t a1, void *a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  char *v18;
  id v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void (*v26)(char *);

  v25 = a4;
  v26 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD630);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20D206E3C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD638);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (id *)((char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v25 - v17;
  sub_20D1EC48C(a1, (uint64_t)v8, &qword_2549AD630);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) != 1)
  {
    v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v12, v8, v9);
    v20((char *)v16, v12, v9);
LABEL_6:
    swift_storeEnumTagMultiPayload();
    goto LABEL_7;
  }
  sub_20D1EC51C((uint64_t)v8, &qword_2549AD630);
  if (!a2)
  {
    v21 = sub_20D206E78();
    v23 = v22;
    v24 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    *v16 = sub_20D1E9F8C(v21, v23, -1, 0);
    goto LABEL_6;
  }
  *v16 = a2;
  swift_storeEnumTagMultiPayload();
  v19 = a2;
LABEL_7:
  sub_20D1EC4D4((uint64_t)v16, (uint64_t)v18);
  v26(v18);
  sub_20D1EC51C((uint64_t)v18, &qword_2549AD638);
}

void sub_20D1E8100(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  char *v7;
  void (*v8)(char *, void *);
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD630);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_20D206E30();
    v9 = sub_20D206E3C();
    v10 = 0;
  }
  else
  {
    v9 = sub_20D206E3C();
    v10 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v10, 1, v9);
  swift_retain();
  v11 = a3;
  v8(v7, a3);
  swift_release();

  sub_20D1EC51C((uint64_t)v7, &qword_2549AD630);
}

CGRect __swiftcall PHPickerResult._preferredContentsRect(targetSize:)(CGSize targetSize)
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(*(id *)(v1 + 8), sel__preferredContentsRectForTargetSize_, targetSize.width, targetSize.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t PHPickerResult._filePromiseURL(contentType:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(v1 + 8);
  sub_20D206E48();
  v4 = (void *)sub_20D206E60();
  OUTLINED_FUNCTION_29();
  v5 = objc_msgSend(v3, sel__filePromiseURLForTypeIdentifier_, v4);

  if (v5)
  {
    sub_20D206E30();

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  v7 = sub_20D206E3C();
  return __swift_storeEnumTagSinglePayload(a1, v6, 1, v7);
}

uint64_t static PHPickerResult.== infix(_:_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_54(a1, &qword_2549AD2B0);
  if ((OUTLINED_FUNCTION_74() & 1) != 0)
    return sub_20D206EB4() & 1;
  else
    return 0;
}

void PHPickerResult.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;

  v1 = *(void **)(v0 + 8);
  v2 = *(id *)v0;
  OUTLINED_FUNCTION_40();

  v3 = v1;
  OUTLINED_FUNCTION_45();

}

void PHPickerResult.hashValue.getter()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *v0;
  v2 = v0[1];
  OUTLINED_FUNCTION_10();
  v3 = v1;
  OUTLINED_FUNCTION_32();

  v4 = v2;
  OUTLINED_FUNCTION_32();

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_50();
}

uint64_t sub_20D1E8394()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  sub_20D206F68();
  v3 = v1;
  sub_20D206EC0();

  v4 = v2;
  sub_20D206EC0();

  return sub_20D206F8C();
}

void PHPickerViewController.configuration.getter(uint64_t a1@<X8>)
{
  void *v1;
  void *v3;
  __int128 v4;
  __int128 v5;

  if (objc_msgSend(v1, sel__overlayStorage))
  {
    OUTLINED_FUNCTION_68();
    swift_unknownObjectRelease();
    sub_20D1EABD8(&v4, &v5);
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_24();
    sub_20D1EAC08((uint64_t)v3 + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_configuration, a1);

  }
  else
  {
    __break(1u);
  }
}

id PHPickerViewController.delegate.getter()
{
  void *v0;
  id result;
  uint64_t v2;
  char *v3;
  __int128 v4;
  __int128 v5;

  result = objc_msgSend(v0, sel__overlayStorage);
  if (result)
  {
    OUTLINED_FUNCTION_68();
    swift_unknownObjectRelease();
    sub_20D1EABD8(&v4, &v5);
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_24();
    v2 = MEMORY[0x212BA00FC](&v3[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate]);

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_20D1E852C@<X0>(_QWORD *a1@<X8>)
{
  id result;
  uint64_t v3;

  result = PHPickerViewController.delegate.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_20D1E8554(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = swift_unknownObjectRetain();
  PHPickerViewController.delegate.setter(v2, v1);
}

void PHPickerViewController.delegate.setter(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char *v5;
  __int128 v6;
  __int128 v7;

  v3 = v2;
  if (objc_msgSend(v3, sel__overlayStorage))
  {
    OUTLINED_FUNCTION_68();
    swift_unknownObjectRelease();
    sub_20D1EABD8(&v6, &v7);
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_24();
    *(_QWORD *)&v5[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate + 8] = a2;
    swift_unknownObjectWeakAssign();

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_42();
  }
  else
  {
    __break(1u);
  }
}

void PHPickerViewController.delegate.modify(id *a1)
{
  void *v1;
  void *v3;

  a1[2] = v1;
  *a1 = PHPickerViewController.delegate.getter();
  a1[1] = v3;
  OUTLINED_FUNCTION_11();
}

void sub_20D1E8664(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  if ((a2 & 1) != 0)
  {
    v3 = swift_unknownObjectRetain();
    PHPickerViewController.delegate.setter(v3, v2);
    swift_unknownObjectRelease();
  }
  else
  {
    PHPickerViewController.delegate.setter(*a1, v2);
    OUTLINED_FUNCTION_5();
  }
}

id PHPickerViewController.init(configuration:)(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _BYTE v10[328];

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = sub_20D1E8774();
  v4 = objc_msgSend(v2, sel_initWithConfiguration_, v3);

  sub_20D1EAC08(a1, (uint64_t)v10);
  v5 = objc_allocWithZone((Class)OUTLINED_FUNCTION_53());
  v6 = v4;
  v7 = sub_20D1E97DC((uint64_t)v10);
  v8 = OUTLINED_FUNCTION_90((uint64_t)v7, sel_setDelegate_);
  OUTLINED_FUNCTION_90((uint64_t)v8, sel__setOverlayStorage_);

  sub_20D1EAC3C(a1);
  return v6;
}

id sub_20D1E8774()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21[24];
  uint64_t v22;

  v1 = v0;
  v2 = sub_20D1E9E40((uint64_t)v0);
  objc_msgSend(v2, sel_setPreferredAssetRepresentationMode_, *v0);
  sub_20D1EC48C((uint64_t)(v0 + 40), (uint64_t)&v19, &qword_2549AD2B8);
  if (v20)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = v21[0];
      goto LABEL_6;
    }
  }
  else
  {
    sub_20D1EC51C((uint64_t)&v19, &qword_2549AD2B8);
  }
  v3 = 0;
LABEL_6:
  objc_msgSend(v2, sel_setSelection_, v3);
  objc_msgSend(v2, sel_setSelectionLimit_, *((_QWORD *)v0 + 1));
  objc_msgSend(v2, sel_setFilter_, *((_QWORD *)v0 + 2));
  swift_bridgeObjectRetain();
  v4 = (void *)sub_20D206E90();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setPreselectedAssetIdentifiers_, v4);

  sub_20D1EC48C((uint64_t)(v0 + 88), (uint64_t)&v19, &qword_2549AD2B8);
  if (v20)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = *(_QWORD *)v21;
      goto LABEL_11;
    }
  }
  else
  {
    sub_20D1EC51C((uint64_t)&v19, &qword_2549AD2B8);
  }
  v5 = 0;
LABEL_11:
  v6 = objc_msgSend(v2, sel_setMode_, v5);
  objc_msgSend(v2, sel__setSourceType_, PHPickerConfiguration._sourceType.getter((uint64_t)v6, v7, v8, v9));
  objc_msgSend(v2, sel__setAlwaysShowLoadingPlaceholder_, v0[232] & 1);
  v10 = *((_QWORD *)v0 + 16);
  objc_msgSend(v2, sel_setEdgesWithoutContentMargins_, *(_QWORD *)(v10 + 16));
  objc_msgSend(v2, sel_setDisabledCapabilities_, *(_QWORD *)(v10 + 24));
  sub_20D1EC48C((uint64_t)(v1 + 136), (uint64_t)&v19, &qword_2549AD2B8);
  if (v20)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v11 = *(void **)v21;
      goto LABEL_16;
    }
  }
  else
  {
    sub_20D1EC51C((uint64_t)&v19, &qword_2549AD2B8);
  }
  v11 = 0;
LABEL_16:
  objc_msgSend(v2, sel_set_suggestionGroup_, v11);

  objc_msgSend(v2, sel__setDisabledPrivateCapabilities_, *(_QWORD *)(*((_QWORD *)v1 + 16) + 32));
  if (*((_QWORD *)v1 + 28))
  {
    swift_bridgeObjectRetain();
    v12 = (void *)sub_20D206E60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v2, sel_set_containerIdentifier_, v12);

  sub_20D1EC48C((uint64_t)(v1 + 240), (uint64_t)v21, &qword_2549AD2B8);
  if (v22)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v13 = sub_20D1E9C70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
  }
  else
  {
    sub_20D1EC51C((uint64_t)v21, &qword_2549AD2B8);
  }
  v13 = 0;
LABEL_24:
  objc_msgSend(v2, sel__setAlbumsConfiguration_, v13);

  sub_20D1EC48C((uint64_t)(v1 + 280), (uint64_t)v21, &qword_2549AD2B8);
  if (v22)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v14 = sub_20D1E9C70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
  }
  else
  {
    sub_20D1EC51C((uint64_t)v21, &qword_2549AD2B8);
  }
  v14 = 0;
LABEL_29:
  objc_msgSend(v2, sel__setPeopleConfiguration_, v14);

  v15 = *((_QWORD *)v1 + 40);
  if (v15)
  {
    v16 = sub_20D1E6C08(v15);
    v17 = (void *)v16;
    if (v16)
    {
      sub_20D1E5028(v16);
      swift_bridgeObjectRelease();
      sub_20D1EC458(0, &qword_2549AD628);
      v17 = (void *)sub_20D206E90();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v2, sel__setFollowupPeopleConfigurations_, v17);

  objc_msgSend(v2, sel__setExcludedCollections_, *(_QWORD *)(*((_QWORD *)v1 + 16) + 40));
  objc_msgSend(v2, sel__setAllowsDownscaling_, v1[233] & 1);
  objc_msgSend(v2, sel__setAllowsEncodingPolicyModification_, (v1[234] == 2) | (v1[234] & 1));
  return v2;
}

Swift::Void __swiftcall PHPickerViewController.updatePicker(using:)(PhotosUI::PHPickerConfiguration::Update using)
{
  void *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  id v6;

  v2 = *(_QWORD *)using.selectionLimit.value;
  v3 = *(_BYTE *)(using.selectionLimit.value + 8);
  v4 = *(_QWORD *)(using.selectionLimit.value + 16);
  v5 = *(_BYTE *)(using.selectionLimit.value + 24);
  v6 = objc_msgSend(objc_allocWithZone((Class)PHPickerUpdateConfiguration), sel_init);
  if ((v5 & 1) == 0)
    objc_msgSend(v6, sel_setEdgesWithoutContentMargins_, v4);
  if ((v3 & 1) == 0)
    objc_msgSend(v6, sel_setSelectionLimit_, v2);
  objc_msgSend(v1, sel_updatePickerUsingConfiguration_, v6);

}

uint64_t _PHPickerCollectionConfiguration.init(identifiers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)a2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = v2;
  *(_BYTE *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = result;
  return result;
}

void _PHPickerCollectionConfiguration.init()(uint64_t a1@<X8>)
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)a1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 8) = v1;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = v1;
  *(_BYTE *)(a1 + 40) = 0;
}

uint64_t _PHPickerCollectionConfiguration.suggestedIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void _PHPickerCollectionConfiguration.suggestedIdentifiers.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  OUTLINED_FUNCTION_11();
}

uint64_t (*_PHPickerCollectionConfiguration.suggestedIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t _PHPickerCollectionConfiguration.preselectedIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void _PHPickerCollectionConfiguration.preselectedIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  OUTLINED_FUNCTION_11();
}

uint64_t (*_PHPickerCollectionConfiguration.preselectedIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t _PHPickerCollectionConfiguration.disabledIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void _PHPickerCollectionConfiguration.disabledIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_11();
}

uint64_t (*_PHPickerCollectionConfiguration.disabledIdentifiers.modify())()
{
  return nullsub_1;
}

void _PHPickerCollectionConfiguration.purpose.getter()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_11();
}

void _PHPickerCollectionConfiguration.purpose.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*_PHPickerCollectionConfiguration.purpose.modify())()
{
  return nullsub_1;
}

uint64_t _PHPickerCollectionConfiguration.allowsEditingCollection.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t _PHPickerCollectionConfiguration.allowsEditingCollection.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result;
  return result;
}

uint64_t (*_PHPickerCollectionConfiguration.allowsEditingCollection.modify())()
{
  return nullsub_1;
}

uint64_t static _PHPickerCollectionConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  char v13;
  uint64_t result;
  _QWORD *v15;
  _QWORD *v16;

  v2 = *(_QWORD **)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 40);
  v7 = *(_QWORD **)(a2 + 8);
  v9 = *(_QWORD **)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(unsigned __int8 *)(a2 + 40);
  v15 = *(_QWORD **)(a2 + 48);
  v16 = *(_QWORD **)(a1 + 48);
  if ((sub_20D1E8FF4(*(_QWORD **)a1, *(_QWORD **)a2) & 1) == 0
    || (sub_20D1E8FF4(v2, v7) & 1) == 0
    || (sub_20D1E8FF4(v4, v9) & 1) == 0)
  {
    return 0;
  }
  if (v5)
  {
    if (!v10)
      return 0;
    if (v3 == v8 && v5 == v10)
    {
      if (v6 != v11)
        return 0;
      goto LABEL_16;
    }
    v13 = sub_20D206F5C();
    result = 0;
    if ((v13 & 1) == 0)
      return result;
  }
  else
  {
    result = 0;
    if (v10)
      return result;
  }
  if (((v6 ^ v11) & 1) == 0)
  {
LABEL_16:
    if (v16)
    {
      if (v15 && (sub_20D1E8FF4(v16, v15) & 1) != 0)
        return 1;
    }
    else if (!v15)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_20D1E8FF4(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t result;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    v7 = sub_20D206F5C();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  if (v2 == 1)
    return 1;
  v8 = a2 + 7;
  v9 = a1 + 7;
  v10 = 1;
  while (v10 < v2)
  {
    result = *(v9 - 1);
    if (result != *(v8 - 1) || *v9 != *v8)
    {
      result = sub_20D206F5C();
      if ((result & 1) == 0)
        return 0;
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10)
      return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D1E90C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  BOOL v8;
  _BYTE v10[40];
  _BYTE v11[40];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v6 = 1;
    }
    else
    {
      v3 = a1 + 32;
      v4 = a2 + 32;
      v5 = v2 - 1;
      do
      {
        sub_20D1EC554(v3, (uint64_t)v11);
        sub_20D1EC554(v4, (uint64_t)v10);
        v6 = MEMORY[0x212B9F8A4](v11, v10);
        sub_20D1EA570((uint64_t)v10);
        sub_20D1EA570((uint64_t)v11);
        v8 = v5-- != 0;
        if ((v6 & 1) == 0)
          break;
        v3 += 40;
        v4 += 40;
      }
      while (v8);
    }
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t _PHPickerCollectionConfiguration.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[4];
  v7 = v1[6];
  OUTLINED_FUNCTION_86();
  sub_20D1EAAC0(a1, v3);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_87();
  sub_20D1EAAC0(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_20D1EAAC0(a1, v5);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43();
  if (v6)
  {
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_75();
  }
  OUTLINED_FUNCTION_43();
  if (!v7)
    return OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_60();
  sub_20D1EAAC0(a1, v7);
  return swift_bridgeObjectRelease();
}

uint64_t _PHPickerCollectionConfiguration.hashValue.getter()
{
  __int128 *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _BYTE v5[72];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  char v9;
  uint64_t v10;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_BYTE *)v0 + 40);
  v3 = *((_QWORD *)v0 + 6);
  v6 = *v0;
  v7 = v1;
  v8 = *(__int128 *)((char *)v0 + 24);
  v9 = v2;
  v10 = v3;
  OUTLINED_FUNCTION_10();
  _PHPickerCollectionConfiguration.hash(into:)((uint64_t)v5);
  return OUTLINED_FUNCTION_17();
}

uint64_t sub_20D1E92EC()
{
  __int128 *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _BYTE v5[72];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  char v9;
  uint64_t v10;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_BYTE *)v0 + 40);
  v3 = *((_QWORD *)v0 + 6);
  v6 = *v0;
  v7 = v1;
  v8 = *(__int128 *)((char *)v0 + 24);
  v9 = v2;
  v10 = v3;
  sub_20D206F68();
  _PHPickerCollectionConfiguration.hash(into:)((uint64_t)v5);
  return sub_20D206F8C();
}

void sub_20D1E9350(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_wallpaperSuggestionGroup, &qword_2549AD210);
}

id static _PHPickerSuggestionGroup.wallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD208, (void **)&qword_2549AD210, a1);
}

void sub_20D1E9388(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_shuffleWallpaperSuggestionGroup, &qword_2549AD220);
}

id static _PHPickerSuggestionGroup.shuffleWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD218, (void **)&qword_2549AD220, a1);
}

void sub_20D1E93C0(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_portraitWallpaperSuggestionGroup, &qword_2549AD230);
}

id static _PHPickerSuggestionGroup.portraitWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD228, (void **)&qword_2549AD230, a1);
}

void sub_20D1E93F8(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_livePhotoWallpaperSuggestionGroup, &qword_2549AD240);
}

id static _PHPickerSuggestionGroup.livePhotoWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD238, (void **)&qword_2549AD240, a1);
}

void sub_20D1E9430(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_deviceOwnerSuggestionGroup, &qword_2549AD250);
}

id static _PHPickerSuggestionGroup.deviceOwner.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD248, (void **)&qword_2549AD250, a1);
}

void sub_20D1E9468(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_stickersSuggestionGroup, &qword_2549AD260);
}

id static _PHPickerSuggestionGroup.stickers.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD258, (void **)&qword_2549AD260, a1);
}

void sub_20D1E94A0(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_retailExperienceSuggestionGroup, &qword_2549AD270);
}

id static _PHPickerSuggestionGroup.retailExperience.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD268, (void **)&qword_2549AD270, a1);
}

void sub_20D1E94D8(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_watchWallpaperSuggestionGroup, &qword_2549AD280);
}

id static _PHPickerSuggestionGroup.watchWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD278, (void **)&qword_2549AD280, a1);
}

void sub_20D1E9510(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_generativeSuggestionGroup, &qword_2549AD290);
}

id static _PHPickerSuggestionGroup.generative.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD288, (void **)&qword_2549AD290, a1);
}

void sub_20D1E9548(uint64_t a1)
{
  sub_20D1E9564(a1, (uint64_t)&off_24C62AE78, (SEL *)&selRef_styleabilitySuggestionGroup, &qword_2549AD2A0);
}

void sub_20D1E9564(uint64_t a1, uint64_t a2, SEL *a3, _QWORD *a4)
{
  *a4 = objc_msgSend((id)objc_opt_self(), *a3);
  OUTLINED_FUNCTION_11();
}

id static _PHPickerSuggestionGroup.styleability.getter@<X0>(void **a1@<X8>)
{
  return sub_20D1E4CBC(&qword_2549AD298, (void **)&qword_2549AD2A0, a1);
}

void static _PHPickerSuggestionGroup.assetCollection(identifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)(char a1@<W2>, char a2@<W3>, _QWORD *a3@<X8>)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_20D206E60();
  v8 = objc_msgSend(v6, sel_assetCollectionSuggestionGroup_extendedCuratedAssetsOnly_shouldReverseSortOrder_, v7, a1 & 1, a2 & 1);

  *a3 = v8;
}

uint64_t _s8PhotosUI14PHPickerFilterV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  OUTLINED_FUNCTION_54(a1, &qword_2549AD2B0);
  OUTLINED_FUNCTION_61();
  return sub_20D206EB4() & 1;
}

void _s8PhotosUI14PHPickerFilterV9hashValueSivg_0()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  OUTLINED_FUNCTION_10();
  v2 = v1;
  OUTLINED_FUNCTION_32();

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

void sub_20D1E96C4()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  OUTLINED_FUNCTION_80();
  v2 = v1;
  OUTLINED_FUNCTION_32();

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

uint64_t sub_20D1E96F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._edgesWithoutContentMargins.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D1E9720(_QWORD *a1)
{
  return PHPickerConfiguration._edgesWithoutContentMargins.setter(*a1);
}

uint64_t (*PHPickerConfiguration._edgesWithoutContentMargins.modify(_QWORD *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 16);
  return j__OUTLINED_FUNCTION_57;
}

uint64_t sub_20D1E976C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PHPickerConfiguration._disabledFeatures.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D1E9794(_QWORD *a1)
{
  return PHPickerConfiguration._disabledFeatures.setter(*a1);
}

uint64_t (*PHPickerConfiguration._disabledFeatures.modify(_QWORD *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 24);
  return j__OUTLINED_FUNCTION_56;
}

id sub_20D1E97DC(uint64_t a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_20D1EAC08(a1, (uint64_t)&v1[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_configuration]);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for _PHPickerOverlayStorage();
  v3 = objc_msgSendSuper2(&v5, sel_init);
  sub_20D1EAC3C(a1);
  return v3;
}

char *sub_20D1E9858(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char *result;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v5 = v2 + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate;
  result = (char *)MEMORY[0x212BA00FC](v5);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)(v5 + 8);
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      v9 = sub_20D206F50();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v10 = MEMORY[0x24BEE4AF8];
    if (!v9)
    {
LABEL_14:
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, v10, ObjectType, v8);
      swift_bridgeObjectRelease();
      return (char *)swift_unknownObjectRelease();
    }
    v22 = MEMORY[0x24BEE4AF8];
    result = sub_20D1EA5F8(0, v9 & ~(v9 >> 63), 0);
    if ((v9 & 0x8000000000000000) == 0)
    {
      v19 = v8;
      v20 = a1;
      v21 = v7;
      v11 = 0;
      v10 = v22;
      do
      {
        if ((a2 & 0xC000000000000001) != 0)
          v12 = (id)MEMORY[0x212B9F8C8](v11, a2);
        else
          v12 = *(id *)(a2 + 8 * v11 + 32);
        v13 = v12;
        v14 = objc_msgSend(v12, sel_itemProvider, v19, v20, v21);
        v16 = *(_QWORD *)(v22 + 16);
        v15 = *(_QWORD *)(v22 + 24);
        if (v16 >= v15 >> 1)
          sub_20D1EA5F8((char *)(v15 > 1), v16 + 1, 1);
        ++v11;
        *(_QWORD *)(v22 + 16) = v16 + 1;
        v17 = v22 + 16 * v16;
        *(_QWORD *)(v17 + 32) = v14;
        *(_QWORD *)(v17 + 40) = v13;
      }
      while (v9 != v11);
      a1 = v20;
      v8 = v19;
      goto LABEL_14;
    }
    __break(1u);
  }
  return result;
}

void sub_20D1E9AA4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_20D1E9AF0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PHPickerOverlayStorage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20D1E9B5C()
{
  sub_20D206F74();
  sub_20D206F74();
  sub_20D206F74();
  return sub_20D206F74();
}

uint64_t sub_20D1E9B9C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_20D1E9BAC()
{
  sub_20D206F68();
  sub_20D1E9B5C();
  return sub_20D206F8C();
}

BOOL sub_20D1E9BE8(_QWORD **a1, _QWORD **a2)
{
  return sub_20D1E79E4(*a1, *a2);
}

uint64_t sub_20D1E9BF4()
{
  return sub_20D1E9BAC();
}

uint64_t sub_20D1E9C14()
{
  return sub_20D1E9B5C();
}

uint64_t sub_20D1E9C34()
{
  sub_20D206F68();
  sub_20D1E9B5C();
  return sub_20D206F8C();
}

void *sub_20D1E9C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(unsigned __int8 *)(v0 + 40);
  if (*(_QWORD *)(v0 + 48))
  {
    sub_20D1EC458(0, &qword_2549AD628);
    swift_bridgeObjectRetain();
    v3 = sub_20D1E9DD0();
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone((Class)_PHPickerCollectionConfiguration), sel_init);
  }
  v4 = v3;
  v5 = (void *)sub_20D206E90();
  objc_msgSend(v4, sel_setSuggestedIdentifiers_, v5);

  v6 = (void *)sub_20D206E90();
  objc_msgSend(v4, sel_setPreselectedIdentifiers_, v6);

  v7 = (void *)sub_20D206E90();
  objc_msgSend(v4, sel_setDisabledIdentifiers_, v7);

  if (v1)
    v8 = (void *)sub_20D206E60();
  else
    v8 = 0;
  objc_msgSend(v4, sel_setPurpose_, v8);

  objc_msgSend(v4, sel_setAllowsEditingCollection_, v2);
  return v4;
}

id sub_20D1E9DD0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_20D206E90();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithIdentifiers_, v1);

  return v2;
}

id sub_20D1E9E40(uint64_t a1)
{
  char v2;
  id v3;
  const char *v4;

  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_7;
  objc_opt_self();
  if (swift_dynamicCastObjCClass() && (*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    v3 = objc_allocWithZone((Class)PHPickerConfiguration);
    v4 = sel_initWithPhotoLibraryAndOnlyReturnsIdentifiers_;
    return objc_msgSend(v3, v4);
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v2 = *(_BYTE *)(a1 + 33);
    v3 = objc_allocWithZone((Class)PHPickerConfiguration);
    if ((v2 & 1) != 0)
      v4 = sel_initWithPhotoLibraryAndOnlyForOpenPanel_;
    else
      v4 = sel_initWithPhotoLibrary_;
  }
  else
  {
LABEL_7:
    v3 = objc_allocWithZone((Class)PHPickerConfiguration);
    v4 = sel_init;
  }
  return objc_msgSend(v3, v4);
}

void sub_20D1E9F20()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

void sub_20D1E9F48()
{
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_11();
}

void sub_20D1E9F64()
{
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9();
}

id sub_20D1E9F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_20D206E60();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_20D206E54();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

void sub_20D1EA038(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_20D1EA068();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_20D1EA070@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void sub_20D1EA098()
{
  sub_20D1E9F20();
}

void sub_20D1EA0B0()
{
  sub_20D1E9F48();
}

void sub_20D1EA0B8()
{
  sub_20D1E9F64();
}

uint64_t sub_20D1EA0D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D1EA0F4();
  *a1 = result;
  return result;
}

uint64_t sub_20D1EA0F4()
{
  return 0;
}

uint64_t sub_20D1EA0FC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D1EA128(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_20D1EA128(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_20D1EA130@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D1EA15C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_20D1EA15C(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_20D1EA164@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D1EA190(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_20D1EA190(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_20D1EA198(_QWORD *a1, uint64_t *a2)
{
  return sub_20D1EA1A0(a1, *a2);
}

BOOL sub_20D1EA1A0(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_20D1EA1CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_20D1EA1FC(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_20D1EA1FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = *v1 & a1;
  if (result)
    *v1 &= ~a1;
  return result;
}

uint64_t sub_20D1EA220@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_20D1EA250(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_20D1EA250(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_20D1EA268(uint64_t *a1)
{
  return sub_20D1EA270(*a1);
}

uint64_t sub_20D1EA270(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_20D1EA280(uint64_t *a1)
{
  return sub_20D1EA288(*a1);
}

uint64_t sub_20D1EA288(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_20D1EA298(uint64_t *a1)
{
  return sub_20D1EA2A0(*a1);
}

uint64_t sub_20D1EA2A0(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_20D1EA2B0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D1EA2DC(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_20D1EA2DC(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_20D1EA2E4(uint64_t *a1)
{
  uint64_t *v1;

  return sub_20D1EA2F0(*a1, *v1);
}

BOOL sub_20D1EA2F0(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_20D1EA2FC(uint64_t *a1)
{
  uint64_t *v1;

  return sub_20D1EA308(*a1, *v1);
}

BOOL sub_20D1EA308(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_20D1EA314(uint64_t *a1)
{
  uint64_t *v1;

  return sub_20D1EA320(*a1, *v1);
}

BOOL sub_20D1EA320(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_20D1EA32C()
{
  uint64_t *v0;

  return sub_20D1EA334(*v0);
}

BOOL sub_20D1EA334(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_20D1EA340()
{
  return sub_20D206ED8();
}

uint64_t sub_20D1EA358(uint64_t *a1)
{
  return sub_20D1EA360(*a1);
}

uint64_t sub_20D1EA360(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

BOOL sub_20D1EA370(uint64_t *a1, uint64_t *a2)
{
  return sub_20D1E4BA8(*a1, *a2);
}

unint64_t sub_20D1EA37C()
{
  unint64_t result;

  result = qword_2549AD2C0;
  if (!qword_2549AD2C0)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerConfiguration.Selection, &type metadata for PHPickerConfiguration.Selection);
    atomic_store(result, (unint64_t *)&qword_2549AD2C0);
  }
  return result;
}

uint64_t sub_20D1EA3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD2B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_20D1EA400()
{
  unint64_t result;

  result = qword_2549AD2C8;
  if (!qword_2549AD2C8)
  {
    result = MEMORY[0x212BA0054]("E\x1BB?tU", &type metadata for PHPickerMode);
    atomic_store(result, (unint64_t *)&qword_2549AD2C8);
  }
  return result;
}

uint64_t type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes()
{
  return objc_opt_self();
}

unint64_t sub_20D1EA45C()
{
  unint64_t result;

  result = qword_2549AD2D0;
  if (!qword_2549AD2D0)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for _PHPickerSuggestionGroup, &type metadata for _PHPickerSuggestionGroup);
    atomic_store(result, (unint64_t *)&qword_2549AD2D0);
  }
  return result;
}

void type metadata accessor for _PHPickerSourceType(uint64_t a1)
{
  sub_20D1EC018(a1, &qword_2549AD568);
}

unint64_t sub_20D1EA4AC()
{
  unint64_t result;

  result = qword_2549AD2E0;
  if (!qword_2549AD2E0)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for _PHPickerCollectionConfiguration, &type metadata for _PHPickerCollectionConfiguration);
    atomic_store(result, (unint64_t *)&qword_2549AD2E0);
  }
  return result;
}

uint64_t sub_20D1EA4E8(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_20D1EA540(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  sub_20D1E72B8(a1);
  *a2 = v3;
}

_QWORD *sub_20D1EA564@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_20D1EA570(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

_QWORD *sub_20D1EA5A4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_20D1EA5B4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

char *sub_20D1EA5C0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D1EA630(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20D1EA5DC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D1EA73C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20D1EA5F8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D1EA848(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20D1EA614(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D1EA944(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20D1EA630(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD648);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[56 * v8] <= v12)
      memmove(v12, v13, 56 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_20D1EA73C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD640);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12)
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_20D1EA848(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD608);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_20D1EA944(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD620);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12)
      memmove(v12, v13, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_20D1EAA44(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[8 * a2] <= __dst)
    return (char *)memmove(__dst, __src, 8 * a2);
  return __src;
}

void sub_20D1EAA70(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_20D206E78();

  }
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_20D1EAAC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_20D206F74();
  if (v3)
  {
    v5 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_20D206E84();
      result = swift_bridgeObjectRelease();
      v5 += 16;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_20D1EAB34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_20D206F74();
  if (v3)
  {
    v5 = a2 + 32;
    do
    {
      result = sub_20D206EF0();
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_20D1EAB88()
{
  swift_release();
  return swift_deallocObject();
}

void sub_20D1EABAC(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_20D1E7EDC(a1, a2, *(void (**)(char *))(v2 + 16), *(_QWORD *)(v2 + 24));
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

_OWORD *sub_20D1EABD8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for _PHPickerOverlayStorage()
{
  return objc_opt_self();
}

uint64_t sub_20D1EAC08(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PHPickerConfiguration(a2, a1);
  return a2;
}

uint64_t sub_20D1EAC3C(uint64_t a1)
{
  destroy for PHPickerConfiguration(a1);
  return a1;
}

unint64_t sub_20D1EAC6C()
{
  unint64_t result;

  result = qword_2549AD300;
  if (!qword_2549AD300)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerMode, &type metadata for PHPickerMode);
    atomic_store(result, (unint64_t *)&qword_2549AD300);
  }
  return result;
}

unint64_t sub_20D1EACAC()
{
  unint64_t result;

  result = qword_2549AD308;
  if (!qword_2549AD308)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerFilter, &type metadata for PHPickerFilter);
    atomic_store(result, (unint64_t *)&qword_2549AD308);
  }
  return result;
}

unint64_t sub_20D1EACEC()
{
  unint64_t result;

  result = qword_2549AD310;
  if (!qword_2549AD310)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerConfiguration.AssetRepresentationMode, &type metadata for PHPickerConfiguration.AssetRepresentationMode);
    atomic_store(result, (unint64_t *)&qword_2549AD310);
  }
  return result;
}

unint64_t sub_20D1EAD2C()
{
  unint64_t result;

  result = qword_2549AD318;
  if (!qword_2549AD318)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerConfiguration.Selection, &type metadata for PHPickerConfiguration.Selection);
    atomic_store(result, (unint64_t *)&qword_2549AD318);
  }
  return result;
}

unint64_t sub_20D1EAD6C()
{
  unint64_t result;

  result = qword_2549AD320;
  if (!qword_2549AD320)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerConfiguration.Update, &type metadata for PHPickerConfiguration.Update);
    atomic_store(result, (unint64_t *)&qword_2549AD320);
  }
  return result;
}

unint64_t sub_20D1EADAC()
{
  unint64_t result;

  result = qword_2549AD328;
  if (!qword_2549AD328)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerConfiguration, &type metadata for PHPickerConfiguration);
    atomic_store(result, (unint64_t *)&qword_2549AD328);
  }
  return result;
}

unint64_t sub_20D1EADEC()
{
  unint64_t result;

  result = qword_2549AD330;
  if (!qword_2549AD330)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PHPickerResult, &type metadata for PHPickerResult);
    atomic_store(result, (unint64_t *)&qword_2549AD330);
  }
  return result;
}

unint64_t sub_20D1EAE2C()
{
  unint64_t result;

  result = qword_2549AD338;
  if (!qword_2549AD338)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for _PHPickerCollectionConfiguration, &type metadata for _PHPickerCollectionConfiguration);
    atomic_store(result, (unint64_t *)&qword_2549AD338);
  }
  return result;
}

unint64_t sub_20D1EAE6C()
{
  unint64_t result;

  result = qword_2549AD340;
  if (!qword_2549AD340)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for _PHPickerSuggestionGroup, &type metadata for _PHPickerSuggestionGroup);
    atomic_store(result, (unint64_t *)&qword_2549AD340);
  }
  return result;
}

void type metadata accessor for PHPickerMode()
{
  OUTLINED_FUNCTION_23();
}

void type metadata accessor for PHPickerFilter()
{
  OUTLINED_FUNCTION_23();
}

uint64_t destroy for PHPickerConfiguration(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 112))
    __swift_destroy_boxed_opaque_existential_1(a1 + 88);
  swift_release();
  if (*(_QWORD *)(a1 + 160))
    __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  if (*(_QWORD *)(a1 + 200))
    __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 264))
    __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  if (*(_QWORD *)(a1 + 304))
    __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PHPickerConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  _OWORD *v28;
  _OWORD *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v5;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v6 = a1 + 40;
  v7 = a2 + 40;
  v8 = *(_QWORD *)(a2 + 64);
  v9 = v4;
  v10 = v5;
  if (v8)
  {
    v11 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v8;
    *(_QWORD *)(a1 + 72) = v11;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8))(v6, v7, v8);
  }
  else
  {
    v12 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)v6 = *(_OWORD *)v7;
    *(_OWORD *)(v6 + 16) = v12;
    *(_QWORD *)(v6 + 32) = *(_QWORD *)(v7 + 32);
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v13 = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  if (v13)
  {
    v14 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 112) = v13;
    *(_QWORD *)(a1 + 120) = v14;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8))(a1 + 88, a2 + 88, v13);
  }
  else
  {
    v15 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = v15;
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  }
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v16 = *(_QWORD *)(a2 + 160);
  swift_retain();
  if (v16)
  {
    v17 = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 160) = v16;
    *(_QWORD *)(a1 + 168) = v17;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v16 - 8))(a1 + 136, a2 + 136, v16);
  }
  else
  {
    v18 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v18;
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  }
  v19 = (_OWORD *)(a1 + 176);
  v20 = (_OWORD *)(a2 + 176);
  v21 = *(_QWORD *)(a2 + 200);
  if (v21)
  {
    v22 = *(_QWORD *)(a2 + 208);
    *(_QWORD *)(a1 + 200) = v21;
    *(_QWORD *)(a1 + 208) = v22;
    (**(void (***)(_OWORD *, _OWORD *))(v21 - 8))(v19, v20);
  }
  else
  {
    v23 = *(_OWORD *)(a2 + 192);
    *v19 = *v20;
    *(_OWORD *)(a1 + 192) = v23;
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  }
  v24 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v24;
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  v25 = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  if (v25)
  {
    v26 = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 264) = v25;
    *(_QWORD *)(a1 + 272) = v26;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v25 - 8))(a1 + 240, a2 + 240, v25);
  }
  else
  {
    v27 = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
    *(_OWORD *)(a1 + 256) = v27;
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  }
  v28 = (_OWORD *)(a1 + 280);
  v29 = (_OWORD *)(a2 + 280);
  v30 = *(_QWORD *)(a2 + 304);
  if (v30)
  {
    v31 = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 304) = v30;
    *(_QWORD *)(a1 + 312) = v31;
    (**(void (***)(_OWORD *, _OWORD *))(v30 - 8))(v28, v29);
  }
  else
  {
    v32 = *(_OWORD *)(a2 + 296);
    *v28 = *v29;
    *(_OWORD *)(a1 + 296) = v32;
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  }
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PHPickerConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _OWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD *v38;
  _OWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD *v45;
  _OWORD *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(void **)(a1 + 16);
  v5 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v5;

  v7 = *(void **)(a1 + 24);
  v8 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v9 = v8;

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v10 = (_OWORD *)(a1 + 40);
  v11 = (_OWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 64);
  if (*(_QWORD *)(a1 + 64))
  {
    if (v12)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
    }
    else
    {
      sub_20D1EA570(a1 + 40);
      v13 = *(_QWORD *)(a2 + 72);
      v14 = *(_OWORD *)(a2 + 56);
      *v10 = *v11;
      *(_OWORD *)(a1 + 56) = v14;
      *(_QWORD *)(a1 + 72) = v13;
    }
  }
  else if (v12)
  {
    *(_QWORD *)(a1 + 64) = v12;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 40, a2 + 40);
  }
  else
  {
    v15 = *v11;
    v16 = *(_OWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *v10 = v15;
    *(_OWORD *)(a1 + 56) = v16;
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = (_OWORD *)(a1 + 88);
  v18 = (_OWORD *)(a2 + 88);
  v19 = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 112))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 88), (uint64_t *)(a2 + 88));
    }
    else
    {
      sub_20D1EA570(a1 + 88);
      v20 = *(_QWORD *)(a2 + 120);
      v21 = *(_OWORD *)(a2 + 104);
      *v17 = *v18;
      *(_OWORD *)(a1 + 104) = v21;
      *(_QWORD *)(a1 + 120) = v20;
    }
  }
  else if (v19)
  {
    *(_QWORD *)(a1 + 112) = v19;
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 88, a2 + 88);
  }
  else
  {
    v22 = *v18;
    v23 = *(_OWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    *v17 = v22;
    *(_OWORD *)(a1 + 104) = v23;
  }
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_retain();
  swift_release();
  v24 = (_OWORD *)(a1 + 136);
  v25 = (_OWORD *)(a2 + 136);
  v26 = *(_QWORD *)(a2 + 160);
  if (*(_QWORD *)(a1 + 160))
  {
    if (v26)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
    }
    else
    {
      sub_20D1EA570(a1 + 136);
      v27 = *(_QWORD *)(a2 + 168);
      v28 = *(_OWORD *)(a2 + 152);
      *v24 = *v25;
      *(_OWORD *)(a1 + 152) = v28;
      *(_QWORD *)(a1 + 168) = v27;
    }
  }
  else if (v26)
  {
    *(_QWORD *)(a1 + 160) = v26;
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 136, a2 + 136);
  }
  else
  {
    v29 = *v25;
    v30 = *(_OWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *v24 = v29;
    *(_OWORD *)(a1 + 152) = v30;
  }
  v31 = (_OWORD *)(a1 + 176);
  v32 = (_OWORD *)(a2 + 176);
  v33 = *(_QWORD *)(a2 + 200);
  if (*(_QWORD *)(a1 + 200))
  {
    if (v33)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 176), (uint64_t *)(a2 + 176));
    }
    else
    {
      sub_20D1EA570(a1 + 176);
      v34 = *(_QWORD *)(a2 + 208);
      v35 = *(_OWORD *)(a2 + 192);
      *v31 = *v32;
      *(_OWORD *)(a1 + 192) = v35;
      *(_QWORD *)(a1 + 208) = v34;
    }
  }
  else if (v33)
  {
    *(_QWORD *)(a1 + 200) = v33;
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    (**(void (***)(uint64_t, uint64_t))(v33 - 8))(a1 + 176, a2 + 176);
  }
  else
  {
    v36 = *v32;
    v37 = *(_OWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *v31 = v36;
    *(_OWORD *)(a1 + 192) = v37;
  }
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v38 = (_OWORD *)(a1 + 240);
  v39 = (_OWORD *)(a2 + 240);
  v40 = *(_QWORD *)(a2 + 264);
  if (*(_QWORD *)(a1 + 264))
  {
    if (v40)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)(a2 + 240));
    }
    else
    {
      sub_20D1EA570(a1 + 240);
      v41 = *(_QWORD *)(a2 + 272);
      v42 = *(_OWORD *)(a2 + 256);
      *v38 = *v39;
      *(_OWORD *)(a1 + 256) = v42;
      *(_QWORD *)(a1 + 272) = v41;
    }
  }
  else if (v40)
  {
    *(_QWORD *)(a1 + 264) = v40;
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    (**(void (***)(uint64_t, uint64_t))(v40 - 8))(a1 + 240, a2 + 240);
  }
  else
  {
    v43 = *v39;
    v44 = *(_OWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *v38 = v43;
    *(_OWORD *)(a1 + 256) = v44;
  }
  v45 = (_OWORD *)(a1 + 280);
  v46 = (_OWORD *)(a2 + 280);
  v47 = *(_QWORD *)(a2 + 304);
  if (*(_QWORD *)(a1 + 304))
  {
    if (v47)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 280), (uint64_t *)(a2 + 280));
    }
    else
    {
      sub_20D1EA570(a1 + 280);
      v48 = *(_QWORD *)(a2 + 312);
      v49 = *(_OWORD *)(a2 + 296);
      *v45 = *v46;
      *(_OWORD *)(a1 + 296) = v49;
      *(_QWORD *)(a1 + 312) = v48;
    }
  }
  else if (v47)
  {
    *(_QWORD *)(a1 + 304) = v47;
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
    (**(void (***)(uint64_t, uint64_t))(v47 - 8))(a1 + 280, a2 + 280);
  }
  else
  {
    v50 = *v46;
    v51 = *(_OWORD *)(a2 + 296);
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
    *v45 = v50;
    *(_OWORD *)(a1 + 296) = v51;
  }
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PHPickerConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;

  v6 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a2 + 64))
      __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    else
      sub_20D1EA570(a1 + 40);
  }
  v7 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 112))
  {
    if (*(_QWORD *)(a2 + 112))
      __swift_destroy_boxed_opaque_existential_1(a1 + 88);
    else
      sub_20D1EA570(a1 + 88);
  }
  v8 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = v8;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_release();
  if (*(_QWORD *)(a1 + 160))
  {
    if (*(_QWORD *)(a2 + 160))
      __swift_destroy_boxed_opaque_existential_1(a1 + 136);
    else
      sub_20D1EA570(a1 + 136);
  }
  v9 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = v9;
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  if (*(_QWORD *)(a1 + 200))
  {
    if (*(_QWORD *)(a2 + 200))
      __swift_destroy_boxed_opaque_existential_1(a1 + 176);
    else
      sub_20D1EA570(a1 + 176);
  }
  v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v11 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v11;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  if (*(_QWORD *)(a1 + 264))
  {
    if (*(_QWORD *)(a2 + 264))
      __swift_destroy_boxed_opaque_existential_1(a1 + 240);
    else
      sub_20D1EA570(a1 + 240);
  }
  v12 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v12;
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  if (*(_QWORD *)(a1 + 304))
  {
    if (*(_QWORD *)(a2 + 304))
      __swift_destroy_boxed_opaque_existential_1(a1 + 280);
    else
      sub_20D1EA570(a1 + 280);
  }
  v13 = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  v14 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v14;
  *(_QWORD *)(a1 + 320) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 328))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 128);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PHPickerConfiguration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 128) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 328) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for PHPickerConfiguration()
{
  OUTLINED_FUNCTION_23();
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration.AssetRepresentationMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PHPickerConfiguration.AssetRepresentationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D1EB924 + 4 * byte_20D20A035[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20D1EB958 + 4 * byte_20D20A030[v4]))();
}

uint64_t sub_20D1EB958(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D1EB960(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D1EB968);
  return result;
}

uint64_t sub_20D1EB974(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D1EB97CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20D1EB980(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D1EB988(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D1EB994(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20D1EB99C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for PHPickerConfiguration.AssetRepresentationMode()
{
  OUTLINED_FUNCTION_23();
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration.Selection(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PHPickerConfiguration.Selection(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D1EBA84 + 4 * byte_20D20A03F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_20D1EBAB8 + 4 * byte_20D20A03A[v4]))();
}

uint64_t sub_20D1EBAB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D1EBAC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D1EBAC8);
  return result;
}

uint64_t sub_20D1EBAD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D1EBADCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_20D1EBAE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D1EBAE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for PHPickerConfiguration.Selection()
{
  OUTLINED_FUNCTION_23();
}

uint64_t initializeBufferWithCopyOfBuffer for PHPickerConfiguration.Update(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration.Update(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PHPickerConfiguration.Update(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
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
  *(_BYTE *)(result + 25) = v3;
  return result;
}

void type metadata accessor for PHPickerConfiguration.Update()
{
  OUTLINED_FUNCTION_23();
}

_QWORD *initializeBufferWithCopyOfBuffer for PHPickerResult(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for PHPickerResult(id *a1)
{

}

uint64_t assignWithCopy for PHPickerResult(uint64_t a1, uint64_t a2)
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

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for PHPickerResult(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for PHPickerResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PHPickerResult(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for PHPickerResult()
{
  OUTLINED_FUNCTION_23();
}

uint64_t dispatch thunk of PHPickerViewControllerDelegate.picker(_:didFinishPicking:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t destroy for _PHPickerCollectionConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for _PHPickerCollectionConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for _PHPickerCollectionConfiguration(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for _PHPickerCollectionConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _PHPickerCollectionConfiguration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _PHPickerCollectionConfiguration(uint64_t result, int a2, int a3)
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

void type metadata accessor for _PHPickerCollectionConfiguration()
{
  OUTLINED_FUNCTION_23();
}

void type metadata accessor for _PHPickerSuggestionGroup()
{
  OUTLINED_FUNCTION_23();
}

void type metadata accessor for _PHPickerCollectionType(uint64_t a1)
{
  sub_20D1EC018(a1, &qword_2549AD540);
}

void type metadata accessor for _PHPickerPrivateCapabilities(uint64_t a1)
{
  sub_20D1EC018(a1, &qword_2549AD548);
}

void type metadata accessor for PHPickerCapabilities(uint64_t a1)
{
  sub_20D1EC018(a1, &qword_2549AD550);
}

void type metadata accessor for NSDirectionalRectEdge(uint64_t a1)
{
  sub_20D1EC018(a1, &qword_2549AD558);
}

void type metadata accessor for __PHPickerMode(uint64_t a1)
{
  sub_20D1EC018(a1, &qword_2549AD560);
}

void sub_20D1EC018(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
  OUTLINED_FUNCTION_11();
}

void sub_20D1EC058()
{
  sub_20D1EC084(&qword_2549AD570, (uint64_t (*)(uint64_t))type metadata accessor for __PHPickerMode, (uint64_t)&unk_20D20A718);
}

void sub_20D1EC084(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x212BA0054](a3, v5), a1);
  }
  OUTLINED_FUNCTION_11();
}

void sub_20D1EC0C0()
{
  sub_20D1EC084(&qword_2549AD578, (uint64_t (*)(uint64_t))type metadata accessor for NSDirectionalRectEdge, (uint64_t)&unk_20D20A7C0);
}

void sub_20D1EC0EC()
{
  sub_20D1EC084(&qword_2549AD580, (uint64_t (*)(uint64_t))type metadata accessor for NSDirectionalRectEdge, (uint64_t)&unk_20D20A78C);
}

void sub_20D1EC118()
{
  sub_20D1EC084(&qword_2549AD588, (uint64_t (*)(uint64_t))type metadata accessor for NSDirectionalRectEdge, (uint64_t)&unk_20D20A7EC);
}

void sub_20D1EC144()
{
  sub_20D1EC084(&qword_2549AD590, (uint64_t (*)(uint64_t))type metadata accessor for NSDirectionalRectEdge, (uint64_t)&unk_20D20A828);
}

void sub_20D1EC170()
{
  sub_20D1EC084(&qword_2549AD598, (uint64_t (*)(uint64_t))type metadata accessor for PHPickerCapabilities, (uint64_t)&unk_20D20A964);
}

void sub_20D1EC19C()
{
  sub_20D1EC084(&qword_2549AD5A0, (uint64_t (*)(uint64_t))type metadata accessor for PHPickerCapabilities, (uint64_t)&unk_20D20A930);
}

void sub_20D1EC1C8()
{
  sub_20D1EC084(&qword_2549AD5A8, (uint64_t (*)(uint64_t))type metadata accessor for PHPickerCapabilities, (uint64_t)&unk_20D20A990);
}

void sub_20D1EC1F4()
{
  sub_20D1EC084(&qword_2549AD5B0, (uint64_t (*)(uint64_t))type metadata accessor for PHPickerCapabilities, (uint64_t)&unk_20D20A9CC);
}

void sub_20D1EC220()
{
  sub_20D1EC084(&qword_2549AD5B8, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerPrivateCapabilities, (uint64_t)&unk_20D20AB04);
}

void sub_20D1EC24C()
{
  sub_20D1EC084(&qword_2549AD5C0, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerPrivateCapabilities, (uint64_t)&unk_20D20AAD4);
}

void sub_20D1EC278()
{
  sub_20D1EC084(&qword_2549AD5C8, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerPrivateCapabilities, (uint64_t)&unk_20D20AB2C);
}

void sub_20D1EC2A4()
{
  sub_20D1EC084(&qword_2549AD5D0, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerPrivateCapabilities, (uint64_t)&unk_20D20AB64);
}

void sub_20D1EC2D0()
{
  sub_20D1EC084(&qword_2549AD5D8, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerCollectionType, (uint64_t)&unk_20D20AC94);
}

void sub_20D1EC2FC()
{
  sub_20D1EC084(&qword_2549AD5E0, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerCollectionType, (uint64_t)&unk_20D20AC64);
}

void sub_20D1EC328()
{
  sub_20D1EC084(&qword_2549AD5E8, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerCollectionType, (uint64_t)&unk_20D20ACBC);
}

void sub_20D1EC354()
{
  sub_20D1EC084(&qword_2549AD5F0, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerCollectionType, (uint64_t)&unk_20D20ACF4);
}

void sub_20D1EC380()
{
  sub_20D1EC084(&qword_2549AD5F8, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes, (uint64_t)"m\rB?@I");
}

void sub_20D1EC3AC()
{
  sub_20D1EC084(&qword_2549AD600, (uint64_t (*)(uint64_t))type metadata accessor for _PHPickerSourceType, (uint64_t)&unk_20D20A674);
}

uint64_t sub_20D1EC3D8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_20D1EC3FC(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_20D1EC458(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_11();
}

void sub_20D1EC48C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_61();
  v4(v3);
  OUTLINED_FUNCTION_11();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_20D1EC4D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_20D1EC51C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_11();
}

uint64_t sub_20D1EC554(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t *v0;

  return sub_20D1EA4E8(*v0);
}

uint64_t OUTLINED_FUNCTION_47()
{
  uint64_t v0;
  uint64_t v1;

  return sub_20D1EA3B8(v0, v1);
}

void OUTLINED_FUNCTION_48(__n128 a1)
{
  unint64_t v1;
  __n128 *v2;

  v2[15] = a1;
  v2[16] = a1;
  v2[17] = a1;
  v2[18] = a1;
  v2[19] = a1;
  v2[20].n128_u64[0] = 0;
  v2[1].n128_u64[1] = v1;
}

void OUTLINED_FUNCTION_49(uint64_t a1, uint64_t *a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_20D1EC51C((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return sub_20D206F80();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_20D206F80();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return type metadata accessor for _PHPickerOverlayStorage();
}

void OUTLINED_FUNCTION_54(uint64_t a1, unint64_t *a2)
{
  sub_20D1EC458(0, a2);
}

uint64_t OUTLINED_FUNCTION_55()
{
  return sub_20D206EFC();
}

_QWORD *OUTLINED_FUNCTION_56(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[1] + 128) + 24) = *result;
  return result;
}

_QWORD *OUTLINED_FUNCTION_57(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[1] + 128) + 16) = *result;
  return result;
}

uint64_t OUTLINED_FUNCTION_58()
{
  uint64_t v0;
  uint64_t v1;

  return sub_20D1EA3B8(v1, *(_QWORD *)(v0 + 152) + 240);
}

uint64_t OUTLINED_FUNCTION_59()
{
  uint64_t v0;
  uint64_t v1;

  return sub_20D1EA3B8(v1, *(_QWORD *)(v0 + 152) + 280);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_61()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t v0;

  return sub_20D1EA3B8(v0, *(_QWORD *)(v0 + 56) + 136);
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_20D206EFC();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_66(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  sub_20D1EC48C(a1, (uint64_t)va, a3);
}

void *OUTLINED_FUNCTION_67()
{
  return malloc(0xA0uLL);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_20D206ECC();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_20D206F74();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_20D206E84();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_20D206EFC();
}

uint64_t OUTLINED_FUNCTION_73(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_20D1EA3B8((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return sub_20D206EB4();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_76()
{
  return malloc(0x40uLL);
}

uint64_t OUTLINED_FUNCTION_77(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  *v2 = result;
  *(_QWORD *)(result + 152) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_78@<X0>(char a1@<W8>)
{
  return a1 & 1;
}

void OUTLINED_FUNCTION_79()
{
  type metadata accessor for _PHPickerSourceType(0);
}

uint64_t OUTLINED_FUNCTION_80()
{
  return sub_20D206F68();
}

uint64_t OUTLINED_FUNCTION_82()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 128) + 24);
}

uint64_t OUTLINED_FUNCTION_83(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(v1 + 128) + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_84(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(v1 + 128) + 24) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_85()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 128) + 16);
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_89(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_20D1EC51C(v2, a2);
}

id OUTLINED_FUNCTION_90(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

void OUTLINED_FUNCTION_91(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_20D1EC48C(a1, v3, a3);
}

id static PickerSuggestionAvailableClasses.all()()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_20D1EDCCC();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20D20AEA0;
  *(_QWORD *)(inited + 32) = type metadata accessor for PickerSuggestionAll();
  *(_QWORD *)(inited + 40) = type metadata accessor for PickerSearchBasedSuggestion();
  *(_QWORD *)(inited + 48) = type metadata accessor for PickerWallpaperSuggestion();
  *(_QWORD *)(inited + 56) = type metadata accessor for PickerAssetCollectionSuggestion();
  *(_QWORD *)(inited + 64) = type metadata accessor for PickerLivePhotoWithPossibleMotionEffectSuggestion();
  *(_QWORD *)(inited + 72) = type metadata accessor for PickerPanoramasSuggestion();
  *(_QWORD *)(inited + 80) = type metadata accessor for PickerSpatialSuggestion();
  *(_QWORD *)(inited + 88) = type metadata accessor for PickerGenerativeFeaturedSuggestion();
  v1 = type metadata accessor for PickerStyleablePhotoSuggestion();
  v2 = sub_20D1EDE28(1, 9, 1, inited);
  *(_QWORD *)(v2 + 16) = 9;
  *(_QWORD *)(v2 + 96) = v1;
  sub_20D1EC458(0, &qword_2549AD6B8);
  v3 = OUTLINED_FUNCTION_2_0();
  sub_20D1E6EF4(v3);
  swift_bridgeObjectRelease();
  return sub_20D1EC924();
}

id sub_20D1EC924()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_20D206E90();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

id PickerSuggestionAvailableClasses.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for PickerSuggestionAvailableClasses();
  return OUTLINED_FUNCTION_7_0((uint64_t)v8.super_class, sel_init, v1, v2, v3, v4, v5, v6, v8);
}

id PickerSuggestionAvailableClasses.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PickerSuggestionAvailableClasses();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PickerSuggestionAll.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PickerSuggestionAll.init()()
{
  return sub_20D1EDB80(&OBJC_IVAR___PUPickerSuggestionAll_shouldReverseSortOrder);
}

void PickerSuggestionAll.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerSuggestionAll.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerSuggestionAll.init(coder:)(void *a1)
{
  sub_20D1EDC18(a1, &OBJC_IVAR___PUPickerSuggestionAll_shouldReverseSortOrder);
}

unint64_t PickerSearchBasedSuggestion.Mode.init(rawValue:)(unint64_t result)
{
  if (result > 8)
    return 0;
  return result;
}

uint64_t sub_20D1ECB0C()
{
  _QWORD *v0;

  return sub_20D1E9F1C(*v0);
}

uint64_t sub_20D1ECB14(uint64_t a1)
{
  _QWORD *v1;

  return sub_20D1E9F60(a1, *v1);
}

unint64_t sub_20D1ECB1C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = PickerSearchBasedSuggestion.Mode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t PickerSearchBasedSuggestion.mode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

void PickerSearchBasedSuggestion.__allocating_init(mode:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  v0 = OUTLINED_FUNCTION_2_0();
  PickerSearchBasedSuggestion.init(mode:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerSearchBasedSuggestion.init(mode:)(uint64_t a1)
{
  sub_20D1ED520(a1, &OBJC_IVAR___PUPickerSearchBasedSuggestion_shouldReverseSortOrder, &OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

void PickerSearchBasedSuggestion.isEqual(_:)(uint64_t a1)
{
  sub_20D1ED59C(a1);
}

uint64_t sub_20D1ECBEC(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_20D206ECC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  sub_20D1EDF84((uint64_t)v10);
  return v8 & 1;
}

void PickerSearchBasedSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerSearchBasedSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

id PickerSearchBasedSuggestion.init(coder:)(void *a1)
{
  return sub_20D1ED67C(a1, &OBJC_IVAR___PUPickerSearchBasedSuggestion_shouldReverseSortOrder, (uint64_t (*)(id))PickerSearchBasedSuggestion.Mode.init(rawValue:), &OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

Swift::Void __swiftcall PickerSearchBasedSuggestion.encode(with:)(NSCoder with)
{
  sub_20D1ED78C(with.super.isa, &OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

void PickerSearchBasedSuggestion.init()()
{
  OUTLINED_FUNCTION_11_0();
  __break(1u);
}

void PickerAssetCollectionSuggestion.localIdentifier.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
}

uint64_t PickerAssetCollectionSuggestion.extendedCuratedAssetsOnly.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly);
}

uint64_t PickerAssetCollectionSuggestion.shouldReverseSortOrder.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder);
}

id PickerAssetCollectionSuggestion.__allocating_init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return PickerAssetCollectionSuggestion.init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)(a1, a2, a3, a4);
}

id PickerAssetCollectionSuggestion.init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  _BYTE *v4;
  objc_class *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v9 = (objc_class *)OUTLINED_FUNCTION_3_0();
  v10 = &v4[OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier];
  *v10 = a1;
  v10[1] = a2;
  v4[OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly] = a3;
  v4[OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder] = a4;
  v18.receiver = v4;
  v18.super_class = v9;
  return OUTLINED_FUNCTION_7_0((uint64_t)v9, sel_init, v11, v12, v13, v14, v15, v16, v18);
}

void PickerAssetCollectionSuggestion.isEqual(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_13_0(v1, v2);
  if (v7)
  {
    if ((OUTLINED_FUNCTION_9_0() & 1) != 0)
    {
      if (*(_QWORD *)(v0 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier) != *(_QWORD *)&v6[OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier]
        || *(_QWORD *)(v0 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier + 8) != *(_QWORD *)&v6[OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier + 8])
      {
        sub_20D206F5C();
      }

    }
  }
  else
  {
    OUTLINED_FUNCTION_17_0(v3, v4);
  }
  OUTLINED_FUNCTION_8_0();
}

uint64_t static PickerAssetCollectionSuggestion.supportsSecureCoding.getter()
{
  OUTLINED_FUNCTION_88();
  return byte_2549AD6B0;
}

uint64_t static PickerAssetCollectionSuggestion.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_88();
  byte_2549AD6B0 = a1;
  return result;
}

void static PickerAssetCollectionSuggestion.supportsSecureCoding.modify()
{
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_11();
}

void PickerAssetCollectionSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerAssetCollectionSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

uint64_t PickerAssetCollectionSuggestion.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = v1;
  swift_getObjectType();
  sub_20D1EC458(0, &qword_2549AD6F8);
  v4 = v2;
  v5 = sub_20D206EA8();
  if (v5)
  {
    v6 = (void *)v5;
    sub_20D206E6C();

  }
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall PickerAssetCollectionSuggestion.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)sub_20D206E60();
  v4 = (void *)sub_20D206E60();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  v5 = *(unsigned __int8 *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly);
  v6 = (void *)OUTLINED_FUNCTION_6_0();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v5, v6);

  v7 = *(unsigned __int8 *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder);
  v8 = (id)OUTLINED_FUNCTION_6_0();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v7, v8);

}

void PickerAssetCollectionSuggestion.init()()
{
  OUTLINED_FUNCTION_11_0();
  __break(1u);
}

unint64_t PickerWallpaperSuggestion.Mode.init(rawValue:)(unint64_t result)
{
  if (result > 0xD)
    return 0;
  return result;
}

unint64_t sub_20D1ED48C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = PickerWallpaperSuggestion.Mode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t PickerWallpaperSuggestion.mode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

void PickerWallpaperSuggestion.__allocating_init(mode:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  v0 = OUTLINED_FUNCTION_2_0();
  PickerWallpaperSuggestion.init(mode:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerWallpaperSuggestion.init(mode:)(uint64_t a1)
{
  sub_20D1ED520(a1, &OBJC_IVAR___PUPickerWallpaperSuggestion_shouldReverseSortOrder, &OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

void sub_20D1ED520(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _BYTE *v3;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v7 = (objc_class *)OUTLINED_FUNCTION_3_0();
  v3[*a2] = 0;
  *(_QWORD *)&v3[*a3] = a1;
  v14.receiver = v3;
  v14.super_class = v7;
  OUTLINED_FUNCTION_7_0((uint64_t)v7, sel_init, v8, v9, v10, v11, v12, v13, v14);
  OUTLINED_FUNCTION_12();
}

void PickerWallpaperSuggestion.isEqual(_:)(uint64_t a1)
{
  sub_20D1ED59C(a1);
}

void sub_20D1ED59C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BYTE v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_3_0();
  v2 = sub_20D1EDF3C(a1, (uint64_t)v5);
  if (v6)
  {
    if ((swift_dynamicCast() & 1) != 0)

  }
  else
  {
    OUTLINED_FUNCTION_17_0(v2, v3);
  }
  OUTLINED_FUNCTION_8_0();
}

void PickerWallpaperSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerWallpaperSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

id PickerWallpaperSuggestion.init(coder:)(void *a1)
{
  return sub_20D1ED67C(a1, &OBJC_IVAR___PUPickerWallpaperSuggestion_shouldReverseSortOrder, (uint64_t (*)(id))PickerWallpaperSuggestion.Mode.init(rawValue:), &OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

id sub_20D1ED67C(void *a1, _QWORD *a2, uint64_t (*a3)(id), _QWORD *a4)
{
  _BYTE *v4;
  _BYTE *v8;
  objc_class *v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  objc_super v25;

  v8 = v4;
  v10 = (objc_class *)OUTLINED_FUNCTION_3_0();
  v8[*a2] = 0;
  v11 = v8;
  v12 = (void *)OUTLINED_FUNCTION_10_0();
  v13 = objc_msgSend(a1, sel_decodeIntegerForKey_, v12);

  v14 = a3(v13);
  if ((v15 & 1) != 0)
  {

    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    *(_QWORD *)&v11[*a4] = v14;

    v25.receiver = v11;
    v25.super_class = v10;
    v23 = OUTLINED_FUNCTION_7_0(v16, sel_init, v17, v18, v19, v20, v21, v22, v25);

  }
  return v23;
}

Swift::Void __swiftcall PickerWallpaperSuggestion.encode(with:)(NSCoder with)
{
  sub_20D1ED78C(with.super.isa, &OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

void sub_20D1ED78C(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(v2 + *a2);
  v5 = (id)OUTLINED_FUNCTION_10_0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v4, v5);

}

void PickerWallpaperSuggestion.init()()
{
  OUTLINED_FUNCTION_11_0();
  __break(1u);
}

id PickerLivePhotoWithPossibleMotionEffectSuggestion.init()()
{
  return sub_20D1EDB80(&OBJC_IVAR___PUPickerLivePhotoWithPossibleMotionEffectSuggestion_shouldReverseSortOrder);
}

void PickerLivePhotoWithPossibleMotionEffectSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerLivePhotoWithPossibleMotionEffectSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerLivePhotoWithPossibleMotionEffectSuggestion.init(coder:)(void *a1)
{
  sub_20D1EDC18(a1, &OBJC_IVAR___PUPickerLivePhotoWithPossibleMotionEffectSuggestion_shouldReverseSortOrder);
}

id PickerStyleablePhotoSuggestion.init()()
{
  return sub_20D1EDB80(&OBJC_IVAR___PUPickerStyleablePhotoSuggestion_shouldReverseSortOrder);
}

void PickerStyleablePhotoSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerStyleablePhotoSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerStyleablePhotoSuggestion.init(coder:)(void *a1)
{
  sub_20D1EDC18(a1, &OBJC_IVAR___PUPickerStyleablePhotoSuggestion_shouldReverseSortOrder);
}

id PickerPanoramasSuggestion.init()()
{
  return sub_20D1EDB80(&OBJC_IVAR___PUPickerPanoramasSuggestion_shouldReverseSortOrder);
}

void PickerPanoramasSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerPanoramasSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerPanoramasSuggestion.init(coder:)(void *a1)
{
  sub_20D1EDC18(a1, &OBJC_IVAR___PUPickerPanoramasSuggestion_shouldReverseSortOrder);
}

id PickerSpatialSuggestion.init()()
{
  return sub_20D1EDB80(&OBJC_IVAR___PUPickerSpatialSuggestion_shouldReverseSortOrder);
}

void _s8PhotosUI19PickerSuggestionAllC7isEqualySbypSgF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_3_0();
  v2 = OUTLINED_FUNCTION_13_0(v0, v1);
  if (!v6)
  {
    OUTLINED_FUNCTION_17_0(v2, v3);
    goto LABEL_5;
  }
  if (!OUTLINED_FUNCTION_9_0())
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = v5;
LABEL_6:

  OUTLINED_FUNCTION_8_0();
}

void PickerSpatialSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerSpatialSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerSpatialSuggestion.init(coder:)(void *a1)
{
  sub_20D1EDC18(a1, &OBJC_IVAR___PUPickerSpatialSuggestion_shouldReverseSortOrder);
}

id PickerGenerativeFeaturedSuggestion.init()()
{
  return sub_20D1EDB80(&OBJC_IVAR___PUPickerGenerativeFeaturedSuggestion_shouldReverseSortOrder);
}

id sub_20D1EDB80(_QWORD *a1)
{
  _BYTE *v1;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  v1[*a1] = 0;
  v11.receiver = v1;
  v11.super_class = v3;
  return OUTLINED_FUNCTION_7_0((uint64_t)v3, sel_init, v4, v5, v6, v7, v8, v9, v11);
}

void PickerGenerativeFeaturedSuggestion.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_0_0();
  v0 = (void *)OUTLINED_FUNCTION_2_0();
  PickerGenerativeFeaturedSuggestion.init(coder:)(v0);
  OUTLINED_FUNCTION_11();
}

void PickerGenerativeFeaturedSuggestion.init(coder:)(void *a1)
{
  sub_20D1EDC18(a1, &OBJC_IVAR___PUPickerGenerativeFeaturedSuggestion_shouldReverseSortOrder);
}

void sub_20D1EDC18(void *a1, _QWORD *a2)
{
  _BYTE *v2;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  v2[*a2] = 0;
  v12.receiver = v2;
  v12.super_class = v5;
  OUTLINED_FUNCTION_7_0((uint64_t)v5, sel_init, v6, v7, v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_12();
}

id _s8PhotosUI19PickerSuggestionAllCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_3_0();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20D1EDCCC()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD618);
  if (dynamic_cast_existential_0_class_conditional(v0))
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD948);
  else
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD940);
}

uint64_t type metadata accessor for PickerSuggestionAll()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerSearchBasedSuggestion()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerWallpaperSuggestion()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerAssetCollectionSuggestion()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerLivePhotoWithPossibleMotionEffectSuggestion()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerPanoramasSuggestion()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerSpatialSuggestion()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerGenerativeFeaturedSuggestion()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PickerStyleablePhotoSuggestion()
{
  return objc_opt_self();
}

uint64_t sub_20D1EDE28(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_20D1EDCCC();
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    sub_20D1EAA44((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v10 + 32), (const void *)(a4 + 32), 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t type metadata accessor for PickerSuggestionAvailableClasses()
{
  return objc_opt_self();
}

uint64_t sub_20D1EDF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D1EDF84(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549AD6C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20D1EDFC8()
{
  unint64_t result;

  result = qword_2549AD738;
  if (!qword_2549AD738)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PickerSearchBasedSuggestion.Mode, &type metadata for PickerSearchBasedSuggestion.Mode);
    atomic_store(result, (unint64_t *)&qword_2549AD738);
  }
  return result;
}

unint64_t sub_20D1EE008()
{
  unint64_t result;

  result = qword_2549AD740;
  if (!qword_2549AD740)
  {
    result = MEMORY[0x212BA0054](&protocol conformance descriptor for PickerWallpaperSuggestion.Mode, &type metadata for PickerWallpaperSuggestion.Mode);
    atomic_store(result, (unint64_t *)&qword_2549AD740);
  }
  return result;
}

uint64_t method lookup function for PickerSuggestionAll()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PickerSuggestionAll.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for PickerSearchBasedSuggestion()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for PickerSearchBasedSuggestion.Mode()
{
  return &type metadata for PickerSearchBasedSuggestion.Mode;
}

uint64_t method lookup function for PickerAssetCollectionSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PickerAssetCollectionSuggestion.__allocating_init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PickerAssetCollectionSuggestion.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for PickerWallpaperSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PickerWallpaperSuggestion.__allocating_init(mode:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PickerWallpaperSuggestion.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for PickerWallpaperSuggestion.Mode()
{
  return &type metadata for PickerWallpaperSuggestion.Mode;
}

uint64_t method lookup function for PickerLivePhotoWithPossibleMotionEffectSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for PickerStyleablePhotoSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for PickerPanoramasSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for PickerSpatialSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for PickerGenerativeFeaturedSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType())
    return a1;
  else
    return 0;
}

uint64_t sub_20D1EE178()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t PUPickerFilterAvailableClasses()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
}

void sub_20D1F1EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PUPhotosAssetViewShowDebugOverlayView()
{
  uint64_t result;
  int AppBooleanValue;
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  result = MEMORY[0x212B9FA78]();
  if ((_DWORD)result)
  {
    CFPreferencesAppSynchronize(CFSTR("-g"));
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnablePhotosAssetDebugOverlay"), CFSTR("-g"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v2 = AppBooleanValue == 0;
    else
      v2 = 1;
    return !v2;
  }
  return result;
}

void sub_20D1F5EBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D1F86E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_20D1F8950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D1F8BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D1F9040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D1FA8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D1FC2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D1FD348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  uint64_t v54;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose((const void *)(v54 - 248), 8);
  _Block_object_dispose((const void *)(v54 - 200), 8);
  _Block_object_dispose((const void *)(v54 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20D2045B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D2046F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D204D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *a14, id *a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak((id *)(v26 - 112));
  _Unwind_Resume(a1);
}

void sub_20D206138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_20D206E30()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_20D206E3C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20D206E48()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_20D206E54()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20D206E60()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D206E6C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20D206E78()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D206E84()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D206E90()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20D206E9C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20D206EA8()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_20D206EB4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_20D206EC0()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_20D206ECC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_20D206ED8()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_20D206EE4()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_20D206EF0()
{
  return MEMORY[0x24BEE23B8]();
}

uint64_t sub_20D206EFC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_20D206F08()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20D206F14()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_20D206F20()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_20D206F2C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_20D206F38()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_20D206F44()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_20D206F50()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20D206F5C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D206F68()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D206F74()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20D206F80()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_20D206F8C()
{
  return MEMORY[0x24BEE4328]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x24BDD91A0](isrc);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

uint64_t DCIM_newPLImageWithData()
{
  return MEMORY[0x24BE72230]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x24BE72488]();
}

uint64_t PFExists()
{
  return MEMORY[0x24BE71B90]();
}

uint64_t PFMap()
{
  return MEMORY[0x24BE71BB8]();
}

uint64_t PFPosterEnableSettlingEffect()
{
  return MEMORY[0x24BE724B0]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x24BE71C10]();
}

uint64_t PLBackendGetLog()
{
  return MEMORY[0x24BE72280]();
}

uint64_t PLDispatchOnMainQueue()
{
  return MEMORY[0x24BE720A8]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x24BE72288]();
}

uint64_t PLHasInternalUI()
{
  return MEMORY[0x24BE72290]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x24BE722A8]();
}

uint64_t PLLivePhotoPlaybackGetLog()
{
  return MEMORY[0x24BE722C8]();
}

uint64_t PLPhotoLibraryFrameworkBundle()
{
  return MEMORY[0x24BE722F0]();
}

uint64_t PLPhotoPickerGetLog()
{
  return MEMORY[0x24BE722F8]();
}

uint64_t PLPickerGetLog()
{
  return MEMORY[0x24BE72318]();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return MEMORY[0x24BE72348]();
}

uint64_t PLStickerSuggestionConfidenceThreshold()
{
  return MEMORY[0x24BE721E8]();
}

uint64_t PLUIGetLog()
{
  return MEMORY[0x24BE72350]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x24BE71C30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x24BDAE0E0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

