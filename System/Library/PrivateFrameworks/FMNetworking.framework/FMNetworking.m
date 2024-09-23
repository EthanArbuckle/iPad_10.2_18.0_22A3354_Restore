uint64_t destroy for AnyDecodableKeys()
{
  return swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for AnyDecodableKeys(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyDecodableKeys(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1B6995710@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 24) = 1;
  return result;
}

uint64_t getEnumTagSinglePayload for FMNServerInteractionController.FMNResponseFields()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for FMNServerInteractionController.FMNResponseFields()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for FMNRedirectHostStore(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FMNRedirectHostStore(uint64_t result, int a2, int a3)
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

uint64_t sub_1B69957D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69C9FF0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for FMNAuthenticationProvider()
{
  return objc_opt_self();
}

void sub_1B6995870(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1B69CA3F8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1B69958BC()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B69CA1AC();
  if (v0 <= 0x3F)
  {
    sub_1B6995870(319, qword_1ED52FF90, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t type metadata accessor for FMNServerInteractionController()
{
  return objc_opt_self();
}

uint64_t sub_1B6995984()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69CA068();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B6995A18()
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

uint64_t sub_1B6995ABC(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 56) = v2;
  return result;
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroy_2Tm_0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1B69CA068();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t FMNHTTPRequest.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B6995C34(v0 + 16);
  v1 = v0 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  v2 = sub_1B69C9FF0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_1B6995C34(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FCD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA30);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B699ED24();
  sub_1B69CA53C();
  if (!v1)
  {
    v0 = sub_1B699DE88();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v0;
}

uint64_t objectdestroy_40Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t FMNHTTPRequest.init(hostName:scheme:path:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v12 = a6;
  v7 = sub_1B69C9FF0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v6 + 48) = 0;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_BYTE *)(v6 + 56) = 14;
  sub_1B69C9FE4();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v6 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents, v10, v7);
  swift_beginAccess();
  sub_1B69C9FD8();
  sub_1B69C9FB4();
  sub_1B69C9FCC();
  swift_endAccess();
  return v6;
}

_QWORD *FMNAuthenticationProvider.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v1 = v0;
  v2 = sub_1B69CA398();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v2);
  v4 = sub_1B69CA158();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1B69CA3A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[2] = 1;
  sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DEF8D8], v5);
  sub_1B69CA14C();
  v15[1] = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED530450, v3, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED530430);
  sub_1B699AF04((unint64_t *)&qword_1ED530440, (uint64_t *)&unk_1ED530430);
  sub_1B69CA434();
  v0[3] = sub_1B69CA3C8();
  v9 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v10 = objc_msgSend(v9, sel_bundleIdentifier);

  if (v10)
  {
    v11 = sub_1B69CA248();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v1[4] = v11;
  v1[5] = v13;
  v1[6] = 0;
  v1[7] = 0;
  sub_1B69CA374();
  if (qword_1ED530478 != -1)
    swift_once();
  sub_1B69CA11C();
  return v1;
}

uint64_t sub_1B6996294(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void (*v7)(void *, unint64_t, void *, void *);
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v8 = v6;
    v6 = (void *)sub_1B69CA0B0();
    v10 = v9;

  }
  else
  {
    swift_retain();
    v10 = 0xF000000000000000;
  }
  v11 = a3;
  v12 = a4;
  v7(v6, v10, a3, a4);

  sub_1B699FF80((uint64_t)v6, v10);
  return swift_release();
}

uint64_t sub_1B6996344(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v4;

  return sub_1B699B078(a1, a2, a3, a4, *(void (**)(uint64_t *))(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t sub_1B6996370(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1B6996390()
{
  uint64_t v0;

  return sub_1B69963B8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1B6996398()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B69963B8(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1B69963D8()
{
  uint64_t v0;

  sub_1B69963E4((_QWORD *)(v0 + 16), *(uint64_t **)(v0 + 72));
}

void sub_1B69963E4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_1B699650C(&v13);
  v4 = v14;
  if (v14)
  {
    v5 = v13;
    v6 = v15;
    v7 = v16;
    v8 = a1[4];
    v9 = a1[5];
    __swift_project_boxed_opaque_existential_1(a1 + 1, v8);
    if (v6 == (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9) && v7 == v10)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = sub_1B69CA68C();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        sub_1B69B41C0(v5, v4);
        return;
      }
    }
    swift_bridgeObjectRetain();
    sub_1B69B41C0(v5, v4);
    *a2 = v5;
    a2[1] = v4;
    swift_bridgeObjectRelease();
  }
}

void sub_1B699650C(_QWORD *a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v3 = (void *)sub_1B69CA23C();
  v4 = objc_msgSend(v2, sel_dataForKey_, v3);

  if (v4)
  {
    v5 = sub_1B69CA0B0();
    v7 = v6;

    sub_1B69B41F0();
    sub_1B69C9F30();
    sub_1B699DB18(v5, v7);
    *a1 = v8;
    a1[1] = v9;
    a1[2] = v10;
    a1[3] = v11;
  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }
}

uint64_t sub_1B6996644()
{
  uint64_t v0;

  return sub_1B6996650(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1B6996650(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  unint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (uint64_t *)(a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers);
  swift_beginAccess();
  v6 = *v5;
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
  if (!v7)
    goto LABEL_5;
  v8 = sub_1B699739C(a3);
  if ((v9 & 1) == 0)
  {
    v7 = 0;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v10 = v8;
  v11 = *(_QWORD *)(v6 + 56);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = *(_OWORD *)(v11 + 16 * v10);
  swift_retain();
  v7 = sub_1B69BBBA4;
LABEL_6:
  v13 = *a1;
  *a1 = (uint64_t)v7;
  a1[1] = v12;
  return sub_1B6996708(v13);
}

uint64_t sub_1B6996708(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v0;
  void *v1;

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 88);
  if (*(_QWORD *)(v0 + 152))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 128);
  v1 = *(void **)(v0 + 168);
  if (v1)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 176);
    swift_release();
  }
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1B6996790(uint64_t a1@<X8>)
{
  sub_1B69967A4(a1);
}

void sub_1B69967A4(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1B69967BC(*(_QWORD *)(v1 + 16), a1);
}

void sub_1B69967BC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v5[40];
  __int128 v6;
  uint64_t v7;

  v4 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session;
  swift_beginAccess();
  sub_1B699D610(v4, (uint64_t)&v6, &qword_1ED52FC28);
  if (v7)
  {
    sub_1B69970A0(&v6, a2);
  }
  else
  {
    sub_1B6999FB0((uint64_t)&v6, &qword_1ED52FC28);
    sub_1B69968F8();
    if (!v2)
    {
      sub_1B69968B4((uint64_t)&v6, a2);
      sub_1B69968B4((uint64_t)&v6, (uint64_t)v5);
      swift_beginAccess();
      sub_1B699B7E0((uint64_t)v5, v4, &qword_1ED52FC28);
      swift_endAccess();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
    }
  }
}

uint64_t sub_1B69968B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1B69968F8()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v2 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v3 = objc_msgSend(v2, sel_bundleIdentifier);

  if (v3)
  {
    sub_1B69CA248();

  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
  }
  v4 = objc_allocWithZone(MEMORY[0x1E0D00140]);
  v5 = (void *)sub_1B69CA23C();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithIdentifier_, v5);

  objc_msgSend(v1, sel_set_appleIDContext_, v6);
  objc_msgSend(v1, sel_setURLCache_, 0);
  objc_msgSend(v1, sel_setRequestCachePolicy_, 1);
  objc_msgSend(v1, sel_setHTTPCookieStorage_, 0);
  objc_msgSend(v1, sel_setHTTPCookieAcceptPolicy_, 1);
  objc_msgSend(v1, sel_setURLCredentialStorage_, 0);
  (*(void (**)(id, uint64_t))(**(_QWORD **)(v0
                                                    + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_urlSessionFactory)
                                      + 104))(v1, v0);

}

uint64_t sub_1B6996ADC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void (*v41)(__int128 *__return_ptr, char *);
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  char *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56[2];
  char *v57;

  v53 = (_QWORD *)a3;
  v51 = a1;
  v52 = a2;
  v4 = sub_1B69CA068();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v57 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v49 = (char *)v48 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v48 - v13;
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  *(_QWORD *)&v54 = v4;
  v15((char *)v48 - v13, 1, 1, v4);
  v16 = v3[5];
  v55 = v5;
  v50 = v3;
  if (v16
    && (v48[3] = v3[4],
        v18 = v3[6],
        v17 = v3[7],
        v19 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance),
        v20 = objc_msgSend(v19, sel_isInternalBuild),
        v19,
        v5 = v55,
        v20))
  {
    v48[1] = v17;
    v48[2] = v18;
    v21 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
    swift_bridgeObjectRetain();
    v22 = (void *)sub_1B69CA23C();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v21, sel_initWithSuiteName_, v22);

    if (v23)
    {
      v24 = (void *)sub_1B69CA23C();
      v25 = objc_msgSend(v23, sel_BOOLForKey_, v24);

      if (v25)
      {
        v26 = v49;
        sub_1B69CA02C();
        sub_1B6997028((uint64_t)v14);
        v5 = v55;
        v27 = v54;
        (*(void (**)(char *, char *, _QWORD))(v55 + 32))(v14, v26, v54);
        v28 = 0;
        goto LABEL_9;
      }
    }
    sub_1B6997028((uint64_t)v14);
    v28 = 1;
    v5 = v55;
  }
  else
  {
    sub_1B6997028((uint64_t)v14);
    v28 = 1;
  }
  v27 = v54;
LABEL_9:
  v15(v14, v28, 1, v27);
  sub_1B69970B8((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v27) == 1)
  {
    sub_1B6997028((uint64_t)v12);
    v29 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_delegate_delegateQueue_, v51, v52, 0);
    v30 = sub_1B6997068(0, &qword_1ED52FEF8);
    v31 = v53;
    v53[3] = v30;
    v31[4] = &protocol witness table for NSURLSession;
    *v31 = v29;
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    v32 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();

    return sub_1B6997028((uint64_t)v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v57, v12, v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v34 = swift_allocObject();
    v54 = xmmword_1B69CADE0;
    *(_OWORD *)(v34 + 16) = xmmword_1B69CADE0;
    v35 = sub_1B69CA020();
    v37 = v36;
    v38 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v34 + 56) = MEMORY[0x1E0DEA968];
    v39 = sub_1B699F398();
    *(_QWORD *)(v34 + 64) = v39;
    *(_QWORD *)(v34 + 32) = v35;
    *(_QWORD *)(v34 + 40) = v37;
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    v40 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();
    swift_bridgeObjectRelease();

    v41 = (void (*)(__int128 *__return_ptr, char *))v50[2];
    if (v41)
    {
      v42 = v57;
      v41(v56, v57);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v42, v27);
      sub_1B6997028((uint64_t)v14);
      return sub_1B69970A0(v56, (uint64_t)v53);
    }
    else
    {
      v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = v54;
      v44 = v57;
      v45 = sub_1B69CA020();
      *(_QWORD *)(v43 + 56) = v38;
      *(_QWORD *)(v43 + 64) = v39;
      *(_QWORD *)(v43 + 32) = v45;
      *(_QWORD *)(v43 + 40) = v46;
      v47 = (void *)sub_1B69CA3E0();
      sub_1B69CA374();
      sub_1B69CA110();
      swift_bridgeObjectRelease();

      sub_1B69B44A4();
      swift_allocError();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v44, v27);
      return sub_1B6997028((uint64_t)v14);
    }
  }
}

uint64_t sub_1B6997028(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B6997068(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B69970A0(__int128 *a1, uint64_t a2)
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

uint64_t sub_1B69970B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AnyDecodableKeys(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1B6997130(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1B699715C()
{
  uint64_t *v0;

  sub_1B6997168(v0[2], v0[3], v0[4], v0[5]);
}

void sub_1B6997168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x1BCC9ACC8](v7);
  if (v8)
  {
    v9 = (char *)v8;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a3;
    *(_QWORD *)(v10 + 24) = a4;
    v11 = &v9[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers];
    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *(_QWORD *)v11;
    *(_QWORD *)v11 = 0x8000000000000000;
    sub_1B6997260((uint64_t)sub_1B69BBCE8, v10, a2, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)v11 = v13;
    swift_bridgeObjectRelease();
    swift_endAccess();

  }
}

uint64_t sub_1B6997260(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1B699739C(a3);
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
    result = (uint64_t)sub_1B69A50B4();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_release();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B6997468(result, a4 & 1);
  result = sub_1B699739C(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B69CA71C();
  __break(1u);
  return result;
}

unint64_t sub_1B699739C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B69CA764();
  return sub_1B69973CC(a1, v2);
}

unint64_t sub_1B69973CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1B6997468(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  __int128 v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF10);
  result = sub_1B69CA50C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v29 = -1 << v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v30 = 1 << *(_BYTE *)(v5 + 32);
    v31 = v3;
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v13)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v13)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v13)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v31;
                goto LABEL_40;
              }
              if (v30 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v29;
              v3 = v31;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v13)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v20);
      v32 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v20);
      if ((a2 & 1) == 0)
        swift_retain();
      result = sub_1B69CA764();
      v15 = -1 << *(_BYTE *)(v7 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v17 == v25;
          if (v17 == v25)
            v17 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v14 + 8 * v17);
        }
        while (v27 == -1);
        v18 = __clz(__rbit64(~v27)) + (v17 << 6);
      }
      *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v28;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v18) = v32;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_1B699771C()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  v1 = *(void (**)(uint64_t, _QWORD))(v0 + 16);
  v2 = swift_retain();
  v1(v2, 0);
  return swift_release();
}

void sub_1B6997760(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_1B69A033C(a1, a2, *(unsigned __int8 *)(v2 + 16), *(NSObject **)(v2 + 24), *(_QWORD *)(v2 + 32));
}

void sub_1B699776C()
{
  uint64_t v0;

  sub_1B699777C(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t, void *))(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

void sub_1B699777C(uint64_t a1, void (*a2)(uint64_t, void *), uint64_t a3, char a4)
{
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  void *v24;
  _BYTE *v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char v42;
  char v43;

  v8 = (void *)sub_1B6999738();
  v41 = objc_msgSend(v8, sel_aa_primaryAppleAccount);

  if (!v41)
  {
    sub_1B69CA374();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    sub_1B69AD21C();
    v22 = swift_allocError();
    *v23 = 0;
    a2(0, (void *)v22);
    goto LABEL_30;
  }
  v9 = objc_msgSend(v41, sel_aa_personID);
  if (!v9)
  {
    sub_1B69CA374();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    sub_1B69AD21C();
    v24 = (void *)swift_allocError();
    *v25 = 1;
    a2(0, v24);

    goto LABEL_22;
  }
  v10 = v9;
  v39 = sub_1B69CA248();
  v12 = v11;

  v43 = a4;
  sub_1B6997D64((uint64_t)v41, (uint64_t)&v43);
  v40 = v13;
  v15 = v14;
  v38 = v16;
  v18 = v17;
  v19 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v20 = objc_msgSend(v19, sel_isInternalBuild);

  if (v20)
  {
    if (FMNAccountType.rawValue.getter() == 1885957478 && v21 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = sub_1B69CA68C();
      swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
        goto LABEL_19;
    }
    v27 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
    v28 = (void *)sub_1B69CA23C();
    v29 = objc_msgSend(v27, sel_initWithSuiteName_, v28);

    if (v29)
    {
      v30 = (void *)sub_1B69CA23C();
      v31 = objc_msgSend(v29, sel_stringForKey_, v30);

      if (v31)
      {
        swift_bridgeObjectRelease();
        v40 = sub_1B69CA248();
        v15 = v32;

        sub_1B69CA374();
        if (qword_1ED530478 != -1)
          swift_once();
        sub_1B69CA11C();
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  if (v15)
  {
LABEL_20:
    if (v18)
    {
      type metadata accessor for FMNAuthenticationCredential();
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = v40;
      *(_QWORD *)(v33 + 24) = v15;
      *(_QWORD *)(v33 + 32) = v39;
      *(_QWORD *)(v33 + 40) = v12;
      *(_QWORD *)(v33 + 48) = v38;
      *(_QWORD *)(v33 + 56) = v18;
      *(_BYTE *)(v33 + 64) = a4;
      *(_QWORD *)(a1 + 56) = v33;
      swift_retain_n();
      swift_release();
      a2(v33, 0);
      swift_release_n();
LABEL_22:
      v34 = v41;
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B69CA374();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    sub_1B69AD21C();
    v22 = swift_allocError();
    *v37 = 2;
    a2(0, (void *)v22);

LABEL_30:
    v34 = (void *)v22;
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B69CA374();
  if (qword_1ED530478 != -1)
    swift_once();
  sub_1B69CA11C();
  v42 = a4;
  sub_1B69AD21C();
  v35 = (void *)swift_allocError();
  *v36 = 4;
  swift_retain();
  sub_1B69AD260(v41, &v42, v35, a1, a2, a3);
  swift_release();

  v34 = v35;
LABEL_23:

}

void sub_1B6997D64(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[18];

  v21[7] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  v4 = MEMORY[0x1E0C80A78](v3);
  v21[3] = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v21[2] = (char *)v21 - v7;
  v8 = MEMORY[0x1E0C80A78](v6);
  v21[1] = (char *)v21 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v21[0] = (char *)v21 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v13 = MEMORY[0x1E0C80A78](v12);
  MEMORY[0x1E0C80A78](v13);
  v14 = sub_1B69CA068();
  v21[5] = *(_QWORD *)(v14 - 8);
  v21[6] = v14;
  v15 = MEMORY[0x1E0C80A78](v14);
  v16 = MEMORY[0x1E0C80A78](v15);
  v17 = MEMORY[0x1E0C80A78](v16);
  v18 = MEMORY[0x1E0C80A78](v17);
  v19 = MEMORY[0x1E0C80A78](v18);
  v20 = MEMORY[0x1E0C80A78](v19);
  MEMORY[0x1E0C80A78](v20);
  __asm { BR              X9 }
}

uint64_t sub_1B6997F8C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend(*(id *)(v3 - 168), sel_credential);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_credentialItemForKey_, *MEMORY[0x1E0C8F268]);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1B69CA248();

    }
    else
    {
      v8 = 0;
    }
    type metadata accessor for FMNAuthenticationProvider();
    *(_BYTE *)(v3 - 112) = v2;
    static FMNAuthenticationProvider.configurationURL(accountType:)((_BYTE *)(v3 - 112), v1);
    v11 = *(_QWORD *)(v3 - 184);
    v10 = *(_QWORD *)(v3 - 176);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v1, 1, v10) == 1)
    {
      sub_1B6999FB0(v1, (uint64_t *)&unk_1ED52FC08);
      sub_1B69CA368();
      if (qword_1ED530478 != -1)
        swift_once();
      sub_1B69CA11C();

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v0, v1, v10);
      sub_1B69CA050();

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v10);
    }
    return v8;
  }
  else
  {
    sub_1B69CA368();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    return 0;
  }
}

uint64_t sub_1B69996F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B6999738()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t result;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = *(id *)(v0 + 48);
LABEL_5:
    v5 = v1;
    return (uint64_t)v2;
  }
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (v3)
  {
    v4 = *(void **)(v0 + 48);
    *(_QWORD *)(v0 + 48) = v3;
    v2 = v3;

    v1 = 0;
    goto LABEL_5;
  }
  result = sub_1B69CA4F4();
  __break(1u);
  return result;
}

void sub_1B6999800()
{
  uint64_t v0;

  sub_1B6999808((_QWORD *)(v0 + 16));
}

void sub_1B6999808(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1B699650C(&v14);
  v2 = v15;
  if (v15)
  {
    v3 = v14;
    v4 = v16;
    v5 = v17;
    v6 = a1[4];
    v7 = a1[5];
    __swift_project_boxed_opaque_existential_1(a1 + 1, v6);
    if (v4 == (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7) && v5 == v8)
    {
      sub_1B69B41C0(v3, v2);
      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = sub_1B69CA68C();
      sub_1B69B41C0(v3, v2);
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
        v11 = (void *)sub_1B69CA3E0();
        sub_1B69CA374();
        sub_1B69CA110();

        v12 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
        v13 = (id)sub_1B69CA23C();
        objc_msgSend(v12, sel_removeObjectForKey_, v13);

      }
    }
  }
}

uint64_t sub_1B69999D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_1B6999A00(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD))
{
  return a2(1, 0);
}

uint64_t sub_1B6999A2C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1B6999A40()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B6999A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  _QWORD *v11;
  _BYTE v13[40];
  _BYTE v14[40];
  _BYTE v15[40];
  _BYTE v16[40];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a5;
  *(_QWORD *)(v10 + 24) = a6;
  sub_1B69968B4(a1, (uint64_t)v15);
  sub_1B69968B4(a2, (uint64_t)v16);
  sub_1B69968B4((uint64_t)v15, (uint64_t)v13);
  sub_1B69968B4((uint64_t)v16, (uint64_t)v14);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = sub_1B699CEEC;
  v11[3] = v10;
  swift_retain();
  swift_retain();
  sub_1B6999B8C((uint64_t)v13, (uint64_t)v14, sub_1B699CEE0, v11, 0, 0);
  swift_release();
  sub_1B6999FB0((uint64_t)v15, &qword_1ED52FCE0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  return swift_release();
}

uint64_t sub_1B6999B8C(uint64_t a1, uint64_t a2, _QWORD *a3, const void *a4, uint64_t a5, NSObject *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  const void *v36;
  uint64_t (*v37)(uint64_t);
  uint64_t v38;
  NSObject *v39;
  _BYTE v40[56];
  _QWORD v41[5];
  __int128 v42[2];
  __int128 v43[2];
  _QWORD v44[5];
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[40];
  _BYTE v49[48];

  v7 = v6;
  v35 = a5;
  v36 = a4;
  v34 = a3;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v31);
  v32 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B69C9FF0();
  v37 = *(uint64_t (**)(uint64_t))(v12 - 8);
  v38 = v12;
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v33 = (uint64_t)&v30 - v16;
  sub_1B69968B4(a1, (uint64_t)v48);
  sub_1B69968B4(a2, (uint64_t)v49);
  sub_1B69968B4((uint64_t)v48, (uint64_t)v42);
  sub_1B69968B4((uint64_t)v49, (uint64_t)v43);
  sub_1B69970A0(v42, (uint64_t)v45);
  sub_1B69970A0(v43, (uint64_t)v44);
  sub_1B69968B4((uint64_t)v45, (uint64_t)v41);
  v17 = a6;
  if (!a6)
    v17 = sub_1B699A754(v41);
  swift_retain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
  v18 = sub_1B699A2C8(v17, (uint64_t)v40);
  MEMORY[0x1E0C80A78](v18);
  *(&v30 - 2) = v7;
  *(&v30 - 1) = (uint64_t)v17;
  v39 = v17;
  type metadata accessor for FMNHttpClient();
  sub_1B69CA3B0();
  v19 = *(void **)&v42[0];
  sub_1B69968B4((uint64_t)v48, (uint64_t)v42);
  sub_1B69968B4((uint64_t)v49, (uint64_t)v43);
  v20 = sub_1B699A070((uint64_t)v19, (uint64_t)v40, (uint64_t)v42, v35, v34, v36);
  v22 = v21;
  sub_1B6999FB0((uint64_t)v42, &qword_1ED52FCE0);
  v23 = v46;
  v24 = v47;
  __swift_project_boxed_opaque_existential_1(v45, v46);
  (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v23, v24);
  v25 = v33;
  sub_1B69A0558((uint64_t)v15, (uint64_t)v40, v33);
  v26 = (void (*)(char *, uint64_t))*((_QWORD *)v37 + 1);
  v27 = v15;
  v28 = v38;
  v26(v27, v38);
  v37 = v20;
  sub_1B699ED68(v44, v25, (uint64_t)v20, v22);
  swift_release();

  swift_release();
  v26((char *)v25, v28);
  sub_1B6999FB0((uint64_t)v40, &qword_1ED52FCD0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  sub_1B6999FB0((uint64_t)v48, &qword_1ED52FCE0);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v45);
}

uint64_t sub_1B6999FB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id *sub_1B6999FEC(id *a1)
{
  destroy for FMNRedirectHostStore(a1);
  return a1;
}

uint64_t destroy for FMNRedirectHostStore(id *a1)
{

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(a1 + 1));
  return swift_release();
}

uint64_t type metadata accessor for FMNHttpClient()
{
  return objc_opt_self();
}

uint64_t (*sub_1B699A070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, const void *a6))(uint64_t a1)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_group_t v18;
  uint64_t v19;
  _QWORD *v20;
  _BYTE v24[56];
  _BYTE v25[40];
  _OWORD v26[5];
  _BYTE v27[8];
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _QWORD v36[10];

  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300D0);
  swift_allocObject();
  v12 = sub_1B69CA1F4();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a5;
  *(_QWORD *)(v13 + 24) = a6;
  swift_retain();
  sub_1B69CA1B8();
  swift_release();
  swift_release();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a5;
  *(_QWORD *)(v14 + 24) = a6;
  swift_retain();
  sub_1B69CA1C4();
  swift_release();
  swift_release();
  v15 = *(_QWORD *)(v6 + 16);
  v16 = *(_QWORD *)(v7 + 24);
  sub_1B699D610(a3, (uint64_t)v26, &qword_1ED52FCE0);
  v17 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1B699D610(v17, (uint64_t)v25, &qword_1ED52FCD8);
  sub_1B699D610(a2, (uint64_t)v24, &qword_1ED52FCD0);
  swift_unknownObjectWeakInit();
  v28 = v15;
  v29 = v16;
  v31 = v26[1];
  v32 = v26[2];
  v33 = v26[3];
  v34 = v26[4];
  v30 = v26[0];
  sub_1B699D654((uint64_t)v25, (uint64_t)&v35, &qword_1ED52FCD8);
  sub_1B699D654((uint64_t)v24, (uint64_t)v36, &qword_1ED52FCD0);
  swift_weakInit();
  v36[8] = a4;
  swift_unknownObjectRetain();
  v18 = sub_1B699CEF4(a5, a6, v12);
  sub_1B6999FB0((uint64_t)v27, &qword_1ED52FE98);
  v19 = swift_allocObject();
  swift_weakInit();
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v19;
  v20[3] = v18;
  v20[4] = v12;
  return sub_1B699C42C;
}

uint64_t sub_1B699A2C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v5;
  _BYTE v7[40];
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  if (a1)
  {
    swift_beginAccess();
    sub_1B699D610(v2 + 48, (uint64_t)&v10, &qword_1ED52FCD0);
    if ((_QWORD)v10)
    {
      sub_1B69A0A54((uint64_t)&v10, (uint64_t)&v8);
      swift_retain();
      sub_1B6999FB0((uint64_t)&v10, &qword_1ED52FCD0);
      sub_1B69968B4((uint64_t)&v9, (uint64_t)v7);
      sub_1B6999FEC(&v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA58);
      type metadata accessor for FMNAuthenticationCredential();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v5 = _s12FMNetworking27FMNAuthenticationCredentialC2eeoiySbAC_ACtFZ_0((_QWORD *)v10, a1);
        swift_release();
        if ((v5 & 1) != 0)
        {
          swift_release();
          return sub_1B699D610(v2 + 48, a2, &qword_1ED52FCD0);
        }
      }
    }
    else
    {
      swift_retain();
      sub_1B6999FB0((uint64_t)&v10, &qword_1ED52FCD0);
    }
    *((_QWORD *)&v11 + 1) = type metadata accessor for FMNAuthenticationCredential();
    *(_QWORD *)&v12 = &protocol witness table for FMNAuthenticationCredential;
    *(_QWORD *)&v10 = a1;
    swift_retain();
    sub_1B69A0EC4(&v10, (uint64_t *)&v8);
    sub_1B699D654((uint64_t)&v8, (uint64_t)&v10, &qword_1ED52FCD0);
    if ((_QWORD)v10)
    {
      sub_1B69A0A54((uint64_t)&v10, (uint64_t)&v8);
      FMNRedirectHostStore.clearRedirectedHostKeychainItemsIfNeeded()();
      swift_release();
      sub_1B6999FEC(&v8);
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  sub_1B699D610((uint64_t)&v10, (uint64_t)&v8, &qword_1ED52FCD0);
  swift_beginAccess();
  sub_1B699B7E0((uint64_t)&v8, v2 + 48, &qword_1ED52FCD0);
  swift_endAccess();
  return sub_1B699D654((uint64_t)&v10, a2, &qword_1ED52FCD0);
}

uint64_t sub_1B699A4F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_1B699A530(*(_QWORD *)(v1 + 24));
  *a1 = result;
  return result;
}

uint64_t sub_1B699A530(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  _UNKNOWN **v23;

  v2 = v1;
  v4 = sub_1B69CA17C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = (void *)v2[5];
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF740], v4);
  v9 = v8;
  LOBYTE(v8) = sub_1B69CA194();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    v11 = (void *)v2[4];
    if (v11)
    {
      if (a1)
      {
        *((_QWORD *)&v22 + 1) = type metadata accessor for FMNAuthenticationCredential();
        v23 = &protocol witness table for FMNAuthenticationCredential;
        *(_QWORD *)&v21 = a1;
      }
      else
      {
        v23 = 0;
        v21 = 0u;
        v22 = 0u;
      }
      v12 = (uint64_t)v11 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
      swift_beginAccess();
      v13 = v11;
      swift_retain();
      sub_1B699B7E0((uint64_t)&v21, v12, &qword_1ED52FCD8);
      swift_endAccess();
      return (uint64_t)v13;
    }
    else
    {
      if (a1)
      {
        *((_QWORD *)&v22 + 1) = type metadata accessor for FMNAuthenticationCredential();
        v23 = &protocol witness table for FMNAuthenticationCredential;
        *(_QWORD *)&v21 = a1;
      }
      else
      {
        v23 = 0;
        v21 = 0u;
        v22 = 0u;
      }
      v14 = v2[17];
      objc_allocWithZone((Class)type metadata accessor for FMNHttpClient());
      swift_retain();
      swift_retain();
      v15 = (char *)sub_1B69A1634((uint64_t)&v21, v14);
      swift_release();
      v16 = (uint64_t *)&v15[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler];
      swift_beginAccess();
      v17 = *v16;
      *v16 = (uint64_t)sub_1B6999A00;
      v16[1] = 0;
      sub_1B6996708(v17);
      v18 = (void *)v2[4];
      v2[4] = v15;
      v19 = v15;

      return (uint64_t)v19;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for FMNAuthenticationCredential()
{
  return objc_opt_self();
}

NSObject *sub_1B699A754(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4[16];

  v1 = a1[3];
  v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  (*(void (**)(char *__return_ptr, uint64_t, uint64_t))(v2 + 8))(v4, v1, v2);
  return sub_1B699A888(v4);
}

NSObject *sub_1B699A888(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_BYTE *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t);
  char *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  _QWORD v25[2];
  NSObject *v26;
  uint64_t v27;
  char *v28;
  _BYTE v29[24];
  uint64_t v30;

  v3 = v1;
  v30 = sub_1B69CA170();
  v5 = *(_QWORD *)(v30 - 8);
  v6 = MEMORY[0x1E0C80A78](v30);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v28 = (char *)v25 - v9;
  v10 = *a1;
  sub_1B69A0A18();
  v11 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  v12 = dispatch_group_create();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  dispatch_group_enter(v12);
  if (!*(_QWORD *)(v3 + 16))
  {
    sub_1B69A9FF8();
    swift_allocError();
    *v22 = 6;
    swift_willThrow();

LABEL_6:
    swift_release();
    return v12;
  }
  v25[1] = v2;
  v14 = *(_QWORD *)(v3 + 24);
  ObjectType = swift_getObjectType();
  v27 = v5;
  v16 = ObjectType;
  v29[0] = v10;
  v17 = swift_allocObject();
  *(_BYTE *)(v17 + 16) = v10;
  *(_QWORD *)(v17 + 24) = v12;
  *(_QWORD *)(v17 + 32) = v13;
  v18 = *(void (**)(_BYTE *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t))(v14 + 8);
  v26 = v12;
  swift_retain();
  swift_unknownObjectRetain();
  v18(v29, sub_1B6997760, v17, v16, v14);
  swift_release();
  sub_1B69CA164();
  v19 = v28;
  MEMORY[0x1BCC9A1B8](v8, 9.0);
  v12 = v26;
  v20 = *(void (**)(char *, uint64_t))(v27 + 8);
  v21 = v30;
  v20(v8, v30);
  if ((sub_1B69CA380() & 1) != 0)
  {
    sub_1B69A9FF8();
    swift_allocError();
    *v23 = 4;
    swift_willThrow();

    swift_unknownObjectRelease();
    v20(v19, v21);
    goto LABEL_6;
  }
  v20(v19, v21);
  swift_unknownObjectRelease();

  swift_beginAccess();
  v12 = *(NSObject **)(v13 + 16);
  swift_retain();
  swift_release();
  return v12;
}

uint64_t sub_1B699AB48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id *v7;

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v5 = (((a1 + 15) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v6 + 24) >= 0xFFFFFFFFuLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v6);
  v7 = (id *)((v6 + 47) & 0xFFFFFFFFFFFFFFF8);
  if ((unint64_t)*v7 >= 0xFFFFFFFF)
  {

    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v7 + 1));
    swift_release();
  }
  return swift_weakDestroy();
}

uint64_t sub_1B699AC08(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t aBlock;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  void *v29;
  _QWORD *v30;

  v4 = v3;
  v8 = sub_1B69CA134();
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1B69CA158();
  v11 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a1;
  sub_1B69CA374();
  if (qword_1ED530478 != -1)
    swift_once();
  v15 = MEMORY[0x1E0DEE9D8];
  sub_1B69CA11C();
  if (*(_QWORD *)(v4 + 56))
  {
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = v4;
    v29 = sub_1B699771C;
    v30 = v16;
    aBlock = MEMORY[0x1E0C809B0];
    v26 = 1107296256;
    v17 = &block_descriptor_1;
  }
  else
  {
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v4;
    *(_QWORD *)(v18 + 24) = a2;
    *(_QWORD *)(v18 + 32) = a3;
    *(_BYTE *)(v18 + 40) = v14;
    v29 = sub_1B699776C;
    v30 = (_QWORD *)v18;
    aBlock = MEMORY[0x1E0C809B0];
    v26 = 1107296256;
    v17 = &block_descriptor_6;
  }
  v27 = sub_1B6997130;
  v28 = v17;
  v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  sub_1B69CA14C();
  v24 = v15;
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v13, v10, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v23);
  return swift_release();
}

uint64_t sub_1B699AEC4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCC9ABA8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B699AF04(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B699AF44(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1BCC9ABA8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B699AF84()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 152))();
}

uint64_t sub_1B699AFAC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 128))();
}

uint64_t sub_1B699AFD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  swift_beginAccess();
  v4 = sub_1B69C9FF0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1B699B038@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 56);
  return result;
}

uint64_t sub_1B699B078(uint64_t a1, unint64_t a2, void *a3, void *a4, void (*a5)(uint64_t *), uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  id v32;
  uint64_t v33;
  _BYTE *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char *v48;
  void (*v49)(char *, unint64_t);
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];
  uint64_t v75;
  uint64_t *v76;
  __int128 v77;
  uint64_t *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  _BYTE *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  id v89;
  void (*v90)(uint64_t *);
  char *v91;

  v87 = a1;
  v89 = a3;
  v90 = a5;
  v88 = a2;
  v8 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (_QWORD *)((char *)v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1B69CA278();
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    *v16 = (uint64_t)a4;
    swift_storeEnumTagMultiPayload();
    v24 = a4;
    v25 = v16;
LABEL_8:
    v90(v25);
    return sub_1B6999FB0((uint64_t)v16, &qword_1ED5300E0);
  }
  v79 = v23;
  v80 = v18;
  v81 = v17;
  v82 = v13;
  v83 = v20;
  v84 = v14;
  v78 = (uint64_t *)v10;
  v27 = v87;
  v26 = v88;
  v85 = a6;
  v28 = v89;
  if (!v89 || (objc_opt_self(), (v29 = swift_dynamicCastObjCClass()) == 0))
  {
    sub_1B69BB778();
    v33 = swift_allocError();
    *v34 = 5;
    *v16 = v33;
    swift_storeEnumTagMultiPayload();
    v25 = v16;
    goto LABEL_8;
  }
  if (v26 >> 60 == 15)
  {
    sub_1B69BB778();
    v30 = swift_allocError();
    *v31 = 6;
    *v16 = v30;
    swift_storeEnumTagMultiPayload();
    v32 = v28;
    v90(v16);

    return sub_1B6999FB0((uint64_t)v16, &qword_1ED5300E0);
  }
  v36 = (void *)v29;
  v74[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v37 = swift_allocObject();
  v77 = xmmword_1B69CADE0;
  *(_OWORD *)(v37 + 16) = xmmword_1B69CADE0;
  v89 = v28;
  v38 = v27;
  sub_1B69A5DE0(v27, v26);
  v39 = objc_msgSend(v36, sel_allHeaderFields);
  v40 = sub_1B69CA20C();

  *(_QWORD *)(v37 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FED0);
  *(_QWORD *)(v37 + 64) = sub_1B699AF44(&qword_1ED52FED8, &qword_1ED52FED0, MEMORY[0x1E0CB1828]);
  *(_QWORD *)(v37 + 32) = v40;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v41 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  v42 = objc_msgSend(v36, sel_allHeaderFields);
  v43 = sub_1B69CA20C();

  v44 = sub_1B699B824(v43);
  swift_bridgeObjectRelease();
  v75 = v8;
  v76 = v16;
  if (v44)
    v45 = v44;
  else
    v45 = sub_1B699FF94(MEMORY[0x1E0DEE9D8]);
  v46 = v78;
  v47 = v86;
  v48 = (char *)objc_msgSend(v36, sel_statusCode);
  v49 = (void (*)(char *, unint64_t))sub_1B699F5D8((uint64_t)v48);
  if (v49)
  {
    v50 = (uint64_t)v49;
    v49(v48, v45);
    sub_1B6996708(v50);
  }
  v51 = (_QWORD *)(v47 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers);
  swift_beginAccess();
  *v51 = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  v52 = MEMORY[0x1E0DEA968];
  if ((unint64_t)(v48 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = v77;
    v91 = v48;
    sub_1B69B82FC();
    v54 = sub_1B69CA41C();
    v86 = v55;
    *(_QWORD *)(v53 + 56) = v52;
    *(_QWORD *)(v53 + 64) = sub_1B699F398();
    v56 = v86;
    *(_QWORD *)(v53 + 32) = v54;
    *(_QWORD *)(v53 + 40) = v56;
    v57 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();
    swift_bridgeObjectRelease();

  }
  v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = v77;
  sub_1B69CA26C();
  v59 = v38;
  v60 = v26;
  v61 = sub_1B69CA260();
  v63 = v62;
  *(_QWORD *)(v58 + 56) = v52;
  *(_QWORD *)(v58 + 64) = sub_1B699F398();
  v64 = 7104878;
  if (v63)
    v64 = v61;
  v65 = 0xE300000000000000;
  if (v63)
    v65 = v63;
  *(_QWORD *)(v58 + 32) = v64;
  *(_QWORD *)(v58 + 40) = v65;
  v66 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  v67 = swift_bridgeObjectRetain();
  v68 = v83;
  FMNServerInteractionController.InternalServerMetadata.init(headers:)(v67, v83);
  v69 = (uint64_t)v82;
  sub_1B699BC64((uint64_t)v68, (uint64_t)v82, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
  v70 = v81;
  v71 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 56);
  v71(v69, 0, 1, v81);
  v72 = (uint64_t)v46 + *(int *)(v75 + 28);
  v71(v72, 1, 1, v70);
  *v46 = v59;
  v46[1] = v60;
  v46[2] = (uint64_t)v48;
  v46[3] = v45;
  sub_1B699D90C(v59, v60);
  sub_1B699B7E0(v69, v72, &qword_1ED52FF80);
  v73 = (uint64_t)v76;
  sub_1B699B788((uint64_t)v46, (uint64_t)v76);
  swift_storeEnumTagMultiPayload();
  v90((uint64_t *)v73);

  sub_1B699FF80(v59, v60);
  sub_1B6999FB0(v73, &qword_1ED5300E0);
  return sub_1B699F3DC((uint64_t)v68, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
}

uint64_t sub_1B699B788(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for FMNServerInteractionController.FMNResponseFields(uint64_t a1)
{
  return sub_1B699DAC4(a1, qword_1ED52FF68);
}

uint64_t sub_1B699B7E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_1B699B824(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t result;
  int64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  char v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[40];
  _OWORD v28[2];
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  _OWORD v32[2];
  uint64_t v33;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF08);
    v1 = (_QWORD *)sub_1B69CA518();
  }
  else
  {
    v1 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v23 = a1 + 64;
  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  v4 = v2 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    if (v4)
    {
      v10 = (v4 - 1) & v4;
      v11 = __clz(__rbit64(v4)) | (v6 << 6);
      v12 = v6;
    }
    else
    {
      v13 = v6 + 1;
      if (__OFADD__(v6, 1))
        goto LABEL_40;
      if (v13 >= v22)
      {
LABEL_36:
        sub_1B69B8340();
        return (unint64_t)v1;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v6 + 1;
      if (!v14)
      {
        v12 = v6 + 2;
        if (v6 + 2 >= v22)
          goto LABEL_36;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v6 + 3;
          if (v6 + 3 >= v22)
            goto LABEL_36;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v6 + 4;
            if (v6 + 4 >= v22)
              goto LABEL_36;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v6 + 5;
              if (v6 + 5 >= v22)
                goto LABEL_36;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_41;
                  if (v12 >= v22)
                    goto LABEL_36;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v6 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_1B699BC28(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v31);
    sub_1B699BBEC(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v32 + 8);
    v29[0] = v32[0];
    v29[1] = v32[1];
    v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_1B699BC28((uint64_t)v28, (uint64_t)v27);
    if (!swift_dynamicCast())
    {
      sub_1B6999FB0((uint64_t)v28, &qword_1ED52FF00);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_1B69B8340();
      swift_release();
      return 0;
    }
    sub_1B699BBEC((uint64_t)v29 + 8, (uint64_t)v27);
    sub_1B6999FB0((uint64_t)v28, &qword_1ED52FF00);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    result = sub_1B699E8D4(v25, v26);
    if ((v16 & 1) != 0)
    {
      v7 = 16 * result;
      v8 = (uint64_t *)(v1[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v25;
      v8[1] = v26;
      v9 = (uint64_t *)(v1[7] + v7);
      result = swift_bridgeObjectRelease();
      *v9 = v25;
      v9[1] = v26;
      goto LABEL_8;
    }
    if (v1[2] >= v1[3])
      break;
    *(_QWORD *)((char *)v1 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v17 = (uint64_t *)(v1[6] + 16 * result);
    *v17 = v25;
    v17[1] = v26;
    v18 = (uint64_t *)(v1[7] + 16 * result);
    *v18 = v25;
    v18[1] = v26;
    v19 = v1[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_39;
    v1[2] = v21;
LABEL_8:
    v6 = v12;
    v4 = v10;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B699BBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B699BC28(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1B699BC64(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t initializeWithCopy for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_1B69CA1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_1B69CA104();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v13);
  v16 = (_QWORD *)(a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = a1 + v14;
  v19 = a2 + v14;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_QWORD *)v18 = *(_QWORD *)v19;
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t FMNServerInteractionController.InternalServerMetadata.init(headers:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 *v28;
  unsigned int v29;
  uint64_t v30;
  _BYTE *v31;
  void (*v32)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 *v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  char v45;
  _BYTE *v46;
  unint64_t v47;
  char v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  _BYTE *v61;
  void (*v62)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v63;
  _BYTE *v64;
  _BYTE v65[12];
  int v66;
  _BYTE *v67;
  _BYTE *v68;
  _QWORD v69[3];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v65[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1B69CA104();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v68 = &v65[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300C8);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v65[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1B69CA1AC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v67 = &v65[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_58;
  result = sub_1B699E8D4(0xD000000000000012, 0x80000001B69CD610);
  if ((v17 & 1) == 0)
    goto LABEL_58;
  v18 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * result);
  v20 = *v18;
  v19 = v18[1];
  v21 = HIBYTE(v19) & 0xF;
  v22 = v20 & 0xFFFFFFFFFFFFLL;
  if (!((v19 & 0x2000000000000000) != 0 ? HIBYTE(v19) & 0xF : v20 & 0xFFFFFFFFFFFFLL))
    goto LABEL_58;
  if ((v19 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B69B65CC(v20, v19, 10);
    v66 = v44;
    swift_bridgeObjectRelease();
    if ((v66 & 1) == 0)
      goto LABEL_38;
LABEL_58:
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v14 + 104))(a2, *MEMORY[0x1E0D89AE8], v13);
    goto LABEL_59;
  }
  if ((v19 & 0x2000000000000000) != 0)
  {
    v69[0] = v20;
    v69[1] = v19 & 0xFFFFFFFFFFFFFFLL;
    if (v20 == 43)
    {
      if (!v21)
        goto LABEL_77;
      if (v21 == 1)
        goto LABEL_37;
      if ((BYTE1(v20) - 48) > 9u)
        goto LABEL_34;
      if (v21 != 2)
      {
        if ((BYTE2(v20) - 48) > 9u)
          goto LABEL_34;
        v26 = 10 * (BYTE1(v20) - 48) + (BYTE2(v20) - 48);
        v27 = v21 - 3;
        if (v21 != 3)
        {
          v28 = (unsigned __int8 *)v69 + 3;
          while (1)
          {
            v29 = *v28 - 48;
            if (v29 > 9)
              goto LABEL_34;
            v30 = 10 * v26;
            if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63)
              goto LABEL_34;
            v26 = v30 + v29;
            if (__OFADD__(v30, v29))
              goto LABEL_34;
            LOBYTE(v21) = 0;
            ++v28;
            if (!--v27)
              goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (v20 == 45)
      {
        if (v21)
        {
          if (v21 != 1)
          {
            if ((BYTE1(v20) - 48) > 9u)
              goto LABEL_34;
            if (v21 == 2)
            {
              LOBYTE(v21) = 0;
              goto LABEL_37;
            }
            if ((BYTE2(v20) - 48) > 9u)
              goto LABEL_34;
            v39 = -10 * (BYTE1(v20) - 48) - (BYTE2(v20) - 48);
            v40 = v21 - 3;
            if (v21 != 3)
            {
              v41 = (unsigned __int8 *)v69 + 3;
              while (1)
              {
                v42 = *v41 - 48;
                if (v42 > 9)
                  goto LABEL_34;
                v43 = 10 * v39;
                if ((unsigned __int128)(v39 * (__int128)10) >> 64 != (10 * v39) >> 63)
                  goto LABEL_34;
                v39 = v43 - v42;
                if (__OFSUB__(v43, v42))
                  goto LABEL_34;
                LOBYTE(v21) = 0;
                ++v41;
                if (!--v40)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_37:
          if ((v21 & 1) == 0)
            goto LABEL_38;
          goto LABEL_58;
        }
        __break(1u);
LABEL_77:
        __break(1u);
        return result;
      }
      if (!v21 || (v20 - 48) > 9u)
      {
LABEL_34:
        LOBYTE(v21) = 1;
        goto LABEL_37;
      }
      if (v21 != 1)
      {
        if ((BYTE1(v20) - 48) > 9u)
          goto LABEL_34;
        v34 = 10 * (v20 - 48) + (BYTE1(v20) - 48);
        v35 = v21 - 2;
        if (v21 != 2)
        {
          v36 = (unsigned __int8 *)v69 + 2;
          while (1)
          {
            v37 = *v36 - 48;
            if (v37 > 9)
              goto LABEL_34;
            v38 = 10 * v34;
            if ((unsigned __int128)(v34 * (__int128)10) >> 64 != (10 * v34) >> 63)
              goto LABEL_34;
            v34 = v38 + v37;
            if (__OFADD__(v38, v37))
              goto LABEL_34;
            LOBYTE(v21) = 0;
            ++v36;
            if (!--v35)
              goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    LOBYTE(v21) = 0;
    goto LABEL_37;
  }
  if ((v20 & 0x1000000000000000) != 0)
    v24 = (unsigned __int8 *)((v19 & 0xFFFFFFFFFFFFFFFLL) + 32);
  else
    v24 = (unsigned __int8 *)sub_1B69CA4E8();
  sub_1B69B7AE8(v24, v22, 10);
  if ((v25 & 1) != 0)
    goto LABEL_58;
LABEL_38:
  sub_1B69CA1A0();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    v31 = v67;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v14 + 104))(v67, *MEMORY[0x1E0D89AE8], v13);
    sub_1B6999FB0((uint64_t)v12, &qword_1ED5300C8);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v14 + 32))(a2, v31, v13);
  }
  else
  {
    v32 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v14 + 32);
    v33 = v67;
    v32(v67, v12, v13);
    v32(a2, v33, v13);
  }
LABEL_59:
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_63;
  sub_1B699E8D4(0xD000000000000014, 0x80000001B69CD630);
  if ((v45 & 1) == 0)
    goto LABEL_63;
  swift_bridgeObjectRetain();
  sub_1B69CA0EC();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1B6999FB0((uint64_t)v6, &qword_1ED52FF88);
LABEL_63:
    v46 = &a2[*(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 20)];
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v46, 1, 1, v7);
    goto LABEL_64;
  }
  v62 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32);
  v63 = v68;
  v62(v68, v6, v7);
  v64 = &a2[*(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 20)];
  v62(v64, v63, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v64, 0, 1, v7);
LABEL_64:
  if (*(_QWORD *)(a1 + 16) && (v47 = sub_1B699E8D4(0xD000000000000015, 0x80000001B69CD650), (v48 & 1) != 0))
  {
    v49 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v47);
    v51 = *v49;
    v50 = v49[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    v51 = 0;
    v50 = 0;
  }
  v52 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  v53 = &a2[*(int *)(v52 + 24)];
  *v53 = v51;
  v53[1] = v50;
  if (*(_QWORD *)(a1 + 16) && (v54 = sub_1B699E8D4(0xD000000000000013, 0x80000001B69CD670), (v55 & 1) != 0))
  {
    v56 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v54);
    v57 = *v56;
    v58 = v56[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    result = sub_1B69B6380(v57, v58);
    v60 = v59 & 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    result = 0;
    v60 = 1;
  }
  v61 = &a2[*(int *)(v52 + 28)];
  *(_QWORD *)v61 = result;
  v61[8] = v60;
  return result;
}

uint64_t sub_1B699C42C(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B699C438(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1B699C438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1B699C4AC(a1, a3, a4);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B699C4AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void (*v17)(char *, uint64_t);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a1;
  v28 = a3;
  v3 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (void **)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_1B69CA170();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v25 - v14;
  sub_1B69A0A18();
  v16 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  sub_1B69CA164();
  MEMORY[0x1BCC9A1B8](v13, 9.0);
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v26 = v9;
  v17(v13, v9);
  sub_1B69CA380();
  sub_1B699D610(v27, (uint64_t)v8, &qword_1ED5300E0);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_1B699B788((uint64_t)v8, (uint64_t)v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B69CADE0;
    __asm { BR              X13 }
  }
  v18 = *v8;
  sub_1B69CA368();
  v19 = (void *)sub_1B69CA3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1B69CADE0;
  swift_getErrorValue();
  v21 = sub_1B69CA728();
  v23 = v22;
  *(_QWORD *)(v20 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v20 + 64) = sub_1B699F398();
  *(_QWORD *)(v20 + 32) = v21;
  *(_QWORD *)(v20 + 40) = v23;
  sub_1B69CA11C();

  swift_bridgeObjectRelease();
  sub_1B69CA1DC();

  return ((uint64_t (*)(char *, uint64_t))v17)(v15, v26);
}

uint64_t sub_1B699C83C(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B699C8E4(a1, (uint64_t)v6);
  swift_storeEnumTagMultiPayload();
  a2(v6);
  return sub_1B6999FB0((uint64_t)v6, &qword_1ED5300E0);
}

uint64_t sub_1B699C8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B699C928(uint64_t a1, void (*a2)(void **))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  id v15;
  uint64_t v17;

  v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300C0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (void **)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (void **)((char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B699D610(a1, (uint64_t)v13, &qword_1ED5300E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = *v13;
    *v10 = *v13;
    (*(void (**)(void **, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0D89AD0], v7);
    v15 = v14;
    a2(v10);

    return (*(uint64_t (**)(void **, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    sub_1B699B788((uint64_t)v13, (uint64_t)v6);
    sub_1B699C8E4((uint64_t)v6, (uint64_t)v10);
    (*(void (**)(void **, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0D89AD8], v7);
    a2(v10);
    (*(void (**)(void **, uint64_t))(v8 + 8))(v10, v7);
    return sub_1B699CAE8((uint64_t)v6);
  }
}

uint64_t sub_1B699CAE8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B699CB24(uint64_t a1, void (*a2)(_QWORD, unint64_t, id))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t inited;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (_QWORD *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300C0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (id *)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v11 = (*(uint64_t (**)(id *, uint64_t))(v8 + 88))(v10, v7);
  if (v11 == *MEMORY[0x1E0D89AD8])
  {
    (*(void (**)(id *, uint64_t))(v8 + 96))(v10, v7);
    sub_1B699B788((uint64_t)v10, (uint64_t)v6);
    v12 = v6[2];
    if (v12 - 300 > 0xFFFFFFFFFFFFFF9BLL)
    {
      v25 = 0;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
      v13 = swift_allocObject();
      v28 = xmmword_1B69CADE0;
      *(_OWORD *)(v13 + 16) = xmmword_1B69CADE0;
      v30 = v12;
      sub_1B69B82FC();
      v14 = sub_1B69CA41C();
      v16 = v15;
      *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v13 + 64) = sub_1B699F398();
      *(_QWORD *)(v13 + 32) = v14;
      *(_QWORD *)(v13 + 40) = v16;
      sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
      v17 = (void *)sub_1B69CA3E0();
      sub_1B69CA374();
      sub_1B69CA110();
      swift_bridgeObjectRelease();

      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF18);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v28;
      *(_QWORD *)(inited + 32) = sub_1B69CA248();
      *(_QWORD *)(inited + 40) = v19;
      v30 = 0;
      v31 = 0xE000000000000000;
      sub_1B69CA4B8();
      swift_bridgeObjectRelease();
      v30 = 0xD00000000000001BLL;
      v31 = 0x80000001B69CEBD0;
      v29 = v12;
      sub_1B69CA5E4();
      sub_1B69CA2A8();
      swift_bridgeObjectRelease();
      v20 = v31;
      *(_QWORD *)(inited + 48) = v30;
      *(_QWORD *)(inited + 56) = v20;
      v21 = sub_1B699FF94(inited);
      sub_1B69B6018(v21);
      swift_bridgeObjectRelease();
      v22 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      v23 = (void *)sub_1B69CA23C();
      v24 = (void *)sub_1B69CA200();
      swift_bridgeObjectRelease();
      v25 = objc_msgSend(v22, sel_initWithDomain_code_userInfo_, v23, 500, v24);

    }
    a2(*v6, v6[1], v25);

    sub_1B699F3DC((uint64_t)v6, type metadata accessor for FMNServerInteractionController.FMNResponseFields);
  }
  else if (v11 == *MEMORY[0x1E0D89AD0])
  {
    (*(void (**)(id *, uint64_t))(v8 + 96))(v10, v7);
    v26 = *v10;
    v27 = *v10;
    a2(0, 0xF000000000000000, v26);

  }
  else
  {
    sub_1B69CA680();
    __break(1u);
  }
}

uint64_t sub_1B699CEE0(uint64_t a1)
{
  uint64_t v1;

  return sub_1B699CEE8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_1B699CEEC(uint64_t a1)
{
  uint64_t v1;

  sub_1B699CB24(a1, *(void (**)(_QWORD, unint64_t, id))(v1 + 16));
}

dispatch_group_t sub_1B699CEF4(_QWORD *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  dispatch_group_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  char *v27;
  char *v28;
  const void *v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *, _QWORD *);
  char *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  const void *v42;
  _QWORD v44[4];
  const void *v45;
  char *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  dispatch_group_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  _QWORD v57[3];
  uint64_t v58;
  uint64_t (*v59)(_QWORD *, _QWORD *);
  uint64_t v60;
  _BYTE v61[56];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[56];
  _OWORD v68[5];
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t);
  void *v72;
  void (*v73)();
  _QWORD *v74;

  v48 = a1;
  v52 = sub_1B69CA134();
  v55 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v46 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_1B69CA158();
  v54 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v53 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = dispatch_group_create();
  sub_1B699D610(v3, (uint64_t)&v69, &qword_1ED52FE98);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_1B699D654((uint64_t)&v69, v9 + 24, &qword_1ED52FE98);
  sub_1B699D610(v3 + 24, (uint64_t)v68, &qword_1ED52FCE0);
  sub_1B699D610(v3 + 144, (uint64_t)v67, &qword_1ED52FCD0);
  sub_1B699D610(v3, (uint64_t)&v69, &qword_1ED52FE98);
  v64 = v68[2];
  v65 = v68[3];
  v66 = v68[4];
  v62 = v68[0];
  v63 = v68[1];
  sub_1B699D654((uint64_t)v67, (uint64_t)v61, &qword_1ED52FCD0);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  sub_1B699D654((uint64_t)&v69, v10 + 24, &qword_1ED52FE98);
  v44[3] = a3;
  *(_QWORD *)(v10 + 240) = a3;
  v11 = v64;
  v12 = v65;
  v13 = v62;
  *(_OWORD *)(v10 + 264) = v63;
  *(_OWORD *)(v10 + 280) = v11;
  v14 = v66;
  *(_OWORD *)(v10 + 296) = v12;
  *(_OWORD *)(v10 + 312) = v14;
  *(_OWORD *)(v10 + 248) = v13;
  sub_1B699D654((uint64_t)v61, v10 + 328, &qword_1ED52FCD0);
  *(_QWORD *)(v10 + 384) = v48;
  *(_QWORD *)(v10 + 392) = a2;
  v45 = a2;
  v56 = xmmword_1B69CB2C0;
  v48 = v57;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_1B69A9F4C;
  *(_QWORD *)(v15 + 24) = v9;
  v57[0] = 401;
  v57[1] = sub_1B69A9FBC;
  v57[2] = v15;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1B69A9F7C;
  *(_QWORD *)(v16 + 24) = v10;
  v58 = 330;
  v59 = sub_1B69AA1B0;
  v60 = v16;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1B69A9FBC;
  *(_QWORD *)(v17 + 24) = v15;
  v47 = v3;
  v18 = MEMORY[0x1BCC9ACC8](v3);
  v19 = MEMORY[0x1E0C809B0];
  v49 = v9;
  v50 = v8;
  if (v18)
  {
    v20 = (void *)v18;
    v44[2] = *(_QWORD *)(v18 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v21;
    v22[3] = 401;
    v44[1] = v21;
    v22[4] = sub_1B69A9FC4;
    v22[5] = v17;
    v73 = sub_1B6997718;
    v74 = v22;
    v69 = v19;
    v70 = 1107296256;
    v71 = sub_1B6997130;
    v72 = &block_descriptor_52;
    v23 = _Block_copy(&v69);
    v24 = v52;
    v44[0] = v23;
    v25 = v8;
    swift_retain_n();
    v26 = v25;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v27 = v53;
    sub_1B69CA14C();
    *(_QWORD *)&v68[0] = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699DB5C();
    v28 = v46;
    sub_1B69CA434();
    v29 = (const void *)v44[0];
    MEMORY[0x1BCC9A3EC](0, v27, v28, v44[0]);
    _Block_release(v29);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v28, v24);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v27, v51);
    swift_release();

    swift_release();
    swift_release();
    swift_release();
    v30 = v58;
    v31 = v59;
    v16 = v60;
    v32 = v28;
  }
  else
  {
    v33 = v8;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    v31 = sub_1B69AA1B0;
    v30 = 330;
    v32 = v46;
  }
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v31;
  *(_QWORD *)(v34 + 24) = v16;
  v35 = MEMORY[0x1BCC9ACC8](v47);
  if (v35)
  {
    v36 = (void *)v35;
    v47 = *(_QWORD *)(v35 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    v37 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v38 = (_QWORD *)swift_allocObject();
    v38[2] = v37;
    v38[3] = v30;
    v46 = (char *)v37;
    v38[4] = sub_1B69AA1BC;
    v38[5] = v34;
    v73 = sub_1B699715C;
    v74 = v38;
    v69 = MEMORY[0x1E0C809B0];
    v70 = 1107296256;
    v71 = sub_1B6997130;
    v72 = &block_descriptor_44;
    v39 = _Block_copy(&v69);
    v40 = v52;
    v45 = v39;
    swift_retain_n();
    swift_retain();
    swift_retain();
    v41 = v53;
    sub_1B69CA14C();
    *(_QWORD *)&v68[0] = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699DB5C();
    sub_1B69CA434();
    v42 = v45;
    MEMORY[0x1BCC9A3EC](0, v41, v32, v45);
    _Block_release(v42);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v40);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v41, v51);
    swift_release();
    swift_release();
    swift_release();

  }
  else
  {
    swift_retain();
  }
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300D8);
  swift_arrayDestroy();
  return v50;
}

uint64_t sub_1B699D610(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B699D654(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_20Tm()
{
  uint64_t v0;
  void *v1;
  void *v2;

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 88);
  if (*(_QWORD *)(v0 + 152))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 128);
  v1 = *(void **)(v0 + 168);
  if (v1)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 176);
    swift_release();
  }
  swift_weakDestroy();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 248);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 288);
  v2 = *(void **)(v0 + 328);
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 336);
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t *initializeWithCopy for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  int *v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, int *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void (*v30)(char *, _QWORD, uint64_t, int *);

  v6 = *a2;
  v7 = a2[1];
  sub_1B699D90C(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  v8 = a2[3];
  a1[2] = a2[2];
  a1[3] = v8;
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  v13 = *((_QWORD *)v12 - 1);
  v14 = *(unsigned int (**)(char *, uint64_t, int *))(v13 + 48);
  swift_bridgeObjectRetain();
  if (v14(v11, 1, v12))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v16 = sub_1B69CA1AC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v10, v11, v16);
    v17 = v12[5];
    v18 = &v10[v17];
    v19 = &v11[v17];
    v20 = sub_1B69CA104();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    v23 = v12[6];
    v24 = &v10[v23];
    v25 = &v11[v23];
    v26 = *((_QWORD *)v25 + 1);
    *(_QWORD *)v24 = *(_QWORD *)v25;
    *((_QWORD *)v24 + 1) = v26;
    v27 = v12[7];
    v28 = &v10[v27];
    v29 = &v11[v27];
    v28[8] = v29[8];
    *(_QWORD *)v28 = *(_QWORD *)v29;
    v30 = *(void (**)(char *, _QWORD, uint64_t, int *))(v13 + 56);
    swift_bridgeObjectRetain();
    v30(v10, 0, 1, v12);
  }
  return a1;
}

uint64_t storeEnumTagSinglePayload for FMNServerInteractionController.InternalServerMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B699D90C(uint64_t a1, unint64_t a2)
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

uint64_t destroy for FMNServerInteractionController.FMNResponseFields(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_1B699DB18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5);
  if (!(_DWORD)result)
  {
    v7 = sub_1B69CA1AC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
    v8 = v4 + *(int *)(v5 + 20);
    v9 = sub_1B69CA104();
    v10 = *(_QWORD *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCC9AB90]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1B699DAC4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for FMNServerInteractionController.InternalServerMetadata(uint64_t a1)
{
  return sub_1B699DAC4(a1, qword_1ED530020);
}

uint64_t getEnumTagSinglePayload for FMNServerInteractionController.InternalServerMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B699DB18(uint64_t a1, unint64_t a2)
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

unint64_t sub_1B699DB5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED52FEF0;
  if (!qword_1ED52FEF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED52FEE0);
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED52FEF0);
  }
  return result;
}

uint64_t sub_1B699DBA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = (_OWORD *)((swift_unknownObjectWeakTakeInit() + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_OWORD *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)v6 + v9 + 16) & ~v9;
  v11 = ((unint64_t)v7 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v10, v11);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(_OWORD *)v14;
  v16 = *(_OWORD *)(v14 + 16);
  *(_QWORD *)(v13 + 32) = *(_QWORD *)(v14 + 32);
  *(_OWORD *)v13 = v15;
  *(_OWORD *)(v13 + 16) = v16;
  v17 = (v13 + 47) & 0xFFFFFFFFFFFFFFF8;
  v18 = (v14 + 47) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(_OWORD *)(v18 + 16);
  v19 = *(_OWORD *)(v18 + 32);
  v21 = *(_OWORD *)v18;
  *(_QWORD *)(v17 + 48) = *(_QWORD *)(v18 + 48);
  *(_OWORD *)(v17 + 16) = v20;
  *(_OWORD *)(v17 + 32) = v19;
  *(_OWORD *)v17 = v21;
  *(_QWORD *)((swift_weakTakeInit() + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((((v18 + 63) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1B699DCA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void (*v24)(unint64_t, unint64_t, uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v6 = (_OWORD *)((swift_unknownObjectWeakCopyInit() + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_OWORD *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)v6 + v10 + 16) & ~v10;
  v12 = ((unint64_t)v7 + v10 + 16) & ~v10;
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  swift_unknownObjectRetain();
  v13(v11, v12, v8);
  v14 = *(_QWORD *)(v9 + 64) + 7;
  v15 = (v14 + v11) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v14 + v12) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v16 + 24);
  if (v17 < 0xFFFFFFFF)
  {
    v18 = *(_OWORD *)v16;
    v19 = *(_OWORD *)(v16 + 16);
    *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
    *(_OWORD *)v15 = v18;
    *(_OWORD *)(v15 + 16) = v19;
  }
  else
  {
    *(_QWORD *)(v15 + 24) = v17;
    *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
    (**(void (***)(unint64_t, unint64_t))(v17 - 8))(v15, v16);
  }
  v20 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v16 + 47) & 0xFFFFFFFFFFFFFFF8;
  v22 = *(void **)v21;
  if (*(_QWORD *)v21 < 0xFFFFFFFFuLL)
  {
    v26 = *(_OWORD *)v21;
    v27 = *(_OWORD *)(v21 + 16);
    v28 = *(_OWORD *)(v21 + 32);
    *(_QWORD *)(v20 + 48) = *(_QWORD *)(v21 + 48);
    *(_OWORD *)(v20 + 16) = v27;
    *(_OWORD *)(v20 + 32) = v28;
    *(_OWORD *)v20 = v26;
  }
  else
  {
    *(_QWORD *)v20 = v22;
    v23 = *(_QWORD *)(v21 + 32);
    *(_QWORD *)(v20 + 32) = v23;
    *(_QWORD *)(v20 + 40) = *(_QWORD *)(v21 + 40);
    v24 = **(void (***)(unint64_t, unint64_t, uint64_t))(v23 - 8);
    v25 = v22;
    v24(v20 + 8, v21 + 8, v23);
    *(_QWORD *)(v20 + 48) = *(_QWORD *)(v21 + 48);
    swift_retain();
  }
  *(_QWORD *)((swift_weakCopyInit() + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((((v21 + 63) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCC9AB9C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B699DE88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  char v13;
  uint64_t v14;
  char v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  _OWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t result;
  _QWORD v43[6];
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  _QWORD *v53;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA30);
  v43[2] = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v43[3] = (char *)v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B69CA590();
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  v43[5] = v2;
  v43[1] = v4;
  v6 = (_BYTE *)(v4 + 56);
  v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v43[4] = v1;
  while (1)
  {
    v44 = v5;
    v8 = *((_QWORD *)v6 - 3);
    v9 = *((_QWORD *)v6 - 2);
    v10 = *((_QWORD *)v6 - 1);
    v11 = *v6;
    v49 = v8;
    v50 = v9;
    v51 = v10;
    v52 = v11;
    swift_bridgeObjectRetain();
    v12 = v45;
    v13 = sub_1B69CA560();
    if (v12)
    {

      v14 = sub_1B69CA554();
      v45 = 0;
      v48 = MEMORY[0x1E0DEA968];
      *(_QWORD *)&v47 = v14;
      *((_QWORD *)&v47 + 1) = v24;
      sub_1B699ED14(&v47, &v46);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v53 = v7;
      v26 = sub_1B699E8D4(v8, v9);
      v28 = v26;
      v29 = v7[2];
      v30 = (v27 & 1) == 0;
      v31 = v29 + v30;
      if (__OFADD__(v29, v30))
        goto LABEL_35;
      v32 = v27;
      if (v7[3] >= v31)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v7 = v53;
          if ((v27 & 1) == 0)
            goto LABEL_20;
        }
        else
        {
          sub_1B69A4D18();
          v7 = v53;
          if ((v32 & 1) == 0)
            goto LABEL_20;
        }
      }
      else
      {
        sub_1B699EA18(v31, isUniquelyReferenced_nonNull_native);
        v33 = sub_1B699E8D4(v8, v9);
        if ((v32 & 1) != (v34 & 1))
          goto LABEL_38;
        v28 = v33;
        v7 = v53;
        if ((v32 & 1) == 0)
        {
LABEL_20:
          v7[(v28 >> 6) + 8] |= 1 << v28;
          v36 = (uint64_t *)(v7[6] + 16 * v28);
          *v36 = v8;
          v36[1] = v9;
          sub_1B699ED14(&v46, (_OWORD *)(v7[7] + 32 * v28));
          v37 = v7[2];
          v38 = __OFADD__(v37, 1);
          v39 = v37 + 1;
          if (v38)
            goto LABEL_37;
LABEL_27:
          v7[2] = v39;
          swift_bridgeObjectRetain();
          goto LABEL_28;
        }
      }
      v35 = (_OWORD *)(v7[7] + 32 * v28);
      goto LABEL_24;
    }
    v45 = 0;
    v48 = MEMORY[0x1E0DEAFA0];
    LOBYTE(v47) = v13 & 1;
    sub_1B699ED14(&v47, &v46);
    swift_bridgeObjectRetain();
    v15 = swift_isUniquelyReferenced_nonNull_native();
    v53 = v7;
    v17 = sub_1B699E8D4(v8, v9);
    v18 = v7[2];
    v19 = (v16 & 1) == 0;
    v20 = v18 + v19;
    if (__OFADD__(v18, v19))
      break;
    v21 = v16;
    if (v7[3] >= v20)
    {
      if ((v15 & 1) != 0)
      {
        v7 = v53;
        if ((v16 & 1) == 0)
          goto LABEL_26;
      }
      else
      {
        sub_1B69A4D18();
        v7 = v53;
        if ((v21 & 1) == 0)
          goto LABEL_26;
      }
    }
    else
    {
      sub_1B699EA18(v20, v15);
      v22 = sub_1B699E8D4(v8, v9);
      if ((v21 & 1) != (v23 & 1))
        goto LABEL_38;
      v17 = v22;
      v7 = v53;
      if ((v21 & 1) == 0)
      {
LABEL_26:
        v7[(v17 >> 6) + 8] |= 1 << v17;
        v40 = (uint64_t *)(v7[6] + 16 * v17);
        *v40 = v8;
        v40[1] = v9;
        sub_1B699ED14(&v46, (_OWORD *)(v7[7] + 32 * v17));
        v41 = v7[2];
        v38 = __OFADD__(v41, 1);
        v39 = v41 + 1;
        if (v38)
          goto LABEL_36;
        goto LABEL_27;
      }
    }
    v35 = (_OWORD *)(v7[7] + 32 * v17);
LABEL_24:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v35);
    sub_1B699ED14(&v46, v35);
LABEL_28:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 += 32;
    v5 = v44 - 1;
    if (v44 == 1)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v7;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  __break(1u);
LABEL_37:
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
LABEL_38:
  result = sub_1B69CA71C();
  __break(1u);
  return result;
}

uint64_t initializeWithCopy for AnyDecodableKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_1B699E8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B69CA770();
  sub_1B69CA29C();
  v4 = sub_1B69CA788();
  return sub_1B699E938(a1, a2, v4);
}

unint64_t sub_1B699E938(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1B69CA68C() & 1) == 0)
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
      while (!v14 && (sub_1B69CA68C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1B699EA18(uint64_t a1, char a2)
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
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA28);
  v6 = sub_1B69CA50C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1B699ED14(v24, v35);
      }
      else
      {
        sub_1B699BBEC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1B69CA770();
      sub_1B69CA29C();
      result = sub_1B69CA788();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_1B699ED14(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_1B699ED14(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1B699ED24()
{
  unint64_t result;

  result = qword_1ED52FA18;
  if (!qword_1ED52FA18)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for AnyDecodableKeys, &type metadata for AnyDecodableKeys);
    atomic_store(result, (unint64_t *)&qword_1ED52FA18);
  }
  return result;
}

void sub_1B699ED68(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B69BA414(a1, a2, a3, a4, (uint64_t)sub_1B6996790, (void (*)(_QWORD *, char *, uint64_t, id *, _QWORD *, uint64_t, uint64_t))sub_1B699EDD8);
}

uint64_t sub_1B699ED8C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B699EDD8(_QWORD *a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  _BYTE *v19;
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
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  char *v51;
  _BYTE *v52;
  _BYTE v53[48];
  int v54;
  uint64_t v55;

  v42[3] = a7;
  v42[2] = a6;
  v42[1] = a5;
  v42[4] = a4;
  v52 = a3;
  v49 = a2;
  v43 = sub_1B69C9F0C();
  v46 = *(_QWORD *)(v43 - 8);
  v8 = MEMORY[0x1E0C80A78](v43);
  v44 = (uint64_t)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v45 = (int64_t)v42 - v11;
  MEMORY[0x1E0C80A78](v10);
  v51 = (char *)v42 - v12;
  v13 = sub_1B69CA068();
  v47 = *(_QWORD *)(v13 - 8);
  v14 = v47;
  v48 = v13;
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (int *)type metadata accessor for FMNRequest(0);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1[3];
  v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v21);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v20 + 40))(&v55, v21, v20);
  v54 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v49, v13);
  v22 = a1[3];
  v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v22, v23);
  v26 = v25;
  v27 = (uint64_t)&v52[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential];
  swift_beginAccess();
  sub_1B699D610(v27, (uint64_t)v53, &qword_1ED52FCD8);
  v29 = a1[3];
  v28 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v29);
  v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 16))(v29, v28);
  *v19 = v54;
  (*(void (**)(_BYTE *, char *, uint64_t))(v47 + 32))(&v19[v17[5]], v16, v48);
  v31 = (uint64_t *)&v19[v17[6]];
  *v31 = v24;
  v31[1] = v26;
  sub_1B699F590((uint64_t)v53, (uint64_t)&v19[v17[8]]);
  *(_QWORD *)&v19[v17[7]] = v30;
  v32 = a1[3];
  v33 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v32);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v33 + 48))(v32, v33) & 1) == 0)
  {
    v34 = v44;
    v36 = v50;
    sub_1B699F7A4(v44);
    if (v36)
      return sub_1B699F3DC((uint64_t)v19, type metadata accessor for FMNRequest);
LABEL_5:
    v52 = v19;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v51, v34, v43);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v37 = swift_allocObject();
    v50 = xmmword_1B69CADE0;
    *(_OWORD *)(v37 + 16) = xmmword_1B69CADE0;
    v38 = a1[3];
    v39 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v38);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v39);
    __asm { BR              X10 }
  }
  v34 = v45;
  v35 = v50;
  sub_1B69BA950(v45);
  if (!v35)
    goto LABEL_5;
  return sub_1B699F3DC((uint64_t)v19, type metadata accessor for FMNRequest);
}

unint64_t sub_1B699F398()
{
  unint64_t result;

  result = qword_1ED52FEC0;
  if (!qword_1ED52FEC0)
  {
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED52FEC0);
  }
  return result;
}

uint64_t sub_1B699F3DC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for FMNRequest(uint64_t a1)
{
  return sub_1B699DAC4(a1, qword_1ED52FC30);
}

id sub_1B699F42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **v3;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];

  v6 = *v3;
  v7 = (void *)sub_1B69C9EAC();
  v11[4] = a2;
  v11[5] = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1B6996294;
  v11[3] = &block_descriptor_3;
  v8 = _Block_copy(v11);
  swift_retain();
  v9 = objc_msgSend(v6, sel_dataTaskWithRequest_completionHandler_, v7, v8);

  _Block_release(v8);
  swift_release();
  return v9;
}

uint64_t destroy for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_1B69CA1AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_1B69CA104();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

void FMNRequestContentRepresentable.method.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1B699F590(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FCD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B699F5D8(uint64_t a1)
{
  char *v1;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[2];

  v12[0] = 0;
  v12[1] = 0;
  v3 = *(NSObject **)&v1[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue];
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = v12;
  v4[3] = v1;
  v4[4] = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1B6996644;
  *(_QWORD *)(v5 + 24) = v4;
  v11[4] = sub_1B6996390;
  v11[5] = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1B6996370;
  v11[3] = &block_descriptor_38;
  v6 = _Block_copy(v11);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v12[0];
    swift_release();
    return v10;
  }
  return result;
}

uint64_t sub_1B699F71C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = a1 + a2[5];
  v5 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_1B699DB18(*(_QWORD *)(a1 + a2[6]), *(_QWORD *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease();
  result = a1 + a2[8];
  if (*(_QWORD *)(result + 24))
    return __swift_destroy_boxed_opaque_existential_0Tm(result);
  return result;
}

uint64_t sub_1B699F7A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  uint64_t v36;
  int64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  __int128 v42;
  uint64_t v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v3 = v1;
  v5 = sub_1B69CA068();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for FMNRequest(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3 + v9[5], v5);
  sub_1B69C9EC4();
  sub_1B69C9EA0();
  sub_1B69C9EDC();
  v11 = v10;
  swift_bridgeObjectRelease();
  if (!v11)
    sub_1B69C9F00();
  sub_1B69C9EDC();
  v13 = v12;
  swift_bridgeObjectRelease();
  if (!v13)
    sub_1B69C9F00();
  sub_1B69A00B4(v3 + v9[8], (uint64_t)&v42);
  v47 = v3;
  v41 = v9;
  if (!v43)
  {
    v40 = v2;
    sub_1B6999FB0((uint64_t)&v42, &qword_1ED52FCD8);
    goto LABEL_29;
  }
  sub_1B69970A0(&v42, (uint64_t)v44);
  v14 = v45;
  v15 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 56))(v14, v15);
  if (!*(_QWORD *)(result + 16))
  {
    swift_bridgeObjectRelease();
    sub_1B69B2430();
    swift_allocError();
    *v38 = 1;
    swift_willThrow();
    v39 = sub_1B69C9F0C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 8))(a1, v39);
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  }
  v40 = v2;
  v17 = 0;
  v18 = result + 64;
  v19 = 1 << *(_BYTE *)(result + 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v21 = v20 & *(_QWORD *)(result + 64);
  v22 = (unint64_t)(v19 + 63) >> 6;
  while (1)
  {
    if (v21)
    {
      v21 &= v21 - 1;
      goto LABEL_11;
    }
    v23 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    if (v23 >= v22)
      goto LABEL_27;
    v24 = *(_QWORD *)(v18 + 8 * v23);
    ++v17;
    if (!v24)
    {
      v17 = v23 + 1;
      if (v23 + 1 >= v22)
        goto LABEL_27;
      v24 = *(_QWORD *)(v18 + 8 * v17);
      if (!v24)
      {
        v17 = v23 + 2;
        if (v23 + 2 >= v22)
          goto LABEL_27;
        v24 = *(_QWORD *)(v18 + 8 * v17);
        if (!v24)
          break;
      }
    }
LABEL_26:
    v21 = (v24 - 1) & v24;
LABEL_11:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B69C9F00();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v25 = v23 + 3;
  if (v25 >= v22)
    goto LABEL_27;
  v24 = *(_QWORD *)(v18 + 8 * v25);
  if (v24)
  {
    v17 = v25;
    goto LABEL_26;
  }
  while (1)
  {
    v17 = v25 + 1;
    if (__OFADD__(v25, 1))
      goto LABEL_54;
    if (v17 >= v22)
      break;
    v24 = *(_QWORD *)(v18 + 8 * v17);
    ++v25;
    if (v24)
      goto LABEL_26;
  }
LABEL_27:
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  v3 = v47;
  v9 = v41;
LABEL_29:
  v26 = *(_QWORD *)(v3 + v9[7]);
  v29 = *(_QWORD *)(v26 + 64);
  v28 = v26 + 64;
  v27 = v29;
  v30 = 1 << *(_BYTE *)(*(_QWORD *)(v3 + v9[7]) + 32);
  v31 = -1;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  v32 = v31 & v27;
  v33 = (unint64_t)(v30 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v34 = 0;
  while (2)
  {
    if (v32)
    {
      v32 &= v32 - 1;
LABEL_33:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B69C9F00();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  v35 = v34 + 1;
  if (__OFADD__(v34, 1))
  {
    __break(1u);
    goto LABEL_52;
  }
  if (v35 >= v33)
    goto LABEL_49;
  v36 = *(_QWORD *)(v28 + 8 * v35);
  ++v34;
  if (v36)
    goto LABEL_48;
  v34 = v35 + 1;
  if (v35 + 1 >= v33)
    goto LABEL_49;
  v36 = *(_QWORD *)(v28 + 8 * v34);
  if (v36)
    goto LABEL_48;
  v34 = v35 + 2;
  if (v35 + 2 >= v33)
    goto LABEL_49;
  v36 = *(_QWORD *)(v28 + 8 * v34);
  if (v36)
  {
LABEL_48:
    v32 = (v36 - 1) & v36;
    goto LABEL_33;
  }
  v37 = v35 + 3;
  if (v37 >= v33)
  {
LABEL_49:
    swift_release();
    sub_1B699D90C(*(_QWORD *)(v47 + v41[6]), *(_QWORD *)(v47 + v41[6] + 8));
    return sub_1B69C9EF4();
  }
  v36 = *(_QWORD *)(v28 + 8 * v37);
  if (v36)
  {
    v34 = v37;
    goto LABEL_48;
  }
  while (1)
  {
    v34 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v34 >= v33)
      goto LABEL_49;
    v36 = *(_QWORD *)(v28 + 8 * v34);
    ++v37;
    if (v36)
      goto LABEL_48;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

unint64_t sub_1B699FD08()
{
  return sub_1B699FD28();
}

unint64_t sub_1B699FD28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  unint64_t v13;
  _BYTE v15[64];
  uint64_t v16;
  unint64_t v17;

  v1 = sub_1B69CA278();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  v5 = *(_QWORD *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 32);
  v17 = v5;
  swift_bridgeObjectRetain();
  sub_1B69CA2A8();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  sub_1B69CA26C();
  v6 = sub_1B69CA254();
  v8 = v7;
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
  if (v8 >> 60 == 15)
  {
    sub_1B69CA368();
    sub_1B69A0A18();
    v9 = (void *)sub_1B69CA3E0();
    v10 = MEMORY[0x1E0DEE9D8];
    sub_1B69CA11C();

    inited = v10;
  }
  else
  {
    sub_1B69CA0A4();
    sub_1B699FF80(v6, v8);
    v16 = 0x206369736142;
    v17 = 0xE600000000000000;
    sub_1B69CA2A8();
    swift_bridgeObjectRelease();
    v12 = v16;
    v13 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF18);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B69CADE0;
    strcpy((char *)(inited + 32), "Authorization");
    *(_WORD *)(inited + 46) = -4864;
    *(_QWORD *)(inited + 48) = v12;
    *(_QWORD *)(inited + 56) = v13;
  }
  return sub_1B699FF94(inited);
}

unint64_t sub_1B699FF3C()
{
  unint64_t result;

  result = qword_1ED52FEB0;
  if (!qword_1ED52FEB0)
  {
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED52FEB0);
  }
  return result;
}

uint64_t sub_1B699FF80(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B699DB18(a1, a2);
  return a1;
}

unint64_t sub_1B699FF94(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF08);
  v2 = (_QWORD *)sub_1B69CA518();
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
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1B699E8D4(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_1B69A00B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FCD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B69A00FC()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B69CA068();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B69C9F0C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v0, v8);
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_1B69C9ED0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1B6999FB0((uint64_t)v3, (uint64_t *)&unk_1ED52FC08);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_1B69CA020();
    v15 = 0x203A4C5255;
    v16 = 0xE500000000000000;
    sub_1B69CA2A8();
    swift_bridgeObjectRelease();
    sub_1B69CA2A8();
    swift_bridgeObjectRelease();
    sub_1B69CA2A8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v12 = sub_1B69C9EB8();
  if (v12)
  {
    v13 = *(_QWORD *)(v12 + 16);
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v15 = v13;
  sub_1B69CA5E4();
  v15 = 0x3A73726564616548;
  v16 = 0xE900000000000020;
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v17;
}

void sub_1B69A033C(uint64_t a1, void *a2, uint64_t a3, NSObject *a4, uint64_t a5)
{
  uint64_t v9;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  if (FMNAccountType.rawValue.getter() == 1701736302 && v9 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      if (!a2)
      {
        sub_1B69A0A18();
        v18 = (void *)sub_1B69CA3E0();
        sub_1B69CA374();
        sub_1B69CA110();

        if (!a1)
          goto LABEL_11;
        goto LABEL_8;
      }
      v12 = a2;
      sub_1B69CA368();
      sub_1B69A0A18();
      v13 = (void *)sub_1B69CA3E0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1B69CADE0;
      swift_getErrorValue();
      v15 = sub_1B69CA728();
      v17 = v16;
      *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v14 + 64) = sub_1B699F398();
      *(_QWORD *)(v14 + 32) = v15;
      *(_QWORD *)(v14 + 40) = v17;
      sub_1B69CA11C();

      swift_bridgeObjectRelease();
      if (a1)
      {
LABEL_8:
        swift_beginAccess();
        *(_QWORD *)(a5 + 16) = a1;
        swift_retain();
        swift_release();
      }
    }
  }
LABEL_11:
  dispatch_group_leave(a4);
}

void sub_1B69A0558(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  char isEscapingClosureAtFileLocation;
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
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[6];
  _OWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38[3];
  uint64_t v39;
  uint64_t v40;

  v7 = sub_1B69C9FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, a1, v7);
  sub_1B699D610(a2, (uint64_t)v38, &qword_1ED52FCD0);
  v8 = v38[0];
  if (v38[0])
  {
    v36 = 0;
    v37 = 0;
    sub_1B69A0A54((uint64_t)v38, (uint64_t)v34);
    v9 = swift_allocObject();
    v10 = v34[1];
    *(_OWORD *)(v9 + 16) = v34[0];
    *(_OWORD *)(v9 + 32) = v10;
    *(_OWORD *)(v9 + 48) = v34[2];
    *(_QWORD *)(v9 + 64) = v35;
    *(_QWORD *)(v9 + 72) = &v36;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = sub_1B69963D8;
    *(_QWORD *)(v11 + 24) = v9;
    v33[4] = sub_1B6996390;
    v33[5] = v11;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 1107296256;
    v33[2] = sub_1B6996370;
    v33[3] = &block_descriptor;
    v12 = _Block_copy(v33);
    swift_retain();
    swift_release();
    dispatch_sync(v8, v12);
    _Block_release(v12);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
    {
      __break(1u);
      goto LABEL_14;
    }
    v14 = v37;
    swift_release();
    sub_1B6999FEC(v38);
    if (v14)
    {
      sub_1B69C9FB4();
      sub_1B69CA374();
      if (qword_1EF13D5E0 == -1)
      {
LABEL_5:
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
        v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_1B69CADE0;
        sub_1B699AEC4((unint64_t *)&qword_1ED52FC00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], MEMORY[0x1E0CAE8A0]);
        v16 = sub_1B69CA5E4();
        v18 = v17;
        *(_QWORD *)(v15 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v15 + 64) = sub_1B699F398();
        *(_QWORD *)(v15 + 32) = v16;
        *(_QWORD *)(v15 + 40) = v18;
        sub_1B69CA11C();
        swift_bridgeObjectRelease();
        return;
      }
LABEL_14:
      swift_once();
      goto LABEL_5;
    }
  }
  else
  {
    sub_1B6999FB0((uint64_t)v38, &qword_1ED52FCD0);
  }
  v19 = *(_QWORD *)(v3 + 32);
  if (!v19)
    goto LABEL_11;
  v20 = v19 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1B699D610(v20, (uint64_t)v38, &qword_1ED52FCD8);
  v21 = v39;
  if (!v39)
  {
    sub_1B6999FB0((uint64_t)v38, &qword_1ED52FCD8);
LABEL_11:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1B69CADE0;
    v38[0] = (id)sub_1B69C9FA8();
    v38[1] = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA50);
    v30 = sub_1B69CA284();
    v32 = v31;
    *(_QWORD *)(v28 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v28 + 64) = sub_1B699F398();
    *(_QWORD *)(v28 + 32) = v30;
    *(_QWORD *)(v28 + 40) = v32;
    sub_1B69A0A18();
    v27 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();
    goto LABEL_12;
  }
  v22 = v40;
  __swift_project_boxed_opaque_existential_1(v38, v39);
  (*(void (**)(uint64_t, uint64_t))(v22 + 72))(v21, v22);
  sub_1B6999FB0((uint64_t)v38, &qword_1ED52FCD8);
  sub_1B69C9FB4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1B69CADE0;
  sub_1B699AEC4((unint64_t *)&qword_1ED52FC00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], MEMORY[0x1E0CAE8A0]);
  v24 = sub_1B69CA5E4();
  v26 = v25;
  *(_QWORD *)(v23 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v23 + 64) = sub_1B699F398();
  *(_QWORD *)(v23 + 32) = v24;
  *(_QWORD *)(v23 + 40) = v26;
  sub_1B69A0A18();
  v27 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
LABEL_12:
  swift_bridgeObjectRelease();

}

unint64_t sub_1B69A0A18()
{
  unint64_t result;

  result = qword_1ED530470;
  if (!qword_1ED530470)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED530470);
  }
  return result;
}

uint64_t sub_1B69A0A54(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for FMNRedirectHostStore(a2, a1);
  return a2;
}

uint64_t initializeWithCopy for FMNRedirectHostStore(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  id v10;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = a1 + 8;
  v6 = a2 + 8;
  v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  v10 = v4;
  v9(v5, v6, v8);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t sub_1B69A0B08()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t _s12FMNetworking27FMNAuthenticationCredentialC2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  swift_beginAccess();
  v4 = a1[2];
  v5 = a1[3];
  swift_beginAccess();
  v6 = v4 == a2[2] && v5 == a2[3];
  if (v6 || (v7 = 0, (sub_1B69CA68C() & 1) != 0))
  {
    if ((swift_beginAccess(), v8 = a1[4], v9 = a1[5], swift_beginAccess(), v8 == a2[4]) && v9 == a2[5]
      || (v7 = 0, (sub_1B69CA68C() & 1) != 0))
    {
      if ((swift_beginAccess(), v10 = a1[6], v11 = a1[7], swift_beginAccess(), v10 == a2[6]) && v11 == a2[7]
        || (v7 = 0, (sub_1B69CA68C() & 1) != 0))
      {
        swift_beginAccess();
        swift_beginAccess();
        v12 = FMNAccountType.rawValue.getter();
        v14 = v13;
        if (v12 == FMNAccountType.rawValue.getter() && v14 == v15)
          v7 = 1;
        else
          v7 = sub_1B69CA68C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  return v7 & 1;
}

uint64_t FMNAccountType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69A0D58 + 4 * byte_1B69CB360[*v0]))(6712678, 0xE300000000000000);
}

uint64_t sub_1B69A0D58()
{
  return 0x707041666D66;
}

uint64_t sub_1B69A0D6C()
{
  return 1885957478;
}

uint64_t sub_1B69A0D7C()
{
  return 0x6972695370696D66;
}

uint64_t sub_1B69A0D94()
{
  return 0x7075746573;
}

uint64_t sub_1B69A0DA8()
{
  return 0x6150686372616573;
}

uint64_t sub_1B69A0DCC()
{
  return 0x4C676E6972696170;
}

uint64_t sub_1B69A0DEC()
{
  return 0x726F737365636361;
}

unint64_t sub_1B69A0E08()
{
  return 0xD000000000000013;
}

uint64_t sub_1B69A0E28()
{
  return 0x7373656363413277;
}

unint64_t sub_1B69A0E48()
{
  return 0xD000000000000014;
}

uint64_t sub_1B69A0E94()
{
  return 0x726168536D657469;
}

uint64_t sub_1B69A0EB4()
{
  return 1701736302;
}

uint64_t sub_1B69A0EC4@<X0>(__int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  _QWORD v12[2];

  v4 = sub_1B69CA398();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1B69CA158();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1B69CA3A4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF8D8], v7);
  sub_1B69CA14C();
  v12[1] = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED530450, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED530430);
  sub_1B699AF04((unint64_t *)&qword_1ED530440, (uint64_t *)&unk_1ED530430);
  sub_1B69CA434();
  *a2 = sub_1B69CA3C8();
  sub_1B69970A0(a1, (uint64_t)(a2 + 1));
  sub_1B69C9F48();
  swift_allocObject();
  result = sub_1B69C9F3C();
  a2[6] = result;
  return result;
}

uint64_t sub_1B69A10C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];
  _OWORD v23[3];
  uint64_t v24;

  v6 = v3;
  v7 = sub_1B69CA134();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v20 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B69CA158();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *v6;
  sub_1B69A0A54((uint64_t)v6, (uint64_t)v23);
  v15 = swift_allocObject();
  v16 = v23[1];
  *(_OWORD *)(v15 + 16) = v23[0];
  *(_OWORD *)(v15 + 32) = v16;
  *(_OWORD *)(v15 + 48) = v23[2];
  *(_QWORD *)(v15 + 64) = v24;
  aBlock[4] = a2;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = a3;
  v17 = _Block_copy(aBlock);
  sub_1B69CA14C();
  v21 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, v8, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v14, v10, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

Swift::Void __swiftcall FMNRedirectHostStore.clearRedirectedHostKeychainItemsIfNeeded()()
{
  sub_1B69A10C0((uint64_t)&unk_1E6A25958, (uint64_t)sub_1B6999800, (uint64_t)&block_descriptor_2);
}

uint64_t sub_1B69A12DC(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v28 = a1;
  v5 = sub_1B69CA134();
  v31 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B69CA158();
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B69CA140();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  v16 = (uint64_t *)(a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  v17 = *v16;
  if (*v16)
  {
    v18 = v16[1];
    sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
    v27 = v5;
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF540], v11);
    _Block_copy(a3);
    sub_1B69A1624(v17);
    v26 = sub_1B69CA3D4();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v17;
    v19[3] = v18;
    v20 = v28;
    v19[4] = v28;
    v19[5] = sub_1B6999A2C;
    v19[6] = v15;
    aBlock[4] = sub_1B69BB7D8;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B6997130;
    aBlock[3] = &block_descriptor_29;
    v21 = _Block_copy(aBlock);
    sub_1B69A1624(v17);
    v22 = v20;
    swift_retain();
    sub_1B69CA14C();
    v32 = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
    v23 = v27;
    sub_1B69CA434();
    v24 = (void *)v26;
    MEMORY[0x1BCC9A3EC](0, v10, v7, v21);
    _Block_release(v21);

    sub_1B6996708(v17);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v23);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
    swift_release();
  }
  else
  {
    _Block_copy(a3);
    a3[2](a3, 1, 0);
  }
  return swift_release();
}

uint64_t sub_1B69A1624(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

id sub_1B69A1634(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint64_t v26;

  v23 = a2;
  v24 = a1;
  v3 = sub_1B69CA398();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v3);
  v5 = sub_1B69CA158();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1B69CA3A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback];
  *(_QWORD *)v11 = 0xD00000000000001ELL;
  *((_QWORD *)v11 + 1) = 0x80000001B69CEF40;
  *(_QWORD *)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_httpSuccessCodeMin] = 200;
  *(_QWORD *)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_httpSuccessCodeMax] = 299;
  v12 = (uint64_t)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential];
  *(_OWORD *)v12 = 0u;
  *(_OWORD *)(v12 + 16) = 0u;
  *(_QWORD *)(v12 + 32) = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlers] = MEMORY[0x1E0DEE9E0];
  v22 = OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue;
  v21[1] = sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF8D8], v6);
  v13 = v2;
  sub_1B69CA14C();
  v26 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED530450, v4, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED530430);
  sub_1B699AF44((unint64_t *)&qword_1ED530440, (uint64_t *)&unk_1ED530430, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  *(_QWORD *)&v2[v22] = sub_1B69CA3C8();
  v14 = &v13[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session];
  *((_QWORD *)v14 + 4) = 0;
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v15 = OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_sessionLock;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBF0);
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = 0;
  *(_QWORD *)&v13[v15] = v16;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_urlSessionFactory] = v23;
  swift_beginAccess();
  swift_retain();
  v17 = v24;
  sub_1B69A1964(v24, v12);
  swift_endAccess();

  v18 = (objc_class *)type metadata accessor for FMNHttpClient();
  v25.receiver = v13;
  v25.super_class = v18;
  v19 = objc_msgSendSuper2(&v25, sel_init);
  sub_1B6999FB0(v17, &qword_1ED52FCD8);
  return v19;
}

uint64_t sub_1B69A1964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FCD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t FMNServerInteractionController.init(authenticationProvider:mockingPreferences:urlSessionFactory:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
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
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = v4;
  v28 = a4;
  v29 = a1;
  v30 = a2;
  v27 = sub_1B69CA3A4();
  v7 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B69CA398();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v10);
  v12 = sub_1B69CA158();
  MEMORY[0x1E0C80A78](v12);
  v13 = *a3;
  v14 = a3[2];
  v25 = a3[1];
  v26 = v13;
  v24 = a3[3];
  *(_QWORD *)(v4 + 32) = 0;
  sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  sub_1B69CA14C();
  v31 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED530450, v11, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED530430);
  sub_1B69A1C08();
  sub_1B69CA434();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF8D0], v27);
  v16 = v24;
  v15 = v25;
  v17 = sub_1B69CA3C8();
  v18 = v26;
  v19 = v28;
  v20 = v29;
  *(_QWORD *)(v5 + 40) = v17;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  *(_OWORD *)(v5 + 80) = 0u;
  v21 = v30;
  *(_QWORD *)(v5 + 16) = v20;
  *(_QWORD *)(v5 + 24) = v21;
  *(_QWORD *)(v5 + 96) = 0;
  *(_QWORD *)(v5 + 104) = v18;
  *(_QWORD *)(v5 + 112) = v15;
  *(_QWORD *)(v5 + 120) = v14;
  *(_QWORD *)(v5 + 128) = v16;
  if (v19)
  {
    *(_QWORD *)(v5 + 136) = v19;
  }
  else
  {
    type metadata accessor for FMNURLSessionFactory();
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = sub_1B69B5600;
    v22[3] = 0;
    v22[4] = v18;
    v22[5] = v15;
    v22[6] = v14;
    v22[7] = v16;
    *(_QWORD *)(v5 + 136) = v22;
    sub_1B69A1C54(v18, v15);
  }
  return v5;
}

unint64_t sub_1B69A1C08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED530440;
  if (!qword_1ED530440)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED530430);
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED530440);
  }
  return result;
}

uint64_t sub_1B69A1C54(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t type metadata accessor for FMNURLSessionFactory()
{
  return objc_opt_self();
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

uint64_t block_destroy_helper_5()
{
  return swift_release();
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

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1B69A1D54(uint64_t a1)
{
  uint64_t v1;

  return sub_1B699C83C(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t dispatch thunk of FMNServerInteractionController.sendRequest(endpoint:content:source:responseHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t getEnumTagSinglePayload for FMNMockingPreferences(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t dispatch thunk of FMNHTTPRequest.accountType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

_BYTE *sub_1B69A1DBC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FMNAccountType()
{
  return &type metadata for FMNAccountType;
}

ValueMetadata *type metadata accessor for FMNMockingPreferences()
{
  return &type metadata for FMNMockingPreferences;
}

uint64_t type metadata accessor for FMNHTTPRequest()
{
  uint64_t result;

  result = qword_1ED52FA68;
  if (!qword_1ED52FA68)
    return swift_getSingletonMetadata();
  return result;
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1BCC9AB54](a1, v6, a5);
}

void sub_1B69A1E80(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1B69A1E80(a1, &qword_1ED52FBE8);
}

uint64_t sub_1B69A1ED8()
{
  uint64_t result;

  sub_1B69A0A18();
  result = sub_1B69CA3EC();
  qword_1ED530788 = result;
  return result;
}

void sub_1B69A1F28()
{
  unint64_t v0;

  sub_1B6995870(319, &qword_1ED530060, (void (*)(uint64_t))type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_1B69A1FC8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for FMNHTTPClientStatusCodeHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FMNHTTPClientStatusCodeHandler);
}

uint64_t storeEnumTagSinglePayload for FMNMockingPreferences(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNRedirectHostStore()
{
  return &type metadata for FMNRedirectHostStore;
}

ValueMetadata *type metadata accessor for AnyDecodableKeys()
{
  return &type metadata for AnyDecodableKeys;
}

unint64_t sub_1B69A2044()
{
  unint64_t result;

  result = qword_1ED52FA10;
  if (!qword_1ED52FA10)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for AnyDecodableKeys, &type metadata for AnyDecodableKeys);
    atomic_store(result, (unint64_t *)&qword_1ED52FA10);
  }
  return result;
}

unint64_t sub_1B69A2088()
{
  unint64_t result;

  result = qword_1ED52FA08;
  if (!qword_1ED52FA08)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for AnyDecodableKeys, &type metadata for AnyDecodableKeys);
    atomic_store(result, (unint64_t *)&qword_1ED52FA08);
  }
  return result;
}

uint64_t AnyDecodableKeys.stringValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnyDecodableKeys.stringValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AnyDecodableKeys.stringValue.modify())()
{
  return nullsub_1;
}

FMNetworking::AnyDecodableKeys __swiftcall AnyDecodableKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v1;
  FMNetworking::AnyDecodableKeys result;

  *(Swift::String *)v1 = stringValue;
  *(_QWORD *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 24) = 1;
  result.stringValue = stringValue;
  return result;
}

uint64_t AnyDecodableKeys.intValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t AnyDecodableKeys.intValue.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*AnyDecodableKeys.intValue.modify())()
{
  return nullsub_1;
}

FMNetworking::AnyDecodableKeys_optional __swiftcall AnyDecodableKeys.init(intValue:)(Swift::Int intValue)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  Swift::Int v6;
  Swift::Bool v7;
  FMNetworking::AnyDecodableKeys_optional result;

  v3 = v1;
  v4 = sub_1B69CA5E4();
  *(_QWORD *)v3 = v4;
  *(_QWORD *)(v3 + 8) = v5;
  *(_QWORD *)(v3 + 16) = intValue;
  *(_BYTE *)(v3 + 24) = 0;
  result.value.intValue.value = v6;
  result.value.stringValue._object = v5;
  result.value.stringValue._countAndFlagsBits = v4;
  result.value.intValue.is_nil = v7;
  return result;
}

uint64_t sub_1B69A21D8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_1B69A21E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = sub_1B69CA5E4();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = a1;
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_1B69A223C()
{
  sub_1B699ED24();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69A2264()
{
  sub_1B699ED24();
  return sub_1B69CA7D0();
}

uint64_t KeyedDecodingContainer.decode(_:)(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v38;
  char v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  _QWORD *v64;
  _OWORD v65[2];
  __int128 v66;
  uint64_t v67;

  v3 = v2;
  v4 = v1;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x1E0C80A78](a1);
  v61 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v63 = (char *)&v54 - v10;
  v11 = sub_1B69CA590();
  if (!MEMORY[0x1BCC9A374](v11, v6))
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  v55 = v8;
  v12 = 0;
  v13 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v56 = v4;
  v57 = a1;
  v59 = v7;
  v60 = v6;
  v58 = v11;
  while (1)
  {
    v16 = sub_1B69CA32C();
    sub_1B69CA314();
    if ((v16 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v63, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v12, v6);
    }
    else
    {
      v52 = sub_1B69CA4C4();
      if (v55 != 8)
        goto LABEL_41;
      *(_QWORD *)&v66 = v52;
      (*(void (**)(char *, __int128 *, uint64_t))(v7 + 16))(v63, &v66, v6);
      swift_unknownObjectRelease();
    }
    if (__OFADD__(v12, 1))
      break;
    v62 = v12 + 1;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v61, v63, v6);
    v17 = sub_1B69CA560();
    if (v3)
    {

      v3 = 0;
      v31 = sub_1B69CA554();
      v33 = v32;
      v34 = sub_1B69CA7B8();
      v36 = v35;
      v67 = MEMORY[0x1E0DEA968];
      *(_QWORD *)&v66 = v31;
      *((_QWORD *)&v66 + 1) = v33;
      sub_1B699ED14(&v66, v65);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v64 = v13;
      v38 = sub_1B699E8D4(v34, v36);
      v24 = v38;
      v40 = v13[2];
      v41 = (v39 & 1) == 0;
      v42 = v40 + v41;
      if (__OFADD__(v40, v41))
        goto LABEL_38;
      v43 = v39;
      if (v13[3] >= v42)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_1B69A4D18();
      }
      else
      {
        sub_1B699EA18(v42, isUniquelyReferenced_nonNull_native);
        v44 = sub_1B699E8D4(v34, v36);
        if ((v43 & 1) != (v45 & 1))
          goto LABEL_42;
        v24 = v44;
      }
      v7 = v59;
      v13 = v64;
      if ((v43 & 1) == 0)
      {
        v64[(v24 >> 6) + 8] |= 1 << v24;
        v50 = (uint64_t *)(v13[6] + 16 * v24);
        *v50 = v34;
        v50[1] = v36;
        sub_1B699ED14(v65, (_OWORD *)(v13[7] + 32 * v24));
        v51 = v13[2];
        v48 = __OFADD__(v51, 1);
        v49 = v51 + 1;
        if (v48)
          goto LABEL_40;
LABEL_30:
        v13[2] = v49;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
    else
    {
      v18 = v17;
      v19 = sub_1B69CA7B8();
      v21 = v20;
      v67 = MEMORY[0x1E0DEAFA0];
      LOBYTE(v66) = v18 & 1;
      sub_1B699ED14(&v66, v65);
      v22 = swift_isUniquelyReferenced_nonNull_native();
      v64 = v13;
      v24 = sub_1B699E8D4(v19, v21);
      v25 = v13[2];
      v26 = (v23 & 1) == 0;
      v27 = v25 + v26;
      if (__OFADD__(v25, v26))
        goto LABEL_37;
      v28 = v23;
      if (v13[3] >= v27)
      {
        if ((v22 & 1) == 0)
          sub_1B69A4D18();
      }
      else
      {
        sub_1B699EA18(v27, v22);
        v29 = sub_1B699E8D4(v19, v21);
        if ((v28 & 1) != (v30 & 1))
          goto LABEL_42;
        v24 = v29;
      }
      v7 = v59;
      v13 = v64;
      if ((v28 & 1) == 0)
      {
        v64[(v24 >> 6) + 8] |= 1 << v24;
        v46 = (uint64_t *)(v13[6] + 16 * v24);
        *v46 = v19;
        v46[1] = v21;
        sub_1B699ED14(v65, (_OWORD *)(v13[7] + 32 * v24));
        v47 = v13[2];
        v48 = __OFADD__(v47, 1);
        v49 = v47 + 1;
        if (v48)
          goto LABEL_39;
        goto LABEL_30;
      }
    }
    v14 = (_OWORD *)(v13[7] + 32 * v24);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
    sub_1B699ED14(v65, v14);
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = v60;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v61, v60);
    v11 = v58;
    v15 = MEMORY[0x1BCC9A374](v58, v6);
    ++v12;
    if (v62 == v15)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
  __break(1u);
LABEL_40:
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  result = sub_1B69CA71C();
  __break(1u);
  return result;
}

char *KeyedDecodingContainer.decode(_:forKey:)()
{
  char *v0;
  uint64_t v1;
  _BYTE v3[24];
  uint64_t v4;

  sub_1B69CA530();
  if (!v1)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v3, v4);
    v0 = UnkeyedDecodingContainer.decode(_:)();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
  }
  return v0;
}

char *UnkeyedDecodingContainer.decode(_:)()
{
  void *v0;
  void *v1;
  char v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;

  v1 = v0;
  v2 = sub_1B69CA620();
  v3 = (char *)MEMORY[0x1E0DEE9D8];
  if ((v2 & 1) == 0)
  {
    v5 = MEMORY[0x1E0DEAFA0];
    v6 = MEMORY[0x1E0DEB070];
    do
    {
      v7 = sub_1B69CA608();
      if (v1)
      {

        sub_1B69CA614();
        v1 = 0;
        v12 = v6;
        *(_QWORD *)&v11 = v8;
      }
      else
      {
        v12 = v5;
        LOBYTE(v11) = v7 & 1;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_1B69A5500(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v10 = *((_QWORD *)v3 + 2);
      v9 = *((_QWORD *)v3 + 3);
      if (v10 >= v9 >> 1)
        v3 = sub_1B69A5500((char *)(v9 > 1), v10 + 1, 1, v3);
      *((_QWORD *)v3 + 2) = v10 + 1;
      sub_1B699ED14(&v11, &v3[32 * v10 + 32]);
    }
    while ((sub_1B69CA620() & 1) == 0);
  }
  return v3;
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA30);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B699ED24();
  v6 = sub_1B69CA5F0();
  if (!v1)
  {
    v0 = sub_1B699DE88(v6);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v0;
}

uint64_t KeyedEncodingContainerProtocol<>.encode(_:)(uint64_t a1)
{
  return sub_1B69A5B08(a1, (void (*)(_QWORD, _QWORD, _OWORD *))sub_1B69A5AEC);
}

uint64_t sub_1B69A2EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::OpaquePointer v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t inited;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  void *v42;
  _BYTE v43[40];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D5F8);
  v33 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x1E0C80A78](v9);
  v32 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v30 - v12;
  sub_1B699BBEC(a3, (uint64_t)v43);
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    v34 = a1;
    v35 = a2;
    v36 = 0;
    LOBYTE(v37) = 1;
    sub_1B69A5E5C();
    sub_1B69CA6D4();
    goto LABEL_5;
  }
  v31 = v9;
  v30 = v4;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v34 = a1;
    v35 = a2;
    v36 = 0;
    LOBYTE(v37) = 1;
    sub_1B69A5E5C();
    sub_1B69CA6EC();
    goto LABEL_5;
  }
  v15 = a1;
  if (swift_dynamicCast())
  {
    v34 = a1;
    v35 = a2;
    v36 = 0;
    LOBYTE(v37) = 1;
    sub_1B69A5E5C();
    sub_1B69CA6C8();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    v34 = a1;
    v35 = a2;
    v36 = 0;
    LOBYTE(v37) = 1;
    sub_1B69A5E5C();
    sub_1B69CA6E0();
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA20);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v16 = v38;
    v34 = a1;
    v35 = a2;
    v36 = 0;
    LOBYTE(v37) = 1;
    sub_1B69A5E5C();
    sub_1B699ED24();
    v17 = v31;
    v18 = sub_1B69CA6B0();
    MEMORY[0x1E0C80A78](v18);
    *(&v30 - 2) = (uint64_t)v13;
    sub_1B69A5B08(v16, (void (*)(_QWORD, _QWORD, _OWORD *))sub_1B69A5EA8);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v17);
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D5F0);
  if (swift_dynamicCast())
  {
    v19._rawValue = v42;
    v38 = a1;
    v39 = a2;
    v40 = 0;
    v41 = 1;
    sub_1B69A5E5C();
    sub_1B69CA6A4();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v34, v37);
    UnkeyedEncodingContainer.encode(_:)(v19);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v34);
    goto LABEL_15;
  }
  sub_1B699BBEC((uint64_t)v43, (uint64_t)&v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF58);
  swift_dynamicCast();
  if (v37)
  {
    sub_1B6999FB0((uint64_t)&v34, &qword_1ED52FF58);
    v20 = sub_1B69CA4DC();
    swift_allocError();
    v22 = v21;
    v30 = v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D640) + 48);
    sub_1B699BBEC(a3, v22);
    v23 = v33;
    v24 = v32;
    v25 = a4;
    v26 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v32, v25, v31);
    sub_1B69A5E5C();
    v27 = sub_1B69CA6BC();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D650);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B69CADE0;
    *(_QWORD *)(inited + 56) = &type metadata for AnyDecodableKeys;
    *(_QWORD *)(inited + 64) = sub_1B699ED24();
    v29 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v29;
    *(_QWORD *)(v29 + 16) = v15;
    *(_QWORD *)(v29 + 24) = a2;
    *(_QWORD *)(v29 + 32) = 0;
    *(_BYTE *)(v29 + 40) = 1;
    v34 = v27;
    sub_1B69A59AC((_QWORD *)inited);
    sub_1B69CA4D0();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x1E0DEC4B0], v20);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
  }
  v38 = a1;
  v39 = a2;
  v40 = 0;
  v41 = 1;
  sub_1B69A5E5C();
  sub_1B69CA6F8();
LABEL_5:
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
}

uint64_t sub_1B69A3518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t inited;
  uint64_t v21;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[3];
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[40];
  uint64_t v32;

  v32 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B699BBEC(v14, (uint64_t)v31);
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    v27 = a1;
    v28 = a2;
    v29 = 0;
    LOBYTE(v30) = 1;
    sub_1B69CA6D4();
    goto LABEL_5;
  }
  v24 = a6;
  if (swift_dynamicCast())
  {
    v27 = a1;
    v28 = a2;
    v29 = 0;
    LOBYTE(v30) = 1;
    sub_1B69CA6EC();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    v27 = a1;
    v28 = a2;
    v29 = 0;
    LOBYTE(v30) = 1;
    sub_1B69CA6C8();
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    v27 = a1;
    v28 = a2;
    v29 = 0;
    LOBYTE(v30) = 1;
    sub_1B69CA6E0();
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA20);
  if (swift_dynamicCast())
  {
    v27 = a1;
    v28 = a2;
    v29 = 0;
    LOBYTE(v30) = 1;
    KeyedEncodingContainerProtocol.encode(_:forKey:)(v25[0]);
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D5F0);
  if (swift_dynamicCast())
  {
    v27 = a1;
    v28 = a2;
    v29 = 0;
    LOBYTE(v30) = 1;
    KeyedEncodingContainerProtocol.encode(_:forKey:)(v25[0]);
    goto LABEL_9;
  }
  sub_1B699BBEC((uint64_t)v31, (uint64_t)v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF58);
  swift_dynamicCast();
  if (v30)
  {
    sub_1B6999FB0((uint64_t)&v27, &qword_1ED52FF58);
    v23 = sub_1B69CA4DC();
    swift_allocError();
    v17 = v16;
    v22[1] = v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D640) + 48);
    sub_1B699BBEC(a3, v17);
    v18 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v13, a4, a5);
    v19 = sub_1B69CA6BC();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v13, a5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D650);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B69CADE0;
    *(_QWORD *)(inited + 56) = &type metadata for AnyDecodableKeys;
    *(_QWORD *)(inited + 64) = sub_1B699ED24();
    v21 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v21;
    *(_QWORD *)(v21 + 16) = a1;
    *(_QWORD *)(v21 + 24) = a2;
    *(_QWORD *)(v21 + 32) = 0;
    *(_BYTE *)(v21 + 40) = 1;
    v27 = v19;
    sub_1B69A59AC((_QWORD *)inited);
    sub_1B69CA4D0();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v23 - 8) + 104))(v17, *MEMORY[0x1E0DEC4B0]);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v31);
  }
  v25[0] = a1;
  v25[1] = a2;
  v25[2] = 0;
  v26 = 1;
  sub_1B69CA6F8();
LABEL_5:
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v31);
}

uint64_t KeyedEncodingContainerProtocol.encode(_:forKey:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D5F8);
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_1B699ED24();
    v7 = sub_1B69CA6B0();
    MEMORY[0x1E0C80A78](v7);
    v8[-2] = v6;
    sub_1B69A5B08(a1, (void (*)(_QWORD, _QWORD, _OWORD *))sub_1B69A5D14);
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t KeyedEncodingContainerProtocol.encode(_:forKey:)(uint64_t result)
{
  Swift::OpaquePointer v1;
  _BYTE v2[24];
  uint64_t v3;

  if (result)
  {
    v1._rawValue = (void *)result;
    sub_1B69CA6A4();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
    UnkeyedEncodingContainer.encode(_:)(v1);
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> UnkeyedEncodingContainer.encode(_:)(Swift::OpaquePointer a1)
{
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
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  uint64_t v16;

  v5 = v3;
  v6 = v2;
  v7 = v1;
  v8 = *((_QWORD *)a1._rawValue + 2);
  v9 = swift_bridgeObjectRetain();
  v16 = v9;
  if (v8)
  {
    v10 = 0;
    v11 = v9 + 32;
    while (1)
    {
      sub_1B699BBEC(v11, (uint64_t)v12 + 8);
      *(_QWORD *)&v14[0] = v10;
      sub_1B699ED14((_OWORD *)((char *)v12 + 8), (_OWORD *)((char *)v14 + 8));
      v12[0] = v14[0];
      v12[1] = v14[1];
      v13 = v15;
      sub_1B69A3C78(*(void **)&v14[0], (uint64_t)v12 + 8, v5, v7, v6);
      if (v4)
        break;
      ++v10;
      sub_1B6999FB0((uint64_t)v12, &qword_1EF13D600);
      v11 += 32;
      if (v8 == v10)
        goto LABEL_7;
    }
    sub_1B6999FB0((uint64_t)v12, &qword_1EF13D600);
  }
LABEL_7:
  swift_bridgeObjectRelease();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE v6[16];
  _BYTE *v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D5F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v6[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B699ED24();
  sub_1B69CA62C();
  v7 = v5;
  sub_1B69A5B08((uint64_t)a1._rawValue, (void (*)(_QWORD, _QWORD, _OWORD *))sub_1B69A5EA8);
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1B69A3C78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36[32];
  Swift::OpaquePointer v37[4];
  _BYTE v38[40];
  void *v39;

  v39 = a1;
  v10 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B699BBEC(a2, (uint64_t)v38);
  if (swift_dynamicCast())
  {
    sub_1B69CA650();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v38);
  }
  v34 = a4;
  v35 = v5;
  v30 = a2;
  v31 = v12;
  v32 = v10;
  v33 = a5;
  v13 = v39;
  if (swift_dynamicCast())
  {
    sub_1B69CA668();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v38);
  }
  v15 = a3;
  if (swift_dynamicCast())
  {
    sub_1B69CA644();
LABEL_8:
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v38);
  }
  if (swift_dynamicCast())
  {
    sub_1B69CA65C();
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v38);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA20);
  v16 = swift_dynamicCast();
  v17 = v34;
  if (v16)
  {
    UnkeyedEncodingContainer.encode(_:)(v37[0]);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D5F0);
  if (swift_dynamicCast())
  {
    UnkeyedEncodingContainer.encode(_:)(v37[0]);
    goto LABEL_8;
  }
  sub_1B699BBEC((uint64_t)v38, (uint64_t)v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF58);
  swift_dynamicCast();
  if (v37[3]._rawValue)
  {
    sub_1B6999FB0((uint64_t)v37, &qword_1ED52FF58);
    v37[0]._rawValue = v13;
    v18 = sub_1B69CA5E4();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D638);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B69CADE0;
    *(_QWORD *)(inited + 32) = v18;
    *(_QWORD *)(inited + 40) = v20;
    *(_QWORD *)(inited + 48) = v13;
    *(_BYTE *)(inited + 56) = 0;
    v22 = sub_1B69CA4DC();
    swift_allocError();
    v24 = v23;
    v39 = (void *)(v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D640) + 48));
    sub_1B699BBEC(v30, v24);
    v25 = v32;
    v26 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v31, v15, v17);
    v27 = (void *)sub_1B69CA638();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v17);
    v28 = (_QWORD *)sub_1B69A41C0(inited);
    swift_bridgeObjectRelease();
    v37[0]._rawValue = v27;
    sub_1B69A59AC(v28);
    sub_1B69CA4D0();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC4B0], v22);
    swift_willThrow();
  }
  else
  {
    sub_1B69CA674();
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v38);
}

uint64_t sub_1B69A41C0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v13;
  ValueMetadata *v14;
  unint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    sub_1B69A5AA8(0, v1, 0);
    v2 = v16;
    v4 = (_BYTE *)(a1 + 56);
    do
    {
      v6 = *((_QWORD *)v4 - 3);
      v5 = *((_QWORD *)v4 - 2);
      v7 = *((_QWORD *)v4 - 1);
      v8 = *v4;
      v16 = v2;
      v10 = *(_QWORD *)(v2 + 16);
      v9 = *(_QWORD *)(v2 + 24);
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1)
      {
        sub_1B69A5AA8((_QWORD *)(v9 > 1), v10 + 1, 1);
        v2 = v16;
      }
      v14 = &type metadata for AnyDecodableKeys;
      v15 = sub_1B699ED24();
      v11 = swift_allocObject();
      *(_QWORD *)&v13 = v11;
      *(_QWORD *)(v11 + 16) = v6;
      *(_QWORD *)(v11 + 24) = v5;
      *(_QWORD *)(v11 + 32) = v7;
      *(_BYTE *)(v11 + 40) = v8;
      *(_QWORD *)(v2 + 16) = v10 + 1;
      sub_1B69970A0(&v13, v2 + 40 * v10 + 32);
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_1B69A42E0(uint64_t a1)
{
  uint64_t v2;

  sub_1B69CA068();
  sub_1B69A5DF4(&qword_1EF13D618, MEMORY[0x1E0CB0018]);
  v2 = sub_1B69CA224();
  return sub_1B69A4BE0(a1, v2);
}

uint64_t sub_1B69A4344(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF08);
  v42 = a2;
  v6 = sub_1B69CA50C();
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
    sub_1B69CA770();
    sub_1B69CA29C();
    result = sub_1B69CA788();
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

uint64_t sub_1B69A4668(uint64_t a1, int a2)
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
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t *v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  int64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int64_t v53;
  char *v54;
  uint64_t v55;

  v3 = v2;
  v5 = sub_1B69CA068();
  v51 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D610);
  v50 = a2;
  v9 = sub_1B69CA50C();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v54 = v7;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v47 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v45 = v2;
  v46 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  v48 = v8;
  v49 = v10;
  v55 = v5;
  v18 = v51;
  while (1)
  {
    if (v14)
    {
      v21 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v22 = v21 | (v17 << 6);
      goto LABEL_22;
    }
    v23 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v46)
      break;
    v24 = v47;
    v25 = v47[v23];
    ++v17;
    if (!v25)
    {
      v17 = v23 + 1;
      if (v23 + 1 >= v46)
        goto LABEL_34;
      v25 = v47[v17];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v46)
        {
LABEL_34:
          swift_release();
          v3 = v45;
          if ((v50 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v25 = v47[v26];
        if (!v25)
        {
          while (1)
          {
            v17 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_43;
            if (v17 >= v46)
              goto LABEL_34;
            v25 = v47[v17];
            ++v26;
            if (v25)
              goto LABEL_21;
          }
        }
        v17 = v26;
      }
    }
LABEL_21:
    v14 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v17 << 6);
LABEL_22:
    v27 = *(_QWORD *)(v18 + 72);
    v28 = *(_QWORD *)(v8 + 48) + v27 * v22;
    v53 = v17;
    if ((v50 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v18 + 32))(v54, v28, v55);
      v29 = (uint64_t *)(*(_QWORD *)(v8 + 56) + 32 * v22);
      v30 = v29[1];
      v52 = *v29;
      v31 = (void *)v29[2];
      v32 = (void *)v29[3];
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v54, v28, v55);
      v33 = (uint64_t *)(*(_QWORD *)(v8 + 56) + 32 * v22);
      v30 = v33[1];
      v31 = (void *)v33[2];
      v32 = (void *)v33[3];
      v52 = *v33;
      sub_1B69A5DE0(v52, v30);
      v34 = v31;
      v35 = v32;
    }
    v10 = v49;
    sub_1B69A5DF4(&qword_1EF13D618, MEMORY[0x1E0CB0018]);
    result = sub_1B69CA224();
    v36 = -1 << *(_BYTE *)(v10 + 32);
    v37 = result & ~v36;
    v38 = v37 >> 6;
    if (((-1 << v37) & ~*(_QWORD *)(v15 + 8 * (v37 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v37) & ~*(_QWORD *)(v15 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      v18 = v51;
    }
    else
    {
      v39 = 0;
      v40 = (unint64_t)(63 - v36) >> 6;
      v18 = v51;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v41 = v38 == v40;
        if (v38 == v40)
          v38 = 0;
        v39 |= v41;
        v42 = *(_QWORD *)(v15 + 8 * v38);
      }
      while (v42 == -1);
      v19 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v18 + 32))(*(_QWORD *)(v10 + 48) + v27 * v19, v54, v55);
    v20 = (_QWORD *)(*(_QWORD *)(v10 + 56) + 32 * v19);
    v17 = v53;
    *v20 = v52;
    v20[1] = v30;
    v20[2] = v31;
    v20[3] = v32;
    ++*(_QWORD *)(v10 + 16);
    v8 = v48;
  }
  swift_release();
  v3 = v45;
  v24 = v47;
  if ((v50 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v43 = 1 << *(_BYTE *)(v8 + 32);
  if (v43 >= 64)
    bzero(v24, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v43;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

_OWORD *sub_1B69A4A48(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1B699E8D4(a2, a3);
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
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
        return sub_1B699ED14(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1B69A4D18();
      goto LABEL_7;
    }
    sub_1B699EA18(v15, a4 & 1);
    v21 = sub_1B699E8D4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1B69A4B78(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_1B69CA71C();
  __break(1u);
  return result;
}

_OWORD *sub_1B69A4B78(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1B699ED14(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_1B69A4BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_1B69CA068();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_1B69A5DF4(&qword_1EF13D620, MEMORY[0x1E0CB0028]);
      v14 = sub_1B69CA230();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_1B69A4D18()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA28);
  v2 = *v0;
  v3 = sub_1B69CA500();
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
    sub_1B699BBEC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1B699ED14(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_1B69A4EFC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF08);
  v2 = *v0;
  v3 = sub_1B69CA500();
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

void *sub_1B69A50B4()
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
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF10);
  v2 = *v0;
  v3 = sub_1B69CA500();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1B69A525C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  id v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  const void *v37;
  int64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;

  v1 = sub_1B69CA068();
  v40 = *(_QWORD *)(v1 - 8);
  v41 = v1;
  MEMORY[0x1E0C80A78](v1);
  v39 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D610);
  v36 = v0;
  v3 = *v0;
  v4 = sub_1B69CA500();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (id)swift_release();
    v35 = v43;
    v34 = v36;
LABEL_28:
    *v34 = v35;
    return result;
  }
  v6 = v4;
  result = (id)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v37 = (const void *)(v3 + 64);
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, v37, 8 * v8);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v38 = (unint64_t)(v11 + 63) >> 6;
  v14 = v39;
  v15 = v40;
  v16 = v41;
  v17 = v43;
  while (1)
  {
    if (v13)
    {
      v44 = (v13 - 1) & v13;
      v45 = v10;
      v18 = __clz(__rbit64(v13)) | (v10 << 6);
      v19 = v42;
      goto LABEL_12;
    }
    v30 = v10 + 1;
    v19 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v30 >= v38)
      goto LABEL_26;
    v31 = *((_QWORD *)v37 + v30);
    v32 = v10 + 1;
    if (!v31)
    {
      v32 = v10 + 2;
      if (v10 + 2 >= v38)
        goto LABEL_26;
      v31 = *((_QWORD *)v37 + v32);
      if (!v31)
        break;
    }
LABEL_25:
    v44 = (v31 - 1) & v31;
    v45 = v32;
    v18 = __clz(__rbit64(v31)) + (v32 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v15 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v14, *(_QWORD *)(v19 + 48) + v20, v16);
    v21 = *(_QWORD *)(v19 + 56);
    v22 = 32 * v18;
    v23 = (uint64_t *)(v21 + 32 * v18);
    v24 = *v23;
    v25 = v23[1];
    v26 = (void *)v23[2];
    v27 = (void *)v23[3];
    (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v17 + 48) + v20, v14, v16);
    v28 = (uint64_t *)(*(_QWORD *)(v17 + 56) + v22);
    *v28 = v24;
    v28[1] = v25;
    v28[2] = (uint64_t)v26;
    v28[3] = (uint64_t)v27;
    sub_1B69A5DE0(v24, v25);
    v29 = v26;
    result = v27;
    v13 = v44;
    v10 = v45;
  }
  v33 = v10 + 3;
  if (v10 + 3 >= v38)
  {
LABEL_26:
    result = (id)swift_release();
    v34 = v36;
    v35 = v43;
    goto LABEL_28;
  }
  v31 = *((_QWORD *)v37 + v33);
  if (v31)
  {
    v32 = v10 + 3;
    goto LABEL_25;
  }
  while (1)
  {
    v32 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v32 >= v38)
      goto LABEL_26;
    v31 = *((_QWORD *)v37 + v32);
    ++v33;
    if (v31)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

char *sub_1B69A5500(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D668);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_1B69A5604(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D650);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D648);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_1B69A5738(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D630);
  v10 = *(_QWORD *)(type metadata accessor for HAREntry() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for HAREntry() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_1B69A58AC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D628);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_1B69A59AC(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = sub_1B69A5604(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D648);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

_QWORD *sub_1B69A5AA8(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1B69AE4C0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
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

uint64_t sub_1B69A5AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_1B69A3518(a1, a2, a3, v3[4], v3[2], v3[3]);
}

uint64_t sub_1B69A5B08(uint64_t a1, void (*a2)(_QWORD, _QWORD, _OWORD *))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  __int128 v20;
  _OWORD v21[2];
  __int128 v22;
  _OWORD v23[2];
  void (*v24)(_QWORD, _QWORD, _OWORD *);

  v24 = a2;
  v18 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v19 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (v6)
  {
    v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v10 = v9 | (v8 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_1B699BBEC(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v23);
    *(_QWORD *)&v22 = v13;
    *((_QWORD *)&v22 + 1) = v12;
    v20 = v22;
    v21[0] = v23[0];
    v21[1] = v23[1];
    v14 = v22;
    swift_bridgeObjectRetain();
    v24(v14, *((_QWORD *)&v14 + 1), v21);
    result = sub_1B6999FB0((uint64_t)&v20, &qword_1EF13D660);
    if (v2)
      return swift_release();
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v8 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v8);
  if (v16)
  {
LABEL_19:
    v6 = (v16 - 1) & v16;
    v10 = __clz(__rbit64(v16)) + (v8 << 6);
    goto LABEL_5;
  }
  v17 = v8 + 1;
  if (v8 + 1 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
    goto LABEL_18;
  v17 = v8 + 2;
  if (v8 + 2 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
    goto LABEL_18;
  v17 = v8 + 3;
  if (v8 + 3 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
    goto LABEL_18;
  v17 = v8 + 4;
  if (v8 + 4 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
  {
LABEL_18:
    v8 = v17;
    goto LABEL_19;
  }
  while (1)
  {
    v8 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v8 >= v19)
      return swift_release();
    v16 = *(_QWORD *)(v18 + 8 * v8);
    ++v17;
    if (v16)
      goto LABEL_19;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1B69A5D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1B69A2EC8(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t assignWithCopy for AnyDecodableKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithTake for AnyDecodableKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

void type metadata accessor for AuthChallengeDisposition(uint64_t a1)
{
  sub_1B69A1E80(a1, &qword_1EF13D608);
}

uint64_t sub_1B69A5DE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B699D90C(a1, a2);
  return a1;
}

uint64_t sub_1B69A5DF4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1B69CA068();
    result = MEMORY[0x1BCC9ABA8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B69A5E38()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1B69A5E5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF13D658;
  if (!qword_1EF13D658)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF13D5F8);
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DED188], v1);
    atomic_store(result, (unint64_t *)&qword_1EF13D658);
  }
  return result;
}

uint64_t sub_1B69A5EA8()
{
  return sub_1B69A5D14();
}

uint64_t FMNMockClientURLResponse.init(data:response:error:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

void destroy for FMNMockClientURLResponse(uint64_t a1)
{
  unint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >> 60 != 15)
    sub_1B699DB18(*(_QWORD *)a1, v2);

}

uint64_t initializeWithCopy for FMNMockClientURLResponse(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    sub_1B699D90C(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v6 = (void *)a2[2];
  v7 = (void *)a2[3];
  *(_QWORD *)(a1 + 16) = v6;
  v8 = v6;
  v9 = v7;
  *(_QWORD *)(a1 + 24) = v7;
  return a1;
}

uint64_t *assignWithCopy for FMNMockClientURLResponse(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *a2;
      sub_1B699D90C(*a2, a2[1]);
      v7 = *a1;
      v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_1B699DB18(v7, v8);
      goto LABEL_8;
    }
    sub_1B69A604C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v5 = *a2;
  sub_1B699D90C(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  v9 = (void *)a1[2];
  v10 = (void *)a2[2];
  a1[2] = (uint64_t)v10;
  v11 = v10;

  v12 = (void *)a1[3];
  v13 = (void *)a2[3];
  v14 = v13;
  a1[3] = (uint64_t)v13;

  return a1;
}

uint64_t sub_1B69A604C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0CB0338] - 8) + 8))();
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

uint64_t *assignWithTake for FMNMockClientURLResponse(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_1B699DB18(v6, v4);
      goto LABEL_6;
    }
    sub_1B69A604C((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  v7 = (void *)a1[2];
  a1[2] = a2[2];

  v8 = (void *)a1[3];
  a1[3] = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for FMNMockClientURLResponse(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FMNMockClientURLResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMNMockClientURLResponse()
{
  return &type metadata for FMNMockClientURLResponse;
}

uint64_t static HeaderKeyName.authorization.getter()
{
  return 0x7A69726F68747541;
}

uint64_t sub_1B69A61F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69A6254()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B69A629C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B69A62EC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69A6328(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69A6384()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B69A63CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B69A641C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69A6458(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 48) = v3;
  *(_QWORD *)(v4 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69A64B4()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B69A64FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B69A654C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69A6588@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 64);
  return result;
}

uint64_t sub_1B69A65C8(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 64) = v2;
  return result;
}

uint64_t (*sub_1B69A6604())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static FMNAuthenticationCredential.FMNAuthenticationCredentialError.== infix(_:_:)()
{
  return 1;
}

uint64_t FMNAuthenticationCredential.FMNAuthenticationCredentialError.hash(into:)()
{
  return sub_1B69CA77C();
}

uint64_t FMNAuthenticationCredential.FMNAuthenticationCredentialError.hashValue.getter()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

uint64_t sub_1B69A66B0()
{
  return 1;
}

uint64_t sub_1B69A66B8()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

uint64_t sub_1B69A66F8()
{
  return sub_1B69CA77C();
}

uint64_t sub_1B69A671C()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

void sub_1B69A6768(char *a1)
{
  sub_1B69A6930(*a1);
}

void sub_1B69A6774(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1B69A67C0(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1B69A6814 + 4 * byte_1B69CAF54[a2]))(a3 + 2);
}

uint64_t sub_1B69A6814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 + 2 && v3 == 0x80000001B69CD630)
    v4 = 1;
  else
    v4 = sub_1B69CA68C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_1B69A689C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = FMNAccountType.rawValue.getter();
  v2 = v1;
  if (v0 == FMNAccountType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1B69CA68C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_1B69A6930(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B69A698C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1B69A69F4 + 4 * byte_1B69CAF5C[a2]))(0x64496E6F73726570);
}

uint64_t sub_1B69A69F4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x64496E6F73726570 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_1B69CA68C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1B69A6AA4(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000016;
  else
    v3 = 0xD000000000000017;
  if (v2)
    v4 = 0x80000001B69CD5B0;
  else
    v4 = 0x80000001B69CD5D0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000016;
  else
    v5 = 0xD000000000000017;
  if ((a2 & 1) != 0)
    v6 = 0x80000001B69CD5D0;
  else
    v6 = 0x80000001B69CD5B0;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1B69CA68C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_1B69A6B4C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B69A6B8C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1B69A6BD8 + 4 * byte_1B69CAF64[a2]))(1414745936);
}

uint64_t sub_1B69A6BD8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1414745936 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_1B69CA68C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1B69A6C68(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B69A6CA8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1B69A6D18 + 4 * byte_1B69CAF6D[a2]))(0x65707954656D696DLL);
}

uint64_t sub_1B69A6D18(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x65707954656D696DLL && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_1B69CA68C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1B69A6DD0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B69CA770();
  __asm { BR              X9 }
}

uint64_t sub_1B69A6E20()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

void sub_1B69A6E98()
{
  __asm { BR              X10 }
}

uint64_t sub_1B69A6ED8()
{
  sub_1B69CA29C();
  return swift_bridgeObjectRelease();
}

void sub_1B69A6F3C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B69CA770();
  __asm { BR              X9 }
}

uint64_t sub_1B69A6F88()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

uint64_t sub_1B69A7000@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B69A7C30();
  *a1 = result;
  return result;
}

uint64_t sub_1B69A702C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1B69A7060 + 4 * byte_1B69CAF7E[*v0]))();
}

void sub_1B69A7060(_QWORD *a1@<X8>)
{
  *a1 = 0x64496E6F73726570;
  a1[1] = 0xE800000000000000;
}

void sub_1B69A707C(_QWORD *a1@<X8>)
{
  *a1 = 0x656D614E74736F68;
  a1[1] = 0xE800000000000000;
}

void sub_1B69A7098(_QWORD *a1@<X8>)
{
  *a1 = 0x54746E756F636361;
  a1[1] = 0xEB00000000657079;
}

uint64_t sub_1B69A70BC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69A70F0 + 4 * byte_1B69CAF82[*v0]))(0x656B6F5468747561, 0xE90000000000006ELL);
}

uint64_t sub_1B69A70F0()
{
  return 0x64496E6F73726570;
}

uint64_t sub_1B69A7108()
{
  return 0x656D614E74736F68;
}

uint64_t sub_1B69A7120()
{
  return 0x54746E756F636361;
}

uint64_t sub_1B69A7140@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B69A7C30();
  *a1 = result;
  return result;
}

uint64_t sub_1B69A7164()
{
  return 0;
}

void sub_1B69A7170(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1B69A717C()
{
  sub_1B69A764C();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69A71A4()
{
  sub_1B69A764C();
  return sub_1B69CA7D0();
}

unint64_t sub_1B69A71CC(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA28);
  v2 = sub_1B69CA518();
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
    sub_1B69A8260(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1B699E8D4(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1B699ED14(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t FMNAuthenticationCredential.__allocating_init(accountType:authToken:personId:hostName:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  char v15;

  result = swift_allocObject();
  v15 = *a1;
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)(result + 32) = a4;
  *(_QWORD *)(result + 40) = a5;
  *(_QWORD *)(result + 48) = a6;
  *(_QWORD *)(result + 56) = a7;
  *(_BYTE *)(result + 64) = v15;
  return result;
}

uint64_t FMNAuthenticationCredential.init(accountType:authToken:personId:hostName:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  char v8;

  v8 = *a1;
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  *(_QWORD *)(v7 + 32) = a4;
  *(_QWORD *)(v7 + 40) = a5;
  *(_QWORD *)(v7 + 48) = a6;
  *(_QWORD *)(v7 + 56) = a7;
  *(_BYTE *)(v7 + 64) = v8;
  return v7;
}

uint64_t FMNAuthenticationCredential.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  FMNAuthenticationCredential.init(from:)(a1);
  return v2;
}

uint64_t FMNAuthenticationCredential.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D670);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69A764C();
  sub_1B69CA7A0();
  if (!v2)
  {
    v27 = 0;
    v9 = sub_1B69CA554();
    v11 = v10;
    v26 = 1;
    v21 = sub_1B69CA554();
    v22 = v12;
    v25 = 2;
    v19 = sub_1B69CA554();
    v20 = v13;
    v24 = 3;
    v14._countAndFlagsBits = sub_1B69CA554();
    FMNAccountType.init(rawValue:)(v14);
    v16 = v23;
    if (v23 != 15)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      *(_QWORD *)(v3 + 16) = v9;
      *(_QWORD *)(v3 + 24) = v11;
      v17 = v22;
      *(_QWORD *)(v3 + 32) = v21;
      *(_QWORD *)(v3 + 40) = v17;
      v18 = v20;
      *(_QWORD *)(v3 + 48) = v19;
      *(_QWORD *)(v3 + 56) = v18;
      *(_BYTE *)(v3 + 64) = v16;
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B69A7690();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  type metadata accessor for FMNAuthenticationCredential();
  swift_deallocPartialClassInstance();
LABEL_4:
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return v3;
}

unint64_t sub_1B69A764C()
{
  unint64_t result;

  result = qword_1EF13D678;
  if (!qword_1EF13D678)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CB264, &type metadata for FMNAuthenticationCredential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13D678);
  }
  return result;
}

unint64_t sub_1B69A7690()
{
  unint64_t result;

  result = qword_1EF13D680;
  if (!qword_1EF13D680)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAuthenticationCredential.FMNAuthenticationCredentialError, &type metadata for FMNAuthenticationCredential.FMNAuthenticationCredentialError);
    atomic_store(result, (unint64_t *)&qword_1EF13D680);
  }
  return result;
}

uint64_t sub_1B69A76D4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D688);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69A764C();
  sub_1B69CA7AC();
  swift_beginAccess();
  v14 = 0;
  swift_bridgeObjectRetain();
  sub_1B69CA5B4();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v13 = 1;
    swift_bridgeObjectRetain();
    sub_1B69CA5B4();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v12 = 2;
    swift_bridgeObjectRetain();
    sub_1B69CA5B4();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v11 = *(_BYTE *)(v3 + 64);
    FMNAccountType.rawValue.getter();
    v11 = 3;
    sub_1B69CA5B4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return swift_bridgeObjectRelease();
}

uint64_t FMNAuthenticationCredential.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FMNAuthenticationCredential.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1B69A7960()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B69A79AC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  swift_beginAccess();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B69A7A00())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69A7A40(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  swift_beginAccess();
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B69A7A94())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69A7AD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v3 + 64);
  return result;
}

uint64_t sub_1B69A7B18(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  swift_beginAccess();
  *(_QWORD *)(v5 + 48) = a1;
  *(_QWORD *)(v5 + 56) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B69A7B6C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69A7BAC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for FMNAuthenticationCredential();
  v5 = swift_allocObject();
  result = FMNAuthenticationCredential.init(from:)(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_1B69A7C00(_QWORD *a1)
{
  return sub_1B69A76D4(a1);
}

uint64_t sub_1B69A7C24(_QWORD **a1, _QWORD **a2)
{
  return _s12FMNetworking27FMNAuthenticationCredentialC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_1B69A7C30()
{
  unint64_t v0;

  v0 = sub_1B69CA524();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_1B69A7C7C()
{
  unint64_t result;

  result = qword_1EF13D690;
  if (!qword_1EF13D690)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAuthenticationCredential.FMNAuthenticationCredentialError, &type metadata for FMNAuthenticationCredential.FMNAuthenticationCredentialError);
    atomic_store(result, (unint64_t *)&qword_1EF13D690);
  }
  return result;
}

uint64_t sub_1B69A7CC0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B69A7D0C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  *a2 = *(_QWORD *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B69A7D58@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 56);
  *a2 = *(_QWORD *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B69A7DA4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 64);
  return result;
}

uint64_t sub_1B69A7DE8(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 64) = v2;
  return result;
}

ValueMetadata *type metadata accessor for HeaderKeyName()
{
  return &type metadata for HeaderKeyName;
}

uint64_t method lookup function for FMNAuthenticationCredential()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authToken.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authToken.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authToken.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.personId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.personId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.personId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.hostName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.hostName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.hostName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.accountType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.accountType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.accountType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.authHeaders.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.__allocating_init(accountType:authToken:personId:hostName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of FMNAuthenticationCredential.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationCredential.FMNAuthenticationCredentialError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FMNAuthenticationCredential.FMNAuthenticationCredentialError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B69A7FB4 + 4 * byte_1B69CAF86[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B69A7FD4 + 4 * byte_1B69CAF8B[v4]))();
}

_BYTE *sub_1B69A7FB4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B69A7FD4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69A7FDC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69A7FE4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69A7FEC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69A7FF4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1B69A8000()
{
  return 0;
}

ValueMetadata *type metadata accessor for FMNAuthenticationCredential.FMNAuthenticationCredentialError()
{
  return &type metadata for FMNAuthenticationCredential.FMNAuthenticationCredentialError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationCredential.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FMNAuthenticationCredential.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69A8100 + 4 * byte_1B69CAF95[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B69A8134 + 4 * byte_1B69CAF90[v4]))();
}

uint64_t sub_1B69A8134(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69A813C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69A8144);
  return result;
}

uint64_t sub_1B69A8150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69A8158);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B69A815C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69A8164(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69A8170(unsigned __int8 *a1)
{
  return *a1;
}

ValueMetadata *type metadata accessor for FMNAuthenticationCredential.CodingKeys()
{
  return &type metadata for FMNAuthenticationCredential.CodingKeys;
}

unint64_t sub_1B69A818C()
{
  unint64_t result;

  result = qword_1EF13D698;
  if (!qword_1EF13D698)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CB23C, &type metadata for FMNAuthenticationCredential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13D698);
  }
  return result;
}

unint64_t sub_1B69A81D4()
{
  unint64_t result;

  result = qword_1EF13D6A0;
  if (!qword_1EF13D6A0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CB174, &type metadata for FMNAuthenticationCredential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13D6A0);
  }
  return result;
}

unint64_t sub_1B69A821C()
{
  unint64_t result;

  result = qword_1EF13D6A8;
  if (!qword_1EF13D6A8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CB19C, &type metadata for FMNAuthenticationCredential.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13D6A8);
  }
  return result;
}

uint64_t sub_1B69A8260(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D6B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B69A82AC(uint64_t a1, uint64_t a2, _QWORD *a3, const void *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  _QWORD *v35;
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  _BYTE v41[56];
  __int128 v42[2];
  __int128 v43[2];
  _QWORD v44[5];
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[40];
  _BYTE v49[48];

  v6 = v5;
  v35 = a3;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v32);
  v33 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B69C9FF0();
  v36 = *(uint64_t (**)(uint64_t))(v12 - 8);
  v37 = v12;
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v34 = (char *)&v31 - v16;
  sub_1B69968B4(a1, (uint64_t)v48);
  sub_1B69968B4(a2, (uint64_t)v49);
  sub_1B69968B4((uint64_t)v48, (uint64_t)v42);
  sub_1B69968B4((uint64_t)v49, (uint64_t)v43);
  sub_1B69970A0(v42, (uint64_t)v45);
  sub_1B69970A0(v43, (uint64_t)v44);
  v17 = sub_1B699A754(v45);
  sub_1B699A2C8(v17, (uint64_t)v41);
  v39 = v6;
  v40 = v17;
  v38 = v17;
  type metadata accessor for FMNHttpClient();
  sub_1B69CA3B0();
  v18 = *(void **)&v42[0];
  sub_1B69968B4((uint64_t)v48, (uint64_t)v42);
  sub_1B69968B4((uint64_t)v49, (uint64_t)v43);
  v19 = sub_1B69A8680((uint64_t)v18, (uint64_t)v41, (uint64_t)v42, a5, v35, a4);
  v21 = v20;
  sub_1B6999FB0((uint64_t)v42, &qword_1EF13D6B8);
  v22 = v46;
  v23 = v47;
  __swift_project_boxed_opaque_existential_1(v45, v46);
  v24 = *(void (**)(uint64_t, uint64_t))(v23 + 16);
  v25 = v23;
  v26 = (uint64_t)v34;
  v24(v22, v25);
  sub_1B69A0558((uint64_t)v15, (uint64_t)v41, v26);
  v27 = (void (*)(char *, uint64_t))*((_QWORD *)v36 + 1);
  v28 = v15;
  v29 = v37;
  v27(v28, v37);
  v36 = v19;
  sub_1B69B9CB8(v44, v26, (uint64_t)v19, v21);
  swift_release();

  swift_release();
  v27((char *)v26, v29);
  sub_1B6999FB0((uint64_t)v41, &qword_1ED52FCD0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v44);
  sub_1B6999FB0((uint64_t)v48, &qword_1EF13D6B8);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v45);
}

uint64_t (*sub_1B69A8680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, const void *a6))(uint64_t)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_group_t v18;
  uint64_t v19;
  _QWORD *v20;
  _BYTE v24[56];
  _BYTE v25[40];
  _OWORD v26[5];
  _BYTE v27[8];
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _QWORD v36[10];

  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300D0);
  swift_allocObject();
  v12 = sub_1B69CA1F4();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a5;
  *(_QWORD *)(v13 + 24) = a6;
  swift_retain();
  sub_1B69CA1B8();
  swift_release();
  swift_release();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a5;
  *(_QWORD *)(v14 + 24) = a6;
  swift_retain();
  sub_1B69CA1C4();
  swift_release();
  swift_release();
  v15 = *(_QWORD *)(v6 + 16);
  v16 = *(_QWORD *)(v7 + 24);
  sub_1B699D610(a3, (uint64_t)v26, &qword_1EF13D6B8);
  v17 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1B699D610(v17, (uint64_t)v25, &qword_1ED52FCD8);
  sub_1B699D610(a2, (uint64_t)v24, &qword_1ED52FCD0);
  swift_unknownObjectWeakInit();
  v28 = v15;
  v29 = v16;
  v31 = v26[1];
  v32 = v26[2];
  v33 = v26[3];
  v34 = v26[4];
  v30 = v26[0];
  sub_1B699D654((uint64_t)v25, (uint64_t)&v35, &qword_1ED52FCD8);
  sub_1B699D654((uint64_t)v24, (uint64_t)v36, &qword_1ED52FCD0);
  swift_weakInit();
  v36[8] = a4;
  swift_unknownObjectRetain();
  v18 = sub_1B69A8A54(a5, a6, v12);
  sub_1B6999FB0((uint64_t)v27, &qword_1EF13D6C0);
  v19 = swift_allocObject();
  swift_weakInit();
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v19;
  v20[3] = v18;
  v20[4] = v12;
  return sub_1B69AA174;
}

uint64_t sub_1B69A88D8(void *a1, void (*a2)(_QWORD *))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (_QWORD *)((char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B69CA368();
  sub_1B69A0A18();
  v7 = (void *)sub_1B69CA3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1B69CADE0;
  v15[1] = a1;
  v9 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA00);
  v10 = sub_1B69CA284();
  v12 = v11;
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v8 + 64) = sub_1B699F398();
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v12;
  sub_1B69CA11C();

  swift_bridgeObjectRelease();
  *v6 = a1;
  swift_storeEnumTagMultiPayload();
  v13 = a1;
  a2(v6);
  return sub_1B6999FB0((uint64_t)v6, &qword_1ED5300E0);
}

dispatch_group_t sub_1B69A8A54(_QWORD *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  dispatch_group_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  char *v27;
  char *v28;
  const void *v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *, _QWORD *);
  char *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  const void *v42;
  _QWORD v44[4];
  const void *v45;
  char *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  dispatch_group_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  _QWORD v57[3];
  uint64_t v58;
  uint64_t (*v59)(_QWORD *, _QWORD *);
  uint64_t v60;
  _BYTE v61[56];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[56];
  _OWORD v68[5];
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t);
  void *v72;
  void (*v73)();
  _QWORD *v74;

  v48 = a1;
  v52 = sub_1B69CA134();
  v55 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v46 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_1B69CA158();
  v54 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v53 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = dispatch_group_create();
  sub_1B699D610(v3, (uint64_t)&v69, &qword_1EF13D6C0);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_1B699D654((uint64_t)&v69, v9 + 24, &qword_1EF13D6C0);
  sub_1B699D610(v3 + 24, (uint64_t)v68, &qword_1EF13D6B8);
  sub_1B699D610(v3 + 144, (uint64_t)v67, &qword_1ED52FCD0);
  sub_1B699D610(v3, (uint64_t)&v69, &qword_1EF13D6C0);
  v64 = v68[2];
  v65 = v68[3];
  v66 = v68[4];
  v62 = v68[0];
  v63 = v68[1];
  sub_1B699D654((uint64_t)v67, (uint64_t)v61, &qword_1ED52FCD0);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  sub_1B699D654((uint64_t)&v69, v10 + 24, &qword_1EF13D6C0);
  v44[3] = a3;
  *(_QWORD *)(v10 + 240) = a3;
  v11 = v64;
  v12 = v65;
  v13 = v62;
  *(_OWORD *)(v10 + 264) = v63;
  *(_OWORD *)(v10 + 280) = v11;
  v14 = v66;
  *(_OWORD *)(v10 + 296) = v12;
  *(_OWORD *)(v10 + 312) = v14;
  *(_OWORD *)(v10 + 248) = v13;
  sub_1B699D654((uint64_t)v61, v10 + 328, &qword_1ED52FCD0);
  *(_QWORD *)(v10 + 384) = v48;
  *(_QWORD *)(v10 + 392) = a2;
  v45 = a2;
  v56 = xmmword_1B69CB2C0;
  v48 = v57;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_1B69AA09C;
  *(_QWORD *)(v15 + 24) = v9;
  v57[0] = 401;
  v57[1] = sub_1B69AA1B0;
  v57[2] = v15;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1B69AA0CC;
  *(_QWORD *)(v16 + 24) = v10;
  v58 = 330;
  v59 = sub_1B69AA1B0;
  v60 = v16;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1B69AA1B0;
  *(_QWORD *)(v17 + 24) = v15;
  v47 = v3;
  v18 = MEMORY[0x1BCC9ACC8](v3);
  v19 = MEMORY[0x1E0C809B0];
  v49 = v9;
  v50 = v8;
  if (v18)
  {
    v20 = (void *)v18;
    v44[2] = *(_QWORD *)(v18 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v21;
    v22[3] = 401;
    v44[1] = v21;
    v22[4] = sub_1B69AA1BC;
    v22[5] = v17;
    v73 = sub_1B6997718;
    v74 = v22;
    v69 = v19;
    v70 = 1107296256;
    v71 = sub_1B6997130;
    v72 = &block_descriptor_113;
    v23 = _Block_copy(&v69);
    v24 = v52;
    v44[0] = v23;
    v25 = v8;
    swift_retain_n();
    v26 = v25;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v27 = v53;
    sub_1B69CA14C();
    *(_QWORD *)&v68[0] = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699DB5C();
    v28 = v46;
    sub_1B69CA434();
    v29 = (const void *)v44[0];
    MEMORY[0x1BCC9A3EC](0, v27, v28, v44[0]);
    _Block_release(v29);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v28, v24);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v27, v51);
    swift_release();

    swift_release();
    swift_release();
    swift_release();
    v30 = v58;
    v31 = v59;
    v16 = v60;
    v32 = v28;
  }
  else
  {
    v33 = v8;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    v31 = sub_1B69AA1B0;
    v30 = 330;
    v32 = v46;
  }
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v31;
  *(_QWORD *)(v34 + 24) = v16;
  v35 = MEMORY[0x1BCC9ACC8](v47);
  if (v35)
  {
    v36 = (void *)v35;
    v47 = *(_QWORD *)(v35 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
    v37 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v38 = (_QWORD *)swift_allocObject();
    v38[2] = v37;
    v38[3] = v30;
    v46 = (char *)v37;
    v38[4] = sub_1B69AA1BC;
    v38[5] = v34;
    v73 = sub_1B6997718;
    v74 = v38;
    v69 = MEMORY[0x1E0C809B0];
    v70 = 1107296256;
    v71 = sub_1B6997130;
    v72 = &block_descriptor_105;
    v39 = _Block_copy(&v69);
    v40 = v52;
    v45 = v39;
    swift_retain_n();
    swift_retain();
    swift_retain();
    v41 = v53;
    sub_1B69CA14C();
    *(_QWORD *)&v68[0] = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699DB5C();
    sub_1B69CA434();
    v42 = v45;
    MEMORY[0x1BCC9A3EC](0, v41, v32, v45);
    _Block_release(v42);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v40);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v41, v51);
    swift_release();
    swift_release();
    swift_release();

  }
  else
  {
    swift_retain();
  }
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300D8);
  swift_arrayDestroy();
  return v50;
}

uint64_t sub_1B69A9170()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69A91A4()
{
  return swift_deallocObject();
}

uint64_t sub_1B69A91B4(void *a1)
{
  uint64_t v1;

  return sub_1B69A88D8(a1, *(void (**)(_QWORD *))(v1 + 16));
}

uint64_t sub_1B69A91BC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1B69A91E4(int a1, int a2, dispatch_group_t group, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
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
  char v27;
  uint64_t v28;
  uint64_t ObjectType;
  void *v30;
  _BYTE *v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;

  dispatch_group_enter(group);
  sub_1B69A0A18();
  v9 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  sub_1B699D610(a4 + 104, (uint64_t)&v40, &qword_1ED52FCD8);
  if (v41)
  {
    sub_1B69970A0(&v40, (uint64_t)v42);
    if (*(_QWORD *)(a4 + 8))
    {
      v39 = *(_QWORD *)(a4 + 16);
      v10 = v43;
      v11 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      v38 = a6;
      v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
      swift_unknownObjectRetain();
      v37 = v12(v10, v11);
      v14 = v13;
      v15 = v43;
      v16 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 32))(v15, v16);
      v19 = v18;
      v21 = v43;
      v20 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 72))(v21, v20);
      v24 = v23;
      v26 = v43;
      v25 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v25 + 64))(&v40, v26, v25);
      v27 = v40;
      type metadata accessor for FMNAuthenticationCredential();
      v28 = swift_allocObject();
      *(_QWORD *)(v28 + 16) = v37;
      *(_QWORD *)(v28 + 24) = v14;
      *(_QWORD *)(v28 + 32) = v17;
      *(_QWORD *)(v28 + 40) = v19;
      *(_QWORD *)(v28 + 48) = v22;
      *(_QWORD *)(v28 + 56) = v24;
      *(_BYTE *)(v28 + 64) = v27;
      ObjectType = swift_getObjectType();
      sub_1B69A9FF8();
      v30 = (void *)swift_allocError();
      *v31 = 2;
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = group;
      v33 = *(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 16);
      v34 = group;
      v33(v28, v30, v38, v32, ObjectType, v39);
      swift_release();

      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      v36 = (void *)sub_1B69CA3E0();
      sub_1B69CA374();
      sub_1B69CA110();

      dispatch_group_leave(group);
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v42);
  }
  else
  {
    sub_1B6999FB0((uint64_t)&v40, &qword_1ED52FCD8);
    v35 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();

    dispatch_group_leave(group);
  }
}

uint64_t sub_1B69A94E8(int a1, uint64_t a2, dispatch_group_t group, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10, uint64_t *a11, void (*a12)(BOOL, uint64_t, _QWORD *, _BYTE *, _BYTE *, uint64_t, uint64_t, NSObject *))
{
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  id v28;
  dispatch_group_t v29;
  NSObject *v30;
  Swift::String v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t host;
  uint64_t host_8;
  uint64_t v40;
  dispatch_group_t v42;
  id v43[7];
  _BYTE v44[56];
  _BYTE v45[80];
  _QWORD v46[28];

  dispatch_group_enter(group);
  host_8 = a8;
  v40 = a7;
  if (*(_QWORD *)(a2 + 16) && (v18 = sub_1B699E8D4(0xD000000000000010, 0x80000001B69CD860), (v19 & 1) != 0))
  {
    v20 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v18);
    v21 = *v20;
    v22 = (void *)v20[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    v21 = 0;
    v22 = 0;
  }
  v42 = group;
  sub_1B69CA374();
  if (qword_1EF13D5E0 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1B69CADE0;
  host = v21;
  v46[0] = v21;
  v46[1] = v22;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA50);
  v24 = sub_1B69CA284();
  v26 = v25;
  *(_QWORD *)(v23 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v23 + 64) = sub_1B699F398();
  *(_QWORD *)(v23 + 32) = v24;
  *(_QWORD *)(v23 + 40) = v26;
  sub_1B69CA11C();
  swift_bridgeObjectRelease();
  v27 = a10;
  sub_1B699D610(a4, (uint64_t)v46, a10);
  sub_1B699D610(a6, (uint64_t)v45, a11);
  sub_1B699D610(v40, (uint64_t)v44, &qword_1ED52FCD0);
  if (v22)
  {
    sub_1B699D610(a4 + 144, (uint64_t)v43, &qword_1ED52FCD0);
    v28 = v43[0];
    swift_retain();
    swift_retain();
    v29 = v42;
    v30 = v42;
    if (v28)
    {
      v31._countAndFlagsBits = host;
      v31._object = v22;
      FMNRedirectHostStore.saveRedirectedHost(host:)(v31);
      sub_1B6999FEC(v43);
    }
    else
    {
      sub_1B6999FB0((uint64_t)v43, &qword_1ED52FCD0);
    }
    a12(*(_QWORD *)(a4 + 208) < 1, a5, v46, v45, v44, host_8, a9, v30);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    swift_retain();
    v29 = v42;
    v32 = v42;
    sub_1B69CA368();
    sub_1B69A0A18();
    v33 = (void *)sub_1B69CA3E0();
    sub_1B69CA11C();

    v34 = swift_allocObject();
    v35 = MEMORY[0x1E0DEAFA0];
    *(_OWORD *)(v34 + 16) = xmmword_1B69CADE0;
    v36 = MEMORY[0x1E0DEAFD8];
    *(_QWORD *)(v34 + 56) = v35;
    *(_QWORD *)(v34 + 64) = v36;
    *(_BYTE *)(v34 + 32) = 0;
    sub_1B69CA374();
    v27 = a10;
    sub_1B69CA110();
    swift_bridgeObjectRelease();
    dispatch_group_leave(v32);
    swift_release();
  }
  sub_1B6999FB0((uint64_t)v46, v27);
  sub_1B6999FB0((uint64_t)v45, a11);
  sub_1B6999FB0((uint64_t)v44, &qword_1ED52FCD0);

  return swift_release();
}

void sub_1B69A98A0(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, const void *a7, NSObject *a8)
{
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  _BYTE v21[40];
  _BYTE v22[40];
  __int128 v23[5];
  __int128 v24[2];
  __int128 v25[2];
  _BYTE v26[40];
  _BYTE v27[40];

  if (qword_1EF13D5E0 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1B69CADE0;
  v15 = MEMORY[0x1E0DEAFD8];
  *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEAFA0];
  *(_QWORD *)(v14 + 64) = v15;
  *(_BYTE *)(v14 + 32) = a1 & 1;
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    goto LABEL_16;
  sub_1B69A9FF8();
  v16 = (void *)swift_allocError();
  *v17 = 5;
  sub_1B69CA1DC();

  v18 = *(_QWORD *)(a3 + 208);
  v19 = v18 + 1;
  if (!__OFADD__(v18, 1))
  {
    sub_1B699D610(a4, (uint64_t)v26, &qword_1EF13D6B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D6B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FCE0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_1B6999FB0((uint64_t)v24, &qword_1ED52FCE0);
      sub_1B699D610(a4, (uint64_t)v24, &qword_1EF13D6B8);
      if (swift_dynamicCast())
      {
        sub_1B69970A0(v23, (uint64_t)v26);
        sub_1B69970A0((__int128 *)((char *)&v23[2] + 8), (uint64_t)v27);
        if (swift_weakLoadStrong())
        {
          sub_1B69968B4((uint64_t)v26, (uint64_t)v24);
          sub_1B69968B4((uint64_t)v27, (uint64_t)v25);
          sub_1B69968B4((uint64_t)v24, (uint64_t)v23);
          sub_1B69968B4((uint64_t)v25, (uint64_t)&v23[2] + 8);
          sub_1B69968B4((uint64_t)v23, (uint64_t)v21);
          sub_1B69968B4((uint64_t)&v23[2] + 8, (uint64_t)v22);
          sub_1B6999B8C((uint64_t)v21, (uint64_t)v22, a6, a7, v19, 0);
          sub_1B6999FB0((uint64_t)v23, &qword_1ED52FCE0);
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
          swift_release();
          sub_1B6999FB0((uint64_t)v26, &qword_1ED52FCE0);
LABEL_12:
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v24);
LABEL_16:
          dispatch_group_leave(a8);
          return;
        }
        v20 = &qword_1ED52FCE0;
        goto LABEL_15;
      }
      memset(v23, 0, sizeof(v23));
      sub_1B6999FB0((uint64_t)v23, &qword_1EF13D6C8);
    }
    sub_1B699D610(a4, (uint64_t)v24, &qword_1EF13D6B8);
    sub_1B69970A0(v24, (uint64_t)v26);
    sub_1B69970A0(v25, (uint64_t)v27);
    if (swift_weakLoadStrong())
    {
      sub_1B69968B4((uint64_t)v26, (uint64_t)v24);
      sub_1B69968B4((uint64_t)v27, (uint64_t)v25);
      sub_1B69968B4((uint64_t)v24, (uint64_t)v23);
      sub_1B69968B4((uint64_t)v25, (uint64_t)&v23[2] + 8);
      sub_1B69968B4((uint64_t)v23, (uint64_t)v21);
      sub_1B69968B4((uint64_t)&v23[2] + 8, (uint64_t)v22);
      sub_1B69A82AC(v21, v22, a6, a7, v19);
      sub_1B6999FB0((uint64_t)v23, &qword_1EF13D6B8);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
      swift_release();
      sub_1B6999FB0((uint64_t)v26, &qword_1EF13D6B8);
      goto LABEL_12;
    }
    v20 = &qword_1EF13D6B8;
LABEL_15:
    sub_1B6999FB0((uint64_t)v26, v20);
    goto LABEL_16;
  }
  __break(1u);
}

void sub_1B69A9CC4(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, NSObject *a8)
{
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[40];
  _BYTE v21[40];
  _BYTE v22[40];
  _BYTE v23[40];
  __int128 v24[2];
  __int128 v25[2];
  _BYTE v26[40];
  _BYTE v27[40];

  if (qword_1EF13D5E0 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1B69CADE0;
  v15 = MEMORY[0x1E0DEAFD8];
  *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEAFA0];
  *(_QWORD *)(v14 + 64) = v15;
  *(_BYTE *)(v14 + 32) = a1 & 1;
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    sub_1B69A9FF8();
    v16 = (void *)swift_allocError();
    *v17 = 5;
    sub_1B69CA1DC();

    v18 = *(_QWORD *)(a3 + 208);
    v19 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      JUMPOUT(0x1B69A9F38);
    }
    sub_1B699D610(a4, (uint64_t)v24, &qword_1ED52FCE0);
    sub_1B69970A0(v24, (uint64_t)v26);
    sub_1B69970A0(v25, (uint64_t)v27);
    if (swift_weakLoadStrong())
    {
      sub_1B69968B4((uint64_t)v26, (uint64_t)v24);
      sub_1B69968B4((uint64_t)v27, (uint64_t)v25);
      sub_1B69968B4((uint64_t)v24, (uint64_t)v22);
      sub_1B69968B4((uint64_t)v25, (uint64_t)v23);
      sub_1B69968B4((uint64_t)v22, (uint64_t)v20);
      sub_1B69968B4((uint64_t)v23, (uint64_t)v21);
      sub_1B6999B8C(v20, v21, a6, a7, v19, 0);
      sub_1B6999FB0((uint64_t)v22, &qword_1ED52FCE0);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v20);
      swift_release();
      sub_1B6999FB0((uint64_t)v26, &qword_1ED52FCE0);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v24);
    }
    else
    {
      sub_1B6999FB0((uint64_t)v26, &qword_1ED52FCE0);
    }
  }
  dispatch_group_leave(a8);
}

void sub_1B69A9F4C(int a1, int a2)
{
  uint64_t v2;

  sub_1B69A91E4(a1, a2, *(dispatch_group_t *)(v2 + 16), v2 + 24, (uint64_t)&unk_1E6A24DE8, (uint64_t)sub_1B69AA03C);
}

uint64_t sub_1B69A9F7C(int a1, uint64_t a2)
{
  return sub_1B69AA0E8(a1, a2, &qword_1ED52FE98, &qword_1ED52FCE0, (void (*)(BOOL, uint64_t, _QWORD *, _BYTE *, _BYTE *, uint64_t, uint64_t, NSObject *))sub_1B69A9CC4);
}

uint64_t sub_1B69A9F98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69A9FBC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_1B69B9AE8(a1, a2, *(uint64_t (**)(_QWORD, _QWORD))(v2 + 16));
}

uint64_t sub_1B69A9FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B69BB22C(a1, a2, *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16));
}

uint64_t sub_1B69A9FCC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

unint64_t sub_1B69A9FF8()
{
  unint64_t result;

  result = qword_1ED52FA48;
  if (!qword_1ED52FA48)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNServerInteractionController.FMNServerInteractionError, &type metadata for FMNServerInteractionController.FMNServerInteractionError);
    atomic_store(result, (unint64_t *)&qword_1ED52FA48);
  }
  return result;
}

void sub_1B69AA03C(void *a1)
{
  uint64_t v1;

  sub_1B69C2AB0(a1, *(NSObject **)(v1 + 16));
}

uint64_t sub_1B69AA044()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69AA068()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1B69AA09C(int a1, int a2)
{
  uint64_t v2;

  sub_1B69A91E4(a1, a2, *(dispatch_group_t *)(v2 + 16), v2 + 24, (uint64_t)&unk_1E6A25068, (uint64_t)sub_1B69AA170);
}

uint64_t sub_1B69AA0CC(int a1, uint64_t a2)
{
  return sub_1B69AA0E8(a1, a2, &qword_1EF13D6C0, &qword_1EF13D6B8, (void (*)(BOOL, uint64_t, _QWORD *, _BYTE *, _BYTE *, uint64_t, uint64_t, NSObject *))sub_1B69A98A0);
}

uint64_t sub_1B69AA0E8(int a1, uint64_t a2, uint64_t *a3, uint64_t *a4, void (*a5)(BOOL, uint64_t, _QWORD *, _BYTE *, _BYTE *, uint64_t, uint64_t, NSObject *))
{
  uint64_t v5;

  return sub_1B69A94E8(a1, a2, *(dispatch_group_t *)(v5 + 16), v5 + 24, *(_QWORD *)(v5 + 240), v5 + 248, v5 + 328, *(_QWORD *)(v5 + 384), *(_QWORD *)(v5 + 392), a3, a4, a5);
}

uint64_t sub_1B69AA138()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B69AA15C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B699A4F4(a1);
}

uint64_t FMNServerCommand.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B69CA068();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t FMNServerCommand.data.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for FMNServerCommand() + 20);
  v2 = *(_QWORD *)v1;
  sub_1B699D90C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for FMNServerCommand()
{
  uint64_t result;

  result = qword_1EF13D728;
  if (!qword_1EF13D728)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t FMNServerCommand.headers.getter()
{
  type metadata accessor for FMNServerCommand();
  return swift_bridgeObjectRetain();
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNServerCommand(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B69CA068();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = *v10;
    v12 = v10[1];
    sub_1B699D90C(*v10, v12);
    *v9 = v11;
    v9[1] = v12;
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FMNServerCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_1B699DB18(*(_QWORD *)(a1 + *(int *)(a2 + 20)), *(_QWORD *)(a1 + *(int *)(a2 + 20) + 8));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  v6 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_1B699D90C(*v9, v11);
  *v8 = v10;
  v8[1] = v11;
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v6 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_1B699D90C(*v9, v11);
  v12 = *v8;
  v13 = v8[1];
  *v8 = v10;
  v8[1] = v11;
  sub_1B699DB18(v12, v13);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for FMNServerCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_QWORD *)(a1 + v7);
  v9 = *(_QWORD *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_1B699DB18(v8, v9);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FMNServerCommand()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69AA5B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1B69CA068();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for FMNServerCommand()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69AA63C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1B69CA068();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_1B69AA6B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69CA068();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_1B69AA734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void **v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];

  v7 = *v4;
  v8 = (void *)sub_1B69C9EAC();
  v9 = (void *)sub_1B69CA038();
  v13[4] = a3;
  v13[5] = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1B6996294;
  v13[3] = &block_descriptor_0;
  v10 = _Block_copy(v13);
  swift_retain();
  v11 = objc_msgSend(v7, sel_uploadTaskWithRequest_fromFile_completionHandler_, v8, v9, v10);

  _Block_release(v10);
  swift_release();
  return v11;
}

id sub_1B69AA814()
{
  id *v0;

  return objc_msgSend(*v0, sel_finishTasksAndInvalidate);
}

FMNetworking::FMNAccountType_optional __swiftcall FMNAccountType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  BOOL v3;
  void *object;
  uint64_t countAndFlagsBits;
  FMNetworking::FMNAccountType_optional result;
  char v7;
  char v8;

  v2 = v1;
  v3 = rawValue._countAndFlagsBits == 6712678 && rawValue._object == (void *)0xE300000000000000;
  if (v3 || (object = rawValue._object, countAndFlagsBits = rawValue._countAndFlagsBits, (sub_1B69CA68C() & 1) != 0))
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else if (countAndFlagsBits == 0x707041666D66 && object == (void *)0xE600000000000000
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 1;
  }
  else if (countAndFlagsBits == 1885957478 && object == (void *)0xE400000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 2;
  }
  else if (countAndFlagsBits == 0x6972695370696D66 && object == (void *)0xE800000000000000
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 3;
  }
  else if (countAndFlagsBits == 0x7075746573 && object == (void *)0xE500000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 4;
  }
  else if (countAndFlagsBits == 0x6150686372616573 && object == (void *)0xEB00000000797472
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 5;
  }
  else if (countAndFlagsBits == 0x4C676E6972696170 && object == (void *)0xEB000000006B636FLL
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 6;
  }
  else if (countAndFlagsBits == 0x726F737365636361 && object == (void *)0xE900000000000079
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 7;
  }
  else if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x80000001B69CDB90
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 8;
  }
  else if (countAndFlagsBits == 0x7373656363413277 && object == (void *)0xEB0000000079726FLL
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 9;
  }
  else if (countAndFlagsBits == 0xD000000000000014 && object == (void *)0x80000001B69CDBB0
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 10;
  }
  else if (countAndFlagsBits == 0x6F4C657275636573 && object == (void *)0xEF736E6F69746163
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 11;
  }
  else if (countAndFlagsBits == 0xD000000000000014 && object == (void *)0x80000001B69CDBD0
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 12;
  }
  else if (countAndFlagsBits == 0x726168536D657469 && object == (void *)0xEB00000000676E69
         || (sub_1B69CA68C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 13;
  }
  else if (countAndFlagsBits == 1701736302 && object == (void *)0xE400000000000000)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 14;
  }
  else
  {
    v8 = sub_1B69CA68C();
    result.value = swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
      v7 = 14;
    else
      v7 = 15;
  }
  *v2 = v7;
  return result;
}

uint64_t FMNAccountType.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69AAE78 + 4 * byte_1B69CB36F[*v0]))(6712678, 0xE300000000000000);
}

uint64_t sub_1B69AAE78()
{
  return 0x707041666D66;
}

uint64_t sub_1B69AAE8C()
{
  return 1885957478;
}

uint64_t sub_1B69AAE9C()
{
  return 0x6972695370696D66;
}

uint64_t sub_1B69AAEB4()
{
  return 0x7075746573;
}

uint64_t sub_1B69AAEC8()
{
  return 0x6150686372616573;
}

uint64_t sub_1B69AAEEC()
{
  return 0x4C676E6972696170;
}

uint64_t sub_1B69AAF0C()
{
  return 0x726F737365636361;
}

unint64_t sub_1B69AAF28()
{
  return 0xD000000000000013;
}

uint64_t sub_1B69AAF48()
{
  return 0x7373656363413277;
}

unint64_t sub_1B69AAF68()
{
  return 0xD000000000000014;
}

uint64_t sub_1B69AAFB4()
{
  return 0x726168536D657469;
}

uint64_t sub_1B69AAFD4()
{
  return 1701736302;
}

uint64_t sub_1B69AAFE4()
{
  sub_1B69CA770();
  FMNAccountType.rawValue.getter();
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

uint64_t sub_1B69AB048()
{
  FMNAccountType.rawValue.getter();
  sub_1B69CA29C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69AB098()
{
  sub_1B69CA770();
  FMNAccountType.rawValue.getter();
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

uint64_t sub_1B69AB0F8()
{
  return sub_1B69A689C();
}

FMNetworking::FMNAccountType_optional sub_1B69AB104(Swift::String *a1)
{
  return FMNAccountType.init(rawValue:)(*a1);
}

uint64_t sub_1B69AB110@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FMNAccountType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL static FMNAuthenticationProviderError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FMNAuthenticationProviderError.hash(into:)()
{
  return sub_1B69CA77C();
}

uint64_t FMNAuthenticationProviderError.hashValue.getter()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

BOOL sub_1B69AB1B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B69AB1CC()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

uint64_t sub_1B69AB210()
{
  return sub_1B69CA77C();
}

uint64_t sub_1B69AB238()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

FMNetworking::FMNAuthenticationOverride_optional __swiftcall FMNAuthenticationOverride.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  FMNetworking::FMNAuthenticationOverride_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1B69CA524();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

unint64_t FMNAuthenticationOverride.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000016;
  else
    return 0xD000000000000017;
}

uint64_t sub_1B69AB318(char *a1, char *a2)
{
  return sub_1B69A6AA4(*a1, *a2);
}

uint64_t sub_1B69AB324()
{
  return sub_1B69B4A00();
}

uint64_t sub_1B69AB32C()
{
  sub_1B69CA29C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69AB38C()
{
  return sub_1B69B4BD4();
}

FMNetworking::FMNAuthenticationOverride_optional sub_1B69AB394(Swift::String *a1)
{
  return FMNAuthenticationOverride.init(rawValue:)(*a1);
}

void sub_1B69AB3A0(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD000000000000016;
  else
    v2 = 0xD000000000000017;
  v3 = 0x80000001B69CD5B0;
  if (*v1)
    v3 = 0x80000001B69CD5D0;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1B69AB3E4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_1B69AB414(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_1B69AB450())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t FMNAuthenticationProvider.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  FMNAuthenticationProvider.init()();
  return v0;
}

void sub_1B69AB4C0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v4;
  _BYTE *v5;

  if (a2)
  {
    sub_1B69AD21C();
    v4 = (void *)swift_allocError();
    *v5 = 4;
    ((void (*)(_QWORD, void *))a3)(0, v4);

  }
  else
  {
    a3();
  }
}

uint64_t sub_1B69AB538(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v5 = v4;
  v10 = sub_1B69CA134();
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1B69CA158();
  v21 = *(_QWORD *)(v13 - 8);
  v22 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B69CA374();
  if (qword_1ED530478 != -1)
    swift_once();
  v16 = MEMORY[0x1E0DEE9D8];
  sub_1B69CA11C();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v5;
  v17[3] = a3;
  v17[4] = a4;
  v17[5] = a1;
  v17[6] = a2;
  aBlock[4] = sub_1B69AC83C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_12;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  v19 = a2;
  sub_1B69CA14C();
  v24 = v16;
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v15, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
  return swift_release();
}

void sub_1B69AB7A8(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, void *a5)
{
  void *v10;
  id v11;
  void *v12;
  _BYTE *v13;
  char v14;

  *(_QWORD *)(a1 + 56) = 0;
  swift_release();
  v10 = (void *)sub_1B6999738();
  v11 = objc_msgSend(v10, sel_aa_primaryAppleAccount);

  if (v11)
  {
    swift_beginAccess();
    v14 = *(_BYTE *)(a4 + 64);
    swift_retain();
    sub_1B69AD6F4(v11, &v14, a5, a1, a2, a3);
    swift_release();

  }
  else
  {
    sub_1B69CA374();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    sub_1B69AD21C();
    v12 = (void *)swift_allocError();
    *v13 = 0;
    a2();

  }
}

uint64_t sub_1B69AB920(void *a1, uint64_t (*a2)(void *))
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    sub_1B69CA368();
    if (qword_1ED530478 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B69CADE0;
    v5 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF13DBA0);
    v6 = sub_1B69CA284();
    v8 = v7;
    *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v4 + 64) = sub_1B699F398();
    *(_QWORD *)(v4 + 32) = v6;
    *(_QWORD *)(v4 + 40) = v8;
    sub_1B69CA11C();
    swift_bridgeObjectRelease();
  }
  return a2(a1);
}

void sub_1B69ABA44(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_1B69ABA98(uint64_t a1, void (*a2)(_QWORD, void *), uint64_t a3, char a4)
{
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  sub_1B69CA374();
  if (qword_1ED530478 != -1)
    swift_once();
  sub_1B69CA11C();
  result = swift_beginAccess();
  v9 = *(_QWORD *)(a1 + 16);
  v10 = __OFSUB__(v9, 1);
  v11 = v9 - 1;
  if (!v10)
  {
    *(_QWORD *)(a1 + 16) = v11;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a2;
    *(_QWORD *)(v12 + 24) = a3;
    *(_QWORD *)(v12 + 32) = a1;
    *(_BYTE *)(v12 + 40) = a4;
    swift_beginAccess();
    if (*(_QWORD *)(a1 + 40))
    {
      swift_retain_n();
      swift_retain_n();
      swift_bridgeObjectRetain();
      v13 = (void *)sub_1B69CA23C();
      v14 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v13);

      if (v14)
      {
        sub_1B69C9FFC();
        v15 = (void *)objc_opt_self();
        v16 = (void *)sub_1B69CA23C();
        swift_bridgeObjectRelease();
        v17 = (void *)sub_1B69CA23C();
        swift_bridgeObjectRelease();
        v18 = swift_allocObject();
        *(_QWORD *)(v18 + 16) = sub_1B69ADC20;
        *(_QWORD *)(v18 + 24) = v12;
        aBlock[4] = sub_1B69ADC30;
        aBlock[5] = v18;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1B69ABA44;
        aBlock[3] = &block_descriptor_32;
        v19 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v15, sel_renewCredentialsWithBundleId_force_reason_completion_, v16, 0, v17, v19, 0xE000000000000000);
        _Block_release(v19);
        swift_release();
        swift_release();

        return swift_release();
      }
      swift_bridgeObjectRelease();
      sub_1B69AD21C();
      v20 = (void *)swift_allocError();
      *v22 = 8;
    }
    else
    {
      sub_1B69AD21C();
      v20 = (void *)swift_allocError();
      *v21 = 8;
      swift_retain_n();
      swift_retain_n();
    }
    sub_1B69CA368();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_1B69CADE0;
    aBlock[0] = v20;
    v24 = v20;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF13DBA0);
    v25 = sub_1B69CA284();
    v27 = v26;
    *(_QWORD *)(v23 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v23 + 64) = sub_1B699F398();
    *(_QWORD *)(v23 + 32) = v25;
    *(_QWORD *)(v23 + 40) = v27;
    sub_1B69CA11C();
    swift_bridgeObjectRelease();
    a2(0, v20);

    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B69ABEB8(void *a1, uint64_t (*a2)(_QWORD, void *), uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v15;

  if (a1)
  {
    sub_1B69CA368();
    if (qword_1ED530478 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1B69CADE0;
    v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF13DBA0);
    v10 = sub_1B69CA284();
    v12 = v11;
    *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v8 + 64) = sub_1B699F398();
    *(_QWORD *)(v8 + 32) = v10;
    *(_QWORD *)(v8 + 40) = v12;
    sub_1B69CA11C();
    swift_bridgeObjectRelease();
    return a2(0, a1);
  }
  else
  {
    sub_1B69CA374();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    v15 = a5;
    return sub_1B699AC08(&v15, (uint64_t)a2, a3);
  }
}

void static FMNAuthenticationProvider.configurationURL(accountType:)(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*a1)
  {
    case 5:
      v8 = (void *)MEMORY[0x1BCC9A848](v5);
      v10 = 0xD000000000000017;
      v11 = "icloud_acsn_gateway_url";
      goto LABEL_9;
    case 6:
    case 7:
      v8 = (void *)MEMORY[0x1BCC9A848](v5);
      v9 = "icloud_fmip_al_service";
      goto LABEL_12;
    case 8:
      v12 = (void *)MEMORY[0x1BCC9A848](v5);
      sub_1B69AC318(0xD000000000000021, 0x80000001B69CDD40, (uint64_t)v7);
      objc_autoreleasePoolPop(v12);
      v13 = sub_1B69CA068();
      v14 = *(_QWORD *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) == 1)
      {
        sub_1B6999FB0((uint64_t)v7, (uint64_t *)&unk_1ED52FC08);
        sub_1B69CA05C();
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v7, v13);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
      }
      return;
    case 9:
      v8 = (void *)MEMORY[0x1BCC9A848](v5);
      v10 = 0xD000000000000015;
      v11 = "fmadminws_gateway_url";
      goto LABEL_9;
    case 0xA:
    case 0xB:
      v8 = (void *)MEMORY[0x1BCC9A848](v5);
      v10 = 0xD000000000000019;
      v11 = "findmyservice_gateway_url";
      goto LABEL_9;
    case 0xC:
      v8 = (void *)MEMORY[0x1BCC9A848](v5);
      v10 = 0xD000000000000017;
      v11 = "findmy_owner_device_url";
LABEL_9:
      v15 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      v16 = a2;
      goto LABEL_13;
    case 0xD:
      v8 = (void *)MEMORY[0x1BCC9A848](v5);
      v9 = "findmy_key_sharing_url";
LABEL_12:
      v15 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      v16 = a2;
      v10 = 0xD000000000000016;
LABEL_13:
      sub_1B69AC318(v10, v15, v16);
      objc_autoreleasePoolPop(v8);
      break;
    default:
      v17 = sub_1B69CA068();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a2, 1, 1, v17);
      break;
  }
}

id sub_1B69AC318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id result;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v10 = result;
  v11 = objc_msgSend(result, sel_aa_primaryAppleAccount);

  if (!v11)
  {
    sub_1B69CA368();
    if (qword_1ED530478 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1B69CADE0;
    *(_QWORD *)(v19 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v19 + 64) = sub_1B699F398();
    *(_QWORD *)(v19 + 32) = a1;
    *(_QWORD *)(v19 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1B69CA11C();
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v12 = (void *)sub_1B69CA23C();
  v13 = objc_msgSend(v11, sel_propertiesForDataclass_, v12);

  if (!v13 || (v14 = sub_1B69CA20C(), v13, v15 = sub_1B699B824(v14), swift_bridgeObjectRelease(), !v15))
  {
    sub_1B69CA368();
    if (qword_1ED530478 == -1)
      goto LABEL_17;
    goto LABEL_20;
  }
  if (!*(_QWORD *)(v15 + 16))
  {
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    sub_1B69CA368();
    if (qword_1ED530478 == -1)
    {
LABEL_17:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
      v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1B69CADE0;
      *(_QWORD *)(v20 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v20 + 64) = sub_1B699F398();
      *(_QWORD *)(v20 + 32) = a1;
      *(_QWORD *)(v20 + 40) = a2;
      swift_bridgeObjectRetain();
      sub_1B69CA11C();
      swift_bridgeObjectRelease();

LABEL_18:
      v21 = sub_1B69CA068();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a3, 1, 1, v21);
    }
LABEL_20:
    swift_once();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  sub_1B699E8D4(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B69CA05C();
  swift_bridgeObjectRelease();
  v17 = sub_1B69CA068();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17) == 1)
  {
    sub_1B6999FB0((uint64_t)v8, (uint64_t *)&unk_1ED52FC08);
    goto LABEL_16;
  }

  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a3, v8, v17);
  return (id)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a3, 0, 1, v17);
}

uint64_t FMNAuthenticationProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t FMNAuthenticationProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1B69AC7F4()
{
  return objectdestroyTm();
}

uint64_t sub_1B69AC800()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_1B69AC83C()
{
  uint64_t v0;

  sub_1B69AB7A8(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48));
}

unint64_t sub_1B69AC850()
{
  unint64_t result;

  result = qword_1EF13D768;
  if (!qword_1EF13D768)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAccountType, &type metadata for FMNAccountType);
    atomic_store(result, (unint64_t *)&qword_1EF13D768);
  }
  return result;
}

unint64_t sub_1B69AC898()
{
  unint64_t result;

  result = qword_1EF13D770;
  if (!qword_1EF13D770)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAuthenticationProviderError, &type metadata for FMNAuthenticationProviderError);
    atomic_store(result, (unint64_t *)&qword_1EF13D770);
  }
  return result;
}

unint64_t sub_1B69AC8E0()
{
  unint64_t result;

  result = qword_1EF13D778;
  if (!qword_1EF13D778)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAuthenticationOverride, &type metadata for FMNAuthenticationOverride);
    atomic_store(result, (unint64_t *)&qword_1EF13D778);
  }
  return result;
}

uint64_t sub_1B69AC924@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return result;
}

uint64_t sub_1B69AC968(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_1B69AC9A8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  *a2 = *(_QWORD *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t getEnumTagSinglePayload for FMNAccountType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FMNAccountType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_1B69ACAD0 + 4 * byte_1B69CB38C[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_1B69ACB04 + 4 * byte_1B69CB387[v4]))();
}

uint64_t sub_1B69ACB04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69ACB0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69ACB14);
  return result;
}

uint64_t sub_1B69ACB20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69ACB28);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_1B69ACB2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69ACB34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationProviderError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FMNAuthenticationProviderError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69ACC1C + 4 * byte_1B69CB396[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1B69ACC50 + 4 * byte_1B69CB391[v4]))();
}

uint64_t sub_1B69ACC50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69ACC58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69ACC60);
  return result;
}

uint64_t sub_1B69ACC6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69ACC74);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_1B69ACC78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69ACC80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNAuthenticationProviderError()
{
  return &type metadata for FMNAuthenticationProviderError;
}

uint64_t getEnumTagSinglePayload for FMNAuthenticationOverride(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FMNAuthenticationOverride(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69ACD78 + 4 * byte_1B69CB3A0[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B69ACDAC + 4 * byte_1B69CB39B[v4]))();
}

uint64_t sub_1B69ACDAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69ACDB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69ACDBCLL);
  return result;
}

uint64_t sub_1B69ACDC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69ACDD0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B69ACDD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69ACDDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1B69ACDE8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FMNAuthenticationOverride()
{
  return &type metadata for FMNAuthenticationOverride;
}

uint64_t dispatch thunk of FMNAuthenticationProviding.credential(accountType:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of FMNAuthenticationProviding.credentialDidFail(credential:error:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t method lookup function for FMNAuthenticationProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.autoRenewalLimit.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.autoRenewalLimit.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.autoRenewalLimit.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.bundleId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.bundleId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.bundleId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.credential(accountType:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of FMNAuthenticationProvider.credentialDidFail(credential:error:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

id sub_1B69ACE88(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id result;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[24];
  uint64_t v31;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D780);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B69CA068();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_dataclassProperties);
  if (!result)
    return result;
  v13 = result;
  v14 = (void *)sub_1B69CA23C();
  v15 = objc_msgSend(v13, sel_valueForKey_, v14);

  if (v15)
  {
    sub_1B69CA428();
    swift_unknownObjectRelease();
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  sub_1B69996F0((uint64_t)&v28, (uint64_t)v30);
  if (!v31)
  {
LABEL_16:

    v20 = &qword_1ED52FF58;
    v21 = v30;
    goto LABEL_17;
  }
  sub_1B6997068(0, &qword_1ED52FF60);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  v16 = v27;
  v17 = (void *)sub_1B69CA23C();
  v18 = v16;
  v19 = objc_msgSend(v16, sel_valueForKey_, v17);

  if (v19)
  {
    sub_1B69CA428();
    swift_unknownObjectRelease();
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  sub_1B69996F0((uint64_t)&v28, (uint64_t)v30);
  if (!v31)
  {

    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  sub_1B69CA05C();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {

    v20 = (uint64_t *)&unk_1ED52FC08;
    v21 = v7;
LABEL_17:
    sub_1B6999FB0((uint64_t)v21, v20);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  sub_1B69C9F90();
  v22 = sub_1B69C9FF0();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v4, 1, v22) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    v20 = &qword_1EF13D780;
    v21 = v4;
    goto LABEL_17;
  }
  v24 = sub_1B69C9FA8();
  v26 = v25;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v22);
  if (v26)
    return (id)v24;
  else
    return 0;
}

unint64_t sub_1B69AD21C()
{
  unint64_t result;

  result = qword_1EF13D788;
  if (!qword_1EF13D788)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAuthenticationProviderError, &type metadata for FMNAuthenticationProviderError);
    atomic_store(result, (unint64_t *)&qword_1EF13D788);
  }
  return result;
}

uint64_t sub_1B69AD260(void *a1, char *a2, void *a3, uint64_t a4, void (*a5)(_QWORD, void *), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  void *v22;
  _BYTE *v23;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void (*v33)(_QWORD, void *);
  uint64_t v34;
  _QWORD aBlock[6];

  v32 = a1;
  v11 = sub_1B69CA134();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1B69CA158();
  v30 = *(_QWORD *)(v15 - 8);
  v31 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = swift_allocObject();
  v33 = a5;
  *(_QWORD *)(v18 + 16) = a5;
  *(_QWORD *)(v18 + 24) = a6;
  v19 = *a2;
  swift_beginAccess();
  if (*(uint64_t *)(a4 + 16) < 1)
  {
    swift_retain();
    goto LABEL_7;
  }
  v29 = v12;
  LOBYTE(aBlock[0]) = v19;
  if (FMNAccountType.rawValue.getter() == 1701736302 && v20 == 0xE400000000000000)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v21 = sub_1B69CA68C();
  swift_retain();
  swift_bridgeObjectRelease();
  if ((v21 & 1) != 0)
  {
LABEL_7:
    sub_1B69CA374();
    if (qword_1ED530478 == -1)
      goto LABEL_8;
LABEL_17:
    swift_once();
    goto LABEL_8;
  }
  aBlock[0] = a3;
  v25 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA00);
  if (swift_dynamicCast() && !(_BYTE)v34)
  {
    sub_1B69CA374();
    if (qword_1ED530478 == -1)
      goto LABEL_8;
    goto LABEL_17;
  }
  if (!objc_msgSend(v32, sel_aa_isManagedAppleID))
  {
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = a4;
    *(_QWORD *)(v26 + 24) = sub_1B69ADC38;
    *(_QWORD *)(v26 + 32) = v18;
    *(_BYTE *)(v26 + 40) = v19;
    aBlock[4] = sub_1B69ADC48;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B6997130;
    aBlock[3] = &block_descriptor_42;
    v27 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    sub_1B69CA14C();
    v34 = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
    sub_1B69CA434();
    MEMORY[0x1BCC9A3EC](0, v17, v14, v27);
    _Block_release(v27);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v11);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return swift_release();
  }
  sub_1B69CA374();
  if (qword_1ED530478 != -1)
    goto LABEL_17;
LABEL_8:
  sub_1B69CA11C();
  sub_1B69AD21C();
  v22 = (void *)swift_allocError();
  *v23 = 4;
  v33(0, v22);

  return swift_release();
}

uint64_t sub_1B69AD6F4(void *a1, char *a2, void *a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  char *v21;
  void *v22;
  char v23;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v34 = a1;
  v31 = sub_1B69CA134();
  v11 = *(_QWORD *)(v31 - 8);
  MEMORY[0x1E0C80A78](v31);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1B69CA158();
  v32 = *(_QWORD *)(v14 - 8);
  v33 = v14;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a5;
  *(_QWORD *)(v17 + 24) = a6;
  v18 = *a2;
  swift_beginAccess();
  if (*(uint64_t *)(a4 + 16) < 1)
  {
    swift_retain();
    goto LABEL_7;
  }
  v30 = v11;
  LOBYTE(aBlock[0]) = v18;
  if (FMNAccountType.rawValue.getter() == 1701736302 && v19 == 0xE400000000000000)
  {
    swift_retain();
    swift_bridgeObjectRelease();
LABEL_7:
    sub_1B69CA374();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    sub_1B69AD21C();
    v22 = (void *)swift_allocError();
    v23 = 6;
LABEL_10:
    *v21 = v23;
    a5();

    return swift_release();
  }
  v20 = sub_1B69CA68C();
  swift_retain();
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
    goto LABEL_7;
  aBlock[0] = a3;
  v25 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA00);
  if (!swift_dynamicCast() || (_BYTE)v35)
  {
    if (!objc_msgSend(v34, sel_aa_isManagedAppleID))
    {
      v26 = swift_allocObject();
      *(_QWORD *)(v26 + 16) = a4;
      *(_QWORD *)(v26 + 24) = sub_1B69ADBE0;
      *(_QWORD *)(v26 + 32) = v17;
      *(_BYTE *)(v26 + 40) = v18;
      aBlock[4] = sub_1B69ADC08;
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B6997130;
      aBlock[3] = &block_descriptor_23;
      v27 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      sub_1B69CA14C();
      v35 = MEMORY[0x1E0DEE9D8];
      sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
      sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
      v28 = v31;
      sub_1B69CA434();
      MEMORY[0x1BCC9A3EC](0, v16, v13, v27);
      _Block_release(v27);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v28);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v33);
      swift_release();
      return swift_release();
    }
    sub_1B69CA374();
    if (qword_1ED530478 != -1)
      swift_once();
    sub_1B69CA11C();
    sub_1B69AD21C();
    v22 = (void *)swift_allocError();
    v23 = 7;
    goto LABEL_10;
  }
  sub_1B69CA374();
  if (qword_1ED530478 != -1)
    swift_once();
  sub_1B69CA11C();
  ((void (*)(void *))a5)(a3);
  return swift_release();
}

uint64_t sub_1B69ADBBC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69ADBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a2);
}

uint64_t sub_1B69ADC08()
{
  uint64_t v0;

  return sub_1B69ABA98(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD, void *))(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_1B69ADC18()
{
  return objectdestroyTm();
}

uint64_t sub_1B69ADC20(void *a1)
{
  uint64_t v1;

  return sub_1B69ABEB8(a1, *(uint64_t (**)(_QWORD, void *))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_BYTE *)(v1 + 40));
}

uint64_t sub_1B69ADC30(void *a1)
{
  uint64_t v1;

  return sub_1B69AB920(a1, *(uint64_t (**)(void *))(v1 + 16));
}

void sub_1B69ADC38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B69AB4C0(a1, a2, *(void (**)(void))(v2 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for FMNHTTPArchiveReader(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B69CA068();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for FMNHTTPArchiveReader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMNHTTPArchiveReader()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69ADE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for FMNHTTPArchiveReader()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69ADE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B69CA068();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FMNHTTPArchiveReader()
{
  uint64_t result;

  result = qword_1EF13D7E8;
  if (!qword_1EF13D7E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B69ADEC8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69CA068();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_1B69ADF30()
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD v16[2];
  __int128 v17;
  _QWORD *v18[4];

  v1 = v0;
  v2 = sub_1B69C9F18();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v6 = swift_allocObject();
  v17 = xmmword_1B69CADE0;
  *(_OWORD *)(v6 + 16) = xmmword_1B69CADE0;
  v7 = sub_1B69CA020();
  v9 = v8;
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 64) = sub_1B699F398();
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  sub_1B69A0A18();
  v10 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  v16[1] = v1;
  v11 = sub_1B69CA080();
  v13 = v12;
  sub_1B69C9F48();
  swift_allocObject();
  sub_1B69C9F3C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAE038], v2);
  sub_1B69C9F24();
  sub_1B69AE47C();
  sub_1B69C9F30();
  swift_release();
  sub_1B699DB18(v11, v13);
  v14 = v18[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18[0] = v14;
  swift_bridgeObjectRetain();
  sub_1B69AE768(v18);
  swift_bridgeObjectRelease();
  return v18[0];
}

uint64_t sub_1B69AE270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;

  v24 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v24 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  while (1)
  {
    v6 = *(v2 - 3);
    v5 = *(v2 - 2);
    v8 = *(v2 - 1);
    v7 = *v2;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = sub_1B699E8D4(v6, v5);
    v12 = v3[2];
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
      break;
    v15 = v10;
    if (v3[3] >= v14)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v10 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_1B69A4EFC();
        if ((v15 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_1B69A4344(v14, isUniquelyReferenced_nonNull_native);
      v16 = sub_1B699E8D4(v6, v5);
      if ((v15 & 1) != (v17 & 1))
        goto LABEL_21;
      v11 = v16;
      if ((v15 & 1) != 0)
      {
LABEL_3:
        v4 = (_QWORD *)(v3[7] + 16 * v11);
        swift_bridgeObjectRelease();
        *v4 = v8;
        v4[1] = v7;
        goto LABEL_4;
      }
    }
    v3[(v11 >> 6) + 8] |= 1 << v11;
    v18 = (uint64_t *)(v3[6] + 16 * v11);
    *v18 = v6;
    v18[1] = v5;
    v19 = (_QWORD *)(v3[7] + 16 * v11);
    *v19 = v8;
    v19[1] = v7;
    v20 = v3[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_20;
    v3[2] = v22;
    swift_bridgeObjectRetain();
LABEL_4:
    v2 += 4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if (!--v1)
    {
      sub_1B69AE454((uint64_t)&v24);
      return (uint64_t)v3;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_1B69CA71C();
  __break(1u);
  return result;
}

uint64_t sub_1B69AE454(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1B69AE47C()
{
  unint64_t result;

  result = qword_1EF13D820;
  if (!qword_1EF13D820)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC670, &type metadata for HARv1dot2);
    atomic_store(result, (unint64_t *)&qword_1EF13D820);
  }
  return result;
}

_QWORD *sub_1B69AE4C0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D650);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D648);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_1B69AE5F4(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D630);
  v10 = *(_QWORD *)(type metadata accessor for HAREntry() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for HAREntry() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_1B69AE768(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for HAREntry() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_1B69AF8D4(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_1B69AE7E8(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1B69AE7E8(uint64_t *a1)
{
  uint64_t v1;
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
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  int v37;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  unint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  uint64_t v90;
  char v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;

  v2 = v1;
  v4 = type metadata accessor for HAREntry();
  v131 = *(_QWORD *)(v4 - 8);
  v132 = v4;
  v5 = MEMORY[0x1E0C80A78](v4);
  v128 = (uint64_t)&v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v138 = (uint64_t)&v123 - v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v135 = (uint64_t)&v123 - v10;
  MEMORY[0x1E0C80A78](v9);
  v134 = (uint64_t)&v123 - v11;
  v12 = a1[1];
  result = sub_1B69CA5D8();
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_143;
    if (v12)
      return sub_1B69AF12C(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_142;
  v125 = result;
  if (v12 > 1)
  {
    v15 = v14 >> 1;
    result = sub_1B69CA320();
    *(_QWORD *)(result + 16) = v15;
    v16 = *(unsigned __int8 *)(v131 + 80);
    v124 = result;
    v130 = result + ((v16 + 32) & ~v16);
LABEL_13:
    v18 = 0;
    v19 = MEMORY[0x1E0DEE9D8];
    v137 = a1;
    while (1)
    {
      v21 = v18;
      v22 = v18 + 1;
      if (v18 + 1 >= v12)
      {
        v39 = v18 + 1;
      }
      else
      {
        v126 = v2;
        v23 = *a1;
        v24 = *(_QWORD *)(v131 + 72);
        v25 = *a1 + v24 * v22;
        v129 = v18;
        v26 = v134;
        sub_1B69AF8E8(v25, v134);
        v27 = v135;
        sub_1B69AF8E8(v23 + v24 * v129, v135);
        LODWORD(v136) = sub_1B69CA0BC();
        sub_1B69AF92C(v27);
        v28 = v26;
        v21 = v129;
        result = sub_1B69AF92C(v28);
        v29 = v21 + 2;
        v133 = v23;
        v139 = v24;
        if (v21 + 2 >= v12)
        {
          v32 = v21 + 2;
          v38 = v24;
          if ((v136 & 1) == 0)
            goto LABEL_38;
        }
        else
        {
          v30 = v24 * v22;
          v31 = v23;
          v32 = v29;
          v33 = v24 * v29;
          do
          {
            v34 = v12;
            v35 = v134;
            sub_1B69AF8E8(v31 + v33, v134);
            v36 = v135;
            sub_1B69AF8E8(v31 + v30, v135);
            v37 = sub_1B69CA0BC();
            sub_1B69AF92C(v36);
            result = sub_1B69AF92C(v35);
            if (((v136 ^ v37) & 1) != 0)
            {
              a1 = v137;
              v21 = v129;
              v12 = v34;
              v38 = v139;
              if ((v136 & 1) == 0)
                goto LABEL_38;
              goto LABEL_25;
            }
            v38 = v139;
            v31 += v139;
            ++v32;
            v12 = v34;
          }
          while (v34 != v32);
          v32 = v34;
          a1 = v137;
          v21 = v129;
          if ((v136 & 1) == 0)
          {
LABEL_38:
            v39 = v32;
            goto LABEL_39;
          }
        }
LABEL_25:
        if (v32 < v21)
          goto LABEL_144;
        v39 = v32;
        if (v21 >= v32)
        {
LABEL_39:
          v2 = v126;
          if (v39 >= v12)
            goto LABEL_59;
        }
        else
        {
          v136 = v12;
          v123 = v19;
          v40 = 0;
          v41 = v38 * (v32 - 1);
          v42 = v32 * v38;
          v43 = v21 * v38;
          do
          {
            if (v21 != v39 + v40 - 1)
            {
              v44 = v133;
              if (!v133)
                goto LABEL_149;
              v45 = v133 + v43;
              sub_1B69AF968(v133 + v43, v128);
              if (v43 < v41 || v45 >= v44 + v42)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v43 != v41)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              result = sub_1B69AF968(v128, v44 + v41);
              a1 = v137;
              v39 = v32;
              v38 = v139;
            }
            ++v21;
            --v40;
            v41 -= v38;
            v42 -= v38;
            v43 += v38;
          }
          while (v21 < v39 + v40);
          v19 = v123;
          v2 = v126;
          v21 = v129;
          v12 = v136;
          if (v39 >= v136)
            goto LABEL_59;
        }
        if (__OFSUB__(v39, v21))
          goto LABEL_141;
        if (v39 - v21 < v125)
        {
          if (__OFADD__(v21, v125))
            goto LABEL_145;
          if (v21 + v125 >= v12)
            v46 = v12;
          else
            v46 = v21 + v125;
          if (v46 < v21)
          {
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
            return result;
          }
          if (v39 != v46)
          {
            v129 = v21;
            v123 = v19;
            v126 = v2;
            v127 = v46;
            v47 = *(_QWORD *)(v131 + 72);
            v48 = v47 * (v39 - 1);
            v133 = v47;
            v49 = v39 * v47;
            do
            {
              v51 = 0;
              v52 = v129;
              v136 = v39;
              while (1)
              {
                v139 = v52;
                v53 = *a1;
                v54 = v49;
                v55 = v49 + v51 + *a1;
                v56 = a1;
                v57 = v134;
                sub_1B69AF8E8(v55, v134);
                v58 = v48;
                v59 = v48 + v51 + v53;
                v60 = v135;
                sub_1B69AF8E8(v59, v135);
                LOBYTE(v53) = sub_1B69CA0BC();
                sub_1B69AF92C(v60);
                result = sub_1B69AF92C(v57);
                if ((v53 & 1) == 0)
                  break;
                v61 = *v56;
                if (!*v56)
                  goto LABEL_147;
                v49 = v54;
                v48 = v58;
                v62 = v61 + v58 + v51;
                sub_1B69AF968(v61 + v54 + v51, v138);
                swift_arrayInitWithTakeFrontToBack();
                result = sub_1B69AF968(v138, v62);
                v51 -= v133;
                v52 = v139 + 1;
                v50 = v136;
                a1 = v137;
                if (v136 == v139 + 1)
                  goto LABEL_52;
              }
              v50 = v136;
              a1 = v56;
              v48 = v58;
              v49 = v54;
LABEL_52:
              v39 = v50 + 1;
              v48 += v133;
              v49 += v133;
            }
            while (v39 != v127);
            v39 = v127;
            v2 = v126;
            v19 = v123;
            v21 = v129;
          }
        }
      }
LABEL_59:
      if (v39 < v21)
        goto LABEL_136;
      result = swift_isUniquelyReferenced_nonNull_native();
      v136 = v39;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1B69AF718(0, *(_QWORD *)(v19 + 16) + 1, 1, (char *)v19);
        v19 = result;
      }
      v64 = *(_QWORD *)(v19 + 16);
      v63 = *(_QWORD *)(v19 + 24);
      v20 = v64 + 1;
      if (v64 >= v63 >> 1)
      {
        result = (uint64_t)sub_1B69AF718((char *)(v63 > 1), v64 + 1, 1, (char *)v19);
        v19 = result;
      }
      *(_QWORD *)(v19 + 16) = v20;
      v65 = v19 + 32;
      v66 = (uint64_t *)(v19 + 32 + 16 * v64);
      v67 = v136;
      *v66 = v21;
      v66[1] = v67;
      if (v64)
      {
        while (1)
        {
          v68 = v20 - 1;
          if (v20 >= 4)
          {
            v73 = v65 + 16 * v20;
            v74 = *(_QWORD *)(v73 - 64);
            v75 = *(_QWORD *)(v73 - 56);
            v79 = __OFSUB__(v75, v74);
            v76 = v75 - v74;
            if (v79)
              goto LABEL_125;
            v78 = *(_QWORD *)(v73 - 48);
            v77 = *(_QWORD *)(v73 - 40);
            v79 = __OFSUB__(v77, v78);
            v71 = v77 - v78;
            v72 = v79;
            if (v79)
              goto LABEL_126;
            v80 = v20 - 2;
            v81 = (uint64_t *)(v65 + 16 * (v20 - 2));
            v83 = *v81;
            v82 = v81[1];
            v79 = __OFSUB__(v82, v83);
            v84 = v82 - v83;
            if (v79)
              goto LABEL_127;
            v79 = __OFADD__(v71, v84);
            v85 = v71 + v84;
            if (v79)
              goto LABEL_129;
            if (v85 >= v76)
            {
              v103 = (uint64_t *)(v65 + 16 * v68);
              v105 = *v103;
              v104 = v103[1];
              v79 = __OFSUB__(v104, v105);
              v106 = v104 - v105;
              if (v79)
                goto LABEL_135;
              v96 = v71 < v106;
              goto LABEL_96;
            }
          }
          else
          {
            if (v20 != 3)
            {
              v97 = *(_QWORD *)(v19 + 32);
              v98 = *(_QWORD *)(v19 + 40);
              v79 = __OFSUB__(v98, v97);
              v90 = v98 - v97;
              v91 = v79;
              goto LABEL_90;
            }
            v70 = *(_QWORD *)(v19 + 32);
            v69 = *(_QWORD *)(v19 + 40);
            v79 = __OFSUB__(v69, v70);
            v71 = v69 - v70;
            v72 = v79;
          }
          if ((v72 & 1) != 0)
            goto LABEL_128;
          v80 = v20 - 2;
          v86 = (uint64_t *)(v65 + 16 * (v20 - 2));
          v88 = *v86;
          v87 = v86[1];
          v89 = __OFSUB__(v87, v88);
          v90 = v87 - v88;
          v91 = v89;
          if (v89)
            goto LABEL_130;
          v92 = (uint64_t *)(v65 + 16 * v68);
          v94 = *v92;
          v93 = v92[1];
          v79 = __OFSUB__(v93, v94);
          v95 = v93 - v94;
          if (v79)
            goto LABEL_132;
          if (__OFADD__(v90, v95))
            goto LABEL_134;
          if (v90 + v95 >= v71)
          {
            v96 = v71 < v95;
LABEL_96:
            if (v96)
              v68 = v80;
            goto LABEL_98;
          }
LABEL_90:
          if ((v91 & 1) != 0)
            goto LABEL_131;
          v99 = (uint64_t *)(v65 + 16 * v68);
          v101 = *v99;
          v100 = v99[1];
          v79 = __OFSUB__(v100, v101);
          v102 = v100 - v101;
          if (v79)
            goto LABEL_133;
          if (v102 < v90)
            goto LABEL_15;
LABEL_98:
          v107 = v68 - 1;
          if (v68 - 1 >= v20)
          {
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
            goto LABEL_146;
          }
          v108 = *a1;
          if (!*a1)
            goto LABEL_148;
          v109 = v19;
          v110 = (uint64_t *)(v65 + 16 * v107);
          v111 = *v110;
          v112 = (_QWORD *)(v65 + 16 * v68);
          v113 = v112[1];
          result = sub_1B69AF330(v108 + *(_QWORD *)(v131 + 72) * *v110, v108 + *(_QWORD *)(v131 + 72) * *v112, v108 + *(_QWORD *)(v131 + 72) * v113, v130);
          if (v2)
            goto LABEL_118;
          if (v113 < v111)
            goto LABEL_122;
          if (v68 > *(_QWORD *)(v109 + 16))
            goto LABEL_123;
          *v110 = v111;
          *(_QWORD *)(v65 + 16 * v107 + 8) = v113;
          v114 = *(_QWORD *)(v109 + 16);
          if (v68 >= v114)
            goto LABEL_124;
          v19 = v109;
          v20 = v114 - 1;
          result = (uint64_t)memmove((void *)(v65 + 16 * v68), v112 + 2, 16 * (v114 - 1 - v68));
          *(_QWORD *)(v109 + 16) = v114 - 1;
          a1 = v137;
          if (v114 <= 2)
            goto LABEL_15;
        }
      }
      v20 = 1;
LABEL_15:
      v12 = a1[1];
      v18 = v136;
      if (v136 >= v12)
      {
        v17 = v124;
        goto LABEL_107;
      }
    }
  }
  v17 = MEMORY[0x1E0DEE9D8];
  v130 = MEMORY[0x1E0DEE9D8]
       + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
  if (v12 == 1)
  {
    v124 = MEMORY[0x1E0DEE9D8];
    goto LABEL_13;
  }
  v20 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
  v19 = MEMORY[0x1E0DEE9D8];
LABEL_107:
  v124 = v17;
  if (v20 >= 2)
  {
    v115 = *a1;
    do
    {
      v116 = v20 - 2;
      if (v20 < 2)
        goto LABEL_137;
      if (!v115)
        goto LABEL_150;
      v117 = v19;
      v118 = v19 + 32;
      v119 = *(_QWORD *)(v19 + 32 + 16 * v116);
      v120 = *(_QWORD *)(v19 + 32 + 16 * (v20 - 1) + 8);
      result = sub_1B69AF330(v115 + *(_QWORD *)(v131 + 72) * v119, v115 + *(_QWORD *)(v131 + 72) * *(_QWORD *)(v118 + 16 * (v20 - 1)), v115 + *(_QWORD *)(v131 + 72) * v120, v130);
      if (v2)
        break;
      if (v120 < v119)
        goto LABEL_138;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1B69AF8C0(v117);
        v117 = result;
      }
      if (v116 >= *(_QWORD *)(v117 + 16))
        goto LABEL_139;
      v121 = (_QWORD *)(v117 + 32 + 16 * v116);
      *v121 = v119;
      v121[1] = v120;
      v122 = *(_QWORD *)(v117 + 16);
      if (v20 > v122)
        goto LABEL_140;
      v19 = v117;
      result = (uint64_t)memmove((void *)(v117 + 32 + 16 * (v20 - 1)), (const void *)(v117 + 32 + 16 * v20), 16 * (v122 - v20));
      *(_QWORD *)(v117 + 16) = v122 - 1;
      v20 = v122 - 1;
    }
    while (v122 > 2);
  }
LABEL_118:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v124 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69AF12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v24 = a1;
  v25 = type metadata accessor for HAREntry();
  v7 = MEMORY[0x1E0C80A78](v25);
  v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v22 - v10;
  result = MEMORY[0x1E0C80A78](v9);
  v15 = (char *)&v22 - v14;
  v27 = a3;
  v23 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v30 = v16 * (v27 - 1);
    v26 = v16;
    v29 = v16 * v27;
LABEL_5:
    v17 = 0;
    v18 = v24;
    while (1)
    {
      v19 = *a4;
      sub_1B69AF8E8(v29 + v17 + *a4, (uint64_t)v15);
      sub_1B69AF8E8(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_1B69CA0BC();
      sub_1B69AF92C((uint64_t)v11);
      result = sub_1B69AF92C((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v26;
        v29 += v26;
        if (++v27 == v23)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = v20 + v30 + v17;
      sub_1B69AF968(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_1B69AF968(v28, v21);
      v17 -= v26;
      if (v27 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1B69AF330(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v35 = type metadata accessor for HAREntry();
  v8 = MEMORY[0x1E0C80A78](v35);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v33 - v12;
  v15 = *(_QWORD *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v15 == -1)
    goto LABEL_59;
  v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1)
    goto LABEL_60;
  v17 = (uint64_t)(a2 - a1) / v15;
  v38 = a1;
  v37 = a4;
  if (v17 >= v16 / v15)
  {
    v19 = v16 / v15 * v15;
    if (a4 < a2 || a2 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v26 = a4 + v19;
    v36 = a4 + v19;
    v38 = a2;
    v34 = a1;
    if (v19 >= 1 && a1 < a2)
    {
      v28 = -v15;
      do
      {
        v29 = a3 + v28;
        sub_1B69AF8E8(v26 + v28, (uint64_t)v13);
        v30 = a2 + v28;
        sub_1B69AF8E8(a2 + v28, (uint64_t)v10);
        v31 = sub_1B69CA0BC();
        sub_1B69AF92C((uint64_t)v10);
        sub_1B69AF92C((uint64_t)v13);
        if ((v31 & 1) != 0)
        {
          if (a3 < a2 || v29 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != a2)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v38 += v28;
        }
        else
        {
          v32 = v36;
          v36 += v28;
          if (a3 < v32 || v29 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != v32)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v30 = a2;
        }
        v26 = v36;
        if (v36 <= a4)
          break;
        a2 = v30;
        a3 += v28;
      }
      while (v30 > v34);
    }
  }
  else
  {
    v18 = v17 * v15;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v20 = a4 + v18;
    v36 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_1B69AF8E8(a2, (uint64_t)v13);
        sub_1B69AF8E8(a4, (uint64_t)v10);
        v22 = sub_1B69CA0BC();
        sub_1B69AF92C((uint64_t)v10);
        sub_1B69AF92C((uint64_t)v13);
        v23 = v38;
        if ((v22 & 1) != 0)
        {
          v24 = a2 + v15;
          if (v38 < a2 || v38 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 == a2)
          {
            v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v25 = v37 + v15;
          if (v38 < v37 || v38 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 != v37)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v37 = v25;
          v24 = a2;
        }
        v38 = v23 + v15;
        a4 = v37;
        if (v37 >= v20)
          break;
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_1B69AF810(&v38, &v37, (uint64_t *)&v36);
  return 1;
}

char *sub_1B69AF718(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D828);
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

uint64_t sub_1B69AF810(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for HAREntry();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_13;
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_1B69AF8C0(uint64_t a1)
{
  return sub_1B69AF718(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

size_t sub_1B69AF8D4(_QWORD *a1)
{
  return sub_1B69AE5F4(0, a1[2], 0, a1);
}

uint64_t sub_1B69AF8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HAREntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B69AF92C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HAREntry();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B69AF968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HAREntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1B69AF9AC(_BYTE *a1@<X8>)
{
  FMNFileUploadRepresentable.method.getter(a1);
}

void FMNFileUploadRepresentable.method.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t FMNFileUploadRepresentable.requiresBodySignature.getter()
{
  return 0;
}

uint64_t FMNFileUploadRepresentable.requiresDSIDURL.getter()
{
  return 0;
}

unint64_t FMNFileUploadRepresentable.headerDictionary.getter()
{
  return sub_1B699FF94(MEMORY[0x1E0DEE9D8]);
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.fileURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.headerDictionary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.headerDictionary.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.headerDictionary.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.method.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.requiresBodySignature.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FMNFileUploadRepresentable.requiresDSIDURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t FMNMockingPreferences.domain.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMNMockingPreferences.filePath.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

FMNetworking::FMNMockingPreferences __swiftcall FMNMockingPreferences.init(domain:filePath:)(Swift::String domain, Swift::String filePath)
{
  Swift::String *v2;
  FMNetworking::FMNMockingPreferences result;

  *v2 = domain;
  v2[1] = filePath;
  result.filePath = filePath;
  result.domain = domain;
  return result;
}

uint64_t destroy for FMNMockingPreferences()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for FMNMockingPreferences(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for FMNMockingPreferences(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for FMNMockingPreferences(_QWORD *a1, _QWORD *a2)
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

uint64_t sub_1B69AFB98()
{
  uint64_t result;

  sub_1B69A0A18();
  result = sub_1B69CA3EC();
  qword_1EF141DE0 = result;
  return result;
}

void sub_1B69AFBF4(_BYTE *a1@<X8>)
{
  FMNRequestContentRepresentable.method.getter(a1);
}

uint64_t FMNRequestContentRepresentable.requiresBodySignature.getter()
{
  return 0;
}

uint64_t FMNRequestContentRepresentable.requiresDSIDURL.getter()
{
  return 0;
}

unint64_t FMNRequestContentRepresentable.headerDictionary.getter()
{
  return sub_1B699FF94(MEMORY[0x1E0DEE9D8]);
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.headerDictionary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.headerDictionary.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.headerDictionary.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.method.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.requiresBodySignature.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FMNRequestContentRepresentable.requiresDSIDURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t FMNResponseSerializableCodingStrategy.dateDecodingStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B699D610(v1, a1, &qword_1EF13D830);
}

uint64_t FMNResponseSerializableCodingStrategy.dateEncodingStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  return sub_1B699D610(v1 + *(int *)(v3 + 20), a1, &qword_1EF13D838);
}

uint64_t type metadata accessor for FMNResponseSerializableCodingStrategy()
{
  uint64_t result;

  result = qword_1EF13D8A0;
  if (!qword_1EF13D8A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t FMNResponseSerializableCodingStrategy.init(dateDecodingStrategy:dateEncodingStrategy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  sub_1B699D654(a1, a3, &qword_1EF13D830);
  v5 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  return sub_1B699D654(a2, a3 + *(int *)(v5 + 20), &qword_1EF13D838);
}

uint64_t sub_1B69AFD48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return static FMNResponseSerializable.decode(data:)(a1, a2, a3, a4, a5);
}

uint64_t static FMNResponseSerializable.decode(data:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[6];
  uint64_t MetatypeMetadata;

  v36[4] = a2;
  v36[3] = a1;
  v36[1] = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D840);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1B69C9F18();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)v36 - v18;
  sub_1B69C9F48();
  swift_allocObject();
  v36[0] = sub_1B69C9F3C();
  v20 = *(void (**)(uint64_t, uint64_t))(a4 + 48);
  v36[2] = a4;
  v20(a3, a4);
  v21 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v9, 1, v21) == 1)
  {
    sub_1B6999FB0((uint64_t)v9, &qword_1EF13D840);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_4:
    v22 = sub_1B6999FB0((uint64_t)v12, &qword_1EF13D830);
    goto LABEL_6;
  }
  sub_1B699D610((uint64_t)v9, (uint64_t)v12, &qword_1EF13D830);
  sub_1B69B0C2C((uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    goto LABEL_4;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  sub_1B69C9F24();
  v22 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
LABEL_6:
  v23 = (void *)MEMORY[0x1BCC9A848](v22);
  v24 = (void *)v36[5];
  sub_1B69C9F30();
  objc_autoreleasePoolPop(v23);
  if (!v24)
    return swift_release();
  swift_release();
  sub_1B69CA368();
  sub_1B69A0A18();
  v25 = (void *)sub_1B69CA3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1B69CB2C0;
  MetatypeMetadata = swift_getMetatypeMetadata();
  swift_getMetatypeMetadata();
  v27 = sub_1B69CA284();
  v29 = v28;
  v30 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v26 + 56) = MEMORY[0x1E0DEA968];
  v31 = sub_1B699F398();
  *(_QWORD *)(v26 + 64) = v31;
  *(_QWORD *)(v26 + 32) = v27;
  *(_QWORD *)(v26 + 40) = v29;
  MetatypeMetadata = (uint64_t)v24;
  v32 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA00);
  v33 = sub_1B69CA284();
  *(_QWORD *)(v26 + 96) = v30;
  *(_QWORD *)(v26 + 104) = v31;
  *(_QWORD *)(v26 + 72) = v33;
  *(_QWORD *)(v26 + 80) = v34;
  sub_1B69CA11C();

  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t FMNResponseSerializable.dictionaryValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  uint64_t v8;

  v3 = v2;
  v8 = MEMORY[0x1E0DEE9E0];
  v6 = (void *)MEMORY[0x1BCC9A848]();
  sub_1B69B0C68(v3, &v8, a1, a2);
  objc_autoreleasePoolPop(v6);
  return v8;
}

uint64_t FMNResponseSerializable.data.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D840);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B69C9F54();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v20 - v15;
  sub_1B69C9F84();
  swift_allocObject();
  sub_1B69C9F78();
  (*(void (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
  v17 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v6, 1, v17) == 1)
  {
    sub_1B6999FB0((uint64_t)v6, &qword_1EF13D840);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  }
  else
  {
    sub_1B699D610((uint64_t)&v6[*(int *)(v17 + 20)], (uint64_t)v9, &qword_1EF13D838);
    sub_1B69B0C2C((uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
      sub_1B69C9F60();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
      goto LABEL_6;
    }
  }
  sub_1B6999FB0((uint64_t)v9, &qword_1EF13D838);
LABEL_6:
  v18 = sub_1B69C9F6C();
  swift_release();
  return v18;
}

void KeyedDecodingContainer.compactDecode<A>(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
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
  void *v28;
  uint64_t v29[2];

  v6 = v4;
  v11 = (void *)MEMORY[0x1BCC9A848]();
  v13 = *(_QWORD *)(a2 + 16);
  v12 = *(_QWORD *)(a2 + 24);
  sub_1B69B07E0(v6, a1, v13, a3, v12, a4);
  if (v5)
  {
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    v14 = v29[1];
    v15 = (void *)MEMORY[0x1BCC9A848]();
    sub_1B69B08B4(a3, v12, a4, v29);
    objc_autoreleasePoolPop(v15);
    v16 = v29[0];
    v18 = type metadata accessor for OptionalDecodable(0, a3, a4, v17);
    v19 = MEMORY[0x1BCC9A368](v14, v18);
    v20 = MEMORY[0x1BCC9A368](v16, a3);
    if (v19 == v20)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1B69CB7E0;
      v29[0] = a3;
      swift_getMetatypeMetadata();
      v23 = sub_1B69CA284();
      v25 = v24;
      *(_QWORD *)(v22 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v22 + 64) = sub_1B699F398();
      *(_QWORD *)(v22 + 32) = v23;
      *(_QWORD *)(v22 + 40) = v25;
      swift_bridgeObjectRelease();
      v26 = MEMORY[0x1E0DEB418];
      v27 = MEMORY[0x1E0DEB490];
      *(_QWORD *)(v22 + 96) = MEMORY[0x1E0DEB418];
      *(_QWORD *)(v22 + 104) = v27;
      *(_QWORD *)(v22 + 72) = v19;
      *(_QWORD *)(v22 + 136) = v26;
      *(_QWORD *)(v22 + 144) = v27;
      *(_QWORD *)(v22 + 112) = v21;
      sub_1B69A0A18();
      v28 = (void *)sub_1B69CA3E0();
      sub_1B69CA374();
      sub_1B69CA110();
      swift_bridgeObjectRelease();

    }
  }
}

uint64_t sub_1B69B07E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = type metadata accessor for OptionalDecodable(255, a4, a6, a4);
  v7 = sub_1B69CA350();
  sub_1B69CA59C();
  v9 = MEMORY[0x1BCC9ABA8](&unk_1B69CB898, v6);
  MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DEAF40], v7, &v9);
  return sub_1B69CA584();
}

uint64_t sub_1B69B08B4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t result;

  type metadata accessor for OptionalDecodable(255, a1, a3, a2);
  v5 = sub_1B69CA350();
  MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DEAF38], v5);
  result = sub_1B69CA308();
  *a4 = result;
  return result;
}

uint64_t sub_1B69B0954@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
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
  void *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];

  v31 = a3;
  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v29 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v7;
  v28 = v8;
  v10 = type metadata accessor for OptionalDecodable(0, v7, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v23 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v14 = sub_1B69CA794();
  if (v3)
  {
    v15 = (uint64_t)a1;
  }
  else
  {
    v23 = v5;
    v24 = v13;
    v25 = v11;
    v26 = v10;
    v27 = a1;
    v16 = (void *)MEMORY[0x1BCC9A848](v14);
    __swift_project_boxed_opaque_existential_1(v32, v32[3]);
    v18 = v29;
    v17 = v30;
    sub_1B69CA698();
    objc_autoreleasePoolPop(v16);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v32);
    v19 = v23;
    v20 = v24;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v24, v18, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v20, 0, 1, v17);
    v21 = (uint64_t)v27;
    (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v31, v20, v26);
    v15 = v21;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm(v15);
}

uint64_t sub_1B69B0C10@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1B69B0954(a1, *(_QWORD *)(a2 + 16), a3);
}

uint64_t sub_1B69B0C2C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FMNResponseSerializableCodingStrategy();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B69B0C68(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t result;
  id v13;
  uint64_t v14;
  id v15[5];

  v15[4] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  v7 = v6;
  v8 = (void *)objc_opt_self();
  v9 = (void *)sub_1B69CA098();
  v15[0] = 0;
  v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, v15);

  if (v10)
  {
    v11 = v15[0];
    sub_1B69CA428();
    sub_1B699DB18(v5, v7);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA20);
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      *a2 = v14;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v13 = v15[0];
    sub_1B69CA008();

    swift_willThrow();
    return sub_1B699DB18(v5, v7);
  }
  return result;
}

uint64_t type metadata accessor for OptionalDecodable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OptionalDecodable);
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNResponseSerializableCodingStrategy(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B69C9F18();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 20);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_1B69C9F54();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return a1;
}

uint64_t destroy for FMNResponseSerializableCodingStrategy(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = sub_1B69C9F18();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = sub_1B69C9F54();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

char *initializeWithCopy for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1B69C9F18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1B69C9F54();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithCopy for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = sub_1B69C9F18();
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
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1B69C9F54();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

char *initializeWithTake for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1B69C9F18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1B69C9F54();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithTake for FMNResponseSerializableCodingStrategy(char *a1, char *a2, uint64_t a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = sub_1B69C9F18();
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
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1B69C9F54();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMNResponseSerializableCodingStrategy()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69B15EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for FMNResponseSerializableCodingStrategy()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69B1674(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D830);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13D838);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1B69B16F8()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B6995870(319, &qword_1EF13D8B0, (void (*)(uint64_t))MEMORY[0x1E0CAE048]);
  if (v0 <= 0x3F)
  {
    sub_1B6995870(319, qword_1EF13D8B8, (void (*)(uint64_t))MEMORY[0x1E0CAE160]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t dispatch thunk of static FMNResponseSerializable.decode(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of FMNResponseSerializable.dictionaryValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FMNResponseSerializable.data.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static FMNResponseSerializable.codingStrategy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_1B69B17CC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B69B17D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69CA3F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B69B1840(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1B69B1918(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *sub_1B69B1974(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1B69B1A0C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

void *sub_1B69B1AEC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1B69B1B84(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t sub_1B69B1C64(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void sub_1B69B1DA4(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_1B69B1F4C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_1B69B1F54()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t sub_1B69B1F78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1B69CA3F8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

FMNetworking::FMNRequestMethod_optional __swiftcall FMNRequestMethod.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FMNetworking::FMNRequestMethod_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1B69CA524();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t FMNRequestMethod.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69B204C + 4 * byte_1B69CB8C0[*v0]))(5522759, 0xE300000000000000);
}

uint64_t sub_1B69B204C()
{
  return 1414745936;
}

uint64_t sub_1B69B205C()
{
  return 5526864;
}

uint64_t sub_1B69B2068()
{
  return 0x4554454C4544;
}

void sub_1B69B207C(char *a1)
{
  sub_1B69A6B4C(*a1);
}

unint64_t sub_1B69B208C()
{
  unint64_t result;

  result = qword_1EF13D968;
  if (!qword_1EF13D968)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNRequestMethod, &type metadata for FMNRequestMethod);
    atomic_store(result, (unint64_t *)&qword_1EF13D968);
  }
  return result;
}

void sub_1B69B20D0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B69CA770();
  __asm { BR              X9 }
}

uint64_t sub_1B69B2114()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

void sub_1B69B216C()
{
  __asm { BR              X10 }
}

uint64_t sub_1B69B21A0()
{
  sub_1B69CA29C();
  return swift_bridgeObjectRelease();
}

void sub_1B69B21E4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B69CA770();
  __asm { BR              X9 }
}

uint64_t sub_1B69B2224()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

FMNetworking::FMNRequestMethod_optional sub_1B69B227C(Swift::String *a1)
{
  return FMNRequestMethod.init(rawValue:)(*a1);
}

uint64_t sub_1B69B2288()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1B69B22B0 + 4 * byte_1B69CB8D0[*v0]))();
}

void sub_1B69B22B0(_QWORD *a1@<X8>)
{
  *a1 = 1414745936;
  a1[1] = 0xE400000000000000;
}

void sub_1B69B22C4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 5526864;
  a1[1] = v1;
}

void sub_1B69B22D4(_QWORD *a1@<X8>)
{
  *a1 = 0x4554454C4544;
  a1[1] = 0xE600000000000000;
}

uint64_t dispatch thunk of FMNRequestCredential.authToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNRequestCredential.authToken.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FMNRequestCredential.authToken.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FMNRequestCredential.personId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FMNRequestCredential.personId.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of FMNRequestCredential.personId.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of FMNRequestCredential.authHeaders.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of FMNRequestCredential.accountType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of FMNRequestCredential.hostName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of FMNRequestCredential.hostName.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of FMNRequestCredential.hostName.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t storeEnumTagSinglePayload for FMNRequestMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69B2390 + 4 * byte_1B69CB8D9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B69B23C4 + 4 * byte_1B69CB8D4[v4]))();
}

uint64_t sub_1B69B23C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B23CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69B23D4);
  return result;
}

uint64_t sub_1B69B23E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69B23E8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B69B23EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B23F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNRequestMethod()
{
  return &type metadata for FMNRequestMethod;
}

BOOL sub_1B69B2418(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_1B69B2430()
{
  unint64_t result;

  result = qword_1EF13D970;
  if (!qword_1EF13D970)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBBB8, &type metadata for FMNRequest.SerializationError);
    atomic_store(result, (unint64_t *)&qword_1EF13D970);
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskSerializationError()
{
  return &type metadata for TaskSerializationError;
}

_QWORD *sub_1B69B248C(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B69CA068();
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v8((_QWORD *)((char *)a1 + v9), (_QWORD *)((char *)a2 + v9), v7);
    v10 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = *((_QWORD *)v12 + 3);
    swift_bridgeObjectRetain();
    if (v13)
    {
      v14 = *((_QWORD *)v12 + 4);
      *((_QWORD *)v11 + 3) = v13;
      *((_QWORD *)v11 + 4) = v14;
      (**(void (***)(char *, char *, uint64_t))(v13 - 8))(v11, v12, v13);
    }
    else
    {
      v16 = *((_OWORD *)v12 + 1);
      *(_OWORD *)v11 = *(_OWORD *)v12;
      *((_OWORD *)v11 + 1) = v16;
      *((_QWORD *)v11 + 4) = *((_QWORD *)v12 + 4);
    }
  }
  return a1;
}

uint64_t sub_1B69B2584(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t result;

  v4 = sub_1B69CA068();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 24), v4);
  swift_bridgeObjectRelease();
  result = a1 + *(int *)(a2 + 32);
  if (*(_QWORD *)(result + 24))
    return __swift_destroy_boxed_opaque_existential_0Tm(result);
  return result;
}

uint64_t sub_1B69B2608(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  v6 = sub_1B69CA068();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  v9 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = *(_QWORD *)(v11 + 24);
  swift_bridgeObjectRetain();
  if (v12)
  {
    v13 = *(_QWORD *)(v11 + 32);
    *(_QWORD *)(v10 + 24) = v12;
    *(_QWORD *)(v10 + 32) = v13;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8))(v10, v11, v12);
  }
  else
  {
    v14 = *(_OWORD *)(v11 + 16);
    *(_OWORD *)v10 = *(_OWORD *)v11;
    *(_OWORD *)(v10 + 16) = v14;
    *(_QWORD *)(v10 + 32) = *(_QWORD *)(v11 + 32);
  }
  return a1;
}

uint64_t sub_1B69B26D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v6 = sub_1B69CA068();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7(a1 + a3[6], a2 + a3[6], v6);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = a3[8];
  v9 = a1 + v8;
  v10 = (__int128 *)(a2 + v8);
  v11 = *((_QWORD *)v10 + 3);
  if (!*(_QWORD *)(a1 + v8 + 24))
  {
    if (v11)
    {
      *(_QWORD *)(v9 + 24) = v11;
      *(_QWORD *)(v9 + 32) = *((_QWORD *)v10 + 4);
      (**(void (***)(uint64_t, __int128 *))(v11 - 8))(v9, v10);
      return a1;
    }
LABEL_7:
    v12 = *v10;
    v13 = v10[1];
    *(_QWORD *)(v9 + 32) = *((_QWORD *)v10 + 4);
    *(_OWORD *)v9 = v12;
    *(_OWORD *)(v9 + 16) = v13;
    return a1;
  }
  if (!v11)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v9);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v9, (uint64_t *)v10);
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

uint64_t sub_1B69B2940(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = sub_1B69CA068();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  v9 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = *(_OWORD *)(v11 + 16);
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *(_OWORD *)(v10 + 16) = v12;
  *(_QWORD *)(v10 + 32) = *(_QWORD *)(v11 + 32);
  return a1;
}

uint64_t sub_1B69B29DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v6 = sub_1B69CA068();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  v9 = a3[8];
  v10 = a1 + v9;
  if (*(_QWORD *)(a1 + v9 + 24))
    __swift_destroy_boxed_opaque_existential_0Tm(a1 + v9);
  v11 = *(_OWORD *)(a2 + v9 + 16);
  *(_OWORD *)v10 = *(_OWORD *)(a2 + v9);
  *(_OWORD *)(v10 + 16) = v11;
  *(_QWORD *)(v10 + 32) = *(_QWORD *)(a2 + v9 + 32);
  return a1;
}

uint64_t sub_1B69B2A94()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69B2AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1B69CA068();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1B69B2B1C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69B2B28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1B69CA068();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for FMNFileUploadRequest(uint64_t a1)
{
  return sub_1B699DAC4(a1, qword_1EF13D9D0);
}

uint64_t sub_1B69B2BB4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69CA068();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s12FMNetworking22TaskSerializationErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69B2C8C + 4 * byte_1B69CB8E3[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B69B2CC0 + 4 * byte_1B69CB8DE[v4]))();
}

uint64_t sub_1B69B2CC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B2CC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69B2CD0);
  return result;
}

uint64_t sub_1B69B2CDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69B2CE4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B69B2CE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B2CF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNRequest.SerializationError()
{
  return &type metadata for FMNRequest.SerializationError;
}

uint64_t *sub_1B69B2D0C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1B69CA068();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = (uint64_t *)((char *)v4 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = *v13;
    v15 = v13[1];
    sub_1B699D90C(*v13, v15);
    v16 = a3[7];
    v17 = a3[8];
    v18 = *(uint64_t *)((char *)a2 + v16);
    *v12 = v14;
    v12[1] = v15;
    *(uint64_t *)((char *)v4 + v16) = v18;
    v19 = (char *)v4 + v17;
    v20 = (char *)a2 + v17;
    v21 = *((_QWORD *)v20 + 3);
    swift_bridgeObjectRetain();
    if (v21)
    {
      v22 = *((_QWORD *)v20 + 4);
      *((_QWORD *)v19 + 3) = v21;
      *((_QWORD *)v19 + 4) = v22;
      (**(void (***)(char *, char *, uint64_t))(v21 - 8))(v19, v20, v21);
    }
    else
    {
      v24 = *((_OWORD *)v20 + 1);
      *(_OWORD *)v19 = *(_OWORD *)v20;
      *((_OWORD *)v19 + 1) = v24;
      *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
    }
  }
  return v4;
}

_BYTE *sub_1B69B2E18(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B69CA068();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = (uint64_t *)&a1[v10];
  v12 = (uint64_t *)&a2[v10];
  v13 = *v12;
  v14 = v12[1];
  sub_1B699D90C(*v12, v14);
  v15 = a3[7];
  v16 = a3[8];
  v17 = *(_QWORD *)&a2[v15];
  *v11 = v13;
  v11[1] = v14;
  *(_QWORD *)&a1[v15] = v17;
  v18 = &a1[v16];
  v19 = &a2[v16];
  v20 = *((_QWORD *)v19 + 3);
  swift_bridgeObjectRetain();
  if (v20)
  {
    v21 = *((_QWORD *)v19 + 4);
    *((_QWORD *)v18 + 3) = v20;
    *((_QWORD *)v18 + 4) = v21;
    (**(void (***)(_BYTE *, _BYTE *, uint64_t))(v20 - 8))(v18, v19, v20);
  }
  else
  {
    v22 = *((_OWORD *)v19 + 1);
    *(_OWORD *)v18 = *(_OWORD *)v19;
    *((_OWORD *)v18 + 1) = v22;
    *((_QWORD *)v18 + 4) = *((_QWORD *)v19 + 4);
  }
  return a1;
}

_BYTE *sub_1B69B2EF8(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B69CA068();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (uint64_t *)&a1[v10];
  v12 = (uint64_t *)&a2[v10];
  v13 = *v12;
  v14 = v12[1];
  sub_1B699D90C(*v12, v14);
  v15 = *v11;
  v16 = v11[1];
  *v11 = v13;
  v11[1] = v14;
  sub_1B699DB18(v15, v16);
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[8];
  v18 = (uint64_t)&a1[v17];
  v19 = &a2[v17];
  v20 = *((_QWORD *)v19 + 3);
  if (!*(_QWORD *)&a1[v17 + 24])
  {
    if (v20)
    {
      *(_QWORD *)(v18 + 24) = v20;
      *(_QWORD *)(v18 + 32) = *((_QWORD *)v19 + 4);
      (**(void (***)(uint64_t, _BYTE *))(v20 - 8))(v18, v19);
      return a1;
    }
LABEL_7:
    v21 = *(_OWORD *)v19;
    v22 = *((_OWORD *)v19 + 1);
    *(_QWORD *)(v18 + 32) = *((_QWORD *)v19 + 4);
    *(_OWORD *)v18 = v21;
    *(_OWORD *)(v18 + 16) = v22;
    return a1;
  }
  if (!v20)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v18);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v18, (uint64_t *)v19);
  return a1;
}

_BYTE *sub_1B69B3014(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  __int128 v14;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B69CA068();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  v11 = a3[8];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  return a1;
}

_BYTE *sub_1B69B30B0(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  __int128 v15;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B69CA068();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = *(_QWORD *)&a1[v10];
  v12 = *(_QWORD *)&a1[v10 + 8];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  sub_1B699DB18(v11, v12);
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  v13 = a3[8];
  v14 = &a1[v13];
  if (*(_QWORD *)&a1[v13 + 24])
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&a1[v13]);
  v15 = *(_OWORD *)&a2[v13 + 16];
  *(_OWORD *)v14 = *(_OWORD *)&a2[v13];
  *((_OWORD *)v14 + 1) = v15;
  *((_QWORD *)v14 + 4) = *(_QWORD *)&a2[v13 + 32];
  return a1;
}

uint64_t sub_1B69B3174()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69B3180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1B69CA068();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1B69B3200()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69B320C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1B69CA068();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

unint64_t sub_1B69B328C()
{
  unint64_t result;

  result = qword_1EF13DA18;
  if (!qword_1EF13DA18)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBAD8, &type metadata for FMNRequest.SerializationError);
    atomic_store(result, (unint64_t *)&qword_1EF13DA18);
  }
  return result;
}

unint64_t sub_1B69B32D4()
{
  unint64_t result;

  result = qword_1EF13DA20;
  if (!qword_1EF13DA20)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBB50, &type metadata for TaskSerializationError);
    atomic_store(result, (unint64_t *)&qword_1EF13DA20);
  }
  return result;
}

Swift::String_optional __swiftcall FMNRedirectHostStore.redirectedHost()()
{
  NSObject **v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  Swift::String_optional result;
  _QWORD aBlock[6];
  _OWORD v13[3];
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v1 = (uint64_t)v0;
  v15 = 0;
  v16 = 0;
  v2 = *v0;
  sub_1B69A0A54(v1, (uint64_t)v13);
  v3 = swift_allocObject();
  v4 = v13[1];
  *(_OWORD *)(v3 + 16) = v13[0];
  *(_OWORD *)(v3 + 32) = v4;
  *(_OWORD *)(v3 + 48) = v13[2];
  *(_QWORD *)(v3 + 64) = v14;
  *(_QWORD *)(v3 + 72) = &v15;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1B69963D8;
  *(_QWORD *)(v5 + 24) = v3;
  aBlock[4] = sub_1B6996398;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6996370;
  aBlock[3] = &block_descriptor_9;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync(v2, v6);
  _Block_release(v6);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  v7 = swift_release();
  if ((v2 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = v15;
    v10 = v16;
    swift_release();
    v7 = v9;
    v8 = v10;
  }
  result.value._object = v8;
  result.value._countAndFlagsBits = v7;
  return result;
}

uint64_t sub_1B69B3478()
{
  _BYTE *v0;

  if (*v0)
    return 0x64496E6F73726570;
  else
    return 1953722216;
}

uint64_t sub_1B69B34AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B69B409C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B69B34D0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1B69B34DC()
{
  sub_1B69B38F0();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69B3504()
{
  sub_1B69B38F0();
  return sub_1B69CA7D0();
}

uint64_t FMNRedirectedHost.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DA28);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v9[1] = *(_QWORD *)(v1 + 24);
  v9[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69B38F0();
  sub_1B69CA7AC();
  v12 = 0;
  sub_1B69CA5B4();
  if (!v2)
  {
    v11 = 1;
    sub_1B69CA5B4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t FMNRedirectedHost.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DA38);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69B38F0();
  sub_1B69CA7A0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  v20 = 0;
  v9 = sub_1B69CA554();
  v11 = v10;
  v19 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_1B69CA554();
  v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v16;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69B3800@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return FMNRedirectedHost.init(from:)(a1, a2);
}

uint64_t sub_1B69B3814(_QWORD *a1)
{
  return FMNRedirectedHost.encode(to:)(a1);
}

uint64_t FMNRedirectHostStore.credential.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B69968B4(v1 + 8, a1);
}

uint64_t sub_1B69B3834()
{
  return objectdestroyTm_0();
}

Swift::Void __swiftcall FMNRedirectHostStore.clearRedirectedHostKeychainItems()()
{
  sub_1B69A10C0((uint64_t)&unk_1E6A25A20, (uint64_t)sub_1B69B393C, (uint64_t)&block_descriptor_15);
}

void sub_1B69B3858()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (id)sub_1B69CA23C();
  objc_msgSend(v0, sel_removeObjectForKey_, v1);

}

uint64_t sub_1B69B38D8()
{
  return objectdestroyTm_0();
}

uint64_t sub_1B69B38E0()
{
  return swift_deallocObject();
}

unint64_t sub_1B69B38F0()
{
  unint64_t result;

  result = qword_1EF13DA30;
  if (!qword_1EF13DA30)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBD98, &type metadata for FMNRedirectedHost.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DA30);
  }
  return result;
}

uint64_t sub_1B69B3934()
{
  return objectdestroyTm_0();
}

void sub_1B69B393C()
{
  sub_1B69B3858();
}

Swift::Void __swiftcall FMNRedirectHostStore.saveRedirectedHost(host:)(Swift::String host)
{
  _QWORD *v1;
  _QWORD *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  _QWORD v17[3];
  _QWORD aBlock[6];
  _OWORD v19[3];
  uint64_t v20;

  v2 = v1;
  object = host._object;
  countAndFlagsBits = host._countAndFlagsBits;
  v5 = sub_1B69CA134();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B69CA158();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = *v2;
  sub_1B69A0A54((uint64_t)v2, (uint64_t)v19);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = countAndFlagsBits;
  *(_QWORD *)(v14 + 24) = object;
  v15 = v19[1];
  *(_OWORD *)(v14 + 32) = v19[0];
  *(_OWORD *)(v14 + 48) = v15;
  *(_OWORD *)(v14 + 64) = v19[2];
  *(_QWORD *)(v14 + 80) = v20;
  aBlock[4] = sub_1B69B3E1C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_21;
  v16 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_1B69CA14C();
  v17[2] = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, v6, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v13, v9, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
}

uint64_t sub_1B69B3B58(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v5 = a3[4];
  v6 = a3[5];
  __swift_project_boxed_opaque_existential_1(a3 + 1, v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
  swift_bridgeObjectRetain();
  v7(v5, v6);
  sub_1B69C9F84();
  swift_allocObject();
  sub_1B69C9F78();
  sub_1B69B417C();
  v8 = sub_1B69C9F6C();
  v10 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1B69CADE0;
  *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v11 + 64) = sub_1B699F398();
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  swift_bridgeObjectRetain();
  v12 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  v13 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v14 = (void *)sub_1B69CA098();
  v15 = (void *)sub_1B69CA23C();
  objc_msgSend(v13, sel_setValue_forKey_, v14, v15);

  sub_1B699DB18(v8, v10);
  return swift_release();
}

uint64_t sub_1B69B3DE0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69B3E1C()
{
  uint64_t *v0;

  return sub_1B69B3B58(v0[2], v0[3], v0 + 4);
}

ValueMetadata *type metadata accessor for FMNRedirectedHost()
{
  return &type metadata for FMNRedirectedHost;
}

uint64_t assignWithCopy for FMNRedirectHostStore(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FMNRedirectHostStore(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  __swift_destroy_boxed_opaque_existential_0Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_release();
  return a1;
}

uint64_t storeEnumTagSinglePayload for FMNRedirectedHost.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69B3F44 + 4 * byte_1B69CBC45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B69B3F78 + 4 * byte_1B69CBC40[v4]))();
}

uint64_t sub_1B69B3F78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B3F80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69B3F88);
  return result;
}

uint64_t sub_1B69B3F94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69B3F9CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B69B3FA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B3FA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNRedirectedHost.CodingKeys()
{
  return &type metadata for FMNRedirectedHost.CodingKeys;
}

unint64_t sub_1B69B3FC8()
{
  unint64_t result;

  result = qword_1EF13DA40;
  if (!qword_1EF13DA40)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBD70, &type metadata for FMNRedirectedHost.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DA40);
  }
  return result;
}

unint64_t sub_1B69B4010()
{
  unint64_t result;

  result = qword_1EF13DA48;
  if (!qword_1EF13DA48)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBCE0, &type metadata for FMNRedirectedHost.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DA48);
  }
  return result;
}

unint64_t sub_1B69B4058()
{
  unint64_t result;

  result = qword_1EF13DA50;
  if (!qword_1EF13DA50)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBD08, &type metadata for FMNRedirectedHost.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DA50);
  }
  return result;
}

uint64_t sub_1B69B409C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1953722216 && a2 == 0xE400000000000000;
  if (v2 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64496E6F73726570 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_1B69B417C()
{
  unint64_t result;

  result = qword_1EF13DA58;
  if (!qword_1EF13DA58)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNRedirectedHost, &type metadata for FMNRedirectedHost);
    atomic_store(result, (unint64_t *)&qword_1EF13DA58);
  }
  return result;
}

uint64_t sub_1B69B41C0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1B69B41F0()
{
  unint64_t result;

  result = qword_1EF13DA60;
  if (!qword_1EF13DA60)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNRedirectedHost, &type metadata for FMNRedirectedHost);
    atomic_store(result, (unint64_t *)&qword_1EF13DA60);
  }
  return result;
}

uint64_t FMNPreferenceKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1B69CA524();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t FMNPreferenceKey.rawValue.getter()
{
  return 0x53656C6946657355;
}

uint64_t sub_1B69B42C8()
{
  sub_1B69CA770();
  sub_1B69CA29C();
  return sub_1B69CA788();
}

uint64_t sub_1B69B4324()
{
  return sub_1B69CA29C();
}

uint64_t sub_1B69B4348()
{
  sub_1B69CA770();
  sub_1B69CA29C();
  return sub_1B69CA788();
}

uint64_t sub_1B69B43A0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1B69CA524();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1B69B43F0(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "UseFileServer");
  *(_WORD *)(a1 + 14) = -4864;
}

uint64_t FMNURLSessionFactory.mockSessionCreationBlock.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_1B69A1624(v1);
  return v1;
}

__n128 FMNURLSessionFactory.__allocating_init(mockSessionCreationBlock:preferences:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __n128 result;
  __int128 v8;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  result = *(__n128 *)a3;
  v8 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v6 + 32) = *(_OWORD *)a3;
  *(_OWORD *)(v6 + 48) = v8;
  return result;
}

uint64_t FMNURLSessionFactory.init(mockSessionCreationBlock:preferences:)(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3;
  __int128 v4;

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  v4 = a3[1];
  *(_OWORD *)(v3 + 32) = *a3;
  *(_OWORD *)(v3 + 48) = v4;
  return v3;
}

unint64_t sub_1B69B44A4()
{
  unint64_t result;

  result = qword_1EF13DA68;
  if (!qword_1EF13DA68)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBFA0, &type metadata for FMNURLSessionFactory.URLSessionFactoryError);
    atomic_store(result, (unint64_t *)&qword_1EF13DA68);
  }
  return result;
}

void sub_1B69B44E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unsigned int (*v10)(char *, uint64_t, uint64_t);
  char v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B69CA068();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v1 + 40))
  {
    sub_1B69970B8(a1, (uint64_t)v5);
    v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    if (v10(v5, 1, v6) == 1)
    {
      sub_1B6997028((uint64_t)v5);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
      v11 = sub_1B69CA014();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v11 & 1) == 0)
      {
        __break(1u);
        return;
      }
    }
    v12 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
    swift_bridgeObjectRetain();
    v13 = (void *)sub_1B69CA23C();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v12, sel_initWithSuiteName_, v13);

    if (v10((char *)a1, 1, v6) == 1)
    {
      if (!v14)
        return;
      v15 = v14;
      v16 = (void *)sub_1B69CA23C();
      objc_msgSend(v15, sel_removeObjectForKey_, v16);
    }
    else
    {
      if (!v14)
        return;
      v17 = v14;
      v16 = (void *)sub_1B69CA23C();
      objc_msgSend(v17, sel_setBool_forKey_, 1, v16);
    }

  }
}

uint64_t *FMNURLSessionFactory.deinit()
{
  uint64_t *v0;

  sub_1B6996708(v0[2]);
  sub_1B69B41C0(v0[4], v0[5]);
  return v0;
}

uint64_t FMNURLSessionFactory.__deallocating_deinit()
{
  uint64_t *v0;

  sub_1B6996708(v0[2]);
  sub_1B69B41C0(v0[4], v0[5]);
  return swift_deallocClassInstance();
}

unint64_t sub_1B69B4774()
{
  unint64_t result;

  result = qword_1EF13DA70;
  if (!qword_1EF13DA70)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNPreferenceKey, &type metadata for FMNPreferenceKey);
    atomic_store(result, (unint64_t *)&qword_1EF13DA70);
  }
  return result;
}

uint64_t dispatch thunk of FMNetworkingURLSession.dataTask(with:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of FMNetworkingURLSession.uploadTask(with:fromFile:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of FMNetworkingURLSession.finishTasksAndInvalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for FMNPreferenceKey()
{
  return &type metadata for FMNPreferenceKey;
}

uint64_t method lookup function for FMNURLSessionFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNURLSessionFactory.__allocating_init(mockSessionCreationBlock:preferences:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FMNURLSessionFactory.session(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of FMNURLSessionFactory.fileServer(fileURL:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t _s12FMNetworking16FMNPreferenceKeyOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B69B4864 + 4 * byte_1B69CBDF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B69B4884 + 4 * byte_1B69CBDF5[v4]))();
}

_BYTE *sub_1B69B4864(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B69B4884(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69B488C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69B4894(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69B489C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69B48A4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FMNURLSessionFactory.URLSessionFactoryError()
{
  return &type metadata for FMNURLSessionFactory.URLSessionFactoryError;
}

unint64_t sub_1B69B48C4()
{
  unint64_t result;

  result = qword_1EF13DA78;
  if (!qword_1EF13DA78)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBF78, &type metadata for FMNURLSessionFactory.URLSessionFactoryError);
    atomic_store(result, (unint64_t *)&qword_1EF13DA78);
  }
  return result;
}

id MockURLDataTask.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MockURLDataTask();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MockURLDataTask()
{
  return objc_opt_self();
}

uint64_t method lookup function for MockURLDataTask()
{
  return swift_lookUpClassMethod();
}

unint64_t FMNetworkingPreferenceDomain.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_1B69B4A00()
{
  sub_1B69CA770();
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

void sub_1B69B4A84(char a1)
{
  sub_1B69CA770();
  __asm { BR              X10 }
}

uint64_t sub_1B69B4ADC()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

void sub_1B69B4B44(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B69B4B88()
{
  sub_1B69CA29C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69B4BD4()
{
  sub_1B69CA770();
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

void sub_1B69B4C54(uint64_t a1, char a2)
{
  sub_1B69CA770();
  __asm { BR              X10 }
}

uint64_t sub_1B69B4CA8()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

BOOL static FMNServerInteractionController.FMNServerInteractionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FMNServerInteractionController.FMNServerInteractionError.hash(into:)()
{
  return sub_1B69CA77C();
}

uint64_t FMNServerInteractionController.FMNServerInteractionError.hashValue.getter()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

FMNetworking::FMNServerInteractionController::InternalServerMetadata::HeaderKeys_optional __swiftcall FMNServerInteractionController.InternalServerMetadata.HeaderKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FMNetworking::FMNServerInteractionController::InternalServerMetadata::HeaderKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1B69CA524();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t FMNServerInteractionController.InternalServerMetadata.HeaderKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1B69B4E1C + 4 * byte_1B69CC01C[*v0]))(0xD000000000000012, 0x80000001B69CD610);
}

uint64_t sub_1B69B4E1C(uint64_t a1)
{
  return a1 + 2;
}

void sub_1B69B4E54(char *a1)
{
  sub_1B69A6774(*a1);
}

void sub_1B69B4E60()
{
  char *v0;

  sub_1B69B4A84(*v0);
}

void sub_1B69B4E68(uint64_t a1)
{
  char *v1;

  sub_1B69B4B44(a1, *v1);
}

void sub_1B69B4E70(uint64_t a1)
{
  char *v1;

  sub_1B69B4C54(a1, *v1);
}

FMNetworking::FMNServerInteractionController::InternalServerMetadata::HeaderKeys_optional sub_1B69B4E78(Swift::String *a1)
{
  return FMNServerInteractionController.InternalServerMetadata.HeaderKeys.init(rawValue:)(*a1);
}

uint64_t sub_1B69B4E84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FMNServerInteractionController.InternalServerMetadata.HeaderKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t FMNServerInteractionController.InternalServerMetadata.errorCode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B69CA1AC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t FMNServerInteractionController.InternalServerMetadata.requestUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  return sub_1B699D610(v1 + *(int *)(v3 + 20), a1, &qword_1ED52FF88);
}

uint64_t FMNServerInteractionController.InternalServerMetadata.respondingInstance.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0
                 + *(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMNServerInteractionController.InternalServerMetadata.dateEpoch.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + *(int *)(type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0) + 28));
}

uint64_t FMNServerInteractionController.InternalServerMetadata.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B69CA104();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v11 - v7;
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_1B69CA4B8();
  sub_1B69CA2A8();
  v9 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  sub_1B699D610(v0 + *(int *)(v9 + 20), (uint64_t)v3, &qword_1ED52FF88);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1B69CA0F8();
    sub_1B69CA0E0();
    sub_1B6999FB0((uint64_t)v3, &qword_1ED52FF88);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  }
  sub_1B699AEC4(&qword_1ED52FA38, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
  sub_1B69CA5E4();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_1B69CA2A8();
  swift_bridgeObjectRetain();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  sub_1B69CA2A8();
  sub_1B69CA1AC();
  sub_1B699AEC4(&qword_1ED52FA40, (uint64_t (*)(uint64_t))MEMORY[0x1E0D89AF8], MEMORY[0x1E0D89B08]);
  sub_1B69CA5E4();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  return v11[0];
}

uint64_t FMNServerInteractionController.FMNResponseFields.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_1B699D90C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t FMNServerInteractionController.FMNResponseFields.statusCode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t FMNServerInteractionController.FMNResponseFields.responseHeaders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMNServerInteractionController.FMNResponseFields.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  return sub_1B699D610(v1 + *(int *)(v3 + 28), a1, &qword_1ED52FF80);
}

uint64_t FMNServerInteractionController.FMNResponseFields.metadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for FMNServerInteractionController.FMNResponseFields(0) + 28);
  return sub_1B69B52F8(a1, v3);
}

uint64_t sub_1B69B52F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*FMNServerInteractionController.FMNResponseFields.metadata.modify())()
{
  type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  return nullsub_1;
}

uint64_t FMNServerInteractionController.FMNResponseFields.init(data:statusCode:responseHeaders:metadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;

  v12 = (uint64_t)a6 + *(int *)(type metadata accessor for FMNServerInteractionController.FMNResponseFields(0) + 28);
  v13 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  return sub_1B69B52F8(a5, v12);
}

uint64_t FMNServerInteractionController.FMNResponseFields.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_1B69CA4B8();
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "statusCode: ");
  BYTE5(v8[1]) = 0;
  HIWORD(v8[1]) = -5120;
  v7[1] = *(_QWORD *)(v0 + 16);
  sub_1B69CA5E4();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  sub_1B69CA2A8();
  v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  sub_1B699D610(v0 + *(int *)(v4 + 28), (uint64_t)v3, &qword_1ED52FF80);
  v5 = type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) == 1)
  {
    sub_1B6999FB0((uint64_t)v3, &qword_1ED52FF80);
  }
  else
  {
    FMNServerInteractionController.InternalServerMetadata.description.getter();
    sub_1B699F3DC((uint64_t)v3, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
  }
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  sub_1B69CA2A8();
  swift_bridgeObjectRetain();
  sub_1B69CA218();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8[0];
}

uint64_t FMNServerInteractionController.mockingPreferences.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[13];
  v3 = v1[14];
  v4 = v1[15];
  v5 = v1[16];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_1B69A1C54(v2, v3);
}

uint64_t sub_1B69B5600@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = sub_1B69CA068();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  v8 = type metadata accessor for FMNMockClientURLSession();
  swift_allocObject();
  result = FMNMockClientURLSession.init(httpArchiveFileURL:)((uint64_t)v6);
  a2[3] = v8;
  a2[4] = (uint64_t)&protocol witness table for FMNMockClientURLSession;
  *a2 = result;
  return result;
}

uint64_t FMNServerInteractionController.__allocating_init(authenticationProvider:mockingPreferences:urlSessionFactory:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  FMNServerInteractionController.init(authenticationProvider:mockingPreferences:urlSessionFactory:)(a1, a2, a3, a4);
  return v8;
}

uint64_t FMNServerInteractionController.deinit()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF28);
  sub_1B69CA3B0();
  swift_unknownObjectRelease();

  sub_1B6999FB0(v0 + 48, &qword_1ED52FCD0);
  sub_1B69B41C0(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
  swift_release();
  return v0;
}

uint64_t sub_1B69B57A8@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  void *v3;
  id v4;

  v3 = *(void **)(result + 32);
  if (v3)
  {
    MEMORY[0x1E0C80A78](result);
    v4 = v3;
    swift_retain();
    sub_1B69CA128();

    result = swift_release();
  }
  *a2 = v3 == 0;
  return result;
}

uint64_t sub_1B69B5878@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return sub_1B69B57A8(v1, a1);
}

uint64_t FMNServerInteractionController.__deallocating_deinit()
{
  FMNServerInteractionController.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B69B58B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v9;
  _BYTE v11[40];
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];

  sub_1B69968B4(a1, (uint64_t)v13);
  sub_1B69968B4(a2, (uint64_t)v14);
  sub_1B69968B4((uint64_t)v13, (uint64_t)v11);
  sub_1B69968B4((uint64_t)v14, (uint64_t)v12);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a5;
  v9[3] = a6;
  swift_retain();
  sub_1B69A82AC((uint64_t)v11, (uint64_t)v12, sub_1B699CEE0, v9, 0);
  swift_release();
  sub_1B6999FB0((uint64_t)v13, &qword_1EF13D6B8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
}

uint64_t sub_1B69B5990()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69B59B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  _BYTE v10[40];
  _BYTE v11[40];
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];
  _BYTE v15[40];
  _BYTE v16[40];
  _BYTE v17[40];

  sub_1B69968B4(a1, (uint64_t)v16);
  sub_1B69968B4(a2, (uint64_t)v17);
  sub_1B69968B4((uint64_t)v16, (uint64_t)v14);
  sub_1B69968B4((uint64_t)v17, (uint64_t)v15);
  sub_1B69968B4((uint64_t)v14, (uint64_t)v12);
  sub_1B69968B4((uint64_t)v15, (uint64_t)v13);
  sub_1B69968B4((uint64_t)v12, (uint64_t)v10);
  sub_1B69968B4((uint64_t)v13, (uint64_t)v11);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a4;
  v8[3] = a5;
  swift_retain();
  sub_1B69A82AC((uint64_t)v10, (uint64_t)v11, sub_1B69B8380, v8, 0);
  swift_release();
  sub_1B6999FB0((uint64_t)v12, &qword_1EF13D6B8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  sub_1B6999FB0((uint64_t)v16, &qword_1EF13D6B8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_1B69B5AFC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, const void *a5, uint64_t a6)
{
  _BYTE v11[40];
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];

  sub_1B69968B4(a1, (uint64_t)v13);
  sub_1B69968B4(a2, (uint64_t)v14);
  sub_1B69968B4((uint64_t)v13, (uint64_t)v11);
  sub_1B69968B4((uint64_t)v14, (uint64_t)v12);
  sub_1B69A82AC((uint64_t)v11, (uint64_t)v12, a4, a5, a6);
  sub_1B6999FB0((uint64_t)v13, &qword_1EF13D6B8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
}

uint64_t sub_1B69B5BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v10;
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];
  _BYTE v15[40];

  sub_1B69968B4(a1, (uint64_t)v14);
  sub_1B69968B4(a2, (uint64_t)v15);
  sub_1B69968B4((uint64_t)v14, (uint64_t)v12);
  sub_1B69968B4((uint64_t)v15, (uint64_t)v13);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a6;
  v10[3] = a7;
  swift_retain();
  sub_1B6999B8C((uint64_t)v12, (uint64_t)v13, sub_1B69B8380, v10, 0, 0);
  swift_release();
  sub_1B6999FB0((uint64_t)v14, &qword_1ED52FCE0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
}

uint64_t sub_1B69B5C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  _QWORD *v9;
  _BYTE v11[40];
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];
  _BYTE v15[40];
  _BYTE v16[40];
  _BYTE v17[40];
  _BYTE v18[40];

  sub_1B69968B4(a1, (uint64_t)v17);
  sub_1B69968B4(a2, (uint64_t)v18);
  sub_1B69968B4((uint64_t)v17, (uint64_t)v15);
  sub_1B69968B4((uint64_t)v18, (uint64_t)v16);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  sub_1B69968B4((uint64_t)v15, (uint64_t)v13);
  sub_1B69968B4((uint64_t)v16, (uint64_t)v14);
  sub_1B69968B4((uint64_t)v13, (uint64_t)v11);
  sub_1B69968B4((uint64_t)v14, (uint64_t)v12);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = sub_1B69B8360;
  v9[3] = v8;
  swift_retain();
  swift_retain();
  sub_1B6999B8C((uint64_t)v11, (uint64_t)v12, sub_1B69B8380, v9, 0, 0);
  swift_release();
  sub_1B6999FB0((uint64_t)v13, &qword_1ED52FCE0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  swift_release();
  sub_1B6999FB0((uint64_t)v17, &qword_1ED52FCE0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v16);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
}

uint64_t sub_1B69B5E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  _BYTE v10[40];
  _BYTE v11[40];
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];
  _BYTE v15[40];
  _BYTE v16[40];
  _BYTE v17[40];

  sub_1B69968B4(a1, (uint64_t)v16);
  sub_1B69968B4(a2, (uint64_t)v17);
  sub_1B69968B4((uint64_t)v16, (uint64_t)v14);
  sub_1B69968B4((uint64_t)v17, (uint64_t)v15);
  sub_1B69968B4((uint64_t)v14, (uint64_t)v12);
  sub_1B69968B4((uint64_t)v15, (uint64_t)v13);
  sub_1B69968B4((uint64_t)v12, (uint64_t)v10);
  sub_1B69968B4((uint64_t)v13, (uint64_t)v11);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a4;
  v8[3] = a5;
  swift_retain();
  sub_1B6999B8C((uint64_t)v10, (uint64_t)v11, sub_1B69B8380, v8, 0, 0);
  swift_release();
  sub_1B6999FB0((uint64_t)v12, &qword_1ED52FCE0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  sub_1B6999FB0((uint64_t)v16, &qword_1ED52FCE0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_1B69B5F60(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, const void *a5, uint64_t a6)
{
  _BYTE v11[40];
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];

  sub_1B69968B4(a1, (uint64_t)v13);
  sub_1B69968B4(a2, (uint64_t)v14);
  sub_1B69968B4((uint64_t)v13, (uint64_t)v11);
  sub_1B69968B4((uint64_t)v14, (uint64_t)v12);
  sub_1B6999B8C((uint64_t)v11, (uint64_t)v12, a4, a5, a6, 0);
  sub_1B6999FB0((uint64_t)v13, &qword_1ED52FCE0);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
}

unint64_t sub_1B69B6018(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA28);
    v2 = (_QWORD *)sub_1B69CA518();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x1E0DEE9B8] + 8;
  v11 = MEMORY[0x1E0DEA968];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_1B69B8340();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1B699ED14(v6, v7);
    sub_1B699ED14(v7, v40);
    sub_1B699ED14(v40, &v38);
    result = sub_1B699E8D4(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v18);
      result = (unint64_t)sub_1B699ED14(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_1B699ED14(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1B69B6380(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_1B69CA4E8();
      v7 = (uint64_t)sub_1B69B7AE8(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_1B69B65CC(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

unsigned __int8 *sub_1B69B65CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_1B69CA2F0();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_1B69B7D64();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_1B69CA4E8();
  }
LABEL_7:
  v11 = sub_1B69B7AE8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_1B69B66B4()
{
  unint64_t result;

  result = qword_1EF13DAB0;
  if (!qword_1EF13DAB0)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNServerInteractionController.FMNServerInteractionError, &type metadata for FMNServerInteractionController.FMNServerInteractionError);
    atomic_store(result, (unint64_t *)&qword_1EF13DAB0);
  }
  return result;
}

unint64_t sub_1B69B66FC()
{
  unint64_t result;

  result = qword_1EF13DAB8;
  if (!qword_1EF13DAB8)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNServerInteractionController.InternalServerMetadata.HeaderKeys, &type metadata for FMNServerInteractionController.InternalServerMetadata.HeaderKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DAB8);
  }
  return result;
}

uint64_t method lookup function for FMNServerInteractionController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNServerInteractionController.__allocating_init(authenticationProvider:mockingPreferences:urlSessionFactory:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of FMNServerInteractionController.upload(endpoint:content:source:responseHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of FMNServerInteractionController.retryUpload(consolidatedContent:redirectedHostStore:responseHandler:retryCount:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of FMNServerInteractionController.sendRequest(endpoint:content:source:credential:responseHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of FMNServerInteractionController.retryRequest(consolidatedContent:redirectedHostStore:responseHandler:retryCount:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of FMNServerInteractionController.retryRequest(with:redirectedHostStore:responseHandler:retryCount:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t getEnumTagSinglePayload for FMNServerInteractionController.FMNServerInteractionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FMNServerInteractionController.FMNServerInteractionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69B6884 + 4 * byte_1B69CC025[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1B69B68B8 + 4 * byte_1B69CC020[v4]))();
}

uint64_t sub_1B69B68B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B68C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69B68C8);
  return result;
}

uint64_t sub_1B69B68D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69B68DCLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1B69B68E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B68E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNServerInteractionController.FMNServerInteractionError()
{
  return &type metadata for FMNServerInteractionController.FMNServerInteractionError;
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNServerInteractionController.InternalServerMetadata(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  char *v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B69CA1AC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1B69CA104();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[6];
    v16 = a3[7];
    v17 = (uint64_t *)((char *)a1 + v15);
    v18 = (uint64_t *)((char *)a2 + v15);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = (char *)a1 + v16;
    v21 = (char *)a2 + v16;
    v20[8] = v21[8];
    *(_QWORD *)v20 = *(_QWORD *)v21;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;

  v6 = sub_1B69CA1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_1B69CA104();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[7];
  v20 = a1 + v19;
  v21 = (uint64_t *)(a2 + v19);
  v22 = *v21;
  *(_BYTE *)(v20 + 8) = *((_BYTE *)v21 + 8);
  *(_QWORD *)v20 = v22;
  return a1;
}

uint64_t initializeWithTake for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_1B69CA1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_1B69CA104();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  return a1;
}

uint64_t assignWithTake for FMNServerInteractionController.InternalServerMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = sub_1B69CA1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_1B69CA104();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[7];
  v22 = a1 + v21;
  v23 = a2 + v21;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_BYTE *)(v22 + 8) = *(_BYTE *)(v23 + 8);
  return a1;
}

uint64_t sub_1B69B6E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = sub_1B69CA1AC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t sub_1B69B6EE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_1B69CA1AC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t storeEnumTagSinglePayload for FMNServerInteractionController.InternalServerMetadata.HeaderKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69B6FE0 + 4 * byte_1B69CC02F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B69B7014 + 4 * byte_1B69CC02A[v4]))();
}

uint64_t sub_1B69B7014(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B701C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69B7024);
  return result;
}

uint64_t sub_1B69B7030(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69B7038);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B69B703C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69B7044(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNServerInteractionController.InternalServerMetadata.HeaderKeys()
{
  return &type metadata for FMNServerInteractionController.InternalServerMetadata.HeaderKeys;
}

uint64_t *initializeBufferWithCopyOfBuffer for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int *v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, int *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  void (*v32)(char *, _QWORD, uint64_t, int *);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_1B699D90C(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    v10 = *(int *)(a3 + 28);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
    v14 = *((_QWORD *)v13 - 1);
    v15 = *(unsigned int (**)(char *, uint64_t, int *))(v14 + 48);
    swift_bridgeObjectRetain();
    if (v15(v12, 1, v13))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v18 = sub_1B69CA1AC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v11, v12, v18);
      v19 = v13[5];
      v20 = &v11[v19];
      v21 = &v12[v19];
      v22 = sub_1B69CA104();
      v23 = *(_QWORD *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
      {
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      v25 = v13[6];
      v26 = &v11[v25];
      v27 = &v12[v25];
      v28 = *((_QWORD *)v27 + 1);
      *(_QWORD *)v26 = *(_QWORD *)v27;
      *((_QWORD *)v26 + 1) = v28;
      v29 = v13[7];
      v30 = &v11[v29];
      v31 = &v12[v29];
      v30[8] = v31[8];
      *(_QWORD *)v30 = *(_QWORD *)v31;
      v32 = *(void (**)(char *, _QWORD, uint64_t, int *))(v14 + 56);
      swift_bridgeObjectRetain();
      v32(v11, 0, 1, v13);
    }
  }
  return a1;
}

uint64_t *assignWithCopy for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, int *);
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, _QWORD, uint64_t, int *);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;

  v6 = *a2;
  v7 = a2[1];
  sub_1B699D90C(*a2, v7);
  v8 = *a1;
  v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_1B699DB18(v8, v9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 28);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  v14 = *((_QWORD *)v13 - 1);
  v15 = *(uint64_t (**)(char *, uint64_t, int *))(v14 + 48);
  LODWORD(v7) = v15(v11, 1, v13);
  v16 = v15(v12, 1, v13);
  if (!(_DWORD)v7)
  {
    if (v16)
    {
      sub_1B699F3DC((uint64_t)v11, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
      goto LABEL_7;
    }
    v25 = sub_1B69CA1AC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 24))(v11, v12, v25);
    v26 = v13[5];
    v27 = &v11[v26];
    v28 = &v12[v26];
    v29 = sub_1B69CA104();
    v30 = *(_QWORD *)(v29 - 8);
    v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
    v32 = v31(v27, 1, v29);
    v33 = v31(v28, 1, v29);
    if (v32)
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
LABEL_16:
        v43 = v13[6];
        v44 = &v11[v43];
        v45 = &v12[v43];
        *(_QWORD *)v44 = *(_QWORD *)v45;
        *((_QWORD *)v44 + 1) = *((_QWORD *)v45 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v46 = v13[7];
        v47 = &v11[v46];
        v48 = &v12[v46];
        v49 = *(_QWORD *)v48;
        v47[8] = v48[8];
        *(_QWORD *)v47 = v49;
        return a1;
      }
    }
    else
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v27, v28, v29);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    }
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  v17 = sub_1B69CA1AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v11, v12, v17);
  v18 = v13[5];
  v19 = &v11[v18];
  v20 = &v12[v18];
  v21 = sub_1B69CA104();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v34 = v13[6];
  v35 = &v11[v34];
  v36 = &v12[v34];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
  v37 = v13[7];
  v38 = &v11[v37];
  v39 = &v12[v37];
  v40 = *(_QWORD *)v39;
  v38[8] = v39[8];
  *(_QWORD *)v38 = v40;
  v41 = *(void (**)(char *, _QWORD, uint64_t, int *))(v14 + 56);
  swift_bridgeObjectRetain();
  v41(v11, 0, 1, v13);
  return a1;
}

_OWORD *initializeWithTake for FMNServerInteractionController.FMNResponseFields(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  v9 = *((_QWORD *)v8 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v9 + 48))(v7, 1, v8))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v11 = sub_1B69CA1AC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v6, v7, v11);
    v12 = v8[5];
    v13 = &v6[v12];
    v14 = &v7[v12];
    v15 = sub_1B69CA104();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    *(_OWORD *)&v6[v8[6]] = *(_OWORD *)&v7[v8[6]];
    v18 = v8[7];
    v19 = &v6[v18];
    v20 = &v7[v18];
    v19[8] = v20[8];
    *(_QWORD *)v19 = *(_QWORD *)v20;
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t *assignWithTake for FMNServerInteractionController.FMNResponseFields(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, int *);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;

  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1B699DB18(v6, v7);
  v8 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)(a2 + v9);
  v12 = (int *)type metadata accessor for FMNServerInteractionController.InternalServerMetadata(0);
  v13 = *((_QWORD *)v12 - 1);
  v14 = *(uint64_t (**)(char *, uint64_t, int *))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1B699F3DC((uint64_t)v10, type metadata accessor for FMNServerInteractionController.InternalServerMetadata);
      goto LABEL_7;
    }
    v25 = sub_1B69CA1AC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 40))(v10, v11, v25);
    v26 = v12[5];
    v27 = &v10[v26];
    v28 = &v11[v26];
    v29 = sub_1B69CA104();
    v30 = *(_QWORD *)(v29 - 8);
    v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
    v32 = v31(v27, 1, v29);
    v33 = v31(v28, 1, v29);
    if (v32)
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
LABEL_16:
        v38 = v12[6];
        v39 = &v10[v38];
        v40 = &v11[v38];
        v42 = *(_QWORD *)v40;
        v41 = *((_QWORD *)v40 + 1);
        *(_QWORD *)v39 = v42;
        *((_QWORD *)v39 + 1) = v41;
        swift_bridgeObjectRelease();
        v43 = v12[7];
        v44 = &v10[v43];
        v45 = &v11[v43];
        *(_QWORD *)v44 = *(_QWORD *)v45;
        v44[8] = v45[8];
        return a1;
      }
    }
    else
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 40))(v27, v28, v29);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    }
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  v17 = sub_1B69CA1AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v10, v11, v17);
  v18 = v12[5];
  v19 = &v10[v18];
  v20 = &v11[v18];
  v21 = sub_1B69CA104();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF88);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  *(_OWORD *)&v10[v12[6]] = *(_OWORD *)&v11[v12[6]];
  v34 = v12[7];
  v35 = &v10[v34];
  v36 = &v11[v34];
  v35[8] = v36[8];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_1B69B79F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_1B69B7A70(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF80);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

unsigned __int8 *sub_1B69B7AE8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1B69B7D64()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1B69CA2FC();
  v4 = sub_1B69B7DE0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1B69B7DE0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1B69B7F24(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1B69B8010(v9, 0);
      v12 = sub_1B69B8074((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1BCC9A2C0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1BCC9A2C0);
LABEL_9:
      sub_1B69CA4E8();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1BCC9A2C0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1B69B7F24(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_1B69B8284(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1B69B8284(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_1B69CA2CC();
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B69B8010(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF13DAC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_1B69B8074(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_1B69B8284(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1B69CA2D8();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_1B69CA4E8();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_1B69B8284(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_1B69CA2B4();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1B69B8284(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_1B69CA2E4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1BCC9A2F0](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t sub_1B69B82FC()
{
  unint64_t result;

  result = qword_1ED52FA60;
  if (!qword_1ED52FA60)
  {
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1ED52FA60);
  }
  return result;
}

uint64_t sub_1B69B8340()
{
  return swift_release();
}

uint64_t sub_1B69B8348()
{
  uint64_t v0;

  return sub_1B69B9B80(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1B69B8384(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69B83B0 + 4 * byte_1B69CC350[a1]))(6712678, 0xE300000000000000);
}

uint64_t sub_1B69B83B0()
{
  return 0x707041666D66;
}

uint64_t sub_1B69B83C4()
{
  return 1885957478;
}

uint64_t sub_1B69B83D4()
{
  return 0x6972695370696D66;
}

uint64_t sub_1B69B83EC()
{
  return 0x7075746573;
}

uint64_t sub_1B69B8400()
{
  return 0x6150686372616573;
}

uint64_t sub_1B69B8424()
{
  return 0x4C676E6972696170;
}

uint64_t sub_1B69B8444()
{
  return 0x726F737365636361;
}

unint64_t sub_1B69B8460()
{
  return 0xD000000000000013;
}

uint64_t sub_1B69B8480()
{
  return 0x7373656363413277;
}

unint64_t sub_1B69B84A0()
{
  return 0xD000000000000014;
}

uint64_t sub_1B69B84EC()
{
  return 0x726168536D657469;
}

uint64_t sub_1B69B850C()
{
  return 1701736302;
}

uint64_t sub_1B69B851C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_1B69A00B4(v1 + 16, a1);
}

uint64_t sub_1B69B8564(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  sub_1B69B85B4(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t sub_1B69B85B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FCD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1B69B85FC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69B8638(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = sub_1B69C9FF0();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 160))(v6);
}

uint64_t sub_1B69B86C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  swift_beginAccess();
  v4 = sub_1B69C9FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1B69B872C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t FMNHTTPRequest.__allocating_init(hostName:scheme:path:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_BYTE *)(v0 + 56) = 14;
  sub_1B69C9FE4();
  swift_beginAccess();
  sub_1B69C9FD8();
  sub_1B69C9FB4();
  sub_1B69C9FCC();
  swift_endAccess();
  return v0;
}

uint64_t sub_1B69B8840()
{
  uint64_t v0;
  uint64_t (*v1)(_BYTE *, _QWORD);
  _BYTE v3[32];

  v1 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v0 + 168))(v3);
  swift_bridgeObjectRetain();
  sub_1B69C9FB4();
  return v1(v3, 0);
}

unint64_t sub_1B69B88A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _WORD v14[8];

  v1 = sub_1B69C9FF0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_1B69CA4B8();
  v5 = swift_bridgeObjectRelease();
  v12 = 0xD000000000000011;
  v13 = 0x80000001B69CEC20;
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 152))(v5);
  sub_1B69B8ABC();
  sub_1B69CA5E4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  sub_1B69CA2A8();
  v7 = v12;
  v6 = v13;
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_1B69CA4B8();
  v8 = swift_bridgeObjectRelease();
  strcpy((char *)v14, "accountType: ");
  v14[7] = -4864;
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(_QWORD *)v0 + 128))(&v12, v8);
  sub_1B69B8384(v12);
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  v9 = sub_1B69CA2A8();
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(_QWORD *)v0 + 104))(&v12, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FCD8);
  sub_1B69CA284();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  v12 = v7;
  v13 = v6;
  swift_bridgeObjectRetain();
  sub_1B69CA2A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_1B69B8ABC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED52FC00;
  if (!qword_1ED52FC00)
  {
    v1 = sub_1B69C9FF0();
    result = MEMORY[0x1BCC9ABA8](MEMORY[0x1E0CAE8A0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED52FC00);
  }
  return result;
}

uint64_t FMNHTTPRequest.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B6995C34(v0 + 16);
  v1 = v0 + OBJC_IVAR____TtC12FMNetworking14FMNHTTPRequest_urlComponents;
  v2 = sub_1B69C9FF0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

unint64_t sub_1B69B8B5C()
{
  return sub_1B69B88A8();
}

uint64_t sub_1B69B8B7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 104))();
}

uint64_t sub_1B69B8BA4(uint64_t a1, uint64_t a2)
{
  _BYTE v4[40];

  sub_1B69A00B4(a1, (uint64_t)v4);
  return (*(uint64_t (**)(_BYTE *))(**(_QWORD **)a2 + 112))(v4);
}

_QWORD *sub_1B69B8BE4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 128))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1B69B8C24(char *a1, uint64_t *a2)
{
  uint64_t v2;
  char v4;

  v2 = *a2;
  v4 = *a1;
  return (*(uint64_t (**)(char *))(*(_QWORD *)v2 + 136))(&v4);
}

uint64_t sub_1B69B8C60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 152))();
}

uint64_t sub_1B69B8C8C()
{
  return type metadata accessor for FMNHTTPRequest();
}

uint64_t method lookup function for FMNHTTPRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNHTTPRequest.credential.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of FMNHTTPRequest.credential.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of FMNHTTPRequest.credential.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of FMNHTTPRequest.accountType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FMNHTTPRequest.accountType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of FMNHTTPRequest.urlComponents.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of FMNHTTPRequest.urlComponents.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of FMNHTTPRequest.urlComponents.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of FMNHTTPRequest.__allocating_init(hostName:scheme:path:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of FMNHTTPRequest.redirect(host:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of FMNHTTPRequest.debugDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

id FMNHttpClient.__allocating_init(credential:urlSessionFactory:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = sub_1B69A1634(a1, a2);
  swift_release();
  return v6;
}

uint64_t sub_1B69B8D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  _BYTE *v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v3 = v1;
  v5 = sub_1B69CA068();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for FMNFileUploadRequest(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3 + v9[6], v5);
  sub_1B69C9EC4();
  sub_1B69C9EA0();
  sub_1B699D610(v3 + v9[8], (uint64_t)&v38, &qword_1ED52FCD8);
  if (!v39)
  {
    v43 = v2;
    sub_1B6999FB0((uint64_t)&v38, &qword_1ED52FCD8);
    goto LABEL_27;
  }
  sub_1B69970A0(&v38, (uint64_t)v40);
  v10 = v41;
  v11 = v42;
  __swift_project_boxed_opaque_existential_1(v40, v41);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 56))(v10, v11);
  if (!*(_QWORD *)(result + 16))
  {
    swift_bridgeObjectRelease();
    sub_1B69BBCA4();
    swift_allocError();
    *v34 = 1;
    swift_willThrow();
    v35 = sub_1B69C9F0C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(a1, v35);
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v40);
  }
  v36 = v9;
  v37 = v3;
  v43 = v2;
  v13 = 0;
  v14 = result + 64;
  v15 = 1 << *(_BYTE *)(result + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(result + 64);
  v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v17 &= v17 - 1;
      goto LABEL_7;
    }
    v19 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    if (v19 >= v18)
      goto LABEL_25;
    v20 = *(_QWORD *)(v14 + 8 * v19);
    ++v13;
    if (!v20)
    {
      v13 = v19 + 1;
      if (v19 + 1 >= v18)
        goto LABEL_25;
      v20 = *(_QWORD *)(v14 + 8 * v13);
      if (!v20)
      {
        v13 = v19 + 2;
        if (v19 + 2 >= v18)
          goto LABEL_25;
        v20 = *(_QWORD *)(v14 + 8 * v13);
        if (!v20)
        {
          v13 = v19 + 3;
          if (v19 + 3 >= v18)
            goto LABEL_25;
          v20 = *(_QWORD *)(v14 + 8 * v13);
          if (!v20)
            break;
        }
      }
    }
LABEL_24:
    v17 = (v20 - 1) & v20;
LABEL_7:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B69C9F00();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v21 = v19 + 4;
  if (v21 >= v18)
    goto LABEL_25;
  v20 = *(_QWORD *)(v14 + 8 * v21);
  if (v20)
  {
    v13 = v21;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v21 + 1;
    if (__OFADD__(v21, 1))
      goto LABEL_54;
    if (v13 >= v18)
      break;
    v20 = *(_QWORD *)(v14 + 8 * v13);
    ++v21;
    if (v20)
      goto LABEL_24;
  }
LABEL_25:
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v40);
  v9 = v36;
  v3 = v37;
LABEL_27:
  v22 = *(_QWORD *)(v3 + v9[7]);
  v25 = *(_QWORD *)(v22 + 64);
  v24 = v22 + 64;
  v23 = v25;
  v26 = 1 << *(_BYTE *)(*(_QWORD *)(v3 + v9[7]) + 32);
  v27 = -1;
  if (v26 < 64)
    v27 = ~(-1 << v26);
  v28 = v27 & v23;
  v29 = (unint64_t)(v26 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v30 = 0;
  while (2)
  {
    if (v28)
    {
      v28 &= v28 - 1;
LABEL_31:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B69C9F00();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  v31 = v30 + 1;
  if (__OFADD__(v30, 1))
  {
    __break(1u);
    goto LABEL_52;
  }
  if (v31 >= v29)
    return swift_release();
  v32 = *(_QWORD *)(v24 + 8 * v31);
  ++v30;
  if (v32)
    goto LABEL_48;
  v30 = v31 + 1;
  if (v31 + 1 >= v29)
    return swift_release();
  v32 = *(_QWORD *)(v24 + 8 * v30);
  if (v32)
    goto LABEL_48;
  v30 = v31 + 2;
  if (v31 + 2 >= v29)
    return swift_release();
  v32 = *(_QWORD *)(v24 + 8 * v30);
  if (v32)
    goto LABEL_48;
  v30 = v31 + 3;
  if (v31 + 3 >= v29)
    return swift_release();
  v32 = *(_QWORD *)(v24 + 8 * v30);
  if (v32)
  {
LABEL_48:
    v28 = (v32 - 1) & v32;
    goto LABEL_31;
  }
  v33 = v31 + 4;
  if (v33 >= v29)
    return swift_release();
  v32 = *(_QWORD *)(v24 + 8 * v33);
  if (v32)
  {
    v30 = v33;
    goto LABEL_48;
  }
  while (1)
  {
    v30 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v30 >= v29)
      return swift_release();
    v32 = *(_QWORD *)(v24 + 8 * v30);
    ++v33;
    if (v32)
      goto LABEL_48;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

uint64_t static FMNHttpClient.StatusCode.unauthorized.getter()
{
  return 401;
}

uint64_t static FMNHttpClient.StatusCode.redirected.getter()
{
  return 330;
}

uint64_t sub_1B69B921C@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t *, uint64_t *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1B69BBBE0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *))v6;
  return sub_1B69A1624(v4);
}

uint64_t sub_1B69B92B0(uint64_t *a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  v6 = *a2;
  v5 = a2[1];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v5;
  swift_retain();
  a3(v4, sub_1B69BBBA4, v7);
  return swift_release();
}

uint64_t sub_1B69B9324(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1B69BBBD8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1B69A1624(v3);
  return sub_1B6996708(v8);
}

uint64_t sub_1B69B93DC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, _QWORD *))
{
  uint64_t v7;
  _QWORD v9[2];
  uint64_t v10;

  v10 = a1;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[0] = sub_1B69BBD60;
  v9[1] = v7;
  swift_retain();
  a4(&v10, v9);
  return swift_release();
}

uint64_t sub_1B69B9460()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  v2 = *v1;
  sub_1B69A1624(*v1);
  return v2;
}

uint64_t sub_1B69B94B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_1B6996708(v6);
}

uint64_t (*sub_1B69B9514())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B69B9558(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69B95C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B69B9614(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B69B9670())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id FMNHttpClient.init(credential:urlSessionFactory:)(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = sub_1B69A1634(a1, a2);
  swift_release();
  return v2;
}

id FMNHttpClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  swift_retain();
  sub_1B69CA128();
  swift_release();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMNHttpClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B69B98AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v7 = sub_1B69CA134();
  v19 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B69CA158();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(_QWORD *)(v3 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_statusCodeHandlerQueue);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v14;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = a3;
  aBlock[4] = sub_1B699715C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_3;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1B69CA14C();
  v20 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v13, v9, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_1B69B9AE8(_QWORD *a1, _QWORD *a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  return a3(*a1, *a2);
}

uint64_t sub_1B69B9B10()
{
  swift_retain();
  sub_1B69CA128();
  return swift_release();
}

uint64_t sub_1B69B9B80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v1 = a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session;
  swift_beginAccess();
  sub_1B699D610(v1, (uint64_t)&v8, &qword_1ED52FC28);
  if (*((_QWORD *)&v9 + 1))
  {
    sub_1B69968B4((uint64_t)&v8, (uint64_t)v5);
    sub_1B6999FB0((uint64_t)&v8, &qword_1ED52FC28);
    v2 = v6;
    v3 = v7;
    __swift_project_boxed_opaque_existential_1(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
  }
  else
  {
    sub_1B6999FB0((uint64_t)&v8, &qword_1ED52FC28);
  }
  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  swift_beginAccess();
  sub_1B699B7E0((uint64_t)&v8, v1, &qword_1ED52FC28);
  return swift_endAccess();
}

uint64_t sub_1B69B9C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B69BA1B0(a1, a2, a3, a4, (uint64_t)&unk_1E6A26270, (uint64_t)sub_1B69BBD64, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1B69B9CB8);
}

void sub_1B69B9CB8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B69BA414(a1, a2, a3, a4, (uint64_t)sub_1B69967A4, (void (*)(_QWORD *, char *, uint64_t, id *, _QWORD *, uint64_t, uint64_t))sub_1B69B9CDC);
}

uint64_t sub_1B69B9CDC(_QWORD *a1, uint64_t a2, void *a3, void **a4, _QWORD *a5, uint64_t a6, uint64_t a7)
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
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(char *, char *, uint64_t (*)(uint64_t, unint64_t, void *, void *), _QWORD *, uint64_t, uint64_t);
  id v53;
  uint64_t v54;
  id *v55;
  void *v56;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  void **v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  void *v72;
  _BYTE v73[48];
  int v74;
  uint64_t v75;

  v60 = a6;
  v61 = a7;
  v59 = a5;
  v62 = a4;
  v72 = a3;
  v68 = a2;
  v8 = sub_1B69C9F0C();
  v65 = *(_QWORD *)(v8 - 8);
  v66 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  v63 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v64 = (char *)&v58 - v12;
  MEMORY[0x1E0C80A78](v11);
  v70 = (char *)&v58 - v13;
  v14 = sub_1B69CA068();
  v71 = *(_QWORD *)(v14 - 8);
  v15 = v71;
  v16 = MEMORY[0x1E0C80A78](v14);
  v67 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v58 - v18;
  v20 = (int *)type metadata accessor for FMNFileUploadRequest(0);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1[3];
  v24 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v23);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v24 + 40))(&v75, v23, v24);
  v74 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v19, v68, v14);
  v25 = a1[3];
  v26 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v25);
  v27 = v67;
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v26);
  v28 = (uint64_t)v72 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1B699D610(v28, (uint64_t)v73, &qword_1ED52FCD8);
  v29 = a1[3];
  v30 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v29);
  v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 16))(v29, v30);
  v22[v20[5]] = v74;
  v32 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
  v33 = v19;
  v32(&v22[v20[6]], v19, v14);
  v68 = v14;
  v32(v22, v27, v14);
  sub_1B699F590((uint64_t)v73, (uint64_t)&v22[v20[8]]);
  *(_QWORD *)&v22[v20[7]] = v31;
  v34 = a1[3];
  v35 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v34);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 48))(v34, v35) & 1) != 0)
    v36 = (uint64_t)v64;
  else
    v36 = (uint64_t)v63;
  v37 = v69;
  sub_1B69B8D70(v36);
  if (!v37)
  {
    (*(void (**)(void))(v65 + 32))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_1B69CADE0;
    v39 = sub_1B69A00FC();
    v41 = v40;
    *(_QWORD *)(v38 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v38 + 64) = sub_1B699F398();
    *(_QWORD *)(v38 + 32) = v39;
    *(_QWORD *)(v38 + 40) = v41;
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    v42 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();
    swift_bridgeObjectRelease();

    v43 = a1[3];
    v44 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v43);
    v45 = v33;
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v44);
    v46 = v59[3];
    v47 = v59[4];
    __swift_project_boxed_opaque_existential_1(v59, v46);
    v48 = (_QWORD *)swift_allocObject();
    v49 = v72;
    v50 = v60;
    v51 = v61;
    v48[2] = v72;
    v48[3] = v50;
    v48[4] = v51;
    v52 = *(uint64_t (**)(char *, char *, uint64_t (*)(uint64_t, unint64_t, void *, void *), _QWORD *, uint64_t, uint64_t))(v47 + 16);
    v53 = v49;
    swift_retain();
    v54 = v52(v70, v45, sub_1B699636C, v48, v46, v47);
    swift_release();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v45, v68);
    v55 = v62;
    v56 = *v62;
    *v62 = (void *)v54;

    if (*v55)
      objc_msgSend(*v55, sel_resume);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v70, v66);
  }
  return sub_1B699F3DC((uint64_t)v22, type metadata accessor for FMNFileUploadRequest);
}

uint64_t sub_1B69BA184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B69BA1B0(a1, a2, a3, a4, (uint64_t)&unk_1E6A26298, (uint64_t)sub_1B69BB7BC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1B699ED68);
}

uint64_t sub_1B69BA1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  swift_retain();
  a7(a1, a2, a6, v13);
  return swift_release();
}

uint64_t sub_1B69BA244(uint64_t a1, void (*a2)(void **))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  id v15;
  uint64_t v17;

  v4 = type metadata accessor for FMNServerInteractionController.FMNResponseFields(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300C0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (void **)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5300E0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (void **)((char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B699D610(a1, (uint64_t)v13, &qword_1ED5300E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = *v13;
    *v10 = *v13;
    (*(void (**)(void **, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0D89AD0], v7);
    v15 = v14;
    a2(v10);

    return (*(uint64_t (**)(void **, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    sub_1B699B788((uint64_t)v13, (uint64_t)v6);
    sub_1B699BC64((uint64_t)v6, (uint64_t)v10, type metadata accessor for FMNServerInteractionController.FMNResponseFields);
    (*(void (**)(void **, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0D89AD8], v7);
    a2(v10);
    (*(void (**)(void **, uint64_t))(v8 + 8))(v10, v7);
    return sub_1B699F3DC((uint64_t)v6, type metadata accessor for FMNServerInteractionController.FMNResponseFields);
  }
}

void sub_1B69BA414(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(_QWORD *, char *, uint64_t, id *, _QWORD *, uint64_t, uint64_t))
{
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
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[3];
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD *, char *, uint64_t, id *, _QWORD *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56[2];
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v47 = a6;
  v48 = a5;
  v45 = a3;
  v46 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  v9 = MEMORY[0x1E0C80A78](v8);
  v52 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v43 - v11;
  v13 = sub_1B69C9FF0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_1B69CA068();
  v53 = *(_QWORD *)(v60 - 8);
  MEMORY[0x1E0C80A78](v60);
  v50 = (char *)v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v19 = a1[4];
  v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v19 + 56))(v18, v19) & 1) == 0)
    goto LABEL_6;
  v43[1] = v12;
  v43[2] = v8;
  v20 = v51 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential;
  swift_beginAccess();
  sub_1B699D610(v20, (uint64_t)v57, &qword_1ED52FCD8);
  v21 = v58;
  if (!v58)
  {
    sub_1B6999FB0((uint64_t)v57, &qword_1ED52FCD8);
LABEL_6:
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, v13);
    goto LABEL_7;
  }
  v22 = v59;
  __swift_project_boxed_opaque_existential_1(v57, v58);
  v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32))(v21, v22);
  v25 = v24;
  sub_1B6999FB0((uint64_t)v57, &qword_1ED52FCD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, v13);
  if (v25)
  {
    v57[0] = sub_1B69C9FC0();
    v57[1] = v26;
    v56[0] = (id)16421;
    v56[1] = (id)0xE200000000000000;
    v54 = v23;
    v55 = v25;
    sub_1B699FF3C();
    v27 = MEMORY[0x1E0DEA968];
    sub_1B69CA410();
    swift_bridgeObjectRelease();
    sub_1B69C9FCC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1B69CADE0;
    sub_1B69C9F9C();
    v29 = sub_1B69CA284();
    v31 = v30;
    *(_QWORD *)(v28 + 56) = v27;
    *(_QWORD *)(v28 + 64) = sub_1B699F398();
    *(_QWORD *)(v28 + 32) = v29;
    *(_QWORD *)(v28 + 40) = v31;
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    v32 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();
    swift_bridgeObjectRelease();

  }
LABEL_7:
  v33 = (uint64_t)v52;
  sub_1B69C9F9C();
  v34 = v53;
  v35 = v60;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v33, 1, v60) == 1)
  {
    sub_1B6999FB0(v33, (uint64_t *)&unk_1ED52FC08);
    sub_1B69BB778();
    swift_allocError();
    *v36 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v37 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v50, v33, v35);
    v38 = swift_bridgeObjectRelease();
    v39 = v51;
    MEMORY[0x1E0C80A78](v38);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC18);
    v40 = v49;
    sub_1B69CA128();
    if (v40)
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v35);
    }
    else
    {
      v41 = swift_release();
      v56[0] = 0;
      v42 = (void *)MEMORY[0x1BCC9A848](v41);
      v47(v44, v37, v39, v56, v57, v45, v46);
      objc_autoreleasePoolPop(v42);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v57);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v35);

    }
  }
}

uint64_t sub_1B69BA950@<X0>(int64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t result;
  NSString *v13;
  Class v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  id *v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  _BYTE *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int64_t v68;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  int64_t v72;
  _DWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  id v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  NSObject *v84;
  id *v85;
  uint64_t v86;
  uint64_t v87;
  int64_t v88;
  uint64_t v89;
  id v90;
  _QWORD aBlock[9];

  v88 = a1;
  v1 = sub_1B69CA278();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B69C9F0C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v10 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  v11 = v89;
  result = sub_1B699F7A4((uint64_t)v8);
  if (v11)
    return result;
  v86 = v9;
  v87 = 0;
  v89 = v5;
  v13 = (NSString *)sub_1B69CA23C();
  v14 = NSClassFromString(v13);

  if (v14)
    return (*(uint64_t (**)(int64_t, char *, uint64_t))(v6 + 32))(v88, v8, v89);
  v15 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  v16 = sub_1B69C9EB8();
  v17 = v6;
  v18 = v8;
  if (!v16)
    goto LABEL_11;
  if (!*(_QWORD *)(v16 + 16) || (sub_1B699E8D4(0x7A69726F68747541, 0xED00006E6F697461), (v19 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1B69CA26C();
  v20 = sub_1B69CA254();
  v22 = v21;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (v22 >> 60 == 15)
  {
LABEL_11:
    sub_1B69BB778();
    swift_allocError();
    *v25 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v18, v89);
  }
  v23 = sub_1B69C9EE8();
  if (v24 >> 60 == 15)
  {
    sub_1B699FF80(v20, v22);
    goto LABEL_11;
  }
  v74 = v17;
  v26 = v23;
  v27 = v24;
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), sel_init);
  v82 = v20;
  v83 = v22;
  v29 = (void *)sub_1B69CA098();
  objc_msgSend(v28, sel_appendData_, v29);

  v81 = v26;
  v80 = v27;
  v30 = (void *)sub_1B69CA098();
  objc_msgSend(v28, sel_appendData_, v30);

  v79 = v28;
  v31 = objc_msgSend(v28, sel_fm_sha256Hash);
  v32 = sub_1B69CA0B0();
  v34 = v33;

  v35 = dispatch_group_create();
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = 0;
  v85 = (id *)(v36 + 16);
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = MEMORY[0x1E0DEE9E0];
  v38 = v37 + 16;
  dispatch_group_enter(v35);
  v84 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v78 = v32;
  v77 = v34;
  v39 = (void *)sub_1B69CA098();
  v40 = (_QWORD *)swift_allocObject();
  v40[2] = v35;
  v40[3] = v36;
  v40[4] = v37;
  aBlock[4] = sub_1B69BBC68;
  aBlock[5] = v40;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B69BB6A0;
  aBlock[3] = &block_descriptor_69;
  v41 = _Block_copy(aBlock);
  v42 = v35;
  v76 = v36;
  swift_retain();
  v75 = v37;
  swift_retain();
  swift_release();
  v43 = v84;
  -[NSObject signatureHeadersWithData:completion:](v84, sel_signatureHeadersWithData_completion_, v39, v41);
  v44 = v85;
  _Block_release(v41);

  v45 = v38;
  v84 = v42;
  sub_1B69CA38C();
  swift_beginAccess();
  v46 = v88;
  if (!*(_QWORD *)(*(_QWORD *)v38 + 16))
  {
    v73[1] = sub_1B69CA368();
    v86 = sub_1B69CA3E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_1B69CB2C0;
    swift_beginAccess();
    v90 = *v44;
    v48 = v90;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF13DBA0);
    v49 = sub_1B69CA284();
    v51 = v50;
    v52 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v47 + 56) = MEMORY[0x1E0DEA968];
    v53 = sub_1B699F398();
    *(_QWORD *)(v47 + 64) = v53;
    *(_QWORD *)(v47 + 32) = v49;
    *(_QWORD *)(v47 + 40) = v51;
    swift_bridgeObjectRetain();
    v54 = v52;
    v55 = sub_1B69CA218();
    v57 = v56;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v47 + 96) = v54;
    *(_QWORD *)(v47 + 104) = v53;
    *(_QWORD *)(v47 + 72) = v55;
    *(_QWORD *)(v47 + 80) = v57;
    v58 = (void *)v86;
    sub_1B69CA11C();

    swift_bridgeObjectRelease();
    v59 = *v44;
    v60 = *v44;
    v61 = *v44;
    if (!*v44)
    {
      sub_1B69BB778();
      v61 = (id)swift_allocError();
      *v62 = 3;
      v60 = *v44;
    }
    *v44 = v61;
    v63 = v59;

    v46 = v88;
  }
  swift_beginAccess();
  if (*v44)
  {
    aBlock[8] = 3;
    sub_1B69CA5E4();
    sub_1B69C9F00();
    swift_bridgeObjectRelease();
  }
  v64 = *(_QWORD *)v45 + 64;
  v65 = 1 << *(_BYTE *)(*(_QWORD *)v45 + 32);
  v66 = -1;
  if (v65 < 64)
    v66 = ~(-1 << v65);
  v67 = v66 & *(_QWORD *)(*(_QWORD *)v45 + 64);
  v88 = (unint64_t)(v65 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v68 = 0;
  while (1)
  {
    if (v67)
    {
      v67 &= v67 - 1;
      goto LABEL_23;
    }
    v69 = v68 + 1;
    if (__OFADD__(v68, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    v70 = v89;
    if (v69 >= v88)
      goto LABEL_39;
    v71 = *(_QWORD *)(v64 + 8 * v69);
    ++v68;
    if (!v71)
    {
      v68 = v69 + 1;
      if (v69 + 1 >= v88)
        goto LABEL_39;
      v71 = *(_QWORD *)(v64 + 8 * v68);
      if (!v71)
      {
        v68 = v69 + 2;
        if (v69 + 2 >= v88)
          goto LABEL_39;
        v71 = *(_QWORD *)(v64 + 8 * v68);
        if (!v71)
          break;
      }
    }
LABEL_38:
    v67 = (v71 - 1) & v71;
LABEL_23:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B69C9F00();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v72 = v69 + 3;
  if (v72 >= v88)
  {
LABEL_39:
    swift_release();
    sub_1B699FF80(v82, v83);
    sub_1B699FF80(v81, v80);

    sub_1B699DB18(v78, v77);
    (*(void (**)(int64_t, char *, uint64_t))(v74 + 32))(v46, v18, v70);
    swift_release();
    return swift_release();
  }
  v71 = *(_QWORD *)(v64 + 8 * v72);
  if (v71)
  {
    v68 = v72;
    goto LABEL_38;
  }
  while (1)
  {
    v68 = v72 + 1;
    if (__OFADD__(v72, 1))
      break;
    if (v68 >= v88)
      goto LABEL_39;
    v71 = *(_QWORD *)(v64 + 8 * v68);
    ++v72;
    if (v71)
      goto LABEL_38;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B69BB22C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t *))
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2;
  v5 = a1;
  return a3(&v5, &v4);
}

id FMNHttpClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FMNHttpClient.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t FMNHttpClient.urlSession(_:didReceive:completionHandler:)(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t (*v22)(_QWORD, _QWORD);
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, _QWORD);
  uint64_t v33;
  _QWORD aBlock[6];

  v32 = a3;
  v29 = a2;
  v6 = sub_1B69CA134();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B69CA158();
  v30 = *(_QWORD *)(v10 - 8);
  v31 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1B69CA140();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (uint64_t *)(v4 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler);
  swift_beginAccess();
  v18 = *v17;
  if (!*v17)
    return v32(1, 0);
  v28 = v7;
  v19 = v17[1];
  sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF540], v13);
  swift_retain();
  v27 = sub_1B69CA3D4();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v18;
  v20[3] = v19;
  v21 = v29;
  v22 = v32;
  v20[4] = v29;
  v20[5] = v22;
  v20[6] = a4;
  aBlock[4] = sub_1B69BB7D8;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_17;
  v23 = _Block_copy(aBlock);
  sub_1B69A1624(v18);
  v24 = v21;
  swift_retain();
  sub_1B69CA14C();
  v33 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  v25 = (void *)v27;
  MEMORY[0x1BCC9A3EC](0, v12, v9, v23);
  _Block_release(v23);

  sub_1B6996708(v18);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v31);
  return swift_release();
}

void sub_1B69BB5D0(uint64_t a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v9 = (uint64_t *)(a5 + 16);
  swift_beginAccess();
  v10 = *(void **)(a4 + 16);
  *(_QWORD *)(a4 + 16) = a2;
  v11 = a2;

  if (a1)
  {
    v12 = a1;
  }
  else
  {
    swift_beginAccess();
    v12 = *v9;
    swift_bridgeObjectRetain();
  }
  swift_beginAccess();
  *v9 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  dispatch_group_leave(a3);
}

uint64_t sub_1B69BB6A0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_1B69CA20C();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69BB728()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B69BB74C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1B69BB778()
{
  unint64_t result;

  result = qword_1EF13DAF0;
  if (!qword_1EF13DAF0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC4F4, &type metadata for FMNHttpClient.ClientError);
    atomic_store(result, (unint64_t *)&qword_1EF13DAF0);
  }
  return result;
}

uint64_t sub_1B69BB7BC(uint64_t a1)
{
  uint64_t v1;

  return sub_1B69BA244(a1, *(void (**)(void **))(v1 + 16));
}

uint64_t sub_1B69BB7E4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_bundleIdentifierFallback);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of FMNRequestConfigurating.accountType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNRequestConfigurating.urlComponents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for FMNHttpClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNHttpClient.authenticationChallengeHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of FMNHttpClient.authenticationChallengeHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of FMNHttpClient.authenticationChallengeHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of FMNHttpClient.bundleIdentifierFallback.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of FMNHttpClient.bundleIdentifierFallback.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of FMNHttpClient.bundleIdentifierFallback.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FMNHttpClient.__allocating_init(credential:urlSessionFactory:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of FMNHttpClient.registerHandler(for:handler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of FMNHttpClient.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of FMNHttpClient.upload(requestContent:urlComponents:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of FMNHttpClient.fetch(requestContent:urlComponents:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

ValueMetadata *type metadata accessor for FMNHttpClient.ErrorCode()
{
  return &type metadata for FMNHttpClient.ErrorCode;
}

ValueMetadata *type metadata accessor for FMNHttpClient.StatusCode()
{
  return &type metadata for FMNHttpClient.StatusCode;
}

uint64_t storeEnumTagSinglePayload for FMNHttpClient.ClientError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69BBA5C + 4 * byte_1B69CC415[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1B69BBA90 + 4 * byte_1B69CC410[v4]))();
}

uint64_t sub_1B69BBA90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69BBA98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69BBAA0);
  return result;
}

uint64_t sub_1B69BBAAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69BBAB4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1B69BBAB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69BBAC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNHttpClient.ClientError()
{
  return &type metadata for FMNHttpClient.ClientError;
}

unint64_t sub_1B69BBAE0()
{
  unint64_t result;

  result = qword_1EF13DB98;
  if (!qword_1EF13DB98)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC4CC, &type metadata for FMNHttpClient.ClientError);
    atomic_store(result, (unint64_t *)&qword_1EF13DB98);
  }
  return result;
}

uint64_t sub_1B69BBB24()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B69BBB4C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B69BBB70()
{
  return swift_deallocObject();
}

uint64_t sub_1B69BBB80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69BBBA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_1B69BBBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1B69B93DC(a1, a2, a3, *(void (**)(uint64_t *, _QWORD *))(v3 + 16));
}

uint64_t sub_1B69BBBE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_1B69B92B0(a1, a2, *(void (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))(v2 + 16));
}

uint64_t sub_1B69BBBEC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B69BBC10()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B69BBC34()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1B69BBC68(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_1B69BB5D0(a1, a2, *(NSObject **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t objectdestroy_56Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1B69BBCA4()
{
  unint64_t result;

  result = qword_1EF13DBB0;
  if (!qword_1EF13DBB0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CBB78, &type metadata for TaskSerializationError);
    atomic_store(result, (unint64_t *)&qword_1EF13DBB0);
  }
  return result;
}

uint64_t sub_1B69BBCE8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_1B69BBD10()
{
  return sub_1B69B8348();
}

ValueMetadata *type metadata accessor for HARv1dot2()
{
  return &type metadata for HARv1dot2;
}

uint64_t *sub_1B69BBD90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B69CA0D4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    v12 = *((_QWORD *)v11 + 1);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *((_QWORD *)v10 + 1) = v12;
    v13 = *((_QWORD *)v11 + 3);
    *((_QWORD *)v10 + 2) = *((_QWORD *)v11 + 2);
    *((_QWORD *)v10 + 3) = v13;
    v14 = *((_QWORD *)v11 + 5);
    *((_QWORD *)v10 + 4) = *((_QWORD *)v11 + 4);
    *((_QWORD *)v10 + 5) = v14;
    v15 = *((_QWORD *)v11 + 7);
    *((_QWORD *)v10 + 6) = *((_QWORD *)v11 + 6);
    *((_QWORD *)v10 + 7) = v15;
    *((_QWORD *)v10 + 8) = *((_QWORD *)v11 + 8);
    *(_OWORD *)(v10 + 72) = *(_OWORD *)(v11 + 72);
    v16 = *((_QWORD *)v11 + 12);
    *((_QWORD *)v10 + 11) = *((_QWORD *)v11 + 11);
    *((_QWORD *)v10 + 12) = v16;
    v17 = (char *)a1 + v9;
    v18 = (char *)a2 + v9;
    *(_OWORD *)v17 = *(_OWORD *)v18;
    v19 = *((_QWORD *)v18 + 3);
    *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
    *((_QWORD *)v17 + 3) = v19;
    v20 = *((_QWORD *)v18 + 5);
    *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
    *((_QWORD *)v17 + 5) = v20;
    v21 = *((_QWORD *)v18 + 7);
    *((_QWORD *)v17 + 6) = *((_QWORD *)v18 + 6);
    *((_QWORD *)v17 + 7) = v21;
    v22 = *((_QWORD *)v18 + 9);
    *((_QWORD *)v17 + 8) = *((_QWORD *)v18 + 8);
    *((_QWORD *)v17 + 9) = v22;
    *((_OWORD *)v17 + 5) = *((_OWORD *)v18 + 5);
    v23 = *((_QWORD *)v18 + 13);
    *((_QWORD *)v17 + 12) = *((_QWORD *)v18 + 12);
    *((_QWORD *)v17 + 13) = v23;
    *((_QWORD *)v17 + 14) = *((_QWORD *)v18 + 14);
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
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B69BBF30(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B69CA0D4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
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
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B69BBFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v24;

  v6 = sub_1B69CA0D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v24 = a1;
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_QWORD *)(v10 + 8);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = v11;
  v12 = *(_QWORD *)(v10 + 24);
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v10 + 16);
  *(_QWORD *)(v9 + 24) = v12;
  v13 = *(_QWORD *)(v10 + 40);
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  *(_QWORD *)(v9 + 40) = v13;
  v14 = *(_QWORD *)(v10 + 56);
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(v10 + 48);
  *(_QWORD *)(v9 + 56) = v14;
  *(_QWORD *)(v9 + 64) = *(_QWORD *)(v10 + 64);
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v10 + 72);
  v15 = *(_QWORD *)(v10 + 96);
  *(_QWORD *)(v9 + 88) = *(_QWORD *)(v10 + 88);
  *(_QWORD *)(v9 + 96) = v15;
  v16 = a1 + v8;
  v17 = a2 + v8;
  *(_OWORD *)v16 = *(_OWORD *)v17;
  v18 = *(_QWORD *)(v17 + 24);
  *(_QWORD *)(v16 + 16) = *(_QWORD *)(v17 + 16);
  *(_QWORD *)(v16 + 24) = v18;
  v19 = *(_QWORD *)(v17 + 40);
  *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
  *(_QWORD *)(v16 + 40) = v19;
  v20 = *(_QWORD *)(v17 + 56);
  *(_QWORD *)(v16 + 48) = *(_QWORD *)(v17 + 48);
  *(_QWORD *)(v16 + 56) = v20;
  v21 = *(_QWORD *)(v17 + 72);
  *(_QWORD *)(v16 + 64) = *(_QWORD *)(v17 + 64);
  *(_QWORD *)(v16 + 72) = v21;
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v17 + 80);
  v22 = *(_QWORD *)(v17 + 104);
  *(_QWORD *)(v16 + 96) = *(_QWORD *)(v17 + 96);
  *(_QWORD *)(v16 + 104) = v22;
  *(_QWORD *)(v16 + 112) = *(_QWORD *)(v17 + 112);
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
  swift_bridgeObjectRetain();
  return v24;
}

uint64_t sub_1B69BC164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_1B69CA0D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = *(_QWORD *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[8] = v9[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[9] = v9[9];
  v8[10] = v9[10];
  v8[11] = v9[11];
  v8[12] = v9[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *(_QWORD *)(a2 + v10);
  v11[1] = *(_QWORD *)(a2 + v10 + 8);
  v11[2] = *(_QWORD *)(a2 + v10 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[3] = v12[3];
  v11[4] = v12[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[5] = v12[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[6] = v12[6];
  v11[7] = v12[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[8] = v12[8];
  v11[9] = v12[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[10] = v12[10];
  v11[11] = v12[11];
  v11[12] = v12[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[13] = v12[13];
  v11[14] = v12[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B69BC394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v6 = sub_1B69CA0D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 96) = *(_QWORD *)(v10 + 96);
  v12 = *(_OWORD *)(v10 + 80);
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  *(_OWORD *)(v9 + 80) = v12;
  v13 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v13;
  v14 = a1 + v8;
  v15 = a2 + v8;
  v16 = *(_OWORD *)(v15 + 80);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(v15 + 64);
  *(_OWORD *)(v14 + 80) = v16;
  *(_OWORD *)(v14 + 96) = *(_OWORD *)(v15 + 96);
  *(_QWORD *)(v14 + 112) = *(_QWORD *)(v15 + 112);
  v17 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v17;
  v18 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(v14 + 48) = v18;
  return a1;
}

uint64_t sub_1B69BC440(uint64_t a1, uint64_t a2, uint64_t a3)
{
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

  v6 = sub_1B69CA0D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *(_QWORD *)v8 = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v9 + 24);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  *(_QWORD *)(v8 + 24) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v9 + 40);
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(v8 + 40) = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(v9 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(v9 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
  v13 = *(_QWORD *)(v9 + 96);
  *(_QWORD *)(v8 + 88) = *(_QWORD *)(v9 + 88);
  *(_QWORD *)(v8 + 96) = v13;
  swift_bridgeObjectRelease();
  v14 = *(int *)(a3 + 24);
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_QWORD *)(v15 + 16) = *(_QWORD *)(v16 + 16);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(v16 + 32);
  *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
  *(_QWORD *)(v15 + 32) = v17;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + 40) = *(_QWORD *)(v16 + 40);
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(v16 + 56);
  *(_QWORD *)(v15 + 48) = *(_QWORD *)(v16 + 48);
  *(_QWORD *)(v15 + 56) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(v16 + 72);
  *(_QWORD *)(v15 + 64) = *(_QWORD *)(v16 + 64);
  *(_QWORD *)(v15 + 72) = v19;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(v16 + 80);
  *(_QWORD *)(v15 + 96) = *(_QWORD *)(v16 + 96);
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(v16 + 112);
  *(_QWORD *)(v15 + 104) = *(_QWORD *)(v16 + 104);
  *(_QWORD *)(v15 + 112) = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B69BC5A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69BC5B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1B69CA0D4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1B69BC634()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B69BC640(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1B69CA0D4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for HAREntry()
{
  uint64_t result;

  result = qword_1EF13DC78;
  if (!qword_1EF13DC78)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B69BC6F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69CA0D4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B69BC774()
{
  uint64_t v0;

  v0 = sub_1B69CA278();
  __swift_allocate_value_buffer(v0, qword_1EF141DE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF141DE8);
  return sub_1B69CA26C();
}

uint64_t sub_1B69BC7BC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  _OWORD v10[3];
  uint64_t v11;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DCB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69BD444();
  sub_1B69CA7AC();
  v8 = *(_OWORD *)(v2 + 16);
  v10[0] = *(_OWORD *)v2;
  v10[1] = v8;
  v10[2] = *(_OWORD *)(v2 + 32);
  v11 = *(_QWORD *)(v2 + 48);
  sub_1B69BD488();
  sub_1B69CA5CC();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1B69BC8D0()
{
  return 6778732;
}

uint64_t sub_1B69BC8E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1B69CA68C();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_1B69BC964(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1B69BC970()
{
  sub_1B69BD444();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BC998()
{
  sub_1B69BD444();
  return sub_1B69CA7D0();
}

double sub_1B69BC9C0@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  sub_1B69BE86C(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1B69BCA0C(_QWORD *a1)
{
  return sub_1B69BC7BC(a1);
}

uint64_t sub_1B69BCA20(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  _OWORD v11[2];
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DD58);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69BF6F4();
  sub_1B69CA7AC();
  LOBYTE(v11[0]) = 0;
  sub_1B69CA5B4();
  if (!v2)
  {
    *(_QWORD *)&v11[0] = *(_QWORD *)(v3 + 16);
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DD68);
    sub_1B69BFB28(&qword_1EF13DD70, &qword_1EF13DD78, (uint64_t)&unk_1B69CC620, MEMORY[0x1E0DEAF10]);
    sub_1B69CA5CC();
    v9 = *(_OWORD *)(v3 + 40);
    v11[0] = *(_OWORD *)(v3 + 24);
    v11[1] = v9;
    v12 = 2;
    sub_1B69BF738();
    sub_1B69CA5CC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1B69BCBBC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  uint64_t v12;
  __int128 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v20;
  __int128 v21;
  _BYTE v22[80];
  uint64_t v23;
  char v24;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DD08);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69BEA00();
  sub_1B69CA7AC();
  LOBYTE(v20) = 0;
  sub_1B69CA0D4();
  sub_1B699AEC4(&qword_1EF13DD10, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
  sub_1B69CA5CC();
  if (!v2)
  {
    v9 = type metadata accessor for HAREntry();
    v10 = (__int128 *)(v3 + *(int *)(v9 + 20));
    v11 = v10[1];
    v12 = *((_QWORD *)v10 + 4);
    v20 = *v10;
    v21 = v11;
    *(_QWORD *)v22 = v12;
    *(_OWORD *)&v22[8] = *(__int128 *)((char *)v10 + 40);
    *(_OWORD *)&v22[24] = *(__int128 *)((char *)v10 + 56);
    *(_OWORD *)&v22[40] = *(__int128 *)((char *)v10 + 72);
    *(_OWORD *)&v22[56] = *(__int128 *)((char *)v10 + 88);
    v24 = 1;
    sub_1B69BEACC();
    sub_1B69CA5CC();
    v13 = (__int128 *)(v3 + *(int *)(v9 + 24));
    v14 = *((_QWORD *)v13 + 2);
    v15 = *((_QWORD *)v13 + 3);
    v16 = *((_QWORD *)v13 + 14);
    v20 = *v13;
    *(_QWORD *)&v21 = v14;
    *((_QWORD *)&v21 + 1) = v15;
    v17 = v13[3];
    *(_OWORD *)v22 = v13[2];
    *(_OWORD *)&v22[16] = v17;
    v18 = v13[5];
    *(_OWORD *)&v22[32] = v13[4];
    *(_OWORD *)&v22[48] = v18;
    *(_OWORD *)&v22[64] = v13[6];
    v23 = v16;
    v24 = 2;
    sub_1B69BEB10();
    sub_1B69CA5CC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1B69BCDC4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[80];
  uint64_t v33;
  char v34;

  v24 = a2;
  v25 = sub_1B69CA0D4();
  v3 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DCE0);
  v5 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for HAREntry();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69BEA00();
  v26 = v7;
  v11 = v29;
  sub_1B69CA7A0();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  v12 = v5;
  v29 = v8;
  LOBYTE(v30) = 0;
  sub_1B699AEC4(&qword_1EF13DCF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  v13 = v25;
  sub_1B69CA584();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v10, v27, v13);
  v34 = 1;
  sub_1B69BEA44();
  sub_1B69CA584();
  v14 = v31;
  v15 = *(_QWORD *)v32;
  v16 = v29;
  v17 = &v10[*(int *)(v29 + 20)];
  *(_OWORD *)v17 = v30;
  *((_OWORD *)v17 + 1) = v14;
  *((_QWORD *)v17 + 4) = v15;
  *(_OWORD *)(v17 + 40) = *(_OWORD *)&v32[8];
  *(_OWORD *)(v17 + 56) = *(_OWORD *)&v32[24];
  *(_OWORD *)(v17 + 72) = *(_OWORD *)&v32[40];
  *(_OWORD *)(v17 + 88) = *(_OWORD *)&v32[56];
  v34 = 2;
  sub_1B69BEA88();
  sub_1B69CA584();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v26, v28);
  v18 = v31;
  v19 = v33;
  v20 = &v10[*(int *)(v16 + 24)];
  *(_OWORD *)v20 = v30;
  *((_OWORD *)v20 + 1) = v18;
  v21 = *(_OWORD *)&v32[16];
  *((_OWORD *)v20 + 2) = *(_OWORD *)v32;
  *((_OWORD *)v20 + 3) = v21;
  v22 = *(_OWORD *)&v32[48];
  *((_OWORD *)v20 + 4) = *(_OWORD *)&v32[32];
  *((_OWORD *)v20 + 5) = v22;
  *((_OWORD *)v20 + 6) = *(_OWORD *)&v32[64];
  *((_QWORD *)v20 + 14) = v19;
  sub_1B69AF8E8((uint64_t)v10, v24);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return sub_1B69AF92C((uint64_t)v10);
}

uint64_t sub_1B69BD140()
{
  char *v0;

  return *(_QWORD *)&aVersion_0[8 * *v0];
}

uint64_t sub_1B69BD158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B69BF77C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B69BD17C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1B69BD188()
{
  sub_1B69BF6F4();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BD1B0()
{
  sub_1B69BF6F4();
  return sub_1B69CA7D0();
}

double sub_1B69BD1D8@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  sub_1B69BF8D0(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1B69BD224(_QWORD *a1)
{
  return sub_1B69BCA20(a1);
}

uint64_t sub_1B69BD238()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E6F6973726576;
  else
    return 1701667182;
}

uint64_t sub_1B69BD26C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B69BFBAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B69BD290()
{
  sub_1B69C18C0();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BD2B8()
{
  sub_1B69C18C0();
  return sub_1B69CA7D0();
}

uint64_t sub_1B69BD2E0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B69BDEF4(a1, &qword_1EF13DED8, (void (*)(void))sub_1B69C18C0, a2);
}

uint64_t sub_1B69BD30C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_1B69BDA78(a1, *v1, v1[1], v1[2], v1[3], &qword_1EF13DE90, (void (*)(_QWORD *, uint64_t, uint64_t))sub_1B69C18C0);
}

uint64_t sub_1B69BD340()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x74736575716572;
  if (*v0 != 1)
    v1 = 0x65736E6F70736572;
  if (*v0)
    return v1;
  else
    return 0x4464657472617473;
}

uint64_t sub_1B69BD3A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B69BFC8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B69BD3CC()
{
  sub_1B69BEA00();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BD3F4()
{
  sub_1B69BEA00();
  return sub_1B69CA7D0();
}

uint64_t sub_1B69BD41C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B69BCDC4(a1, a2);
}

uint64_t sub_1B69BD430(_QWORD *a1)
{
  return sub_1B69BCBBC(a1);
}

unint64_t sub_1B69BD444()
{
  unint64_t result;

  result = qword_1EF13DCC0;
  if (!qword_1EF13DCC0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC9F4, &type metadata for HARv1dot2.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DCC0);
  }
  return result;
}

unint64_t sub_1B69BD488()
{
  unint64_t result;

  result = qword_1EF13DCC8;
  if (!qword_1EF13DCC8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC9CC, &type metadata for HARLog);
    atomic_store(result, (unint64_t *)&qword_1EF13DCC8);
  }
  return result;
}

uint64_t sub_1B69BD4CC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69BD4FC + 4 * byte_1B69CC578[a1]))(0x646F6874656DLL, 0xE600000000000000);
}

uint64_t sub_1B69BD4FC()
{
  return 7107189;
}

uint64_t sub_1B69BD50C()
{
  return 0x7372655670747468;
}

uint64_t sub_1B69BD52C()
{
  return 0x7365696B6F6F63;
}

uint64_t sub_1B69BD544()
{
  return 0x73726564616568;
}

uint64_t sub_1B69BD55C()
{
  return 0x7274537972657571;
}

uint64_t sub_1B69BD57C()
{
  return 0x6953726564616568;
}

uint64_t sub_1B69BD598()
{
  return 0x657A695379646F62;
}

uint64_t sub_1B69BD5B0()
{
  return 0x746E656D6D6F63;
}

uint64_t sub_1B69BD5C8(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DDE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69C04DC();
  sub_1B69CA7AC();
  LOBYTE(v11) = 0;
  sub_1B69CA5B4();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_1B69CA5B4();
    LOBYTE(v11) = 2;
    sub_1B69CA5B4();
    v11 = v3[6];
    HIBYTE(v10) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DDE8);
    sub_1B69C1E70(&qword_1EF13DDF0, &qword_1EF13DDE8, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEAF10]);
    sub_1B69CA5CC();
    v11 = v3[7];
    HIBYTE(v10) = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DDC0);
    sub_1B69C0B64(&qword_1EF13DDF8, (uint64_t (*)(void))sub_1B69C0C54, MEMORY[0x1E0DEAF10]);
    sub_1B69CA5CC();
    v11 = v3[8];
    HIBYTE(v10) = 5;
    sub_1B69CA5CC();
    LOBYTE(v11) = 6;
    sub_1B69CA5C0();
    LOBYTE(v11) = 7;
    sub_1B69CA5C0();
    LOBYTE(v11) = 8;
    sub_1B69CA5A8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1B69BD888(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[4];
  uint64_t v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DE08);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69C0B20();
  sub_1B69CA7AC();
  LOBYTE(v12[0]) = 0;
  sub_1B69CA5C0();
  if (!v2)
  {
    LOBYTE(v12[0]) = 1;
    sub_1B69CA5B4();
    LOBYTE(v12[0]) = 2;
    sub_1B69CA5B4();
    *(_QWORD *)&v12[0] = *(_QWORD *)(v3 + 40);
    v14 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DDC0);
    sub_1B69C0B64(&qword_1EF13DDF8, (uint64_t (*)(void))sub_1B69C0C54, MEMORY[0x1E0DEAF10]);
    sub_1B69CA5CC();
    v9 = *(_OWORD *)(v3 + 96);
    v12[2] = *(_OWORD *)(v3 + 80);
    v12[3] = v9;
    v13 = *(_QWORD *)(v3 + 112);
    v10 = *(_OWORD *)(v3 + 64);
    v12[0] = *(_OWORD *)(v3 + 48);
    v12[1] = v10;
    v14 = 4;
    sub_1B69C0C98();
    sub_1B69CA5CC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1B69BDA78(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, void (*a7)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  char v19;
  char v20;

  v18[2] = a3;
  v18[0] = a4;
  v18[1] = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(a6);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a7(v13, v14, v15);
  sub_1B69CA7AC();
  v20 = 0;
  v16 = v18[3];
  sub_1B69CA5B4();
  if (!v16)
  {
    v19 = 1;
    sub_1B69CA5B4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1B69BDB9C()
{
  unsigned __int8 *v0;

  return sub_1B69BD4CC(*v0);
}

uint64_t sub_1B69BDBA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B69BFE04(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B69BDBC8(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_1B69BDBD4()
{
  sub_1B69C04DC();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BDBFC()
{
  sub_1B69C04DC();
  return sub_1B69CA7D0();
}

__n128 sub_1B69BDC24@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[6];
  uint64_t v8;

  sub_1B69C01D4(a1, (uint64_t *)v7);
  if (!v2)
  {
    v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(_QWORD *)(a2 + 96) = v8;
    v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_1B69BDC80(_QWORD *a1)
{
  return sub_1B69BD5C8(a1);
}

uint64_t sub_1B69BDC94()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69BDCC0 + 4 * byte_1B69CC581[*v0]))(0x737574617473, 0xE600000000000000);
}

uint64_t sub_1B69BDCC0()
{
  return 0x6554737574617473;
}

uint64_t sub_1B69BDCDC()
{
  return 0x7372655670747468;
}

uint64_t sub_1B69BDCFC()
{
  return 0x73726564616568;
}

uint64_t sub_1B69BDD14()
{
  return 0x746E65746E6F63;
}

uint64_t sub_1B69BDD2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B69C0520(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B69BDD50(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1B69BDD5C()
{
  sub_1B69C0B20();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BDD84()
{
  sub_1B69C0B20();
  return sub_1B69CA7D0();
}

double sub_1B69BDDAC@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  sub_1B69C0758(a1, (uint64_t *)v8);
  if (!v2)
  {
    v5 = v12;
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v13;
    *(_QWORD *)(a2 + 112) = v14;
    v6 = v8[1];
    *(_OWORD *)a2 = v8[0];
    *(_OWORD *)(a2 + 16) = v6;
    result = *(double *)&v9;
    v7 = v10;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v7;
  }
  return result;
}

uint64_t sub_1B69BDE10(_QWORD *a1)
{
  return sub_1B69BD888(a1);
}

uint64_t sub_1B69BDE24()
{
  _BYTE *v0;

  if (*v0)
    return 0x65756C6176;
  else
    return 1701667182;
}

uint64_t sub_1B69BDE54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B69C0CDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B69BDE78()
{
  sub_1B69C0F70();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BDEA0()
{
  sub_1B69C0F70();
  return sub_1B69CA7D0();
}

uint64_t sub_1B69BDEC8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B69BDEF4(a1, &qword_1EF13DE18, (void (*)(void))sub_1B69C0F70, a2);
}

uint64_t sub_1B69BDEF4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X3>, void (*a3)(void)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = sub_1B69C0DB4(a1, a2, a3);
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
    a4[2] = v8;
    a4[3] = v9;
  }
  return result;
}

uint64_t sub_1B69BDF2C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_1B69BDA78(a1, *v1, v1[1], v1[2], v1[3], &qword_1EF13DE28, (void (*)(_QWORD *, uint64_t, uint64_t))sub_1B69C0F70);
}

void sub_1B69BDF60(char *a1)
{
  sub_1B69A6C68(*a1);
}

void sub_1B69BDF6C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B69CA770();
  __asm { BR              X9 }
}

uint64_t sub_1B69BDFB0()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

void sub_1B69BE02C()
{
  __asm { BR              X10 }
}

uint64_t sub_1B69BE060()
{
  sub_1B69CA29C();
  return swift_bridgeObjectRelease();
}

void sub_1B69BE0C8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B69CA770();
  __asm { BR              X9 }
}

uint64_t sub_1B69BE108()
{
  sub_1B69CA29C();
  swift_bridgeObjectRelease();
  return sub_1B69CA788();
}

uint64_t sub_1B69BE184@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B69C1904();
  *a1 = result;
  return result;
}

uint64_t sub_1B69BE1B0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1B69BE1D8 + 4 * byte_1B69CC595[*v0]))();
}

void sub_1B69BE1D8(_QWORD *a1@<X8>)
{
  *a1 = 0x65707954656D696DLL;
  a1[1] = 0xE800000000000000;
}

void sub_1B69BE1F4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1702521203;
  a1[1] = v1;
}

void sub_1B69BE204(_QWORD *a1@<X8>)
{
  *a1 = 0x746E656D6D6F63;
  a1[1] = 0xE700000000000000;
}

void sub_1B69BE220(_QWORD *a1@<X8>)
{
  *a1 = 0x676E69646F636E65;
  a1[1] = 0xE800000000000000;
}

uint64_t sub_1B69BE23C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B69BE264 + 4 * byte_1B69CC59A[*v0]))(1954047348, 0xE400000000000000);
}

uint64_t sub_1B69BE264()
{
  return 0x65707954656D696DLL;
}

uint64_t sub_1B69BE27C()
{
  return 1702521203;
}

uint64_t sub_1B69BE288()
{
  return 0x746E656D6D6F63;
}

uint64_t sub_1B69BE2A0()
{
  return 0x676E69646F636E65;
}

uint64_t sub_1B69BE2B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B69C1904();
  *a1 = result;
  return result;
}

uint64_t sub_1B69BE2DC()
{
  sub_1B69C1D50();
  return sub_1B69CA7C4();
}

uint64_t sub_1B69BE304()
{
  sub_1B69C1D50();
  return sub_1B69CA7D0();
}

uint64_t sub_1B69BE32C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[16];
  _BYTE v21[16];
  _BYTE v22[16];
  _BYTE v23[16];
  _QWORD v24[2];
  int v25;
  char v26;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DEB8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69C1D50();
  sub_1B69CA7AC();
  sub_1B69C1DD8(v3, (uint64_t)v23);
  sub_1B69C1DD8((uint64_t)v23, (uint64_t)v24);
  v17 = v6;
  if (v24[1])
  {
    if (qword_1EF13D5E8 != -1)
      swift_once();
    v9 = sub_1B69CA278();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EF141DE8);
    v10 = sub_1B69CA254();
    v12 = v11;
    v16 = v10;
    if (v11 >> 60 != 15)
      __asm { BR              X10 }
    v15 = 0;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v12 = 0xF000000000000000;
  }
  v25 = 1;
  v18 = 0;
  v19 = 0;
  v26 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA50);
  sub_1B69C1E70(&qword_1EF13DEC0, &qword_1ED52FA50, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEE988]);
  sub_1B69CA5CC();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v5);
    sub_1B699FF80(v16, v12);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1B69C1DD8(v3 + 16, (uint64_t)v22);
    sub_1B69C1DD8((uint64_t)v22, (uint64_t)&v18);
    v26 = 1;
    sub_1B69C1E20((uint64_t)v22);
    sub_1B69CA5CC();
    sub_1B69C1E48((uint64_t)v22);
    v18 = v15;
    LOBYTE(v19) = v25;
    v26 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DEC8);
    sub_1B69C1E70(&qword_1EF13DED0, &qword_1EF13DEC8, MEMORY[0x1E0DEB420], MEMORY[0x1E0DEE988]);
    sub_1B69CA5CC();
    sub_1B69C1DD8(v3 + 40, (uint64_t)v21);
    sub_1B69C1DD8((uint64_t)v21, (uint64_t)&v18);
    v26 = 3;
    sub_1B69C1E20((uint64_t)v21);
    sub_1B69CA5CC();
    sub_1B69C1E48((uint64_t)v21);
    sub_1B69C1DD8(v3 + 56, (uint64_t)v20);
    sub_1B69C1DD8((uint64_t)v20, (uint64_t)&v18);
    v26 = 4;
    sub_1B69C1E20((uint64_t)v20);
    sub_1B69CA5CC();
    sub_1B699FF80(v16, v12);
    sub_1B69C1E48((uint64_t)v20);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v5);
  }
}

__n128 sub_1B69BE7DC@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  uint64_t v7;

  sub_1B69C194C(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_QWORD *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_1B69BE82C(_QWORD *a1)
{
  return sub_1B69BE32C(a1);
}

uint64_t sub_1B69BE86C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DCD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69BD444();
  sub_1B69CA7A0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  sub_1B69BE9BC();
  sub_1B69CA584();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v9 = v15;
  v10 = v18;
  v11 = v19;
  v13 = v16;
  v14 = v17;
  result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  *(_QWORD *)a2 = v9;
  *(_OWORD *)(a2 + 8) = v13;
  *(_OWORD *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 40) = v10;
  *(_QWORD *)(a2 + 48) = v11;
  return result;
}

unint64_t sub_1B69BE9BC()
{
  unint64_t result;

  result = qword_1EF13DCD8;
  if (!qword_1EF13DCD8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC9A4, &type metadata for HARLog);
    atomic_store(result, (unint64_t *)&qword_1EF13DCD8);
  }
  return result;
}

unint64_t sub_1B69BEA00()
{
  unint64_t result;

  result = qword_1EF13DCE8;
  if (!qword_1EF13DCE8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC954, &type metadata for HAREntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DCE8);
  }
  return result;
}

unint64_t sub_1B69BEA44()
{
  unint64_t result;

  result = qword_1EF13DCF8;
  if (!qword_1EF13DCF8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC92C, &type metadata for HARRequest);
    atomic_store(result, (unint64_t *)&qword_1EF13DCF8);
  }
  return result;
}

unint64_t sub_1B69BEA88()
{
  unint64_t result;

  result = qword_1EF13DD00;
  if (!qword_1EF13DD00)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC904, &type metadata for HARResponse);
    atomic_store(result, (unint64_t *)&qword_1EF13DD00);
  }
  return result;
}

unint64_t sub_1B69BEACC()
{
  unint64_t result;

  result = qword_1EF13DD18;
  if (!qword_1EF13DD18)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC8DC, &type metadata for HARRequest);
    atomic_store(result, (unint64_t *)&qword_1EF13DD18);
  }
  return result;
}

unint64_t sub_1B69BEB10()
{
  unint64_t result;

  result = qword_1EF13DD20;
  if (!qword_1EF13DD20)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC8B4, &type metadata for HARResponse);
    atomic_store(result, (unint64_t *)&qword_1EF13DD20);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

ValueMetadata *type metadata accessor for HARHeader()
{
  return &type metadata for HARHeader;
}

ValueMetadata *type metadata accessor for HAREntry.CodingKeys()
{
  return &type metadata for HAREntry.CodingKeys;
}

ValueMetadata *type metadata accessor for HARv1dot2.CodingKeys()
{
  return &type metadata for HARv1dot2.CodingKeys;
}

uint64_t _s12FMNetworking6HARLogVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s12FMNetworking6HARLogVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s12FMNetworking6HARLogVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12FMNetworking6HARLogVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12FMNetworking6HARLogVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1B69BEDEC(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HARLog()
{
  return &type metadata for HARLog;
}

uint64_t destroy for HARResponse()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HARResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HARResponse(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for HARResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HARResponse(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HARResponse(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HARResponse()
{
  return &type metadata for HARResponse;
}

uint64_t destroy for HARRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HARRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HARRequest(_QWORD *a1, _QWORD *a2)
{
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for HARRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v6 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HARRequest(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HARRequest(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HARRequest()
{
  return &type metadata for HARRequest;
}

unint64_t sub_1B69BF548()
{
  unint64_t result;

  result = qword_1EF13DD28;
  if (!qword_1EF13DD28)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC784, &type metadata for HARv1dot2.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DD28);
  }
  return result;
}

unint64_t sub_1B69BF590()
{
  unint64_t result;

  result = qword_1EF13DD30;
  if (!qword_1EF13DD30)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC83C, &type metadata for HAREntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DD30);
  }
  return result;
}

unint64_t sub_1B69BF5D8()
{
  unint64_t result;

  result = qword_1EF13DD38;
  if (!qword_1EF13DD38)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC7AC, &type metadata for HAREntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DD38);
  }
  return result;
}

unint64_t sub_1B69BF620()
{
  unint64_t result;

  result = qword_1EF13DD40;
  if (!qword_1EF13DD40)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC7D4, &type metadata for HAREntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DD40);
  }
  return result;
}

unint64_t sub_1B69BF668()
{
  unint64_t result;

  result = qword_1EF13DD48;
  if (!qword_1EF13DD48)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC6F4, &type metadata for HARv1dot2.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DD48);
  }
  return result;
}

unint64_t sub_1B69BF6B0()
{
  unint64_t result;

  result = qword_1EF13DD50;
  if (!qword_1EF13DD50)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC71C, &type metadata for HARv1dot2.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DD50);
  }
  return result;
}

unint64_t sub_1B69BF6F4()
{
  unint64_t result;

  result = qword_1EF13DD60;
  if (!qword_1EF13DD60)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCECC, &type metadata for HARLog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DD60);
  }
  return result;
}

unint64_t sub_1B69BF738()
{
  unint64_t result;

  result = qword_1EF13DD80;
  if (!qword_1EF13DD80)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCEA4, &type metadata for HARCreator);
    atomic_store(result, (unint64_t *)&qword_1EF13DD80);
  }
  return result;
}

uint64_t sub_1B69BF77C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656972746E65 && a2 == 0xE700000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F7461657263 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1B69BF8D0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t result;
  _QWORD v14[2];
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DD88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69BF6F4();
  sub_1B69CA7A0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
    v9 = sub_1B69CA554();
    v11 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DD68);
    v15 = 1;
    sub_1B69BFB28(&qword_1EF13DD90, &qword_1EF13DD98, (uint64_t)&unk_1B69CC648, MEMORY[0x1E0DEAF40]);
    swift_bridgeObjectRetain();
    sub_1B69CA584();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v14[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
    a2[3] = 0xD000000000000010;
    a2[4] = 0x80000001B69CEF80;
    a2[5] = 3157553;
    a2[6] = 0xE300000000000000;
  }
  return result;
}

uint64_t sub_1B69BFB28(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF13DD68);
    v10 = sub_1B699AEC4(a2, (uint64_t (*)(uint64_t))type metadata accessor for HAREntry, a3);
    result = MEMORY[0x1BCC9ABA8](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B69BFBAC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1B69BFC8C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4464657472617473 && a2 == 0xEF656D6954657461;
  if (v2 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736575716572 && a2 == 0xE700000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1B69BFE04(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x646F6874656DLL && a2 == 0xE600000000000000;
  if (v2 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7372655670747468 && a2 == 0xEB000000006E6F69 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7365696B6F6F63 && a2 == 0xE700000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x73726564616568 && a2 == 0xE700000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7274537972657571 && a2 == 0xEB00000000676E69 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6953726564616568 && a2 == 0xEA0000000000657ALL || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x657A695379646F62 && a2 == 0xE800000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x746E656D6D6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_1B69C01D4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DDA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69C04DC();
  sub_1B69CA7A0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    return swift_bridgeObjectRelease_n();
  }
  else
  {
    v33 = 0;
    v9 = sub_1B69CA554();
    v11 = v10;
    v28 = v9;
    v32 = 1;
    swift_bridgeObjectRetain();
    v12 = sub_1B69CA554();
    v29 = v13;
    v27 = v12;
    v31 = 2;
    swift_bridgeObjectRetain();
    v25 = sub_1B69CA554();
    v26 = v14;
    v30 = 8;
    swift_bridgeObjectRetain();
    v15 = sub_1B69CA548();
    v17 = v16;
    v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    v19 = v15;
    v18(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v21 = v26;
    swift_bridgeObjectRelease();
    v22 = v29;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *a2 = v28;
    a2[1] = v11;
    a2[2] = v27;
    a2[3] = v22;
    a2[4] = v25;
    a2[5] = v21;
    a2[6] = v20;
    a2[7] = v20;
    a2[8] = v20;
    a2[9] = -1;
    a2[10] = -1;
    a2[11] = v19;
    a2[12] = v17;
  }
  return result;
}

unint64_t sub_1B69C04DC()
{
  unint64_t result;

  result = qword_1EF13DDA8;
  if (!qword_1EF13DDA8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCE54, &type metadata for HARRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DDA8);
  }
  return result;
}

uint64_t sub_1B69C0520(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x737574617473 && a2 == 0xE600000000000000;
  if (v2 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6554737574617473 && a2 == 0xEA00000000007478 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7372655670747468 && a2 == 0xEB000000006E6F69 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73726564616568 && a2 == 0xE700000000000000 || (sub_1B69CA68C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_1B69C0758@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t result;
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
  char v46;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DDB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69C0B20();
  sub_1B69CA7A0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  LOBYTE(v37) = 0;
  v9 = sub_1B69CA578();
  LOBYTE(v37) = 1;
  v10 = sub_1B69CA554();
  v12 = v11;
  v35 = v10;
  v36 = v9;
  LOBYTE(v37) = 2;
  swift_bridgeObjectRetain();
  v13 = sub_1B69CA554();
  v15 = v14;
  v33 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DDC0);
  v46 = 3;
  sub_1B69C0B64(&qword_1EF13DDC8, (uint64_t (*)(void))sub_1B69C0BCC, MEMORY[0x1E0DEAF40]);
  v34 = v15;
  swift_bridgeObjectRetain();
  sub_1B69CA584();
  v16 = v37;
  v46 = 4;
  sub_1B69C0C10();
  swift_bridgeObjectRetain();
  sub_1B69CA584();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v38;
  v31 = v39;
  v32 = v37;
  v18 = v16;
  v19 = v40;
  v20 = v43;
  v29 = v42;
  v30 = v41;
  v21 = v45;
  v28 = v44;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22 = v34;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v24 = v35;
  *a2 = v36;
  a2[1] = v24;
  v25 = v33;
  a2[2] = v12;
  a2[3] = v25;
  a2[4] = v22;
  a2[5] = v18;
  a2[6] = v32;
  a2[7] = v17;
  a2[8] = v31;
  a2[9] = v19;
  v26 = v29;
  a2[10] = v30;
  a2[11] = v26;
  v27 = v28;
  a2[12] = v20;
  a2[13] = v27;
  a2[14] = v21;
  return result;
}

unint64_t sub_1B69C0B20()
{
  unint64_t result;

  result = qword_1EF13DDB8;
  if (!qword_1EF13DDB8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCE04, &type metadata for HARResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DDB8);
  }
  return result;
}

uint64_t sub_1B69C0B64(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF13DDC0);
    v8 = a2();
    result = MEMORY[0x1BCC9ABA8](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B69C0BCC()
{
  unint64_t result;

  result = qword_1EF13DDD0;
  if (!qword_1EF13DDD0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC88C, &type metadata for HARHeader);
    atomic_store(result, (unint64_t *)&qword_1EF13DDD0);
  }
  return result;
}

unint64_t sub_1B69C0C10()
{
  unint64_t result;

  result = qword_1EF13DDD8;
  if (!qword_1EF13DDD8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCDDC, &type metadata for HARContent);
    atomic_store(result, (unint64_t *)&qword_1EF13DDD8);
  }
  return result;
}

unint64_t sub_1B69C0C54()
{
  unint64_t result;

  result = qword_1EF13DE00;
  if (!qword_1EF13DE00)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC864, &type metadata for HARHeader);
    atomic_store(result, (unint64_t *)&qword_1EF13DE00);
  }
  return result;
}

unint64_t sub_1B69C0C98()
{
  unint64_t result;

  result = qword_1EF13DE10;
  if (!qword_1EF13DE10)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCDB4, &type metadata for HARContent);
    atomic_store(result, (unint64_t *)&qword_1EF13DE10);
  }
  return result;
}

uint64_t sub_1B69C0CDC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1B69CA68C() & 1) != 0)
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
    v6 = sub_1B69CA68C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1B69C0DB4(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;

  v14 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  a3();
  sub_1B69CA7A0();
  if (v3)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  else
  {
    v10 = v6;
    v16 = 0;
    v11 = v14;
    v9 = sub_1B69CA554();
    v15 = 1;
    swift_bridgeObjectRetain();
    sub_1B69CA554();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v11);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v9;
}

unint64_t sub_1B69C0F70()
{
  unint64_t result;

  result = qword_1EF13DE20;
  if (!qword_1EF13DE20)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCD64, &type metadata for HARHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE20);
  }
  return result;
}

ValueMetadata *type metadata accessor for HARHeader.CodingKeys()
{
  return &type metadata for HARHeader.CodingKeys;
}

ValueMetadata *type metadata accessor for HARResponse.CodingKeys()
{
  return &type metadata for HARResponse.CodingKeys;
}

uint64_t getEnumTagSinglePayload for HARRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HARRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69C10BC + 4 * byte_1B69CC5A4[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1B69C10F0 + 4 * byte_1B69CC59F[v4]))();
}

uint64_t sub_1B69C10F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C10F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69C1100);
  return result;
}

uint64_t sub_1B69C110C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69C1114);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1B69C1118(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C1120(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HARRequest.CodingKeys()
{
  return &type metadata for HARRequest.CodingKeys;
}

uint64_t _s12FMNetworking8HAREntryV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12FMNetworking8HAREntryV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69C1218 + 4 * byte_1B69CC5AE[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B69C124C + 4 * byte_1B69CC5A9[v4]))();
}

uint64_t sub_1B69C124C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C1254(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69C125CLL);
  return result;
}

uint64_t sub_1B69C1268(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69C1270);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B69C1274(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C127C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HARLog.CodingKeys()
{
  return &type metadata for HARLog.CodingKeys;
}

ValueMetadata *type metadata accessor for HARCreator()
{
  return &type metadata for HARCreator;
}

uint64_t destroy for HARContent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HARContent(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HARContent(_QWORD *a1, _QWORD *a2)
{
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
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

uint64_t assignWithTake for HARContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HARContent(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 72))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HARContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 72) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HARContent()
{
  return &type metadata for HARContent;
}

unint64_t sub_1B69C1564()
{
  unint64_t result;

  result = qword_1EF13DE30;
  if (!qword_1EF13DE30)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCB14, &type metadata for HARLog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE30);
  }
  return result;
}

unint64_t sub_1B69C15AC()
{
  unint64_t result;

  result = qword_1EF13DE38;
  if (!qword_1EF13DE38)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCBCC, &type metadata for HARRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE38);
  }
  return result;
}

unint64_t sub_1B69C15F4()
{
  unint64_t result;

  result = qword_1EF13DE40;
  if (!qword_1EF13DE40)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCC84, &type metadata for HARResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE40);
  }
  return result;
}

unint64_t sub_1B69C163C()
{
  unint64_t result;

  result = qword_1EF13DE48;
  if (!qword_1EF13DE48)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCD3C, &type metadata for HARHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE48);
  }
  return result;
}

unint64_t sub_1B69C1684()
{
  unint64_t result;

  result = qword_1EF13DE50;
  if (!qword_1EF13DE50)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCCAC, &type metadata for HARHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE50);
  }
  return result;
}

unint64_t sub_1B69C16CC()
{
  unint64_t result;

  result = qword_1EF13DE58;
  if (!qword_1EF13DE58)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCCD4, &type metadata for HARHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE58);
  }
  return result;
}

unint64_t sub_1B69C1714()
{
  unint64_t result;

  result = qword_1EF13DE60;
  if (!qword_1EF13DE60)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCBF4, &type metadata for HARResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE60);
  }
  return result;
}

unint64_t sub_1B69C175C()
{
  unint64_t result;

  result = qword_1EF13DE68;
  if (!qword_1EF13DE68)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCC1C, &type metadata for HARResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE68);
  }
  return result;
}

unint64_t sub_1B69C17A4()
{
  unint64_t result;

  result = qword_1EF13DE70;
  if (!qword_1EF13DE70)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCB3C, &type metadata for HARRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE70);
  }
  return result;
}

unint64_t sub_1B69C17EC()
{
  unint64_t result;

  result = qword_1EF13DE78;
  if (!qword_1EF13DE78)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCB64, &type metadata for HARRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE78);
  }
  return result;
}

unint64_t sub_1B69C1834()
{
  unint64_t result;

  result = qword_1EF13DE80;
  if (!qword_1EF13DE80)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCA84, &type metadata for HARLog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE80);
  }
  return result;
}

unint64_t sub_1B69C187C()
{
  unint64_t result;

  result = qword_1EF13DE88;
  if (!qword_1EF13DE88)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCAAC, &type metadata for HARLog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE88);
  }
  return result;
}

unint64_t sub_1B69C18C0()
{
  unint64_t result;

  result = qword_1EF13DE98;
  if (!qword_1EF13DE98)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD1CC, &type metadata for HARCreator.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DE98);
  }
  return result;
}

uint64_t sub_1B69C1904()
{
  unint64_t v0;

  v0 = sub_1B69CA524();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_1B69C194C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  char *v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;

  v45 = a2;
  v44 = sub_1B69CA278();
  v3 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78](v44);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13DEA0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B69C1D50();
  v10 = v46;
  sub_1B69CA7A0();
  if (v10)
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  v43 = v3;
  v46 = v5;
  v11 = v7;
  v12 = v44;
  v13 = v45;
  v51 = 0;
  v14 = sub_1B69CA548();
  if (v15)
  {
    v41 = sub_1B69CA08C();
    v18 = v17;
    swift_bridgeObjectRelease();
    if (v18 >> 60 == 15)
    {
      sub_1B69C1D94();
      swift_allocError();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v6);
      return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    }
    v19 = v11;
    if (qword_1EF13D5E8 != -1)
      swift_once();
    v42 = a1;
    v20 = __swift_project_value_buffer(v12, (uint64_t)qword_1EF141DE8);
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v46, v20, v12);
    v21 = v41;
    v44 = sub_1B69CA260();
    v46 = v22;
    sub_1B699FF80(v21, v18);
  }
  else
  {
    v44 = v14;
    v42 = a1;
    v46 = 0;
    v19 = v11;
  }
  v50 = 1;
  v23 = v6;
  v24 = v9;
  v25 = sub_1B69CA548();
  v27 = v26;
  v28 = v25;
  v29 = v13;
  v49 = 2;
  swift_bridgeObjectRetain();
  v43 = sub_1B69CA578();
  v48 = 3;
  v30 = sub_1B69CA548();
  v32 = v31;
  v40 = v30;
  v41 = v28;
  v47 = 4;
  swift_bridgeObjectRetain();
  v33 = sub_1B69CA548();
  v35 = v34;
  v36 = v33;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v23);
  swift_bridgeObjectRetain();
  v37 = v46;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *v29 = v44;
  v29[1] = (uint64_t)v37;
  v29[2] = v41;
  v29[3] = v27;
  v38 = v40;
  v29[4] = v43;
  v29[5] = v38;
  v29[6] = v32;
  v29[7] = v36;
  v29[8] = v35;
  return result;
}

unint64_t sub_1B69C1D50()
{
  unint64_t result;

  result = qword_1EF13DEA8;
  if (!qword_1EF13DEA8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD17C, &type metadata for HARContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DEA8);
  }
  return result;
}

unint64_t sub_1B69C1D94()
{
  unint64_t result;

  result = qword_1EF13DEB0;
  if (!qword_1EF13DEB0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD13C, &type metadata for HARContent.ContentError);
    atomic_store(result, (unint64_t *)&qword_1EF13DEB0);
  }
  return result;
}

uint64_t sub_1B69C1DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FA50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B69C1E20(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B69C1E48(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B69C1E70(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x1BCC9ABA8](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s12FMNetworking9HARv1dot2V10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B69C1F0C + 4 * byte_1B69CC5B3[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B69C1F2C + 4 * byte_1B69CC5B8[v4]))();
}

_BYTE *sub_1B69C1F0C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B69C1F2C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69C1F34(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69C1F3C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69C1F44(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69C1F4C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HARContent.ContentError()
{
  return &type metadata for HARContent.ContentError;
}

uint64_t _s12FMNetworking11HARResponseV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12FMNetworking11HARResponseV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69C2044 + 4 * byte_1B69CC5C2[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B69C2078 + 4 * byte_1B69CC5BD[v4]))();
}

uint64_t sub_1B69C2078(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C2080(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69C2088);
  return result;
}

uint64_t sub_1B69C2094(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69C209CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B69C20A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C20A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HARContent.CodingKeys()
{
  return &type metadata for HARContent.CodingKeys;
}

uint64_t _s12FMNetworking9HARHeaderV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69C2110 + 4 * byte_1B69CC5CC[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B69C2144 + 4 * byte_1B69CC5C7[v4]))();
}

uint64_t sub_1B69C2144(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C214C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69C2154);
  return result;
}

uint64_t sub_1B69C2160(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69C2168);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B69C216C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C2174(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HARCreator.CodingKeys()
{
  return &type metadata for HARCreator.CodingKeys;
}

unint64_t sub_1B69C2194()
{
  unint64_t result;

  result = qword_1EF13DEE0;
  if (!qword_1EF13DEE0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCFBC, &type metadata for HARCreator.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DEE0);
  }
  return result;
}

unint64_t sub_1B69C21DC()
{
  unint64_t result;

  result = qword_1EF13DEE8;
  if (!qword_1EF13DEE8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD0AC, &type metadata for HARContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DEE8);
  }
  return result;
}

unint64_t sub_1B69C2224()
{
  unint64_t result;

  result = qword_1EF13DEF0;
  if (!qword_1EF13DEF0)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD114, &type metadata for HARContent.ContentError);
    atomic_store(result, (unint64_t *)&qword_1EF13DEF0);
  }
  return result;
}

unint64_t sub_1B69C226C()
{
  unint64_t result;

  result = qword_1EF13DEF8;
  if (!qword_1EF13DEF8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCFE4, &type metadata for HARContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DEF8);
  }
  return result;
}

unint64_t sub_1B69C22B4()
{
  unint64_t result;

  result = qword_1EF13DF00;
  if (!qword_1EF13DF00)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD00C, &type metadata for HARContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DF00);
  }
  return result;
}

unint64_t sub_1B69C22FC()
{
  unint64_t result;

  result = qword_1EF13DF08;
  if (!qword_1EF13DF08)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCF2C, &type metadata for HARCreator.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DF08);
  }
  return result;
}

unint64_t sub_1B69C2344()
{
  unint64_t result;

  result = qword_1EF13DF10;
  if (!qword_1EF13DF10)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CCF54, &type metadata for HARCreator.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF13DF10);
  }
  return result;
}

uint64_t sub_1B69C2390(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  v5 = v4 + ((unsigned __int16)((v3 & 0xF8) + 23) & (unsigned __int16)~(v3 & 0xF8) & 0x1F8);
  swift_retain();
  return v5;
}

uint64_t sub_1B69C23DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void (*v25)(unint64_t, unint64_t, uint64_t);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v6 = (_QWORD *)((swift_unknownObjectWeakCopyAssign() + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  v8 = v7[1];
  *v6 = *v7;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v6[1] = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)v6 + v10 + 16) & ~v10;
  v12 = ((unint64_t)v7 + v10 + 16) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v11, v12);
  v13 = *(_QWORD *)(v9 + 64) + 7;
  v14 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  v15 = (v13 + v12) & 0xFFFFFFFFFFFFFFF8;
  v16 = *(_QWORD *)(v15 + 24);
  if (*(_QWORD *)(v14 + 24) < 0xFFFFFFFFuLL)
  {
    if (v16 >= 0xFFFFFFFF)
    {
      *(_QWORD *)(v14 + 24) = v16;
      *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
      (**(void (***)(unint64_t, unint64_t))(v16 - 8))(v14, v15);
      goto LABEL_8;
    }
  }
  else
  {
    if (v16 >= 0xFFFFFFFF)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v14, (uint64_t *)v15);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0Tm(v14);
  }
  v17 = *(_OWORD *)v15;
  v18 = *(_OWORD *)(v15 + 16);
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  *(_OWORD *)v14 = v17;
  *(_OWORD *)(v14 + 16) = v18;
LABEL_8:
  v19 = (v14 + 47) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
  v21 = *(void **)v19;
  v22 = *(void **)v20;
  if (*(_QWORD *)v19 < 0xFFFFFFFFuLL)
  {
    if ((unint64_t)v22 >= 0xFFFFFFFF)
    {
      *(_QWORD *)v19 = v22;
      v24 = *(_QWORD *)(v20 + 32);
      *(_QWORD *)(v19 + 32) = v24;
      *(_QWORD *)(v19 + 40) = *(_QWORD *)(v20 + 40);
      v25 = **(void (***)(unint64_t, unint64_t, uint64_t))(v24 - 8);
      v26 = v22;
      v25(v19 + 8, v20 + 8, v24);
      *(_QWORD *)(v19 + 48) = *(_QWORD *)(v20 + 48);
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    v27 = *(_OWORD *)v20;
    v28 = *(_OWORD *)(v20 + 16);
    v29 = *(_OWORD *)(v20 + 32);
    *(_QWORD *)(v19 + 48) = *(_QWORD *)(v20 + 48);
    *(_OWORD *)(v19 + 16) = v28;
    *(_OWORD *)(v19 + 32) = v29;
    *(_OWORD *)v19 = v27;
    goto LABEL_15;
  }
  if ((unint64_t)v22 < 0xFFFFFFFF)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v19 + 8);
    swift_release();
    goto LABEL_14;
  }
  *(_QWORD *)v19 = v22;
  v23 = v22;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v19 + 8), (uint64_t *)(v20 + 8));
  *(_QWORD *)(v19 + 48) = *(_QWORD *)(v20 + 48);
  swift_retain();
  swift_release();
LABEL_15:
  *(_QWORD *)((swift_weakCopyAssign() + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((((v20 + 63) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1B69C261C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v6 = (_QWORD *)((swift_unknownObjectWeakTakeAssign() + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)((a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  v8 = v7[1];
  *v6 = *v7;
  swift_unknownObjectRelease();
  v6[1] = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)v6 + v10 + 16) & ~v10;
  v12 = ((unint64_t)v7 + v10 + 16) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(v11, v12);
  v13 = *(_QWORD *)(v9 + 64) + 7;
  v14 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  v15 = (v13 + v12) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v14 + 24) >= 0xFFFFFFFFuLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v14);
  v16 = *(_OWORD *)v15;
  v17 = *(_OWORD *)(v15 + 16);
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  *(_OWORD *)v14 = v16;
  *(_OWORD *)(v14 + 16) = v17;
  v18 = (v14 + 47) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(void **)v18;
  if (*(_QWORD *)v18 < 0xFFFFFFFFuLL)
    goto LABEL_7;
  if (*(_QWORD *)v19 < 0xFFFFFFFFuLL)
  {

    __swift_destroy_boxed_opaque_existential_0Tm(v18 + 8);
    swift_release();
LABEL_7:
    v23 = *(_OWORD *)v19;
    v24 = *(_OWORD *)(v19 + 16);
    v25 = *(_OWORD *)(v19 + 32);
    *(_QWORD *)(v18 + 48) = *(_QWORD *)(v19 + 48);
    *(_OWORD *)(v18 + 16) = v24;
    *(_OWORD *)(v18 + 32) = v25;
    *(_OWORD *)v18 = v23;
    goto LABEL_8;
  }
  *(_QWORD *)v18 = *(_QWORD *)v19;

  __swift_destroy_boxed_opaque_existential_0Tm(v18 + 8);
  v21 = *(_OWORD *)(v19 + 8);
  v22 = *(_OWORD *)(v19 + 24);
  *(_QWORD *)(v18 + 40) = *(_QWORD *)(v19 + 40);
  *(_OWORD *)(v18 + 24) = v22;
  *(_OWORD *)(v18 + 8) = v21;
  *(_QWORD *)(v18 + 48) = *(_QWORD *)(v19 + 48);
  swift_release();
LABEL_8:
  *(_QWORD *)((swift_weakTakeAssign() + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((((v19 + 63) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1B69C27B4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t *v12;
  unint64_t v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    v12 = (unint64_t *)((a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    if (v5 > 0x7FFFFFFE)
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v12 + v7 + 16) & ~v7);
    }
    else
    {
      v13 = *v12;
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      if ((v13 + 1) >= 2)
        return v13;
      else
        return 0;
    }
  }
  else
  {
    if (((((((((((*(_QWORD *)(v4 + 64) + ((v7 + 24) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8)
             + 63) & 0xFFFFFFFFFFFFFFF8)
           + 15) & 0xFFFFFFFFFFFFFFF8)
         + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_1B69C2858 + 4 * byte_1B69CD240[v10]))();
  }
}

void sub_1B69C28F0(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((((((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 24) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
      __asm { BR              X13 }
  }
  if (((((((((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 24) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8)
       + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((((((((*(_QWORD *)(v5 + 64) + ((v7 + 24) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8)+ 15) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_1B69C2A10()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x1B69C2A98);
}

void sub_1B69C2A18(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x1B69C2A20);
  JUMPOUT(0x1B69C2A98);
}

void sub_1B69C2A6C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x1B69C2A98);
}

void sub_1B69C2A74()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x1B69C2A98);
}

uint64_t sub_1B69C2A7C@<X0>(unsigned int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_WORD *)(v7 + v8) = 0;
  if (!a1)
    goto LABEL_6;
  v3 = (_QWORD *)((v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  if (a2 <= 0x7FFFFFFE)
  {
    if (a1 > 0x7FFFFFFE)
      JUMPOUT(0x1B69C2A88);
    *v3 = a1;
LABEL_6:
    JUMPOUT(0x1B69C2A98);
  }
  return (*(uint64_t (**)(unint64_t))(v5 + 56))(((unint64_t)v3 + v6 + 16) & a3);
}

void sub_1B69C2AB0(void *a1, NSObject *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B69CADE0;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF13DBA0);
  v6 = sub_1B69CA284();
  v8 = v7;
  *(_QWORD *)(v4 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v4 + 64) = sub_1B699F398();
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 40) = v8;
  sub_1B69A0A18();
  v9 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  dispatch_group_leave(a2);
}

uint64_t static FMNAPSTokenProvidingError.== infix(_:_:)()
{
  return 1;
}

uint64_t FMNAPSTokenProvidingError.hash(into:)()
{
  return sub_1B69CA77C();
}

uint64_t FMNAPSTokenProvidingError.hashValue.getter()
{
  sub_1B69CA770();
  sub_1B69CA77C();
  return sub_1B69CA788();
}

id sub_1B69C2C0C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection);
  v3 = v2;
  if (v2 == (void *)1)
  {
    swift_unknownObjectUnownedInit();
    v3 = sub_1B69C2C94();
    swift_unknownObjectUnownedDestroy();
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;
    sub_1B69C61A8(v4);
  }
  sub_1B69C61B8(v2);
  return v3;
}

id sub_1B69C2C94()
{
  char *Strong;
  id v1;
  id v2;
  void *v3;
  char *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  id v13;

  Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  v1 = *(id *)&Strong[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection];
  v2 = v1;

  if (!v1)
  {
    sub_1B69CA248();
    v3 = (void *)swift_unknownObjectUnownedLoadStrong();
    swift_bridgeObjectRetain();

    v4 = (char *)swift_unknownObjectUnownedLoadStrong();
    v5 = *(id *)&v4[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];

    v6 = objc_allocWithZone(MEMORY[0x1E0CFE148]);
    v7 = (void *)sub_1B69CA23C();
    swift_bridgeObjectRelease();
    v8 = (void *)sub_1B69CA23C();
    swift_bridgeObjectRelease();
    v1 = objc_msgSend(v6, sel_initWithEnvironmentName_namedDelegatePort_queue_, v7, v8, v5);

    if (v1)
    {
      v9 = (void *)swift_unknownObjectUnownedLoadStrong();
      v10 = v1;
      objc_msgSend(v10, sel_setDelegate_, v9);

    }
    v11 = (char *)swift_unknownObjectUnownedLoadStrong();
    v12 = *(void **)&v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection];
    *(_QWORD *)&v11[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection] = v1;
    v13 = v1;

  }
  return v1;
}

id FMNPushNotificatonHandler.__allocating_init(topic:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = sub_1B69CA248();
  v6 = v5;
  v7 = objc_allocWithZone((Class)type metadata accessor for FMNPushNotificatonHandler());
  return FMNPushNotificatonHandler.init(topic:namedDelegatePort:)(a1, a2, v4, v6);
}

id FMNPushNotificatonHandler.__allocating_init(topic:namedDelegatePort:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return FMNPushNotificatonHandler.init(topic:namedDelegatePort:)(a1, a2, a3, a4);
}

uint64_t type metadata accessor for FMNPushNotificatonHandler()
{
  return objc_opt_self();
}

id FMNPushNotificatonHandler.init(topic:namedDelegatePort:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  objc_class *v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  uint64_t v28;

  v25 = a3;
  v26 = a4;
  v23 = a1;
  v24 = a2;
  v5 = sub_1B69CA398();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v5);
  v7 = sub_1B69CA158();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1B69CA3A4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue;
  v21[1] = sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF8D8], v8);
  v12 = v4;
  sub_1B69CA14C();
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED530450, v6, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED530430);
  sub_1B699AF44((unint64_t *)&qword_1ED530440, (uint64_t *)&unk_1ED530430, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  *(_QWORD *)&v4[v22] = sub_1B69CA3C8();
  *(_QWORD *)&v12[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_pendingTopicTokenFutures] = MEMORY[0x1E0DEE9E8];
  v13 = &v12[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v12[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection] = 1;
  v15 = &v12[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
  v16 = v24;
  *(_QWORD *)v15 = v23;
  *((_QWORD *)v15 + 1) = v16;
  v17 = &v12[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_namedDelegatePort];
  v18 = v26;
  *(_QWORD *)v17 = v25;
  *((_QWORD *)v17 + 1) = v18;

  v19 = (objc_class *)type metadata accessor for FMNPushNotificatonHandler();
  v27.receiver = v12;
  v27.super_class = v19;
  return objc_msgSendSuper2(&v27, sel_init);
}

id FMNPushNotificatonHandler.__deallocating_deinit()
{
  char *v0;
  void *v1;
  objc_super v3;

  v1 = *(void **)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection];
  if (v1)
  {
    *(_QWORD *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection] = 0;
    objc_msgSend(v1, sel_shutdown);

  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for FMNPushNotificatonHandler();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1B69C32B4()
{
  char *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  _QWORD v14[2];
  _QWORD aBlock[6];

  v1 = sub_1B69CA134();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B69CA158();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = *(_QWORD *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_1B69C61A0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_12_0;
  v11 = _Block_copy(aBlock);
  v12 = v0;
  sub_1B69CA14C();
  v14[1] = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, v2, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v9, v5, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

void sub_1B69C34A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken + 8))
  {
    v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken);
  }
  else
  {
    if (!*(_QWORD *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken + 8))
      return;
    v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken);
    swift_bridgeObjectRetain();
  }
  v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_pendingTopicTokenFutures);
  swift_beginAccess();
  v4 = *v3;
  v20 = a1;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B69CA458();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
    sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
    sub_1B69CA35C();
    v4 = v23;
    v21 = v24;
    v5 = v25;
    v6 = v26;
    v7 = v27;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(v4 + 32);
    v21 = v4 + 56;
    v5 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(v4 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v6 = 0;
  }
  v11 = (unint64_t)(v5 + 64) >> 6;
  if (v4 < 0)
    goto LABEL_14;
  while (1)
  {
    if (v7)
    {
      v12 = (v7 - 1) & v7;
      v13 = __clz(__rbit64(v7)) | (v6 << 6);
      v14 = v6;
      goto LABEL_31;
    }
    v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      return;
    }
    if (v15 >= v11)
      goto LABEL_34;
    v16 = *(_QWORD *)(v21 + 8 * v15);
    v14 = v6 + 1;
    if (!v16)
    {
      v14 = v6 + 2;
      if (v6 + 2 >= v11)
        goto LABEL_34;
      v16 = *(_QWORD *)(v21 + 8 * v14);
      if (!v16)
      {
        v14 = v6 + 3;
        if (v6 + 3 >= v11)
          goto LABEL_34;
        v16 = *(_QWORD *)(v21 + 8 * v14);
        if (!v16)
        {
          v14 = v6 + 4;
          if (v6 + 4 >= v11)
            goto LABEL_34;
          v16 = *(_QWORD *)(v21 + 8 * v14);
          if (!v16)
            break;
        }
      }
    }
LABEL_30:
    v12 = (v16 - 1) & v16;
    v13 = __clz(__rbit64(v16)) + (v14 << 6);
LABEL_31:
    v18 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13);
    swift_retain();
    if (!v18)
      goto LABEL_34;
    while (1)
    {
      v22 = v2;
      sub_1B69CA1E8();
      swift_release();
      v6 = v14;
      v7 = v12;
      if ((v4 & 0x8000000000000000) == 0)
        break;
LABEL_14:
      if (sub_1B69CA47C())
      {
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
        swift_dynamicCast();
        swift_unknownObjectRelease();
        v14 = v6;
        v12 = v7;
        if (v22)
          continue;
      }
      goto LABEL_34;
    }
  }
  v17 = v6 + 5;
  while (v11 != v17)
  {
    v16 = *(_QWORD *)(v21 + 8 * v17++);
    if (v16)
    {
      v14 = v17 - 1;
      goto LABEL_30;
    }
  }
LABEL_34:
  sub_1B69B8340();
  swift_bridgeObjectRelease();
  v19 = *(void **)(v20 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection);
  if (v19)
  {
    *(_QWORD *)(v20 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection) = 0;
    objc_msgSend(v19, sel_shutdown);

  }
}

uint64_t sub_1B69C37D8()
{
  char *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  char *v14;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v1 = sub_1B69CA134();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B69CA158();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
  v11 = *(_QWORD *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic + 8];
  v16[0] = *(_QWORD *)&v0[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v0;
  v12[3] = v10;
  v12[4] = v11;
  aBlock[4] = sub_1B69C62BC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_40;
  v13 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v14 = v0;
  sub_1B69CA14C();
  v16[1] = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, v2, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v9, v5, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

void sub_1B69C39E0()
{
  id v0;
  void *v1;
  id v2;

  v0 = sub_1B69C2C0C();
  if (v0)
  {
    v1 = v0;
    v2 = (id)sub_1B69CA23C();
    objc_msgSend(v1, sel_requestTokenForTopic_identifier_, v2, 0);

  }
}

id FMNPushNotificatonHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FMNPushNotificatonHandler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t FMNPushNotificatonHandler.topicToken()()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v1 = sub_1B69CA134();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v17 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1B69CA158();
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B69C37D8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
  swift_allocObject();
  v8 = sub_1B69CA1F4();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v0;
  *(_QWORD *)(v9 + 24) = v8;
  v10 = v0;
  swift_retain();
  sub_1B69CA1D0();
  swift_release();
  swift_release();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v8;
  aBlock[4] = sub_1B69C403C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_4;
  v12 = _Block_copy(aBlock);
  v13 = v10;
  swift_retain();
  sub_1B69CA14C();
  v18 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, v2, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v7, v4, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  swift_release();
  return v8;
}

uint64_t sub_1B69C3D50(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
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
  void *v16;
  char *v17;
  _QWORD v19[2];
  _QWORD aBlock[6];

  v6 = sub_1B69CA134();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B69CA158();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = *(_QWORD *)&a3[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_apsQueue];
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  aBlock[4] = sub_1B69C6284;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_34;
  v16 = _Block_copy(aBlock);
  v17 = a3;
  swift_retain();
  sub_1B69CA14C();
  v19[1] = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, v7, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

uint64_t sub_1B69C3F50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B69C3D50(a1, a2, *(char **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1B69C3F58()
{
  swift_beginAccess();
  sub_1B69C4638();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1B69C3FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_beginAccess();
  swift_retain();
  sub_1B69C5630(&v4, a2);
  swift_endAccess();
  swift_release();
  return sub_1B69C32B4();
}

uint64_t sub_1B69C403C()
{
  uint64_t v0;

  return sub_1B69C3FB8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t FMNPushNotificatonHandler.topicToken(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  FMNPushNotificatonHandler.topicToken()();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_1B69CA1D0();
  swift_release();
  swift_release();
  return swift_release();
}

void sub_1B69C40B8(uint64_t *a1, id a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (a2)
  {
    v4 = a2;
    v5 = a2;
    v6 = (uint64_t)v4;
LABEL_3:
    a3(v6, 0, 1);

    return;
  }
  v7 = a1[1];
  if (!v7)
  {
    sub_1B69C623C();
    v6 = swift_allocError();
    v4 = (id)v6;
    goto LABEL_3;
  }
  a3(*a1, v7, 0);
}

void sub_1B69C414C(uint64_t *a1, void *a2)
{
  uint64_t v2;

  sub_1B69C40B8(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_1B69C4154()
{
  return FMNPushNotificatonHandler.topicToken()();
}

uint64_t sub_1B69C4174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  FMNPushNotificatonHandler.topicToken()();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_1B69CA1D0();
  swift_release();
  swift_release();
  return swift_release();
}

void FMNPushNotificatonHandler.connection(_:didReceivePublicToken:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1B69C5AA4(a2, a3);
}

void FMNPushNotificatonHandler.connection(_:didReceiveToken:forTopic:identifier:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1B69C5D5C(a2, a3);
}

uint64_t sub_1B69C42A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topicAPSToken);
  *v3 = a2;
  v3[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_1B69C32B4();
}

void FMNPushNotificatonHandler.connection(_:didReceiveMessageForTopic:userInfo:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B69CADE0;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic + 8);
  *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v1 + 64) = sub_1B699F398();
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v1 + 40) = v2;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  swift_bridgeObjectRetain();
  v4 = (id)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

}

uint64_t sub_1B69C4638()
{
  uint64_t *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;

  v1 = *v0;
  if ((*v0 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    v2 = sub_1B69CA488();
    swift_release();
    if ((v2 & 1) != 0)
    {
      v3 = sub_1B69C4824();
      swift_bridgeObjectRelease();
      return v3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
  sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
  v4 = sub_1B69CA224();
  v5 = -1 << *(_BYTE *)(v1 + 32);
  v6 = v4 & ~v5;
  if (((*(_QWORD *)(v1 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    goto LABEL_8;
  v7 = ~v5;
  sub_1B699AF44(&qword_1ED52FB98, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B50]);
  while ((sub_1B69CA230() & 1) == 0)
  {
    v6 = (v6 + 1) & v7;
    if (((*(_QWORD *)(v1 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
      goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v0;
  v11 = *v0;
  *v0 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_1B69C49D0();
    v10 = v11;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v6);
  sub_1B69C5178(v6);
  *v0 = v11;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1B69C4824()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  swift_bridgeObjectRelease();
  v1 = sub_1B69CA464();
  v2 = swift_unknownObjectRetain();
  v3 = sub_1B69C5350(v2, v1);
  v10 = v3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
  sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
  v4 = sub_1B69CA224();
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = v4 & ~v5;
  if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v7 = ~v5;
    sub_1B699AF44(&qword_1ED52FB98, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B50]);
    while ((sub_1B69CA230() & 1) == 0)
    {
      v6 = (v6 + 1) & v7;
      if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
      {
        swift_release();
        __break(1u);
        break;
      }
    }
    swift_release();
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v6);
    sub_1B69C5178(v6);
    if ((sub_1B69CA230() & 1) != 0)
    {
      *v0 = v10;
      return v8;
    }
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

void *sub_1B69C49D0()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBB0);
  v2 = *v0;
  v3 = sub_1B69CA494();
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
    result = (void *)swift_retain();
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

uint64_t sub_1B69C4B78()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBB0);
  v3 = sub_1B69CA4A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v25 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v26 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v26)
      goto LABEL_33;
    v15 = *(_QWORD *)(v25 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v26)
        goto LABEL_33;
      v15 = *(_QWORD *)(v25 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v26)
          goto LABEL_33;
        v15 = *(_QWORD *)(v25 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
    sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
    result = sub_1B69CA224();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v23 = v20 == v22;
        if (v20 == v22)
          v20 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v26)
      goto LABEL_33;
    v15 = *(_QWORD *)(v25 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1B69C4E5C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  _QWORD *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBB0);
  v3 = sub_1B69CA4A0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v28 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v27 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v27)
          goto LABEL_33;
        v15 = v28[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v27)
            goto LABEL_33;
          v15 = v28[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v27)
              goto LABEL_33;
            v15 = v28[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v27)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v28, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v28 = -1 << v26;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v28[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v10 >= v27)
                    goto LABEL_33;
                  v15 = v28[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v7 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = v2;
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
      sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
      result = sub_1B69CA224();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          v25 = *(_QWORD *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v18;
      ++*(_QWORD *)(v4 + 16);
      v2 = v17;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_1B69C5178(unint64_t result)
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
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1B69CA440();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
      do
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
        v10 = sub_1B69CA224() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 >= v9 && v2 >= v10)
          {
LABEL_16:
            v13 = *(_QWORD *)(v3 + 48);
            v14 = (_QWORD *)(v13 + 8 * v2);
            v15 = (_QWORD *)(v13 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v14 >= v15 + 1))
            {
              *v14 = *v15;
              v2 = v6;
            }
          }
        }
        else if (v10 >= v9 || v2 >= v10)
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

uint64_t sub_1B69C5350(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBB0);
    v2 = sub_1B69CA4AC();
    v14 = v2;
    sub_1B69CA458();
    for (; sub_1B69CA47C(); ++*(_QWORD *)(v2 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
      swift_dynamicCast();
      if (*(_QWORD *)(v2 + 24) <= *(_QWORD *)(v2 + 16))
      {
        sub_1B69C4E5C();
        v2 = v14;
      }
      sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
      result = sub_1B69CA224();
      v4 = v2 + 56;
      v5 = -1 << *(_BYTE *)(v2 + 32);
      v6 = result & ~v5;
      v7 = v6 >> 6;
      if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
      {
        v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v9 = 0;
        v10 = (unint64_t)(63 - v5) >> 6;
        do
        {
          if (++v7 == v10 && (v9 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          v11 = v7 == v10;
          if (v7 == v10)
            v7 = 0;
          v9 |= v11;
          v12 = *(_QWORD *)(v4 + 8 * v7);
        }
        while (v12 == -1);
        v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      }
      *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
      *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  return v2;
}

unint64_t sub_1B69C5560(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
  sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
  sub_1B69CA224();
  result = sub_1B69CA44C();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_1B69C5630(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    swift_retain();
    v8 = sub_1B69CA470();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
      swift_dynamicCast();
      *a1 = v18;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1B69CA464();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v16 = sub_1B69C5350(v7, result + 1);
    v20 = v16;
    if (*(_QWORD *)(v16 + 24) <= *(_QWORD *)(v16 + 16))
    {
      swift_retain();
      sub_1B69C4E5C();
      v17 = v20;
    }
    else
    {
      v17 = v16;
      swift_retain();
    }
    sub_1B69C5560(a2, v17);
    *v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
  sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
  v10 = sub_1B69CA224();
  v11 = -1 << *(_BYTE *)(v6 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v2;
    *v2 = 0x8000000000000000;
    v15 = swift_retain();
    sub_1B69C58F8(v15, v12, isUniquelyReferenced_nonNull_native);
    *v2 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  v13 = ~v11;
  sub_1B699AF44(&qword_1ED52FB98, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B50]);
  while ((sub_1B69CA230() & 1) == 0)
  {
    v12 = (v12 + 1) & v13;
    if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      goto LABEL_11;
  }
  swift_release();
  swift_bridgeObjectRelease();
  *a1 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v12);
  swift_retain();
  return 0;
}

uint64_t sub_1B69C58F8(uint64_t result, unint64_t a2, char a3)
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
  BOOL v13;
  uint64_t v14;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1B69C4E5C();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_1B69C49D0();
      goto LABEL_12;
    }
    sub_1B69C4B78();
  }
  v8 = *v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FBA0);
  sub_1B699AF44((unint64_t *)&unk_1ED52FB88, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B48]);
  result = sub_1B69CA224();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = ~v9;
    sub_1B699AF44(&qword_1ED52FB98, (uint64_t *)&unk_1ED52FBA0, MEMORY[0x1E0D89B50]);
    do
    {
      result = sub_1B69CA230();
      if ((result & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v10;
    }
    while (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v11 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * a2) = v5;
  v12 = *(_QWORD *)(v11 + 16);
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (!v13)
  {
    *(_QWORD *)(v11 + 16) = v14;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1B69CA710();
  __break(1u);
  return result;
}

void sub_1B69C5AA4(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v4 = sub_1B69CA134();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B69CA158();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (void *)MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    v24 = (id)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();

  }
  else
  {
    v24 = v10;
    v13 = (void *)sub_1B69CA098();
    v14 = objc_msgSend(v13, sel_fm_hexString);
    v15 = sub_1B69CA248();
    v23 = v5;
    v16 = v15;
    v18 = v17;

    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v2;
    v19[3] = v16;
    v19[4] = v18;
    aBlock[4] = sub_1B69C6200;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B6997130;
    aBlock[3] = &block_descriptor_28;
    v20 = _Block_copy(aBlock);
    v21 = v2;
    sub_1B69CA14C();
    v25 = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
    sub_1B69CA434();
    MEMORY[0x1BCC9A3EC](0, v12, v7, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v4);
    (*(void (**)(char *, id))(v9 + 8))(v12, v24);
    swift_release();
  }
}

void sub_1B69C5D5C(uint64_t a1, unint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v4 = sub_1B69CA134();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B69CA158();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (void *)MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1B69CADE0;
    v15 = *(_QWORD *)&v2[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
    v14 = *(_QWORD *)&v2[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic + 8];
    *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v13 + 64) = sub_1B699F398();
    *(_QWORD *)(v13 + 32) = v15;
    *(_QWORD *)(v13 + 40) = v14;
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    swift_bridgeObjectRetain();
    v27 = (id)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();
    swift_bridgeObjectRelease();

  }
  else
  {
    v27 = v10;
    v16 = (void *)sub_1B69CA098();
    v17 = objc_msgSend(v16, sel_fm_hexString);
    v18 = sub_1B69CA248();
    v26 = v5;
    v19 = v18;
    v21 = v20;

    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v2;
    v22[3] = v19;
    v22[4] = v21;
    aBlock[4] = sub_1B69C61F0;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B6997130;
    aBlock[3] = &block_descriptor_22;
    v23 = _Block_copy(aBlock);
    v24 = v2;
    sub_1B69CA14C();
    v28 = MEMORY[0x1E0DEE9D8];
    sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
    sub_1B699AF44((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0, MEMORY[0x1E0DEAF38]);
    sub_1B69CA434();
    MEMORY[0x1BCC9A3EC](0, v12, v7, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v4);
    (*(void (**)(char *, id))(v9 + 8))(v12, v27);
    swift_release();
  }
}

unint64_t sub_1B69C6078()
{
  unint64_t result;

  result = qword_1EF13DF68;
  if (!qword_1EF13DF68)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAPSTokenProvidingError, &type metadata for FMNAPSTokenProvidingError);
    atomic_store(result, (unint64_t *)&qword_1EF13DF68);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for FMNAPSTokenProvidingError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B69C60FC + 4 * byte_1B69CD2E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B69C611C + 4 * byte_1B69CD2E5[v4]))();
}

_BYTE *sub_1B69C60FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B69C611C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69C6124(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69C612C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B69C6134(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B69C613C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FMNAPSTokenProvidingError()
{
  return &type metadata for FMNAPSTokenProvidingError;
}

uint64_t dispatch thunk of FMNAPSTokenProviding.topicToken()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FMNAPSTokenProviding.topicToken(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for FMNPushNotificatonHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNPushNotificatonHandler.__allocating_init(topic:namedDelegatePort:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t sub_1B69C617C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B69C61A0()
{
  uint64_t v0;

  sub_1B69C34A0(*(_QWORD *)(v0 + 16));
}

void sub_1B69C61A8(id a1)
{
  if (a1 != (id)1)

}

id sub_1B69C61B8(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_1B69C61C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69C61F0()
{
  uint64_t *v0;

  return sub_1B69C42A8(v0[2], v0[3], v0[4]);
}

uint64_t sub_1B69C6200()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[4];
  v2 = (_QWORD *)(v0[2] + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_publicAPSToken);
  *v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_1B69C623C()
{
  unint64_t result;

  result = qword_1EF13DFE0;
  if (!qword_1EF13DFE0)
  {
    result = MEMORY[0x1BCC9ABA8](&protocol conformance descriptor for FMNAPSTokenProvidingError, &type metadata for FMNAPSTokenProvidingError);
    atomic_store(result, (unint64_t *)&qword_1EF13DFE0);
  }
  return result;
}

uint64_t sub_1B69C6284()
{
  return sub_1B69C3F58();
}

uint64_t objectdestroy_18Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1B69C62BC()
{
  sub_1B69C39E0();
}

uint64_t FMNMockClientURLSession.__allocating_init(httpArchiveFileURL:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  FMNMockClientURLSession.init(httpArchiveFileURL:)(a1);
  return v2;
}

uint64_t (*static FMNMockClientURLSession.mockSessionCreationBlock(httpArchiveFileURL:)(uint64_t a1))()
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_1B69CA068();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  return sub_1B69C67BC;
}

uint64_t sub_1B69C63F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v2 = sub_1B69CA068();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B69CADE0;
  v7 = sub_1B69CA020();
  v9 = v8;
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 64) = sub_1B699F398();
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v10 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  type metadata accessor for FMNMockClientURLSession();
  v11 = swift_allocObject();
  FMNMockClientURLSession.init(httpArchiveFileURL:)((uint64_t)v5);
  return v11;
}

uint64_t FMNMockClientURLSession.init(httpArchiveFileURL:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v2 = v1;
  v14[0] = a1;
  v3 = sub_1B69CA398();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v3);
  v5 = sub_1B69CA158();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1B69CA3A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_responseReadQueue;
  sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF8D8], v6);
  sub_1B69CA14C();
  v14[1] = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED530450, v4, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED530430);
  sub_1B699AF04((unint64_t *)&qword_1ED530440, (uint64_t *)&unk_1ED530430);
  sub_1B69CA434();
  *(_QWORD *)(v1 + v10) = sub_1B69CA3C8();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_urlResponseByURL) = 0;
  v11 = v1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  v12 = sub_1B69CA068();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, v14[0], v12);
  return v2;
}

uint64_t sub_1B69C675C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1B69CA068();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1B69C67BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B69CA068() - 8) + 80);
  return sub_1B69C63F4(v0 + ((v1 + 16) & ~v1));
}

uint64_t FMNMockClientURLSession.httpArchiveFileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  v4 = sub_1B69CA068();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_1B69C682C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, unint64_t, _QWORD, void *))
{
  void *v4;
  _BYTE *v5;

  sub_1B69C68AC();
  v4 = (void *)swift_allocError();
  *v5 = 3;
  a3(0, 0xF000000000000000, 0, v4);

  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3A20]), sel_init);
}

unint64_t sub_1B69C68AC()
{
  unint64_t result;

  result = qword_1EF13DFF8;
  if (!qword_1EF13DFF8)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD518, &type metadata for FMNMockClientURLSession.FMNClientError);
    atomic_store(result, (unint64_t *)&qword_1EF13DFF8);
  }
  return result;
}

id sub_1B69C68F0(uint64_t a1, void (*a2)(_QWORD, unint64_t, _QWORD, void *), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  objc_class *v24;
  char *v25;
  uint64_t (**v26)();
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(_QWORD, unint64_t, _QWORD, void *);
  objc_super v32;

  v31 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B69CA068();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v28 - v12;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v14 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  sub_1B69C9ED0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1B6997028((uint64_t)v6);
    sub_1B69C68AC();
    v15 = (void *)swift_allocError();
    *v16 = 1;
    v31(0, 0xF000000000000000, 0, v15);

    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3A00]), sel_init);
  }
  else
  {
    v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v29 = v13;
    v18(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    v19 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v20 = (v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    v21 = v30;
    v22 = swift_allocObject();
    v18((char *)(v22 + v19), v11, v7);
    *(_QWORD *)(v22 + v20) = v21;
    v23 = (_QWORD *)(v22 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8));
    *v23 = v31;
    v23[1] = a3;
    v24 = (objc_class *)type metadata accessor for MockURLDataTask();
    v25 = (char *)objc_allocWithZone(v24);
    v26 = (uint64_t (**)())&v25[OBJC_IVAR____TtC12FMNetworking15MockURLDataTask_executionBlock];
    *v26 = sub_1B69C6D74;
    v26[1] = (uint64_t (*)())v22;
    v32.receiver = v25;
    v32.super_class = v24;
    swift_retain();
    swift_retain();
    v17 = objc_msgSendSuper2(&v32, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v29, v7);
  }
  return v17;
}

uint64_t sub_1B69C6BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[2];

  v21[1] = a2;
  v7 = sub_1B69CA068();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1B69CADE0;
  v12 = sub_1B69CA020();
  v14 = v13;
  *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v11 + 64) = sub_1B699F398();
  *(_QWORD *)(v11 + 32) = v12;
  *(_QWORD *)(v11 + 40) = v14;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v15 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v16, v10, v7);
  v19 = (_QWORD *)(v18 + v17);
  *v19 = a3;
  v19[1] = a4;
  swift_retain();
  sub_1B69C71E4(a1, (uint64_t)sub_1B69C8A40, v18);
  return swift_release();
}

uint64_t sub_1B69C6D74()
{
  return sub_1B69C8814((uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD))sub_1B69C6BB4);
}

uint64_t sub_1B69C6D80(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD aBlock[7];

  v38 = a3;
  v39 = a4;
  v36 = a2;
  v42 = sub_1B69CA134();
  v45 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42);
  v41 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B69CA158();
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x1E0C80A78](v6);
  v40 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B69CA068();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v11 = sub_1B69CA140();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *a1;
  v15 = a1[1];
  v17 = a1[3];
  v34 = (void *)a1[2];
  v35 = (void *)v17;
  sub_1B6997068(0, (unint64_t *)&unk_1ED530460);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF540], v11);
  v37 = sub_1B69CA3D4();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v36, v8);
  v18 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v19 = (v10 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v18, (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v21 = (_QWORD *)(v20 + v19);
  v22 = v39;
  *v21 = v38;
  v21[1] = v22;
  v23 = (uint64_t *)(v20 + ((v19 + 23) & 0xFFFFFFFFFFFFFFF8));
  *v23 = v16;
  v23[1] = v15;
  v25 = v34;
  v24 = v35;
  v23[2] = (uint64_t)v34;
  v23[3] = (uint64_t)v24;
  aBlock[4] = sub_1B69C8B40;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_24;
  v26 = _Block_copy(aBlock);
  swift_retain();
  sub_1B69A5DE0(v16, v15);
  v27 = v25;
  v28 = v24;
  v29 = v40;
  sub_1B69CA14C();
  v46 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
  v30 = v41;
  v31 = v42;
  sub_1B69CA434();
  v32 = (void *)v37;
  MEMORY[0x1BCC9A3EC](0, v29, v30, v26);
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v45 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v29, v44);
  return swift_release();
}

uint64_t sub_1B69C70D0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1B69CADE0;
  v13 = sub_1B69CA020();
  v15 = v14;
  *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v12 + 64) = sub_1B699F398();
  *(_QWORD *)(v12 + 32) = v13;
  *(_QWORD *)(v12 + 40) = v15;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v16 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  return a2(a4, a5, a6, a7);
}

uint64_t sub_1B69C71E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v4 = v3;
  v24 = a2;
  v25 = a3;
  v6 = sub_1B69CA134();
  v29 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B69CA158();
  v27 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B69CA068();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = *(_QWORD *)(v4 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_responseReadQueue);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = (v14 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v4;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v18 + v16, v15, v12);
  v19 = (_QWORD *)(v18 + v17);
  v20 = v25;
  *v19 = v24;
  v19[1] = v20;
  aBlock[4] = sub_1B69C88C0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_12_1;
  v21 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1B69CA14C();
  v30 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v11, v8, v21);
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  return swift_release();
}

void sub_1B69C746C(uint64_t a1, uint64_t a2, void (*a3)(__int128 *), void (*a4)(__int128 *))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (**v31)(__int128 *);
  void *v32;
  uint64_t v33;
  _BYTE *v34;
  __int128 v35;
  void *v36;
  uint64_t v37;

  v8 = sub_1B69CA068();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v11 = *(_QWORD *)(a1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_urlResponseByURL);
  if (!v11)
  {
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    v27 = (void *)sub_1B69CA3E0();
    sub_1B69CA374();
    sub_1B69CA110();

    v28 = a1 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
    v29 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = a1;
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v30 + v29, (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    v31 = (void (**)(__int128 *))(v30 + ((v10 + v29 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v31 = a3;
    v31[1] = a4;
    swift_retain();
    swift_retain();
    sub_1B69C7888(v28, (uint64_t)sub_1B69C8964, v30);
    swift_release();
    return;
  }
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain();
  v12 = sub_1B69A42E0(a2);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_1B69CA368();
    sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
    v32 = (void *)sub_1B69CA3E0();
    sub_1B69CA11C();

    sub_1B69C68AC();
    v33 = swift_allocError();
    *v34 = 2;
    v35 = xmmword_1B69CD430;
    v36 = 0;
    v37 = v33;
    a3(&v35);
    sub_1B699FF80(0, 0xF000000000000000);
    v26 = (void *)v33;
    goto LABEL_8;
  }
  v14 = (uint64_t *)(*(_QWORD *)(v11 + 56) + 32 * v12);
  v15 = *v14;
  v16 = v14[1];
  v18 = (void *)v14[2];
  v17 = (void *)v14[3];
  sub_1B69A5DE0(*v14, v16);
  v19 = v18;
  v20 = v17;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1B69CADE0;
  v22 = sub_1B69CA020();
  v24 = v23;
  *(_QWORD *)(v21 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v21 + 64) = sub_1B699F398();
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 40) = v24;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v25 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  *(_QWORD *)&v35 = v15;
  *((_QWORD *)&v35 + 1) = v16;
  v36 = v18;
  v37 = (uint64_t)v17;
  a3(&v35);
  sub_1B699FF80(v15, v16);

  v26 = v17;
LABEL_8:

}

uint64_t sub_1B69C77E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;

  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v7 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  return sub_1B69C71E4(a2, a3, a4);
}

uint64_t sub_1B69C7888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v4 = v3;
  v23 = a2;
  v24 = a3;
  v26 = sub_1B69CA134();
  v29 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B69CA158();
  v27 = *(_QWORD *)(v8 - 8);
  v28 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B69CA068();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(v4 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_responseReadQueue);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v17 + v15, v14, v11);
  *(_QWORD *)(v17 + v16) = v4;
  v18 = (_QWORD *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8));
  v19 = v24;
  *v18 = v23;
  v18[1] = v19;
  aBlock[4] = sub_1B69C8808;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B6997130;
  aBlock[3] = &block_descriptor_5;
  v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1B69CA14C();
  v30 = MEMORY[0x1E0DEE9D8];
  sub_1B699AEC4((unint64_t *)&unk_1ED52FEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FEE0);
  sub_1B699AF04((unint64_t *)&qword_1ED52FEF0, (uint64_t *)&unk_1ED52FEE0);
  v21 = v26;
  sub_1B69CA434();
  MEMORY[0x1BCC9A3EC](0, v10, v7, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v21);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
  return swift_release();
}

uint64_t sub_1B69C7B1C(char *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void (*v29)(uint64_t, char *, uint64_t);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
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
  unsigned int (*v47)(uint64_t, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  id v65;
  void *v66;
  void *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  id v77;
  _QWORD *v78;
  int isUniquelyReferenced_nonNull_native;
  char v80;
  unint64_t v81;
  uint64_t v82;
  _BOOL8 v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  char v87;
  _QWORD *v88;
  uint64_t *v89;
  void *v90;
  void *v91;
  uint64_t *v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(uint64_t);
  _QWORD *v98;
  uint64_t v99;
  uint64_t result;
  _QWORD v101[2];
  uint64_t v102;
  char *v103;
  uint64_t v104;
  void (*v105)(uint64_t);
  void (*v106)(uint64_t, char *, uint64_t);
  char *v107;
  char *v108;
  _QWORD *v109;
  char *v110;
  char *v111;
  void (*v112)(char *, uint64_t, uint64_t);
  char *v113;
  char *v114;
  uint64_t v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD *v120;
  uint64_t v121;
  __int128 v122;
  _QWORD *v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;

  v104 = a4;
  v105 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  v7 = MEMORY[0x1E0C80A78](v6);
  v108 = (char *)v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v114 = (char *)v101 - v10;
  MEMORY[0x1E0C80A78](v9);
  v113 = (char *)v101 - v11;
  v12 = sub_1B69CA068();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v110 = (char *)v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v107 = (char *)v101 - v17;
  MEMORY[0x1E0C80A78](v16);
  v111 = (char *)v101 - v18;
  v19 = type metadata accessor for HAREntry();
  v120 = *(_QWORD **)(v19 - 8);
  v121 = v19;
  MEMORY[0x1E0C80A78](v19);
  v118 = (uint64_t)v101 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for FMNHTTPArchiveReader();
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)v101 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v24 = swift_allocObject();
  v122 = xmmword_1B69CADE0;
  *(_OWORD *)(v24 + 16) = xmmword_1B69CADE0;
  v25 = sub_1B69CA020();
  v27 = v26;
  *(_QWORD *)(v24 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v24 + 64) = sub_1B699F398();
  *(_QWORD *)(v24 + 32) = v25;
  *(_QWORD *)(v24 + 40) = v27;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v28 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  v117 = v13;
  v29 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 16);
  v119 = v12;
  v106 = v29;
  v29((uint64_t)v23, a1, v12);
  v103 = v23;
  v30 = sub_1B69ADF30();
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = v122;
  v32 = v30[2];
  v33 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v31 + 56) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v31 + 64) = v33;
  *(_QWORD *)(v31 + 32) = v32;
  v34 = (void *)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();
  swift_bridgeObjectRelease();

  v35 = v30[2];
  if (!v35)
  {
    swift_bridgeObjectRelease();
    v98 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    v97 = v105;
LABEL_32:
    *(_QWORD *)(a2 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_urlResponseByURL) = v98;
    v99 = swift_bridgeObjectRelease();
    v97(v99);
    return sub_1B699F3DC((uint64_t)v103, (uint64_t (*)(_QWORD))type metadata accessor for FMNHTTPArchiveReader);
  }
  v102 = a2;
  v36 = (*((unsigned __int8 *)v120 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v120 + 80);
  v101[1] = v30;
  v37 = (uint64_t)v30 + v36;
  v109 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v115 = v120[9];
  v38 = (uint64_t)v114;
  v39 = (uint64_t)v113;
  v40 = v119;
  v41 = v117;
  v42 = v118;
  while (1)
  {
    sub_1B69AF8E8(v37, v42);
    v43 = v42 + *(int *)(v121 + 24);
    if (*(_QWORD *)(v43 + 56))
    {
      v44 = qword_1EF13D5E8;
      swift_bridgeObjectRetain();
      if (v44 != -1)
        swift_once();
      v45 = sub_1B69CA278();
      __swift_project_value_buffer(v45, (uint64_t)qword_1EF141DE8);
      v120 = (_QWORD *)sub_1B69CA254();
      *(_QWORD *)&v122 = v46;
      swift_bridgeObjectRelease();
      v42 = v118;
    }
    else
    {
      v120 = 0;
      *(_QWORD *)&v122 = 0xF000000000000000;
    }
    sub_1B69CA05C();
    v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48);
    if (v47(v39, 1, v40) == 1)
    {
      sub_1B6997028(v39);
LABEL_4:
      v41 = v117;
      v40 = v119;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v117 + 56))(v38, 1, 1, v119);
      sub_1B699FF80((uint64_t)v120, v122);
LABEL_5:

      sub_1B699F3DC(v42, (uint64_t (*)(_QWORD))type metadata accessor for HAREntry);
      sub_1B6997028(v38);
      goto LABEL_6;
    }
    v48 = v111;
    v112 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 32);
    v112(v111, v39, v40);
    v49 = *(_QWORD *)(v43 + 16);
    v50 = *(_QWORD *)(v43 + 24);
    v51 = *(_QWORD *)(v43 + 112);
    v116 = *(_OWORD *)v43;
    v124 = v116;
    v125 = v49;
    v126 = v50;
    v52 = *(_OWORD *)(v43 + 48);
    v127 = *(_OWORD *)(v43 + 32);
    v128 = v52;
    v53 = *(_OWORD *)(v43 + 80);
    v129 = *(_OWORD *)(v43 + 64);
    v130 = v53;
    v131 = *(_OWORD *)(v43 + 96);
    v132 = v51;
    swift_bridgeObjectRetain();
    sub_1B69AE270();
    v54 = objc_allocWithZone(MEMORY[0x1E0CB3680]);
    v55 = (void *)sub_1B69CA038();
    v56 = v41;
    v57 = (void *)sub_1B69CA23C();
    swift_bridgeObjectRelease();
    v58 = (void *)sub_1B69CA200();
    swift_bridgeObjectRelease();
    v59 = v54;
    v39 = (uint64_t)v113;
    v38 = (uint64_t)v114;
    v60 = objc_msgSend(v59, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v55, (_QWORD)v116, v57, v58);
    *(_QWORD *)&v116 = v35;
    v61 = v60;

    v62 = v61;
    v35 = v116;
    v63 = *(void (**)(char *, uint64_t))(v56 + 8);
    v64 = v48;
    v42 = v118;
    v63(v64, v119);
    if (!v62)
      goto LABEL_4;
    v65 = objc_msgSend(v62, sel_URL);
    if (v65)
    {
      v66 = v65;
      v67 = v62;
      v68 = v108;
      sub_1B69CA044();

      v69 = (uint64_t)v68;
      v62 = v67;
      v70 = 0;
    }
    else
    {
      v70 = 1;
      v69 = (uint64_t)v108;
    }
    v71 = (uint64_t)v120;
    v72 = v119;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v117 + 56))(v69, v70, 1, v119);
    sub_1B69C8874(v69, v38);
    if (v47(v38, 1, v72) == 1)
    {
      sub_1B699FF80(v71, v122);

      v40 = v72;
      v41 = v117;
      v42 = v118;
      goto LABEL_5;
    }
    v73 = v107;
    v112(v107, v38, v72);
    v74 = (uint64_t)v110;
    v106((uint64_t)v110, v73, v72);
    v75 = v122;
    sub_1B69A5DE0(v71, v122);
    v76 = (uint64_t)v62;
    v120 = v62;
    v77 = 0;
    v78 = v109;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v123 = v78;
    v81 = sub_1B69A42E0(v74);
    v82 = v78[2];
    v83 = (v80 & 1) == 0;
    v84 = v82 + v83;
    if (__OFADD__(v82, v83))
      break;
    v85 = v80;
    if (v78[3] >= v84)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_1B69A525C();
    }
    else
    {
      sub_1B69A4668(v84, isUniquelyReferenced_nonNull_native);
      v86 = sub_1B69A42E0((uint64_t)v110);
      if ((v85 & 1) != (v87 & 1))
        goto LABEL_35;
      v81 = v86;
    }
    v88 = v123;
    v109 = v123;
    if ((v85 & 1) != 0)
    {
      v89 = (uint64_t *)(v123[7] + 32 * v81);
      v91 = (void *)v89[2];
      v90 = (void *)v89[3];
      sub_1B699FF80(*v89, v89[1]);

      v75 = v122;
      *v89 = v71;
      v89[1] = v75;
      v89[2] = v76;
      v89[3] = 0;
    }
    else
    {
      v123[(v81 >> 6) + 8] |= 1 << v81;
      v106(v88[6] + *(_QWORD *)(v117 + 72) * v81, v110, v119);
      v92 = (uint64_t *)(v88[7] + 32 * v81);
      *v92 = v71;
      v92[1] = v75;
      v92[2] = v76;
      v92[3] = 0;
      v93 = v88[2];
      v94 = __OFADD__(v93, 1);
      v95 = v93 + 1;
      if (v94)
        goto LABEL_34;
      v88[2] = v95;
    }
    v96 = v71;
    swift_bridgeObjectRelease();
    v40 = v119;
    v63(v110, v119);
    sub_1B699FF80(v96, v75);

    v63(v107, v40);
    v42 = v118;
    sub_1B699F3DC(v118, (uint64_t (*)(_QWORD))type metadata accessor for HAREntry);
    v38 = (uint64_t)v114;
    v39 = (uint64_t)v113;
    v41 = v117;
    v35 = v116;
LABEL_6:
    v37 += v115;
    if (!--v35)
    {
      swift_bridgeObjectRelease();
      v97 = v105;
      a2 = v102;
      v98 = v109;
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  result = sub_1B69CA71C();
  __break(1u);
  return result;
}

uint64_t FMNMockClientURLSession.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  v2 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FMNMockClientURLSession.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12FMNetworking23FMNMockClientURLSession_httpArchiveFileURL;
  v2 = sub_1B69CA068();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_1B69C85D0(uint64_t a1, void (*a2)(_QWORD, unint64_t, _QWORD, void *), uint64_t a3)
{
  return sub_1B69C68F0(a1, a2, a3);
}

uint64_t sub_1B69C85F0()
{
  return type metadata accessor for FMNMockClientURLSession();
}

uint64_t type metadata accessor for FMNMockClientURLSession()
{
  uint64_t result;

  result = qword_1EF13E028;
  if (!qword_1EF13E028)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B69C8634()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B69CA068();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FMNMockClientURLSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNMockClientURLSession.__allocating_init(httpArchiveFileURL:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FMNMockClientURLSession.uploadTask(with:fromFile:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of FMNMockClientURLSession.dataTask(with:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of FMNMockClientURLSession.finishTasksAndInvalidate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t storeEnumTagSinglePayload for FMNMockClientURLSession.FMNClientError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B69C873C + 4 * byte_1B69CD445[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B69C8770 + 4 * byte_1B69CD440[v4]))();
}

uint64_t sub_1B69C8770(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C8778(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B69C8780);
  return result;
}

uint64_t sub_1B69C878C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B69C8794);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B69C8798(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B69C87A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FMNMockClientURLSession.FMNClientError()
{
  return &type metadata for FMNMockClientURLSession.FMNClientError;
}

unint64_t sub_1B69C87C0()
{
  unint64_t result;

  result = qword_1EF13E108;
  if (!qword_1EF13E108)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CD4F0, &type metadata for FMNMockClientURLSession.FMNClientError);
    atomic_store(result, (unint64_t *)&qword_1EF13E108);
  }
  return result;
}

uint64_t sub_1B69C8808()
{
  return sub_1B69C8814((uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD))sub_1B69C7B1C);
}

uint64_t sub_1B69C8814(uint64_t (*a1)(unint64_t, _QWORD, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(sub_1B69CA068() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a1(v1 + v3, *(_QWORD *)(v1 + v4), *(_QWORD *)(v1 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_1B69C8874(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B69C88C0()
{
  return sub_1B69C8970((uint64_t (*)(_QWORD, unint64_t, _QWORD, _QWORD))sub_1B69C746C);
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1B69CA068();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69C8964()
{
  return sub_1B69C8970((uint64_t (*)(_QWORD, unint64_t, _QWORD, _QWORD))sub_1B69C77E4);
}

uint64_t sub_1B69C8970(uint64_t (*a1)(_QWORD, unint64_t, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(sub_1B69CA068() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (_QWORD *)(v1 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a1(*(_QWORD *)(v1 + 16), v1 + v3, *v4, v4[1]);
}

uint64_t sub_1B69C89C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1B69CA068();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B69C8A40(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_QWORD *)(sub_1B69CA068() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (uint64_t *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1B69C6D80(a1, v1 + v4, *v5, v5[1]);
}

uint64_t sub_1B69C8A94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = sub_1B69CA068();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  v5 = v0 + v4;
  v6 = *(_QWORD *)(v0 + v4 + 8);
  if (v6 >> 60 != 15)
    sub_1B699DB18(*(_QWORD *)v5, v6);

  return swift_deallocObject();
}

uint64_t sub_1B69C8B40()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_1B69CA068() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1B69C70D0(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 16), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 24));
}

uint64_t FMNHTTPArchiveWriter.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t FMNHTTPArchiveWriter.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1B69C8BC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void **v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  _QWORD *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  __int128 v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  _QWORD *v83;
  __int128 v84;
  uint64_t v85;
  unint64_t v86;
  __int128 v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;

  v2 = v1;
  v71 = sub_1B69CA278();
  v70 = *(_QWORD *)(v71 - 8);
  MEMORY[0x1E0C80A78](v71);
  v69 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v61 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13E110);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = type metadata accessor for HAREntry();
  v14 = *(_QWORD *)(v91 - 8);
  v15 = MEMORY[0x1E0C80A78](v91);
  v79 = (uint64_t)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v72 = (uint64_t)&v61 - v17;
  v18 = sub_1B69C9F54();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = *(_QWORD *)(a1 + 16);
  v22 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v66 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v21)
  {
    v58 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_29;
  }
  v62 = v19;
  v63 = v18;
  v81 = v10;
  v65 = v2;
  v68 = *MEMORY[0x1E0C930E8];
  swift_bridgeObjectRetain();
  v64 = a1;
  v23 = (void **)(a1 + 48);
  v67 = xmmword_1B69CD560;
  v82 = v8;
  v83 = v22;
  v80 = v14;
  v77 = v13;
  do
  {
    v24 = *v23;
    if (!*v23)
      goto LABEL_4;
    v84 = *(_OWORD *)v23;
    v26 = (uint64_t)*(v23 - 2);
    v25 = (unint64_t)*(v23 - 1);
    v27 = objc_msgSend(v24, sel_URL);
    if (v27)
    {
      v28 = v27;
      sub_1B69CA044();

      v29 = sub_1B69CA068();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v8, 0, 1, v29);
    }
    else
    {
      v29 = sub_1B69CA068();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v8, 1, 1, v29);
    }
    v30 = (uint64_t)v81;
    sub_1B69C8874((uint64_t)v8, (uint64_t)v81);
    sub_1B69CA068();
    v31 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v30, 1, v29) == 1)
    {
      sub_1B6999FB0(v30, (uint64_t *)&unk_1ED52FC08);
      v8 = v82;
      v14 = v80;
LABEL_4:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, 1, 1, v91);
LABEL_5:
      sub_1B6999FB0((uint64_t)v13, &qword_1EF13E110);
      goto LABEL_6;
    }
    v78 = sub_1B69CA020();
    v33 = v32;
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v29);
    v34 = objc_msgSend(v24, sel_statusCode);
    if (v25 >> 60 == 15)
    {
      v14 = v80;
      v35 = v77;
      v36 = v91;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v80 + 56))(v77, 1, 1, v91);
      v13 = v35;
      swift_bridgeObjectRelease();
      v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v35, 1, v36);
      v8 = v82;
      if (v37 == 1)
        goto LABEL_5;
    }
    else
    {
      v76 = v34;
      v75 = sub_1B69CA248();
      v39 = v38;
      sub_1B699D90C(v26, v25);
      if (qword_1EF13D5E8 != -1)
        swift_once();
      v40 = v71;
      v41 = __swift_project_value_buffer(v71, (uint64_t)qword_1EF141DE8);
      (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v69, v41, v40);
      v42 = sub_1B69CA260();
      v44 = v43;
      v74 = v42;
      if (v43)
      {
        v85 = v42;
        v86 = v43;
        sub_1B699FF3C();
        swift_bridgeObjectRetain();
        v73 = sub_1B69CA404();
        swift_bridgeObjectRelease();
      }
      else
      {
        v73 = -1;
      }
      v85 = v26;
      v86 = v25;
      v87 = v84;
      swift_bridgeObjectRetain();
      v45 = sub_1B69C99D0();
      v46 = v77;
      sub_1B69CA0C8();
      sub_1B699FF80(v26, v25);
      v47 = v91;
      v48 = &v46[*(int *)(v91 + 20)];
      *(_QWORD *)v48 = 1414745936;
      v49 = v78;
      *((_QWORD *)v48 + 1) = 0xE400000000000000;
      *((_QWORD *)v48 + 2) = v49;
      *((_QWORD *)v48 + 3) = v33;
      v13 = v46;
      v50 = v75;
      *((_QWORD *)v48 + 4) = v75;
      *((_QWORD *)v48 + 5) = v39;
      v51 = MEMORY[0x1E0DEE9D8];
      *((_QWORD *)v48 + 6) = MEMORY[0x1E0DEE9D8];
      *((_QWORD *)v48 + 7) = v51;
      *((_QWORD *)v48 + 8) = v51;
      *((_QWORD *)v48 + 9) = -1;
      *((_QWORD *)v48 + 11) = 0;
      *((_QWORD *)v48 + 12) = 0;
      *((_QWORD *)v48 + 10) = -1;
      v52 = &v46[*(int *)(v47 + 24)];
      *(_QWORD *)v52 = v76;
      *((_QWORD *)v52 + 1) = 0;
      *((_QWORD *)v52 + 2) = 0xE000000000000000;
      *((_QWORD *)v52 + 3) = v50;
      *((_QWORD *)v52 + 4) = v39;
      *((_QWORD *)v52 + 5) = v45;
      *((_QWORD *)v52 + 6) = v74;
      *((_QWORD *)v52 + 7) = v44;
      *((_QWORD *)v52 + 8) = 0;
      *((_QWORD *)v52 + 9) = 0;
      *((_QWORD *)v52 + 11) = 0;
      *((_QWORD *)v52 + 12) = 0;
      *((_QWORD *)v52 + 10) = v73;
      *(_OWORD *)(v52 + 104) = v67;
      v14 = v80;
      (*(void (**)(char *, _QWORD, uint64_t))(v80 + 56))(v46, 0, 1);
      v8 = v82;
    }
    v53 = v72;
    sub_1B69AF968((uint64_t)v13, v72);
    sub_1B69AF968(v53, v79);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v54 = v83;
    else
      v54 = (_QWORD *)sub_1B69A5738(0, v83[2] + 1, 1, v83);
    v56 = v54[2];
    v55 = v54[3];
    if (v56 >= v55 >> 1)
      v54 = (_QWORD *)sub_1B69A5738(v55 > 1, v56 + 1, 1, v54);
    v54[2] = v56 + 1;
    v57 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v83 = v54;
    sub_1B69AF968(v79, (uint64_t)v54 + v57 + *(_QWORD *)(v14 + 72) * v56);
LABEL_6:
    v23 += 4;
    --v21;
  }
  while (v21);
  swift_bridgeObjectRelease();
  v18 = v63;
  v19 = v62;
  v58 = v83;
LABEL_29:
  sub_1B69C9F84();
  swift_allocObject();
  sub_1B69C9F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v66, *MEMORY[0x1E0CAE150], v18);
  sub_1B69C9F60();
  v85 = 3288625;
  v86 = 0xE300000000000000;
  *(_QWORD *)&v87 = v58;
  *((_QWORD *)&v87 + 1) = 0xD000000000000010;
  v88 = 0x80000001B69CEF80;
  v89 = 3157553;
  v90 = 0xE300000000000000;
  sub_1B69C9304();
  v59 = sub_1B69C9F6C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
  return v59;
}

unint64_t sub_1B69C9304()
{
  unint64_t result;

  result = qword_1EF13E118;
  if (!qword_1EF13E118)
  {
    result = MEMORY[0x1BCC9ABA8](&unk_1B69CC698, &type metadata for HARv1dot2);
    atomic_store(result, (unint64_t *)&qword_1EF13E118);
  }
  return result;
}

uint64_t sub_1B69C9348(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void **v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  _QWORD v56[2];
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  _QWORD *v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  __int128 v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;

  v60 = sub_1B69CA278();
  v62 = *(_QWORD *)(v60 - 8);
  MEMORY[0x1E0C80A78](v60);
  v61 = (char *)v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED52FC08);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v56 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF13E110);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = type metadata accessor for HAREntry();
  v14 = *(_QWORD *)(v74 - 8);
  v15 = MEMORY[0x1E0C80A78](v74);
  v68 = (uint64_t)v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v63 = (uint64_t)v56 - v17;
  v18 = *(_QWORD *)(a1 + 16);
  if (!v18)
  {
    v54 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_29;
  }
  v70 = v10;
  v56[1] = a2;
  v19 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v58 = *MEMORY[0x1E0C930E8];
  swift_bridgeObjectRetain();
  v56[0] = a1;
  v20 = (void **)(a1 + 48);
  v57 = xmmword_1B69CD560;
  v71 = v8;
  v72 = v19;
  v69 = v14;
  do
  {
    v21 = *v20;
    if (!*v20)
      goto LABEL_4;
    v73 = *(_OWORD *)v20;
    v22 = (uint64_t)*(v20 - 2);
    v23 = (unint64_t)*(v20 - 1);
    v24 = objc_msgSend(v21, sel_URL, v56[0]);
    if (v24)
    {
      v25 = v24;
      sub_1B69CA044();

      v26 = sub_1B69CA068();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v8, 0, 1, v26);
    }
    else
    {
      v26 = sub_1B69CA068();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v8, 1, 1, v26);
    }
    v27 = (uint64_t)v70;
    sub_1B69C8874((uint64_t)v8, (uint64_t)v70);
    sub_1B69CA068();
    v28 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v27, 1, v26) == 1)
    {
      sub_1B6999FB0(v27, (uint64_t *)&unk_1ED52FC08);
      v8 = v71;
      v14 = v69;
LABEL_4:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, 1, 1, v74);
LABEL_5:
      sub_1B6999FB0((uint64_t)v13, &qword_1EF13E110);
      goto LABEL_6;
    }
    v67 = sub_1B69CA020();
    v30 = v29;
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v26);
    v31 = objc_msgSend(v21, sel_statusCode);
    if (v23 >> 60 == 15)
    {
      v14 = v69;
      v32 = v74;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56))(v13, 1, 1, v74);
      swift_bridgeObjectRelease();
      v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v32);
      v8 = v71;
      if (v33 == 1)
        goto LABEL_5;
    }
    else
    {
      v65 = v30;
      v66 = v31;
      v34 = sub_1B69CA248();
      v36 = v35;
      sub_1B699D90C(v22, v23);
      if (qword_1EF13D5E8 != -1)
        swift_once();
      v37 = v60;
      v38 = __swift_project_value_buffer(v60, (uint64_t)qword_1EF141DE8);
      (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v38, v37);
      v39 = sub_1B69CA260();
      v41 = v40;
      v64 = v39;
      if (v40)
      {
        v75 = v39;
        v76 = v40;
        sub_1B699FF3C();
        v59 = v22;
        swift_bridgeObjectRetain();
        v22 = v59;
        v42 = sub_1B69CA404();
        swift_bridgeObjectRelease();
      }
      else
      {
        v42 = -1;
      }
      v75 = v22;
      v76 = v23;
      v77 = v73;
      swift_bridgeObjectRetain();
      v43 = sub_1B69C99D0();
      sub_1B69CA0C8();
      sub_1B699FF80(v22, v23);
      v44 = v74;
      v45 = &v13[*(int *)(v74 + 20)];
      *(_QWORD *)v45 = 1414745936;
      v46 = v67;
      *((_QWORD *)v45 + 1) = 0xE400000000000000;
      *((_QWORD *)v45 + 2) = v46;
      *((_QWORD *)v45 + 3) = v65;
      *((_QWORD *)v45 + 4) = v34;
      *((_QWORD *)v45 + 5) = v36;
      v47 = MEMORY[0x1E0DEE9D8];
      *((_QWORD *)v45 + 6) = MEMORY[0x1E0DEE9D8];
      *((_QWORD *)v45 + 7) = v47;
      *((_QWORD *)v45 + 8) = v47;
      *((_QWORD *)v45 + 9) = -1;
      *((_QWORD *)v45 + 11) = 0;
      *((_QWORD *)v45 + 12) = 0;
      *((_QWORD *)v45 + 10) = -1;
      v48 = &v13[*(int *)(v44 + 24)];
      *(_QWORD *)v48 = v66;
      *((_QWORD *)v48 + 1) = 0;
      *((_QWORD *)v48 + 2) = 0xE000000000000000;
      *((_QWORD *)v48 + 3) = v34;
      *((_QWORD *)v48 + 4) = v36;
      *((_QWORD *)v48 + 5) = v43;
      *((_QWORD *)v48 + 6) = v64;
      *((_QWORD *)v48 + 7) = v41;
      *((_QWORD *)v48 + 8) = 0;
      *((_QWORD *)v48 + 9) = 0;
      *((_QWORD *)v48 + 11) = 0;
      *((_QWORD *)v48 + 12) = 0;
      *((_QWORD *)v48 + 10) = v42;
      *(_OWORD *)(v48 + 104) = v57;
      v14 = v69;
      (*(void (**)(char *, _QWORD, uint64_t))(v69 + 56))(v13, 0, 1);
      v8 = v71;
    }
    v49 = v63;
    sub_1B69AF968((uint64_t)v13, v63);
    sub_1B69AF968(v49, v68);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v50 = v72;
    else
      v50 = (_QWORD *)sub_1B69A5738(0, v72[2] + 1, 1, v72);
    v52 = v50[2];
    v51 = v50[3];
    if (v52 >= v51 >> 1)
      v50 = (_QWORD *)sub_1B69A5738(v51 > 1, v52 + 1, 1, v50);
    v50[2] = v52 + 1;
    v53 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v72 = v50;
    sub_1B69AF968(v68, (uint64_t)v50 + v53 + *(_QWORD *)(v14 + 72) * v52);
LABEL_6:
    v20 += 4;
    --v18;
  }
  while (v18);
  swift_bridgeObjectRelease();
  v54 = v72;
LABEL_29:
  v75 = 3288625;
  v76 = 0xE300000000000000;
  *(_QWORD *)&v77 = v54;
  *((_QWORD *)&v77 + 1) = 0xD000000000000010;
  v78 = 0x80000001B69CEF80;
  v79 = 3157553;
  v80 = 0xE300000000000000;
  sub_1B69C9C44((uint64_t)&v75);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease_n();
}

uint64_t FMNHTTPArchiveWriter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FMNHTTPArchiveWriter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B69C99D0()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;

  v1 = *(void **)(v0 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  v2 = objc_msgSend(v1, sel_allHeaderFields);
  v3 = sub_1B69CA20C();

  v4 = sub_1B699B824(v3);
  result = swift_bridgeObjectRelease();
  if (!v4)
    return MEMORY[0x1E0DEE9D8];
  v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  v27 = v4 + 64;
  v8 = 1 << *(_BYTE *)(v4 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v11 = MEMORY[0x1E0DEE9D8];
  if ((v9 & v7) == 0)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v12 | (v6 << 6); ; i = __clz(__rbit64(v15)) + (v6 << 6))
  {
    v17 = 16 * i;
    v18 = (uint64_t *)(*(_QWORD *)(v4 + 48) + v17);
    v20 = *v18;
    v19 = v18[1];
    v21 = (uint64_t *)(*(_QWORD *)(v4 + 56) + v17);
    v23 = *v21;
    v22 = v21[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1B69A58AC(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
      v11 = result;
    }
    v25 = *(_QWORD *)(v11 + 16);
    v24 = *(_QWORD *)(v11 + 24);
    if (v25 >= v24 >> 1)
    {
      result = (uint64_t)sub_1B69A58AC((char *)(v24 > 1), v25 + 1, 1, (char *)v11);
      v11 = result;
    }
    *(_QWORD *)(v11 + 16) = v25 + 1;
    v26 = (_QWORD *)(v11 + 32 * v25);
    v26[4] = v20;
    v26[5] = v19;
    v26[6] = v23;
    v26[7] = v22;
    if (v10)
      goto LABEL_6;
LABEL_7:
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v14 >= v28)
      goto LABEL_28;
    v15 = *(_QWORD *)(v27 + 8 * v14);
    ++v6;
    if (!v15)
    {
      v6 = v14 + 1;
      if (v14 + 1 >= v28)
        goto LABEL_28;
      v15 = *(_QWORD *)(v27 + 8 * v6);
      if (!v15)
      {
        v6 = v14 + 2;
        if (v14 + 2 >= v28)
          goto LABEL_28;
        v15 = *(_QWORD *)(v27 + 8 * v6);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v10 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v28)
  {
LABEL_28:
    swift_release();
    return v11;
  }
  v15 = *(_QWORD *)(v27 + 8 * v16);
  if (v15)
  {
    v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v28)
      goto LABEL_28;
    v15 = *(_QWORD *)(v27 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1B69C9C44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _OWORD v11[4];
  uint64_t v12;

  v2 = sub_1B69C9F54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B69C9F84();
  swift_allocObject();
  sub_1B69C9F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAE150], v2);
  sub_1B69C9F60();
  v6 = *(_OWORD *)(a1 + 16);
  v11[1] = *(_OWORD *)a1;
  v11[2] = v6;
  v11[3] = *(_OWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 48);
  sub_1B69C9304();
  v7 = sub_1B69C9F6C();
  v9 = v8;
  swift_release();
  sub_1B69CA074();
  return sub_1B699DB18(v7, v9);
}

uint64_t type metadata accessor for FMNHTTPArchiveWriter()
{
  return objc_opt_self();
}

uint64_t method lookup function for FMNHTTPArchiveWriter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FMNHTTPArchiveWriter.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of FMNHTTPArchiveWriter.encodeResponses(mockResponses:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of FMNHTTPArchiveWriter.saveResponses(mockResponses:fileURL:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_1B69C9EA0()
{
  return MEMORY[0x1E0CADEB0]();
}

uint64_t sub_1B69C9EAC()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1B69C9EB8()
{
  return MEMORY[0x1E0CADEF0]();
}

uint64_t sub_1B69C9EC4()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1B69C9ED0()
{
  return MEMORY[0x1E0CADF18]();
}

uint64_t sub_1B69C9EDC()
{
  return MEMORY[0x1E0CADF28]();
}

uint64_t sub_1B69C9EE8()
{
  return MEMORY[0x1E0CADF38]();
}

uint64_t sub_1B69C9EF4()
{
  return MEMORY[0x1E0CADF40]();
}

uint64_t sub_1B69C9F00()
{
  return MEMORY[0x1E0CADF48]();
}

uint64_t sub_1B69C9F0C()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1B69C9F18()
{
  return MEMORY[0x1E0CAE048]();
}

uint64_t sub_1B69C9F24()
{
  return MEMORY[0x1E0CAE060]();
}

uint64_t sub_1B69C9F30()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1B69C9F3C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1B69C9F48()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1B69C9F54()
{
  return MEMORY[0x1E0CAE160]();
}

uint64_t sub_1B69C9F60()
{
  return MEMORY[0x1E0CAE178]();
}

uint64_t sub_1B69C9F6C()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1B69C9F78()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1B69C9F84()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1B69C9F90()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1B69C9F9C()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1B69C9FA8()
{
  return MEMORY[0x1E0CAE7E0]();
}

uint64_t sub_1B69C9FB4()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1B69C9FC0()
{
  return MEMORY[0x1E0CAE800]();
}

uint64_t sub_1B69C9FCC()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_1B69C9FD8()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1B69C9FE4()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1B69C9FF0()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1B69C9FFC()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1B69CA008()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B69CA014()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_1B69CA020()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1B69CA02C()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1B69CA038()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B69CA044()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B69CA050()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1B69CA05C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1B69CA068()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B69CA074()
{
  return MEMORY[0x1E0D21290]();
}

uint64_t sub_1B69CA080()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1B69CA08C()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1B69CA098()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B69CA0A4()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1B69CA0B0()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B69CA0BC()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1B69CA0C8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1B69CA0D4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B69CA0E0()
{
  return MEMORY[0x1E0D212A0]();
}

uint64_t sub_1B69CA0EC()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1B69CA0F8()
{
  return MEMORY[0x1E0CB0970]();
}

uint64_t sub_1B69CA104()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B69CA110()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1B69CA11C()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1B69CA128()
{
  return MEMORY[0x1E0D212A8]();
}

uint64_t sub_1B69CA134()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B69CA140()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1B69CA14C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B69CA158()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B69CA164()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1B69CA170()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1B69CA17C()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1B69CA188()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1B69CA194()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1B69CA1A0()
{
  return MEMORY[0x1E0D89AF0]();
}

uint64_t sub_1B69CA1AC()
{
  return MEMORY[0x1E0D89AF8]();
}

uint64_t sub_1B69CA1B8()
{
  return MEMORY[0x1E0D89B10]();
}

uint64_t sub_1B69CA1C4()
{
  return MEMORY[0x1E0D89B18]();
}

uint64_t sub_1B69CA1D0()
{
  return MEMORY[0x1E0D89B20]();
}

uint64_t sub_1B69CA1DC()
{
  return MEMORY[0x1E0D89B28]();
}

uint64_t sub_1B69CA1E8()
{
  return MEMORY[0x1E0D89B30]();
}

uint64_t sub_1B69CA1F4()
{
  return MEMORY[0x1E0D89B38]();
}

uint64_t sub_1B69CA200()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B69CA20C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B69CA218()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1B69CA224()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B69CA230()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B69CA23C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B69CA248()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B69CA254()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1B69CA260()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1B69CA26C()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1B69CA278()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1B69CA284()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B69CA290()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1B69CA29C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B69CA2A8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B69CA2B4()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1B69CA2C0()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1B69CA2CC()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1B69CA2D8()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1B69CA2E4()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1B69CA2F0()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1B69CA2FC()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1B69CA308()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1B69CA314()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1B69CA320()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B69CA32C()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1B69CA338()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1B69CA344()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1B69CA350()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B69CA35C()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1B69CA368()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B69CA374()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B69CA380()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1B69CA38C()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1B69CA398()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B69CA3A4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B69CA3B0()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1B69CA3BC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B69CA3C8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B69CA3D4()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1B69CA3E0()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1B69CA3EC()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1B69CA3F8()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B69CA404()
{
  return MEMORY[0x1E0CB2440]();
}

uint64_t sub_1B69CA410()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1B69CA41C()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1B69CA428()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B69CA434()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B69CA440()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B69CA44C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B69CA458()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B69CA464()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B69CA470()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B69CA47C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B69CA488()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1B69CA494()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B69CA4A0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B69CA4AC()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B69CA4B8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B69CA4C4()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1B69CA4D0()
{
  return MEMORY[0x1E0DEC4B8]();
}

uint64_t sub_1B69CA4DC()
{
  return MEMORY[0x1E0DEC4E0]();
}

uint64_t sub_1B69CA4E8()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B69CA4F4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B69CA500()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B69CA50C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B69CA518()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B69CA524()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1B69CA530()
{
  return MEMORY[0x1E0DECF30]();
}

uint64_t sub_1B69CA53C()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1B69CA548()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1B69CA554()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B69CA560()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1B69CA56C()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1B69CA578()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1B69CA584()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B69CA590()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1B69CA59C()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1B69CA5A8()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1B69CA5B4()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B69CA5C0()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1B69CA5CC()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B69CA5D8()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B69CA5E4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B69CA5F0()
{
  return MEMORY[0x1E0DED220]();
}

uint64_t sub_1B69CA5FC()
{
  return MEMORY[0x1E0DED260]();
}

uint64_t sub_1B69CA608()
{
  return MEMORY[0x1E0DED268]();
}

uint64_t sub_1B69CA614()
{
  return MEMORY[0x1E0DED270]();
}

uint64_t sub_1B69CA620()
{
  return MEMORY[0x1E0DED2B8]();
}

uint64_t sub_1B69CA62C()
{
  return MEMORY[0x1E0DED368]();
}

uint64_t sub_1B69CA638()
{
  return MEMORY[0x1E0DED378]();
}

uint64_t sub_1B69CA644()
{
  return MEMORY[0x1E0DED3A0]();
}

uint64_t sub_1B69CA650()
{
  return MEMORY[0x1E0DED3A8]();
}

uint64_t sub_1B69CA65C()
{
  return MEMORY[0x1E0DED3B0]();
}

uint64_t sub_1B69CA668()
{
  return MEMORY[0x1E0DED3C0]();
}

uint64_t sub_1B69CA674()
{
  return MEMORY[0x1E0DED3F8]();
}

uint64_t sub_1B69CA680()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1B69CA68C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B69CA698()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1B69CA6A4()
{
  return MEMORY[0x1E0DED878]();
}

uint64_t sub_1B69CA6B0()
{
  return MEMORY[0x1E0DED880]();
}

uint64_t sub_1B69CA6BC()
{
  return MEMORY[0x1E0DED888]();
}

uint64_t sub_1B69CA6C8()
{
  return MEMORY[0x1E0DED8A0]();
}

uint64_t sub_1B69CA6D4()
{
  return MEMORY[0x1E0DED8A8]();
}

uint64_t sub_1B69CA6E0()
{
  return MEMORY[0x1E0DED8B0]();
}

uint64_t sub_1B69CA6EC()
{
  return MEMORY[0x1E0DED8B8]();
}

uint64_t sub_1B69CA6F8()
{
  return MEMORY[0x1E0DED8C8]();
}

uint64_t sub_1B69CA704()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1B69CA710()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B69CA71C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B69CA728()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1B69CA734()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B69CA740()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B69CA74C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B69CA758()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B69CA764()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B69CA770()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B69CA77C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B69CA788()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B69CA794()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1B69CA7A0()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B69CA7AC()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B69CA7B8()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t sub_1B69CA7C4()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B69CA7D0()
{
  return MEMORY[0x1E0DEE8E8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1E0DEEF88]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1E0DEEF90]();
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

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1E0DEEFB0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1E0DEEFB8]();
}

