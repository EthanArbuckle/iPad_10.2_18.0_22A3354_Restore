unint64_t static SignedClinicalDataWalletPassIdentifier.passTypeIdentifierVHR.getter()
{
  return 0xD00000000000003CLL;
}

uint64_t SignedClinicalDataWalletPassIdentifier.passTypeIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SignedClinicalDataWalletPassIdentifier.serialNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecordSyncIdentifier:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  sub_227C09148();
  sub_227C09208();
  swift_bridgeObjectRelease();
  v4 = sub_227C09160();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  *a2 = 0xD00000000000003CLL;
  a2[1] = 0x8000000227C0A380;
  a2[2] = 762472566;
  a2[3] = 0xE400000000000000;
  return result;
}

void SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  _QWORD *v21;
  _OWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;

  v24 = a2;
  sub_227BF70D8();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_227C09160();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v23 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - v13;
  v27 = a1;
  v15 = objc_msgSend(a1, sel_originIdentifier);
  v16 = objc_msgSend(v15, sel_signedClinicalDataRecordIdentifier);

  if (v16)
  {
    sub_227C09154();

    v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v17(v4, v12, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v17(v14, v4, v5);
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v5);
      sub_227C09148();
      v25 = 762472566;
      v26 = 0xE400000000000000;
      sub_227C09208();
      swift_bridgeObjectRelease();
      v18 = v25;
      v19 = v26;
      v20 = *(void (**)(char *, uint64_t))(v6 + 8);
      v20(v9, v5);

      v20(v14, v5);
      v21 = v24;
      *v24 = 0xD00000000000003CLL;
      v21[1] = 0x8000000227C0A380;
      v21[2] = v18;
      v21[3] = v19;
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_227BF712C((uint64_t)v4);
  sub_227BF7168();
  swift_allocError();
  *v22 = xmmword_227C09840;
  swift_willThrow();

}

void sub_227BF70D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25591EBA0)
  {
    sub_227C09160();
    v0 = sub_227C0928C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25591EBA0);
  }
}

uint64_t sub_227BF712C(uint64_t a1)
{
  uint64_t v2;

  sub_227BF70D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_227BF7168()
{
  unint64_t result;

  result = qword_25591EBA8;
  if (!qword_25591EBA8)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for SignedClinicalDataWalletPassError, &type metadata for SignedClinicalDataWalletPassError);
    atomic_store(result, (unint64_t *)&qword_25591EBA8);
  }
  return result;
}

unint64_t static SignedClinicalDataWalletPassComponents.teamIdentifier.getter()
{
  return 0xD000000000000010;
}

void sub_227BF71C8()
{
  qword_25591EB58 = (uint64_t)&unk_24F05D400;
}

uint64_t static SignedClinicalDataWalletPassComponents.systemAppBundleIdentifiers.getter()
{
  if (qword_25591EB50 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

void sub_227BF721C()
{
  strcpy((char *)&qword_25591EB68, "rgb(254,63,89)");
  unk_25591EB77 = -18;
}

uint64_t static SignedClinicalDataWalletPassComponents.backgroundColor.getter()
{
  return sub_227BF72D4(&qword_25591EB60, &qword_25591EB68);
}

unint64_t static SignedClinicalDataWalletPassComponents.foregroundColor.getter()
{
  return 0xD000000000000010;
}

void sub_227BF7288()
{
  strcpy((char *)&qword_25591EB80, "rgb(58,2,10)");
  algn_25591EB88[5] = 0;
  *(_WORD *)&algn_25591EB88[6] = -5120;
}

uint64_t static SignedClinicalDataWalletPassComponents.labelColor.getter()
{
  return sub_227BF72D4(&qword_25591EB78, &qword_25591EB80);
}

uint64_t sub_227BF72D4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static SignedClinicalDataWalletPassComponents.groupingIdentifierGenericImmunization.getter()
{
  return 0xD00000000000002ALL;
}

unint64_t static SignedClinicalDataWalletPassComponents.groupingIdentifierCOVID19Immunization.getter()
{
  return 0xD000000000000032;
}

unint64_t static SignedClinicalDataWalletPassComponents.groupingIdentifierCOVID19Laboratory.getter()
{
  return 0xD000000000000029;
}

uint64_t SignedClinicalDataWalletPassComponents.passIdentifier.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t SignedClinicalDataWalletPassComponents.groupingIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SignedClinicalDataWalletPassComponents.appLaunchURL.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

id SignedClinicalDataWalletPassComponents.mainRecord.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 64);
}

uint64_t SignedClinicalDataWalletPassComponents.medicalRecords.getter()
{
  return swift_bridgeObjectRetain();
}

id SignedClinicalDataWalletPassComponents.QRSegment.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 80);
}

void SignedClinicalDataWalletPassComponents.init(from:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  __int128 *v15;
  __int128 v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  _OWORD *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  BOOL v41;
  id v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];
  uint64_t v54;

  v5 = objc_msgSend(a1, sel_mainRecord);
  if (!v5)
  {
    sub_227BF7168();
    swift_allocError();
    *v17 = 0;
    v17[1] = 0;
    swift_willThrow();
LABEL_16:

    return;
  }
  v6 = v5;
  v7 = objc_msgSend(a1, sel_medicalRecords);
  if (!v7)
    goto LABEL_14;
  v8 = v7;
  sub_227BF79BC(0, &qword_25591EBB0);
  v9 = sub_227C09238();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v18 = sub_227C09358();
    swift_bridgeObjectRelease();
    if (v18)
      goto LABEL_5;
    goto LABEL_13;
  }
  if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_14:
    sub_227BF7168();
    swift_allocError();
    v16 = xmmword_227C09870;
    goto LABEL_15;
  }
LABEL_5:
  v10 = objc_msgSend(a1, sel_QRRepresentation);
  if (!v10)
    goto LABEL_11;
  v11 = v10;
  v12 = objc_msgSend(v10, sel_alreadyScannedSegments);

  if (!v12)
    goto LABEL_11;
  sub_227BF79BC(0, &qword_25591EBB8);
  v13 = sub_227C09238();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_227C09358();
    swift_bridgeObjectRelease();
    if (v19 >= 2)
      goto LABEL_9;
    swift_bridgeObjectRetain();
    v14 = sub_227C09358();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v14 > 1)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_227BF7168();
      swift_allocError();
      v16 = xmmword_227C09850;
LABEL_15:
      *v15 = v16;
      swift_willThrow();

      goto LABEL_16;
    }
  }
  if (!v14)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    sub_227BF7168();
    swift_allocError();
    v16 = xmmword_227C09860;
    goto LABEL_15;
  }
  if ((v13 & 0xC000000000000001) != 0)
  {
    v20 = (id)MEMORY[0x22E2A6368](0, v13);
LABEL_23:
    v21 = v20;
    swift_bridgeObjectRelease();
    if ((uint64_t)objc_msgSend(v21, sel_numberOfExpectedSiblings) >= 2)
    {
      swift_bridgeObjectRelease();
      sub_227BF7168();
      swift_allocError();
      *v22 = xmmword_227C09850;
      swift_willThrow();

      goto LABEL_16;
    }
    v23 = v6;
    SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(v23, v53);
    if (v2)
    {
      swift_bridgeObjectRelease();

      goto LABEL_16;
    }
    v54 = v53[0];
    v51 = v53[2];
    v52 = v53[1];
    v50 = v53[3];
    v24 = HKSignedClinicalDataRecord.appLaunchURL.getter();
    v48 = v25;
    v49 = v24;
    v26 = v23;
    v47 = v21;
    v27 = objc_msgSend(v26, sel_credentialTypes);
    v28 = (_QWORD *)sub_227C09238();

    v29 = sub_227C091D8();
    v31 = sub_227BF79F4(v29, v30, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend(v26, sel_credentialTypes);
    v33 = (_QWORD *)sub_227C09238();

    v34 = sub_227C091D8();
    v36 = sub_227BF79F4(v34, v35, v33);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) != 0)
    {
      v37 = v47;
      if ((v36 & 1) != 0)
      {

        v38 = 0xD000000000000032;
        v39 = 0x8000000227C0A430;
LABEL_39:
        *a2 = v54;
        a2[1] = v52;
        a2[2] = v51;
        a2[3] = v50;
        a2[4] = v38;
        a2[5] = v39;
        a2[6] = v49;
        a2[7] = v48;
        a2[8] = v26;
        a2[9] = v9;
        a2[10] = v37;
        return;
      }
      v42 = objc_msgSend(v26, sel_credentialTypes);
      v43 = (_QWORD *)sub_227C09238();

      v44 = sub_227C091D8();
      v46 = sub_227BF79F4(v44, v45, v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v40 = "vid19-immunization";
      v41 = (v46 & 1) == 0;
      v38 = 0xD000000000000029;
      if ((v46 & 1) == 0)
        v38 = 0;
    }
    else
    {
      v37 = v47;

      v40 = "rgb(255,255,255)";
      v41 = (v36 & 1) == 0;
      if ((v36 & 1) != 0)
        v38 = 0xD00000000000002ALL;
      else
        v38 = 0;
    }
    v39 = (unint64_t)v40 | 0x8000000000000000;
    if (v41)
      v39 = 0;
    goto LABEL_39;
  }
  if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v20 = *(id *)(v13 + 32);
    goto LABEL_23;
  }
  __break(1u);
}

uint64_t sub_227BF79BC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_227BF79F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_227C09418();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_227C09418() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t destroy for SignedClinicalDataWalletPassIdentifier()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SignedClinicalDataWalletPassIdentifier(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for SignedClinicalDataWalletPassIdentifier(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for SignedClinicalDataWalletPassIdentifier(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for SignedClinicalDataWalletPassIdentifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SignedClinicalDataWalletPassIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SignedClinicalDataWalletPassIdentifier()
{
  return &type metadata for SignedClinicalDataWalletPassIdentifier;
}

uint64_t initializeBufferWithCopyOfBuffer for SignedClinicalDataWalletPassComponents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for SignedClinicalDataWalletPassComponents(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SignedClinicalDataWalletPassComponents(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v8 = (void *)a2[8];
  v7 = a2[9];
  a1[8] = v8;
  a1[9] = v7;
  v9 = (void *)a2[10];
  a1[10] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = v8;
  swift_bridgeObjectRetain();
  v11 = v9;
  return a1;
}

_QWORD *assignWithCopy for SignedClinicalDataWalletPassComponents(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

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
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[8];
  v5 = (void *)a1[8];
  a1[8] = v4;
  v6 = v4;

  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (void *)a2[10];
  v8 = (void *)a1[10];
  a1[10] = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SignedClinicalDataWalletPassComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  swift_bridgeObjectRelease();
  v8 = *(void **)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);

  return a1;
}

uint64_t getEnumTagSinglePayload for SignedClinicalDataWalletPassComponents(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SignedClinicalDataWalletPassComponents(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SignedClinicalDataWalletPassComponents()
{
  return &type metadata for SignedClinicalDataWalletPassComponents;
}

uint64_t sub_227BF7FD0(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;

  result = sub_227C0105C(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_227C01110(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

void sub_227BF804C()
{
  qword_25591EBC0 = 0x2F3A74656C6C6177;
  *(_QWORD *)algn_25591EBC8 = 0xE90000000000002FLL;
}

uint64_t static SignedClinicalDataWalletPassManager.walletBaseURL.getter()
{
  uint64_t v0;

  if (qword_25591EB90 != -1)
    swift_once();
  v0 = qword_25591EBC0;
  swift_bridgeObjectRetain();
  return v0;
}

id sub_227BF80D0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = *(id *)(v0 + 16);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
    objc_msgSend(v3, sel_setFormatOptions_, 1907);
    v4 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

id sub_227BF814C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 24);
  if (v1)
  {
    v2 = *(id *)(v0 + 24);
  }
  else
  {
    v3 = sub_227BF81A0();
    v4 = *(void **)(v0 + 24);
    *(_QWORD *)(v0 + 24) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

id sub_227BF81A0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  sub_227BFA28C(0, &qword_25591EBF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v8 - v1;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v3, sel_setDateStyle_, 2);
  objc_msgSend(v3, sel_setTimeStyle_, 0);
  sub_227C09178();
  v4 = sub_227C09190();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) != 1)
  {
    v6 = (void *)sub_227C09184();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v2, v4);
  }
  objc_msgSend(v3, sel_setTimeZone_, v6);

  return v3;
}

id sub_227BF82C4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  if (v1)
  {
    v2 = *(id *)(v0 + 32);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6EC00]), sel_init);
    v4 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

_QWORD *SignedClinicalDataWalletPassManager.__allocating_init()()
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

_QWORD *SignedClinicalDataWalletPassManager.init()()
{
  _QWORD *v0;
  _QWORD *result;

  result = v0;
  v0[2] = 0;
  v0[3] = 0;
  v0[4] = 0;
  return result;
}

id sub_227BF8364()
{
  id v0;
  id v1;

  v0 = sub_227BF82C4();
  v1 = objc_msgSend(v0, sel_canAddPassOfType_, 0);

  return v1;
}

id static SignedClinicalDataWalletPassManager.walletIsInstalled.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_isWalletVisible);
}

void sub_227BF83C8(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  __int128 *v5;
  __int128 v6;
  id v7;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  _QWORD v14[11];

  if (objc_msgSend((id)objc_opt_self(), sel_isWalletVisible))
  {
    v3 = objc_msgSend(a1, sel_mainRecord);
    if (!v3)
    {
      sub_227BF7168();
      swift_allocError();
      *v11 = xmmword_227C09920;
      swift_willThrow();
      return;
    }
    v4 = v3;
    if (HKSignedClinicalDataRecord.permanentlyIneligibleToBeAddedToWallet.getter())
    {
      sub_227BF7168();
      swift_allocError();
      v6 = xmmword_227C09930;
    }
    else
    {
      if (HKSignedClinicalDataRecord.eligibleToBeAddedToWallet.getter())
      {
        SignedClinicalDataWalletPassComponents.init(from:)(a1, v14);
        if (!v1)
        {
          v12 = (void *)v14[8];
          v13 = (void *)v14[10];

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return;
        }
        goto LABEL_15;
      }
      sub_227BF7168();
      swift_allocError();
      v6 = xmmword_227C09920;
    }
    *v5 = v6;
    swift_willThrow();
LABEL_15:

    return;
  }
  v7 = sub_227BF82C4();
  v8 = objc_msgSend(v7, sel_canAddPassOfType_, 0);

  sub_227BF7168();
  swift_allocError();
  *v9 = 0;
  if (v8)
    v10 = 7;
  else
    v10 = 8;
  v9[1] = v10;
  swift_willThrow();
}

id sub_227BF85C4(void *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;

  SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(a1, &v7);
  v2 = sub_227BF82C4();
  v3 = (void *)sub_227C091CC();
  v4 = (void *)sub_227C091CC();
  v5 = objc_msgSend(v2, sel_passWithPassTypeIdentifier_serialNumber_, v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v5)
  {
    v6 = objc_msgSend(v5, sel_uniqueID);

    if (v6)
    {
      v5 = (id)sub_227C091D8();

    }
    else
    {
      return 0;
    }
  }
  return v5;
}

uint64_t sub_227BF86D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[2];

  SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(a1, v10);
  v5 = sub_227BF82C4();
  v6 = (void *)sub_227C091CC();
  v7 = (void *)sub_227C091CC();
  v8 = objc_msgSend(v5, sel_passWithPassTypeIdentifier_serialNumber_, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v8 && (v9 = objc_msgSend(v8, sel_uniqueID), v8, v9))
  {
    sub_227C091D8();

    if (qword_25591EB90 != -1)
      swift_once();
    strcpy((char *)v10, "wallet://card/");
    HIBYTE(v10[1]) = -18;
    sub_227C09208();
    swift_bridgeObjectRelease();
    sub_227C090DC();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v3 = sub_227C090E8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 1, 1, v3);
  }
}

void sub_227BF8888(void *a1, void (*a2)(uint64_t), void (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (**v28)(uint64_t);
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  id v37;
  _QWORD aBlock[7];

  v6 = sub_227C090E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v33 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v33 - v14;
  if (objc_msgSend((id)objc_opt_self(), sel_isWalletVisible))
  {
    sub_227BF9000(a1, v13);
    v36 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v36(v15, v13, v6);
    v37 = sub_227BF82C4();
    sub_227BFA28C(0, &qword_25591EBD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v22 = *(unsigned __int8 *)(v7 + 80);
    v23 = swift_allocObject();
    v34 = a3;
    *(_OWORD *)(v23 + 16) = xmmword_227C09940;
    v24 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 16);
    v24(v23 + ((v22 + 32) & ~v22), v15, v6);
    v35 = sub_227C0922C();
    swift_bridgeObjectRelease();
    v24((uint64_t)v10, v15, v6);
    v25 = (v22 + 16) & ~v22;
    v26 = (v8 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
    v27 = swift_allocObject();
    v36((char *)(v27 + v25), v10, v6);
    v28 = (void (**)(uint64_t))(v27 + v26);
    v29 = v34;
    *v28 = a2;
    v28[1] = v29;
    aBlock[4] = sub_227BFA220;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_227BF8CFC;
    aBlock[3] = &block_descriptor;
    v30 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v31 = v37;
    v32 = (void *)v35;
    objc_msgSend(v37, sel_addUnsignedPassesAtURLs_withCompletionHandler_, v35, v30);
    _Block_release(v30);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
  }
  else
  {
    v16 = sub_227BF82C4();
    v17 = objc_msgSend(v16, sel_canAddPassOfType_, 0);

    sub_227BF7168();
    v18 = swift_allocError();
    v20 = (void *)v18;
    *v19 = 0;
    if (v17)
      v21 = 7;
    else
      v21 = 8;
    v19[1] = v21;
    a2(v18);

  }
}

void sub_227BF8BB8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  _OWORD *v10;
  id v11;
  void *v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
  v6 = (void *)sub_227C090B8();
  v13[0] = 0;
  v7 = objc_msgSend(v5, sel_removeItemAtURL_error_, v6, v13);

  if (v7)
  {
    v8 = v13[0];
    if (a1)
    {
LABEL_3:
      sub_227BF7168();
      v9 = (void *)swift_allocError();
      *v10 = xmmword_227C09950;
      a3();

      return;
    }
  }
  else
  {
    v11 = v13[0];
    v12 = (void *)sub_227C090A0();

    swift_willThrow();
    if (a1)
      goto LABEL_3;
  }
  ((void (*)(_QWORD))a3)(0);

}

uint64_t sub_227BF8CFC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_227BF8D38(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[13];

  SignedClinicalDataWalletPassComponents.init(from:)(a1, v9);
  if (!v1)
  {
    v9[12] = v9[5];
    v8 = (void *)v9[8];
    v2 = (void *)v9[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v3 = sub_227BF82C4();
    v4 = (void *)sub_227C091CC();
    v5 = (void *)sub_227C091CC();
    v6 = objc_msgSend(v3, sel_passWithPassTypeIdentifier_serialNumber_, v4, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v6)
    {
      v7 = sub_227BF82C4();
      objc_msgSend(v7, sel_removePass_, v6);

    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_227BF8E8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[2];

  v2 = sub_227C09160();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_227C09148();
  v11[0] = 762472566;
  v11[1] = 0xE400000000000000;
  sub_227C09208();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v6 = sub_227BF82C4();
  v7 = (void *)sub_227C091CC();
  v8 = (void *)sub_227C091CC();
  v9 = objc_msgSend(v6, sel_passWithPassTypeIdentifier_serialNumber_, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v9)
  {
    v10 = sub_227BF82C4();
    objc_msgSend(v10, sel_removePass_, v9);

  }
}

void sub_227BF9000(void *a1@<X0>, char *a2@<X8>)
{
  void (**v2)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSString *v46;
  id v47;
  void *v48;
  unsigned int v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  void *v58;
  id v59;
  char *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  unint64_t v69;
  void *v70;
  char *v71;
  void *v72;
  void (*v73)(char *, uint64_t);
  uint64_t ObjCClassFromMetadata;
  id v75;
  void *v76;
  void *v77;
  id v78;
  char *v79;
  _QWORD *v80;
  void (*v81)(char *, char *, uint64_t);
  uint64_t v82;
  char *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  void *v88;
  void *v89;
  id v90;
  _QWORD *v91;
  void (*v92)(void);
  uint64_t v93;
  void *v94;
  char *v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  char *v101;
  _QWORD *v102;
  void (*v103)(uint64_t, char *, uint64_t);
  uint64_t v104;
  void *v105;
  void *v106;
  id v107;
  char *v108;
  _QWORD *v109;
  void (*v110)(char *, char *, uint64_t);
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  id v116;
  _QWORD *v117;
  void (*v118)(void);
  uint64_t v119;
  uint64_t v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  char *v128;
  _QWORD *v129;
  void (*v130)(char *, char *, uint64_t);
  uint64_t v131;
  void *v132;
  char *v133;
  id v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  id v153;
  uint64_t v154;
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  void (*v160)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v161;
  char *v162;
  id v163;
  uint64_t v164;
  _QWORD *v165;
  char *v166;
  id v167;
  uint64_t v168;
  _BYTE v169[258];
  _BYTE v170[264];
  _QWORD v171[11];
  uint64_t v172[35];

  v167 = a1;
  v166 = a2;
  v172[33] = *MEMORY[0x24BDAC8D0];
  v160 = *v2;
  sub_227BFA28C(0, &qword_25591EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v156 = (char *)&v137 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v157 = (char *)&v137 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v158 = (char *)&v137 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v162 = (char *)&v137 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v159 = (char *)&v137 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v161 = (char *)&v137 - v14;
  v15 = sub_227C090E8();
  v16 = *(_QWORD **)(v15 - 8);
  v164 = v15;
  v165 = v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v155 = (char *)&v137 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v137 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v137 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v137 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v137 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v137 - v32;
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v137 - v35;
  v37 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)&v137 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v137 - v40;
  v42 = v167;
  v43 = v168;
  SignedClinicalDataWalletPassComponents.init(from:)(v42, v172);
  if (!v43)
  {
    v143 = v33;
    v144 = v39;
    v141 = v30;
    v142 = v36;
    v139 = v24;
    v140 = v27;
    v138 = v21;
    v44 = v172[2];
    v45 = v172[3];
    v147 = v172[4];
    v148 = (id)v172[0];
    v167 = (id)v172[5];
    v168 = 0;
    v146 = v172[6];
    v149 = v172[7];
    v151 = v172[1];
    v152 = (id)v172[8];
    v153 = (id)v172[10];
    v154 = v172[9];
    v46 = NSTemporaryDirectory();
    sub_227C091D8();

    sub_227C090AC();
    swift_bridgeObjectRelease();
    v172[0] = 0;
    v172[1] = 0xE000000000000000;
    sub_227C092E0();
    swift_bridgeObjectRelease();
    v172[0] = 0xD000000000000015;
    v172[1] = 0x8000000227C0A4C0;
    swift_bridgeObjectRetain();
    sub_227C09208();
    v150 = v45;
    swift_bridgeObjectRelease();
    sub_227C09208();
    v145 = v41;
    sub_227C090C4();
    swift_bridgeObjectRelease();
    v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
    v48 = (void *)sub_227C090B8();
    v172[0] = 0;
    v49 = objc_msgSend(v47, sel_removeItemAtURL_error_, v48, v172);

    if (v49)
    {
      v50 = (id)v172[0];
      v51 = v168;
    }
    else
    {
      v52 = (id)v172[0];
      v53 = (void *)sub_227C090A0();

      swift_willThrow();
      v51 = 0;
    }
    v171[0] = v148;
    v171[1] = v151;
    v171[2] = v44;
    v171[3] = v150;
    v171[4] = v147;
    v171[5] = v167;
    v171[6] = v146;
    v171[7] = v149;
    v55 = v152;
    v54 = v153;
    v171[8] = v152;
    v171[9] = v154;
    v171[10] = v153;
    sub_227BFA548((uint64_t)v171, v172);
    v168 = v51;
    if (v51)
    {

      v56 = (void (*)(uint64_t, uint64_t))v165[1];
      v57 = v164;
      v56((uint64_t)v166, v164);
      v56((uint64_t)v145, v57);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    v58 = v47;
    memcpy(v170, v172, 0x102uLL);
    v59 = objc_allocWithZone(MEMORY[0x24BDD4190]);
    v60 = v166;
    v61 = (void *)sub_227C090B8();
    v62 = objc_msgSend(v59, sel_initWithURL_archiveType_, v61, 0);

    memcpy(v169, v170, sizeof(v169));
    v63 = v168;
    v64 = WalletPass.asData()();
    v66 = v164;
    if (v63)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      v67 = (void (*)(uint64_t, uint64_t))v165[1];
      v67((uint64_t)v60, v66);
      v67((uint64_t)v145, v66);
      sub_227BFAE50((uint64_t)v170);
      return;
    }
    v68 = v64;
    v69 = v65;
    sub_227BFAE50((uint64_t)v170);
    v70 = (void *)sub_227C090F4();
    sub_227BFAF88(v68, v69);
    v71 = v144;
    sub_227C090AC();
    v72 = (void *)sub_227C090B8();
    v73 = (void (*)(char *, uint64_t))v165[1];
    v73(v71, v66);
    objc_msgSend(v62, sel_addDataToArchive_pathInArchive_, v70, v72);

    sub_227BFA2E4();
    v148 = v62;
    v168 = 0;
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v75 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v76 = (void *)sub_227C091CC();
    v77 = (void *)sub_227C091CC();
    v163 = v75;
    v78 = objc_msgSend(v75, sel_URLForResource_withExtension_, v76, v77);

    if (v78)
    {
      v79 = v143;
      sub_227C090D0();

      v80 = v165;
      v81 = (void (*)(char *, char *, uint64_t))v165[4];
      v82 = (uint64_t)v161;
      v81(v161, v79, v66);
      v160 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v80[7];
      v160(v82, 0, 1, v66);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v80[6])(v82, 1, v66) != 1)
      {
        v83 = v142;
        v81(v142, (char *)v82, v66);
        v84 = v148;
        v85 = v168;
        sub_227BFA410();
        v168 = v85;
        v86 = (uint64_t)v162;
        if (v85)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          v87 = v83;
LABEL_34:
          v73(v87, v66);
          v73(v166, v66);
LABEL_46:
          v73(v145, v66);
          return;
        }
        v73(v83, v66);
LABEL_17:
        v88 = (void *)sub_227C091CC();
        v89 = (void *)sub_227C091CC();
        v90 = objc_msgSend(v163, sel_URLForResource_withExtension_, v88, v89);

        if (v90)
        {
          sub_227C090D0();

          v91 = v165;
          v92 = (void (*)(void))v165[4];
          v93 = (uint64_t)v159;
          v92();
          v160(v93, 0, 1, v66);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v91[6])(v93, 1, v66) != 1)
          {
            v94 = v58;
            v95 = v141;
            v92();
            v96 = v148;
            v97 = v168;
            sub_227BFA410();
            v168 = v97;
            if (v97)
            {
LABEL_26:

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

LABEL_33:
              swift_bridgeObjectRelease();
              v87 = v95;
              goto LABEL_34;
            }
            v73(v95, v66);
LABEL_23:
            v98 = (void *)sub_227C091CC();
            v99 = (void *)sub_227C091CC();
            v100 = objc_msgSend(v163, sel_URLForResource_withExtension_, v98, v99);

            if (v100)
            {
              v101 = v143;
              sub_227C090D0();

              v102 = v165;
              v103 = (void (*)(uint64_t, char *, uint64_t))v165[4];
              v103(v86, v101, v66);
              v160(v86, 0, 1, v66);
              if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v102[6])(v86, 1, v66) != 1)
              {
                v94 = v58;
                v95 = v140;
                v103((uint64_t)v140, (char *)v86, v66);
                v96 = v148;
                v104 = v168;
                sub_227BFA410();
                v168 = v104;
                if (v104)
                  goto LABEL_26;
                v73(v95, v66);
LABEL_29:
                v105 = (void *)sub_227C091CC();
                v106 = (void *)sub_227C091CC();
                v107 = objc_msgSend(v163, sel_URLForResource_withExtension_, v105, v106);

                if (v107)
                {
                  v108 = v143;
                  sub_227C090D0();

                  v109 = v165;
                  v110 = (void (*)(char *, char *, uint64_t))v165[4];
                  v111 = (uint64_t)v158;
                  v110(v158, v108, v66);
                  v160(v111, 0, 1, v66);
                  v112 = v58;
                  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v109[6])(v111, 1, v66) != 1)
                  {
                    v95 = v139;
                    v110(v139, (char *)v111, v66);
                    v96 = v148;
                    v113 = v168;
                    sub_227BFA410();
                    v168 = v113;
                    if (v113)
                    {

                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();

                      goto LABEL_33;
                    }
                    v73(v95, v66);
LABEL_37:
                    if (objc_msgSend(v152, sel_sourceType) != (id)1
                      || !objc_msgSend((id)objc_opt_self(), sel_hk_isUSLocale))
                    {
                      v121 = v112;
                      goto LABEL_44;
                    }
                    v114 = (void *)sub_227C091CC();
                    v115 = (void *)sub_227C091CC();
                    v116 = objc_msgSend(v163, sel_URLForResource_withExtension_, v114, v115);

                    if (v116)
                    {
                      sub_227C090D0();

                      v117 = v165;
                      v118 = (void (*)(void))v165[4];
                      v119 = (uint64_t)v157;
                      v118();
                      v160(v119, 0, 1, v66);
                      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v117[6])(v119, 1, v66) != 1)
                      {
                        v94 = v58;
                        v95 = v138;
                        v118();
                        v96 = v148;
                        v120 = v168;
                        sub_227BFA410();
                        v168 = v120;
                        if (v120)
                          goto LABEL_26;
                        v73(v95, v66);
                        goto LABEL_52;
                      }
                    }
                    else
                    {
                      v119 = (uint64_t)v157;
                      v160((uint64_t)v157, 1, 1, v66);
                    }
                    sub_227C018B4(v119, &qword_25591EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
LABEL_52:
                    v125 = (void *)sub_227C091CC();
                    v126 = (void *)sub_227C091CC();
                    v127 = objc_msgSend(v163, sel_URLForResource_withExtension_, v125, v126);

                    if (v127)
                    {
                      v128 = v143;
                      sub_227C090D0();

                      v129 = v165;
                      v130 = (void (*)(char *, char *, uint64_t))v165[4];
                      v131 = (uint64_t)v156;
                      v130(v156, v128, v66);
                      v160(v131, 0, 1, v66);
                      v132 = v58;
                      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v129[6])(v131, 1, v66) != 1)
                      {
                        v133 = v155;
                        v130(v155, (char *)v131, v66);
                        v134 = v148;
                        v135 = v168;
                        sub_227BFA410();
                        v122 = v152;
                        v136 = v163;
                        v168 = v135;
                        if (v135)
                        {

                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();

                          swift_bridgeObjectRelease();
                          v87 = v133;
                          goto LABEL_34;
                        }
                        v121 = v132;
                        v73(v133, v66);
LABEL_45:
                        v123 = v153;
                        v124 = v148;
                        objc_msgSend(v148, sel_closeArchive);

                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();

                        swift_bridgeObjectRelease();
                        goto LABEL_46;
                      }
                    }
                    else
                    {
                      v131 = (uint64_t)v156;
                      v160((uint64_t)v156, 1, 1, v66);
                      v132 = v58;
                    }
                    v121 = v132;
                    sub_227C018B4(v131, &qword_25591EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
LABEL_44:
                    v122 = v152;
                    goto LABEL_45;
                  }
                }
                else
                {
                  v111 = (uint64_t)v158;
                  v160((uint64_t)v158, 1, 1, v66);
                  v112 = v58;
                }
                sub_227C018B4(v111, &qword_25591EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
                goto LABEL_37;
              }
            }
            else
            {
              v160(v86, 1, 1, v66);
            }
            sub_227C018B4(v86, &qword_25591EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
            goto LABEL_29;
          }
        }
        else
        {
          v93 = (uint64_t)v159;
          v160((uint64_t)v159, 1, 1, v66);
        }
        sub_227C018B4(v93, &qword_25591EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
        goto LABEL_23;
      }
    }
    else
    {
      v82 = (uint64_t)v161;
      v160 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v165[7];
      v160((uint64_t)v161, 1, 1, v66);
    }
    v86 = (uint64_t)v162;
    sub_227C018B4(v82, &qword_25591EBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    goto LABEL_17;
  }
}

uint64_t sub_227BFA1A8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_227C090E8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_227BFA220(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_227C090E8() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_227BF8BB8(a1, v1 + v4, *(void (**)(void))(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
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

void sub_227BFA28C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

id sub_227BFA2E4()
{
  void *v0;
  id result;
  id v2;
  void *v3;
  _QWORD *v4;

  result = objc_msgSend(v0, sel_archiveIsValid);
  if (!(_DWORD)result)
  {
    sub_227C09208();
    sub_227C09208();
    v2 = objc_msgSend(v0, sel_error);
    if (v2)
    {
      v3 = v2;
      swift_getErrorValue();
      sub_227C09430();

    }
    sub_227C09208();
    swift_bridgeObjectRelease();
    sub_227BF7168();
    swift_allocError();
    *v4 = 0x20726F727265;
    v4[1] = 0xE600000000000000;
    return (id)swift_willThrow();
  }
  return result;
}

uint64_t sub_227BFA410()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v1 = v0;
  v2 = sub_227C090E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)sub_227C090B8();
  sub_227C090AC();
  v7 = (void *)sub_227C090B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v1, sel_addFileToArchive_pathInArchive_, v6, v7);

  v9[0] = 0x6020676E69646461;
  v9[1] = 0xE800000000000000;
  sub_227C09208();
  sub_227C09208();
  sub_227BFA2E4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_227BFA548@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  void *v37;
  void *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  char *v50;
  id v51;
  uint64_t v52;
  id v53;
  char *v54;
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
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[8];
  __int128 v98;
  void *v99;
  uint64_t v100[5];
  uint64_t v101;

  v83 = a2;
  sub_227BFA28C(0, &qword_25591EBE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v72 - v4;
  v87 = sub_227C0913C();
  v86 = *(_QWORD *)(v87 - 8);
  v6 = MEMORY[0x24BDAC7A8](v87);
  v82 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v81 = (char *)&v72 - v8;
  v92 = *(_QWORD *)a1;
  v101 = *(_QWORD *)(a1 + 8);
  v91 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 40);
  v94 = *(_QWORD *)(a1 + 32);
  v95 = v9;
  v93 = *(_QWORD *)(a1 + 48);
  v96 = *(_QWORD *)(a1 + 56);
  v11 = *(void **)(a1 + 80);
  v88 = *(_OWORD *)(a1 + 64);
  v12 = (void *)v88;
  v13 = objc_msgSend((id)v88, sel_credentialTypes);
  v14 = (_QWORD *)sub_227C09238();

  v15 = sub_227C091D8();
  v17 = sub_227BF79F4(v15, v16, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v84 = v5;
  if ((v17 & 1) == 0)
  {
    v20 = objc_msgSend(v12, sel_credentialTypes);
    v21 = (_QWORD *)sub_227C09238();

    v22 = sub_227C091D8();
    sub_227BF79F4(v22, v23, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for SignedClinicalDataWalletPassManager();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v85 = sub_227C09094();
  v25 = v24;

  v26 = objc_msgSend(v12, sel_sourceType);
  if (v26 == (id)2)
    v27 = 0x434344205545;
  else
    v27 = 0;
  if (v26 == (id)2)
    v28 = 0xE600000000000000;
  else
    v28 = 0;
  v29 = objc_msgSend(v11, sel_fullQRCodeValue);
  v30 = v12;
  v31 = sub_227C091D8();
  v33 = v32;

  v97[0] = v92;
  v97[1] = v101;
  v97[2] = v91;
  v97[3] = v95;
  v97[4] = v94;
  v97[5] = v10;
  v97[6] = v93;
  v97[7] = v96;
  v98 = v88;
  v99 = v11;
  v34 = v89;
  sub_227BFAFCC((uint64_t)v97, v100);
  if (v34)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v72 = 0;
  v73 = v31;
  v79 = v33;
  v80 = v27;
  *(_QWORD *)&v88 = v28;
  v89 = v25;
  v78 = v100[0];
  v77 = v100[1];
  v76 = v100[2];
  v75 = v100[3];
  v74 = v100[4];
  v36 = objc_msgSend(v30, sel_expirationDate);
  v37 = v30;
  if (!v36)
  {
    v42 = (uint64_t)v84;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56))(v84, 1, 1, v87);
    goto LABEL_15;
  }
  v38 = v36;
  v39 = v82;
  sub_227C09124();

  v40 = v86;
  v41 = *(void (**)(char *, char *, uint64_t))(v86 + 32);
  v42 = (uint64_t)v84;
  v43 = v87;
  v41(v84, v39, v87);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v40 + 56))(v42, 0, 1, v43);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v42, 1, v43) == 1)
  {
LABEL_15:
    sub_227C018B4(v42, &qword_25591EBE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
    v49 = 0;
    v82 = 0;
    goto LABEL_16;
  }
  v44 = v81;
  v41(v81, (char *)v42, v43);
  v45 = v40;
  v46 = sub_227BF80D0();
  v47 = (void *)sub_227C09100();
  v48 = objc_msgSend(v46, sel_stringFromDate_, v47);

  v49 = sub_227C091D8();
  v82 = v50;

  (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v43);
LABEL_16:
  v51 = objc_msgSend(v37, sel_recordTypeDisplayName);
  v90 = sub_227C091D8();
  v87 = v52;

  v53 = objc_msgSend(v37, sel_recordIssuerDisplayName);
  v86 = sub_227C091D8();
  v84 = v54;

  v55 = qword_25591EB50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v55 != -1)
    swift_once();
  v56 = qword_25591EB58;
  v57 = qword_25591EB60;
  swift_bridgeObjectRetain();
  if (v57 != -1)
    swift_once();
  v59 = qword_25591EB68;
  v58 = unk_25591EB70;
  v60 = qword_25591EB78;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v60 != -1)
    swift_once();
  v61 = qword_25591EB80;
  v62 = *(_QWORD *)algn_25591EB88;
  sub_227C01DBC(0, &qword_25591EBE8, (uint64_t)&type metadata for WalletPassBarcode, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v63 = swift_allocObject();
  v64 = v88;
  *(_QWORD *)(v63 + 32) = v80;
  *(_QWORD *)(v63 + 40) = v64;
  *(_QWORD *)(v63 + 48) = 0xD000000000000011;
  *(_QWORD *)(v63 + 56) = 0x8000000227C0A5E0;
  *(_OWORD *)(v63 + 16) = xmmword_227C09940;
  v65 = v79;
  *(_QWORD *)(v63 + 64) = v73;
  *(_QWORD *)(v63 + 72) = v65;
  *(_QWORD *)(v63 + 80) = 0x393538382D6F7369;
  *(_QWORD *)(v63 + 88) = 0xEA0000000000312DLL;
  v66 = v83;
  *v83 = v90;
  v66[1] = v87;
  v66[2] = 1;
  v66[3] = v86;
  v66[4] = (uint64_t)v84;
  v66[5] = v92;
  v66[6] = v101;
  v66[7] = v91;
  v66[8] = v95;
  v66[9] = 0xD000000000000010;
  v67 = v93;
  v66[10] = 0x8000000227C0A3C0;
  v66[11] = v67;
  v66[12] = v96;
  v66[13] = v56;
  v66[14] = v59;
  v66[15] = v58;
  v66[16] = 0xD000000000000010;
  v66[17] = 0x8000000227C0A3E0;
  v66[18] = v94;
  v66[19] = v10;
  v66[20] = v61;
  v66[21] = v62;
  v68 = v89;
  v66[22] = v85;
  v66[23] = v68;
  v69 = v77;
  v66[24] = v78;
  v66[25] = v69;
  v70 = v75;
  v66[26] = v76;
  v66[27] = v70;
  v66[28] = v74;
  v66[29] = v63;
  v71 = v82;
  v66[30] = v49;
  v66[31] = (uint64_t)v71;
  *((_WORD *)v66 + 128) = 513;
  return swift_bridgeObjectRetain();
}

uint64_t sub_227BFAE50(uint64_t a1)
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_227BFAF88(uint64_t a1, unint64_t a2)
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

void sub_227BFAFCC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
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
  void *v39;
  id v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t ObjCClassFromMetadata;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  unint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  void (*v75)(_QWORD, _QWORD, _QWORD);
  char *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  uint64_t i;
  id v82;
  void *v83;
  void *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  unint64_t v110;
  unint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  id v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  id v135;
  void *v136;
  id v137;
  uint64_t v138;
  _QWORD *v139;
  id v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  _QWORD *v152;
  unint64_t v153;
  unint64_t v154;
  _QWORD *v155;
  id v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t j;
  _QWORD *v162;
  id v163;
  id v164;
  _QWORD *v165;
  uint64_t v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  _QWORD *v176;
  unint64_t v177;
  unint64_t v178;
  _QWORD *v179;
  id v180;
  id v181;
  _QWORD *v182;
  uint64_t v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  _QWORD *v193;
  unint64_t v194;
  unint64_t v195;
  _QWORD *v196;
  id v197;
  id v198;
  _QWORD *v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  _QWORD *v210;
  unint64_t v211;
  unint64_t v212;
  _QWORD *v213;
  id v214;
  id v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  _QWORD *v226;
  unint64_t v227;
  unint64_t v228;
  char *v229;
  id v230;
  id v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  id v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  _QWORD *v242;
  unint64_t v243;
  unint64_t v244;
  _QWORD *v245;
  id v246;
  id v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  _QWORD *v257;
  unint64_t v258;
  unint64_t v259;
  _QWORD *v260;
  id v261;
  id v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  id v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  _QWORD *v273;
  unint64_t v274;
  unint64_t v275;
  _QWORD *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  id v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  id v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  id v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  id v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  id v308;
  id v309;
  id v310;
  char *v311;
  void *v312;
  uint64_t v313;
  id v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  id v318;
  void *v319;
  void (*v320)(char *, char *, uint64_t);
  uint64_t v321;
  uint64_t v322;
  char *v323;
  uint64_t v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  id v331;
  void *v332;
  id v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  _QWORD *v337;
  unint64_t v338;
  unint64_t v339;
  _QWORD *v340;
  uint64_t v341;
  _QWORD *v342;
  unint64_t v343;
  uint64_t *v344;
  char *v345;
  char *v346;
  char *v347;
  char *v348;
  char *v349;
  char *v350;
  char *v351;
  char *v352;
  char *v353;
  char *v354;
  char *v355;
  unint64_t v356;
  unint64_t v357;
  const char *v358;
  char *v359;
  char *v360;
  char *v361;
  char *v362;
  char *v363;
  uint64_t v364;
  unint64_t v365;
  uint64_t v366;
  char *v367;
  uint64_t *v368;
  void (*v369)(char *, uint64_t);
  char *v370;
  uint64_t v371;
  uint64_t v372;
  __int128 v373;
  __int128 v374;
  uint64_t v375;
  char *v376;
  void (*v377)(_QWORD, _QWORD, _QWORD);
  unint64_t v378;
  __int128 v379;
  char *v380;
  id v381;
  uint64_t v382;
  id v383;
  _QWORD *v384;
  _QWORD *v385;
  uint64_t v386;
  _QWORD *v387;
  char v388;
  unint64_t v389;

  v368 = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_227BFA28C(0, &qword_25591EBE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v367 = (char *)&v345 - v5;
  v372 = sub_227C0913C();
  v371 = *(_QWORD *)(v372 - 8);
  v6 = MEMORY[0x24BDAC7A8](v372);
  v346 = (char *)&v345 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v370 = (char *)&v345 - v8;
  sub_227BFA28C(0, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], v3);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v345 = (char *)&v345 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v363 = (char *)&v345 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v362 = (char *)&v345 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v361 = (char *)&v345 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v354 = (char *)&v345 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v376 = (char *)&v345 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v353 = (char *)&v345 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v352 = (char *)&v345 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v351 = (char *)&v345 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v350 = (char *)&v345 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v349 = (char *)&v345 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v348 = (char *)&v345 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v347 = (char *)&v345 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v360 = (char *)&v345 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v359 = (char *)&v345 - v38;
  v39 = *(void **)(a1 + 64);
  v378 = *(_QWORD *)(a1 + 72);
  v383 = v39;
  v40 = objc_msgSend(v383, sel_credentialTypes);
  v41 = (_QWORD *)sub_227C09238();

  v42 = sub_227C091D8();
  v44 = sub_227BF79F4(v42, v43, v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v45 = 0;
  if ((v44 & 1) != 0)
  {
    type metadata accessor for SignedClinicalDataWalletPassManager();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v47 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v48 = sub_227C09094();
    v50 = v49;

    LOBYTE(v389) = 1;
    sub_227C01DBC(0, &qword_25591EC00, (uint64_t)&type metadata for WalletPassField, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_227C09940;
    *(_QWORD *)(v45 + 32) = 1701869940;
    *(_QWORD *)(v45 + 40) = 0xE400000000000000;
    *(_QWORD *)(v45 + 48) = 0;
    *(_QWORD *)(v45 + 56) = 0;
    *(_QWORD *)(v45 + 64) = v48;
    *(_QWORD *)(v45 + 72) = v50;
    *(_OWORD *)(v45 + 80) = 0u;
    *(_OWORD *)(v45 + 96) = 0u;
    *(_OWORD *)(v45 + 112) = 0u;
    *(_QWORD *)(v45 + 128) = 0;
    *(_DWORD *)(v45 + 136) = 33686789;
    *(_QWORD *)(v45 + 144) = 0;
    *(_BYTE *)(v45 + 152) = v389;
  }
  v366 = v45;
  sub_227C01DBC(0, &qword_25591EC00, (uint64_t)&type metadata for WalletPassField, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v52 = v51;
  v53 = swift_allocObject();
  v374 = xmmword_227C09940;
  *(_OWORD *)(v53 + 16) = xmmword_227C09940;
  type metadata accessor for SignedClinicalDataWalletPassManager();
  v54 = swift_getObjCClassFromMetadata();
  v381 = (id)objc_opt_self();
  v382 = v54;
  v55 = objc_msgSend(v381, sel_bundleForClass_, v54);
  v358 = "$__lazy_storage_$_passLibrary";
  v380 = "FIELD_TYPE_VALUE_GENERIC";
  v369 = (void (*)(char *, uint64_t))0xD000000000000020;
  v56 = sub_227C09094();
  v58 = v57;

  v59 = v383;
  v60 = objc_msgSend(v383, sel_subject);
  v61 = (char *)objc_msgSend(v60, sel_fullName);

  v62 = sub_227C091D8();
  v64 = v63;

  strcpy((char *)(v53 + 32), "subject-name");
  *(_BYTE *)(v53 + 45) = 0;
  *(_WORD *)(v53 + 46) = -5120;
  *(_QWORD *)(v53 + 48) = v56;
  *(_QWORD *)(v53 + 56) = v58;
  *(_QWORD *)(v53 + 64) = v62;
  *(_QWORD *)(v53 + 72) = v64;
  *(_OWORD *)(v53 + 80) = 0u;
  *(_OWORD *)(v53 + 96) = 0u;
  *(_OWORD *)(v53 + 112) = 0u;
  *(_QWORD *)(v53 + 128) = 0;
  v379 = 0x2020505uLL;
  *(_DWORD *)(v53 + 136) = 33686789;
  *(_QWORD *)(v53 + 144) = 0;
  v65 = 1;
  v365 = v53;
  *(_BYTE *)(v53 + 152) = 1;
  v66 = sub_227C012EC(v59);
  v68 = v67;
  v70 = v69;
  v72 = v71;
  *(_QWORD *)&v373 = v52;
  v73 = swift_allocObject();
  *(_OWORD *)(v73 + 16) = v374;
  *(_QWORD *)(v73 + 32) = 0x6D616E2D6D657469;
  *(_QWORD *)(v73 + 40) = 0xE900000000000065;
  *(_QWORD *)(v73 + 48) = v66;
  *(_QWORD *)(v73 + 56) = v68;
  *(_QWORD *)(v73 + 64) = v70;
  *(_QWORD *)(v73 + 72) = v72;
  *(_OWORD *)(v73 + 80) = 0u;
  *(_OWORD *)(v73 + 96) = 0u;
  *(_OWORD *)(v73 + 112) = 0u;
  *(_QWORD *)(v73 + 128) = 0;
  *(_DWORD *)(v73 + 136) = v379;
  *(_QWORD *)(v73 + 144) = 0;
  v364 = v73;
  *(_BYTE *)(v73 + 152) = 1;
  if ((v378 & 0x8000000000000000) != 0 || (v378 & 0x4000000000000000) != 0)
  {
    v65 = v378;
    swift_bridgeObjectRetain_n();
    v74 = sub_227BFEAA0(v65);
    swift_bridgeObjectRelease();
  }
  else
  {
    v74 = (_QWORD *)(v378 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain_n();
  }
  v75 = v377;
  v389 = (unint64_t)v74;
  sub_227BFEA28((uint64_t *)&v389);
  if (!v75)
  {
    v76 = 0;
    swift_bridgeObjectRelease();
    v77 = v389;
    v389 = MEMORY[0x24BEE4AF8];
    if (v77 < 0 || (v77 & 0x4000000000000000) != 0)
    {
      swift_retain();
      v78 = sub_227C09358();
      if (v78)
      {
LABEL_10:
        if (v78 < 1)
        {
          __break(1u);
          goto LABEL_133;
        }
        v378 = 0;
        for (i = 0; i != v78; ++i)
        {
          if ((v77 & 0xC000000000000001) != 0)
            v82 = (id)MEMORY[0x22E2A6368](i, v77);
          else
            v82 = *(id *)(v77 + 8 * i + 32);
          v83 = v82;
          objc_opt_self();
          v84 = (void *)swift_dynamicCastObjCClass();
          if (!v84 || objc_msgSend(v84, sel_notGiven))
          {

          }
          else
          {
            sub_227C0931C();
            sub_227C09334();
            sub_227C09340();
            sub_227C09328();
          }
        }
        swift_release();
        v85 = v389;
        v76 = (char *)v378;
        if ((v389 & 0x8000000000000000) != 0)
        {
LABEL_131:
          while (1)
          {
            swift_bridgeObjectRetain();
            v86 = sub_227C09358();
            swift_release();
LABEL_27:
            v87 = v86 >= 4 ? 4 : v86;
            v88 = v86 >= 0 ? v87 : 4;
            if ((v88 & 0x8000000000000000) == 0)
              break;
            __break(1u);
          }
          v357 = v77;
          sub_227C00CB8(0, v85);
          sub_227C00CB8(v88, v85);
          sub_227C00D34(0, v88, v85);
          v90 = v89;
          v92 = v91;
          v94 = v93;
          swift_release();
          swift_retain();
          sub_227C01704(v90, v92, v94);
          v96 = v95;
          v61 = v76;
          swift_unknownObjectRelease();
          swift_release();
          v389 = (unint64_t)v96;
          v97 = sub_227C0916C();
          v98 = (uint64_t)v359;
          v377 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v97 - 8) + 56);
          v378 = v97;
          v377(v359, 1, 1);
          v99 = objc_msgSend(v381, sel_bundleForClass_, v382);
          v355 = "FIELD_LABEL_NAME";
          v356 = 0xD000000000000022;
          v100 = sub_227C09094();
          v102 = v101;

          if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
          {
            v100 = sub_227C091E4();
            v104 = v103;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v102 = v104;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          sub_227C018B4(v98, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
          v105 = objc_msgSend(v383, sel_recordIssuerDisplayName);
          v106 = sub_227C091D8();
          v108 = v107;

          v388 = 0;
          sub_227BFE7A0();
          v109 = (_QWORD *)v389;
          v111 = *(_QWORD *)(v389 + 16);
          v110 = *(_QWORD *)(v389 + 24);
          if (v111 >= v110 >> 1)
          {
            v109 = sub_227BFE908((_QWORD *)(v110 > 1), v111 + 1, 1, (_QWORD *)v389);
            v389 = (unint64_t)v109;
          }
          v109[2] = v111 + 1;
          v112 = &v109[16 * v111];
          v112[4] = 0x726575737369;
          v112[5] = 0xE600000000000000;
          v112[6] = v100;
          v112[7] = v102;
          v112[8] = v106;
          v112[9] = v108;
          *((_OWORD *)v112 + 5) = 0u;
          *((_OWORD *)v112 + 6) = 0u;
          *((_OWORD *)v112 + 7) = 0u;
          v112[16] = 0;
          *((_DWORD *)v112 + 34) = v379;
          v112[18] = 1;
          *((_BYTE *)v112 + 152) = 0;
          v113 = swift_allocObject();
          *(_OWORD *)(v113 + 16) = v374;
          v114 = (uint64_t)v360;
          ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v360, 1, 1, v378);
          v115 = objc_msgSend(v381, sel_bundleForClass_, v382);
          v116 = sub_227C09094();
          v118 = v117;

          if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
          {
            v116 = sub_227C091E4();
            v120 = v119;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v118 = v120;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          sub_227C018B4(v114, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
          v121 = v383;
          v122 = objc_msgSend(v383, sel_subject);
          v123 = objc_msgSend(v122, sel_fullName);

          v124 = sub_227C091D8();
          v126 = v125;

          *(_QWORD *)(v113 + 32) = 0xD000000000000011;
          *(_QWORD *)(v113 + 40) = 0x8000000227C0A790;
          *(_QWORD *)(v113 + 48) = v116;
          *(_QWORD *)(v113 + 56) = v118;
          *(_QWORD *)(v113 + 64) = v124;
          *(_QWORD *)(v113 + 72) = v126;
          *(_OWORD *)(v113 + 80) = 0u;
          *(_OWORD *)(v113 + 96) = 0u;
          *(_OWORD *)(v113 + 112) = 0u;
          *(_QWORD *)(v113 + 128) = 0;
          *(_DWORD *)(v113 + 136) = v379;
          *(_QWORD *)(v113 + 144) = 0;
          *(_BYTE *)(v113 + 152) = 1;
          v387 = (_QWORD *)v113;
          v127 = objc_msgSend(v121, sel_subject);
          v65 = (unint64_t)objc_msgSend(v127, sel_birthDate);

          if (!v65)
          {
LABEL_48:
            v140 = objc_msgSend(v383, sel_subject);
            v141 = objc_msgSend(v140, sel_gender);

            if (v141)
            {
              v142 = sub_227C091D8();
              v144 = v143;

              v145 = (uint64_t)v348;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v348, 1, 1, v378);
              v146 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v147 = sub_227C09094();
              v149 = v148;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v147 = sub_227C091E4();
                v151 = v150;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v149 = v151;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v145, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              LOBYTE(v386) = 1;
              sub_227BFE7A0();
              v152 = v387;
              v154 = v387[2];
              v153 = v387[3];
              if (v154 >= v153 >> 1)
              {
                v152 = sub_227BFE908((_QWORD *)(v153 > 1), v154 + 1, 1, v387);
                v387 = v152;
              }
              v152[2] = v154 + 1;
              v155 = &v152[16 * v154];
              v155[4] = 0x7265646E6567;
              v155[5] = 0xE600000000000000;
              v155[6] = v147;
              v155[7] = v149;
              v155[8] = v142;
              v155[9] = v144;
              *((_OWORD *)v155 + 5) = 0u;
              *((_OWORD *)v155 + 6) = 0u;
              *((_OWORD *)v155 + 7) = 0u;
              v155[16] = 0;
              *((_DWORD *)v155 + 34) = v379;
              v155[18] = 0;
              *((_BYTE *)v155 + 152) = 1;
            }
            v386 = 0;
            v156 = objc_msgSend(v383, sel_subject);
            v157 = objc_msgSend(v156, sel_identifiers);

            v158 = (uint64_t)v376;
            if (v157)
            {
              sub_227C01DBC(0, &qword_25591EC08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
              v159 = sub_227C09238();

              v160 = *(_QWORD *)(v159 + 16);
              if (v160)
              {
                swift_bridgeObjectRetain();
                for (j = 0; j != v160; ++j)
                {
                  v162 = *(_QWORD **)(v159 + 8 * j + 32);
                  v385 = v162;
                  sub_227BFDEF4(&v385, &v386, &v387);
                }
                swift_bridgeObjectRelease();
              }
              swift_bridgeObjectRelease();
            }
            v163 = objc_msgSend(v383, sel_subject);
            v164 = objc_msgSend(v163, sel_emailAddresses);

            if (v164)
            {
              v165 = (_QWORD *)sub_227C09238();

              v166 = (uint64_t)v349;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v349, 1, 1, v378);
              v167 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v168 = sub_227C09094();
              v170 = v169;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v168 = sub_227C091E4();
                v172 = v171;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v170 = v172;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v166, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              v385 = v165;
              sub_227C01DBC(0, &qword_25591EC08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
              sub_227C01BA8();
              v173 = sub_227C091C0();
              v175 = v174;
              swift_bridgeObjectRelease();
              LOBYTE(v384) = 1;
              sub_227BFE7A0();
              v176 = v387;
              v178 = v387[2];
              v177 = v387[3];
              if (v178 >= v177 >> 1)
              {
                v176 = sub_227BFE908((_QWORD *)(v177 > 1), v178 + 1, 1, v387);
                v387 = v176;
              }
              v176[2] = v178 + 1;
              v179 = &v176[16 * v178];
              v179[4] = 0x736C69616D65;
              v179[5] = 0xE600000000000000;
              v179[6] = v168;
              v179[7] = v170;
              v179[8] = v173;
              v179[9] = v175;
              *((_OWORD *)v179 + 5) = 0u;
              *((_OWORD *)v179 + 6) = 0u;
              *((_OWORD *)v179 + 7) = 0u;
              v179[16] = 0;
              *((_DWORD *)v179 + 34) = v379;
              v179[18] = 0;
              *((_BYTE *)v179 + 152) = 1;
              v158 = (uint64_t)v376;
            }
            v180 = objc_msgSend(v383, sel_subject);
            v181 = objc_msgSend(v180, sel_phoneNumbers);

            if (v181)
            {
              v182 = (_QWORD *)sub_227C09238();

              v183 = (uint64_t)v350;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v350, 1, 1, v378);
              v184 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v185 = sub_227C09094();
              v187 = v186;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v185 = sub_227C091E4();
                v189 = v188;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v187 = v189;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v183, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              v385 = v182;
              sub_227C01DBC(0, &qword_25591EC08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
              sub_227C01BA8();
              v190 = sub_227C091C0();
              v192 = v191;
              swift_bridgeObjectRelease();
              LOBYTE(v384) = 1;
              sub_227BFE7A0();
              v193 = v387;
              v195 = v387[2];
              v194 = v387[3];
              if (v195 >= v194 >> 1)
              {
                v193 = sub_227BFE908((_QWORD *)(v194 > 1), v195 + 1, 1, v387);
                v387 = v193;
              }
              v193[2] = v195 + 1;
              v196 = &v193[16 * v195];
              v196[4] = 0x73656E6F6870;
              v196[5] = 0xE600000000000000;
              v196[6] = v185;
              v196[7] = v187;
              v196[8] = v190;
              v196[9] = v192;
              *((_OWORD *)v196 + 5) = 0u;
              *((_OWORD *)v196 + 6) = 0u;
              *((_OWORD *)v196 + 7) = 0u;
              v196[16] = 0;
              *((_DWORD *)v196 + 34) = v379;
              v196[18] = 0;
              *((_BYTE *)v196 + 152) = 1;
              v158 = (uint64_t)v376;
            }
            v197 = objc_msgSend(v383, sel_subject);
            v198 = objc_msgSend(v197, sel_addresses);

            if (v198)
            {
              v199 = (_QWORD *)sub_227C09238();

              v200 = (uint64_t)v351;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v351, 1, 1, v378);
              v201 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v202 = sub_227C09094();
              v204 = v203;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v202 = sub_227C091E4();
                v206 = v205;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v204 = v206;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v200, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              v385 = v199;
              sub_227C01DBC(0, &qword_25591EC08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
              sub_227C01BA8();
              v207 = sub_227C091C0();
              v209 = v208;
              swift_bridgeObjectRelease();
              LOBYTE(v384) = 1;
              sub_227BFE7A0();
              v210 = v387;
              v212 = v387[2];
              v211 = v387[3];
              if (v212 >= v211 >> 1)
              {
                v210 = sub_227BFE908((_QWORD *)(v211 > 1), v212 + 1, 1, v387);
                v387 = v210;
              }
              v210[2] = v212 + 1;
              v213 = &v210[16 * v212];
              v213[4] = 0x6573736572646461;
              v213[5] = 0xE900000000000073;
              v213[6] = v202;
              v213[7] = v204;
              v213[8] = v207;
              v213[9] = v209;
              *((_OWORD *)v213 + 5) = 0u;
              *((_OWORD *)v213 + 6) = 0u;
              *((_OWORD *)v213 + 7) = 0u;
              v213[16] = 0;
              *((_DWORD *)v213 + 34) = v379;
              v213[18] = 0;
              *((_BYTE *)v213 + 152) = 1;
              v158 = (uint64_t)v376;
            }
            v214 = objc_msgSend(v383, sel_subject);
            v215 = objc_msgSend(v214, sel_maritalStatus);

            if (v215)
            {
              v216 = sub_227C091D8();
              v218 = v217;

              v219 = (uint64_t)v352;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v352, 1, 1, v378);
              v220 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v221 = sub_227C09094();
              v223 = v222;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v221 = sub_227C091E4();
                v225 = v224;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v223 = v225;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v219, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              LOBYTE(v385) = 1;
              sub_227BFE7A0();
              v226 = v387;
              v228 = v387[2];
              v227 = v387[3];
              if (v228 >= v227 >> 1)
              {
                v226 = sub_227BFE908((_QWORD *)(v227 > 1), v228 + 1, 1, v387);
                v387 = v226;
              }
              v226[2] = v228 + 1;
              v229 = (char *)&v226[16 * v228];
              strcpy(v229 + 32, "marital-status");
              v229[47] = -18;
              *((_QWORD *)v229 + 6) = v221;
              *((_QWORD *)v229 + 7) = v223;
              *((_QWORD *)v229 + 8) = v216;
              *((_QWORD *)v229 + 9) = v218;
              *((_OWORD *)v229 + 5) = 0u;
              *((_OWORD *)v229 + 6) = 0u;
              *((_OWORD *)v229 + 7) = 0u;
              *((_QWORD *)v229 + 16) = 0;
              *((_DWORD *)v229 + 34) = v379;
              *((_QWORD *)v229 + 18) = 0;
              v229[152] = 1;
              v158 = (uint64_t)v376;
            }
            v230 = objc_msgSend(v383, sel_subject);
            v231 = objc_msgSend(v230, sel_race);

            if (v231)
            {
              v232 = sub_227C091D8();
              v234 = v233;

              v235 = (uint64_t)v353;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v353, 1, 1, v378);
              v236 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v237 = sub_227C09094();
              v239 = v238;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v237 = sub_227C091E4();
                v241 = v240;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v239 = v241;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v235, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              LOBYTE(v385) = 1;
              sub_227BFE7A0();
              v242 = v387;
              v244 = v387[2];
              v243 = v387[3];
              if (v244 >= v243 >> 1)
              {
                v242 = sub_227BFE908((_QWORD *)(v243 > 1), v244 + 1, 1, v387);
                v387 = v242;
              }
              v242[2] = v244 + 1;
              v245 = &v242[16 * v244];
              v245[4] = 1701011826;
              v245[5] = 0xE400000000000000;
              v245[6] = v237;
              v245[7] = v239;
              v245[8] = v232;
              v245[9] = v234;
              *((_OWORD *)v245 + 5) = 0u;
              *((_OWORD *)v245 + 6) = 0u;
              *((_OWORD *)v245 + 7) = 0u;
              v245[16] = 0;
              *((_DWORD *)v245 + 34) = v379;
              v245[18] = 0;
              *((_BYTE *)v245 + 152) = 1;
              v158 = (uint64_t)v376;
            }
            v246 = objc_msgSend(v383, sel_subject);
            v247 = objc_msgSend(v246, sel_ethnicity);

            if (v247)
            {
              v248 = sub_227C091D8();
              v250 = v249;

              ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t))v377)(v158, 1, 1, v378);
              v251 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v252 = sub_227C09094();
              v254 = v253;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v252 = sub_227C091E4();
                v256 = v255;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v254 = v256;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v158, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              LOBYTE(v385) = 1;
              sub_227BFE7A0();
              v257 = v387;
              v259 = v387[2];
              v258 = v387[3];
              if (v259 >= v258 >> 1)
              {
                v257 = sub_227BFE908((_QWORD *)(v258 > 1), v259 + 1, 1, v387);
                v387 = v257;
              }
              v257[2] = v259 + 1;
              v260 = &v257[16 * v259];
              v260[4] = 0x746963696E687465;
              v260[5] = 0xE900000000000079;
              v260[6] = v252;
              v260[7] = v254;
              v260[8] = v248;
              v260[9] = v250;
              *((_OWORD *)v260 + 5) = 0u;
              *((_OWORD *)v260 + 6) = 0u;
              *((_OWORD *)v260 + 7) = 0u;
              v260[16] = 0;
              *((_DWORD *)v260 + 34) = v379;
              v260[18] = 0;
              *((_BYTE *)v260 + 152) = 1;
            }
            v261 = objc_msgSend(v383, sel_subject);
            v262 = objc_msgSend(v261, sel_birthSex);

            if (v262)
            {
              v263 = sub_227C091D8();
              v265 = v264;

              v266 = (uint64_t)v354;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v354, 1, 1, v378);
              v267 = objc_msgSend(v381, sel_bundleForClass_, v382);
              v268 = sub_227C09094();
              v270 = v269;

              if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
              {
                v268 = sub_227C091E4();
                v272 = v271;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v270 = v272;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_227C018B4(v266, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
              LOBYTE(v385) = 1;
              sub_227BFE7A0();
              v273 = v387;
              v275 = v387[2];
              v274 = v387[3];
              if (v275 >= v274 >> 1)
              {
                v273 = sub_227BFE908((_QWORD *)(v274 > 1), v275 + 1, 1, v387);
                v387 = v273;
              }
              v273[2] = v275 + 1;
              v276 = &v273[16 * v275];
              v276[4] = 0x65732D6874726962;
              v276[5] = 0xE900000000000078;
              v276[6] = v268;
              v276[7] = v270;
              v276[8] = v263;
              v276[9] = v265;
              *((_OWORD *)v276 + 5) = 0u;
              *((_OWORD *)v276 + 6) = 0u;
              *((_OWORD *)v276 + 7) = 0u;
              v276[16] = 0;
              *((_DWORD *)v276 + 34) = v379;
              v276[18] = 0;
              *((_BYTE *)v276 + 152) = 1;
            }
            v277 = v375;
            swift_retain();
            *(_QWORD *)&v374 = sub_227C019E8(v357, v277);
            v376 = v61;
            swift_release();
            swift_release();
            v278 = swift_allocObject();
            *(_OWORD *)(v278 + 16) = xmmword_227C09960;
            v279 = (uint64_t)v361;
            ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v361, 1, 1, v378);
            v280 = objc_msgSend(v381, sel_bundleForClass_, v382);
            v281 = sub_227C09094();
            v283 = v282;

            if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
            {
              v281 = sub_227C091E4();
              v285 = v284;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v283 = v285;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            v286 = (uint64_t)v362;
            sub_227C018B4(v279, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
            v287 = objc_msgSend(v383, sel_recordIssuerDisplayName);
            v288 = sub_227C091D8();
            v290 = v289;

            *(_QWORD *)(v278 + 32) = 0x622D726575737369;
            *(_QWORD *)(v278 + 40) = 0xEB000000006B6361;
            *(_QWORD *)(v278 + 48) = v281;
            *(_QWORD *)(v278 + 56) = v283;
            *(_QWORD *)(v278 + 64) = v288;
            *(_QWORD *)(v278 + 72) = v290;
            *(_OWORD *)(v278 + 80) = 0u;
            *(_OWORD *)(v278 + 96) = 0u;
            *(_QWORD *)(v278 + 128) = 0;
            v291 = MEMORY[0x24BEE4AF8];
            *(_QWORD *)(v278 + 112) = MEMORY[0x24BEE4AF8];
            *(_QWORD *)(v278 + 120) = 0;
            *(_DWORD *)(v278 + 136) = v379;
            *(_QWORD *)(v278 + 144) = 0;
            *(_BYTE *)(v278 + 152) = 1;
            ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t))v377)(v286, 1, 1, v378);
            v292 = objc_msgSend(v381, sel_bundleForClass_, v382);
            v293 = sub_227C09094();
            v295 = v294;

            if (*(_QWORD *)(v291 + 16))
            {
              v293 = sub_227C091E4();
              v297 = v296;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v295 = v297;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            sub_227C018B4(v286, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
            v298 = HKSignedClinicalDataRecord.detailSignatureStatusPlainString.getter();
            *(_QWORD *)(v278 + 160) = 0xD000000000000010;
            *(_QWORD *)(v278 + 168) = 0x8000000227C0A7D0;
            *(_QWORD *)(v278 + 176) = v293;
            *(_QWORD *)(v278 + 184) = v295;
            *(_QWORD *)(v278 + 192) = v298;
            *(_QWORD *)(v278 + 200) = v299;
            *(_OWORD *)(v278 + 208) = 0u;
            *(_OWORD *)(v278 + 224) = 0u;
            *(_OWORD *)(v278 + 240) = 0u;
            *(_QWORD *)(v278 + 256) = 0;
            *(_DWORD *)(v278 + 264) = v379;
            *(_QWORD *)(v278 + 272) = 0;
            *(_QWORD *)&v379 = v278 + 280;
            *(_BYTE *)(v278 + 280) = 1;
            v300 = (uint64_t)v363;
            ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v363, 1, 1, v378);
            v301 = objc_msgSend(v381, sel_bundleForClass_, v382);
            v302 = sub_227C09094();
            v304 = v303;

            if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
            {
              *(_QWORD *)&v373 = sub_227C091E4();
              v306 = v305;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v304 = v306;
              v307 = v372;
            }
            else
            {
              swift_bridgeObjectRelease();
              v307 = v372;
              *(_QWORD *)&v373 = v302;
            }
            sub_227C018B4(v300, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
            v308 = sub_227BF80D0();
            v309 = v383;
            v310 = objc_msgSend(v383, sel_issuedDate);
            v311 = v370;
            sub_227C09124();

            v312 = (void *)sub_227C09100();
            v313 = v371;
            v369 = *(void (**)(char *, uint64_t))(v371 + 8);
            v369(v311, v307);
            v314 = objc_msgSend(v308, sel_stringFromDate_, v312);

            v315 = sub_227C091D8();
            v317 = v316;

            *(_QWORD *)(v278 + 288) = 0x642D646575737369;
            *(_QWORD *)(v278 + 296) = 0xEB00000000657461;
            *(_QWORD *)(v278 + 304) = v373;
            *(_QWORD *)(v278 + 312) = v304;
            *(_QWORD *)(v278 + 320) = v315;
            *(_QWORD *)(v278 + 328) = v317;
            *(_OWORD *)(v278 + 336) = 0u;
            *(_OWORD *)(v278 + 352) = 0u;
            *(_OWORD *)(v278 + 368) = 0u;
            *(_QWORD *)(v278 + 384) = 0;
            v373 = 0x2020502uLL;
            *(_DWORD *)(v278 + 392) = 33686786;
            *(_QWORD *)(v278 + 400) = 0;
            *(_BYTE *)(v379 + 128) = 1;
            v385 = (_QWORD *)v278;
            v318 = objc_msgSend(v309, sel_expirationDate);
            if (v318)
            {
              v319 = v318;
              sub_227C09124();

              v320 = *(void (**)(char *, char *, uint64_t))(v313 + 32);
              v321 = (uint64_t)v367;
              v320(v367, v311, v307);
              (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v313 + 56))(v321, 0, 1, v307);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v313 + 48))(v321, 1, v307) != 1)
              {
                v322 = v307;
                v323 = v346;
                v320(v346, (char *)v321, v322);
                v324 = (uint64_t)v345;
                ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v345, 1, 1, v378);
                v325 = objc_msgSend(v381, sel_bundleForClass_, v382);
                v326 = sub_227C09094();
                v328 = v327;

                if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
                {
                  v326 = sub_227C091E4();
                  v330 = v329;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v328 = v330;
                }
                else
                {
                  swift_bridgeObjectRelease();
                }
                sub_227C018B4(v324, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
                v331 = sub_227BF80D0();
                v332 = (void *)sub_227C09100();
                v333 = objc_msgSend(v331, sel_stringFromDate_, v332);

                v334 = sub_227C091D8();
                v336 = v335;

                LOBYTE(v384) = 1;
                sub_227BFE7A0();
                v337 = v385;
                v339 = v385[2];
                v338 = v385[3];
                if (v339 >= v338 >> 1)
                {
                  v337 = sub_227BFE908((_QWORD *)(v338 > 1), v339 + 1, 1, v385);
                  v385 = v337;
                }
                v337[2] = v339 + 1;
                v340 = &v337[16 * v339];
                v340[4] = 0x6974617269707865;
                v340[5] = 0xEF657461642D6E6FLL;
                v340[6] = v326;
                v340[7] = v328;
                v340[8] = v334;
                v340[9] = v336;
                *((_OWORD *)v340 + 5) = 0u;
                *((_OWORD *)v340 + 6) = 0u;
                *((_OWORD *)v340 + 7) = 0u;
                v340[16] = 0;
                *((_DWORD *)v340 + 34) = v373;
                v340[18] = 0;
                *((_BYTE *)v340 + 152) = 1;
                v369(v323, v372);
                goto LABEL_129;
              }
            }
            else
            {
              v321 = (uint64_t)v367;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v313 + 56))(v367, 1, 1, v307);
            }
            sub_227C018B4(v321, &qword_25591EBE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
LABEL_129:
            v384 = v387;
            swift_bridgeObjectRetain();
            sub_227BFEBAC(v374);
            swift_bridgeObjectRetain();
            v341 = swift_bridgeObjectRetain();
            sub_227BFEBAC(v341);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            v342 = v384;
            v343 = v389;
            v344 = v368;
            *v368 = v366;
            v344[1] = v365;
            v344[2] = v364;
            v344[3] = v343;
            v344[4] = (uint64_t)v342;
            return;
          }
          v128 = (uint64_t)v347;
          ((void (*)(char *, uint64_t, uint64_t, unint64_t))v377)(v347, 1, 1, v378);
          v129 = objc_msgSend(v381, sel_bundleForClass_, v382);
          v59 = (id)sub_227C09094();
          v78 = v130;

          v76 = (char *)v371;
          v131 = v370;
          if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
          {
            v59 = (id)sub_227C091E4();
            v133 = v132;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v78 = v133;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          sub_227C018B4(v128, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
          v134 = sub_227BF80D0();
          v135 = objc_msgSend((id)v65, sel_dateForUTC);
          sub_227C09124();

          v136 = (void *)sub_227C09100();
          (*((void (**)(char *, uint64_t))v76 + 1))(v131, v372);
          v137 = objc_msgSend(v134, sel_stringFromDate_, v136);

          v77 = sub_227C091D8();
          v72 = v138;

          LOBYTE(v76) = 1;
          LOBYTE(v386) = 1;
          sub_227BFE7A0();
          v79 = v387;
          v53 = v387[2];
          v80 = v387[3];
          v52 = v53 + 1;
          if (v53 < v80 >> 1)
          {
LABEL_47:
            v79[2] = v52;
            v139 = &v79[16 * v53];
            v139[4] = 6451044;
            v139[5] = 0xE300000000000000;
            v139[6] = v59;
            v139[7] = v78;
            v139[8] = v77;
            v139[9] = v72;
            *((_OWORD *)v139 + 5) = 0u;
            *((_OWORD *)v139 + 6) = 0u;
            *((_OWORD *)v139 + 7) = 0u;
            v139[16] = 0;
            *((_DWORD *)v139 + 34) = 33621250;
            v139[18] = 0;
            *((_BYTE *)v139 + 152) = (_BYTE)v76;

            goto LABEL_48;
          }
LABEL_133:
          v79 = sub_227BFE908((_QWORD *)(v80 > 1), v52, 1, v79);
          v387 = v79;
          goto LABEL_47;
        }
LABEL_25:
        if ((v85 & 0x4000000000000000) == 0)
        {
          v86 = *(_QWORD *)(v85 + 16);
          goto LABEL_27;
        }
        goto LABEL_131;
      }
    }
    else
    {
      v78 = *(_QWORD *)(v77 + 16);
      swift_retain();
      if (v78)
        goto LABEL_10;
    }
    swift_release();
    v85 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_131;
    goto LABEL_25;
  }
  swift_release();
  __break(1u);
}

double sub_227BFD85C@<D0>(void **a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ObjCClassFromMetadata;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  double result;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;

  v4 = sub_227C09160();
  v67 = *(_QWORD *)(v4 - 8);
  v68 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_227BFA28C(0, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v62 = (char *)&v62 - v10;
  v11 = sub_227C0913C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)*a1;
  v16 = sub_227BF80D0();
  v17 = objc_msgSend(v15, sel_sortDate);
  v18 = objc_msgSend(v17, sel_date);

  sub_227C09124();
  v19 = (void *)sub_227C09100();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v20 = objc_msgSend(v16, sel_stringFromDate_, v19);

  v21 = sub_227C091D8();
  v64 = v22;
  v65 = v21;

  objc_opt_self();
  v23 = swift_dynamicCastObjCClass();
  if (!v23)
    goto LABEL_6;
  v24 = (void *)v23;
  v63 = v15;
  v25 = objc_msgSend(v24, sel_doseNumber);
  if (!v25)
  {

LABEL_6:
    type metadata accessor for SignedClinicalDataWalletPassManager();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v47 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v42 = sub_227C09094();
    v44 = v48;

    goto LABEL_9;
  }
  v26 = v25;
  v27 = sub_227C091D8();
  v29 = v28;

  v30 = objc_msgSend(v24, sel_doseQuantity);
  if (v30)
  {
    v31 = v30;
    v32 = sub_227C091D8();
    v34 = v33;

    v35 = sub_227C0916C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v9, 1, 1, v35);
    sub_227BFA28C(0, &qword_25591EC38, (uint64_t (*)(uint64_t))sub_227C01CB0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_227C09970;
    v37 = v27;
    v38 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v36 + 56) = MEMORY[0x24BEE0D00];
    v39 = sub_227C01D04();
    *(_QWORD *)(v36 + 32) = v37;
    *(_QWORD *)(v36 + 40) = v29;
    *(_QWORD *)(v36 + 96) = v38;
    *(_QWORD *)(v36 + 104) = v39;
    *(_QWORD *)(v36 + 64) = v39;
    *(_QWORD *)(v36 + 72) = v32;
    *(_QWORD *)(v36 + 80) = v34;
    type metadata accessor for SignedClinicalDataWalletPassManager();
    v40 = swift_getObjCClassFromMetadata();
    v41 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v40);
    sub_227C09094();
    v62 = v15;

    v42 = sub_227C091E4();
    v44 = v43;
    swift_bridgeObjectRelease();

    v15 = v62;
    swift_bridgeObjectRelease();
    v45 = (uint64_t)v9;
  }
  else
  {
    v49 = sub_227C0916C();
    v50 = v29;
    v51 = v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v62, 1, 1, v49);
    sub_227BFA28C(0, &qword_25591EC38, (uint64_t (*)(uint64_t))sub_227C01CB0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_227C09940;
    *(_QWORD *)(v52 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v52 + 64) = sub_227C01D04();
    *(_QWORD *)(v52 + 32) = v27;
    *(_QWORD *)(v52 + 40) = v50;
    type metadata accessor for SignedClinicalDataWalletPassManager();
    v53 = swift_getObjCClassFromMetadata();
    v54 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v53);
    sub_227C09094();

    v42 = sub_227C091E4();
    v44 = v55;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    v45 = (uint64_t)v51;
  }
  sub_227C018B4(v45, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
LABEL_9:
  v69 = 762869089;
  v70 = 0xE400000000000000;
  v56 = objc_msgSend(v15, sel_UUID);
  v57 = v66;
  sub_227C09154();

  sub_227C01C70(&qword_25591EC30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  v58 = v68;
  sub_227C09400();
  sub_227C09208();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v57, v58);
  v59 = v70;
  *(_QWORD *)a2 = v69;
  *(_QWORD *)(a2 + 8) = v59;
  *(_QWORD *)(a2 + 16) = v42;
  *(_QWORD *)(a2 + 24) = v44;
  v60 = v64;
  *(_QWORD *)(a2 + 32) = v65;
  *(_QWORD *)(a2 + 40) = v60;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_QWORD *)(a2 + 96) = 0;
  *(_QWORD *)&result = 33621249;
  *(_DWORD *)(a2 + 104) = 33621249;
  *(_QWORD *)(a2 + 112) = 0;
  *(_BYTE *)(a2 + 120) = 0;
  return result;
}

double sub_227BFDEF4(_QWORD *a1, _QWORD *a2, _QWORD **a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD **v5;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  double result;
  uint64_t v18;
  char v19;

  if (__OFADD__(*a2, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = a3;
    v10 = (_QWORD *)*a1;
    ++*a2;
    sub_227C09400();
    sub_227C09208();
    swift_bridgeObjectRelease();
    v8 = 0xEB000000002D7265;
    v18 = 0x696669746E656469;
    v11 = v10[2];
    if (v11)
    {
      v9 = v10[4];
      v4 = v10[5];
      v12 = (uint64_t)&v10[2 * v11 + 4];
      v3 = *(_QWORD *)(v12 - 16);
      v6 = *(_QWORD *)(v12 - 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v3 = 0;
      v9 = 0;
      v4 = 0;
      v6 = 0xE000000000000000;
    }
    v19 = 1;
    v7 = *v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v5 = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_6;
  }
  v7 = sub_227BFE908(0, v7[2] + 1, 1, v7);
  *v5 = v7;
LABEL_6:
  v15 = v7[2];
  v14 = v7[3];
  if (v15 >= v14 >> 1)
  {
    v7 = sub_227BFE908((_QWORD *)(v14 > 1), v15 + 1, 1, v7);
    *v5 = v7;
  }
  v7[2] = v15 + 1;
  v16 = &v7[16 * v15];
  v16[4] = v18;
  v16[5] = v8;
  v16[6] = v9;
  v16[7] = v4;
  v16[8] = v3;
  v16[9] = v6;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 6) = 0u;
  *((_OWORD *)v16 + 7) = 0u;
  v16[16] = 0;
  *(_QWORD *)&result = 33686789;
  *((_DWORD *)v16 + 34) = 33686789;
  v16[18] = 0;
  *((_BYTE *)v16 + 152) = v19;
  return result;
}

double sub_227BFE098@<D0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ObjCClassFromMetadata;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  double result;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;

  sub_227BFA28C(0, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v50 - v5;
  v7 = sub_227C09160();
  v53 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_227C0913C();
  v10 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  objc_opt_self();
  v14 = swift_dynamicCastObjCClass();
  if (!v14)
    goto LABEL_5;
  v15 = (void *)v14;
  v50 = v6;
  v16 = v13;
  if (!objc_msgSend(v15, sel_notGiven))
  {

LABEL_5:
    v54 = 0x2D64726F636572;
    v55 = 0xE700000000000000;
    v40 = objc_msgSend(v13, sel_UUID);
    sub_227C09154();

    sub_227C01C70(&qword_25591EC30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_227C09400();
    sub_227C09208();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v7);
    v52 = v55;
    v53 = v54;
    v27 = sub_227C01E48();
    v29 = v41;
    v42 = sub_227BF80D0();
    v43 = objc_msgSend(v13, sel_sortDate);
    v44 = objc_msgSend(v43, sel_date);

    sub_227C09124();
    v45 = (void *)sub_227C09100();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v51);
    v46 = objc_msgSend(v42, sel_stringFromDate_, v45);

    v35 = sub_227C091D8();
    v37 = v47;

    v38 = 1;
    v39 = 2;
    goto LABEL_6;
  }
  v17 = sub_227BF814C();
  v18 = objc_msgSend(v16, sel_sortDate);
  v19 = objc_msgSend(v18, sel_date);

  sub_227C09124();
  v20 = (void *)sub_227C09100();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v51);
  v21 = objc_msgSend(v17, sel_stringFromDate_, v20);

  v22 = sub_227C091D8();
  v24 = v23;

  v54 = 0x2D64726F636572;
  v55 = 0xE700000000000000;
  v25 = objc_msgSend(v16, sel_UUID);
  sub_227C09154();

  sub_227C01C70(&qword_25591EC30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_227C09400();
  sub_227C09208();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v7);
  v52 = v55;
  v53 = v54;
  v26 = v16;
  v27 = sub_227C01E48();
  v29 = v28;
  v30 = sub_227C0916C();
  v31 = (uint64_t)v50;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v50, 1, 1, v30);
  sub_227BFA28C(0, &qword_25591EC38, (uint64_t (*)(uint64_t))sub_227C01CB0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_227C09940;
  *(_QWORD *)(v32 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v32 + 64) = sub_227C01D04();
  *(_QWORD *)(v32 + 32) = v22;
  *(_QWORD *)(v32 + 40) = v24;
  type metadata accessor for SignedClinicalDataWalletPassManager();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v34 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_227C09094();

  v35 = sub_227C091E4();
  v37 = v36;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_227C018B4(v31, &qword_25591EBF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8]);
  v38 = 2;
  v39 = 5;
LABEL_6:
  v48 = v52;
  *(_QWORD *)a2 = v53;
  *(_QWORD *)(a2 + 8) = v48;
  *(_QWORD *)(a2 + 16) = v27;
  *(_QWORD *)(a2 + 24) = v29;
  *(_QWORD *)(a2 + 32) = v35;
  *(_QWORD *)(a2 + 40) = v37;
  result = 0.0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_QWORD *)(a2 + 96) = 0;
  *(_BYTE *)(a2 + 104) = v39;
  *(_BYTE *)(a2 + 105) = 5;
  *(_BYTE *)(a2 + 106) = v38;
  *(_BYTE *)(a2 + 107) = 2;
  *(_QWORD *)(a2 + 112) = 0;
  *(_BYTE *)(a2 + 120) = 1;
  return result;
}

id *SignedClinicalDataWalletPassManager.deinit()
{
  id *v0;

  return v0;
}

uint64_t SignedClinicalDataWalletPassManager.__deallocating_deinit()
{
  id *v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SignedClinicalDataWalletPassManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for SignedClinicalDataWalletPassManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.walletIsSupported.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.ensureCanAddPassToWallet(representing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.passUniqueIDForPassInWallet(representing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.directURLToPassInWallet(representing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.addPassToWallet(representing:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.removePassFromWallet(representing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.removePassFromWallet(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.createPassBundle(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.createPass(using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

_QWORD *sub_227BFE7A0()
{
  _QWORD **v0;
  _QWORD *v1;
  _QWORD *result;

  v1 = *v0;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_227BFE908(result, v1[2] + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

_QWORD *sub_227BFE7E8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      sub_227C01DBC(0, &qword_25591EC68, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_227C011FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_227BFE908(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      sub_227C01DBC(0, &qword_25591EC00, (uint64_t)&type metadata for WalletPassField, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 95;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 7);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 7);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_227C018F8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_227BFEA28(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_227C010FC();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_227BFEE94(v6);
  return sub_227C09328();
}

_QWORD *sub_227BFEAA0(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      sub_227C01DBC(0, &qword_25591EC18, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_227C00E40((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_227C09358();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_227BFEBAC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_227BFE908(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[16 * v9 + 4];
  if (a1 + 32 < v10 + (v8 << 7) && v10 < a1 + 32 + (v8 << 7))
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_227C09370();
  __break(1u);
  return result;
}

uint64_t sub_227BFED00(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_227BFED1C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_227BFED1C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  size_t v15;
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
        goto LABEL_32;
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
    sub_227C01DBC(0, &qword_25591EC00, (uint64_t)&type metadata for WalletPassField, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 95;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 7);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = v8 << 7;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_227C09370();
  __break(1u);
  return result;
}

void sub_227BFEE94(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char *v21;
  id v22;
  id v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  uint64_t v27;
  id *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  id v35;
  id v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  char *v56;
  id v57;
  id v58;
  char *v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  void *v62;
  char *v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  uint64_t v90;
  char v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(char *, uint64_t);
  void **v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  uint64_t v142;

  v139 = sub_227C0913C();
  v136 = *(_QWORD *)(v139 - 8);
  v2 = MEMORY[0x24BDAC7A8](v139);
  v138 = (char *)&v124 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v137 = (char *)&v124 - v4;
  v5 = a1[1];
  v6 = sub_227C093F4();
  if (v6 >= v5)
  {
    if (v5 < 0)
      goto LABEL_135;
    if (v5)
      sub_227BFF854(0, v5, 1, a1);
    return;
  }
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  if (v5 < -1)
    goto LABEL_143;
  v128 = v6;
  v125 = a1;
  if (v5 < 2)
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v142 = MEMORY[0x24BEE4AF8];
    v134 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v5 != 1)
    {
      v14 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_102:
      v116 = v135;
      if (v14 >= 2)
      {
        v117 = *v125;
        do
        {
          v118 = v14 - 2;
          if (v14 < 2)
            goto LABEL_130;
          if (!v117)
            goto LABEL_142;
          v119 = v10;
          v120 = *(_QWORD *)&v10[16 * v118 + 32];
          v121 = *(_QWORD *)&v10[16 * v14 + 24];
          sub_227BFFA60((void **)(v117 + 8 * v120), (id *)(v117 + 8 * *(_QWORD *)&v10[16 * v14 + 16]), (id *)(v117 + 8 * v121), v134);
          if (v116)
            break;
          if (v121 < v120)
            goto LABEL_131;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v119 = sub_227C000E0((uint64_t)v119);
          if (v118 >= *((_QWORD *)v119 + 2))
            goto LABEL_132;
          v122 = &v119[16 * v118 + 32];
          *(_QWORD *)v122 = v120;
          *((_QWORD *)v122 + 1) = v121;
          v123 = *((_QWORD *)v119 + 2);
          if (v14 > v123)
            goto LABEL_133;
          memmove(&v119[16 * v14 + 16], &v119[16 * v14 + 32], 16 * (v123 - v14));
          v10 = v119;
          *((_QWORD *)v119 + 2) = v123 - 1;
          v14 = v123 - 1;
        }
        while (v123 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v142 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_227C09244();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v8 = v7 >> 1;
    sub_227BF79BC(0, &qword_25591EBB0);
    v9 = sub_227C09250();
    *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    v134 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    v142 = v9;
  }
  v11 = 0;
  v12 = *a1;
  v13 = *a1 + 16;
  v126 = *a1 - 8;
  v127 = v13;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v132 = v5;
  v140 = v12;
  while (1)
  {
    v15 = v11++;
    v131 = v15;
    if (v11 < v5)
    {
      v129 = v10;
      v16 = *(void **)(v12 + 8 * v15);
      v17 = *(id *)(v12 + 8 * v11);
      v18 = v16;
      v19 = objc_msgSend(v17, sel_sortDate);
      v20 = objc_msgSend(v19, sel_date);

      v21 = v137;
      sub_227C09124();

      v22 = objc_msgSend(v18, sel_sortDate);
      v23 = objc_msgSend(v22, sel_date);

      v24 = v138;
      sub_227C09124();

      v5 = v132;
      LODWORD(v141) = sub_227C0910C();
      v25 = *(void (**)(char *, uint64_t))(v136 + 8);
      v26 = v24;
      v27 = v139;
      v25(v26, v139);
      v133 = v25;
      v25(v21, v27);

      v11 = v15 + 2;
      if (v15 + 2 < v5)
      {
        v28 = (id *)(v127 + 8 * v15);
        while (1)
        {
          v29 = *(v28 - 1);
          v30 = *v28;
          v31 = v29;
          v32 = objc_msgSend(v30, sel_sortDate);
          v33 = objc_msgSend(v32, sel_date);

          v34 = v137;
          sub_227C09124();

          v35 = objc_msgSend(v31, sel_sortDate);
          v36 = objc_msgSend(v35, sel_date);

          v37 = v138;
          sub_227C09124();

          LODWORD(v35) = sub_227C0910C();
          v38 = v37;
          v39 = v139;
          v40 = v133;
          v133(v38, v139);
          v40(v34, v39);

          if (((v141 ^ v35) & 1) != 0)
            break;
          ++v11;
          ++v28;
          v5 = v132;
          if (v132 == v11)
          {
            v11 = v132;
            goto LABEL_22;
          }
        }
        v5 = v132;
LABEL_22:
        v15 = v131;
      }
      v10 = v129;
      v12 = v140;
      if ((v141 & 1) != 0)
      {
        if (v11 < v15)
          goto LABEL_136;
        if (v15 < v11)
        {
          v41 = (uint64_t *)(v126 + 8 * v11);
          v42 = v11;
          v43 = v15;
          v44 = (uint64_t *)(v140 + 8 * v15);
          do
          {
            if (v43 != --v42)
            {
              if (!v12)
                goto LABEL_141;
              v45 = *v44;
              *v44 = *v41;
              *v41 = v45;
            }
            ++v43;
            --v41;
            ++v44;
          }
          while (v43 < v42);
        }
      }
    }
    if (v11 < v5)
    {
      if (__OFSUB__(v11, v15))
        goto LABEL_134;
      if (v11 - v15 < v128)
        break;
    }
LABEL_50:
    if (v11 < v15)
      goto LABEL_129;
    v63 = v10;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v10 = v63;
    else
      v10 = sub_227BFFF44(0, *((_QWORD *)v63 + 2) + 1, 1, v63);
    v65 = *((_QWORD *)v10 + 2);
    v64 = *((_QWORD *)v10 + 3);
    v14 = v65 + 1;
    v12 = v140;
    if (v65 >= v64 >> 1)
    {
      v115 = sub_227BFFF44((char *)(v64 > 1), v65 + 1, 1, v10);
      v12 = v140;
      v10 = v115;
    }
    *((_QWORD *)v10 + 2) = v14;
    v66 = &v10[16 * v65 + 32];
    *(_QWORD *)v66 = v15;
    *((_QWORD *)v66 + 1) = v11;
    if (v65)
    {
      v67 = v10 + 32;
      while (1)
      {
        v68 = v14 - 1;
        if (v14 >= 4)
        {
          v73 = &v67[16 * v14];
          v74 = *((_QWORD *)v73 - 8);
          v75 = *((_QWORD *)v73 - 7);
          v79 = __OFSUB__(v75, v74);
          v76 = v75 - v74;
          if (v79)
            goto LABEL_118;
          v78 = *((_QWORD *)v73 - 6);
          v77 = *((_QWORD *)v73 - 5);
          v79 = __OFSUB__(v77, v78);
          v71 = v77 - v78;
          v72 = v79;
          if (v79)
            goto LABEL_119;
          v80 = v14 - 2;
          v81 = &v67[16 * v14 - 32];
          v83 = *(_QWORD *)v81;
          v82 = *((_QWORD *)v81 + 1);
          v79 = __OFSUB__(v82, v83);
          v84 = v82 - v83;
          if (v79)
            goto LABEL_121;
          v79 = __OFADD__(v71, v84);
          v85 = v71 + v84;
          if (v79)
            goto LABEL_124;
          if (v85 >= v76)
          {
            v103 = &v67[16 * v68];
            v105 = *(_QWORD *)v103;
            v104 = *((_QWORD *)v103 + 1);
            v79 = __OFSUB__(v104, v105);
            v106 = v104 - v105;
            if (v79)
              goto LABEL_128;
            v96 = v71 < v106;
            goto LABEL_88;
          }
        }
        else
        {
          if (v14 != 3)
          {
            v97 = *((_QWORD *)v10 + 4);
            v98 = *((_QWORD *)v10 + 5);
            v79 = __OFSUB__(v98, v97);
            v90 = v98 - v97;
            v91 = v79;
            goto LABEL_82;
          }
          v70 = *((_QWORD *)v10 + 4);
          v69 = *((_QWORD *)v10 + 5);
          v79 = __OFSUB__(v69, v70);
          v71 = v69 - v70;
          v72 = v79;
        }
        if ((v72 & 1) != 0)
          goto LABEL_120;
        v80 = v14 - 2;
        v86 = &v67[16 * v14 - 32];
        v88 = *(_QWORD *)v86;
        v87 = *((_QWORD *)v86 + 1);
        v89 = __OFSUB__(v87, v88);
        v90 = v87 - v88;
        v91 = v89;
        if (v89)
          goto LABEL_123;
        v92 = &v67[16 * v68];
        v94 = *(_QWORD *)v92;
        v93 = *((_QWORD *)v92 + 1);
        v79 = __OFSUB__(v93, v94);
        v95 = v93 - v94;
        if (v79)
          goto LABEL_126;
        if (__OFADD__(v90, v95))
          goto LABEL_127;
        if (v90 + v95 >= v71)
        {
          v96 = v71 < v95;
LABEL_88:
          if (v96)
            v68 = v80;
          goto LABEL_90;
        }
LABEL_82:
        if ((v91 & 1) != 0)
          goto LABEL_122;
        v99 = &v67[16 * v68];
        v101 = *(_QWORD *)v99;
        v100 = *((_QWORD *)v99 + 1);
        v79 = __OFSUB__(v100, v101);
        v102 = v100 - v101;
        if (v79)
          goto LABEL_125;
        if (v102 < v90)
          goto LABEL_14;
LABEL_90:
        v107 = v68 - 1;
        if (v68 - 1 >= v14)
        {
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
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
          goto LABEL_138;
        }
        if (!v12)
          goto LABEL_140;
        v108 = v10;
        v109 = &v67[16 * v107];
        v110 = *(_QWORD *)v109;
        v111 = &v67[16 * v68];
        v112 = *((_QWORD *)v111 + 1);
        v113 = v135;
        sub_227BFFA60((void **)(v12 + 8 * *(_QWORD *)v109), (id *)(v12 + 8 * *(_QWORD *)v111), (id *)(v12 + 8 * v112), v134);
        v135 = v113;
        if (v113)
          goto LABEL_113;
        if (v112 < v110)
          goto LABEL_115;
        if (v68 > *((_QWORD *)v108 + 2))
          goto LABEL_116;
        *(_QWORD *)v109 = v110;
        *(_QWORD *)&v67[16 * v107 + 8] = v112;
        v114 = *((_QWORD *)v108 + 2);
        if (v68 >= v114)
          goto LABEL_117;
        v14 = v114 - 1;
        memmove(&v67[16 * v68], v111 + 16, 16 * (v114 - 1 - v68));
        v10 = v108;
        *((_QWORD *)v108 + 2) = v114 - 1;
        v12 = v140;
        if (v114 <= 2)
          goto LABEL_14;
      }
    }
    v14 = 1;
LABEL_14:
    v5 = v132;
    if (v11 >= v132)
      goto LABEL_102;
  }
  if (__OFADD__(v15, v128))
    goto LABEL_137;
  if (v15 + v128 >= v5)
    v46 = v5;
  else
    v46 = v15 + v128;
  if (v46 >= v15)
  {
    if (v11 != v46)
    {
      v129 = v10;
      v130 = v46;
      v47 = (void (*)(char *, uint64_t))(v126 + 8 * v11);
      do
      {
        v48 = *(void **)(v12 + 8 * v11);
        v49 = v15;
        v133 = v47;
        while (1)
        {
          v50 = v11;
          v51 = *(void **)v47;
          v52 = v48;
          v141 = v52;
          v53 = v51;
          v54 = objc_msgSend(v52, sel_sortDate);
          v55 = objc_msgSend(v54, sel_date);

          v56 = v137;
          sub_227C09124();

          v57 = objc_msgSend(v53, sel_sortDate);
          v58 = objc_msgSend(v57, sel_date);

          v59 = v138;
          sub_227C09124();

          LOBYTE(v57) = sub_227C0910C();
          v60 = *(void (**)(char *, uint64_t))(v136 + 8);
          v61 = v139;
          v60(v59, v139);
          v60(v56, v61);

          if ((v57 & 1) == 0)
            break;
          v12 = v140;
          if (!v140)
            goto LABEL_139;
          v11 = v50;
          v62 = *(_QWORD *)v47;
          v48 = (void *)*((_QWORD *)v47 + 1);
          *(_QWORD *)v47 = v48;
          *((_QWORD *)v47 + 1) = v62;
          v47 = (void (*)(char *, uint64_t))((char *)v47 - 8);
          if (v50 == ++v49)
            goto LABEL_43;
        }
        v12 = v140;
        v11 = v50;
LABEL_43:
        ++v11;
        v47 = (void (*)(char *, uint64_t))((char *)v133 + 8);
        v15 = v131;
      }
      while (v11 != v130);
      v11 = v130;
      v10 = v129;
    }
    goto LABEL_50;
  }
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
  sub_227C0934C();
  __break(1u);
}

void sub_227BFF854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v30 = a1;
  v7 = sub_227C0913C();
  v34 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v33 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v32 = (char *)&v28 - v10;
  v29 = a2;
  if (a3 != a2)
  {
    v36 = *a4;
    v11 = v36 + 8 * a3 - 8;
    v12 = v32;
LABEL_5:
    v13 = *(void **)(v36 + 8 * a3);
    v14 = v30;
    v31 = v11;
    v37 = a3;
    while (1)
    {
      v15 = *(void **)v11;
      v16 = v13;
      v17 = v15;
      v18 = objc_msgSend(v16, sel_sortDate);
      v19 = objc_msgSend(v18, sel_date);

      sub_227C09124();
      v20 = objc_msgSend(v17, sel_sortDate);
      v21 = objc_msgSend(v20, sel_date);

      v22 = v33;
      sub_227C09124();

      LOBYTE(v20) = sub_227C0910C();
      v23 = *(void (**)(char *, uint64_t))(v34 + 8);
      v24 = v22;
      v25 = v35;
      v23(v24, v35);
      v23(v12, v25);
      v26 = v37;

      if ((v20 & 1) == 0)
      {
LABEL_4:
        a3 = v26 + 1;
        v11 = v31 + 8;
        if (a3 == v29)
          return;
        goto LABEL_5;
      }
      if (!v36)
        break;
      v27 = *(void **)v11;
      v13 = *(void **)(v11 + 8);
      *(_QWORD *)v11 = v13;
      *(_QWORD *)(v11 + 8) = v27;
      v11 -= 8;
      if (v26 == ++v14)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_227BFFA60(void **a1, id *a2, id *a3, void **a4)
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
  char *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  id *v28;
  void **v29;
  void **v30;
  id *v31;
  id *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char *v41;
  id v42;
  id v43;
  char *v44;
  void (*v45)(char *, uint64_t);
  char *v46;
  uint64_t v47;
  void **v48;
  uint64_t result;
  uint64_t v50;
  void **v51;
  id v52;
  void **v53;
  id *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  void **v59;
  void **v60;
  void **v61;
  id *v62;

  v8 = sub_227C0913C();
  v57 = *(_QWORD *)(v8 - 8);
  v58 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v56 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v54 = a3;
  v55 = (char *)&v50 - v11;
  v12 = (char *)a2 - (char *)a1;
  v13 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0)
    v13 = (char *)a2 - (char *)a1;
  v14 = v13 >> 3;
  v15 = (char *)a3 - (char *)a2;
  v16 = v15 / 8;
  v62 = a1;
  v61 = a4;
  if (v13 >> 3 >= v15 / 8)
  {
    if (v15 < -7)
      goto LABEL_43;
    if (a4 != a2 || &a2[v16] <= a4)
      memmove(a4, a2, 8 * v16);
    v30 = &a4[v16];
    v60 = v30;
    v62 = a2;
    if (v15 < 8 || a1 >= a2)
      goto LABEL_42;
    v31 = v54 - 1;
    v32 = a2;
    v59 = a4;
    v51 = a1;
    while (1)
    {
      v53 = v30;
      v54 = v31 + 1;
      v35 = *--v30;
      v34 = v35;
      v36 = *--v32;
      v37 = v34;
      v52 = v37;
      v38 = v36;
      v39 = objc_msgSend(v37, sel_sortDate);
      v40 = objc_msgSend(v39, sel_date);

      v41 = v55;
      sub_227C09124();

      v42 = objc_msgSend(v38, sel_sortDate);
      v43 = objc_msgSend(v42, sel_date);

      v44 = v56;
      sub_227C09124();

      LOBYTE(v42) = sub_227C0910C();
      v45 = *(void (**)(char *, uint64_t))(v57 + 8);
      v46 = v44;
      v47 = v58;
      v45(v46, v58);
      v45(v41, v47);

      if ((v42 & 1) != 0)
        break;
      v60 = v30;
      if (v54 < v53 || v31 >= v53)
      {
        *v31 = *v30;
        v32 = a2;
        goto LABEL_30;
      }
      v48 = v59;
      v33 = (unint64_t)v51;
      if (v54 != v53)
        *v31 = *v30;
      v32 = a2;
      if (v30 <= v48)
        goto LABEL_42;
LABEL_31:
      --v31;
      a2 = v32;
      if ((unint64_t)v32 <= v33)
        goto LABEL_42;
    }
    v30 = v53;
    if (v54 != a2 || v31 >= a2)
      *v31 = *v32;
    v62 = v32;
LABEL_30:
    v33 = (unint64_t)v51;
    if (v30 <= v59)
      goto LABEL_42;
    goto LABEL_31;
  }
  if (v12 >= -7)
  {
    if (a4 != a1 || &a1[v14] <= a4)
      memmove(a4, a1, 8 * v14);
    v53 = &a4[v14];
    v60 = v53;
    if (v12 >= 8 && a2 < v54)
    {
      v17 = v55;
      do
      {
        v59 = a4;
        v18 = *a4;
        v19 = *a2;
        v20 = v18;
        v21 = objc_msgSend(v19, sel_sortDate);
        v22 = objc_msgSend(v21, sel_date);

        sub_227C09124();
        v23 = objc_msgSend(v20, sel_sortDate);
        v24 = objc_msgSend(v23, sel_date);

        v25 = v56;
        sub_227C09124();

        LOBYTE(v23) = sub_227C0910C();
        v26 = v58;
        v27 = *(void (**)(char *, uint64_t))(v57 + 8);
        v27(v25, v58);
        v27(v17, v26);

        if ((v23 & 1) != 0)
        {
          v28 = a2 + 1;
          a4 = v59;
          if (a1 < a2 || a1 >= v28 || a1 != a2)
            *a1 = *a2;
        }
        else
        {
          v29 = v59;
          if (a1 != v59)
            *a1 = *v59;
          a4 = v29 + 1;
          v61 = a4;
          v28 = a2;
        }
        v62 = ++a1;
        if (a4 >= v53)
          break;
        a2 = v28;
      }
      while (v28 < v54);
    }
LABEL_42:
    sub_227C00038((void **)&v62, (const void **)&v61, &v60);
    return 1;
  }
LABEL_43:
  result = sub_227C09370();
  __break(1u);
  return result;
}

char *sub_227BFFF44(char *result, int64_t a2, char a3, char *a4)
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
    sub_227C01D48();
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

char *sub_227C00038(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_227C09370();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_227C000E0(uint64_t a1)
{
  return sub_227BFFF44(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_227C000F4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_227C0946C();
  swift_bridgeObjectRetain();
  sub_227C091FC();
  v8 = sub_227C09484();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_227C09418() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_227C09418() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_227C00598(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_227C002A0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  sub_227C01E00(0, &qword_25591EC70, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], MEMORY[0x24BEE24D8]);
  v3 = sub_227C092D4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_227C0946C();
      sub_227C091FC();
      result = sub_227C09484();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_227C00598(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_227C002A0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_227C00730();
      goto LABEL_22;
    }
    sub_227C008FC();
  }
  v11 = *v4;
  sub_227C0946C();
  sub_227C091FC();
  result = sub_227C09484();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_227C09418(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_227C09424();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_227C09418();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_227C00730()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_227C01E00(0, &qword_25591EC70, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], MEMORY[0x24BEE24D8]);
  v2 = *v0;
  v3 = sub_227C092C8();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_227C008FC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_227C01E00(0, &qword_25591EC70, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], MEMORY[0x24BEE24D8]);
  v3 = sub_227C092D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_227C0946C();
    swift_bridgeObjectRetain();
    sub_227C091FC();
    result = sub_227C09484();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void (*sub_227C00BC4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_227C00C44(v6, a2, a3);
  return sub_227C00C18;
}

void sub_227C00C18(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_227C00C44(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x22E2A6368](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_227C00CB0;
  }
  __break(1u);
  return result;
}

void sub_227C00CB0(id *a1)
{

}

uint64_t sub_227C00CB8(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = result;
  if (!(a2 >> 62))
  {
    if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10) >= result)
      goto LABEL_3;
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  v3 = sub_227C09358();
  result = swift_bridgeObjectRelease();
  if (v3 < v2)
    goto LABEL_6;
LABEL_3:
  if (v2 < 0)
LABEL_7:
    __break(1u);
  return result;
}

uint64_t sub_227C00D34(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = result;
  if ((a3 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (a2 < result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (result == a2)
  {
LABEL_7:
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = sub_227C09364();
      swift_bridgeObjectRelease();
      return v7;
    }
    if ((a2 & 0x8000000000000000) == 0)
    {
      v7 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      return v7;
    }
    __break(1u);
    goto LABEL_13;
  }
  if (result < a2)
  {
    sub_227BF79BC(0, &qword_25591EBB0);
    result = v5;
    do
    {
      v6 = result + 1;
      sub_227C092F8();
      result = v6;
    }
    while (a2 != v6);
    goto LABEL_7;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_227C00E40(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_227C09358();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_227C09358();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_227C01C0C();
        sub_227C01C70(&qword_25591EC28, (uint64_t (*)(uint64_t))sub_227C01C0C, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_227C00BC4(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_227BF79BC(0, &qword_25591EBB0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_227C09370();
  __break(1u);
  return result;
}

uint64_t sub_227C0105C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

void sub_227C010FC()
{
  JUMPOUT(0x22E2A644CLL);
}

uint64_t sub_227C01110(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_227C01168(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_227C09268();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_227C000F4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_227C011FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_227C09370();
  __break(1u);
  return result;
}

uint64_t sub_227C012EC(void *a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v2 = objc_msgSend(a1, sel_credentialTypes);
  v3 = (_QWORD *)sub_227C09238();

  v4 = sub_227C091D8();
  sub_227BF79F4(v4, v5, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for SignedClinicalDataWalletPassManager();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = sub_227C09094();

  v9 = objc_msgSend(a1, sel_items, 0xE000000000000000);
  sub_227BF79BC(0, (unint64_t *)&qword_25591EC60);
  v10 = sub_227C09238();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_227C09358();
    v11 = result;
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v30 = v8;
  v29 = ObjCClassFromMetadata;
  if (!v11)
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  if (v11 >= 1)
  {
    v13 = 0;
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v10 & 0xC000000000000001) != 0)
        v15 = (id)MEMORY[0x22E2A6368](v13, v10);
      else
        v15 = *(id *)(v10 + 8 * v13 + 32);
      v16 = v15;
      v17 = objc_msgSend(v15, sel_primaryConcept);
      v18 = objc_msgSend(v17, sel_localizedPreferredName);

      if (v18)
      {
        v19 = sub_227C091D8();
        v21 = v20;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v14 = sub_227BFE7E8(0, v14[2] + 1, 1, v14);
        v23 = v14[2];
        v22 = v14[3];
        if (v23 >= v22 >> 1)
          v14 = sub_227BFE7E8((_QWORD *)(v22 > 1), v23 + 1, 1, v14);
        v14[2] = v23 + 1;
        v24 = &v14[2 * v23];
        v24[4] = v19;
        v24[5] = v21;
      }
      else
      {

      }
      ++v13;
    }
    while (v11 != v13);
LABEL_18:
    swift_bridgeObjectRelease_n();
    v25 = sub_227C01168((uint64_t)v14);
    swift_bridgeObjectRelease();
    sub_227BF7FD0(v25);
    if (v26)
    {
      v27 = *(_QWORD *)(v25 + 16);
      swift_bridgeObjectRelease();
      if (v27 == 1)
        return v30;
      swift_bridgeObjectRelease();
      v28 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v29);
      sub_227C09094();
    }
    else
    {
      swift_bridgeObjectRelease();
      v28 = objc_msgSend(a1, sel_recordItemsDisplayName);
      sub_227C091D8();
    }

    return v30;
  }
  __break(1u);
  return result;
}

void sub_227C01704(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[25];
  void *v24;
  _OWORD v25[6];
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;

  v4 = a3 >> 1;
  v28 = a2;
  v5 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
    goto LABEL_18;
  v6 = v3;
  if (v5)
  {
    v27 = MEMORY[0x24BEE4AF8];
    sub_227BFED00(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
LABEL_19:
      __break(1u);
      return;
    }
    v8 = 0;
    v9 = v27;
    v10 = a1 - 8;
    v11 = 1;
    while (!v8 && v4 > v28)
    {
      v24 = *(void **)(v10 + 8 * v4);
      v12 = v24;
      sub_227BFD85C(&v24, (uint64_t)v25);
      if (v6)
      {
        swift_release();

        return;
      }
      v6 = 0;

      v19 = v25[2];
      v20 = v25[3];
      *(_OWORD *)&v23[9] = *(_OWORD *)((char *)v26 + 9);
      v22 = v25[5];
      *(_OWORD *)v23 = v26[0];
      v21 = v25[4];
      v17 = v25[0];
      v18 = v25[1];
      v27 = v9;
      v14 = *(_QWORD *)(v9 + 16);
      v13 = *(_QWORD *)(v9 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_227BFED00(v13 > 1, v14 + 1, 1);
        v9 = v27;
      }
      *(_QWORD *)(v9 + 16) = v14 + 1;
      v15 = (_OWORD *)(v9 + (v14 << 7));
      v15[4] = v19;
      v15[5] = v20;
      v15[2] = v17;
      v15[3] = v18;
      *(_OWORD *)((char *)v15 + 137) = *(_OWORD *)&v23[9];
      v15[7] = v22;
      v15[8] = *(_OWORD *)v23;
      v15[6] = v21;
      if (v5 == v11)
        return;
      v8 = v11 >= v5;
      --v4;
      if (__OFADD__(v11++, 1))
        goto LABEL_17;
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
}

uint64_t sub_227C018B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_227BFA28C(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_227C018F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 7) + 32;
    v6 = a3 + (v4 << 7);
    if (v5 >= v6 || v5 + (v4 << 7) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_227C09370();
  __break(1u);
  return result;
}

uint64_t sub_227C019E8(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[25];
  void *v21;
  _OWORD v22[6];
  _OWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v25 = a2;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_227C09358();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = MEMORY[0x24BEE4AF8];
  if (!v5)
    return v6;
  v24 = MEMORY[0x24BEE4AF8];
  result = sub_227BFED00(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v8 = 0;
    v6 = v24;
    while (1)
    {
      v9 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22E2A6368](v8, a1) : *(id *)(a1 + 8 * v8 + 32);
      v10 = v9;
      v21 = v9;
      sub_227BFE098(&v21, (uint64_t)v22);
      if (v3)
        break;
      v3 = 0;

      v16 = v22[2];
      v17 = v22[3];
      *(_OWORD *)&v20[9] = *(_OWORD *)((char *)v23 + 9);
      v19 = v22[5];
      *(_OWORD *)v20 = v23[0];
      v18 = v22[4];
      v14 = v22[0];
      v15 = v22[1];
      v24 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      v11 = *(_QWORD *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_227BFED00(v11 > 1, v12 + 1, 1);
        v6 = v24;
      }
      ++v8;
      *(_QWORD *)(v6 + 16) = v12 + 1;
      v13 = (_OWORD *)(v6 + (v12 << 7));
      v13[4] = v16;
      v13[5] = v17;
      v13[2] = v14;
      v13[3] = v15;
      *(_OWORD *)((char *)v13 + 137) = *(_OWORD *)&v20[9];
      v13[7] = v19;
      v13[8] = *(_OWORD *)v20;
      v13[6] = v18;
      if (v5 == v8)
        return v6;
    }
    swift_release();

    return v6;
  }
  __break(1u);
  return result;
}

unint64_t sub_227C01BA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25591EC10;
  if (!qword_25591EC10)
  {
    sub_227C01DBC(255, &qword_25591EC08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x22E2A67C4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25591EC10);
  }
  return result;
}

void sub_227C01C0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25591EC20)
  {
    sub_227BF79BC(255, &qword_25591EBB0);
    v0 = sub_227C0925C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25591EC20);
  }
}

uint64_t sub_227C01C70(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2A67C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_227C01CB0()
{
  unint64_t result;

  result = qword_25591EC40;
  if (!qword_25591EC40)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_25591EC40);
  }
  return result;
}

unint64_t sub_227C01D04()
{
  unint64_t result;

  result = qword_25591EC48;
  if (!qword_25591EC48)
  {
    result = MEMORY[0x22E2A67C4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25591EC48);
  }
  return result;
}

void sub_227C01D48()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25591EC50)
  {
    sub_227C01E00(255, &qword_25591EC58, MEMORY[0x24BEE1768], MEMORY[0x24BEE1780], MEMORY[0x24BEE1B68]);
    v0 = sub_227C0940C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25591EC50);
  }
}

void sub_227C01DBC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_227C01E00(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(0, a3, a4);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_227C01E48()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v13;
  uint64_t v14;

  v1 = objc_msgSend(v0, sel_primaryConcept);
  v2 = objc_msgSend(v1, sel_localizedPreferredName);

  if (v2)
  {
    v3 = sub_227C091D8();
    v5 = v4;

    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v3 & 0xFFFFFFFFFFFFLL;
    if (v6)
      return v3;
    swift_bridgeObjectRelease();
  }
  v7 = sub_227C01F60();
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = v7 & 0xFFFFFFFFFFFFLL;
  if (v9)
    return v7;
  swift_bridgeObjectRelease();
  v7 = sub_227C02174();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v7 & 0xFFFFFFFFFFFFLL;
  if (v11)
    return v7;
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v0, sel_fallbackDisplayString);
  v14 = sub_227C091D8();

  return v14;
}

uint64_t sub_227C01F60()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  id v15;

  v1 = objc_msgSend(v0, sel_medicalRecordCodings);
  sub_227BF79BC(0, &qword_25591EC78);
  v2 = sub_227C09238();

  if (v2 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    v3 = sub_227C09358();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      v15 = (id)objc_opt_self();
      v4 = 4;
      do
      {
        if ((v2 & 0xC000000000000001) != 0)
          v5 = (id)MEMORY[0x22E2A6368](v4 - 4, v2);
        else
          v5 = *(id *)(v2 + 8 * v4);
        v6 = v5;
        v7 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
        {
          __break(1u);
          goto LABEL_16;
        }
        v8 = objc_msgSend(v5, sel_codingSystem);
        v9 = objc_msgSend(v15, sel_textSystem);
        if (v8)
        {
          sub_227BF79BC(0, &qword_25591EC80);
          v10 = v8;
          v11 = sub_227C09280();

          if ((v11 & 1) != 0)
          {
            swift_bridgeObjectRelease_n();
            v12 = objc_msgSend(v6, sel_displayString);

            if (!v12)
              return 0;
            v13 = sub_227C091D8();

            return v13;
          }
          v9 = v6;
        }
        else
        {

        }
        ++v4;
      }
      while (v7 != v3);
    }
  }
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t sub_227C02174()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v1 = objc_msgSend(v0, sel_medicalRecordCodings);
  sub_227BF79BC(0, &qword_25591EC78);
  v2 = sub_227C09238();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  v3 = sub_227C09358();
  if (!v3)
    goto LABEL_17;
LABEL_3:
  v4 = 4;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x22E2A6368](v4 - 4, v2);
    else
      v5 = *(id *)(v2 + 8 * v4);
    v6 = v5;
    v7 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_16;
    }
    v8 = objc_msgSend(v5, sel_displayString);
    if (v8)
    {
      v9 = v8;
      v10 = sub_227C091D8();
      v12 = v11;

      swift_bridgeObjectRelease();
      v13 = HIBYTE(v12) & 0xF;
      if ((v12 & 0x2000000000000000) == 0)
        v13 = v10 & 0xFFFFFFFFFFFFLL;
      if (v13)
        break;
    }

    ++v4;
    if (v7 == v3)
      goto LABEL_17;
  }
  swift_bridgeObjectRelease_n();
  v14 = objc_msgSend(v6, sel_displayString);

  if (!v14)
    return 0;
  v15 = sub_227C091D8();

  return v15;
}

unint64_t HKSignedClinicalDataRecord.appLaunchURL.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  void (*v16)(char *, char *, uint64_t);
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;

  sub_227C037F8(0, (unint64_t *)&qword_25591EBA0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v29 - v2;
  v4 = sub_227C09160();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v29 - v9;
  v11 = objc_msgSend(v0, sel_items);
  sub_227C02788();
  v12 = sub_227C09238();

  if (!(v12 >> 62))
  {
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v18 = sub_227C09358();
  swift_bridgeObjectRelease();
  if (!v18)
    goto LABEL_9;
LABEL_3:
  if ((v12 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x22E2A6368](0, v12);
LABEL_6:
    v14 = v13;
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v14, sel_medicalRecordSampleID);

    sub_227C09154();
    v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v16(v3, v8, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
    {
      v16(v10, v3, v4);
      v30 = 0;
      v31 = 0xE000000000000000;
      sub_227C092E0();
      swift_bridgeObjectRelease();
      v30 = 0xD000000000000022;
      v31 = 0x8000000227C0ACA0;
      sub_227C09148();
      sub_227C09208();
      swift_bridgeObjectRelease();
      v17 = v30;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      return v17;
    }
LABEL_10:
    sub_227C03844((uint64_t)v3, (unint64_t *)&qword_25591EBA0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    if (qword_25591EB98 == -1)
      goto LABEL_11;
    goto LABEL_17;
  }
  if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = *(id *)(v12 + 32);
    goto LABEL_6;
  }
  __break(1u);
LABEL_17:
  swift_once();
LABEL_11:
  v19 = sub_227C091A8();
  __swift_project_value_buffer(v19, (uint64_t)qword_25591FD30);
  v20 = v0;
  v21 = sub_227C0919C();
  v22 = sub_227C09274();
  v17 = 0xD000000000000022;
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v32 = v24;
    *(_DWORD *)v23 = 136315138;
    v25 = (id)HKSensitiveLogItem();
    sub_227C092B0();
    swift_unknownObjectRelease();
    v26 = sub_227C091F0();
    v30 = sub_227C031C0(v26, v27, &v32);
    sub_227C09298();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_227BF5000, v21, v22, "unable to construct deep link to %s, no valid record", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2A6824](v24, -1, -1);
    MEMORY[0x22E2A6824](v23, -1, -1);

  }
  else
  {

  }
  return v17;
}

unint64_t sub_227C02788()
{
  unint64_t result;

  result = qword_25591EC60;
  if (!qword_25591EC60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25591EC60);
  }
  return result;
}

uint64_t HKSignedClinicalDataRecord.isCOVID19RecordType.getter()
{
  return sub_227C027E8();
}

uint64_t HKSignedClinicalDataRecord.isImmunizationRecordType.getter()
{
  return sub_227C027E8();
}

uint64_t HKSignedClinicalDataRecord.isLabRecordType.getter()
{
  return sub_227C027E8();
}

uint64_t sub_227C027E8()
{
  void *v0;
  id v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_credentialTypes);
  v2 = (_QWORD *)sub_227C09238();

  v3 = sub_227C091D8();
  LOBYTE(v1) = sub_227BF79F4(v3, v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

BOOL HKSignedClinicalDataRecord.permanentlyIneligibleToBeAddedToWallet.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  sub_227C037F8(0, &qword_25591EBE0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v17 - v2;
  v4 = sub_227C0913C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((HKSignedClinicalDataRecord.hasAddToWalletEligibleCredentialTypes.getter() & 1) == 0)
    return 1;
  v11 = objc_msgSend(v0, sel_expirationDate);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_7;
  }
  v12 = v11;
  sub_227C09124();

  v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_7:
    sub_227C03844((uint64_t)v3, &qword_25591EBE0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    return objc_msgSend(v0, sel_signatureStatus) == (id)3;
  }
  v13(v10, v3, v4);
  sub_227C09130();
  v14 = sub_227C09118();
  v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  v15(v10, v4);
  if ((v14 & 1) != 0)
    return 1;
  return objc_msgSend(v0, sel_signatureStatus) == (id)3;
}

BOOL HKSignedClinicalDataRecord.eligibleToBeAddedToWallet.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  sub_227C037F8(0, &qword_25591EBE0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v17 - v2;
  v4 = sub_227C0913C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((HKSignedClinicalDataRecord.hasAddToWalletEligibleCredentialTypes.getter() & 1) == 0)
    return 0;
  v11 = objc_msgSend(v0, sel_expirationDate);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_7;
  }
  v12 = v11;
  sub_227C09124();

  v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_7:
    sub_227C03844((uint64_t)v3, &qword_25591EBE0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    goto LABEL_8;
  }
  v13(v10, v3, v4);
  sub_227C09130();
  v14 = sub_227C09118();
  v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  v15(v10, v4);
  if ((v14 & 1) != 0)
    return 0;
LABEL_8:
  if (objc_msgSend(v0, sel_signatureStatus) == (id)3)
    return 0;
  return objc_msgSend(v0, sel_signatureStatus) == (id)2;
}

uint64_t HKSignedClinicalDataRecord.detailSignatureStatusPlainString.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t ObjCClassFromMetadata;
  id v20;
  uint64_t v22;

  sub_227C037F8(0, &qword_25591EBE0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22 - v2;
  v4 = sub_227C0913C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v22 - v9;
  v11 = objc_msgSend(v0, sel_expirationDate);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_6;
  }
  v12 = v11;
  sub_227C09124();

  v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_6:
    sub_227C03844((uint64_t)v3, &qword_25591EBE0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
LABEL_7:
    objc_msgSend(v0, sel_signatureStatus);
    type metadata accessor for SignedClinicalDataWalletPassManager();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v20 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v18 = sub_227C09094();

    return v18;
  }
  v13(v10, v3, v4);
  sub_227C09130();
  v14 = sub_227C09118();
  v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  if ((v14 & 1) == 0)
  {
    v15(v10, v4);
    goto LABEL_7;
  }
  type metadata accessor for SignedClinicalDataWalletPassManager();
  v16 = swift_getObjCClassFromMetadata();
  v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v16);
  v18 = sub_227C09094();

  v15(v10, v4);
  return v18;
}

uint64_t HKSignedClinicalDataRecord.hasAddToWalletEligibleCredentialTypes.getter()
{
  void *v0;
  id v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v1 = objc_msgSend(v0, sel_credentialTypes);
  v2 = (_QWORD *)sub_227C09238();

  v3 = sub_227C091D8();
  v5 = sub_227BF79F4(v3, v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
    return 0;
  v6 = objc_msgSend(v0, sel_credentialTypes);
  v7 = (_QWORD *)sub_227C09238();

  v8 = sub_227C091D8();
  v10 = sub_227BF79F4(v8, v9, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_227C031C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_227C03290(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_227C038A0((uint64_t)v12, *a3);
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
      sub_227C038A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_227C03290(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_227C092A4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_227C03448(a5, a6);
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
  v8 = sub_227C09310();
  if (!v8)
  {
    sub_227C0934C();
    __break(1u);
LABEL_17:
    result = sub_227C09370();
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

uint64_t sub_227C03448(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_227C034DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_227C036B0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_227C036B0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_227C034DC(uint64_t a1, unint64_t a2)
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
      v3 = sub_227C03650(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_227C092EC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_227C0934C();
      __break(1u);
LABEL_10:
      v2 = sub_227C09214();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_227C09370();
    __break(1u);
LABEL_14:
    result = sub_227C0934C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_227C03650(uint64_t a1, uint64_t a2)
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
  sub_227C038DC();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_227C036B0(char a1, int64_t a2, char a3, char *a4)
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
    sub_227C038DC();
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
  result = sub_227C09370();
  __break(1u);
  return result;
}

void sub_227C037F8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_227C0928C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_227C03844(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_227C037F8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
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

uint64_t sub_227C038A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_227C038DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25591EC88)
  {
    v0 = sub_227C0940C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25591EC88);
  }
}

uint64_t WalletPass.asData()()
{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[258];
  _BYTE v5[258];

  v1 = sub_227C09034();
  MEMORY[0x24BDAC7A8](v1);
  memcpy(v5, v0, sizeof(v5));
  sub_227C09064();
  swift_allocObject();
  sub_227C09058();
  sub_227C03B24(0, &qword_25591EC90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_227C09970;
  sub_227C0901C();
  sub_227C09028();
  sub_227C03ADC();
  sub_227C03B24(0, &qword_25591ECA0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_227C03B7C();
  sub_227C092BC();
  sub_227C09040();
  memcpy(v4, v5, sizeof(v4));
  sub_227C03BD4();
  v2 = sub_227C0904C();
  swift_release();
  return v2;
}

unint64_t sub_227C03ADC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25591EC98;
  if (!qword_25591EC98)
  {
    v1 = sub_227C09034();
    result = MEMORY[0x22E2A67C4](MEMORY[0x24BDCB2C8], v1);
    atomic_store(result, (unint64_t *)&qword_25591EC98);
  }
  return result;
}

void sub_227C03B24(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_227C09034();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_227C03B7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25591ECA8;
  if (!qword_25591ECA8)
  {
    sub_227C03B24(255, &qword_25591ECA0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x22E2A67C4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25591ECA8);
  }
  return result;
}

unint64_t sub_227C03BD4()
{
  unint64_t result;

  result = qword_25591ECB0;
  if (!qword_25591ECB0)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for WalletPass, &type metadata for WalletPass);
    atomic_store(result, (unint64_t *)&qword_25591ECB0);
  }
  return result;
}

unint64_t SignedClinicalDataWalletPassError.errorDescription.getter()
{
  uint64_t v0;
  unint64_t result;

  result = 0xD000000000000013;
  switch(*(_QWORD *)(v0 + 8))
  {
    case 0:
      return result;
    case 1:
      result = 0xD000000000000035;
      break;
    case 2:
      result = 0xD000000000000037;
      break;
    case 3:
      result = 0xD000000000000019;
      break;
    case 4:
      result = 0xD000000000000017;
      break;
    case 5:
      result = 0xD000000000000019;
      break;
    case 6:
      result = 0xD00000000000002CLL;
      break;
    case 7:
      result = 0xD00000000000002FLL;
      break;
    case 8:
      result = 0xD000000000000017;
      break;
    case 9:
      result = 0xD000000000000012;
      break;
    default:
      sub_227C092E0();
      swift_bridgeObjectRelease();
      sub_227C09208();
      result = 0xD000000000000012;
      break;
  }
  return result;
}

uint64_t _s26HealthRecordsWalletSupport018SignedClinicalDataC9PassErrorO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5)
        goto LABEL_28;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_28;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_28;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_28;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_28;
      v6 = 1;
      v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5)
        goto LABEL_28;
      v6 = 1;
      v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6)
        goto LABEL_28;
      v6 = 1;
      v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7)
        goto LABEL_28;
      v6 = 1;
      v3 = 7;
      break;
    case 8uLL:
      if (v5 != 8)
        goto LABEL_28;
      v6 = 1;
      v3 = 8;
      break;
    case 9uLL:
      if (v5 != 9)
        goto LABEL_28;
      v6 = 1;
      v3 = 9;
      break;
    default:
      if (v5 < 0xA)
      {
LABEL_28:
        v6 = 0;
      }
      else if (v2 == v4 && v3 == v5)
      {
        v6 = 1;
      }
      else
      {
        v6 = sub_227C09418();
      }
      sub_227C04184(v4, v5);
      sub_227C04184(v2, v3);
      break;
  }
  sub_227C04198(v2, v3);
  sub_227C04198(v4, v5);
  return v6 & 1;
}

unint64_t destroy for SignedClinicalDataWalletPassError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s26HealthRecordsWalletSupport33SignedClinicalDataWalletPassErrorOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SignedClinicalDataWalletPassError(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for SignedClinicalDataWalletPassError(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for SignedClinicalDataWalletPassError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF5 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483638);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 9;
  if (v4 >= 0xB)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SignedClinicalDataWalletPassError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF6)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483638;
    if (a3 >= 0x7FFFFFF6)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF6)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 9;
  }
  return result;
}

uint64_t sub_227C04138(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_227C04154(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SignedClinicalDataWalletPassError()
{
  return &type metadata for SignedClinicalDataWalletPassError;
}

uint64_t sub_227C04184(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0xA)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_227C04198(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0xA)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_227C041AC()
{
  uint64_t v0;
  id v1;

  v0 = sub_227C091A8();
  __swift_allocate_value_buffer(v0, qword_25591FD30);
  __swift_project_value_buffer(v0, (uint64_t)qword_25591FD30);
  _HKInitializeLogging();
  v1 = (id)*MEMORY[0x24BDD2FF8];
  return sub_227C091B4();
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

void sub_227C0424C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_227C04298(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_227C04318 + 4 * byte_227C09B55[a2]))(0x7453657461444B50);
}

uint64_t sub_227C04318(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x7453657461444B50 && v1 == 0xEF656E6F4E656C79)
    v2 = 1;
  else
    v2 = sub_227C09418();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t WalletPass.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.formatVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t WalletPass.organizationName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.passTypeIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.serialNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.teamIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.appLaunchURL.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.systemAppBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPass.backgroundColor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.foregroundColor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.groupingIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 144);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.labelColor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 160);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.logoText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 176);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.healthPass.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[25];
  v3 = v1[26];
  v4 = v1[27];
  v5 = v1[28];
  *a1 = v1[24];
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t WalletPass.barcodes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPass.expirationDate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 240);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.sharingProhibited.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 256);
}

uint64_t WalletPass.voided.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 257);
}

uint64_t sub_227C04660(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_227C0469C + 4 * byte_227C09B5A[a1]))(0xD000000000000010, 0x8000000227C0B130);
}

uint64_t sub_227C0469C()
{
  return 0x7470697263736564;
}

uint64_t sub_227C046BC()
{
  return 0x655674616D726F66;
}

unint64_t sub_227C046E0()
{
  return 0xD000000000000012;
}

uint64_t sub_227C047AC()
{
  return 0x6C6F436C6562616CLL;
}

uint64_t sub_227C047C8()
{
  return 0x747865546F676F6CLL;
}

uint64_t sub_227C047E0()
{
  return 0x615068746C616568;
}

uint64_t sub_227C04800()
{
  return 0x7365646F63726162;
}

uint64_t sub_227C04818()
{
  return 0x6974617269707865;
}

void sub_227C0483C()
{
  JUMPOUT(0x227C04848);
}

uint64_t sub_227C04854()
{
  return 0x646564696F76;
}

uint64_t sub_227C04870()
{
  unsigned __int8 *v0;

  return sub_227C04660(*v0);
}

uint64_t sub_227C04878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_227C07FD4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_227C0489C()
{
  return 0;
}

void sub_227C048A8(_BYTE *a1@<X8>)
{
  *a1 = 18;
}

uint64_t sub_227C048B4()
{
  sub_227C04EFC();
  return sub_227C0949C();
}

uint64_t sub_227C048DC()
{
  sub_227C04EFC();
  return sub_227C094A8();
}

uint64_t WalletPass.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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
  uint64_t v14;
  uint64_t v15;
  _DWORD v17[2];
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
  int v54;
  char v55;

  sub_227C06630(0, &qword_25591ECB8, (void (*)(void))sub_227C04EFC);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v17 - v6;
  v8 = *(_QWORD *)(v1 + 16);
  v46 = *(_QWORD *)(v1 + 24);
  v47 = v8;
  v9 = *(_QWORD *)(v1 + 32);
  v44 = *(_QWORD *)(v1 + 40);
  v45 = v9;
  v10 = *(_QWORD *)(v1 + 48);
  v42 = *(_QWORD *)(v1 + 56);
  v43 = v10;
  v11 = *(_QWORD *)(v1 + 64);
  v12 = *(_QWORD *)(v1 + 72);
  v40 = *(_QWORD *)(v1 + 80);
  v41 = v11;
  v13 = *(_QWORD *)(v1 + 88);
  v38 = *(_QWORD *)(v1 + 96);
  v39 = v12;
  v36 = *(_QWORD *)(v1 + 104);
  v37 = v13;
  v14 = *(_QWORD *)(v1 + 120);
  v34 = *(_QWORD *)(v1 + 112);
  v35 = v14;
  v32 = *(_QWORD *)(v1 + 128);
  v33 = *(_QWORD *)(v1 + 136);
  v31 = *(_QWORD *)(v1 + 144);
  v30 = *(_QWORD *)(v1 + 152);
  v29 = *(_QWORD *)(v1 + 160);
  v28 = *(_QWORD *)(v1 + 168);
  v26 = *(_QWORD *)(v1 + 176);
  v27 = *(_QWORD *)(v1 + 184);
  v21 = *(_QWORD *)(v1 + 192);
  v22 = *(_QWORD *)(v1 + 200);
  v23 = *(_QWORD *)(v1 + 208);
  v24 = *(_QWORD *)(v1 + 216);
  v25 = *(_QWORD *)(v1 + 224);
  v20 = *(_QWORD *)(v1 + 232);
  v18 = *(_QWORD *)(v1 + 240);
  v19 = *(_QWORD *)(v1 + 248);
  v54 = *(unsigned __int8 *)(v1 + 256);
  v17[1] = *(unsigned __int8 *)(v1 + 257);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_227C04EFC();
  sub_227C09490();
  LOBYTE(v49) = 0;
  v15 = v48;
  sub_227C093B8();
  if (v15)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  LOBYTE(v49) = 1;
  sub_227C093C4();
  LOBYTE(v49) = 2;
  sub_227C093B8();
  v48 = v5;
  LOBYTE(v49) = 3;
  sub_227C093B8();
  LOBYTE(v49) = 4;
  sub_227C093B8();
  LOBYTE(v49) = 5;
  sub_227C093B8();
  LOBYTE(v49) = 6;
  sub_227C09388();
  v49 = v36;
  v55 = 7;
  sub_227C053C4(0, &qword_25591EC08);
  sub_227C04F64();
  sub_227C093AC();
  LOBYTE(v49) = 8;
  sub_227C09388();
  LOBYTE(v49) = 9;
  sub_227C09388();
  LOBYTE(v49) = 10;
  sub_227C09388();
  LOBYTE(v49) = 11;
  sub_227C09388();
  LOBYTE(v49) = 12;
  sub_227C09388();
  v49 = v21;
  v50 = v22;
  v51 = v23;
  v52 = v24;
  v53 = v25;
  v55 = 13;
  sub_227C04FCC();
  sub_227C093D0();
  v49 = v20;
  v55 = 14;
  sub_227C053C4(0, &qword_25591ECD8);
  sub_227C05408(&qword_25591ECE0, &qword_25591ECD8, (uint64_t)&type metadata for WalletPassBarcode, (uint64_t (*)(void))sub_227C05010);
  sub_227C093AC();
  LOBYTE(v49) = 15;
  sub_227C09388();
  LOBYTE(v49) = 16;
  sub_227C09394();
  LOBYTE(v49) = 17;
  sub_227C09394();
  return (*(uint64_t (**)(_QWORD, uint64_t))(v5 + 8))(0, v4);
}

unint64_t sub_227C04EFC()
{
  unint64_t result;

  result = qword_25591ECC0;
  if (!qword_25591ECC0)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A220, &type metadata for WalletPass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ECC0);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_227C04F64()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25591ECC8;
  if (!qword_25591ECC8)
  {
    sub_227C053C4(255, &qword_25591EC08);
    v2 = MEMORY[0x24BEE0D08];
    result = MEMORY[0x22E2A67C4](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25591ECC8);
  }
  return result;
}

unint64_t sub_227C04FCC()
{
  unint64_t result;

  result = qword_25591ECD0;
  if (!qword_25591ECD0)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for WalletPassContent, &type metadata for WalletPassContent);
    atomic_store(result, (unint64_t *)&qword_25591ECD0);
  }
  return result;
}

unint64_t sub_227C05010()
{
  unint64_t result;

  result = qword_25591ECE8;
  if (!qword_25591ECE8)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for WalletPassBarcode, &type metadata for WalletPassBarcode);
    atomic_store(result, (unint64_t *)&qword_25591ECE8);
  }
  return result;
}

uint64_t sub_227C05054(_QWORD *a1)
{
  return WalletPass.encode(to:)(a1);
}

uint64_t WalletPassContent.headerFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.primaryFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.secondaryFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.auxiliaryFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.backFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_227C05090(char a1)
{
  return *(_QWORD *)&aHeaderfiprimar[8 * a1];
}

uint64_t sub_227C050B0()
{
  char *v0;

  return sub_227C05090(*v0);
}

uint64_t sub_227C050B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_227C08704(a1, a2);
  *a3 = result;
  return result;
}

void sub_227C050DC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_227C050E8()
{
  sub_227C05380();
  return sub_227C0949C();
}

uint64_t sub_227C05110()
{
  sub_227C05380();
  return sub_227C094A8();
}

uint64_t WalletPassContent.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  sub_227C06630(0, &qword_25591ECF0, (void (*)(void))sub_227C05380);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  v9 = *v1;
  v8 = v1[1];
  v16 = v1[2];
  v17 = v8;
  v10 = v1[3];
  v14 = v1[4];
  v15 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_227C05380();
  sub_227C09490();
  v20 = v9;
  v19 = 0;
  sub_227C053C4(0, &qword_25591ED00);
  sub_227C05408(&qword_25591ED08, &qword_25591ED00, (uint64_t)&type metadata for WalletPassField, (uint64_t (*)(void))sub_227C0546C);
  v11 = v18;
  sub_227C093AC();
  if (!v11)
  {
    v12 = v16;
    v20 = v17;
    v19 = 1;
    sub_227C093AC();
    v20 = v12;
    v19 = 2;
    sub_227C093AC();
    v20 = v15;
    v19 = 3;
    sub_227C093AC();
    v20 = v14;
    v19 = 4;
    sub_227C093AC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_227C05380()
{
  unint64_t result;

  result = qword_25591ECF8;
  if (!qword_25591ECF8)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A1D0, &type metadata for WalletPassContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ECF8);
  }
  return result;
}

void sub_227C053C4(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_227C0925C();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_227C05408(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_227C053C4(255, a2);
    v8 = v7;
    v9 = a4();
    result = MEMORY[0x22E2A67C4](MEMORY[0x24BEE12A0], v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_227C0546C()
{
  unint64_t result;

  result = qword_25591ED10;
  if (!qword_25591ED10)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for WalletPassField, &type metadata for WalletPassField);
    atomic_store(result, (unint64_t *)&qword_25591ED10);
  }
  return result;
}

uint64_t sub_227C054B0(_QWORD *a1)
{
  return WalletPassContent.encode(to:)(a1);
}

HealthRecordsWalletSupport::WalletPassField::DateTimeStyle_optional __swiftcall WalletPassField.DateTimeStyle.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HealthRecordsWalletSupport::WalletPassField::DateTimeStyle_optional result;
  char v5;

  v2 = v1;
  v3 = sub_227C0937C();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t WalletPassField.DateTimeStyle.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_227C05550 + 4 * byte_227C09B6C[*v0]))(0xD000000000000010, 0x8000000227C0A320);
}

uint64_t sub_227C05550()
{
  return 0x7453657461444B50;
}

void sub_227C055B4(char *a1)
{
  sub_227C0424C(*a1);
}

void sub_227C055C0()
{
  char *v0;

  sub_227C055C8(*v0);
}

void sub_227C055C8(char a1)
{
  sub_227C0946C();
  __asm { BR              X10 }
}

uint64_t sub_227C05620()
{
  sub_227C091FC();
  swift_bridgeObjectRelease();
  return sub_227C09484();
}

void sub_227C056B4(uint64_t a1)
{
  char *v1;

  sub_227C056BC(a1, *v1);
}

void sub_227C056BC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_227C05700()
{
  sub_227C091FC();
  return swift_bridgeObjectRelease();
}

void sub_227C05778(uint64_t a1)
{
  char *v1;

  sub_227C05780(a1, *v1);
}

void sub_227C05780(uint64_t a1, char a2)
{
  sub_227C0946C();
  __asm { BR              X10 }
}

uint64_t sub_227C057D4()
{
  sub_227C091FC();
  swift_bridgeObjectRelease();
  return sub_227C09484();
}

HealthRecordsWalletSupport::WalletPassField::DateTimeStyle_optional sub_227C05868(Swift::String *a1)
{
  return WalletPassField.DateTimeStyle.init(rawValue:)(*a1);
}

uint64_t sub_227C05874@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = WalletPassField.DateTimeStyle.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_227C05898()
{
  sub_227C08FC8();
  return sub_227C09220();
}

uint64_t WalletPassField.key.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*WalletPassField.label.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.value.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*WalletPassField.value.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.textAlignment.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.textAlignment.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*WalletPassField.textAlignment.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.attributedValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.attributedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t (*WalletPassField.attributedValue.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.dataDetectorTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassField.dataDetectorTypes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = a1;
  return result;
}

uint64_t (*WalletPassField.dataDetectorTypes.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.numberStyle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.numberStyle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return result;
}

uint64_t (*WalletPassField.numberStyle.modify())()
{
  return nullsub_1;
}

void WalletPassField.dateStyle.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 104);
}

_BYTE *WalletPassField.dateStyle.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 104) = *result;
  return result;
}

uint64_t (*WalletPassField.dateStyle.modify())()
{
  return nullsub_1;
}

void WalletPassField.timeStyle.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 105);
}

_BYTE *WalletPassField.timeStyle.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 105) = *result;
  return result;
}

uint64_t (*WalletPassField.timeStyle.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.ignoresTimeZone.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 106);
}

uint64_t WalletPassField.ignoresTimeZone.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 106) = result;
  return result;
}

uint64_t (*WalletPassField.ignoresTimeZone.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.isRelative.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 107);
}

uint64_t WalletPassField.isRelative.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 107) = result;
  return result;
}

uint64_t (*WalletPassField.isRelative.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.row.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

uint64_t WalletPassField.row.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = result;
  *(_BYTE *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*WalletPassField.row.modify())()
{
  return nullsub_1;
}

uint64_t sub_227C05C3C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_227C05C74 + 4 * byte_227C09B80[a1]))(0xD000000000000011, 0x8000000227C0B1D0);
}

uint64_t sub_227C05C74()
{
  return 7955819;
}

uint64_t sub_227C05C84()
{
  return 0x6C6562616CLL;
}

uint64_t sub_227C05C98()
{
  return 0x65756C6176;
}

uint64_t sub_227C05CAC()
{
  return 0x67696C4174786574;
}

uint64_t sub_227C05CD0()
{
  return 0x7475626972747461;
}

uint64_t sub_227C05CF4()
{
  return 0x74537265626D756ELL;
}

uint64_t sub_227C05D14()
{
  return 0x6C79745365746164;
}

uint64_t sub_227C05D3C()
{
  return 0x547365726F6E6769;
}

uint64_t sub_227C05D60()
{
  return 0x6974616C65527369;
}

uint64_t sub_227C05D7C()
{
  return 7827314;
}

uint64_t sub_227C05D8C()
{
  unsigned __int8 *v0;

  return sub_227C05C3C(*v0);
}

uint64_t sub_227C05D94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_227C08958(a1, a2);
  *a3 = result;
  return result;
}

void sub_227C05DB8(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_227C05DC4()
{
  sub_227C061C4();
  return sub_227C0949C();
}

uint64_t sub_227C05DEC()
{
  sub_227C061C4();
  return sub_227C094A8();
}

uint64_t WalletPassField.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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
  _DWORD v15[4];
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
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
  char v33;
  uint64_t v34;

  sub_227C06630(0, &qword_25591ED18, (void (*)(void))sub_227C061C4);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v15 - v6;
  v8 = *(_QWORD *)(v1 + 16);
  v30 = *(_QWORD *)(v1 + 24);
  v31 = v8;
  v9 = *(_QWORD *)(v1 + 32);
  v28 = *(_QWORD *)(v1 + 40);
  v29 = v9;
  v10 = *(_QWORD *)(v1 + 48);
  v26 = *(_QWORD *)(v1 + 56);
  v27 = v10;
  v11 = *(_QWORD *)(v1 + 64);
  v24 = *(_QWORD *)(v1 + 72);
  v25 = v11;
  v12 = *(_QWORD *)(v1 + 80);
  v21 = *(_QWORD *)(v1 + 88);
  v22 = *(_QWORD *)(v1 + 96);
  v23 = v12;
  LODWORD(v12) = *(unsigned __int8 *)(v1 + 104);
  v19 = *(unsigned __int8 *)(v1 + 105);
  v20 = v12;
  LODWORD(v12) = *(unsigned __int8 *)(v1 + 106);
  v17 = *(unsigned __int8 *)(v1 + 107);
  v18 = v12;
  v16 = *(_QWORD *)(v1 + 112);
  v15[3] = *(unsigned __int8 *)(v1 + 120);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_227C061C4();
  sub_227C09490();
  LOBYTE(v34) = 0;
  v13 = v32;
  sub_227C093B8();
  if (!v13)
  {
    LOBYTE(v34) = 1;
    sub_227C09388();
    LOBYTE(v34) = 2;
    sub_227C093B8();
    v32 = v5;
    LOBYTE(v34) = 3;
    sub_227C09388();
    LOBYTE(v34) = 4;
    sub_227C09388();
    v34 = v23;
    v33 = 5;
    sub_227C053C4(0, &qword_25591EC08);
    sub_227C04F64();
    sub_227C093AC();
    LOBYTE(v34) = 6;
    sub_227C09388();
    LOBYTE(v34) = v20;
    v33 = 7;
    sub_227C06208();
    sub_227C093AC();
    LOBYTE(v34) = v19;
    v33 = 8;
    sub_227C093AC();
    LOBYTE(v34) = 9;
    sub_227C09394();
    LOBYTE(v34) = 10;
    sub_227C09394();
    LOBYTE(v34) = 11;
    sub_227C093A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_227C061C4()
{
  unint64_t result;

  result = qword_25591ED20;
  if (!qword_25591ED20)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A180, &type metadata for WalletPassField.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED20);
  }
  return result;
}

unint64_t sub_227C06208()
{
  unint64_t result;

  result = qword_25591ED28;
  if (!qword_25591ED28)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for WalletPassField.DateTimeStyle, &type metadata for WalletPassField.DateTimeStyle);
    atomic_store(result, (unint64_t *)&qword_25591ED28);
  }
  return result;
}

uint64_t sub_227C0624C(_QWORD *a1)
{
  return WalletPassField.encode(to:)(a1);
}

uint64_t WalletPassBarcode.altText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassBarcode.format.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassBarcode.message.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassBarcode.messageEncoding.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_227C06310(char a1)
{
  return *(_QWORD *)&aAlttext_0[8 * a1];
}

BOOL sub_227C06330(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_227C06344()
{
  sub_227C0946C();
  sub_227C09478();
  return sub_227C09484();
}

uint64_t sub_227C06388()
{
  return sub_227C09478();
}

uint64_t sub_227C063B0()
{
  sub_227C0946C();
  sub_227C09478();
  return sub_227C09484();
}

uint64_t sub_227C063F0()
{
  char *v0;

  return sub_227C06310(*v0);
}

uint64_t sub_227C063F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_227C08E18(a1, a2);
  *a3 = result;
  return result;
}

void sub_227C0641C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_227C06428()
{
  sub_227C06688();
  return sub_227C0949C();
}

uint64_t sub_227C06450()
{
  sub_227C06688();
  return sub_227C094A8();
}

uint64_t WalletPassBarcode.encode(to:)(_QWORD *a1)
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
  _QWORD v13[8];
  char v14;
  char v15;
  char v16;
  char v17;

  sub_227C06630(0, &qword_25591ED30, (void (*)(void))sub_227C06688);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v13 - v6;
  v8 = v1[2];
  v13[5] = v1[3];
  v13[6] = v8;
  v9 = v1[4];
  v13[3] = v1[5];
  v13[4] = v9;
  v10 = v1[6];
  v13[1] = v1[7];
  v13[2] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_227C06688();
  sub_227C09490();
  v17 = 0;
  v11 = v13[7];
  sub_227C09388();
  if (!v11)
  {
    v16 = 1;
    sub_227C093B8();
    v15 = 2;
    sub_227C093B8();
    v14 = 3;
    sub_227C093B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_227C06630(uint64_t a1, unint64_t *a2, void (*a3)(void))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3();
    v4 = sub_227C093DC();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_227C06688()
{
  unint64_t result;

  result = qword_25591ED38;
  if (!qword_25591ED38)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A130, &type metadata for WalletPassBarcode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED38);
  }
  return result;
}

unint64_t sub_227C066D0()
{
  unint64_t result;

  result = qword_25591ED40;
  if (!qword_25591ED40)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for WalletPassField.DateTimeStyle, &type metadata for WalletPassField.DateTimeStyle);
    atomic_store(result, (unint64_t *)&qword_25591ED40);
  }
  return result;
}

uint64_t sub_227C06714(_QWORD *a1)
{
  return WalletPassBarcode.encode(to:)(a1);
}

uint64_t destroy for WalletPass()
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WalletPass(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  v10 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v10;
  v11 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v11;
  v12 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v12;
  v13 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v13;
  v16 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v16;
  v17 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v17;
  v18 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v18;
  v14 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v14;
  *(_BYTE *)(a1 + 256) = *(_BYTE *)(a2 + 256);
  *(_BYTE *)(a1 + 257) = *(_BYTE *)(a2 + 257);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WalletPass(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 256) = *(_BYTE *)(a2 + 256);
  *(_BYTE *)(a1 + 257) = *(_BYTE *)(a2 + 257);
  return a1;
}

void *__swift_memcpy258_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x102uLL);
}

uint64_t assignWithTake for WalletPass(uint64_t a1, uint64_t a2)
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

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v12;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 256) = *(_WORD *)(a2 + 256);
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPass(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 258))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPass(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 248) = 0;
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
    *(_WORD *)(result + 256) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 258) = 1;
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
    *(_BYTE *)(result + 258) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPass()
{
  return &type metadata for WalletPass;
}

uint64_t destroy for WalletPassContent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for WalletPassContent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WalletPassContent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for WalletPassContent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPassContent(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPassContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPassContent()
{
  return &type metadata for WalletPassContent;
}

uint64_t destroy for WalletPassField()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WalletPassField(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WalletPassField(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

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
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_BYTE *)(a1 + 106) = *(_BYTE *)(a2 + 106);
  *(_BYTE *)(a1 + 107) = *(_BYTE *)(a2 + 107);
  v4 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v4;
  return a1;
}

__n128 __swift_memcpy121_8(uint64_t a1, __int128 *a2)
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
  *(_OWORD *)(a1 + 105) = *(__int128 *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for WalletPassField(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPassField(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 121))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPassField(uint64_t result, int a2, int a3)
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
    *(_BYTE *)(result + 120) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 121) = 1;
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
    *(_BYTE *)(result + 121) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPassField()
{
  return &type metadata for WalletPassField;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for WalletPassField.DateTimeStyle()
{
  return &type metadata for WalletPassField.DateTimeStyle;
}

uint64_t destroy for WalletPassBarcode()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for WalletPassBarcode(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WalletPassBarcode(_QWORD *a1, _QWORD *a2)
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
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

_QWORD *assignWithTake for WalletPassBarcode(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPassBarcode(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPassBarcode(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPassBarcode()
{
  return &type metadata for WalletPassBarcode;
}

uint64_t getEnumTagSinglePayload for WalletPassBarcode.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for WalletPassBarcode.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_227C077D0 + 4 * byte_227C09B91[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_227C07804 + 4 * byte_227C09B8C[v4]))();
}

uint64_t sub_227C07804(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C0780C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227C07814);
  return result;
}

uint64_t sub_227C07820(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227C07828);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_227C0782C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C07834(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C07840(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_227C07848(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WalletPassBarcode.CodingKeys()
{
  return &type metadata for WalletPassBarcode.CodingKeys;
}

uint64_t getEnumTagSinglePayload for WalletPassField.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPassField.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_227C0793C + 4 * byte_227C09B9B[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_227C07970 + 4 * byte_227C09B96[v4]))();
}

uint64_t sub_227C07970(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C07978(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227C07980);
  return result;
}

uint64_t sub_227C0798C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227C07994);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_227C07998(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C079A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WalletPassField.CodingKeys()
{
  return &type metadata for WalletPassField.CodingKeys;
}

uint64_t _s26HealthRecordsWalletSupport15WalletPassFieldV13DateTimeStyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s26HealthRecordsWalletSupport15WalletPassFieldV13DateTimeStyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_227C07A98 + 4 * byte_227C09BA5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_227C07ACC + 4 * byte_227C09BA0[v4]))();
}

uint64_t sub_227C07ACC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C07AD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227C07ADCLL);
  return result;
}

uint64_t sub_227C07AE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227C07AF0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_227C07AF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C07AFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WalletPassContent.CodingKeys()
{
  return &type metadata for WalletPassContent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for WalletPass.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEF)
    goto LABEL_17;
  if (a2 + 17 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 17) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 17;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 17;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 17;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x12;
  v8 = v6 - 18;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPass.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 17 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 17) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEE)
    return ((uint64_t (*)(void))((char *)&loc_227C07BF4 + 4 * byte_227C09BAF[v4]))();
  *a1 = a2 + 17;
  return ((uint64_t (*)(void))((char *)sub_227C07C28 + 4 * byte_227C09BAA[v4]))();
}

uint64_t sub_227C07C28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C07C30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227C07C38);
  return result;
}

uint64_t sub_227C07C44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227C07C4CLL);
  *(_BYTE *)result = a2 + 17;
  return result;
}

uint64_t sub_227C07C50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227C07C58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WalletPass.CodingKeys()
{
  return &type metadata for WalletPass.CodingKeys;
}

unint64_t sub_227C07C78()
{
  unint64_t result;

  result = qword_25591ED48;
  if (!qword_25591ED48)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09EE0, &type metadata for WalletPass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED48);
  }
  return result;
}

unint64_t sub_227C07CC0()
{
  unint64_t result;

  result = qword_25591ED50;
  if (!qword_25591ED50)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09F98, &type metadata for WalletPassContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED50);
  }
  return result;
}

unint64_t sub_227C07D08()
{
  unint64_t result;

  result = qword_25591ED58;
  if (!qword_25591ED58)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A050, &type metadata for WalletPassField.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED58);
  }
  return result;
}

unint64_t sub_227C07D50()
{
  unint64_t result;

  result = qword_25591ED60;
  if (!qword_25591ED60)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A108, &type metadata for WalletPassBarcode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED60);
  }
  return result;
}

unint64_t sub_227C07D98()
{
  unint64_t result;

  result = qword_25591ED68;
  if (!qword_25591ED68)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A078, &type metadata for WalletPassBarcode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED68);
  }
  return result;
}

unint64_t sub_227C07DE0()
{
  unint64_t result;

  result = qword_25591ED70;
  if (!qword_25591ED70)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C0A0A0, &type metadata for WalletPassBarcode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED70);
  }
  return result;
}

unint64_t sub_227C07E28()
{
  unint64_t result;

  result = qword_25591ED78;
  if (!qword_25591ED78)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09FC0, &type metadata for WalletPassField.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED78);
  }
  return result;
}

unint64_t sub_227C07E70()
{
  unint64_t result;

  result = qword_25591ED80;
  if (!qword_25591ED80)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09FE8, &type metadata for WalletPassField.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED80);
  }
  return result;
}

unint64_t sub_227C07EB8()
{
  unint64_t result;

  result = qword_25591ED88;
  if (!qword_25591ED88)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09F08, &type metadata for WalletPassContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED88);
  }
  return result;
}

unint64_t sub_227C07F00()
{
  unint64_t result;

  result = qword_25591ED90;
  if (!qword_25591ED90)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09F30, &type metadata for WalletPassContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED90);
  }
  return result;
}

unint64_t sub_227C07F48()
{
  unint64_t result;

  result = qword_25591ED98;
  if (!qword_25591ED98)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09E50, &type metadata for WalletPass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591ED98);
  }
  return result;
}

unint64_t sub_227C07F90()
{
  unint64_t result;

  result = qword_25591EDA0;
  if (!qword_25591EDA0)
  {
    result = MEMORY[0x22E2A67C4](&unk_227C09E78, &type metadata for WalletPass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25591EDA0);
  }
  return result;
}

uint64_t sub_227C07FD4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69;
  if (v3 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x655674616D726F66 && a2 == 0xED00006E6F697372 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000227C0B130 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000227C0B150 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x754E6C6169726573 && a2 == 0xEC0000007265626DLL || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6564496D616574 && a2 == 0xEE00726569666974 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x636E75614C707061 && a2 == 0xEC0000004C525568 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000227C0B170 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x756F726765726F66 && a2 == 0xEF726F6C6F43646ELL || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000227C0B190 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6C6F436C6562616CLL && a2 == 0xEA0000000000726FLL || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x747865546F676F6CLL && a2 == 0xE800000000000000 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x615068746C616568 && a2 == 0xEA00000000007373 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x7365646F63726162 && a2 == 0xE800000000000000 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x6974617269707865 && a2 == 0xEE00657461446E6FLL || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000227C0B1B0 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x646564696F76 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else
  {
    v6 = sub_227C09418();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 17;
    else
      return 18;
  }
}

uint64_t sub_227C08704(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6946726564616568 && a2 == 0xEC00000073646C65;
  if (v3 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x467972616D697270 && a2 == 0xED000073646C6569 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7261646E6F636573 && a2 == 0xEF73646C65694679 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7261696C69787561 && a2 == 0xEF73646C65694679 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6569466B636162 && a2 == 0xEA00000000007364)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_227C09418();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_227C08958(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v3 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x67696C4174786574 && a2 == 0xED0000746E656D6ELL || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEF65756C61566465 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000227C0B1D0 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x74537265626D756ELL && a2 == 0xEB00000000656C79 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6C79745365746164 && a2 == 0xE900000000000065 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6C797453656D6974 && a2 == 0xE900000000000065 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x547365726F6E6769 && a2 == 0xEF656E6F5A656D69 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6974616C65527369 && a2 == 0xEA00000000006576 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 7827314 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_227C09418();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_227C08E18(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x74786554746C61 && a2 == 0xE700000000000000;
  if (v3 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616D726F66 && a2 == 0xE600000000000000 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000 || (sub_227C09418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x456567617373656DLL && a2 == 0xEF676E69646F636ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_227C09418();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t sub_227C08FC8()
{
  unint64_t result;

  result = qword_25591EDA8;
  if (!qword_25591EDA8)
  {
    result = MEMORY[0x22E2A67C4](&protocol conformance descriptor for WalletPassField.DateTimeStyle, &type metadata for WalletPassField.DateTimeStyle);
    atomic_store(result, (unint64_t *)&qword_25591EDA8);
  }
  return result;
}

uint64_t sub_227C0901C()
{
  return MEMORY[0x24BDCB288]();
}

uint64_t sub_227C09028()
{
  return MEMORY[0x24BDCB2A0]();
}

uint64_t sub_227C09034()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_227C09040()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_227C0904C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_227C09058()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_227C09064()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_227C09070()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_227C0907C()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_227C09088()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_227C09094()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_227C090A0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_227C090AC()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_227C090B8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_227C090C4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_227C090D0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_227C090DC()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_227C090E8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_227C090F4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_227C09100()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_227C0910C()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_227C09118()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_227C09124()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_227C09130()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_227C0913C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_227C09148()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_227C09154()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_227C09160()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_227C0916C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_227C09178()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_227C09184()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_227C09190()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_227C0919C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_227C091A8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_227C091B4()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_227C091C0()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_227C091CC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_227C091D8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_227C091E4()
{
  return MEMORY[0x24BDCFA58]();
}

uint64_t sub_227C091F0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_227C091FC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_227C09208()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_227C09214()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_227C09220()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_227C0922C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_227C09238()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_227C09244()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_227C09250()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_227C0925C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_227C09268()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_227C09274()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_227C09280()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_227C0928C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_227C09298()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_227C092A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_227C092B0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_227C092BC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_227C092C8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_227C092D4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_227C092E0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_227C092EC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_227C092F8()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_227C09304()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_227C09310()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_227C0931C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_227C09328()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_227C09334()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_227C09340()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_227C0934C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_227C09358()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_227C09364()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_227C09370()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_227C0937C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_227C09388()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_227C09394()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_227C093A0()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_227C093AC()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_227C093B8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_227C093C4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_227C093D0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_227C093DC()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_227C093E8()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_227C093F4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_227C09400()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_227C0940C()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_227C09418()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_227C09424()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_227C09430()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_227C0943C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_227C09448()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_227C09454()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_227C09460()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_227C0946C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_227C09478()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_227C09484()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_227C09490()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_227C0949C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_227C094A8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

