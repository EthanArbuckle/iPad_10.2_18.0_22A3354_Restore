uint64_t IntegrationData.collections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationData.collections.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*IntegrationData.collections.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationData.sourceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationData.sourceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*IntegrationData.sourceID.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationData.sourceTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationData.sourceTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*IntegrationData.sourceTitle.modify())()
{
  return nullsub_1;
}

void __swiftcall IntegrationData.init(collections:sourceID:sourceTitle:)(CalendarIntegrationSupport::IntegrationData *__return_ptr retstr, Swift::OpaquePointer collections, Swift::String sourceID, Swift::String sourceTitle)
{
  retstr->collections = collections;
  retstr->sourceID = sourceID;
  retstr->sourceTitle = sourceTitle;
}

uint64_t initializeBufferWithCopyOfBuffer for IntegrationCollection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IntegrationData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for IntegrationData(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

_QWORD *assignWithCopy for IntegrationData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
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

_QWORD *assignWithTake for IntegrationData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationData(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationData(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationData()
{
  return &type metadata for IntegrationData;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2542B6CA0[0])
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, qword_2542B6CA0);
  }
}

uint64_t IntegrationCollection.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationCollection.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntegrationCollection.identifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.collectionPersonaIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationCollection.collectionPersonaIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*IntegrationCollection.collectionPersonaIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationCollection.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*IntegrationCollection.title.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.dataSource.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2376B7794(v1 + 48, a1);
}

uint64_t sub_2376B7794(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t IntegrationCollection.dataSource.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 48;
  __swift_destroy_boxed_opaque_existential_1(v3);
  return sub_2376B7828(a1, v3);
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

uint64_t sub_2376B7828(__int128 *a1, uint64_t a2)
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

uint64_t (*IntegrationCollection.dataSource.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationCollection.init(identifier:title:dataSource:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __int128 *a5@<X4>, _QWORD *a6@<X8>)
{
  a6[2] = 0;
  a6[3] = 0;
  *a6 = a1;
  a6[1] = a2;
  a6[4] = a3;
  a6[5] = a4;
  return sub_2376B7828(a5, (uint64_t)(a6 + 6));
}

uint64_t destroy for IntegrationCollection(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 48);
}

uint64_t initializeWithCopy for IntegrationCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = a2 + 48;
  v7 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(a1 + 48, v6, v8);
  return a1;
}

_QWORD *assignWithCopy for IntegrationCollection(_QWORD *a1, _QWORD *a2)
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
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
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

uint64_t assignWithTake for IntegrationCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

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
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationCollection(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IntegrationCollection(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntegrationCollection()
{
  return &type metadata for IntegrationCollection;
}

uint64_t IntegrationSync.__allocating_init(eventStoreProvider:integrationData:)(id (*a1)(), uint64_t a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id (*v10)();
  __int128 v12;
  __int128 v13;

  v6 = swift_allocObject();
  v12 = a3[1];
  v13 = *a3;
  v7 = *((_QWORD *)a3 + 4);
  v8 = os_transaction_create();
  if (a1)
    v9 = a2;
  else
    v9 = 0;
  *(_QWORD *)(v6 + 64) = v9;
  *(_QWORD *)(v6 + 72) = v8;
  v10 = sub_2376B7D74;
  if (a1)
    v10 = a1;
  *(_OWORD *)(v6 + 16) = v13;
  *(_OWORD *)(v6 + 32) = v12;
  *(_QWORD *)(v6 + 48) = v7;
  *(_QWORD *)(v6 + 56) = v10;
  return v6;
}

uint64_t IntegrationSync.init(eventStoreProvider:integrationData:)(id (*a1)(), uint64_t a2, __int128 *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)();
  __int128 v11;
  __int128 v12;

  v11 = a3[1];
  v12 = *a3;
  v6 = *((_QWORD *)a3 + 4);
  v7 = os_transaction_create();
  if (a1)
    v8 = a2;
  else
    v8 = 0;
  *(_QWORD *)(v3 + 64) = v8;
  *(_QWORD *)(v3 + 72) = v7;
  v9 = sub_2376B7D74;
  if (a1)
    v9 = a1;
  *(_OWORD *)(v3 + 16) = v12;
  *(_OWORD *)(v3 + 32) = v11;
  *(_QWORD *)(v3 + 48) = v6;
  *(_QWORD *)(v3 + 56) = v9;
  return v3;
}

id sub_2376B7D74()
{
  id result;
  id v1;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC74E8]), sel_initWithEKOptions_, 8320);
  if (result)
  {
    v1 = result;
    objc_msgSend(result, sel_setAllowsIntegrationModifications_, 1);
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2376B7DC8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
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
  __int128 v14;
  __int128 v15;
  uint64_t inited;
  void *v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  unint64_t v30;
  BOOL v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t i;
  unint64_t v47;
  id v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  BOOL v62;
  uint64_t v63;
  _QWORD *v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  unint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  id v86;
  id v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  _QWORD *v91;
  id v92;
  void *v93;
  _QWORD *v94;
  int64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  int64_t v100;
  char v101;
  void *v102;
  id v103;
  unint64_t v104;
  id v105;
  uint64_t v106;
  int64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t (*v111)(uint64_t);
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  char v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

  v1 = v0;
  v130 = *MEMORY[0x24BDAC8D0];
  v3 = v0[3];
  v2 = v0[4];
  v118 = MEMORY[0x24BEE4B08];
  v4 = (_QWORD *)v0[2];
  v5 = v4[2];
  v110 = v2;
  v106 = v3;
  if (v5)
  {
    v112 = v0[6];
    v113 = v0[5];
    v111 = (uint64_t (*)(uint64_t))v0[7];
    v108 = v0[8];
    v6 = (uint64_t)(v4 + 4);
    v114 = (_QWORD *)v0[2];
    swift_bridgeObjectRetain();
    do
    {
      v116 = v5;
      sub_2376BC1F4(v6, (uint64_t)&v125);
      v7 = (uint64_t)v125;
      v8 = v126;
      swift_bridgeObjectRetain();
      sub_2376BC048((uint64_t *)&v119, v7, v8);
      swift_bridgeObjectRelease();
      sub_2376BC1F4((uint64_t)&v125, (uint64_t)&v119);
      v9 = type metadata accessor for IntegrationSync.SyncDataProvider();
      v10 = swift_allocObject();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v11 = MEMORY[0x24BEE4AF8];
      *(_QWORD *)(v10 + 168) = sub_2376B9898(MEMORY[0x24BEE4AF8], &qword_2542B7008);
      *(_QWORD *)(v10 + 176) = sub_2376B9898(v11, &qword_2542B7010);
      *(_QWORD *)(v10 + 184) = 0;
      *(_QWORD *)(v10 + 16) = v111;
      *(_QWORD *)(v10 + 24) = v108;
      v12 = swift_retain();
      v13 = v111(v12);
      swift_release();
      v14 = v122;
      *(_OWORD *)(v10 + 72) = v121;
      *(_OWORD *)(v10 + 88) = v14;
      *(_OWORD *)(v10 + 104) = v123;
      v15 = v120;
      *(_OWORD *)(v10 + 40) = v119;
      *(_QWORD *)(v10 + 32) = v13;
      *(_QWORD *)(v10 + 136) = v106;
      *(_QWORD *)(v10 + 144) = v2;
      *(_QWORD *)(v10 + 152) = v113;
      *(_QWORD *)(v10 + 160) = v112;
      *(_QWORD *)(v10 + 120) = v124;
      *(_QWORD *)(v10 + 128) = v114;
      *(_OWORD *)(v10 + 56) = v15;
      type metadata accessor for IntegrationCollectionSync();
      inited = swift_initStackObject();
      *((_QWORD *)&v120 + 1) = v9;
      *(_QWORD *)&v121 = &off_2508F3B70;
      *(_QWORD *)&v119 = v10;
      swift_retain_n();
      *(_QWORD *)(inited + 64) = sub_2376B99AC(v11);
      sub_2376B7794((uint64_t)&v119, inited + 16);
      v17 = *(void **)(v10 + 32);
      *(_QWORD *)(inited + 56) = v17;
      sub_2376BC1F4(v10 + 40, inited + 72);
      v18 = v17;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v119);
      swift_release_n();
      sub_2376CEB08();
      sub_2376BC250((uint64_t)&v125);
      swift_setDeallocating();
      __swift_destroy_boxed_opaque_existential_1(inited + 16);

      swift_bridgeObjectRelease();
      sub_2376BC250(inited + 72);
      swift_release();
      v2 = v110;
      v6 += 88;
      v5 = v116 - 1;
    }
    while (v116 != 1);
    v4 = v114;
    swift_bridgeObjectRelease();
    v1 = v96;
    v3 = v106;
  }
  v19 = v1;
  v20 = ((uint64_t (*)(void))v1[7])();
  v21 = v19[5];
  v22 = v19[6];
  v125 = v4;
  v126 = v3;
  v23 = (void *)v20;
  v127 = v2;
  v128 = v21;
  v129 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v97 = sub_2376B9028(v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = v97;
  v101 = 0;
  v25 = 0;
  v94 = v97 + 8;
  v26 = 1 << *((_BYTE *)v97 + 32);
  if (v26 < 64)
    v27 = ~(-1 << v26);
  else
    v27 = -1;
  v28 = v27 & v97[8];
  v95 = (unint64_t)(v26 + 63) >> 6;
  v105 = v23;
LABEL_14:
  if (v28)
  {
    v99 = (v28 - 1) & v28;
    v100 = v25;
    v30 = __clz(__rbit64(v28)) | (v25 << 6);
    goto LABEL_27;
  }
  v31 = __OFADD__(v25, 1);
  v32 = v25 + 1;
  if (v31)
    goto LABEL_114;
  if (v32 >= v95)
    goto LABEL_102;
  v33 = v94[v32];
  if (!v33)
  {
    v34 = v32 + 1;
    if (v32 + 1 >= v95)
      goto LABEL_102;
    v33 = v94[v34];
    if (v33)
      goto LABEL_25;
    v34 = v32 + 2;
    if (v32 + 2 >= v95)
      goto LABEL_102;
    v33 = v94[v34];
    if (v33)
    {
LABEL_25:
      v32 = v34;
      goto LABEL_26;
    }
    v34 = v32 + 3;
    if (v32 + 3 < v95)
    {
      v33 = v94[v34];
      if (v33)
        goto LABEL_25;
      while (1)
      {
        v32 = v34 + 1;
        if (__OFADD__(v34, 1))
          __break(1u);
        if (v32 >= v95)
          break;
        v33 = v94[v32];
        ++v34;
        if (v33)
          goto LABEL_26;
      }
    }
LABEL_102:
    swift_release();
    swift_bridgeObjectRelease();
    if ((v101 & 1) != 0)
    {
      v125 = 0;
      if (!objc_msgSend(v23, sel_commitWithRollback_, &v125))
      {
        v84 = v125;
        v2 = sub_2376D4EA8();

        swift_willThrow();
        goto LABEL_108;
      }
      v82 = v125;
    }

    return;
  }
LABEL_26:
  v99 = (v33 - 1) & v33;
  v100 = v32;
  v30 = __clz(__rbit64(v33)) + (v32 << 6);
LABEL_27:
  v35 = (uint64_t *)(v24[6] + 16 * v30);
  v98 = *v35;
  v104 = v35[1];
  v36 = *(void **)(v24[7] + 8 * v30);
  swift_bridgeObjectRetain();
  v103 = v36;
  v37 = objc_msgSend(v103, sel_calendarsForEntityType_, 0);
  sub_2376BD590(0, &qword_2542B6C88);
  sub_2376BC2DC();
  v38 = sub_2376D51B4();

  if ((v38 & 0xC000000000000001) != 0)
  {
    sub_2376D5298();
    sub_2376D51CC();
    v109 = *((_QWORD *)&v119 + 1);
    v38 = v119;
    v2 = *((_QWORD *)&v120 + 1);
    v39 = v120;
    v40 = v121;
  }
  else
  {
    v2 = 0;
    v41 = -1 << *(_BYTE *)(v38 + 32);
    v109 = v38 + 56;
    v42 = ~v41;
    v43 = -v41;
    if (v43 < 64)
      v44 = ~(-1 << v43);
    else
      v44 = -1;
    v40 = v44 & *(_QWORD *)(v38 + 56);
    v39 = v42;
  }
  v115 = 0;
  v107 = (unint64_t)(v39 + 64) >> 6;
  while (2)
  {
    v45 = v2;
    for (i = v40; ; i = v40)
    {
      if ((v38 & 0x8000000000000000) == 0)
      {
        if (i)
        {
          v40 = (i - 1) & i;
          v47 = __clz(__rbit64(i)) | (v45 << 6);
          v2 = v45;
          goto LABEL_51;
        }
        v2 = v45 + 1;
        if (!__OFADD__(v45, 1))
        {
          if (v2 >= v107)
            goto LABEL_86;
          v49 = *(_QWORD *)(v109 + 8 * v2);
          if (v49)
            goto LABEL_50;
          v50 = v45 + 2;
          if (v45 + 2 >= v107)
            goto LABEL_86;
          v49 = *(_QWORD *)(v109 + 8 * v50);
          if (v49)
            goto LABEL_49;
          v50 = v45 + 3;
          if (v45 + 3 >= v107)
            goto LABEL_86;
          v49 = *(_QWORD *)(v109 + 8 * v50);
          if (v49)
          {
LABEL_49:
            v2 = v50;
LABEL_50:
            v40 = (v49 - 1) & v49;
            v47 = __clz(__rbit64(v49)) + (v2 << 6);
LABEL_51:
            v48 = *(id *)(*(_QWORD *)(v38 + 48) + 8 * v47);
            if (!v48)
              goto LABEL_86;
            goto LABEL_52;
          }
          v2 = v45 + 4;
          if (v45 + 4 >= v107)
            goto LABEL_86;
          v49 = *(_QWORD *)(v109 + 8 * v2);
          if (v49)
            goto LABEL_50;
          v66 = v45 + 5;
          while (v107 != v66)
          {
            v49 = *(_QWORD *)(v109 + 8 * v66++);
            if (v49)
            {
              v2 = v66 - 1;
              goto LABEL_50;
            }
          }
LABEL_86:
          sub_2376BD548();
          if ((v115 & 1) != 0)
          {
LABEL_13:

            swift_bridgeObjectRelease();
            v23 = v105;
            v24 = v97;
            v28 = v99;
            v25 = v100;
            goto LABEL_14;
          }
          if (qword_2542B6C40 != -1)
            swift_once();
          v73 = sub_2376D50B8();
          __swift_project_value_buffer(v73, (uint64_t)qword_2542B7060);
          v74 = v103;
          swift_bridgeObjectRetain_n();
          v75 = v74;
          swift_retain();
          v76 = sub_2376D50A0();
          v77 = sub_2376D5208();
          if (os_log_type_enabled(v76, v77))
          {
            v78 = swift_slowAlloc();
            v2 = swift_slowAlloc();
            v125 = (id)v2;
            *(_DWORD *)v78 = 136315394;
            swift_bridgeObjectRetain();
            sub_2376BBA08(v106, v110, (uint64_t *)&v125);
            sub_2376D5268();
            swift_release();
            swift_bridgeObjectRelease();
            *(_WORD *)(v78 + 12) = 2080;
            if (v104)
              v79 = v98;
            else
              v79 = 0x296C6C756E28;
            if (v104)
              v80 = v104;
            else
              v80 = 0xE600000000000000;
            swift_bridgeObjectRetain();
            sub_2376BBA08(v79, v80, (uint64_t *)&v125);
            sub_2376D5268();

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2376B5000, v76, v77, "Source %s with persona %s has no calendars and will be removed.", (uint8_t *)v78, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x23B819E18](v2, -1, -1);
            MEMORY[0x23B819E18](v78, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_release();
          }
          v125 = 0;
          v23 = v105;
          if (objc_msgSend(v105, sel_removeSource_commit_error_, v75, 0, &v125))
          {
            v29 = v125;
            v101 = 1;
            goto LABEL_13;
          }
          v83 = v125;
          swift_bridgeObjectRelease();
          v2 = sub_2376D4EA8();

          swift_willThrow();
          swift_release();
          swift_bridgeObjectRelease();

LABEL_108:
          goto LABEL_109;
        }
        __break(1u);
LABEL_114:
        __break(1u);
LABEL_115:
        swift_once();
        goto LABEL_110;
      }
      if (!sub_2376D52B0())
        goto LABEL_86;
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v48 = v125;
      swift_unknownObjectRelease();
      v2 = v45;
      v40 = i;
      if (!v48)
        goto LABEL_86;
LABEL_52:
      v117 = v48;
      v51 = objc_msgSend(v48, sel_externalID);
      if (!v51)
      {
        v53 = 0;
        v55 = 0;
        goto LABEL_76;
      }
      v52 = v51;
      v53 = sub_2376D513C();
      v55 = v54;

      if (!*(_QWORD *)(v118 + 16))
        goto LABEL_76;
      v56 = v38;
      sub_2376D54B4();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2376D5148();
      v57 = sub_2376D54D8();
      v58 = -1 << *(_BYTE *)(v118 + 32);
      v59 = v57 & ~v58;
      if (((*(_QWORD *)(v118 + 56 + ((v59 >> 3) & 0xFFFFFFFFFFFFF8)) >> v59) & 1) == 0)
        goto LABEL_75;
      v60 = *(_QWORD *)(v118 + 48);
      v61 = (_QWORD *)(v60 + 16 * v59);
      v62 = *v61 == v53 && v61[1] == v55;
      if (!v62 && (sub_2376D5454() & 1) == 0)
        break;
LABEL_35:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v38 = v56;
      swift_bridgeObjectRelease();

      v115 = 1;
      v45 = v2;
    }
    v63 = ~v58;
    while (1)
    {
      v59 = (v59 + 1) & v63;
      if (((*(_QWORD *)(v118 + 56 + ((v59 >> 3) & 0xFFFFFFFFFFFFF8)) >> v59) & 1) == 0)
        break;
      v64 = (_QWORD *)(v60 + 16 * v59);
      v65 = *v64 == v53 && v64[1] == v55;
      if (v65 || (sub_2376D5454() & 1) != 0)
        goto LABEL_35;
    }
LABEL_75:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v38 = v56;
LABEL_76:
    if (qword_2542B6C40 != -1)
      swift_once();
    v67 = sub_2376D50B8();
    __swift_project_value_buffer(v67, (uint64_t)qword_2542B7060);
    swift_bridgeObjectRetain();
    v68 = sub_2376D50A0();
    v69 = sub_2376D5208();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = swift_slowAlloc();
      v102 = (void *)swift_slowAlloc();
      v125 = v102;
      *(_DWORD *)v70 = 136315138;
      if (v55)
      {
        v71 = v55;
      }
      else
      {
        v53 = 0x296C6C756E28;
        v71 = 0xE600000000000000;
      }
      swift_bridgeObjectRetain();
      *(_QWORD *)(v70 + 4) = sub_2376BBA08(v53, v71, (uint64_t *)&v125);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2376B5000, v68, v69, "Removing a calendar with an unknown identifier %s", (uint8_t *)v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B819E18](v102, -1, -1);
      MEMORY[0x23B819E18](v70, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v125 = 0;
    if (objc_msgSend(v105, sel_removeCalendar_commit_error_, v117, 0, &v125))
    {
      v72 = v125;

      v101 = 1;
      continue;
    }
    break;
  }
  v81 = v125;
  swift_bridgeObjectRelease();
  v2 = sub_2376D4EA8();

  swift_willThrow();
  swift_bridgeObjectRelease();

  sub_2376BD548();
  swift_release();
LABEL_109:
  if (qword_2542B6C40 != -1)
    goto LABEL_115;
LABEL_110:
  v85 = sub_2376D50B8();
  __swift_project_value_buffer(v85, (uint64_t)qword_2542B7060);
  v86 = (id)v2;
  v87 = (id)v2;
  v88 = sub_2376D50A0();
  v89 = sub_2376D5208();
  if (os_log_type_enabled(v88, v89))
  {
    v90 = (uint8_t *)swift_slowAlloc();
    v91 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v90 = 138412290;
    v92 = (id)v2;
    v93 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v125 = v93;
    sub_2376D5268();
    *v91 = v93;

    _os_log_impl(&dword_2376B5000, v88, v89, "Calendar cleanup following sync failed: %@", v90, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FD0);
    swift_arrayDestroy();
    MEMORY[0x23B819E18](v91, -1, -1);
    MEMORY[0x23B819E18](v90, -1, -1);

  }
  else
  {

  }
}

_QWORD *sub_2376B9028(void *a1)
{
  _QWORD *v1;
  id v2;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  id v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  _QWORD *v52;
  id v53;
  uint64_t v54;
  void *v55;
  unsigned int v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v62;
  char v63;
  void *v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75[3];

  v75[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = v1[1];
  v5 = v1[2];
  v67 = v1[4];
  v68 = v1[3];
  v6 = (_QWORD *)sub_2376B9898(MEMORY[0x24BEE4AF8], &qword_2542B7010);
  v65 = a1;
  v7 = objc_msgSend(a1, sel_sources);
  sub_2376BD590(0, &qword_2542B6CD0);
  v8 = sub_2376D5184();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2376D53DC();
    swift_bridgeObjectRelease();
    v73 = v10;
    if (v10)
      goto LABEL_3;
LABEL_61:
    swift_bridgeObjectRelease();
    return v6;
  }
  v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  v73 = v10;
  if (!v10)
    goto LABEL_61;
LABEL_3:
  v63 = 0;
  v11 = 0;
  v74 = v8 & 0xC000000000000001;
  v72 = v8 & 0xFFFFFFFFFFFFFF8;
  *(_QWORD *)&v9 = 138412290;
  v62 = v9;
  v12 = v73;
  v69 = v5;
  v70 = v4;
  v71 = v8;
  do
  {
    while (1)
    {
      if (v74)
      {
        v13 = (id)MEMORY[0x23B819770](v11, v8);
      }
      else
      {
        if (v11 >= *(_QWORD *)(v72 + 16))
          goto LABEL_58;
        v13 = *(id *)(v8 + 8 * v11 + 32);
      }
      v2 = v13;
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
      {
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        v60 = (id)v10;
        swift_bridgeObjectRelease();
        sub_2376D4EA8();

        swift_willThrow();
        swift_bridgeObjectRelease();

        return v6;
      }
      v10 = (uint64_t)objc_msgSend(v13, sel_sourceType);
      if (v10 != sub_2376D51F0())
      {

        goto LABEL_5;
      }
      v15 = objc_msgSend(v2, sel_externalID);
      if (!v15)
      {

        goto LABEL_49;
      }
      v16 = v15;
      v17 = sub_2376D513C();
      v10 = v18;

      if (v17 == v4 && v10 == v5)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v19 = sub_2376D5454();
        swift_bridgeObjectRelease();
        v12 = v73;
        if ((v19 & 1) == 0)
          goto LABEL_40;
      }
      v20 = objc_msgSend(v2, sel_personaIdentifier, v62);
      if (!v20)
      {
        v22 = 0;
        v24 = 0;
        if (!v6[2])
          goto LABEL_33;
        break;
      }
      v21 = v20;
      v22 = sub_2376D513C();
      v24 = v23;

      if (v6[2])
        break;
LABEL_33:
      swift_bridgeObjectRelease();
      v33 = objc_msgSend(v2, sel_personaIdentifier);
      if (v33)
      {
        v34 = v33;
        v35 = sub_2376D513C();
        v37 = v36;

      }
      else
      {
        v35 = 0;
        v37 = 0;
      }
      v5 = v69;
      v4 = v70;
      v2 = v2;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v75[0] = v6;
      sub_2376D34F4((uint64_t)v2, v35, v37, isUniquelyReferenced_nonNull_native);
      v6 = v75[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v39 = objc_msgSend(v2, sel_title);
      v40 = sub_2376D513C();
      v10 = v41;

      if (v40 == v68 && v10 == v67)
      {
        v10 = v67;

        swift_bridgeObjectRelease();
LABEL_48:
        v8 = v71;
        goto LABEL_49;
      }
      v42 = sub_2376D5454();
      swift_bridgeObjectRelease();
      v12 = v73;
      if ((v42 & 1) != 0)
      {
LABEL_40:

        v8 = v71;
        goto LABEL_5;
      }
      v55 = (void *)sub_2376D5130();
      objc_msgSend(v2, sel_setTitle_, v55);

      v75[0] = 0;
      v56 = objc_msgSend(v65, sel_saveSource_commit_error_, v2, 0, v75);
      v10 = (uint64_t)v75[0];
      if (!v56)
        goto LABEL_59;
      v57 = v75[0];

      v63 = 1;
      ++v11;
      v8 = v71;
      if (v14 == v73)
      {
        swift_bridgeObjectRelease();
        goto LABEL_54;
      }
    }
    swift_bridgeObjectRetain();
    sub_2376D29BC(v22, v24);
    v26 = v25;
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
      goto LABEL_33;
    v66 = v6;
    if (qword_2542B6C40 != -1)
      swift_once();
    v27 = sub_2376D50B8();
    __swift_project_value_buffer(v27, (uint64_t)qword_2542B7060);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v28 = sub_2376D50A0();
    v29 = sub_2376D5208();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v64 = (void *)swift_slowAlloc();
      v75[0] = v64;
      *(_DWORD *)v30 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v30 + 4) = sub_2376BBA08(v70, v69, (uint64_t *)v75);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v30 + 12) = 2080;
      if (v24)
        v31 = v22;
      else
        v31 = 0x746C75616665643CLL;
      if (v24)
        v32 = v24;
      else
        v32 = 0xE90000000000003ELL;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v30 + 14) = sub_2376BBA08(v31, v32, (uint64_t *)v75);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2376B5000, v28, v29, "Duplicate source with ID %s for persona %s. Arbitrarily removing one.", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B819E18](v64, -1, -1);
      MEMORY[0x23B819E18](v30, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v5 = v69;
    v8 = v71;
    v75[0] = 0;
    v43 = objc_msgSend(v65, sel_removeSource_commit_error_, v2, 1, v75);
    v10 = (uint64_t)v75[0];
    v6 = v66;
    if (!v43)
    {
      v45 = v75[0];
      v46 = (void *)sub_2376D4EA8();

      swift_willThrow();
      v47 = v46;
      v48 = v46;
      v49 = sub_2376D50A0();
      v50 = sub_2376D5208();
      v10 = v50;
      if (os_log_type_enabled(v49, v50))
      {
        v51 = swift_slowAlloc();
        v52 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v51 = v62;
        v53 = v46;
        v54 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v51 + 4) = v54;
        *v52 = v54;

        _os_log_impl(&dword_2376B5000, v49, (os_log_type_t)v10, "Error removing source: %@", (uint8_t *)v51, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FD0);
        swift_arrayDestroy();
        MEMORY[0x23B819E18](v52, -1, -1);
        MEMORY[0x23B819E18](v51, -1, -1);

      }
      else
      {

      }
      v5 = v69;
      v4 = v70;
      goto LABEL_48;
    }
    v44 = v75[0];

    v4 = v70;
LABEL_49:
    v12 = v73;
LABEL_5:
    ++v11;
  }
  while (v14 != v12);
  swift_bridgeObjectRelease();
  if ((v63 & 1) == 0)
    return v6;
LABEL_54:
  v75[0] = 0;
  if (objc_msgSend(v65, sel_commitWithRollback_, v75, (_QWORD)v62))
  {
    v58 = v75[0];
  }
  else
  {
    v59 = v75[0];
    sub_2376D4EA8();

    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_2376B9898(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_2376D5400();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_2376D29BC(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
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

unint64_t sub_2376B99AC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FF8);
  v2 = (_QWORD *)sub_2376D5400();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 64);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 4);
    v6 = (uint64_t)*(v4 - 3);
    v7 = (uint64_t)*(v4 - 2);
    v8 = (uint64_t)*(v4 - 1);
    v9 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = v9;
    result = sub_2376D2A4C(v5, v6, v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v2[6] + 32 * result);
    *v13 = v5;
    v13[1] = v6;
    v13[2] = v7;
    v13[3] = v8;
    *(_QWORD *)(v2[7] + 8 * result) = v10;
    v14 = v2[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v2[2] = v16;
    v4 += 5;
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

unint64_t sub_2376B9AEC(uint64_t a1)
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
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256807BF0);
  v2 = (_QWORD *)sub_2376D5400();
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
    result = sub_2376D2AD8(v5, v6);
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

unint64_t sub_2376B9C0C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B7018);
  v2 = (_QWORD *)sub_2376D5400();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2376D2AD8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
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

unint64_t sub_2376B9D24(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  unint64_t result;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B7028);
  v2 = sub_2376D5400();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v19 = v2 + 64;
  swift_retain();
  v5 = (unint64_t *)(a1 + 80);
  while (1)
  {
    v6 = *(v5 - 5);
    v7 = *(v5 - 4);
    v8 = *(v5 - 3);
    v9 = *(v5 - 2);
    v10 = *(v5 - 1);
    v11 = *v5;
    v12 = (id)*(v5 - 6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2376BCC44(v10, v11);
    result = sub_2376D2B3C((uint64_t)v12);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v19 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v12;
    v15 = (_QWORD *)(v3[7] + 48 * result);
    *v15 = v6;
    v15[1] = v7;
    v15[2] = v8;
    v15[3] = v9;
    v15[4] = v10;
    v15[5] = v11;
    v16 = v3[2];
    v17 = __OFADD__(v16, 1);
    v18 = v16 + 1;
    if (v17)
      goto LABEL_11;
    v3[2] = v18;
    v5 += 7;
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

_QWORD *sub_2376B9E78()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  BOOL v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  int64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  id v34;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  _QWORD *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;

  v2 = (_QWORD *)v0[23];
  if (v2)
  {
    swift_bridgeObjectRetain();
    return v2;
  }
  v2 = v0;
  sub_2376BB780();
  if (v1)
    return v2;
  swift_beginAccess();
  v42 = v0;
  v3 = swift_bridgeObjectRetain();
  v4 = (unint64_t)sub_2376BCC88(v3);
  swift_bridgeObjectRelease();
  v49 = MEMORY[0x24BEE4AF8];
  if ((v4 & 0x8000000000000000) != 0 || (v4 & 0x4000000000000000) != 0)
    goto LABEL_56;
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
LABEL_57:
    swift_release();
    v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_58;
  }
  while (1)
  {
    v6 = 0;
    v39 = v4 & 0xC000000000000001;
    v36 = v4 + 32;
    v37 = v5;
    v38 = v4;
LABEL_9:
    if (v39)
    {
      v7 = (id)MEMORY[0x23B819770](v6, v4);
    }
    else
    {
      if (v6 >= *(_QWORD *)(v4 + 16))
        goto LABEL_55;
      v7 = *(id *)(v36 + 8 * v6);
    }
    v8 = v7;
    v9 = __OFADD__(v6, 1);
    v10 = v6 + 1;
    if (!v9)
      break;
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_bridgeObjectRetain();
    v5 = sub_2376D53DC();
    swift_release();
    if (!v5)
      goto LABEL_57;
  }
  v41 = v10;
  v11 = objc_msgSend(v7, sel_calendarsForEntityType_, 0);
  sub_2376BD590(0, &qword_2542B6C88);
  v4 = sub_2376BC2DC();
  v12 = sub_2376D51B4();

  v40 = v8;
  if ((v12 & 0xC000000000000001) != 0)
  {
    sub_2376D5298();
    sub_2376D51CC();
    v12 = v44;
    v13 = v45;
    v14 = v46;
    v15 = v47;
    v16 = v48;
  }
  else
  {
    v15 = 0;
    v17 = -1 << *(_BYTE *)(v12 + 32);
    v13 = v12 + 56;
    v14 = ~v17;
    v18 = -v17;
    if (v18 < 64)
      v19 = ~(-1 << v18);
    else
      v19 = -1;
    v16 = v19 & *(_QWORD *)(v12 + 56);
  }
  v20 = (unint64_t)(v14 + 64) >> 6;
  while (1)
  {
    v21 = v15;
    if ((v12 & 0x8000000000000000) == 0)
      break;
    v24 = sub_2376D52B0();
    if (!v24)
      goto LABEL_8;
    v4 = v24;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v25 = v43;
    swift_unknownObjectRelease();
    if (!v43)
      goto LABEL_8;
LABEL_43:
    v29 = objc_msgSend(v25, sel_externalID);
    if (!v29 || (v30 = v29, v31 = sub_2376D513C(), v4 = v32, v30, !v4))
    {
LABEL_21:

      continue;
    }
    if (v31 == v42[5] && v4 == v42[6])
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v33 = sub_2376D5454();
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0)
        goto LABEL_21;
    }
    v34 = v25;
    v4 = (unint64_t)&v49;
    MEMORY[0x23B8195E4]();
    if (*(_QWORD *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2376D519C();
    sub_2376D51A8();
    sub_2376D5190();

  }
  if (v16)
  {
    v22 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    v23 = v22 | (v15 << 6);
    goto LABEL_42;
  }
  v26 = v15 + 1;
  if (__OFADD__(v15, 1))
  {
    __break(1u);
    goto LABEL_54;
  }
  if (v26 >= v20)
    goto LABEL_8;
  v27 = *(_QWORD *)(v13 + 8 * v26);
  ++v15;
  if (v27)
    goto LABEL_41;
  v15 = v21 + 2;
  if (v21 + 2 >= v20)
    goto LABEL_8;
  v27 = *(_QWORD *)(v13 + 8 * v15);
  if (v27)
    goto LABEL_41;
  v15 = v21 + 3;
  if (v21 + 3 >= v20)
    goto LABEL_8;
  v27 = *(_QWORD *)(v13 + 8 * v15);
  if (v27)
    goto LABEL_41;
  v15 = v21 + 4;
  if (v21 + 4 >= v20)
    goto LABEL_8;
  v27 = *(_QWORD *)(v13 + 8 * v15);
  if (v27)
  {
LABEL_41:
    v16 = (v27 - 1) & v27;
    v23 = __clz(__rbit64(v27)) + (v15 << 6);
LABEL_42:
    v25 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * v23);
    if (!v25)
      goto LABEL_8;
    goto LABEL_43;
  }
  v28 = v21 + 5;
  while (v20 != v28)
  {
    v27 = *(_QWORD *)(v13 + 8 * v28++);
    if (v27)
    {
      v15 = v28 - 1;
      goto LABEL_41;
    }
  }
LABEL_8:
  sub_2376BD548();

  v4 = v38;
  v6 = v41;
  if (v41 != v37)
    goto LABEL_9;
  swift_release();
  v2 = (_QWORD *)v49;
LABEL_58:
  v42[23] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2376BA304(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  id v12;
  uint64_t result;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  _QWORD *v28;
  int64_t v29;
  id v30;
  unint64_t v31;
  int64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  unsigned __int8 v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  unsigned __int8 v56;
  id v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  void *v71;
  BOOL v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  unsigned __int8 v79;
  _QWORD *v80;
  char *v81;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v83;
  char v84;
  _QWORD *v85;
  char v86;
  uint64_t v87;
  _BOOL8 v88;
  uint64_t v89;
  char v90;
  unint64_t v91;
  char v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  unsigned int v106;
  id v107;
  id v108;
  id v109;
  _QWORD *v110;
  id v111;
  id *v112;
  void *v113;
  unint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  int64_t v119;
  _QWORD *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  unint64_t i;
  unint64_t v126;
  unint64_t v127;
  int64_t v128;
  uint64_t v129;
  _QWORD *v130;
  id v131[13];

  v4 = v3;
  v5 = v2;
  v131[11] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = (id *)(v2 + 168);
  swift_beginAccess();
  v9 = *(_QWORD *)(v2 + 168);
  if (*(_QWORD *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_2376D29BC((uint64_t)a1, a2);
    if ((v11 & 1) != 0)
    {
      v124 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v10);
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v12 = sub_2376BB3E0(a1, a2);
  if (v3)
    return (uint64_t)v124;
  v112 = v8;
  v113 = v12;
  v14 = objc_msgSend(v12, sel_calendarsForEntityType_, 0);
  v15 = sub_2376BD590(0, &qword_2542B6C88);
  sub_2376BC2DC();
  v16 = sub_2376D51B4();

  if ((v16 & 0xC000000000000001) != 0)
  {
    sub_2376D5298();
    sub_2376D51CC();
    v16 = (unint64_t)v131[6];
    v120 = v131[7];
    v17 = v131[8];
    v18 = (int64_t)v131[9];
    v19 = (unint64_t)v131[10];
  }
  else
  {
    v18 = 0;
    v20 = -1 << *(_BYTE *)(v16 + 32);
    v120 = (_QWORD *)(v16 + 56);
    v21 = ~v20;
    v22 = -v20;
    if (v22 < 64)
      v23 = ~(-1 << v22);
    else
      v23 = -1;
    v17 = (id)v21;
    v19 = v23 & *(_QWORD *)(v16 + 56);
  }
  v124 = 0;
  v119 = ((unint64_t)v17 + 64) >> 6;
  v24 = 0x746C75616665643CLL;
  if (a2)
    v24 = (uint64_t)a1;
  v115 = v24;
  v25 = 0xE90000000000003ELL;
  if (a2)
    v25 = a2;
  v114 = v25;
  v118 = v5;
  v126 = v16;
  v123 = a2;
  v116 = a1;
  for (i = v15; ; v15 = i)
  {
    while (1)
    {
      while (1)
      {
        v127 = v19;
        if ((v16 & 0x8000000000000000) != 0)
        {
          v28 = (_QWORD *)sub_2376D52B0();
          if (!v28)
          {
            v15 = (unint64_t)v113;
            goto LABEL_129;
          }
          v130 = v28;
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v29 = v18;
          v30 = v131[0];
          swift_unknownObjectRelease();
          v27 = v29;
          v129 = v127;
          if (!v30)
            goto LABEL_125;
        }
        else
        {
          if (v19)
          {
            v129 = (v19 - 1) & v19;
            v26 = __clz(__rbit64(v19)) | (v18 << 6);
            v27 = v18;
          }
          else
          {
            v27 = v18 + 1;
            if (__OFADD__(v18, 1))
              goto LABEL_151;
            if (v27 >= v119)
            {
LABEL_128:
              v15 = (unint64_t)v113;
LABEL_129:
              sub_2376BD548();
              if (!v124)
              {
                v102 = objc_msgSend((id)objc_opt_self(), sel_calendarForEntityType_eventStore_, 0, *(_QWORD *)(v5 + 32));
                swift_bridgeObjectRetain();
                v103 = (void *)sub_2376D5130();
                swift_bridgeObjectRelease();
                objc_msgSend(v102, sel_setTitle_, v103);

                swift_bridgeObjectRetain();
                v104 = (void *)sub_2376D5130();
                swift_bridgeObjectRelease();
                objc_msgSend(v102, sel_setExternalID_, v104);

                objc_msgSend(v102, sel_setSource_, v15);
                objc_msgSend(v102, sel_setImmutable_, 1);
                v105 = *(void **)(v5 + 32);
                v131[0] = 0;
                v106 = objc_msgSend(v105, sel_saveCalendar_commit_error_, v102, 1, v131);
                v107 = v131[0];
                if (v106)
                {
                  v124 = v102;
                  if (*(_QWORD *)(v5 + 184))
                  {
                    v131[0] = *(id *)(v5 + 184);
                    v108 = v107;
                    swift_bridgeObjectRetain();
                    v16 = (unint64_t)v102;
                    MEMORY[0x23B8195E4]();
                    if (*(_QWORD *)(((unint64_t)v131[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v131[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                      goto LABEL_154;
                    goto LABEL_134;
                  }
                  v111 = v131[0];

                  return (uint64_t)v124;
                }
                v109 = v131[0];
                sub_2376D4EA8();

                swift_willThrow();
              }

              return (uint64_t)v124;
            }
            v31 = v120[v27];
            if (!v31)
            {
              v32 = v18 + 2;
              if (v18 + 2 >= v119)
                goto LABEL_128;
              v31 = v120[v32];
              if (v31)
                goto LABEL_33;
              v32 = v18 + 3;
              if (v18 + 3 >= v119)
                goto LABEL_128;
              v31 = v120[v32];
              if (v31)
              {
LABEL_33:
                v27 = v32;
              }
              else
              {
                v27 = v18 + 4;
                if (v18 + 4 >= v119)
                  goto LABEL_128;
                v31 = v120[v27];
                if (!v31)
                {
                  v81 = (char *)(v18 + 5);
                  v15 = (unint64_t)v113;
                  do
                  {
                    if ((char *)v119 == v81)
                      goto LABEL_129;
                    v31 = v120[(_QWORD)v81++];
                  }
                  while (!v31);
                  v27 = (int64_t)(v81 - 1);
                }
              }
            }
            v129 = (v31 - 1) & v31;
            v26 = __clz(__rbit64(v31)) + (v27 << 6);
          }
          v30 = *(id *)(*(_QWORD *)(v16 + 48) + 8 * v26);
          if (!v30)
          {
LABEL_125:
            v15 = (unint64_t)v113;
            goto LABEL_129;
          }
        }
        v128 = v27;
        v33 = objc_msgSend(v30, sel_externalID);
        if (v33)
        {
          v34 = v33;
          v35 = sub_2376D513C();
          v37 = v36;

          if (v37)
            break;
        }
LABEL_19:

        v18 = v128;
        v19 = v129;
        v16 = v126;
        v15 = i;
      }
      if (v35 == *(_QWORD *)(v5 + 40) && v37 == *(_QWORD *)(v5 + 48))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v38 = sub_2376D5454();
        swift_bridgeObjectRelease();
        if ((v38 & 1) == 0)
          goto LABEL_19;
      }
      if (v124)
        break;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v15 = (unint64_t)v30;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v83 = a2;
      v84 = isUniquelyReferenced_nonNull_native;
      v130 = *v112;
      v85 = v130;
      *v112 = (id)0x8000000000000000;
      v16 = sub_2376D29BC((uint64_t)a1, v83);
      v87 = v85[2];
      v88 = (v86 & 1) == 0;
      v89 = v87 + v88;
      if (__OFADD__(v87, v88))
        goto LABEL_153;
      v90 = v86;
      if (v85[3] >= v89)
      {
        if ((v84 & 1) == 0)
          sub_2376D3D18();
        a2 = v123;
        v93 = v130;
        if ((v90 & 1) != 0)
          goto LABEL_113;
      }
      else
      {
        sub_2376D2B6C(v89, v84);
        a2 = v123;
        v91 = sub_2376D29BC((uint64_t)a1, v123);
        if ((v90 & 1) != (v92 & 1))
          goto LABEL_159;
        v16 = v91;
        v93 = v130;
        if ((v90 & 1) != 0)
        {
LABEL_113:
          v94 = v4;
          v95 = v93[7];
          v96 = 8 * v16;

          *(_QWORD *)(v95 + v96) = v15;
          v4 = v94;
          goto LABEL_119;
        }
      }
      v93[(v16 >> 6) + 8] |= 1 << v16;
      v97 = (_QWORD *)(v93[6] + 16 * v16);
      *v97 = a1;
      v97[1] = a2;
      *(_QWORD *)(v93[7] + 8 * v16) = v15;
      v98 = v93[2];
      v72 = __OFADD__(v98, 1);
      v99 = v98 + 1;
      if (v72)
        __break(1u);
      v93[2] = v99;
      swift_bridgeObjectRetain();
LABEL_119:
      v15 = i;
      *v112 = v93;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v124 = v30;
      v16 = v126;
      v18 = v128;
      v19 = v129;
    }
    v122 = v4;
    v39 = qword_2542B6C40;
    v15 = (unint64_t)v124;
    if (v39 != -1)
      swift_once();
    v40 = sub_2376D50B8();
    __swift_project_value_buffer(v40, (uint64_t)qword_2542B7060);
    swift_bridgeObjectRetain_n();
    swift_retain();
    v41 = sub_2376D50A0();
    v42 = sub_2376D5208();
    v121 = (void *)v15;
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v117 = (void *)swift_slowAlloc();
      v131[0] = v117;
      *(_DWORD *)v43 = 136315650;
      v45 = *(_QWORD *)(v5 + 40);
      v44 = *(_QWORD *)(v5 + 48);
      swift_bridgeObjectRetain();
      v130 = (_QWORD *)sub_2376BBA08(v45, v44, (uint64_t *)v131);
      sub_2376D5268();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v46 = *(_QWORD *)(v5 + 136);
      v47 = *(_QWORD *)(v5 + 144);
      swift_bridgeObjectRetain();
      v130 = (_QWORD *)sub_2376BBA08(v46, v47, (uint64_t *)v131);
      sub_2376D5268();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 2080;
      swift_bridgeObjectRetain();
      v130 = (_QWORD *)sub_2376BBA08(v115, v114, (uint64_t *)v131);
      sub_2376D5268();
      a1 = v116;
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2376B5000, v41, v42, "Duplicate calendar with ID %s in source %s in persona %s. Arbitrarily keeping the first one and deleting this one. Resetting mod tag on the first to cause a full sync.", (uint8_t *)v43, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23B819E18](v117, -1, -1);
      v48 = v43;
      v15 = (unint64_t)v121;
      MEMORY[0x23B819E18](v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    v4 = v122;
    v49 = objc_msgSend(v30, sel_eventStore);
    if (!v49)
      break;
    v50 = v49;
    v131[0] = 0;
    v51 = objc_msgSend(v49, sel_removeCalendar_commit_error_, v30, 0, v131);

    v52 = v131[0];
    if ((v51 & 1) == 0)
      goto LABEL_126;
    v53 = v131[0];
    objc_msgSend((id)v15, sel_setExternalModificationTag_, 0);
    v54 = objc_msgSend((id)v15, sel_eventStore);
    if (!v54)
      goto LABEL_157;
    v55 = v54;
    v131[0] = 0;
    v56 = objc_msgSend(v54, sel_saveCalendar_commit_error_, v15, 0, v131);

    v52 = v131[0];
    if ((v56 & 1) == 0)
    {
LABEL_126:
      v101 = v52;
      sub_2376D4EA8();

      swift_willThrow();
LABEL_137:
      sub_2376BD548();
      return (uint64_t)v124;
    }
    v57 = v131[0];
    v58 = (unint64_t)sub_2376B9E78();
    v131[0] = (id)v58;
    v30 = v30;
    v59 = swift_bridgeObjectRetain();
    v5 = sub_2376BD140(v59, (uint64_t)v30);
    v16 = v60;
    swift_bridgeObjectRelease();

    if ((v16 & 1) != 0)
    {
      if (v58 >> 62)
      {
        swift_bridgeObjectRetain();
        v5 = sub_2376D53DC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v5 = *(_QWORD *)((v58 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
    }
    else
    {
      v16 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_152;
      if (v58 >> 62)
      {
        swift_bridgeObjectRetain();
        v100 = sub_2376D53DC();
        swift_bridgeObjectRelease();
        if (v16 != v100)
        {
LABEL_56:
          v61 = v5 + 5;
          while (1)
          {
            v15 = v61 - 4;
            if ((v58 & 0xC000000000000001) != 0)
            {
              v62 = (id)MEMORY[0x23B819770](v61 - 4, v58);
            }
            else
            {
              if ((v15 & 0x8000000000000000) != 0)
              {
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
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                sub_2376D519C();
LABEL_134:
                v124 = (id)v16;
                sub_2376D51A8();
                sub_2376D5190();

                *(id *)(v5 + 184) = v131[0];
LABEL_4:
                swift_bridgeObjectRelease();
                return (uint64_t)v124;
              }
              if (v15 >= *(_QWORD *)((v58 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_141;
              v62 = *(id *)(v58 + 8 * v61);
            }
            v63 = v62;
            v16 = (unint64_t)objc_msgSend(v62, sel_isEqual_, v30);

            if ((v16 & 1) == 0)
            {
              if (v15 != v5)
              {
                if ((v58 & 0xC000000000000001) != 0)
                {
                  v65 = MEMORY[0x23B819770](v5, v58);
                  v66 = (id)MEMORY[0x23B819770](v61 - 4, v58);
                }
                else
                {
                  if (v5 < 0)
                    goto LABEL_144;
                  v16 = *(_QWORD *)((v58 & 0xFFFFFFFFFFFFF8) + 0x10);
                  if (v5 >= v16)
                    goto LABEL_145;
                  v64 = *(id *)(v58 + 8 * v5 + 32);
                  if ((v15 & 0x8000000000000000) != 0)
                    goto LABEL_146;
                  if (v15 >= v16)
                    goto LABEL_148;
                  v65 = (uint64_t)v64;
                  v66 = *(id *)(v58 + 8 * v61);
                }
                v67 = v66;
                if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                  || (v58 & 0x8000000000000000) != 0
                  || (v58 & 0x4000000000000000) != 0)
                {
                  sub_2376BD0D8(v58);
                }
                v68 = *(void **)((v58 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20);
                *(_QWORD *)((v58 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v67;

                sub_2376D5190();
                v69 = (unint64_t)v131[0];
                if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                  || (v69 & 0x8000000000000000) != 0
                  || (v69 & 0x4000000000000000) != 0)
                {
                  sub_2376BD0D8(v69);
                }
                if ((v15 & 0x8000000000000000) != 0)
                  goto LABEL_147;
                v70 = v69 & 0xFFFFFFFFFFFFFF8;
                if (v15 >= *(_QWORD *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10))
                  goto LABEL_149;
                v71 = *(void **)(v70 + 8 * v61);
                *(_QWORD *)(v70 + 8 * v61) = v65;

                sub_2376D5190();
              }
              v72 = __OFADD__(v5++, 1);
              if (v72)
                goto LABEL_143;
            }
            v16 = v61 - 3;
            if (__OFADD__(v15, 1))
              goto LABEL_142;
            v58 = (unint64_t)v131[0];
            if ((unint64_t)v131[0] >> 62)
            {
              swift_bridgeObjectRetain();
              v73 = sub_2376D53DC();
              swift_bridgeObjectRelease();
            }
            else
            {
              v73 = *(_QWORD *)(((unint64_t)v131[0] & 0xFFFFFFFFFFFFF8) + 0x10);
            }
            ++v61;
            if (v16 == v73)
            {
              v4 = 0;
              break;
            }
          }
        }
      }
      else if (v16 != *(_QWORD *)((v58 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_56;
      }
    }
    if (v58 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = sub_2376D53DC();
      swift_bridgeObjectRelease();
      if ((uint64_t)v15 < v5)
        goto LABEL_150;
    }
    else
    {
      v15 = *(_QWORD *)((v58 & 0xFFFFFFFFFFFFF8) + 0x10);
      if ((uint64_t)v15 < v5)
        goto LABEL_150;
    }
    sub_2376BD240(v5, v15);
    v5 = v118;
    *(id *)(v118 + 184) = v131[0];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v74 = *(void **)(v118 + 56);
    v75 = *(_QWORD *)(v118 + 64);
    if (!v123)
    {
      if (!v75)
        goto LABEL_98;
LABEL_100:
      swift_bridgeObjectRetain();
      v76 = (void *)sub_2376BA304(v74, v75);
      swift_bridgeObjectRelease();
      objc_msgSend(v76, sel_setExternalModificationTag_, 0);
      v77 = objc_msgSend(v76, sel_eventStore);
      if (!v77)
        goto LABEL_158;
      v78 = v77;
      swift_bridgeObjectRelease();
      v130 = 0;
      v79 = objc_msgSend(v78, sel_saveCalendar_commit_error_, v76, 0, &v130);

      a2 = v123;
      if ((v79 & 1) == 0)
      {
        v110 = v130;
        sub_2376D4EA8();

        swift_willThrow();
        goto LABEL_137;
      }
      v80 = v130;

      goto LABEL_19;
    }
    if (!v75 || (v74 != a1 || v75 != v123) && (sub_2376D5454() & 1) == 0)
      goto LABEL_100;
LABEL_98:

    swift_bridgeObjectRelease();
    v18 = v128;
    v19 = v129;
    v16 = v126;
    a2 = v123;
  }

  __break(1u);
LABEL_157:

  __break(1u);
LABEL_158:

  __break(1u);
LABEL_159:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256807C00);
  result = sub_2376D5478();
  __break(1u);
  return result;
}

uint64_t sub_2376BB330()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = v0;
  v2 = (uint64_t (*)(uint64_t))v0[2];
  v3 = swift_retain();
  v4 = v2(v3);
  swift_release();
  v5 = (void *)v0[4];
  v0[4] = v4;

  swift_beginAccess();
  v6 = MEMORY[0x24BEE4B00];
  v1[22] = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[21] = v6;
  swift_bridgeObjectRelease();
  v1[23] = 0;
  return swift_bridgeObjectRelease();
}

id sub_2376BB3E0(id a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  id result;
  uint64_t v8;
  unint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30[7];

  v4 = v2;
  v30[6] = *(id *)MEMORY[0x24BDAC8D0];
  sub_2376BB780();
  if (v3)
    return a1;
  swift_beginAccess();
  v8 = v2[22];
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_2376D29BC((uint64_t)a1, a2);
    if ((v10 & 1) != 0)
    {
      a1 = *(id *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sourceWithEventStore_, v4[4]);
  if (result)
  {
    v11 = result;
    v28 = (uint64_t)a1;
    if (a2)
      v12 = (void *)sub_2376D5130();
    else
      v12 = 0;
    objc_msgSend(v11, sel_setPendingPersonaIdentifierForNewSource_, v12, v4 + 22);

    v13 = v4[19];
    v14 = v4[20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = objc_msgSend(v11, sel_title);
    v16 = sub_2376D513C();
    v18 = v17;

    if (v16 == v13 && v18 == v14)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v19 = sub_2376D5454();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v20 = (void *)sub_2376D5130();
        objc_msgSend(v11, sel_setTitle_, v20);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

      }
    }
    objc_msgSend(v11, sel_setSourceType_, sub_2376D51F0());
    swift_bridgeObjectRetain();
    v21 = (void *)sub_2376D5130();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setExternalID_, v21);

    v22 = (void *)v4[4];
    v30[0] = 0;
    v23 = objc_msgSend(v22, sel_saveSource_commit_error_, v11, 1, v30);
    a1 = v30[0];
    if (v23)
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v24 = a1;
      a1 = v11;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v29 = *v27;
      *v27 = 0x8000000000000000;
      sub_2376D34F4((uint64_t)a1, v28, a2, isUniquelyReferenced_nonNull_native);
      *v27 = v29;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
    else
    {
      v26 = v30[0];
      sub_2376D4EA8();

      swift_willThrow();
    }
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_2376BB780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  void *v5;
  id v6;
  _QWORD *v7;

  v2 = v1;
  v3 = (_QWORD *)(v0 + 176);
  result = swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v0 + 176) + 16))
  {
    v5 = *(void **)(v0 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v6 = v5;
    v7 = sub_2376B9028(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (!v2)
    {
      *v3 = v7;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_2376BB860()
{
  uint64_t v0;

  swift_release();

  sub_2376BC250(v0 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_2376BB8DC()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)v0 + 32);
}

uint64_t sub_2376BB8E8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_2376BC1F4(*v1 + 40, a1);
}

_QWORD *sub_2376BB8F8()
{
  return sub_2376B9E78();
}

uint64_t sub_2376BB918(void *a1, uint64_t a2)
{
  return sub_2376BA304(a1, a2);
}

uint64_t sub_2376BB938()
{
  return sub_2376BB330();
}

uint64_t IntegrationSync.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t IntegrationSync.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2376BBA08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2376BBAD8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2376BD554((uint64_t)v12, *a3);
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
      sub_2376BD554((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2376BBAD8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2376D5274();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2376BBC90(a5, a6);
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
  v8 = sub_2376D5304();
  if (!v8)
  {
    sub_2376D53D0();
    __break(1u);
LABEL_17:
    result = sub_2376D540C();
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

uint64_t sub_2376BBC90(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2376BBD24(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2376BBEFC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2376BBEFC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2376BBD24(uint64_t a1, unint64_t a2)
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
      v3 = sub_2376BBE98(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2376D52E0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2376D53D0();
      __break(1u);
LABEL_10:
      v2 = sub_2376D5154();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2376D540C();
    __break(1u);
LABEL_14:
    result = sub_2376D53D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2376BBE98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2542B6D08);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2376BBEFC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2542B6D08);
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
  result = sub_2376D540C();
  __break(1u);
  return result;
}

uint64_t sub_2376BC048(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2376D54B4();
  swift_bridgeObjectRetain();
  sub_2376D5148();
  v8 = sub_2376D54D8();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2376D5454() & 1) != 0)
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
      if (v19 || (sub_2376D5454() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2376BC650(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2376BC1F4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for IntegrationCollection(a2, a1);
  return a2;
}

uint64_t type metadata accessor for IntegrationSync.SyncDataProvider()
{
  return objc_opt_self();
}

uint64_t sub_2376BC250(uint64_t a1)
{
  destroy for IntegrationCollection(a1);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B819D4C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2376BC2DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542B6C90;
  if (!qword_2542B6C90)
  {
    v1 = sub_2376BD590(255, &qword_2542B6C88);
    result = MEMORY[0x23B819D64](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2542B6C90);
  }
  return result;
}

uint64_t type metadata accessor for IntegrationSync()
{
  return objc_opt_self();
}

uint64_t method lookup function for IntegrationSync()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IntegrationSync.__allocating_init(eventStoreProvider:integrationData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of IntegrationSync.sync()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t sub_2376BC374()
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2542B6FE0);
  v3 = sub_2376D52D4();
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
      sub_2376D54B4();
      sub_2376D5148();
      result = sub_2376D54D8();
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

uint64_t sub_2376BC650(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2376BC374();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2376BC7E8();
      goto LABEL_22;
    }
    sub_2376BC998();
  }
  v11 = *v4;
  sub_2376D54B4();
  sub_2376D5148();
  result = sub_2376D54D8();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2376D5454(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2376D546C();
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
          result = sub_2376D5454();
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

void *sub_2376BC7E8()
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2542B6FE0);
  v2 = *v0;
  v3 = sub_2376D52C8();
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

uint64_t sub_2376BC998()
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2542B6FE0);
  v3 = sub_2376D52D4();
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
    sub_2376D54B4();
    swift_bridgeObjectRetain();
    sub_2376D5148();
    result = sub_2376D54D8();
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

uint64_t sub_2376BCC44(uint64_t a1, unint64_t a2)
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

_QWORD *sub_2376BCC88(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B7058);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_2376BCEE0(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2376BD548();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_2376BCD70(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x24BEE4AF8];
    v8 = 2 * v5;
    if (v5 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = a2 + 16 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8)
          goto LABEL_19;
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542B7050);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 17;
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 4);
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_2376D540C();
  __break(1u);
  return result;
}

_QWORD *sub_2376BCEE0(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  id v21;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_2376BD0D8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2376D53DC();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B81977CLL);
}

uint64_t sub_2376BD140(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;

  if (a1 >> 62)
    goto LABEL_12;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = 0;
  if (v4)
  {
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B819770](v5, a1) : *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_isEqual_, a2);

      if ((v8 & 1) != 0)
        break;
      v9 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_12:
        swift_bridgeObjectRetain();
        v4 = sub_2376D53DC();
        swift_bridgeObjectRelease();
        v5 = 0;
        if (!v4)
          return v5;
      }
      else
      {
        ++v5;
        if (v9 == v4)
          return 0;
      }
    }
  }
  return v5;
}

uint64_t sub_2376BD240(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_2376D53DC();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_2376D53DC();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_2376D53DC();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B81977C](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_2376BD590(0, &qword_2542B6C88);
  swift_arrayDestroy();
  if (!v5)
    return sub_2376D5190();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_2376D53DC();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_2376D5190();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_2376D53DC();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_2376D540C();
  __break(1u);
  return result;
}

uint64_t sub_2376BD548()
{
  return swift_release();
}

uint64_t sub_2376BD554(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2376BD590(uint64_t a1, unint64_t *a2)
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

id IntegrationServer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *IntegrationServer.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  char *v9;
  void *v10;
  char *v11;
  objc_super v13;
  _QWORD aBlock[6];

  v1 = OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager;
  type metadata accessor for IntegrationSyncManager();
  swift_allocObject();
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_2376BDD90();
  v3 = OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6CD8);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 20) = 0;
  *(_WORD *)(v4 + 16) = 0;
  *(_QWORD *)&v2[v3] = v4;
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = objc_allocWithZone(MEMORY[0x24BE13F98]);
  aBlock[4] = sub_2376BDB14;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2376BDB1C;
  aBlock[3] = &block_descriptor;
  v7 = _Block_copy(aBlock);
  swift_retain();
  v8 = objc_msgSend(v6, sel_initWithStateChangedCallback_, v7);
  _Block_release(v7);
  swift_release();
  *(_QWORD *)&v2[OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_deviceLockObserver] = v8;

  v13.receiver = v2;
  v13.super_class = (Class)type metadata accessor for IntegrationServer();
  v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v10 = *(void **)&v9[OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_deviceLockObserver];
  v11 = v9;
  if (objc_msgSend(v10, sel_hasBeenUnlockedSinceBoot))
    sub_2376BD998((void (*)(uint64_t))sub_2376BD98C);
  swift_release();

  return v11;
}

void sub_2376BD7B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B819E84](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_2376BD998((void (*)(uint64_t))sub_2376BD98C);

  }
}

void sub_2376BD830()
{
  sub_2376BD998((void (*)(uint64_t))sub_2376BD840);
}

uint64_t sub_2376BD840(uint64_t result)
{
  *(_BYTE *)(result + 1) = 1;
  return result;
}

void sub_2376BD890()
{
  sub_2376BD8B4((void (*)(os_unfair_lock_s *, uint64_t))sub_2376BE52C);
}

void sub_2376BD8A8()
{
  sub_2376BD8B4((void (*)(os_unfair_lock_s *, uint64_t))sub_2376BE298);
}

void sub_2376BD8B4(void (*a1)(os_unfair_lock_s *, uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager);
  v4 = *(os_unfair_lock_s **)(v3 + 32);
  v5 = v4 + 4;
  v6 = v4 + 5;
  os_unfair_lock_lock(v4 + 5);
  a1(v5, v3);
  os_unfair_lock_unlock(v6);
}

void sub_2376BD920(char *a1, uint64_t a2, void (*a3)(os_unfair_lock_s *))
{
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  char *v7;

  v4 = *(os_unfair_lock_s **)(*(_QWORD *)&a1[OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager]
                            + 32);
  v5 = v4 + 4;
  v6 = v4 + 5;
  v7 = a1;
  os_unfair_lock_lock(v6);
  a3(v5);
  os_unfair_lock_unlock(v6);

}

_BYTE *sub_2376BD98C(_BYTE *result)
{
  *result = 1;
  return result;
}

void sub_2376BD998(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  int v6;
  int v7;
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;

  v2 = v1;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_lock);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 20));
  if (*(_BYTE *)(v4 + 16) == 1 && *(_BYTE *)(v4 + 17) != 0)
  {
    v9 = (os_unfair_lock_s *)(v4 + 20);
LABEL_12:
    os_unfair_lock_unlock(v9);
    return;
  }
  a1(v4 + 16);
  v6 = *(unsigned __int8 *)(v4 + 16);
  v7 = *(unsigned __int8 *)(v4 + 17);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
  if (v6 == 1 && v7 != 0)
  {
    v10 = *(os_unfair_lock_s **)(*(_QWORD *)(v2
                                           + OBJC_IVAR____TtC26CalendarIntegrationSupport17IntegrationServer_syncManager)
                               + 32);
    v11 = v10 + 4;
    v12 = v10 + 5;
    os_unfair_lock_lock(v10 + 5);
    sub_2376BE0E0(v11);
    v9 = v12;
    goto LABEL_12;
  }
}

id IntegrationServer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntegrationServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2376BDAF0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2376BDB14()
{
  uint64_t v0;

  sub_2376BD7B4(v0);
}

uint64_t sub_2376BDB1C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t type metadata accessor for IntegrationServer()
{
  return objc_opt_self();
}

uint64_t method lookup function for IntegrationServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IntegrationServer.startServer()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of IntegrationServer.requestRegularSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of IntegrationServer.requestCatchupSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationServer.StartedState(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationServer.StartedState(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2376BDCE0 + 4 * byte_2376D6DF5[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_2376BDD14 + 4 * byte_2376D6DF0[v4]))();
}

uint64_t sub_2376BDD14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_2376BDD1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x2376BDD24);
  return result;
}

uint64_t sub_2376BDD30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x2376BDD38);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2376BDD3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_2376BDD44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntegrationServer.StartedState()
{
  return &type metadata for IntegrationServer.StartedState;
}

void sub_2376BDD60(_BYTE *a1)
{
  sub_2376BE298(a1);
}

void sub_2376BDD78(_BYTE *a1)
{
  sub_2376BE52C(a1);
}

_QWORD *sub_2376BDD90()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2376D5220();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_2376D50D0();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_2376D522C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6D48);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 20) = 0;
  *(_WORD *)(v8 + 16) = 0;
  *(_BYTE *)(v8 + 18) = 0;
  v0[4] = v8;
  sub_2376D513C();
  v9 = objc_allocWithZone(MEMORY[0x24BE13FD8]);
  v10 = (void *)sub_2376D5130();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithDomain_, v10);

  v0[5] = v11;
  sub_2376BF06C();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5758], v4);
  sub_2376D50C4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2376BF0A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6C70);
  sub_2376BF0F0();
  sub_2376D5280();
  v12 = sub_2376D5238();
  v0[3] = v12;
  v13 = swift_allocObject();
  swift_weakInit();
  v14 = objc_allocWithZone(MEMORY[0x24BE13F60]);
  aBlock[4] = sub_2376BF1A4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2376BEECC;
  aBlock[3] = &block_descriptor_0;
  v15 = _Block_copy(aBlock);
  swift_retain();
  v16 = objc_msgSend(v14, sel_initWithQueue_andBlock_, v12, v15);
  _Block_release(v15);
  swift_release();
  v1[2] = v16;
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  return v1;
}

uint64_t sub_2376BE08C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2376BEAFC();
    return swift_release();
  }
  return result;
}

void sub_2376BE0E0(_BYTE *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  *a1 = 1;
  if (a1[1] == 1)
  {
    if (a1[2] == 1)
    {
      if (qword_2542B6C40 != -1)
        swift_once();
      v2 = sub_2376D50B8();
      __swift_project_value_buffer(v2, (uint64_t)qword_2542B7060);
      v3 = sub_2376D50A0();
      v4 = sub_2376D51FC();
      if (os_log_type_enabled(v3, v4))
      {
        v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2376B5000, v3, v4, "Catch-up sync requested, but not required", v5, 2u);
        MEMORY[0x23B819E18](v5, -1, -1);
      }

    }
    else
    {
      if (qword_2542B6C40 != -1)
        swift_once();
      v6 = sub_2376D50B8();
      __swift_project_value_buffer(v6, (uint64_t)qword_2542B7060);
      v7 = sub_2376D50A0();
      v8 = sub_2376D5214();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2376B5000, v7, v8, "Performing catch-up sync", v9, 2u);
        MEMORY[0x23B819E18](v9, -1, -1);
      }

      sub_2376BE630((uint64_t)a1);
    }
  }
}

void sub_2376BE298(_BYTE *a1)
{
  a1[1] = 1;
  sub_2376BE2C8(a1);
}

void sub_2376BE2C8(_BYTE *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *oslog;

  if (a1[1] == 1)
  {
    if (a1[2] == 1)
    {
      if (qword_2542B6C40 != -1)
        swift_once();
      v2 = sub_2376D50B8();
      __swift_project_value_buffer(v2, (uint64_t)qword_2542B7060);
      oslog = sub_2376D50A0();
      v3 = sub_2376D51FC();
      if (!os_log_type_enabled(oslog, v3))
        goto LABEL_19;
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v5 = "Catch-up sync requested, but not required";
LABEL_18:
      _os_log_impl(&dword_2376B5000, oslog, v3, v5, v4, 2u);
      MEMORY[0x23B819E18](v4, -1, -1);
LABEL_19:

      return;
    }
    if ((*a1 & 1) == 0)
    {
      if (qword_2542B6C40 != -1)
        swift_once();
      v10 = sub_2376D50B8();
      __swift_project_value_buffer(v10, (uint64_t)qword_2542B7060);
      oslog = sub_2376D50A0();
      v3 = sub_2376D5214();
      if (!os_log_type_enabled(oslog, v3))
        goto LABEL_19;
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v5 = "Catch-up sync requested, but sync manager not yet started";
      goto LABEL_18;
    }
    if (qword_2542B6C40 != -1)
      swift_once();
    v6 = sub_2376D50B8();
    __swift_project_value_buffer(v6, (uint64_t)qword_2542B7060);
    v7 = sub_2376D50A0();
    v8 = sub_2376D5214();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2376B5000, v7, v8, "Performing catch-up sync", v9, 2u);
      MEMORY[0x23B819E18](v9, -1, -1);
    }

    sub_2376BE630((uint64_t)a1);
  }
}

void sub_2376BE52C(_BYTE *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (*a1 == 1)
  {
    sub_2376BE630((uint64_t)a1);
  }
  else
  {
    if (qword_2542B6C40 != -1)
      swift_once();
    v2 = sub_2376D50B8();
    __swift_project_value_buffer(v2, (uint64_t)qword_2542B7060);
    v3 = sub_2376D50A0();
    v4 = sub_2376D5214();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2376B5000, v3, v4, "Reminders changed prior to starting; scheduling a catch-up sync for after we're started",
        v5,
        2u);
      MEMORY[0x23B819E18](v5, -1, -1);
    }

    a1[1] = 1;
  }
}

uint64_t sub_2376BE630(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t inited;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t result;

  v3 = os_transaction_create();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6D50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2376D6E40;
  *(_QWORD *)(inited + 32) = 0x746361736E617274;
  *(_QWORD *)(inited + 40) = 0xEB000000006E6F69;
  *(_QWORD *)(inited + 48) = v3;
  swift_unknownObjectRetain();
  v5 = sub_2376B9C0C(inited);
  v6 = *(void **)(v1 + 16);
  sub_2376BE740(v5);
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2376D50F4();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_updateTagsAndExecuteBlock_withContext_, 0, v7);

  result = swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 2) = 1;
  return result;
}

uint64_t sub_2376BE740(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542B7038);
    v2 = sub_2376D5400();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6FB0);
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_2376BF05C(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_2376BF05C(v35, v36);
    sub_2376BF05C(v36, &v32);
    result = sub_2376D52BC();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_2376BF05C(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2376BD548();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_2376BEAFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD *inited;
  uint64_t v15;
  _BYTE v16[80];

  v1 = sub_2376D50DC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = *(void **)(v0 + 24);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5610], v1);
  v6 = v5;
  LOBYTE(v5) = sub_2376D50E8();
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  v7 = *(void **)(v0 + 40);
  v8 = (void *)sub_2376D5130();
  LODWORD(v7) = objc_msgSend(v7, sel_getBooleanPreference_defaultValue_, v8, 0);

  if (!(_DWORD)v7)
  {
    v13 = sub_2376BEF74();
    type metadata accessor for IntegrationSync();
    inited = (_QWORD *)swift_initStackObject();
    v15 = os_transaction_create();
    inited[8] = 0;
    inited[9] = v15;
    inited[2] = v13;
    inited[3] = 0xD000000000000015;
    inited[4] = 0x80000002376D6A80;
    inited[5] = 0x7265646E696D6552;
    inited[6] = 0xE900000000000073;
    inited[7] = sub_2376B7D74;
    sub_2376B7DC8();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  if (qword_2542B6C40 != -1)
    goto LABEL_9;
LABEL_4:
  v9 = sub_2376D50B8();
  __swift_project_value_buffer(v9, (uint64_t)qword_2542B7060);
  v10 = sub_2376D50A0();
  v11 = sub_2376D5208();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2376B5000, v10, v11, "Skipping an integration sync because the user default for disabling integration syncing is set", v12, 2u);
    MEMORY[0x23B819E18](v12, -1, -1);
  }

}

uint64_t sub_2376BED40()
{
  id *v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IntegrationSyncManager()
{
  return objc_opt_self();
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2;

  v2 = *a2;
  *(_BYTE *)(result + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationSyncManager.State(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  unsigned int v4;
  BOOL v5;
  int v6;

  if (!a2)
    return 0;
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
  }
  v4 = *(unsigned __int8 *)a1;
  v5 = v4 >= 2;
  v6 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5)
    v6 = -1;
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationSyncManager.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554177) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFE)
    v3 = 0;
  if (a2 > 0xFE)
  {
    *(_WORD *)result = a2 - 255;
    *(_BYTE *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)result = a2 + 1;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationSyncManager.State()
{
  return &type metadata for IntegrationSyncManager.State;
}

uint64_t sub_2376BEECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;

  v3 = a3;
  v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (!a2)
  {
    v5 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = sub_2376D5184();
  if (v3)
LABEL_3:
    v3 = sub_2376D5100();
LABEL_4:
  swift_retain();
  v4(v5, v3);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2376BEF74()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t result;

  if (!MEMORY[0x24BE7D288])
    return MEMORY[0x24BEE4AF8];
  v0 = type metadata accessor for ReminderIntegrationDataSource();
  v1 = (_QWORD *)swift_allocObject();
  v1[2] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7D288]), sel_init);
  v1[3] = 0;
  v1[4] = sub_2376B9AEC(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6CF8);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2376D6E40;
  *(_QWORD *)(result + 32) = 0x656C756465686373;
  *(_QWORD *)(result + 40) = 0xE900000000000064;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0xD000000000000013;
  *(_QWORD *)(result + 72) = 0x80000002376D6AA0;
  *(_QWORD *)(result + 80) = v1;
  *(_QWORD *)(result + 104) = v0;
  *(_QWORD *)(result + 112) = &off_2508F3DD8;
  return result;
}

_OWORD *sub_2376BF05C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2376BF06C()
{
  unint64_t result;

  result = qword_2542B6CC0;
  if (!qword_2542B6CC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542B6CC0);
  }
  return result;
}

unint64_t sub_2376BF0A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542B6CB8;
  if (!qword_2542B6CB8)
  {
    v1 = sub_2376D5220();
    result = MEMORY[0x23B819D64](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2542B6CB8);
  }
  return result;
}

unint64_t sub_2376BF0F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542B6C78;
  if (!qword_2542B6C78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2542B6C70);
    result = MEMORY[0x23B819D64](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2542B6C78);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B819D58](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2376BF180()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2376BF1A4()
{
  return sub_2376BE08C();
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

ValueMetadata *type metadata accessor for CalendarIntegrationSupportLog()
{
  return &type metadata for CalendarIntegrationSupportLog;
}

uint64_t sub_2376BF1D4(uint64_t a1)
{
  return sub_2376BF210(a1, qword_2542B7060);
}

uint64_t sub_2376BF1EC(uint64_t a1)
{
  return sub_2376BF210(a1, qword_2542B7078);
}

uint64_t sub_2376BF210(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2376D50B8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2376D50AC();
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

uint64_t sub_2376BF2C4()
{
  return 1;
}

uint64_t sub_2376BF2CC()
{
  sub_2376D54B4();
  sub_2376D54C0();
  return sub_2376D54D8();
}

uint64_t sub_2376BF30C()
{
  return sub_2376D54C0();
}

uint64_t sub_2376BF330()
{
  sub_2376D54B4();
  sub_2376D54C0();
  return sub_2376D54D8();
}

uint64_t sub_2376BF37C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v4 = v2;
  v6 = *a1;
  v7 = a1[1];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6C38);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = v6;
  v55 = v7;
  sub_2376C0844((uint64_t)&v54, (uint64_t)v10);
  v11 = sub_2376D504C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376D4FD4();
  if (v3)
    return sub_2376C589C((uint64_t)v10, &qword_2542B6C38);
  v52 = v12;
  v53 = v11;
  v50 = a2;
  v16 = sub_2376D5070();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376D5028();
  sub_2376C0E94(&v54);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  v49 = v54;
  v51 = v55;
  v20 = sub_2376D5040();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376D5034();
  v24 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v23, v20);
  if (MEMORY[0x24BE7E068] && v24 == *MEMORY[0x24BE7E068])
  {
    (*(void (**)(char *, uint64_t))(v21 + 96))(v23, v20);
    v25 = sub_2376D501C();
    v48 = &v44;
    v26 = *(_QWORD *)(v25 - 8);
    MEMORY[0x24BDAC7A8](v25);
    v28 = (char *)&v44 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v23, v25);
    v29 = sub_2376D5010();
    sub_2376C3F10(v29);
    v31 = v30;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v53);
    result = sub_2376C589C((uint64_t)v10, &qword_2542B6C38);
    v32 = 0;
    v33 = 0;
    v34 = 0;
LABEL_9:
    v43 = v50;
    *v50 = v49;
    v43[1] = v51;
    v43[2] = v31;
    v43[3] = v32;
    v43[4] = v33;
    *((_BYTE *)v43 + 40) = v34;
    return result;
  }
  if (MEMORY[0x24BE7E060] && v24 == *MEMORY[0x24BE7E060])
  {
    (*(void (**)(char *, uint64_t))(v21 + 96))(v23, v20);
    v47 = sub_2376D5004();
    v48 = &v44;
    v35 = *(_QWORD *)(v47 - 8);
    MEMORY[0x24BDAC7A8](v47);
    v37 = (char *)&v44 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *))(v35 + 32))(v37, v23);
    v38 = sub_2376D4FEC();
    sub_2376C3F10(v38);
    v45 = v39;
    swift_bridgeObjectRelease();
    v40 = sub_2376D4FF8();
    sub_2376C3F10(v40);
    v46 = v41;
    swift_bridgeObjectRelease();
    v42 = sub_2376D4FE0();
    swift_retain();
    v33 = sub_2376C42D4(v42, v4);
    v31 = v45;
    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v47);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v53);
    result = sub_2376C589C((uint64_t)v10, &qword_2542B6C38);
    v32 = v46;
    v34 = 1;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  sub_2376C5A24();
  swift_allocError();
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v53);
  sub_2376C589C((uint64_t)v10, &qword_2542B6C38);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, v20);
}

id sub_2376BF7DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  id v20[2];

  v2 = v1;
  v20[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_retain();
  sub_2376C071C(a1);
  v4 = *(void **)(v1 + 16);
  sub_2376BD590(0, &qword_2542B6F98);
  v5 = (void *)sub_2376D516C();
  swift_bridgeObjectRelease();
  v20[0] = 0;
  v6 = objc_msgSend(v4, sel_fetchRemindersWithObjectIDs_error_, v5, v20);

  v7 = v20[0];
  if (v6)
  {
    sub_2376BD590(0, &qword_2542B6FA8);
    sub_2376C58D8();
    v8 = sub_2376D5100();
    v9 = v7;

    if ((v8 & 0xC000000000000001) != 0)
      v10 = sub_2376D52A4();
    else
      v10 = *(_QWORD *)(v8 + 16);
    v12 = *(void **)(a1 + 16);
    if ((void *)v10 != v12)
    {
      if (qword_2542B6D38 != -1)
        swift_once();
      v13 = sub_2376D50B8();
      __swift_project_value_buffer(v13, (uint64_t)qword_2542B7078);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14 = sub_2376D50A0();
      v15 = sub_2376D5208();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = swift_slowAlloc();
        *(_DWORD *)v16 = 134218240;
        v20[0] = v12;
        sub_2376D5268();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2048;
        if ((v8 & 0xC000000000000001) != 0)
          v17 = (void *)sub_2376D52A4();
        else
          v17 = *(void **)(v8 + 16);
        v20[0] = v17;
        sub_2376D5268();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2376B5000, v14, v15, "Requested reminders for %ld ids but only received %ld reminders", (uint8_t *)v16, 0x16u);
        MEMORY[0x23B819E18](v16, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
    v20[0] = (id)sub_2376B9D24(MEMORY[0x24BEE4AF8]);
    MEMORY[0x24BDAC7A8](v20[0]);
    v19[2] = v20;
    v19[3] = v2;
    v11 = (id)sub_2376C49DC(v8, (void (*)(void))sub_2376C5930, (uint64_t)v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = v20[0];
    sub_2376D4EA8();

    swift_willThrow();
  }
  return v11;
}

uint64_t sub_2376BFB24@<X0>(void *a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void *v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t *v59;
  char isUniquelyReferenced_nonNull_native;
  id v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  char *v76;
  uint64_t v77;
  uint64_t result;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t *v86;
  void *v87;
  id v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;

  v8 = sub_2376D4F74();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v89 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_2376D4EE4();
  v11 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v13 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1;
  v93 = a4;
  sub_2376C0068(v14, a4);
  v88 = v14;
  v15 = objc_msgSend(v14, sel_list);
  v16 = objc_msgSend(v15, sel_objectID);
  v17 = v16;
  v85 = a2;
  v18 = *a2;
  v19 = *(_QWORD *)(*a2 + 16);
  v90 = v9;
  v91 = v8;
  v92 = a3;
  if (v19)
  {
    v20 = v16;
    v21 = sub_2376D2B3C((uint64_t)v20);
    if ((v22 & 1) != 0)
    {
      v23 = (uint64_t *)(*(_QWORD *)(v18 + 56) + 48 * v21);
      v25 = *v23;
      v24 = v23[1];
      v27 = v23[2];
      v26 = v23[3];
      v28 = v23[4];
      v29 = v23[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2376BCC44(v28, v29);

      v30 = type metadata accessor for IntegrationEntry(0);
      v31 = v93;
      v32 = (char *)v93 + *(int *)(v30 + 52);
      sub_2376C5994(*(_QWORD *)v32, *((_QWORD *)v32 + 1), *((_QWORD *)v32 + 2), *((_QWORD *)v32 + 3), *((_QWORD *)v32 + 4), *((_QWORD *)v32 + 5));
      *(_QWORD *)v32 = v25;
      *((_QWORD *)v32 + 1) = v24;
      *((_QWORD *)v32 + 2) = v27;
      *((_QWORD *)v32 + 3) = v26;
      *((_QWORD *)v32 + 4) = v28;
      *((_QWORD *)v32 + 5) = v29;
      goto LABEL_6;
    }

  }
  v33 = v17;
  v34 = sub_2376D5094();
  v86 = &v79;
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v79 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = v38;
  v39 = objc_msgSend(v38, sel_color);
  sub_2376D5088();
  v83 = sub_2376D507C();
  v41 = v40;
  v82 = v33;
  v42 = objc_msgSend(v33, sel_urlRepresentation);
  sub_2376D4ECC();

  v43 = sub_2376D4EB4();
  v81 = v43;
  v45 = v44;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v84);
  v46 = sub_2376D513C();
  v84 = v46;
  v48 = v47;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v34);
  *(_QWORD *)&v95 = v46;
  *((_QWORD *)&v95 + 1) = v48;
  v96 = v43;
  v97 = v45;
  v49 = v83;
  v98 = v83;
  v99 = v41;
  v50 = type metadata accessor for IntegrationEntry(0);
  v51 = v41;
  v31 = v93;
  v52 = (uint64_t *)((char *)v93 + *(int *)(v50 + 52));
  v53 = *v52;
  v54 = v52[1];
  v55 = v52[3];
  v86 = (uint64_t *)v52[2];
  v56 = v52[4];
  v80 = v52[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2376BCC44(v49, v51);
  v57 = v56;
  v17 = v82;
  sub_2376C5994(v53, v54, (uint64_t)v86, v55, v57, v80);
  *v52 = v84;
  v52[1] = v48;
  v52[2] = v81;
  v52[3] = v45;
  v52[4] = v49;
  v52[5] = v51;
  v58 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2376BCC44(v49, v51);
  v59 = v85;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v94 = *v59;
  *v59 = 0x8000000000000000;
  sub_2376D3664(&v95, v58, isUniquelyReferenced_nonNull_native);
  *v59 = v94;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_2376C5800(v49, v51);
  v15 = v87;
LABEL_6:
  v61 = objc_msgSend(v15, sel_account);
  v62 = objc_msgSend(v61, sel_externalIdentifier);

  if (v62)
  {
    v63 = sub_2376D513C();
    v65 = v64;

  }
  else
  {
    v63 = 0;
    v65 = 0;
  }
  v66 = sub_2376C113C(v63, v65);
  v68 = v67;
  swift_bridgeObjectRelease();
  v69 = type metadata accessor for IntegrationEntry(0);
  v70 = (uint64_t *)((char *)v31 + *(int *)(v69 + 56));
  swift_bridgeObjectRelease();
  *v70 = v66;
  v70[1] = v68;
  v71 = (uint64_t *)((char *)v31 + *(int *)(v69 + 60));
  v72 = v71[1];
  if (v72)
  {
    v73 = *v71;
    swift_bridgeObjectRetain();

  }
  else
  {
    v74 = objc_msgSend(v88, sel_objectID);
    v75 = objc_msgSend(v74, sel_uuid);

    v76 = v89;
    sub_2376D4F68();

    v73 = sub_2376D4F5C();
    v72 = v77;

    (*(void (**)(char *, uint64_t))(v90 + 8))(v76, v91);
  }
  result = swift_bridgeObjectRelease();
  *v71 = v73;
  v71[1] = v72;
  return result;
}

uint64_t sub_2376C0068@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v18;
  _QWORD *v19;
  uint64_t *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  void *v45;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
  MEMORY[0x24BDAC7A8](v4);
  v43 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_2376D4EE4();
  v9 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for IntegrationEntry(0);
  v40 = (uint64_t)a2 + v12[7];
  v13 = v40;
  v14 = sub_2376D4FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = (uint64_t)a2 + v12[12];
  v16 = type metadata accessor for IntegrationRecurrence(0);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v42 = v15;
  v17(v15, 1, 1, v16);
  v18 = (char *)a2 + v12[13];
  *((_OWORD *)v18 + 1) = 0u;
  *((_OWORD *)v18 + 2) = 0u;
  *(_OWORD *)v18 = 0u;
  v19 = (uint64_t *)((char *)a2 + v12[14]);
  *v19 = 0;
  v19[1] = 0;
  v20 = (uint64_t *)((char *)a2 + v12[15]);
  *v20 = 0;
  v20[1] = 0;
  v44 = v20;
  v21 = objc_msgSend(a1, sel_objectID);
  v22 = objc_msgSend(v21, sel_urlRepresentation);

  sub_2376D4ECC();
  v23 = sub_2376D4EB4();
  v25 = v24;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v41);
  *a2 = v23;
  a2[1] = v25;
  REMReminder.startDate.getter((uint64_t)a2 + v12[5]);
  REMReminder.startDate.getter((uint64_t)a2 + v12[6]);
  REMReminder.timeZone.getter((uint64_t)v8);
  sub_2376C59E0((uint64_t)v8, v40, &qword_2542B6F28);
  v26 = objc_msgSend(a1, sel_titleAsString);
  if (v26)
  {
    v27 = v26;
    v28 = sub_2376D513C();
    v30 = v29;

  }
  else
  {
    v28 = 0;
    v30 = 0xE000000000000000;
  }
  v31 = (uint64_t *)((char *)a2 + v12[8]);
  *v31 = v28;
  v31[1] = v30;
  *((_BYTE *)a2 + v12[9]) = REMReminder.allDay.getter() & 1;
  *((_BYTE *)a2 + v12[10]) = objc_msgSend(a1, sel_isCompleted);
  v32 = v43;
  REMReminder.recurrence.getter(v43);
  sub_2376C59E0(v32, v42, &qword_2542B6F68);
  v45 = a1;
  sub_2376BD590(0, &qword_2542B6FA8);
  sub_2376D4FC8();
  *(uint64_t *)((char *)a2 + v12[11]) = REMReminderDefaultPriorityForPriorityLevel();
  sub_2376C5994(*(_QWORD *)v18, *((_QWORD *)v18 + 1), *((_QWORD *)v18 + 2), *((_QWORD *)v18 + 3), *((_QWORD *)v18 + 4), *((_QWORD *)v18 + 5));
  *((_OWORD *)v18 + 1) = 0u;
  *((_OWORD *)v18 + 2) = 0u;
  *(_OWORD *)v18 = 0u;
  swift_bridgeObjectRelease();
  *v19 = 0;
  v19[1] = 0;
  v33 = objc_msgSend(a1, sel_externalIdentifier);
  if (v33)
  {
    v34 = v33;
    v35 = sub_2376D513C();
    v37 = v36;

  }
  else
  {

    v35 = 0;
    v37 = 0;
  }
  v38 = v44;
  result = swift_bridgeObjectRelease();
  *v38 = v35;
  v38[1] = v37;
  return result;
}

uint64_t sub_2376C03E0(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  swift_retain();
  sub_2376C0560(a1);
  v3 = *(void **)(v1 + 16);
  v4 = sub_2376BD590(0, &qword_2542B6F98);
  v5 = (void *)sub_2376D516C();
  swift_bridgeObjectRelease();
  v13[0] = 0;
  v6 = objc_msgSend(v3, sel_fetchListsWithObjectIDs_error_, v5, v13);

  v7 = v13[0];
  if (v6)
  {
    sub_2376BD590(0, &qword_256807C38);
    sub_2376C58D8();
    v8 = sub_2376D5100();
    v9 = v7;

    swift_retain();
    sub_2376C4D78(v8);
    v4 = v10;
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    v11 = v13[0];
    sub_2376D4EA8();

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_2376C0560(uint64_t a1)
{
  uint64_t v1;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v15 = MEMORY[0x24BEE4AF8];
  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
  {
    swift_retain();
    v13 = MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v3 = (unint64_t *)(a1 + 56);
  do
  {
    v5 = *(v3 - 3);
    v4 = *(v3 - 2);
    v7 = *(v3 - 1);
    v6 = *v3;
    if (v5 == sub_2376D513C() && v4 == v8)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v10 = sub_2376D5454();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_4;
      }
    }
    v11 = sub_2376C5390(v7, v6);
    swift_bridgeObjectRelease();
    v12 = swift_bridgeObjectRelease();
    if (v11)
    {
      MEMORY[0x23B8195E4](v12);
      if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2376D519C();
      sub_2376D51A8();
      sub_2376D5190();
    }
LABEL_4:
    v3 += 4;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  v13 = v15;
LABEL_18:
  swift_release_n();
  return v13;
}

uint64_t sub_2376C071C(uint64_t a1)
{
  uint64_t v1;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    v3 = (unint64_t *)(a1 + 40);
    do
    {
      v5 = *(v3 - 1);
      v4 = *v3;
      swift_bridgeObjectRetain();
      v6 = sub_2376C5390(v5, v4);
      v7 = swift_bridgeObjectRelease();
      if (v6)
      {
        MEMORY[0x23B8195E4](v7);
        if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2376D519C();
        sub_2376D51A8();
        sub_2376D5190();
      }
      v3 += 2;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
    v8 = v10;
  }
  else
  {
    swift_retain();
    v8 = MEMORY[0x24BEE4AF8];
  }
  swift_release_n();
  return v8;
}

uint64_t sub_2376C0844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, _QWORD, uint64_t, uint64_t);
  int v33;
  uint64_t v34;
  os_log_type_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  unint64_t v39;

  if (!*(_QWORD *)(a1 + 8))
  {
    if (qword_2542B6D38 != -1)
      swift_once();
    v10 = sub_2376D50B8();
    __swift_project_value_buffer(v10, (uint64_t)qword_2542B7078);
    v6 = sub_2376D50A0();
    v7 = sub_2376D5208();
    if (!os_log_type_enabled(v6, v7))
      goto LABEL_12;
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    v9 = "Token missing; will do a full reminder sync";
    goto LABEL_11;
  }
  v3 = sub_2376D4EF0();
  if (v4 >> 60 == 15)
  {
    if (qword_2542B6D38 != -1)
      swift_once();
    v5 = sub_2376D50B8();
    __swift_project_value_buffer(v5, (uint64_t)qword_2542B7078);
    v6 = sub_2376D50A0();
    v7 = sub_2376D5208();
    if (!os_log_type_enabled(v6, v7))
      goto LABEL_12;
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    v9 = "Token encoding not valid; will do a full reminder sync";
LABEL_11:
    _os_log_impl(&dword_2376B5000, v6, v7, v9, v8, 2u);
    MEMORY[0x23B819E18](v8, -1, -1);
LABEL_12:

    v11 = sub_2376D5070();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a2, 1, 1, v11);
  }
  v13 = v3;
  v14 = v4;
  sub_2376D4E78();
  swift_allocObject();
  sub_2376D4E6C();
  sub_2376C5844();
  sub_2376D4E60();
  swift_release();
  v17 = v38;
  v16 = v39;
  if (v37)
  {
    if (qword_2542B6D38 != -1)
      swift_once();
    v18 = sub_2376D50B8();
    __swift_project_value_buffer(v18, (uint64_t)qword_2542B7078);
    sub_2376BCC44(v38, v39);
    v19 = sub_2376D50A0();
    v20 = sub_2376D5208();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      *(_DWORD *)v21 = 67109376;
      sub_2376D5268();
      sub_2376C5800(v17, v16);
      *(_WORD *)(v21 + 8) = 1024;
      v37 = 0;
      sub_2376D5268();
      v22 = "Token version has changed (have = %u; current = %u); will do a full reminder sync";
      v23 = v19;
      v24 = v20;
      v25 = (uint8_t *)v21;
      v26 = 14;
LABEL_28:
      _os_log_impl(&dword_2376B5000, v23, v24, v22, v25, v26);
      MEMORY[0x23B819E18](v21, -1, -1);
      sub_2376C5888(v13, v14);

      sub_2376C5800(v17, v16);
      goto LABEL_15;
    }
    sub_2376C5800(v38, v39);
    sub_2376C5888(v13, v14);
    sub_2376C5800(v38, v39);
    goto LABEL_14;
  }
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6C38);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v36 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376BCC44(v38, v39);
  sub_2376D5064();
  v30 = sub_2376D5070();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56);
  v32(v29, 0, 1, v30);
  v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30);
  if (v33 == 1)
  {
    sub_2376C589C((uint64_t)v29, &qword_2542B6C38);
    if (qword_2542B6D38 != -1)
      swift_once();
    v34 = sub_2376D50B8();
    __swift_project_value_buffer(v34, (uint64_t)qword_2542B7078);
    v19 = sub_2376D50A0();
    v35 = sub_2376D5208();
    if (os_log_type_enabled(v19, v35))
    {
      v21 = swift_slowAlloc();
      *(_WORD *)v21 = 0;
      v22 = "Token can't be decoded; will do a full reminder sync";
      v23 = v19;
      v24 = v35;
      v25 = (uint8_t *)v21;
      v26 = 2;
      goto LABEL_28;
    }
    sub_2376C5800(v17, v16);
    sub_2376C5888(v13, v14);
LABEL_14:

LABEL_15:
    v15 = sub_2376D5070();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
  sub_2376C5888(v13, v14);
  sub_2376C5800(v17, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(a2, v29, v30);
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v32)(a2, 0, 1, v30);
}

uint64_t sub_2376C0E94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v2 = sub_2376D5058();
  v4 = v3;
  sub_2376D4E9C();
  swift_allocObject();
  sub_2376BCC44(v2, v4);
  sub_2376D4E90();
  sub_2376C57BC();
  v5 = sub_2376D4E84();
  v7 = v6;
  swift_release();
  v8 = sub_2376D4F08();
  v10 = v9;
  sub_2376C5800(v5, v7);
  sub_2376C5800(v2, v4);
  result = sub_2376C5800(v2, v4);
  *a1 = v8;
  a1[1] = v10;
  return result;
}

uint64_t sub_2376C113C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v25;

  if (a2)
  {
    v4 = v2;
    v6 = *(_QWORD *)(v2 + 32);
    v7 = *(_QWORD *)(v6 + 16);
    swift_bridgeObjectRetain();
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = sub_2376D2AD8(a1, a2);
      if ((v9 & 1) != 0)
      {
        a1 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 16 * v8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        return a1;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v10 = *(void **)(v4 + 24);
    if (v10)
    {
      v11 = *(id *)(v4 + 24);
    }
    else
    {
      v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB4398]), sel_init);
      v13 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = v12;
      v11 = v12;

      v10 = 0;
    }
    v14 = v10;
    v15 = (void *)sub_2376D5130();
    v16 = objc_msgSend(v11, sel_accountWithIdentifier_, v15);

    if (v16)
    {
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v16, sel_cal_personaIdentifier);
      if (v17)
      {
        v18 = v17;
        a1 = sub_2376D513C();

        return a1;
      }

    }
    else
    {
      if (qword_2542B6C40 != -1)
        swift_once();
      v19 = sub_2376D50B8();
      __swift_project_value_buffer(v19, (uint64_t)qword_2542B7060);
      swift_bridgeObjectRetain();
      v20 = sub_2376D50A0();
      v21 = sub_2376D5208();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v25 = v23;
        *(_DWORD *)v22 = 136315138;
        swift_bridgeObjectRetain();
        sub_2376BBA08(a1, a2, &v25);
        sub_2376D5268();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2376B5000, v20, v21, "Could not find account with identifier %s", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B819E18](v23, -1, -1);
        MEMORY[0x23B819E18](v22, -1, -1);

        return 0;
      }

      swift_bridgeObjectRelease_n();
    }

    return 0;
  }
  return a1;
}

uint64_t sub_2376C1434()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2376C1468@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2376BF37C(a1, a2);
}

id sub_2376C1488(uint64_t a1)
{
  return sub_2376BF7DC(a1);
}

uint64_t sub_2376C14A8(uint64_t a1)
{
  return sub_2376C03E0(a1);
}

uint64_t REMReminder.identifier.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v1 = sub_2376D4EE4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_objectID);
  v6 = objc_msgSend(v5, sel_urlRepresentation);

  sub_2376D4ECC();
  v7 = sub_2376D4EB4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v7;
}

uint64_t REMReminder.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  id v24;
  void *v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v2 = v1;
  v59 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F20);
  MEMORY[0x24BDAC7A8](v3);
  v57 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2376D4F80();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2376D4FA4();
  v55 = *(_QWORD *)(v9 - 8);
  v56 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v58 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F10);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2376D4E54();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v54 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v54 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v54 - v21;
  v23 = v2;
  v24 = objc_msgSend(v2, sel_effectiveDisplayDateComponents_forCalendar);
  if (v24)
  {
    v25 = v24;
    sub_2376D4E30();

    v26 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v26(v13, v20, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
    {
      v26(v22, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCEF70], v5);
      v27 = v58;
      sub_2376D4F8C();
      v28 = *(void (**)(char *, uint64_t))(v6 + 8);
      v29 = v22;
      v28(v8, v5);
      v30 = (uint64_t)v57;
      sub_2376D4F98();
      v31 = sub_2376D4F50();
      v32 = *(_QWORD *)(v31 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) == 1)
      {
        sub_2376C589C(v30, &qword_2542B6F20);
        if (qword_2542B6C40 != -1)
          swift_once();
        v33 = sub_2376D50B8();
        __swift_project_value_buffer(v33, (uint64_t)qword_2542B7060);
        v34 = v54;
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v54, v29, v14);
        v35 = sub_2376D50A0();
        v36 = sub_2376D5208();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          v38 = swift_slowAlloc();
          v61 = v38;
          *(_DWORD *)v37 = 136315138;
          sub_2376C33F0();
          v39 = sub_2376D5448();
          v60 = sub_2376BBA08(v39, v40, &v61);
          v27 = v58;
          sub_2376D5268();
          swift_bridgeObjectRelease();
          v41 = *(void (**)(char *, uint64_t))(v15 + 8);
          v41(v54, v14);
          _os_log_impl(&dword_2376B5000, v35, v36, "We got a reminder with a due date that couldn't be converted to a date: %s", v37, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B819E18](v38, -1, -1);
          MEMORY[0x23B819E18](v37, -1, -1);
        }
        else
        {
          v41 = *(void (**)(char *, uint64_t))(v15 + 8);
          v41(v34, v14);
        }

        sub_2376D4F20();
        (*(void (**)(char *, uint64_t))(v55 + 8))(v27, v56);
        return ((uint64_t (*)(char *, uint64_t))v41)(v29, v14);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v55 + 8))(v27, v56);
        (*(void (**)(char *, uint64_t))(v15 + 8))(v29, v14);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v59, v30, v31);
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  }
  sub_2376C589C((uint64_t)v13, &qword_2542B6F10);
  if (qword_2542B6C40 != -1)
    swift_once();
  v42 = sub_2376D50B8();
  __swift_project_value_buffer(v42, (uint64_t)qword_2542B7060);
  v43 = v23;
  v44 = sub_2376D50A0();
  v45 = sub_2376D5208();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    v61 = v47;
    *(_DWORD *)v46 = 136315138;
    v48 = objc_msgSend(v43, sel_titleAsString);
    if (v48)
    {
      v49 = v48;
      v50 = sub_2376D513C();
      v52 = v51;

    }
    else
    {
      v50 = 0;
      v52 = 0xE000000000000000;
    }
    v60 = sub_2376BBA08(v50, v52, &v61);
    sub_2376D5268();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2376B5000, v44, v45, "We ended up with a reminder without a due date: \"%s\"", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B819E18](v47, -1, -1);
    MEMORY[0x23B819E18](v46, -1, -1);

  }
  else
  {

  }
  return sub_2376D4F20();
}

uint64_t REMReminder.title.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_titleAsString);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2376D513C();

  return v3;
}

uint64_t REMReminder.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
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
  id v14;
  void *v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F10);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2376D4E54();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - v12;
  v14 = objc_msgSend(v2, sel_effectiveDisplayDateComponents_forCalendar);
  if (v14)
  {
    v15 = v14;
    sub_2376D4E30();

    v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v16(v6, v11, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      v16(v13, v6, v7);
      sub_2376D4E48();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  sub_2376C589C((uint64_t)v6, &qword_2542B6F10);
  v18 = sub_2376D4FBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a1, 1, 1, v18);
}

uint64_t REMReminder.allDay.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  char v15;
  uint64_t v16;
  uint64_t v18;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F10);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2376D4E54();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - v10;
  v12 = objc_msgSend(v1, sel_dueDateComponents);
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  v13 = v12;
  sub_2376D4E30();

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_2376C589C((uint64_t)v4, &qword_2542B6F10);
    return 0;
  }
  v14(v11, v4, v5);
  sub_2376D4E3C();
  v16 = v15 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v16;
}

id REMReminder.completed.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_isCompleted);
}

uint64_t REMReminder.priority.getter()
{
  sub_2376BD590(0, &qword_2542B6FA8);
  sub_2376D4FC8();
  return REMReminderDefaultPriorityForPriorityLevel();
}

void REMReminder.recurrence.getter(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
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
  char *v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void (*v30)(char *, char *, unint64_t);
  unint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  int v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  void *v44;
  id v45;
  char v46;
  id v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  id v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  unint64_t v66;
  uint64_t v67;
  id v68;
  unint64_t v69;
  unint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  int v77;
  int v78;
  id v79;
  uint64_t v80;
  char *v81;
  unint64_t *v82;
  char v83;
  char v84;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2376D4F50();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v75 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v75 - v18;
  if (objc_msgSend(v2, sel_isCompleted))
    goto LABEL_2;
  v20 = objc_msgSend(v2, sel_recurrenceRules);
  if (!v20)
    goto LABEL_15;
  v21 = v20;
  v81 = v17;
  sub_2376BD590(0, &qword_2542B6FB8);
  v22 = sub_2376D5184();

  if (!(v22 >> 62))
  {
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
LABEL_43:
    swift_bridgeObjectRelease();
LABEL_2:
    v20 = 0;
LABEL_15:
    v33 = type metadata accessor for IntegrationRecurrence((uint64_t)v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(a1, 1, 1, v33);
    return;
  }
  swift_bridgeObjectRetain();
  v51 = sub_2376D53DC();
  swift_bridgeObjectRelease();
  if (!v51)
    goto LABEL_43;
LABEL_6:
  v82 = (unint64_t *)v19;
  v80 = a1;
  if ((v22 & 0xC000000000000001) != 0)
  {
    v23 = (id)MEMORY[0x23B819770](0, v22);
  }
  else
  {
    if (!*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_46;
    }
    v23 = *(id *)(v22 + 32);
  }
  v2 = v23;
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(v2, sel_frequency);
  v25 = 0x4030201uLL >> (8 * v24);
  if ((unint64_t)v24 >= 5)
    LODWORD(v25) = 3;
  v78 = v25;
  v79 = objc_msgSend(v2, sel_interval);
  v26 = objc_msgSend(v2, sel_recurrenceEnd);
  if (!v26)
  {
    v34 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    (*(void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v82, 1, 1, v34);
    goto LABEL_21;
  }
  v27 = v26;
  v28 = objc_msgSend(v26, sel_endDate);
  if (!v28)
  {
    (*(void (**)(char *, uint64_t, uint64_t, unint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_18;
  }
  v29 = v28;
  sub_2376D4F44();

  v30 = *(void (**)(char *, char *, unint64_t))(v8 + 32);
  v30(v6, v11, v7);
  (*(void (**)(char *, _QWORD, uint64_t, unint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_18:
    sub_2376C589C((uint64_t)v6, &qword_2542B6F20);
    v35 = (unint64_t)objc_msgSend(v27, sel_occurrenceCount);

    if ((v35 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_65;
    }
    v31 = v82;
    *v82 = v35;
    v32 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    goto LABEL_20;
  }

  v30(v13, v6, v7);
  v31 = v82;
  v30((char *)v82, v13, v7);
  v32 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
LABEL_20:
  swift_storeEnumTagMultiPayload();
  (*(void (**)(unint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 0, 1, v32);
LABEL_21:
  v36 = objc_msgSend(v2, sel_firstDayOfTheWeek);
  if ((unint64_t)v36 >= 8)
    v37 = 7;
  else
    v37 = 0x605040302010007uLL >> (8 * v36);
  v38 = objc_msgSend(v2, sel_daysOfTheWeek);
  v77 = v37;
  if (v38)
  {
    v39 = v38;
    sub_2376BD590(0, &qword_256807C30);
    v7 = sub_2376D5184();

    if (!(v7 >> 62))
    {
      v40 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      v76 = v2;
      if (v40)
        goto LABEL_27;
      goto LABEL_47;
    }
LABEL_46:
    swift_bridgeObjectRetain();
    v40 = sub_2376D53DC();
    swift_bridgeObjectRelease();
    v76 = v2;
    if (v40)
    {
LABEL_27:
      if (v40 >= 1)
      {
        v41 = 0;
        v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
        do
        {
          if ((v7 & 0xC000000000000001) != 0)
            v43 = (id)MEMORY[0x23B819770](v41, v7);
          else
            v43 = *(id *)(v7 + 8 * v41 + 32);
          v44 = v43;
          v45 = objc_msgSend(v43, sel_dayOfTheWeek);
          if ((unint64_t)v45 >= 8)
            v46 = 1;
          else
            v46 = 0x605040302010001uLL >> (8 * v45);
          v47 = objc_msgSend(v44, sel_weekNumber);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v42 = sub_2376C32E4(0, v42[2] + 1, 1, v42);
          v49 = v42[2];
          v48 = v42[3];
          if (v49 >= v48 >> 1)
            v42 = sub_2376C32E4((_QWORD *)(v48 > 1), v49 + 1, 1, v42);
          ++v41;
          v42[2] = v49 + 1;
          v50 = &v42[2 * v49];
          *((_BYTE *)v50 + 32) = v46;
          v50[5] = v47;

        }
        while (v40 != v41);
        goto LABEL_48;
      }
LABEL_65:
      __break(1u);
      return;
    }
LABEL_47:
    v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_48:
    swift_bridgeObjectRelease();
    v2 = v76;
    goto LABEL_49;
  }
  v42 = 0;
LABEL_49:
  v52 = objc_msgSend(v2, sel_daysOfTheMonth);
  if (v52)
  {
    v53 = v52;
    sub_2376BD590(0, &qword_256807C28);
    v54 = sub_2376D5184();

    v55 = sub_2376C28B4(v54);
    swift_bridgeObjectRelease();
  }
  else
  {
    v55 = 0;
  }
  v56 = objc_msgSend(v2, sel_daysOfTheYear);
  if (v56)
  {
    v57 = v56;
    sub_2376BD590(0, &qword_256807C28);
    v58 = sub_2376D5184();

    v59 = sub_2376C28B4(v58);
    swift_bridgeObjectRelease();
  }
  else
  {
    v59 = 0;
  }
  v60 = objc_msgSend(v2, sel_weeksOfTheYear);
  if (v60)
  {
    v61 = v60;
    sub_2376BD590(0, &qword_256807C28);
    v62 = sub_2376D5184();

    v63 = sub_2376C28B4(v62);
    swift_bridgeObjectRelease();
  }
  else
  {
    v63 = 0;
  }
  v64 = objc_msgSend(v2, sel_monthsOfTheYear);
  if (v64)
  {
    v65 = v64;
    sub_2376BD590(0, &qword_256807C28);
    v66 = sub_2376D5184();

    v67 = sub_2376C28B4(v66);
    swift_bridgeObjectRelease();
  }
  else
  {
    v67 = 0;
  }
  v68 = objc_msgSend(v2, sel_setPositions);
  if (v68)
  {
    sub_2376BD590(0, &qword_256807C28);
    v69 = sub_2376D5184();

    v68 = (id)sub_2376C28B4(v69);
    swift_bridgeObjectRelease();
  }
  v84 = v78;
  v71 = (uint64_t)v81;
  v70 = v82;
  sub_2376C3438((uint64_t)v82, (uint64_t)v81);
  v83 = v77;
  v74 = (uint64_t)v68;
  v72 = v80;
  IntegrationRecurrence.init(frequency:interval:recurrenceEnd:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:daysOfTheYear:weeksOfTheYear:monthsOfTheYear:setPositions:)(&v84, (uint64_t)v79, v71, &v83, (uint64_t)v42, v55, v59, v63, v80, v67, v74);

  sub_2376C589C((uint64_t)v70, &qword_2542B6F48);
  v73 = type metadata accessor for IntegrationRecurrence(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 56))(v72, 0, 1, v73);
}

uint64_t sub_2376C28B4(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v9;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2376D53DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v9 = MEMORY[0x24BEE4AF8];
  sub_2376C34D8(0, v3 & ~(v3 >> 63), 0);
  v4 = v9;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v6 = sub_2376D53DC();
    swift_bridgeObjectRelease();
    if (!v6)
      return v4;
  }
  else if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return v4;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    MEMORY[0x23B819770](0, a1);
    sub_2376D51E4();
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = *(id *)(a1 + 32);
    sub_2376D51E4();

  }
  swift_release();
  return 0;
}

double REMReminder.color.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t REMReminder.personaIdentifier.getter()
{
  return 0;
}

uint64_t sub_2376C2AFC()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v1 = sub_2376D4EE4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(*v0, sel_objectID);
  v6 = objc_msgSend(v5, sel_urlRepresentation);

  sub_2376D4ECC();
  v7 = sub_2376D4EB4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v7;
}

uint64_t sub_2376C2BD0@<X0>(uint64_t a1@<X8>)
{
  return REMReminder.startDate.getter(a1);
}

uint64_t sub_2376C2BF0@<X0>(uint64_t a1@<X8>)
{
  return REMReminder.timeZone.getter(a1);
}

uint64_t sub_2376C2C10()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_titleAsString);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2376D513C();

  return v3;
}

uint64_t sub_2376C2C74()
{
  return REMReminder.allDay.getter() & 1;
}

id sub_2376C2C98()
{
  id *v0;

  return objc_msgSend(*v0, sel_isCompleted);
}

uint64_t sub_2376C2CB8()
{
  sub_2376BD590(0, &qword_2542B6FA8);
  sub_2376D4FC8();
  return REMReminderDefaultPriorityForPriorityLevel();
}

void sub_2376C2D0C(uint64_t a1@<X8>)
{
  REMReminder.recurrence.getter(a1);
}

double sub_2376C2D2C@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_2376C2D3C()
{
  return 0;
}

uint64_t sub_2376C2D48()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_externalIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2376D513C();

  return v3;
}

BOOL sub_2376C2DAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s26CalendarIntegrationSupport0B10RecurrenceV9FrequencyO9hashValueSivg_0()
{
  sub_2376D54B4();
  sub_2376D54C0();
  return sub_2376D54D8();
}

uint64_t sub_2376C2E08()
{
  return sub_2376D54C0();
}

uint64_t sub_2376C2E30()
{
  sub_2376D54B4();
  sub_2376D54C0();
  return sub_2376D54D8();
}

uint64_t sub_2376C2E70()
{
  _BYTE *v0;

  if (*v0)
    return 1635017060;
  else
    return 0x6E6F6973726576;
}

uint64_t sub_2376C2EA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2376C5DFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2376C2EC8()
{
  return 0;
}

void sub_2376C2ED4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2376C2EE0()
{
  sub_2376C5D74();
  return sub_2376D54FC();
}

uint64_t sub_2376C2F08()
{
  sub_2376C5D74();
  return sub_2376D5508();
}

uint64_t sub_2376C2F30(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v13 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6CE8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2376C5D74();
  sub_2376D54F0();
  LOBYTE(v14) = 0;
  sub_2376D543C();
  if (!v4)
  {
    v14 = a3;
    v15 = v13;
    v16 = 1;
    sub_2376C5DB8();
    sub_2376D5430();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2376C306C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_2376C5EDC(a1);
  if (!v2)
  {
    *(_DWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_2376C3098(_QWORD *a1)
{
  unsigned int *v1;

  return sub_2376C2F30(a1, *v1, *((_QWORD *)v1 + 1), *((_QWORD *)v1 + 2));
}

_QWORD *sub_2376C30B4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542B7050);
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
    sub_2376C3E20(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2376C31C0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256807C40);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2376C4C84(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2376C32E4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256807C58);
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
    sub_2376C52A8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2376C33F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256807C20;
  if (!qword_256807C20)
  {
    v1 = sub_2376D4E54();
    result = MEMORY[0x23B819D64](MEMORY[0x24BDCBE28], v1);
    atomic_store(result, (unint64_t *)&qword_256807C20);
  }
  return result;
}

uint64_t sub_2376C3438(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ReminderIntegrationDataSource()
{
  return objc_opt_self();
}

uint64_t sub_2376C34A0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2376C34F4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2376C34BC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2376C365C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2376C34D8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2376C383C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2376C34F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256807C50);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2376D540C();
  __break(1u);
  return result;
}

uint64_t sub_2376C365C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B7040);
  v10 = *(_QWORD *)(type metadata accessor for IntegrationEntry(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for IntegrationEntry(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_2376D540C();
  __break(1u);
  return result;
}

uint64_t sub_2376C383C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256807C60);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2376D540C();
  __break(1u);
  return result;
}

void sub_2376C3998(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v6;
  char v7;
  void *v8;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        sub_2376D528C();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_2376D537C() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_2376D5388();
  sub_2376C5988(a1, a2, 1);
  sub_2376BD590(0, &qword_2542B6F98);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_2376D2B3C((uint64_t)v8);
  v7 = v6;

  if ((v7 & 1) != 0)
  {
    sub_2376D5364();
    sub_2376D53A0();
    sub_2376C597C(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_2376C3B34(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if ((a1 & 0xC000000000000001) != 0)
    return sub_2376D534C();
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v1 = 1 << v5;
  if (v6 < 7)
    return v1;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v3 = 64;
  while (v8)
  {
    v10 = *v9++;
    v2 = v10;
    --v8;
    v3 += 64;
    if (v10)
      return __clz(__rbit64(v2)) + v3;
  }
  return v1;
}

void sub_2376C3BF4(_QWORD *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6;
  char v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if ((a4 & 1) != 0)
    {
      sub_2376D53AC();
      sub_2376BD590(0, &qword_2542B6F98);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_2376BD590(0, &qword_2542B6FA8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_18;
  }
  if ((a4 & 1) != 0)
  {
LABEL_10:
    if (sub_2376D537C() == *(_DWORD *)(a5 + 36))
    {
      sub_2376D5388();
      sub_2376BD590(0, &qword_2542B6F98);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      v6 = sub_2376D2B3C((uint64_t)v13);
      v9 = v8;

      if ((v9 & 1) != 0)
        goto LABEL_12;
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  v10 = *(void **)(*(_QWORD *)(a5 + 48) + 8 * v6);
  v11 = *(void **)(*(_QWORD *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  v12 = v11;
}

uint64_t sub_2376C3E20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2376D540C();
  __break(1u);
  return result;
}

void sub_2376C3F10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD v30[4];
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v2 = sub_2376D4EE4();
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2376D5298();
    sub_2376BD590(0, &qword_2542B6F98);
    sub_2376C58D8();
    sub_2376D51CC();
    a1 = v38;
    v32 = v39;
    v5 = v40;
    v6 = v41;
    v7 = v42;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    v32 = a1 + 56;
    v5 = ~v8;
    v10 = -v8;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v7 = v11 & v9;
    swift_bridgeObjectRetain();
    v6 = 0;
  }
  v30[1] = v5;
  v30[3] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v31 = (unint64_t)(v5 + 64) >> 6;
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v30[2] = MEMORY[0x24BEE4AD0] + 8;
  v35 = a1;
  if (a1 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v7)
    {
      v13 = (v7 - 1) & v7;
      v14 = __clz(__rbit64(v7)) | (v6 << 6);
      v15 = v6;
      goto LABEL_29;
    }
    v19 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v19 >= v31)
      goto LABEL_36;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    v15 = v6 + 1;
    if (!v20)
    {
      v15 = v6 + 2;
      if (v6 + 2 >= v31)
        goto LABEL_36;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v6 + 3;
        if (v6 + 3 >= v31)
          goto LABEL_36;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
        {
          v15 = v6 + 4;
          if (v6 + 4 >= v31)
            goto LABEL_36;
          v20 = *(_QWORD *)(v32 + 8 * v15);
          if (!v20)
          {
            v15 = v6 + 5;
            if (v6 + 5 >= v31)
              goto LABEL_36;
            v20 = *(_QWORD *)(v32 + 8 * v15);
            if (!v20)
            {
              v21 = v6 + 6;
              while (v31 != v21)
              {
                v20 = *(_QWORD *)(v32 + 8 * v21++);
                if (v20)
                {
                  v15 = v21 - 1;
                  goto LABEL_28;
                }
              }
LABEL_36:
              sub_2376BD548();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v13 = (v20 - 1) & v20;
    v14 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_29:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v14);
    v17 = v18;
    if (!v18)
      goto LABEL_36;
    while (1)
    {
      v22 = (void *)MEMORY[0x23B8199D4](v18);
      v23 = objc_msgSend(v17, sel_urlRepresentation);
      sub_2376D4ECC();

      v24 = sub_2376D4EB4();
      v26 = v25;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v34);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = sub_2376C30B4(0, v12[2] + 1, 1, v12);
      v28 = v12[2];
      v27 = v12[3];
      if (v28 >= v27 >> 1)
        v12 = sub_2376C30B4((_QWORD *)(v27 > 1), v28 + 1, 1, v12);
      v12[2] = v28 + 1;
      v29 = &v12[2 * v28];
      v29[4] = v24;
      v29[5] = v26;
      objc_autoreleasePoolPop(v22);

      v6 = v15;
      v7 = v13;
      a1 = v35;
      if ((v35 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      v16 = sub_2376D52B0();
      if (v16)
      {
        v36 = v16;
        sub_2376BD590(0, &qword_2542B6F98);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v17 = v37;
        v18 = (id)swift_unknownObjectRelease();
        v15 = v6;
        v13 = v7;
        if (v17)
          continue;
      }
      goto LABEL_36;
    }
  }
  __break(1u);
}

uint64_t sub_2376C42D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  int64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  uint64_t result;
  _QWORD v57[2];
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;

  v4 = sub_2376D4EE4();
  v67 = *(_QWORD *)(v4 - 8);
  v68 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1 & 0xC000000000000001;
  v57[1] = a2;
  if ((a1 & 0xC000000000000001) != 0)
    v7 = sub_2376D52A4();
  else
    v7 = *(_QWORD *)(a1 + 16);
  v78 = MEMORY[0x24BEE4AF8];
  sub_2376C34A0(0, v7 & ~(v7 >> 63), 0);
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_2376D5298();
    sub_2376BD590(0, &qword_2542B6F98);
    sub_2376C58D8();
    sub_2376D51CC();
    a1 = v73;
    v63 = v74;
    v6 = v76;
    v59 = v75;
    v9 = v77;
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_6;
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v32 = -1 << *(_BYTE *)(a1 + 32);
  v33 = *(_QWORD *)(a1 + 56);
  v63 = a1 + 56;
  v59 = ~v32;
  v34 = -v32;
  if (v34 < 64)
    v35 = ~(-1 << v34);
  else
    v35 = -1;
  v9 = v35 & v33;
  swift_bridgeObjectRetain();
  if (v7 < 0)
    goto LABEL_42;
LABEL_6:
  v65 = *MEMORY[0x24BE14200];
  v8 = MEMORY[0x24BEE4AD0];
  if (v7)
  {
    v64 = v6;
    v10 = 0;
    v61 = a1 & 0x7FFFFFFFFFFFFFFFLL;
    v62 = (unint64_t)(v59 + 64) >> 6;
    v58 = v62 - 1;
    v60 = MEMORY[0x24BEE4AD0] + 8;
    v69 = a1;
    do
    {
      if (v10 == v7)
      {
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
LABEL_77:
        result = swift_release();
        __break(1u);
        return result;
      }
      if (a1 < 0)
      {
        v13 = sub_2376D52B0();
        if (!v13)
          goto LABEL_77;
        v71 = v13;
        sub_2376BD590(0, &qword_2542B6F98);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v14 = v72;
        swift_unknownObjectRelease();
      }
      else
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v12 = v11 | (v64 << 6);
        }
        else
        {
          v15 = v64 + 1;
          if (__OFADD__(v64, 1))
            goto LABEL_75;
          if (v15 >= v62)
            goto LABEL_77;
          v16 = *(_QWORD *)(v63 + 8 * v15);
          v17 = v64 + 1;
          if (!v16)
          {
            v17 = v64 + 2;
            if ((uint64_t)(v64 + 2) >= v62)
              goto LABEL_77;
            v16 = *(_QWORD *)(v63 + 8 * v17);
            if (!v16)
            {
              v17 = v64 + 3;
              if ((uint64_t)(v64 + 3) >= v62)
                goto LABEL_77;
              v16 = *(_QWORD *)(v63 + 8 * v17);
              if (!v16)
              {
                v17 = v64 + 4;
                if ((uint64_t)(v64 + 4) >= v62)
                  goto LABEL_77;
                v16 = *(_QWORD *)(v63 + 8 * v17);
                if (!v16)
                {
                  v17 = v64 + 5;
                  if ((uint64_t)(v64 + 5) >= v62)
                    goto LABEL_77;
                  v16 = *(_QWORD *)(v63 + 8 * v17);
                  if (!v16)
                  {
                    v18 = v64 + 6;
                    do
                    {
                      if (v62 == v18)
                        goto LABEL_77;
                      v16 = *(_QWORD *)(v63 + 8 * v18++);
                    }
                    while (!v16);
                    v17 = v18 - 1;
                  }
                }
              }
            }
          }
          v9 = (v16 - 1) & v16;
          v12 = __clz(__rbit64(v16)) + (v17 << 6);
          v64 = v17;
        }
        v14 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v12);
      }
      if (!v14)
        goto LABEL_77;
      v70 = v9;
      v19 = sub_2376D513C();
      v21 = v20;
      v22 = objc_msgSend(v14, sel_urlRepresentation);
      v23 = v66;
      sub_2376D4ECC();

      v24 = sub_2376D4EB4();
      v26 = v25;
      (*(void (**)(char *, uint64_t))(v67 + 8))(v23, v68);

      v27 = v78;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2376C34A0(0, *(_QWORD *)(v27 + 16) + 1, 1);
        v27 = v78;
      }
      v29 = *(_QWORD *)(v27 + 16);
      v28 = *(_QWORD *)(v27 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_2376C34A0(v28 > 1, v29 + 1, 1);
        v27 = v78;
      }
      ++v10;
      *(_QWORD *)(v27 + 16) = v29 + 1;
      v30 = (_QWORD *)(v27 + 32 * v29);
      v30[4] = v19;
      v30[5] = v21;
      v30[6] = v24;
      v30[7] = v26;
      a1 = v69;
      v9 = v70;
      v8 = MEMORY[0x24BEE4AD0];
    }
    while (v10 != v7);
    v6 = v64;
    v31 = v58;
    goto LABEL_44;
  }
LABEL_43:
  v61 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v62 = (unint64_t)(v59 + 64) >> 6;
  v31 = v62 - 1;
LABEL_44:
  v64 = v31 - 5;
  v60 = v63 + 48;
  v69 = a1;
  v70 = v8 + 8;
  if (a1 < 0)
    goto LABEL_47;
  while (1)
  {
    if (v9)
    {
      v36 = (v9 - 1) & v9;
      v37 = __clz(__rbit64(v9)) | (v6 << 6);
      v38 = v6;
      goto LABEL_66;
    }
    v41 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_76;
    if (v41 >= v62)
      goto LABEL_73;
    v42 = *(_QWORD *)(v63 + 8 * v41);
    v38 = v6 + 1;
    if (!v42)
    {
      v38 = v6 + 2;
      if ((uint64_t)(v6 + 2) >= v62)
        goto LABEL_73;
      v42 = *(_QWORD *)(v63 + 8 * v38);
      if (!v42)
      {
        v38 = v6 + 3;
        if ((uint64_t)(v6 + 3) >= v62)
          goto LABEL_73;
        v42 = *(_QWORD *)(v63 + 8 * v38);
        if (!v42)
        {
          v38 = v6 + 4;
          if ((uint64_t)(v6 + 4) >= v62)
            goto LABEL_73;
          v42 = *(_QWORD *)(v63 + 8 * v38);
          if (!v42)
          {
            v38 = v6 + 5;
            if ((uint64_t)(v6 + 5) >= v62)
              goto LABEL_73;
            v42 = *(_QWORD *)(v63 + 8 * v38);
            if (!v42)
              break;
          }
        }
      }
    }
LABEL_65:
    v36 = (v42 - 1) & v42;
    v37 = __clz(__rbit64(v42)) + (v38 << 6);
LABEL_66:
    v40 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v37);
    if (!v40)
      goto LABEL_73;
    while (1)
    {
      v44 = sub_2376D513C();
      v46 = v45;
      v47 = objc_msgSend(v40, sel_urlRepresentation);
      v48 = v66;
      sub_2376D4ECC();

      v49 = sub_2376D4EB4();
      v51 = v50;
      (*(void (**)(char *, uint64_t))(v67 + 8))(v48, v68);

      v52 = v78;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2376C34A0(0, *(_QWORD *)(v52 + 16) + 1, 1);
        v52 = v78;
      }
      v54 = *(_QWORD *)(v52 + 16);
      v53 = *(_QWORD *)(v52 + 24);
      if (v54 >= v53 >> 1)
      {
        sub_2376C34A0(v53 > 1, v54 + 1, 1);
        v52 = v78;
      }
      *(_QWORD *)(v52 + 16) = v54 + 1;
      v55 = (_QWORD *)(v52 + 32 * v54);
      v55[4] = v44;
      v55[5] = v46;
      v55[6] = v49;
      v55[7] = v51;
      v6 = v38;
      v9 = v36;
      a1 = v69;
      if ((v69 & 0x8000000000000000) == 0)
        break;
LABEL_47:
      v39 = sub_2376D52B0();
      if (v39)
      {
        v71 = v39;
        sub_2376BD590(0, &qword_2542B6F98);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v40 = v72;
        swift_unknownObjectRelease();
        v38 = v6;
        v36 = v9;
        if (v40)
          continue;
      }
      goto LABEL_73;
    }
  }
  v43 = v6;
  while (v64 != v43)
  {
    v42 = *(_QWORD *)(v60 + 8 * v43++);
    if (v42)
    {
      v38 = v43 + 5;
      goto LABEL_65;
    }
  }
LABEL_73:
  sub_2376BD548();
  return v78;
}

uint64_t sub_2376C49DC(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void (*v28)(_QWORD *, _QWORD);
  _QWORD v29[3];
  unint64_t v30;
  uint64_t v31;
  void (*v32)(void);
  uint64_t v33;
  _QWORD v34[4];
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v32 = a2;
  v33 = a3;
  v4 = type metadata accessor for IntegrationEntry(0);
  v31 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v7 = sub_2376D52A4();
  else
    v7 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v38 = MEMORY[0x24BEE4AF8];
    sub_2376C34BC(0, v7 & ~(v7 >> 63), 0);
    result = sub_2376C3B34(a1);
    v35 = result;
    v36 = v9;
    v37 = v10 & 1;
    if (v7 < 0)
    {
      __break(1u);
LABEL_22:
      __break(1u);
    }
    else
    {
      v11 = a1 & 0xFFFFFFFFFFFFFF8;
      if (a1 < 0)
        v11 = a1;
      v29[2] = v11;
      do
      {
        while (1)
        {
          v19 = v35;
          v18 = v36;
          v20 = v37;
          v21 = a1;
          sub_2376C3BF4(v34, v35, v36, v37, a1);
          v23 = v22;
          v24 = (void *)v34[0];
          v32();

          v25 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2376C34BC(0, *(_QWORD *)(v25 + 16) + 1, 1);
            v25 = v38;
          }
          v27 = *(_QWORD *)(v25 + 16);
          v26 = *(_QWORD *)(v25 + 24);
          if (v27 >= v26 >> 1)
          {
            sub_2376C34BC(v26 > 1, v27 + 1, 1);
            v25 = v38;
          }
          *(_QWORD *)(v25 + 16) = v27 + 1;
          result = sub_2376C5938((uint64_t)v6, v25+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v27);
          if (v30)
            break;
          a1 = v21;
          sub_2376C3998(v19, v18, v20, v21);
          v13 = v12;
          v15 = v14;
          v17 = v16;
          sub_2376C597C(v19, v18, v20);
          v35 = v13;
          v36 = v15;
          v37 = v17 & 1;
          if (!--v7)
            goto LABEL_19;
        }
        if ((v20 & 1) == 0)
          goto LABEL_22;
        a1 = v21;
        if (sub_2376D5370())
          swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F90);
        v28 = (void (*)(_QWORD *, _QWORD))sub_2376D510C();
        sub_2376D53C4();
        v28(v34, 0);
        --v7;
      }
      while (v7);
LABEL_19:
      sub_2376C597C(v35, v36, v37);
      return v38;
    }
  }
  return result;
}

uint64_t sub_2376C4C84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2376D540C();
  __break(1u);
  return result;
}

void sub_2376C4D78(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  char *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  unint64_t v63;
  unint64_t v64;
  int64_t v65;
  uint64_t v66;
  void *v67;

  v2 = sub_2376D4EE4();
  v55 = *(_QWORD *)(v2 - 8);
  v56 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v54 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    v4 = sub_2376D5358();
    v63 = 0;
    v5 = 0;
    v6 = 0;
    v7 = v4 | 0x8000000000000000;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v5 = ~v8;
    v9 = *(_QWORD *)(a1 + 64);
    v63 = a1 + 64;
    v10 = -v8;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v6 = v11 & v9;
    v7 = a1;
  }
  swift_bridgeObjectRetain();
  v12 = 0;
  v61 = v7 & 0x7FFFFFFFFFFFFFFFLL;
  v57 = v5;
  v62 = (unint64_t)(v5 + 64) >> 6;
  v53 = *MEMORY[0x24BE14200];
  v58 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v60 = MEMORY[0x24BEE4AD0] + 8;
  v13 = v59;
  if ((v7 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  v14 = v12;
  v15 = sub_2376D53B8();
  if (!v15)
    goto LABEL_40;
  v17 = v16;
  v66 = v15;
  sub_2376BD590(0, &qword_2542B6F98);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v18 = v67;
  swift_unknownObjectRelease();
  v66 = v17;
  sub_2376BD590(0, &qword_256807C38);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v19 = v67;
  swift_unknownObjectRelease();
  v20 = v6;
  if (!v18)
    goto LABEL_40;
  while (1)
  {
    v64 = v20;
    v65 = v14;
    v26 = v7;
    v27 = sub_2376D5094();
    v28 = *(_QWORD *)(v27 - 8);
    MEMORY[0x24BDAC7A8](v27);
    v30 = (char *)&v49 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = v18;
    v32 = v19;
    v33 = objc_msgSend(v32, sel_color);
    sub_2376D5088();
    v34 = sub_2376D507C();
    if (v13)
    {

      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
      v13 = 0;
      v6 = v64;
      v12 = v65;
      v7 = v26;
      if ((v26 & 0x8000000000000000) != 0)
        goto LABEL_8;
    }
    else
    {
      v37 = v35;
      v52 = v34;
      v59 = 0;
      v51 = objc_msgSend(v31, sel_urlRepresentation);
      v38 = v54;
      sub_2376D4ECC();

      v39 = (void *)sub_2376D4EB4();
      v50 = v40;
      v51 = v39;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v56);
      v41 = sub_2376D513C();
      v49 = v42;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);

      v43 = v58;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v43 = sub_2376C31C0(0, v43[2] + 1, 1, v43);
      v7 = v26;
      v45 = v43[2];
      v44 = v43[3];
      v12 = v65;
      if (v45 >= v44 >> 1)
        v43 = sub_2376C31C0((_QWORD *)(v44 > 1), v45 + 1, 1, v43);
      v43[2] = v45 + 1;
      v58 = v43;
      v46 = &v43[6 * v45];
      v47 = v49;
      v46[4] = v41;
      v46[5] = v47;
      v48 = v50;
      v46[6] = v51;
      v46[7] = v48;
      v46[8] = v52;
      v46[9] = v37;
      v6 = v64;
      v13 = v59;
      if ((v26 & 0x8000000000000000) != 0)
        goto LABEL_8;
    }
LABEL_11:
    if (!v6)
      break;
    v20 = (v6 - 1) & v6;
    v21 = __clz(__rbit64(v6)) | (v12 << 6);
    v14 = v12;
LABEL_24:
    v24 = 8 * v21;
    v25 = *(void **)(*(_QWORD *)(v7 + 56) + v24);
    v18 = *(id *)(*(_QWORD *)(v7 + 48) + v24);
    v19 = v25;
    if (!v18)
      goto LABEL_40;
  }
  v14 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v62)
    goto LABEL_40;
  v22 = *(_QWORD *)(v63 + 8 * v14);
  if (v22)
  {
LABEL_23:
    v20 = (v22 - 1) & v22;
    v21 = __clz(__rbit64(v22)) + (v14 << 6);
    goto LABEL_24;
  }
  v23 = v12 + 2;
  if (v12 + 2 >= v62)
    goto LABEL_40;
  v22 = *(_QWORD *)(v63 + 8 * v23);
  if (v22)
    goto LABEL_22;
  v23 = v12 + 3;
  if (v12 + 3 >= v62)
    goto LABEL_40;
  v22 = *(_QWORD *)(v63 + 8 * v23);
  if (v22)
    goto LABEL_22;
  v23 = v12 + 4;
  if (v12 + 4 >= v62)
    goto LABEL_40;
  v22 = *(_QWORD *)(v63 + 8 * v23);
  if (v22)
  {
LABEL_22:
    v14 = v23;
    goto LABEL_23;
  }
  v14 = v12 + 5;
  if (v12 + 5 >= v62)
    goto LABEL_40;
  v22 = *(_QWORD *)(v63 + 8 * v14);
  if (v22)
    goto LABEL_23;
  v36 = v12 + 6;
  while (v62 != v36)
  {
    v22 = *(_QWORD *)(v63 + 8 * v36++);
    if (v22)
    {
      v14 = v36 - 1;
      goto LABEL_23;
    }
  }
LABEL_40:
  sub_2376BD548();
}

char *sub_2376C52A8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_2376D540C();
  __break(1u);
  return result;
}

id sub_2376C5390(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F18);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2376D4EE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376D4ED8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2376C589C((uint64_t)v6, &qword_2542B6F18);
    if (qword_2542B6D38 != -1)
      swift_once();
    v11 = sub_2376D50B8();
    __swift_project_value_buffer(v11, (uint64_t)qword_2542B7078);
    swift_bridgeObjectRetain_n();
    v12 = sub_2376D50A0();
    v13 = sub_2376D5208();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v26 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      v25 = sub_2376BBA08(a1, a2, &v26);
      sub_2376D5268();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2376B5000, v12, v13, "Can't turn non-URL into reminder object ID %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B819E18](v15, -1, -1);
      MEMORY[0x23B819E18](v14, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  v16 = (void *)sub_2376D4EC0();
  v17 = objc_msgSend((id)objc_opt_self(), sel_objectIDWithURL_, v16);

  if (!v17)
  {
    if (qword_2542B6D38 != -1)
      swift_once();
    v18 = sub_2376D50B8();
    __swift_project_value_buffer(v18, (uint64_t)qword_2542B7078);
    swift_bridgeObjectRetain_n();
    v19 = sub_2376D50A0();
    v20 = sub_2376D5208();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v26 = v22;
      *(_DWORD *)v21 = 136315138;
      v24[1] = v21 + 4;
      swift_bridgeObjectRetain();
      v25 = sub_2376BBA08(a1, a2, &v26);
      sub_2376D5268();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2376B5000, v19, v20, "invalid object ID URL %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B819E18](v22, -1, -1);
      MEMORY[0x23B819E18](v21, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v17;
}

unint64_t sub_2376C57BC()
{
  unint64_t result;

  result = qword_2542B6C60;
  if (!qword_2542B6C60)
  {
    result = MEMORY[0x23B819D64](&unk_2376D7034, &type metadata for VersionTaggedData);
    atomic_store(result, (unint64_t *)&qword_2542B6C60);
  }
  return result;
}

uint64_t sub_2376C5800(uint64_t a1, unint64_t a2)
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

unint64_t sub_2376C5844()
{
  unint64_t result;

  result = qword_2542B6C68;
  if (!qword_2542B6C68)
  {
    result = MEMORY[0x23B819D64](&unk_2376D700C, &type metadata for VersionTaggedData);
    atomic_store(result, (unint64_t *)&qword_2542B6C68);
  }
  return result;
}

uint64_t sub_2376C5888(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2376C5800(a1, a2);
  return a1;
}

uint64_t sub_2376C589C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2376C58D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542B6FA0;
  if (!qword_2542B6FA0)
  {
    v1 = sub_2376BD590(255, &qword_2542B6F98);
    result = MEMORY[0x23B819D64](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2542B6FA0);
  }
  return result;
}

uint64_t sub_2376C5930@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_2376BFB24(a1, *(uint64_t **)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_2376C5938(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntegrationEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2376C597C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2376C5988(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2376C5994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_2376C5800(a5, a6);
  }
  return result;
}

uint64_t sub_2376C59E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_2376C5A24()
{
  unint64_t result;

  result = qword_256807C48;
  if (!qword_256807C48)
  {
    result = MEMORY[0x23B819D64](&unk_2376D6FCC, &type metadata for ReminderIntegrationDataSource.SyncError);
    atomic_store(result, (unint64_t *)&qword_256807C48);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReminderIntegrationDataSource.SyncError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReminderIntegrationDataSource.SyncError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2376C5AFC + 4 * byte_2376D6EC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2376C5B1C + 4 * byte_2376D6EC5[v4]))();
}

_BYTE *sub_2376C5AFC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2376C5B1C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2376C5B24(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2376C5B2C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2376C5B34(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2376C5B3C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2376C5B48()
{
  return 0;
}

ValueMetadata *type metadata accessor for ReminderIntegrationDataSource.SyncError()
{
  return &type metadata for ReminderIntegrationDataSource.SyncError;
}

uint64_t destroy for VersionTaggedData(uint64_t a1)
{
  return sub_2376C5800(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t _s26CalendarIntegrationSupport17VersionTaggedDataVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_2376BCC44(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for VersionTaggedData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_2376BCC44(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  sub_2376C5800(v5, v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VersionTaggedData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_2376C5800(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for VersionTaggedData(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for VersionTaggedData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VersionTaggedData()
{
  return &type metadata for VersionTaggedData;
}

unint64_t sub_2376C5D0C()
{
  unint64_t result;

  result = qword_256807C68;
  if (!qword_256807C68)
  {
    result = MEMORY[0x23B819D64](&unk_2376D6FA4, &type metadata for ReminderIntegrationDataSource.SyncError);
    atomic_store(result, (unint64_t *)&qword_256807C68);
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

unint64_t sub_2376C5D74()
{
  unint64_t result;

  result = qword_2542B6C48;
  if (!qword_2542B6C48)
  {
    result = MEMORY[0x23B819D64](&unk_2376D7120, &type metadata for VersionTaggedData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542B6C48);
  }
  return result;
}

unint64_t sub_2376C5DB8()
{
  unint64_t result;

  result = qword_2542B6C28;
  if (!qword_2542B6C28)
  {
    result = MEMORY[0x23B819D64](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2542B6C28);
  }
  return result;
}

uint64_t sub_2376C5DFC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_2376D5454() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2376D5454();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2376C5EDC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6CE0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_2376C5D74();
  sub_2376D54E4();
  if (!v1)
  {
    v9[16] = 0;
    v7 = sub_2376D5424();
    v9[15] = 1;
    sub_2376C6048();
    sub_2376D5418();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_2376C6048()
{
  unint64_t result;

  result = qword_2542B6C30;
  if (!qword_2542B6C30)
  {
    result = MEMORY[0x23B819D64](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2542B6C30);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VersionTaggedData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for VersionTaggedData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376C6174 + 4 * byte_2376D6ECF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2376C61A8 + 4 * byte_2376D6ECA[v4]))();
}

uint64_t sub_2376C61A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376C61B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376C61B8);
  return result;
}

uint64_t sub_2376C61C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376C61CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2376C61D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376C61D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376C61E4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2376C61EC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for VersionTaggedData.CodingKeys()
{
  return &type metadata for VersionTaggedData.CodingKeys;
}

unint64_t sub_2376C620C()
{
  unint64_t result;

  result = qword_256807C70;
  if (!qword_256807C70)
  {
    result = MEMORY[0x23B819D64](&unk_2376D70F8, &type metadata for VersionTaggedData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256807C70);
  }
  return result;
}

unint64_t sub_2376C6254()
{
  unint64_t result;

  result = qword_2542B6C58;
  if (!qword_2542B6C58)
  {
    result = MEMORY[0x23B819D64](&unk_2376D7068, &type metadata for VersionTaggedData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542B6C58);
  }
  return result;
}

unint64_t sub_2376C629C()
{
  unint64_t result;

  result = qword_2542B6C50;
  if (!qword_2542B6C50)
  {
    result = MEMORY[0x23B819D64](&unk_2376D7090, &type metadata for VersionTaggedData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542B6C50);
  }
  return result;
}

uint64_t IntegrationEntry.init<A>(entry:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  __int128 v36;
  __int128 v37;
  _OWORD v38[2];
  uint64_t v39;
  uint64_t v40;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
  MEMORY[0x24BDAC7A8](v8);
  *(_QWORD *)&v37 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for IntegrationEntry(0);
  v14 = (uint64_t)a4 + v13[7];
  v15 = sub_2376D4FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(_QWORD *)&v36 = (char *)a4 + v13[12];
  v16 = v36;
  v17 = type metadata accessor for IntegrationRecurrence(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  v18 = (char *)a4 + v13[13];
  *((_OWORD *)v18 + 1) = 0u;
  *((_OWORD *)v18 + 2) = 0u;
  *(_OWORD *)v18 = 0u;
  v19 = (_QWORD *)((char *)a4 + v13[14]);
  *v19 = 0;
  v19[1] = 0;
  v20 = (_QWORD *)((char *)a4 + v13[15]);
  *v20 = 0;
  v20[1] = 0;
  *a4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  a4[1] = v21;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  sub_2376C59E0((uint64_t)v12, v14, &qword_2542B6F28);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  v23 = (_QWORD *)((char *)a4 + v13[8]);
  *v23 = v22;
  v23[1] = v24;
  *((_BYTE *)a4 + v13[9]) = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3) & 1;
  *((_BYTE *)a4 + v13[10]) = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3) & 1;
  v25 = v37;
  (*(void (**)(uint64_t, uint64_t))(a3 + 72))(a2, a3);
  sub_2376C59E0(v25, v36, &qword_2542B6F68);
  *(_QWORD *)((char *)a4 + v13[11]) = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(a3 + 80))(v38, a2, a3);
  v36 = v38[1];
  v37 = v38[0];
  v26 = v39;
  v27 = v40;
  sub_2376C5994(*(_QWORD *)v18, *((_QWORD *)v18 + 1), *((_QWORD *)v18 + 2), *((_QWORD *)v18 + 3), *((_QWORD *)v18 + 4), *((_QWORD *)v18 + 5));
  v28 = v36;
  *(_OWORD *)v18 = v37;
  *((_OWORD *)v18 + 1) = v28;
  *((_QWORD *)v18 + 4) = v26;
  *((_QWORD *)v18 + 5) = v27;
  v29 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 88))(a2, a3);
  v31 = v30;
  swift_bridgeObjectRelease();
  *v19 = v29;
  v19[1] = v31;
  v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 96))(a2, a3);
  v34 = v33;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  result = swift_bridgeObjectRelease();
  *v20 = v32;
  v20[1] = v34;
  return result;
}

uint64_t type metadata accessor for IntegrationEntry(uint64_t a1)
{
  return sub_2376C67A8(a1, (uint64_t *)&unk_2542B6F80);
}

uint64_t type metadata accessor for IntegrationRecurrence(uint64_t a1)
{
  return sub_2376C67A8(a1, (uint64_t *)&unk_2542B6F58);
}

uint64_t IntegrationColor.init(providerIdentifier:colorIdentifier:data:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

CalendarIntegrationSupport::IntegrationColor::Identifier __swiftcall IntegrationColor.Identifier.init(providerIdentifier:colorIdentifier:)(Swift::String providerIdentifier, Swift::String colorIdentifier)
{
  Swift::String *v2;
  CalendarIntegrationSupport::IntegrationColor::Identifier result;

  *v2 = providerIdentifier;
  v2[1] = colorIdentifier;
  result.colorIdentifier = colorIdentifier;
  result.providerIdentifier = providerIdentifier;
  return result;
}

uint64_t IntegrationRecurrence.init(frequency:interval:recurrenceEnd:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:daysOfTheYear:weeksOfTheYear:monthsOfTheYear:setPositions:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  char v12;
  int *v13;
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
  char v24;

  v12 = *a1;
  v24 = *a4;
  *(_QWORD *)(a9 + 8) = 1;
  v13 = (int *)type metadata accessor for IntegrationRecurrence(0);
  v14 = a9 + v13[6];
  v15 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = v13[7];
  *(_BYTE *)(a9 + v16) = 7;
  v17 = v13[8];
  *(_QWORD *)(a9 + v17) = 0;
  v18 = v13[9];
  *(_QWORD *)(a9 + v18) = 0;
  v19 = v13[10];
  *(_QWORD *)(a9 + v19) = 0;
  v20 = v13[11];
  *(_QWORD *)(a9 + v20) = 0;
  v21 = v13[12];
  *(_QWORD *)(a9 + v21) = 0;
  v22 = v13[13];
  *(_QWORD *)(a9 + v22) = 0;
  sub_2376C59E0(a3, v14, &qword_2542B6F48);
  *(_BYTE *)a9 = v12;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + v16) = v24;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v17) = a5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v18) = a6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v19) = a7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v20) = a8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v21) = a10;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v22) = a11;
  return result;
}

uint64_t type metadata accessor for IntegrationRecurrence.RecurrenceEnd(uint64_t a1)
{
  return sub_2376C67A8(a1, (uint64_t *)&unk_2542B6F38);
}

uint64_t sub_2376C67A8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t IntegrationEntry.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.identifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationEntry.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 20);
  v4 = sub_2376D4F50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t IntegrationEntry.startDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 20);
  v4 = sub_2376D4F50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*IntegrationEntry.startDate.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 24);
  v4 = sub_2376D4F50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t IntegrationEntry.endDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 24);
  v4 = sub_2376D4F50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*IntegrationEntry.endDate.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2376CA904(v1 + *(int *)(v3 + 28), a1, &qword_2542B6F28);
}

uint64_t IntegrationEntry.timeZone.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2376C59E0(a1, v1 + *(int *)(v3 + 28), &qword_2542B6F28);
}

uint64_t (*IntegrationEntry.timeZone.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for IntegrationEntry(0) + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.title.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.allDay.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 36));
}

uint64_t IntegrationEntry.allDay.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IntegrationEntry(0);
  *(_BYTE *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*IntegrationEntry.allDay.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.completed.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 40));
}

uint64_t IntegrationEntry.completed.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IntegrationEntry(0);
  *(_BYTE *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*IntegrationEntry.completed.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.priority.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 44));
}

uint64_t IntegrationEntry.priority.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IntegrationEntry(0);
  *(_QWORD *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*IntegrationEntry.priority.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.recurrence.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2376CA904(v1 + *(int *)(v3 + 48), a1, &qword_2542B6F68);
}

uint64_t IntegrationEntry.recurrence.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for IntegrationEntry(0);
  return sub_2376C59E0(a1, v1 + *(int *)(v3 + 48), &qword_2542B6F68);
}

uint64_t (*IntegrationEntry.recurrence.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.color.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 52));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9 = v3[5];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  return sub_2376C6D44(v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2376C6D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_2376BCC44(a5, a6);
  }
  return result;
}

__n128 IntegrationEntry.color.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;
  __int128 v7;

  v6 = (__n128)a1[1];
  v7 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 5);
  v4 = v1 + *(int *)(type metadata accessor for IntegrationEntry(0) + 52);
  sub_2376C5994(*(_QWORD *)v4, *(_QWORD *)(v4 + 8), *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
  result = v6;
  *(_OWORD *)v4 = v7;
  *(__n128 *)(v4 + 16) = v6;
  *(_QWORD *)(v4 + 32) = v2;
  *(_QWORD *)(v4 + 40) = v3;
  return result;
}

uint64_t (*IntegrationEntry.color.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.personaIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.personaIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for IntegrationEntry(0) + 56));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.personaIdentifier.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.externalIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for IntegrationEntry(0) + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationEntry.externalIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for IntegrationEntry(0) + 60));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*IntegrationEntry.externalIdentifier.modify())()
{
  type metadata accessor for IntegrationEntry(0);
  return nullsub_1;
}

uint64_t IntegrationEntry.init(identifier:startDate:endDate:timeZone:title:allDay:completed:priority:recurrence:color:personaIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, char *a9@<X8>, char a10, uint64_t a11, uint64_t a12, __int128 *a13, uint64_t a14, uint64_t a15)
{
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  char *v30;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;

  v39 = a13[1];
  v40 = *a13;
  v37 = *((_QWORD *)a13 + 5);
  v38 = *((_QWORD *)a13 + 4);
  v19 = (int *)type metadata accessor for IntegrationEntry(0);
  v20 = (uint64_t)&a9[v19[7]];
  v21 = sub_2376D4FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  v22 = (uint64_t)&a9[v19[12]];
  v23 = type metadata accessor for IntegrationRecurrence(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v24 = &a9[v19[13]];
  *((_OWORD *)v24 + 1) = 0u;
  *((_OWORD *)v24 + 2) = 0u;
  *(_OWORD *)v24 = 0u;
  v25 = &a9[v19[14]];
  *(_QWORD *)v25 = 0;
  *((_QWORD *)v25 + 1) = 0;
  v26 = &a9[v19[15]];
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  *(_QWORD *)a9 = a1;
  *((_QWORD *)a9 + 1) = a2;
  v27 = &a9[v19[5]];
  v28 = sub_2376D4F50();
  v29 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32);
  v29(v27, a3, v28);
  v29(&a9[v19[6]], a4, v28);
  sub_2376C59E0(a5, v20, &qword_2542B6F28);
  v30 = &a9[v19[8]];
  *(_QWORD *)v30 = a6;
  *((_QWORD *)v30 + 1) = a7;
  a9[v19[9]] = a8;
  a9[v19[10]] = a10;
  *(_QWORD *)&a9[v19[11]] = a11;
  sub_2376C59E0(a12, v22, &qword_2542B6F68);
  sub_2376C5994(*(_QWORD *)v24, *((_QWORD *)v24 + 1), *((_QWORD *)v24 + 2), *((_QWORD *)v24 + 3), *((_QWORD *)v24 + 4), *((_QWORD *)v24 + 5));
  *(_OWORD *)v24 = v40;
  *((_OWORD *)v24 + 1) = v39;
  *((_QWORD *)v24 + 4) = v38;
  *((_QWORD *)v24 + 5) = v37;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)v25 = a14;
  *((_QWORD *)v25 + 1) = a15;
  return result;
}

uint64_t IntegrationEntry.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v1 = type metadata accessor for IntegrationRecurrence(0);
  v27 = *(_QWORD *)(v1 - 8);
  v28 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v25 = (uint64_t)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2376D4FBC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2376D5148();
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for IntegrationEntry(0);
  sub_2376D4F50();
  sub_2376C7600(&qword_256807C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_2376D5118();
  sub_2376D5118();
  sub_2376CA904(v0 + v12[7], (uint64_t)v11, &qword_2542B6F28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
  {
    sub_2376D54CC();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    sub_2376D54CC();
    sub_2376C7600(&qword_256807C80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF530]);
    sub_2376D5118();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v14 = v27;
  v13 = v28;
  v15 = (uint64_t)v26;
  swift_bridgeObjectRetain();
  sub_2376D5148();
  swift_bridgeObjectRelease();
  sub_2376D54CC();
  sub_2376D54CC();
  sub_2376D54C0();
  sub_2376CA904(v0 + v12[12], v15, &qword_2542B6F68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v13) == 1)
  {
    sub_2376D54CC();
  }
  else
  {
    v16 = v25;
    sub_2376CA98C(v15, v25, type metadata accessor for IntegrationRecurrence);
    sub_2376D54CC();
    IntegrationRecurrence.hash(into:)();
    sub_2376CA9D0(v16, type metadata accessor for IntegrationRecurrence);
  }
  v17 = (uint64_t *)(v0 + v12[13]);
  v18 = v17[1];
  if (v18)
  {
    v20 = v17[4];
    v19 = v17[5];
    v22 = v17[2];
    v21 = v17[3];
    v23 = *v17;
    sub_2376D54CC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2376BCC44(v20, v19);
    sub_2376D5148();
    sub_2376D5148();
    sub_2376D4F14();
    sub_2376C5994(v23, v18, v22, v21, v20, v19);
  }
  else
  {
    sub_2376D54CC();
  }
  if (*(_QWORD *)(v0 + v12[14] + 8))
  {
    sub_2376D54CC();
    swift_bridgeObjectRetain();
    sub_2376D5148();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2376D54CC();
  }
  if (!*(_QWORD *)(v0 + v12[15] + 8))
    return sub_2376D54CC();
  sub_2376D54CC();
  swift_bridgeObjectRetain();
  sub_2376D5148();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2376C7600(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B819D64](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t IntegrationEntry.hashValue.getter()
{
  return sub_2376C8904((void (*)(_BYTE *))IntegrationEntry.hash(into:));
}

uint64_t sub_2376C7650()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2376C767C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_2376D4F50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_2376C76BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_2376D4F50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_2376C76FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2376CA904(v2 + *(int *)(a1 + 28), a2, &qword_2542B6F28);
}

uint64_t sub_2376C7724(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2376C7758(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 36));
}

uint64_t sub_2376C7764(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 40));
}

uint64_t sub_2376C7770(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 44));
}

uint64_t sub_2376C777C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2376CA904(v2 + *(int *)(a1 + 48), a2, &qword_2542B6F68);
}

uint64_t sub_2376C77A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = (uint64_t *)(v2 + *(int *)(a1 + 52));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9 = v3[5];
  *a2 = *v3;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  a2[5] = v9;
  return sub_2376C6D44(v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2376C77C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2376C77FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2376C7830(uint64_t a1, uint64_t a2)
{
  return sub_2376C8950(a1, a2, (void (*)(_BYTE *))IntegrationEntry.hash(into:));
}

uint64_t sub_2376C7840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2376C89A0(a1, a2, a3, (void (*)(_BYTE *))IntegrationEntry.hash(into:));
}

void IntegrationRecurrence.frequency.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *IntegrationRecurrence.frequency.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*IntegrationRecurrence.frequency.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.interval.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t IntegrationRecurrence.interval.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*IntegrationRecurrence.interval.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.recurrenceEnd.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for IntegrationRecurrence(0);
  return sub_2376CA904(v1 + *(int *)(v3 + 24), a1, &qword_2542B6F48);
}

uint64_t IntegrationRecurrence.recurrenceEnd.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for IntegrationRecurrence(0);
  return sub_2376C59E0(a1, v1 + *(int *)(v3 + 24), &qword_2542B6F48);
}

uint64_t (*IntegrationRecurrence.recurrenceEnd.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.firstDayOfTheWeek.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IntegrationRecurrence(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t IntegrationRecurrence.firstDayOfTheWeek.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for IntegrationRecurrence(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

uint64_t (*IntegrationRecurrence.firstDayOfTheWeek.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.daysOfTheWeek.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.daysOfTheWeek.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.daysOfTheWeek.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.daysOfTheMonth.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.daysOfTheMonth.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.daysOfTheMonth.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.daysOfTheYear.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.daysOfTheYear.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 40);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.daysOfTheYear.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.weeksOfTheYear.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.weeksOfTheYear.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 44);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.weeksOfTheYear.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.monthsOfTheYear.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.monthsOfTheYear.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 48);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.monthsOfTheYear.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.setPositions.getter()
{
  type metadata accessor for IntegrationRecurrence(0);
  return swift_bridgeObjectRetain();
}

uint64_t IntegrationRecurrence.setPositions.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for IntegrationRecurrence(0) + 52);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*IntegrationRecurrence.setPositions.modify())()
{
  type metadata accessor for IntegrationRecurrence(0);
  return nullsub_1;
}

uint64_t IntegrationRecurrence.RecurrenceEnd.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v1 = sub_2376D4F50();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376CA948(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2376D54C0();
    return sub_2376D54C0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_2376D54C0();
    sub_2376C7600(&qword_256807C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_2376D5118();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t IntegrationRecurrence.RecurrenceEnd.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_2376D4F50();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376D54B4();
  sub_2376CA948(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2376D54C0();
    sub_2376D54C0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_2376D54C0();
    sub_2376C7600(&qword_256807C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_2376D5118();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_2376D54D8();
}

uint64_t sub_2376C7F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v1 = sub_2376D4F50();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376CA948(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2376D54C0();
    return sub_2376D54C0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v7, v1);
    sub_2376D54C0();
    sub_2376C7600(&qword_256807C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_2376D5118();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t sub_2376C80A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_2376D4F50();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376D54B4();
  sub_2376CA948(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2376D54C0();
    sub_2376D54C0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_2376D54C0();
    sub_2376C7600(&qword_256807C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_2376D5118();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return sub_2376D54D8();
}

BOOL static IntegrationRecurrence.Weekday.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t IntegrationRecurrence.Weekday.hash(into:)()
{
  return sub_2376D54C0();
}

BOOL sub_2376C8250(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void IntegrationRecurrence.DayOfTheWeek.dayOfTheWeek.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *IntegrationRecurrence.DayOfTheWeek.dayOfTheWeek.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*IntegrationRecurrence.DayOfTheWeek.dayOfTheWeek.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.DayOfTheWeek.weekNumber.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t IntegrationRecurrence.DayOfTheWeek.weekNumber.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*IntegrationRecurrence.DayOfTheWeek.weekNumber.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationRecurrence.DayOfTheWeek.hash(into:)()
{
  sub_2376D54C0();
  return sub_2376D54C0();
}

BOOL static IntegrationRecurrence.DayOfTheWeek.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
}

uint64_t IntegrationRecurrence.DayOfTheWeek.hashValue.getter()
{
  sub_2376D54B4();
  sub_2376D54C0();
  sub_2376D54C0();
  return sub_2376D54D8();
}

uint64_t sub_2376C8370()
{
  sub_2376D54B4();
  sub_2376D54C0();
  sub_2376D54C0();
  return sub_2376D54D8();
}

uint64_t sub_2376C83CC()
{
  sub_2376D54C0();
  return sub_2376D54C0();
}

uint64_t sub_2376C8408()
{
  sub_2376D54B4();
  sub_2376D54C0();
  sub_2376D54C0();
  return sub_2376D54D8();
}

BOOL sub_2376C8460(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
}

uint64_t IntegrationRecurrence.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v1 = sub_2376D4F50();
  v38 = *(_QWORD *)(v1 - 8);
  v39 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v37 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v36 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376D54C0();
  sub_2376D54C0();
  v13 = (int *)type metadata accessor for IntegrationRecurrence(0);
  sub_2376CA904(v0 + v13[6], (uint64_t)v12, &qword_2542B6F48);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) == 1)
  {
    sub_2376D54CC();
  }
  else
  {
    sub_2376CA98C((uint64_t)v12, (uint64_t)v9, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    sub_2376D54CC();
    sub_2376CA948((uint64_t)v9, (uint64_t)v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_2376D54C0();
      sub_2376D54C0();
    }
    else
    {
      v15 = v37;
      v14 = v38;
      v16 = v39;
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v37, v7, v39);
      sub_2376D54C0();
      sub_2376C7600(&qword_256807C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
      sub_2376D5118();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v15, v16);
    }
    sub_2376CA9D0((uint64_t)v9, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  }
  if (*(_BYTE *)(v0 + v13[7]) == 7)
  {
    sub_2376D54CC();
  }
  else
  {
    sub_2376D54CC();
    sub_2376D54C0();
  }
  v17 = *(_QWORD *)(v0 + v13[8]);
  if (v17)
  {
    sub_2376D54CC();
    sub_2376D54C0();
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v19 = v17 + 40;
      do
      {
        v19 += 16;
        sub_2376D54C0();
        sub_2376D54C0();
        --v18;
      }
      while (v18);
    }
  }
  else
  {
    sub_2376D54CC();
  }
  v20 = *(_QWORD *)(v0 + v13[9]);
  if (v20)
  {
    sub_2376D54CC();
    sub_2376D54C0();
    v21 = *(_QWORD *)(v20 + 16);
    if (v21)
    {
      v22 = v20 + 32;
      do
      {
        v22 += 8;
        sub_2376D54C0();
        --v21;
      }
      while (v21);
    }
  }
  else
  {
    sub_2376D54CC();
  }
  v23 = *(_QWORD *)(v0 + v13[10]);
  if (v23)
  {
    sub_2376D54CC();
    sub_2376D54C0();
    v24 = *(_QWORD *)(v23 + 16);
    if (v24)
    {
      v25 = v23 + 32;
      do
      {
        v25 += 8;
        sub_2376D54C0();
        --v24;
      }
      while (v24);
    }
  }
  else
  {
    sub_2376D54CC();
  }
  v26 = *(_QWORD *)(v0 + v13[11]);
  if (v26)
  {
    sub_2376D54CC();
    sub_2376D54C0();
    v27 = *(_QWORD *)(v26 + 16);
    if (v27)
    {
      v28 = v26 + 32;
      do
      {
        v28 += 8;
        sub_2376D54C0();
        --v27;
      }
      while (v27);
    }
  }
  else
  {
    sub_2376D54CC();
  }
  v29 = *(_QWORD *)(v0 + v13[12]);
  if (v29)
  {
    sub_2376D54CC();
    sub_2376D54C0();
    v30 = *(_QWORD *)(v29 + 16);
    if (v30)
    {
      v31 = v29 + 32;
      do
      {
        v31 += 8;
        sub_2376D54C0();
        --v30;
      }
      while (v30);
    }
  }
  else
  {
    sub_2376D54CC();
  }
  v32 = *(_QWORD *)(v0 + v13[13]);
  if (!v32)
    return sub_2376D54CC();
  sub_2376D54CC();
  result = sub_2376D54C0();
  v34 = *(_QWORD *)(v32 + 16);
  if (v34)
  {
    v35 = v32 + 32;
    do
    {
      v35 += 8;
      result = sub_2376D54C0();
      --v34;
    }
    while (v34);
  }
  return result;
}

uint64_t IntegrationRecurrence.hashValue.getter()
{
  return sub_2376C8904((void (*)(_BYTE *))IntegrationRecurrence.hash(into:));
}

uint64_t sub_2376C8904(void (*a1)(_BYTE *))
{
  _BYTE v3[72];

  sub_2376D54B4();
  a1(v3);
  return sub_2376D54D8();
}

uint64_t sub_2376C8944(uint64_t a1, uint64_t a2)
{
  return sub_2376C8950(a1, a2, (void (*)(_BYTE *))IntegrationRecurrence.hash(into:));
}

uint64_t sub_2376C8950(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *))
{
  _BYTE v5[72];

  sub_2376D54B4();
  a3(v5);
  return sub_2376D54D8();
}

uint64_t sub_2376C8994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2376C89A0(a1, a2, a3, (void (*)(_BYTE *))IntegrationRecurrence.hash(into:));
}

uint64_t sub_2376C89A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v6[72];

  sub_2376D54B4();
  a4(v6);
  return sub_2376D54D8();
}

uint64_t IntegrationColor.Identifier.providerIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationColor.Identifier.providerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*IntegrationColor.Identifier.providerIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.Identifier.colorIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntegrationColor.Identifier.colorIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*IntegrationColor.Identifier.colorIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.Identifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2376D5148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2376D5148();
  return swift_bridgeObjectRelease();
}

uint64_t IntegrationColor.Identifier.hashValue.getter()
{
  sub_2376D54B4();
  sub_2376D5148();
  sub_2376D5148();
  return sub_2376D54D8();
}

uint64_t sub_2376C8B98()
{
  sub_2376D54B4();
  sub_2376D5148();
  sub_2376D5148();
  return sub_2376D54D8();
}

uint64_t sub_2376C8BFC()
{
  sub_2376D5148();
  return sub_2376D5148();
}

uint64_t sub_2376C8C38()
{
  sub_2376D54B4();
  sub_2376D5148();
  sub_2376D5148();
  return sub_2376D54D8();
}

uint64_t IntegrationColor.identifier.getter@<X0>(_QWORD *a1@<X8>)
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

__n128 IntegrationColor.identifier.setter(__n128 *a1)
{
  __n128 *v1;
  unint64_t v2;
  unint64_t v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = v5;
  *v1 = v5;
  v1[1].n128_u64[0] = v2;
  v1[1].n128_u64[1] = v3;
  return result;
}

uint64_t (*IntegrationColor.identifier.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_2376BCC44(v1, *(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t IntegrationColor.data.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2376C5800(*(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*IntegrationColor.data.modify())()
{
  return nullsub_1;
}

uint64_t IntegrationColor.hash(into:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2376D5148();
  sub_2376D5148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2376BCC44(v2, v1);
  sub_2376D4F14();
  return sub_2376C5800(v2, v1);
}

uint64_t IntegrationColor.hashValue.getter()
{
  sub_2376D54B4();
  sub_2376D5148();
  sub_2376D5148();
  sub_2376D4F14();
  return sub_2376D54D8();
}

uint64_t sub_2376C8ECC()
{
  sub_2376D54B4();
  sub_2376D5148();
  sub_2376D5148();
  sub_2376D4F14();
  return sub_2376D54D8();
}

uint64_t sub_2376C8F4C()
{
  sub_2376D5148();
  sub_2376D5148();
  return sub_2376D4F14();
}

uint64_t sub_2376C8FA4()
{
  sub_2376D54B4();
  sub_2376D5148();
  sub_2376D5148();
  sub_2376D4F14();
  return sub_2376D54D8();
}

BOOL sub_2376C9024(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _BOOL8 result;
  BOOL v9;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = v2 - 1;
  v4 = (_QWORD *)(a2 + 40);
  v5 = (_QWORD *)(a1 + 40);
  do
  {
    result = *((unsigned __int8 *)v5 - 8) == *((unsigned __int8 *)v4 - 8) && *v5 == *v4;
    v9 = v3-- != 0;
    if (!result)
      break;
    v4 += 2;
    v5 += 2;
  }
  while (v9);
  return result;
}

BOOL sub_2376C9098(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = a1 + 5;
  v6 = a2 + 5;
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

void sub_2376C910C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_2376C916C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x2376C9350);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_2376C9374(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2376C93D0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_2376C910C((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_2376C5800(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t _s26CalendarIntegrationSupport0B10RecurrenceV0D3EndO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;

  v4 = sub_2376D4F50();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256807CC8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 48)];
  sub_2376CA948(a1, (uint64_t)v17);
  sub_2376CA948(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2376CA948((uint64_t)v17, (uint64_t)v11);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = *v11 == *(_QWORD *)v18;
LABEL_8:
      sub_2376CA9D0((uint64_t)v17, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      return v19 & 1;
    }
  }
  else
  {
    sub_2376CA948((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
      v19 = sub_2376D4F38();
      v20 = *(void (**)(char *, uint64_t))(v5 + 8);
      v20(v7, v4);
      v20(v13, v4);
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  sub_2376C589C((uint64_t)v17, &qword_256807CC8);
  v19 = 0;
  return v19 & 1;
}

uint64_t _s26CalendarIntegrationSupport0B10RecurrenceV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v26;
  char v27;
  unsigned __int8 *v28;
  int *v29;
  uint64_t v30;
  int v31;
  unsigned __int8 *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  char *v52;
  int *v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;

  v4 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256807CC0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v52 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v52 - v18;
  if (*a1 != *a2 || *((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1))
    return 0;
  v52 = v7;
  v20 = type metadata accessor for IntegrationRecurrence(0);
  v21 = *(int *)(v20 + 24);
  v54 = a1;
  sub_2376CA904((uint64_t)&a1[v21], (uint64_t)v19, &qword_2542B6F48);
  v53 = (int *)v20;
  v22 = *(int *)(v20 + 24);
  v55 = a2;
  sub_2376CA904((uint64_t)&a2[v22], (uint64_t)v17, &qword_2542B6F48);
  v23 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_2376CA904((uint64_t)v19, (uint64_t)v10, &qword_2542B6F48);
  sub_2376CA904((uint64_t)v17, v23, &qword_2542B6F48);
  v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v24((uint64_t)v10, 1, v4) == 1)
  {
    sub_2376C589C((uint64_t)v17, &qword_2542B6F48);
    sub_2376C589C((uint64_t)v19, &qword_2542B6F48);
    if (v24(v23, 1, v4) == 1)
    {
      sub_2376C589C((uint64_t)v10, &qword_2542B6F48);
      goto LABEL_12;
    }
LABEL_8:
    sub_2376C589C((uint64_t)v10, &qword_256807CC0);
    return 0;
  }
  sub_2376CA904((uint64_t)v10, (uint64_t)v14, &qword_2542B6F48);
  if (v24(v23, 1, v4) == 1)
  {
    sub_2376C589C((uint64_t)v17, &qword_2542B6F48);
    sub_2376C589C((uint64_t)v19, &qword_2542B6F48);
    sub_2376CA9D0((uint64_t)v14, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    goto LABEL_8;
  }
  v26 = (uint64_t)v52;
  sub_2376CA98C(v23, (uint64_t)v52, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  v27 = _s26CalendarIntegrationSupport0B10RecurrenceV0D3EndO2eeoiySbAE_AEtFZ_0((uint64_t)v14, v26);
  sub_2376CA9D0(v26, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  sub_2376C589C((uint64_t)v17, &qword_2542B6F48);
  sub_2376C589C((uint64_t)v19, &qword_2542B6F48);
  sub_2376CA9D0((uint64_t)v14, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  sub_2376C589C((uint64_t)v10, &qword_2542B6F48);
  if ((v27 & 1) == 0)
    return 0;
LABEL_12:
  v29 = v53;
  v28 = v54;
  v30 = v53[7];
  v31 = v54[v30];
  v32 = v55;
  v33 = v55[v30];
  if (v31 == 7)
  {
    if (v33 != 7)
      return 0;
    goto LABEL_17;
  }
  result = 0;
  if (v33 != 7 && v31 == v33)
  {
LABEL_17:
    v34 = v53[8];
    v35 = *(_QWORD *)&v54[v34];
    v36 = *(_QWORD *)&v55[v34];
    if (v35)
    {
      if (!v36 || !sub_2376C9024(v35, v36))
        return 0;
    }
    else if (v36)
    {
      return 0;
    }
    v37 = v29[9];
    v38 = *(_QWORD **)&v28[v37];
    v39 = *(_QWORD **)&v32[v37];
    if (v38)
    {
      if (!v39 || !sub_2376C9098(v38, v39))
        return 0;
    }
    else if (v39)
    {
      return 0;
    }
    v40 = v29[10];
    v41 = *(_QWORD **)&v28[v40];
    v42 = *(_QWORD **)&v32[v40];
    if (v41)
    {
      if (!v42 || !sub_2376C9098(v41, v42))
        return 0;
    }
    else if (v42)
    {
      return 0;
    }
    v43 = v29[11];
    v44 = *(_QWORD **)&v28[v43];
    v45 = *(_QWORD **)&v32[v43];
    if (v44)
    {
      if (!v45 || !sub_2376C9098(v44, v45))
        return 0;
    }
    else if (v45)
    {
      return 0;
    }
    v46 = v29[12];
    v47 = *(_QWORD **)&v28[v46];
    v48 = *(_QWORD **)&v32[v46];
    if (v47)
    {
      if (v48 && sub_2376C9098(v47, v48))
      {
LABEL_42:
        v49 = v29[13];
        v50 = *(_QWORD **)&v28[v49];
        v51 = *(_QWORD **)&v32[v49];
        if (v50)
        {
          if (v51 && sub_2376C9098(v50, v51))
            return 1;
        }
        else if (!v51)
        {
          return 1;
        }
      }
    }
    else if (!v48)
    {
      goto LABEL_42;
    }
    return 0;
  }
  return result;
}

uint64_t _s26CalendarIntegrationSupport0B5ColorV10IdentifierV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_2376D5454(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
      return 1;
    else
      return sub_2376D5454();
  }
  return result;
}

uint64_t sub_2376C9C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_2376D4E0C();
  v11 = result;
  if (result)
  {
    result = sub_2376D4E24();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_2376D4E18();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_2376C910C(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_2376C9D10(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_2376C9D54()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_2376C9D88 + *((int *)qword_2376C9E48 + (v0 >> 62))))();
}

uint64_t sub_2376C9D98@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_2376BCC44(v2, v1);
      sub_2376C9374(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void _s26CalendarIntegrationSupport0B5ColorV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v6 = a2[2];
  v7 = a2[3];
  if ((*a1 == *a2 && a1[1] == a2[1] || (sub_2376D5454() & 1) != 0)
    && (v2 == v6 && v4 == v7 || (sub_2376D5454() & 1) != 0))
  {
    sub_2376C9D10(v3, v5);
  }
}

BOOL _s26CalendarIntegrationSupport0B5EntryV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  _BOOL8 result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  void (*v38)(char *, uint64_t);
  _QWORD *v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  unsigned __int8 *v53;
  unsigned __int8 *v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  int v81;
  _QWORD *v82;
  int *v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  _QWORD *v103;
  int *v104;
  _QWORD *v105;
  char *v106;
  unsigned __int8 *v107;
  unsigned __int8 *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;

  v113 = type metadata accessor for IntegrationRecurrence(0);
  v110 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113);
  v107 = (unsigned __int8 *)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_256807CD0);
  MEMORY[0x24BDAC7A8](v109);
  v6 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v108 = (unsigned __int8 *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v111 = (unint64_t)&v103 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v112 = (uint64_t)&v103 - v12;
  v114 = sub_2376D4FBC();
  v13 = *(_QWORD *)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v15 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256807CD8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v103 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v103 - v26;
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    v28 = sub_2376D5454();
    result = 0;
    if ((v28 & 1) == 0)
      return result;
  }
  v106 = v6;
  v30 = type metadata accessor for IntegrationEntry(0);
  if ((sub_2376D4F38() & 1) == 0 || (sub_2376D4F38() & 1) == 0)
    return 0;
  v31 = *(int *)(v30 + 28);
  v103 = a1;
  sub_2376CA904((uint64_t)a1 + v31, (uint64_t)v27, &qword_2542B6F28);
  v104 = (int *)v30;
  v105 = a2;
  sub_2376CA904((uint64_t)a2 + *(int *)(v30 + 28), (uint64_t)v25, &qword_2542B6F28);
  v32 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_2376CA904((uint64_t)v27, (uint64_t)v18, &qword_2542B6F28);
  sub_2376CA904((uint64_t)v25, v32, &qword_2542B6F28);
  v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  v34 = v114;
  if (v33((uint64_t)v18, 1, v114) == 1)
  {
    sub_2376C589C((uint64_t)v25, &qword_2542B6F28);
    sub_2376C589C((uint64_t)v27, &qword_2542B6F28);
    if (v33(v32, 1, v34) == 1)
    {
      sub_2376C589C((uint64_t)v18, &qword_2542B6F28);
      goto LABEL_14;
    }
LABEL_11:
    v35 = &qword_256807CD8;
    v36 = (uint64_t)v18;
LABEL_12:
    sub_2376C589C(v36, v35);
    return 0;
  }
  sub_2376CA904((uint64_t)v18, (uint64_t)v22, &qword_2542B6F28);
  if (v33(v32, 1, v34) == 1)
  {
    sub_2376C589C((uint64_t)v25, &qword_2542B6F28);
    sub_2376C589C((uint64_t)v27, &qword_2542B6F28);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v34);
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v15, v32, v34);
  sub_2376C7600(&qword_256807CE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF538]);
  v37 = sub_2376D5124();
  v38 = *(void (**)(char *, uint64_t))(v13 + 8);
  v38(v15, v34);
  sub_2376C589C((uint64_t)v25, &qword_2542B6F28);
  sub_2376C589C((uint64_t)v27, &qword_2542B6F28);
  v38(v22, v34);
  sub_2376C589C((uint64_t)v18, &qword_2542B6F28);
  if ((v37 & 1) == 0)
    return 0;
LABEL_14:
  v39 = v103;
  v40 = v104;
  v41 = v104[8];
  v42 = *(_QWORD *)((char *)v103 + v41);
  v43 = *(_QWORD *)((char *)v103 + v41 + 8);
  v44 = v105;
  v45 = (uint64_t)v106;
  v46 = (_QWORD *)((char *)v105 + v41);
  if (v42 != *v46 || v43 != v46[1])
  {
    v47 = sub_2376D5454();
    result = 0;
    if ((v47 & 1) == 0)
      return result;
  }
  if (*((unsigned __int8 *)v39 + v40[9]) != *((unsigned __int8 *)v44 + v40[9])
    || *((unsigned __int8 *)v39 + v40[10]) != *((unsigned __int8 *)v44 + v40[10])
    || *(_QWORD *)((char *)v39 + v40[11]) != *(_QWORD *)((char *)v44 + v40[11]))
  {
    return 0;
  }
  v48 = v112;
  sub_2376CA904((uint64_t)v39 + v40[12], v112, &qword_2542B6F68);
  v49 = v111;
  sub_2376CA904((uint64_t)v44 + v40[12], v111, &qword_2542B6F68);
  v50 = v45 + *(int *)(v109 + 48);
  sub_2376CA904(v48, v45, &qword_2542B6F68);
  sub_2376CA904(v49, v50, &qword_2542B6F68);
  v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v110 + 48);
  v52 = v113;
  if (v51(v45, 1, v113) == 1)
  {
    sub_2376C589C(v49, &qword_2542B6F68);
    sub_2376C589C(v48, &qword_2542B6F68);
    if (v51(v50, 1, v52) == 1)
    {
      sub_2376C589C((uint64_t)v106, &qword_2542B6F68);
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  v53 = v108;
  sub_2376CA904(v45, (uint64_t)v108, &qword_2542B6F68);
  if (v51(v50, 1, v52) == 1)
  {
    sub_2376C589C(v49, &qword_2542B6F68);
    sub_2376C589C(v48, &qword_2542B6F68);
    sub_2376CA9D0((uint64_t)v53, type metadata accessor for IntegrationRecurrence);
LABEL_25:
    v35 = &qword_256807CD0;
    v36 = (uint64_t)v106;
    goto LABEL_12;
  }
  v54 = v107;
  sub_2376CA98C(v50, (uint64_t)v107, type metadata accessor for IntegrationRecurrence);
  v55 = _s26CalendarIntegrationSupport0B10RecurrenceV2eeoiySbAC_ACtFZ_0(v53, v54);
  sub_2376CA9D0((uint64_t)v54, type metadata accessor for IntegrationRecurrence);
  sub_2376C589C(v49, &qword_2542B6F68);
  sub_2376C589C(v48, &qword_2542B6F68);
  sub_2376CA9D0((uint64_t)v53, type metadata accessor for IntegrationRecurrence);
  sub_2376C589C(v45, &qword_2542B6F68);
  if ((v55 & 1) == 0)
    return 0;
LABEL_27:
  v56 = v40[13];
  v57 = *(_QWORD *)((char *)v39 + v56);
  v58 = *(_QWORD *)((char *)v39 + v56 + 8);
  v59 = *(_QWORD *)((char *)v39 + v56 + 24);
  v114 = *(_QWORD *)((char *)v39 + v56 + 16);
  v61 = *(_QWORD *)((char *)v39 + v56 + 32);
  v60 = *(_QWORD *)((char *)v39 + v56 + 40);
  v62 = (_QWORD *)((char *)v105 + v56);
  v63 = *v62;
  v64 = v62[1];
  v66 = v62[2];
  v65 = v62[3];
  v67 = v62[4];
  v68 = v62[5];
  if (v58)
  {
    v111 = v62[5];
    v112 = v67;
    if (v64)
    {
      if (v57 == v63 && v58 == v64
        || (v69 = v65, v70 = v57, v71 = sub_2376D5454(), v57 = v70, v65 = v69, (v71 & 1) != 0))
      {
        if (v114 == v66 && v59 == v65
          || (v72 = v65, v73 = v57, v74 = sub_2376D5454(), v57 = v73, v65 = v72, (v74 & 1) != 0))
        {
          v108 = (unsigned __int8 *)v66;
          v109 = v65;
          v75 = v114;
          v76 = v57;
          v113 = v57;
          sub_2376C6D44(v57, v58, v114, v59, v61, v60);
          sub_2376C6D44(v76, v58, v75, v59, v61, v60);
          v77 = (uint64_t)v108;
          v78 = v65;
          v80 = v111;
          v79 = v112;
          sub_2376C6D44(v63, v64, (uint64_t)v108, v78, v112, v111);
          sub_2376C9D10(v61, v60);
          LODWORD(v110) = v81;
          sub_2376C5994(v63, v64, v77, v109, v79, v80);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2376C5800(v61, v60);
          sub_2376C5994(v113, v58, v114, v59, v61, v60);
          if ((v110 & 1) == 0)
            return 0;
          goto LABEL_38;
        }
      }
      v97 = v57;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2376BCC44(v61, v60);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2376BCC44(v61, v60);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2376C5800(v61, v60);
      v91 = v97;
      v92 = v58;
      v93 = v114;
      v94 = v59;
      v95 = v61;
      v96 = v60;
LABEL_47:
      sub_2376C5994(v91, v92, v93, v94, v95, v96);
      return 0;
    }
    v113 = v57;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2376BCC44(v61, v60);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2376BCC44(v61, v60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2376C5800(v61, v60);
    v68 = v111;
    v67 = v112;
LABEL_45:
    v90 = v67;
    sub_2376C6D44(v63, v64, v66, v65, v67, v68);
    sub_2376C5994(v113, v58, v114, v59, v61, v60);
    v91 = v63;
    v92 = v64;
    v93 = v66;
    v94 = v65;
    v95 = v90;
    v96 = v68;
    goto LABEL_47;
  }
  v113 = v57;
  if (v64)
    goto LABEL_45;
LABEL_38:
  v83 = v104;
  v82 = v105;
  v84 = v104[14];
  v85 = (_QWORD *)((char *)v39 + v84);
  v86 = *(_QWORD *)((char *)v39 + v84 + 8);
  v87 = (_QWORD *)((char *)v105 + v84);
  v88 = v87[1];
  if (!v86)
  {
    if (v88)
      return 0;
LABEL_51:
    v98 = v83[15];
    v99 = (_QWORD *)((char *)v39 + v98);
    v100 = *(_QWORD *)((char *)v39 + v98 + 8);
    v101 = (_QWORD *)((char *)v82 + v98);
    v102 = v101[1];
    if (v100)
      return v102 && (*v99 == *v101 && v100 == v102 || (sub_2376D5454() & 1) != 0);
    return !v102;
  }
  if (!v88)
    return 0;
  if (*v85 == *v87 && v86 == v88)
    goto LABEL_51;
  v89 = sub_2376D5454();
  result = 0;
  if ((v89 & 1) != 0)
    goto LABEL_51;
  return result;
}

uint64_t sub_2376CA904(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2376CA948(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2376CA98C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2376CA9D0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2376CAA0C()
{
  return sub_2376C7600(&qword_256807C88, type metadata accessor for IntegrationEntry, (uint64_t)&protocol conformance descriptor for IntegrationEntry);
}

uint64_t sub_2376CAA38()
{
  return sub_2376C7600(&qword_256807C90, type metadata accessor for IntegrationRecurrence.RecurrenceEnd, (uint64_t)&protocol conformance descriptor for IntegrationRecurrence.RecurrenceEnd);
}

unint64_t sub_2376CAA68()
{
  unint64_t result;

  result = qword_256807C98;
  if (!qword_256807C98)
  {
    result = MEMORY[0x23B819D64](&protocol conformance descriptor for IntegrationRecurrence.Frequency, &type metadata for IntegrationRecurrence.Frequency);
    atomic_store(result, (unint64_t *)&qword_256807C98);
  }
  return result;
}

unint64_t sub_2376CAAB0()
{
  unint64_t result;

  result = qword_256807CA0;
  if (!qword_256807CA0)
  {
    result = MEMORY[0x23B819D64](&protocol conformance descriptor for IntegrationRecurrence.Weekday, &type metadata for IntegrationRecurrence.Weekday);
    atomic_store(result, (unint64_t *)&qword_256807CA0);
  }
  return result;
}

unint64_t sub_2376CAAF8()
{
  unint64_t result;

  result = qword_256807CA8;
  if (!qword_256807CA8)
  {
    result = MEMORY[0x23B819D64](&protocol conformance descriptor for IntegrationRecurrence.DayOfTheWeek, &type metadata for IntegrationRecurrence.DayOfTheWeek);
    atomic_store(result, (unint64_t *)&qword_256807CA8);
  }
  return result;
}

uint64_t sub_2376CAB3C()
{
  return sub_2376C7600(&qword_256807CB0, type metadata accessor for IntegrationRecurrence, (uint64_t)&protocol conformance descriptor for IntegrationRecurrence);
}

unint64_t sub_2376CAB6C()
{
  unint64_t result;

  result = qword_2542B6F78;
  if (!qword_2542B6F78)
  {
    result = MEMORY[0x23B819D64](&protocol conformance descriptor for IntegrationColor.Identifier, &type metadata for IntegrationColor.Identifier);
    atomic_store(result, (unint64_t *)&qword_2542B6F78);
  }
  return result;
}

unint64_t sub_2376CABB4()
{
  unint64_t result;

  result = qword_256807CB8;
  if (!qword_256807CB8)
  {
    result = MEMORY[0x23B819D64](&protocol conformance descriptor for IntegrationColor, &type metadata for IntegrationColor);
    atomic_store(result, (unint64_t *)&qword_256807CB8);
  }
  return result;
}

uint64_t dispatch thunk of IntegrationEntryProtocol.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.startDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.endDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.timeZone.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.allDay.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.completed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.priority.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.recurrence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.color.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.personaIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of IntegrationEntryProtocol.externalIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

char *initializeBufferWithCopyOfBuffer for IntegrationEntry(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  int *v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, int *);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  void (*v56)(char *, char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, _QWORD, uint64_t, int *);

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_2376D4F50();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[6]], &a2[a3[6]], v11);
    v13 = a3[7];
    v14 = &v4[v13];
    v15 = &a2[v13];
    v16 = sub_2376D4FBC();
    v17 = *(_QWORD *)(v16 - 8);
    v58 = v11;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    v20 = a3[8];
    v21 = a3[9];
    v22 = &v4[v20];
    v23 = &a2[v20];
    v24 = *((_QWORD *)v23 + 1);
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *((_QWORD *)v22 + 1) = v24;
    v4[v21] = a2[v21];
    v25 = a3[11];
    v4[a3[10]] = a2[a3[10]];
    *(_QWORD *)&v4[v25] = *(_QWORD *)&a2[v25];
    v26 = a3[12];
    v27 = &v4[v26];
    v28 = &a2[v26];
    v29 = (int *)type metadata accessor for IntegrationRecurrence(0);
    v30 = *((_QWORD *)v29 - 1);
    v31 = *(unsigned int (**)(char *, uint64_t, int *))(v30 + 48);
    swift_bridgeObjectRetain();
    if (v31(v28, 1, v29))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v56 = v12;
      v57 = v30;
      *v27 = *v28;
      *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
      v33 = v29[6];
      v34 = &v27[v33];
      v35 = &v28[v33];
      v36 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
      v37 = *(_QWORD *)(v36 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
      {
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
        memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload())
        {
          memcpy(v34, v35, *(_QWORD *)(v37 + 64));
        }
        else
        {
          v56(v34, v35, v58);
          swift_storeEnumTagMultiPayload();
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      }
      v27[v29[7]] = v28[v29[7]];
      *(_QWORD *)&v27[v29[8]] = *(_QWORD *)&v28[v29[8]];
      *(_QWORD *)&v27[v29[9]] = *(_QWORD *)&v28[v29[9]];
      *(_QWORD *)&v27[v29[10]] = *(_QWORD *)&v28[v29[10]];
      *(_QWORD *)&v27[v29[11]] = *(_QWORD *)&v28[v29[11]];
      *(_QWORD *)&v27[v29[12]] = *(_QWORD *)&v28[v29[12]];
      *(_QWORD *)&v27[v29[13]] = *(_QWORD *)&v28[v29[13]];
      v59 = *(void (**)(char *, _QWORD, uint64_t, int *))(v57 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v59(v27, 0, 1, v29);
    }
    v39 = a3[13];
    v40 = &v4[v39];
    v41 = &a2[v39];
    v42 = *((_QWORD *)v41 + 1);
    if (v42)
    {
      *(_QWORD *)v40 = *(_QWORD *)v41;
      *((_QWORD *)v40 + 1) = v42;
      v43 = *((_QWORD *)v41 + 3);
      *((_QWORD *)v40 + 2) = *((_QWORD *)v41 + 2);
      *((_QWORD *)v40 + 3) = v43;
      v44 = *((_QWORD *)v41 + 4);
      v45 = *((_QWORD *)v41 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2376BCC44(v44, v45);
      *((_QWORD *)v40 + 4) = v44;
      *((_QWORD *)v40 + 5) = v45;
    }
    else
    {
      v46 = *((_OWORD *)v41 + 1);
      *(_OWORD *)v40 = *(_OWORD *)v41;
      *((_OWORD *)v40 + 1) = v46;
      *((_OWORD *)v40 + 2) = *((_OWORD *)v41 + 2);
    }
    v47 = a3[14];
    v48 = a3[15];
    v49 = &v4[v47];
    v50 = &a2[v47];
    v51 = *((_QWORD *)v50 + 1);
    *(_QWORD *)v49 = *(_QWORD *)v50;
    *((_QWORD *)v49 + 1) = v51;
    v52 = &v4[v48];
    v53 = &a2[v48];
    v54 = *((_QWORD *)v53 + 1);
    *(_QWORD *)v52 = *(_QWORD *)v53;
    *((_QWORD *)v52 + 1) = v54;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for IntegrationEntry(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_2376D4F50();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[6], v5);
  v7 = a1 + a2[7];
  v8 = sub_2376D4FBC();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  swift_bridgeObjectRelease();
  v10 = a1 + a2[12];
  v11 = type metadata accessor for IntegrationRecurrence(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
  {
    v12 = v10 + *(int *)(v11 + 24);
    v13 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13)
      && !swift_getEnumCaseMultiPayload())
    {
      v6(v12, v5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v14 = (_QWORD *)(a1 + a2[13]);
  if (v14[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2376C5800(v14[4], v14[5]);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for IntegrationEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int *v27;
  uint64_t v28;
  unsigned int (*v29)(char *, uint64_t, int *);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, _QWORD, uint64_t, int *);

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_2376D4F50();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v12 = a3[7];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_2376D4FBC();
  v16 = *(_QWORD *)(v15 - 8);
  v56 = v10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[8];
  v19 = a3[9];
  v20 = &a1[v18];
  v21 = &a2[v18];
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = v22;
  a1[v19] = a2[v19];
  v23 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  *(_QWORD *)&a1[v23] = *(_QWORD *)&a2[v23];
  v24 = a3[12];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = (int *)type metadata accessor for IntegrationRecurrence(0);
  v28 = *((_QWORD *)v27 - 1);
  v29 = *(unsigned int (**)(char *, uint64_t, int *))(v28 + 48);
  swift_bridgeObjectRetain();
  if (v29(v26, 1, v27))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    v54 = v11;
    v55 = v28;
    *v25 = *v26;
    *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
    v31 = v27[6];
    v32 = &v25[v31];
    v33 = &v26[v31];
    v34 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    v35 = *(_QWORD *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v32, v33, *(_QWORD *)(v35 + 64));
      }
      else
      {
        v54(v32, v33, v56);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    v25[v27[7]] = v26[v27[7]];
    *(_QWORD *)&v25[v27[8]] = *(_QWORD *)&v26[v27[8]];
    *(_QWORD *)&v25[v27[9]] = *(_QWORD *)&v26[v27[9]];
    *(_QWORD *)&v25[v27[10]] = *(_QWORD *)&v26[v27[10]];
    *(_QWORD *)&v25[v27[11]] = *(_QWORD *)&v26[v27[11]];
    *(_QWORD *)&v25[v27[12]] = *(_QWORD *)&v26[v27[12]];
    *(_QWORD *)&v25[v27[13]] = *(_QWORD *)&v26[v27[13]];
    v57 = *(void (**)(char *, _QWORD, uint64_t, int *))(v55 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v57(v25, 0, 1, v27);
  }
  v37 = a3[13];
  v38 = &a1[v37];
  v39 = &a2[v37];
  v40 = *((_QWORD *)v39 + 1);
  if (v40)
  {
    *(_QWORD *)v38 = *(_QWORD *)v39;
    *((_QWORD *)v38 + 1) = v40;
    v41 = *((_QWORD *)v39 + 3);
    *((_QWORD *)v38 + 2) = *((_QWORD *)v39 + 2);
    *((_QWORD *)v38 + 3) = v41;
    v42 = *((_QWORD *)v39 + 4);
    v43 = *((_QWORD *)v39 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2376BCC44(v42, v43);
    *((_QWORD *)v38 + 4) = v42;
    *((_QWORD *)v38 + 5) = v43;
  }
  else
  {
    v44 = *((_OWORD *)v39 + 1);
    *(_OWORD *)v38 = *(_OWORD *)v39;
    *((_OWORD *)v38 + 1) = v44;
    *((_OWORD *)v38 + 2) = *((_OWORD *)v39 + 2);
  }
  v45 = a3[14];
  v46 = a3[15];
  v47 = &a1[v45];
  v48 = &a2[v45];
  v49 = *((_QWORD *)v48 + 1);
  *(_QWORD *)v47 = *(_QWORD *)v48;
  *((_QWORD *)v47 + 1) = v49;
  v50 = &a1[v46];
  v51 = &a2[v46];
  v52 = *((_QWORD *)v51 + 1);
  *(_QWORD *)v50 = *(_QWORD *)v51;
  *((_QWORD *)v50 + 1) = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for IntegrationEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int *v26;
  _QWORD *v27;
  uint64_t (*v28)(char *, uint64_t, int *);
  int v29;
  int v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t (*v40)(char *, uint64_t, uint64_t);
  int v41;
  size_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v69;
  char *__dst;
  void *__dsta;
  _QWORD *__src;
  char *__srca;
  uint64_t v74;
  void (*v75)(char *, _QWORD, uint64_t, int *);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_2376D4F50();
  v74 = *(_QWORD *)(v9 - 8);
  v10 = *(void (**)(char *, char *, uint64_t))(v74 + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v11 = a3[7];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_2376D4FBC();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[9]] = a2[a3[9]];
  a1[a3[10]] = a2[a3[10]];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  v23 = a3[12];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = (int *)type metadata accessor for IntegrationRecurrence(0);
  v27 = (_QWORD *)*((_QWORD *)v26 - 1);
  v28 = (uint64_t (*)(char *, uint64_t, int *))v27[6];
  v29 = v28(v24, 1, v26);
  v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (v30)
    {
      sub_2376CA9D0((uint64_t)v24, type metadata accessor for IntegrationRecurrence);
      goto LABEL_13;
    }
    *v24 = *v25;
    *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
    v37 = v26[6];
    v38 = &v24[v37];
    __srca = &v25[v37];
    v39 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    v69 = *(_QWORD *)(v39 - 8);
    __dsta = v38;
    v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v69 + 48);
    LODWORD(v38) = v40(v38, 1, v39);
    v41 = v40(__srca, 1, v39);
    if ((_DWORD)v38)
    {
      if (!v41)
      {
        if (swift_getEnumCaseMultiPayload())
        {
          v45 = v69;
          v46 = __dsta;
          memcpy(__dsta, __srca, *(_QWORD *)(v69 + 64));
        }
        else
        {
          v46 = __dsta;
          (*(void (**)(void *, char *, uint64_t))(v74 + 16))(__dsta, __srca, v9);
          swift_storeEnumTagMultiPayload();
          v45 = v69;
        }
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v46, 0, 1, v39);
        goto LABEL_34;
      }
      v42 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48) - 8) + 64);
      v43 = __dsta;
    }
    else
    {
      if (!v41)
      {
        if (a1 == a2)
          goto LABEL_34;
        sub_2376CA9D0((uint64_t)__dsta, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
        if (!swift_getEnumCaseMultiPayload())
        {
          (*(void (**)(void *, char *, uint64_t))(v74 + 16))(__dsta, __srca, v9);
          swift_storeEnumTagMultiPayload();
          goto LABEL_34;
        }
        v42 = *(_QWORD *)(v69 + 64);
        v43 = __dsta;
        v44 = __srca;
LABEL_23:
        memcpy(v43, v44, v42);
LABEL_34:
        v24[v26[7]] = v25[v26[7]];
        *(_QWORD *)&v24[v26[8]] = *(_QWORD *)&v25[v26[8]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v24[v26[9]] = *(_QWORD *)&v25[v26[9]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v24[v26[10]] = *(_QWORD *)&v25[v26[10]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v24[v26[11]] = *(_QWORD *)&v25[v26[11]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v24[v26[12]] = *(_QWORD *)&v25[v26[12]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v24[v26[13]] = *(_QWORD *)&v25[v26[13]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      sub_2376CA9D0((uint64_t)__dsta, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      v42 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48) - 8) + 64);
      v43 = __dsta;
    }
    v44 = __srca;
    goto LABEL_23;
  }
  if (v30)
  {
LABEL_13:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_35;
  }
  *v24 = *v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  v31 = v26[6];
  __dst = &v24[v31];
  __src = v27;
  v32 = &v25[v31];
  v33 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
    memcpy(__dst, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(__dst, v32, *(_QWORD *)(v34 + 64));
    }
    else
    {
      (*(void (**)(void))(v74 + 16))();
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(__dst, 0, 1, v33);
  }
  v24[v26[7]] = v25[v26[7]];
  *(_QWORD *)&v24[v26[8]] = *(_QWORD *)&v25[v26[8]];
  *(_QWORD *)&v24[v26[9]] = *(_QWORD *)&v25[v26[9]];
  *(_QWORD *)&v24[v26[10]] = *(_QWORD *)&v25[v26[10]];
  *(_QWORD *)&v24[v26[11]] = *(_QWORD *)&v25[v26[11]];
  *(_QWORD *)&v24[v26[12]] = *(_QWORD *)&v25[v26[12]];
  *(_QWORD *)&v24[v26[13]] = *(_QWORD *)&v25[v26[13]];
  v75 = (void (*)(char *, _QWORD, uint64_t, int *))__src[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v75(v24, 0, 1, v26);
LABEL_35:
  v47 = a3[13];
  v48 = &a1[v47];
  v49 = &a2[v47];
  v50 = *(_QWORD *)&a1[v47 + 8];
  v51 = *(_QWORD *)&a2[v47 + 8];
  if (v50)
  {
    if (v51)
    {
      *(_QWORD *)v48 = *(_QWORD *)v49;
      *((_QWORD *)v48 + 1) = *((_QWORD *)v49 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v48 + 2) = *((_QWORD *)v49 + 2);
      *((_QWORD *)v48 + 3) = *((_QWORD *)v49 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v52 = *((_QWORD *)v49 + 4);
      v53 = *((_QWORD *)v49 + 5);
      sub_2376BCC44(v52, v53);
      v54 = *((_QWORD *)v48 + 4);
      v55 = *((_QWORD *)v48 + 5);
      *((_QWORD *)v48 + 4) = v52;
      *((_QWORD *)v48 + 5) = v53;
      sub_2376C5800(v54, v55);
    }
    else
    {
      sub_2376CBD24((uint64_t)v48);
      v59 = *((_OWORD *)v49 + 1);
      v58 = *((_OWORD *)v49 + 2);
      *(_OWORD *)v48 = *(_OWORD *)v49;
      *((_OWORD *)v48 + 1) = v59;
      *((_OWORD *)v48 + 2) = v58;
    }
  }
  else if (v51)
  {
    *(_QWORD *)v48 = *(_QWORD *)v49;
    *((_QWORD *)v48 + 1) = *((_QWORD *)v49 + 1);
    *((_QWORD *)v48 + 2) = *((_QWORD *)v49 + 2);
    *((_QWORD *)v48 + 3) = *((_QWORD *)v49 + 3);
    v56 = *((_QWORD *)v49 + 4);
    v57 = *((_QWORD *)v49 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2376BCC44(v56, v57);
    *((_QWORD *)v48 + 4) = v56;
    *((_QWORD *)v48 + 5) = v57;
  }
  else
  {
    v60 = *(_OWORD *)v49;
    v61 = *((_OWORD *)v49 + 2);
    *((_OWORD *)v48 + 1) = *((_OWORD *)v49 + 1);
    *((_OWORD *)v48 + 2) = v61;
    *(_OWORD *)v48 = v60;
  }
  v62 = a3[14];
  v63 = &a1[v62];
  v64 = &a2[v62];
  *(_QWORD *)v63 = *(_QWORD *)v64;
  *((_QWORD *)v63 + 1) = *((_QWORD *)v64 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v65 = a3[15];
  v66 = &a1[v65];
  v67 = &a2[v65];
  *(_QWORD *)v66 = *(_QWORD *)v67;
  *((_QWORD *)v66 + 1) = *((_QWORD *)v67 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2376CBD24(uint64_t a1)
{
  destroy for IntegrationColor(a1);
  return a1;
}

_OWORD *initializeWithTake for IntegrationEntry(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  _OWORD *v35;
  __int128 v36;
  void (*v38)(void);
  char *v39;
  char *__dst;
  uint64_t v41;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2376D4F50();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 32);
  ((void (*)(char *, char *, uint64_t))v10)(v7, v8, v9);
  ((void (*)(char *, char *, uint64_t))v10)((char *)a1 + a3[6], (char *)a2 + a3[6], v9);
  v11 = a3[7];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2376D4FBC();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v17 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((_BYTE *)a1 + v17) = *((_BYTE *)a2 + v17);
  v18 = a3[11];
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  v19 = a3[12];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  v22 = (int *)type metadata accessor for IntegrationRecurrence(0);
  v23 = *((_QWORD *)v22 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v23 + 48))(v21, 1, v22))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v38 = v10;
    *(_BYTE *)v20 = *(_BYTE *)v21;
    v20[1] = v21[1];
    v25 = v22[6];
    __dst = (char *)v20 + v25;
    v41 = v23;
    v26 = (char *)v21 + v25;
    v27 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    v28 = *(_QWORD *)(v27 - 8);
    v39 = v26;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
      memcpy(__dst, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload())
      {
        v30 = v28;
        v31 = __dst;
        memcpy(__dst, v39, *(_QWORD *)(v28 + 64));
      }
      else
      {
        v31 = __dst;
        v38();
        swift_storeEnumTagMultiPayload();
        v30 = v28;
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v31, 0, 1, v27);
    }
    *((_BYTE *)v20 + v22[7]) = *((_BYTE *)v21 + v22[7]);
    *(_QWORD *)((char *)v20 + v22[8]) = *(_QWORD *)((char *)v21 + v22[8]);
    *(_QWORD *)((char *)v20 + v22[9]) = *(_QWORD *)((char *)v21 + v22[9]);
    *(_QWORD *)((char *)v20 + v22[10]) = *(_QWORD *)((char *)v21 + v22[10]);
    *(_QWORD *)((char *)v20 + v22[11]) = *(_QWORD *)((char *)v21 + v22[11]);
    *(_QWORD *)((char *)v20 + v22[12]) = *(_QWORD *)((char *)v21 + v22[12]);
    *(_QWORD *)((char *)v20 + v22[13]) = *(_QWORD *)((char *)v21 + v22[13]);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v41 + 56))(v20, 0, 1, v22);
  }
  v32 = a3[13];
  v33 = a3[14];
  v34 = (_OWORD *)((char *)a1 + v32);
  v35 = (_OWORD *)((char *)a2 + v32);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  v34[2] = v35[2];
  *(_OWORD *)((char *)a1 + v33) = *(_OWORD *)((char *)a2 + v33);
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  return a1;
}

char *assignWithTake for IntegrationEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  int *v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t, int *);
  int v33;
  int v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t (*v46)(char *, uint64_t, uint64_t);
  int v47;
  size_t v48;
  void *v49;
  char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  __int128 v60;
  uint64_t v61;
  char *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  char *v73;
  void *v74;
  void *__src;
  char *__srca;
  uint64_t v77;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_2376D4F50();
  v77 = *(_QWORD *)(v10 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v77 + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v12 = a3[7];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_2376D4FBC();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  v21 = a3[8];
  v22 = &a1[v21];
  v23 = (uint64_t *)&a2[v21];
  v25 = *v23;
  v24 = v23[1];
  *(_QWORD *)v22 = v25;
  *((_QWORD *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  v26 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v26] = a2[v26];
  v27 = a3[12];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  v28 = &a1[v27];
  v29 = &a2[v27];
  v30 = (int *)type metadata accessor for IntegrationRecurrence(0);
  v31 = *((_QWORD *)v30 - 1);
  v32 = *(uint64_t (**)(char *, uint64_t, int *))(v31 + 48);
  v33 = v32(v28, 1, v30);
  v34 = v32(v29, 1, v30);
  if (!v33)
  {
    if (v34)
    {
      sub_2376CA9D0((uint64_t)v28, type metadata accessor for IntegrationRecurrence);
      goto LABEL_13;
    }
    *v28 = *v29;
    *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
    v43 = v30[6];
    v44 = &v28[v43];
    __srca = &v29[v43];
    v45 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    v72 = *(_QWORD *)(v45 - 8);
    v74 = v44;
    v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
    LODWORD(v44) = v46(v44, 1, v45);
    v47 = v46(__srca, 1, v45);
    if ((_DWORD)v44)
    {
      if (!v47)
      {
        if (swift_getEnumCaseMultiPayload())
        {
          v51 = v72;
          v52 = v74;
          memcpy(v74, __srca, *(_QWORD *)(v72 + 64));
        }
        else
        {
          v52 = v74;
          (*(void (**)(void *, char *, uint64_t))(v77 + 32))(v74, __srca, v10);
          swift_storeEnumTagMultiPayload();
          v51 = v72;
        }
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v52, 0, 1, v45);
        goto LABEL_34;
      }
      v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48) - 8) + 64);
      v49 = v74;
    }
    else
    {
      if (!v47)
      {
        if (a1 == a2)
          goto LABEL_34;
        sub_2376CA9D0((uint64_t)v74, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
        if (!swift_getEnumCaseMultiPayload())
        {
          (*(void (**)(void *, char *, uint64_t))(v77 + 32))(v74, __srca, v10);
          swift_storeEnumTagMultiPayload();
          goto LABEL_34;
        }
        v48 = *(_QWORD *)(v72 + 64);
        v49 = v74;
        v50 = __srca;
LABEL_23:
        memcpy(v49, v50, v48);
LABEL_34:
        v28[v30[7]] = v29[v30[7]];
        *(_QWORD *)&v28[v30[8]] = *(_QWORD *)&v29[v30[8]];
        swift_bridgeObjectRelease();
        *(_QWORD *)&v28[v30[9]] = *(_QWORD *)&v29[v30[9]];
        swift_bridgeObjectRelease();
        *(_QWORD *)&v28[v30[10]] = *(_QWORD *)&v29[v30[10]];
        swift_bridgeObjectRelease();
        *(_QWORD *)&v28[v30[11]] = *(_QWORD *)&v29[v30[11]];
        swift_bridgeObjectRelease();
        *(_QWORD *)&v28[v30[12]] = *(_QWORD *)&v29[v30[12]];
        swift_bridgeObjectRelease();
        *(_QWORD *)&v28[v30[13]] = *(_QWORD *)&v29[v30[13]];
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      sub_2376CA9D0((uint64_t)v74, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48) - 8) + 64);
      v49 = v74;
    }
    v50 = __srca;
    goto LABEL_23;
  }
  if (v34)
  {
LABEL_13:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_35;
  }
  *v28 = *v29;
  *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
  v35 = v30[6];
  v73 = &v28[v35];
  v36 = &v29[v35];
  v37 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v38 = *(_QWORD *)(v37 - 8);
  __src = v36;
  v39 = v36;
  v40 = v37;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v39, 1, v37))
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
    memcpy(v73, __src, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v73, __src, *(_QWORD *)(v38 + 64));
    }
    else
    {
      (*(void (**)(void))(v77 + 32))();
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v73, 0, 1, v40);
  }
  v28[v30[7]] = v29[v30[7]];
  *(_QWORD *)&v28[v30[8]] = *(_QWORD *)&v29[v30[8]];
  *(_QWORD *)&v28[v30[9]] = *(_QWORD *)&v29[v30[9]];
  *(_QWORD *)&v28[v30[10]] = *(_QWORD *)&v29[v30[10]];
  *(_QWORD *)&v28[v30[11]] = *(_QWORD *)&v29[v30[11]];
  *(_QWORD *)&v28[v30[12]] = *(_QWORD *)&v29[v30[12]];
  *(_QWORD *)&v28[v30[13]] = *(_QWORD *)&v29[v30[13]];
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v31 + 56))(v28, 0, 1, v30);
LABEL_35:
  v53 = a3[13];
  v54 = (uint64_t)&a1[v53];
  v55 = &a2[v53];
  if (!*(_QWORD *)&a1[v53 + 8])
  {
LABEL_39:
    v60 = *((_OWORD *)v55 + 1);
    *(_OWORD *)v54 = *(_OWORD *)v55;
    *(_OWORD *)(v54 + 16) = v60;
    *(_OWORD *)(v54 + 32) = *((_OWORD *)v55 + 2);
    goto LABEL_40;
  }
  v56 = *((_QWORD *)v55 + 1);
  if (!v56)
  {
    sub_2376CBD24(v54);
    goto LABEL_39;
  }
  *(_QWORD *)v54 = *(_QWORD *)v55;
  *(_QWORD *)(v54 + 8) = v56;
  swift_bridgeObjectRelease();
  v57 = *((_QWORD *)v55 + 3);
  *(_QWORD *)(v54 + 16) = *((_QWORD *)v55 + 2);
  *(_QWORD *)(v54 + 24) = v57;
  swift_bridgeObjectRelease();
  v58 = *(_QWORD *)(v54 + 32);
  v59 = *(_QWORD *)(v54 + 40);
  *(_OWORD *)(v54 + 32) = *((_OWORD *)v55 + 2);
  sub_2376C5800(v58, v59);
LABEL_40:
  v61 = a3[14];
  v62 = &a1[v61];
  v63 = (uint64_t *)&a2[v61];
  v65 = *v63;
  v64 = v63[1];
  *(_QWORD *)v62 = v65;
  *((_QWORD *)v62 + 1) = v64;
  swift_bridgeObjectRelease();
  v66 = a3[15];
  v67 = &a1[v66];
  v68 = (uint64_t *)&a2[v66];
  v70 = *v68;
  v69 = v68[1];
  *(_QWORD *)v67 = v70;
  *((_QWORD *)v67 + 1) = v69;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationEntry()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376CC6C4(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2376D4F50();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[7];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[12];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for IntegrationEntry()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376CC79C(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_2376D4F50();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[7];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[12];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_2376CC864()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2376D4F50();
  if (v0 <= 0x3F)
  {
    sub_2376CC960(319, &qword_2542B6F30, (void (*)(uint64_t))MEMORY[0x24BDCF510]);
    if (v1 <= 0x3F)
    {
      sub_2376CC960(319, &qword_2542B6F70, (void (*)(uint64_t))type metadata accessor for IntegrationRecurrence);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_2376CC960(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2376D525C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for IntegrationRecurrence(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v7 = a3[6];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v8, v9, *(_QWORD *)(v11 + 64));
      }
      else
      {
        v14 = sub_2376D4F50();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v8, v9, v14);
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(_QWORD *)((char *)v4 + v15) = *(_QWORD *)((char *)a2 + v15);
    v16 = a3[10];
    *(_QWORD *)((char *)v4 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    *(_QWORD *)((char *)v4 + v16) = *(_QWORD *)((char *)a2 + v16);
    v17 = a3[12];
    *(_QWORD *)((char *)v4 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
    *(_QWORD *)((char *)v4 + v17) = *(_QWORD *)((char *)a2 + v17);
    *(_QWORD *)((char *)v4 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for IntegrationRecurrence(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v2, 1, v3)
    && !swift_getEnumCaseMultiPayload())
  {
    v4 = sub_2376D4F50();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v2, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v7, v8, *(_QWORD *)(v10 + 64));
    }
    else
    {
      v12 = sub_2376D4F50();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v7, v8, v12);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v14 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  v15 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  size_t v14;
  uint64_t v15;
  uint64_t v17;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_2376CA9D0((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      if (!swift_getEnumCaseMultiPayload())
      {
        v17 = sub_2376D4F50();
        (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v7, v8, v17);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v14 = *(_QWORD *)(v10 + 64);
      goto LABEL_8;
    }
    sub_2376CA9D0((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
LABEL_7:
    v14 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48) - 8) + 64);
LABEL_8:
    memcpy(v7, v8, v14);
    goto LABEL_14;
  }
  if (v13)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v7, v8, *(_QWORD *)(v10 + 64));
  }
  else
  {
    v15 = sub_2376D4F50();
    (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v7, v8, v15);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_14:
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v7, v8, *(_QWORD *)(v10 + 64));
    }
    else
    {
      v12 = sub_2376D4F50();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v7, v8, v12);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v14 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  v15 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for IntegrationRecurrence(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_2376CA9D0((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
      if (!swift_getEnumCaseMultiPayload())
      {
        v18 = sub_2376D4F50();
        (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v7, v8, v18);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v14 = *(_QWORD *)(v10 + 64);
      goto LABEL_8;
    }
    sub_2376CA9D0((uint64_t)v7, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
LABEL_7:
    v14 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48) - 8) + 64);
LABEL_8:
    memcpy(v7, v8, v14);
    goto LABEL_14;
  }
  if (v13)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v7, v8, *(_QWORD *)(v10 + 64));
  }
  else
  {
    v15 = sub_2376D4F50();
    (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v7, v8, v15);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_14:
  v16 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376CD3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376CD440(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32)) = a2;
  return result;
}

void sub_2376CD4C0()
{
  unint64_t v0;

  sub_2376CC960(319, &qword_2542B6F50, (void (*)(uint64_t))type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for IntegrationRecurrence.RecurrenceEnd(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  else
  {
    v8 = sub_2376D4F50();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for IntegrationRecurrence.RecurrenceEnd(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if (!(_DWORD)result)
  {
    v3 = sub_2376D4F50();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_2376D4F50();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2376CA9D0((uint64_t)a1, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_2376D4F50();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_2376D4F50();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for IntegrationRecurrence.RecurrenceEnd(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2376CA9D0((uint64_t)a1, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_2376D4F50();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.RecurrenceEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence.RecurrenceEnd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2376CD8D0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2376CD8E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2376D4F50();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.Frequency(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence.Frequency(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376CDA2C + 4 * byte_2376D7185[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2376CDA60 + 4 * byte_2376D7180[v4]))();
}

uint64_t sub_2376CDA60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376CDA68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376CDA70);
  return result;
}

uint64_t sub_2376CDA7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376CDA84);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2376CDA88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376CDA90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntegrationRecurrence.Frequency()
{
  return &type metadata for IntegrationRecurrence.Frequency;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.Weekday(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence.Weekday(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376CDB88 + 4 * byte_2376D718F[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2376CDBBC + 4 * byte_2376D718A[v4]))();
}

uint64_t sub_2376CDBBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376CDBC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376CDBCCLL);
  return result;
}

uint64_t sub_2376CDBD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376CDBE0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2376CDBE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376CDBEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2376CDBF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntegrationRecurrence.Weekday()
{
  return &type metadata for IntegrationRecurrence.Weekday;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntegrationRecurrence.DayOfTheWeek(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFA && a1[16])
    return (*(_DWORD *)a1 + 250);
  v3 = *a1;
  v4 = v3 >= 7;
  v5 = v3 - 7;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationRecurrence.DayOfTheWeek(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_QWORD *)result = a2 - 250;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 6;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationRecurrence.DayOfTheWeek()
{
  return &type metadata for IntegrationRecurrence.DayOfTheWeek;
}

uint64_t destroy for IntegrationColor(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_2376C5800(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

_QWORD *initializeWithCopy for IntegrationColor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[4];
  v6 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2376BCC44(v5, v6);
  a1[4] = v5;
  a1[5] = v6;
  return a1;
}

_QWORD *assignWithCopy for IntegrationColor(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[4];
  v4 = a2[5];
  sub_2376BCC44(v5, v4);
  v6 = a1[4];
  v7 = a1[5];
  a1[4] = v5;
  a1[5] = v4;
  sub_2376C5800(v6, v7);
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

_QWORD *assignWithTake for IntegrationColor(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a1[4];
  v7 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_2376C5800(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntegrationColor(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntegrationColor(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntegrationColor()
{
  return &type metadata for IntegrationColor;
}

uint64_t destroy for IntegrationColor.Identifier()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for IntegrationColor.Identifier(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for IntegrationColor.Identifier(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for IntegrationColor.Identifier(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for IntegrationColor.Identifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IntegrationColor.Identifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntegrationColor.Identifier()
{
  return &type metadata for IntegrationColor.Identifier;
}

CalendarIntegrationSupport::SyncResult::FullSyncInfo __swiftcall SyncResult.FullSyncInfo.init(allIDs:)(CalendarIntegrationSupport::SyncResult::FullSyncInfo allIDs)
{
  CalendarIntegrationSupport::SyncResult::FullSyncInfo *v1;

  v1->allIDs._rawValue = allIDs.allIDs._rawValue;
  return allIDs;
}

CalendarIntegrationSupport::SyncResult::IncrementalSyncInfo __swiftcall SyncResult.IncrementalSyncInfo.init(insertedAndUpdated:deleted:updatedColors:)(Swift::OpaquePointer insertedAndUpdated, Swift::OpaquePointer deleted, Swift::OpaquePointer updatedColors)
{
  Swift::OpaquePointer *v3;
  CalendarIntegrationSupport::SyncResult::IncrementalSyncInfo result;

  v3->_rawValue = insertedAndUpdated._rawValue;
  v3[1]._rawValue = deleted._rawValue;
  v3[2]._rawValue = updatedColors._rawValue;
  result.updatedColors = updatedColors;
  result.deleted = deleted;
  result.insertedAndUpdated = insertedAndUpdated;
  return result;
}

__n128 SyncResult.init(modTag:syncType:)@<Q0>(__n128 *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;

  v3 = *((_QWORD *)a2 + 2);
  v4 = *((_BYTE *)a2 + 24);
  result = *a1;
  v6 = *a2;
  *(__n128 *)a3 = *a1;
  *(_OWORD *)(a3 + 16) = v6;
  *(_QWORD *)(a3 + 32) = v3;
  *(_BYTE *)(a3 + 40) = v4;
  return result;
}

CalendarIntegrationSupport::ModTag __swiftcall ModTag.init(stringValue:)(CalendarIntegrationSupport::ModTag stringValue)
{
  CalendarIntegrationSupport::ModTag *v1;

  *v1 = stringValue;
  return stringValue;
}

uint64_t ModTag.stringValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModTag.stringValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ModTag.stringValue.modify())()
{
  return nullsub_1;
}

uint64_t static ModTag.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2376D5454();
}

uint64_t sub_2376CE17C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2376D5454();
}

uint64_t dispatch thunk of IntegrationCollectionDataSource.sync(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of IntegrationCollectionDataSource.fetch(ids:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of IntegrationCollectionDataSource.fetch(colorIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_2376CE1F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SyncResult(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_2376CE258(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t sub_2376CE258(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if ((a4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for SyncResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_2376CE1F4(v4, v5, v6, v7);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = v7;
  return a1;
}

uint64_t assignWithCopy for SyncResult(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v2[2];
  v5 = v2[3];
  v6 = v2[4];
  LOBYTE(v2) = *((_BYTE *)v2 + 40);
  sub_2376CE1F4(v4, v5, v6, (char)v2);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = (_BYTE)v2;
  sub_2376CE258(v7, v8, v9, v10);
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

uint64_t assignWithTake for SyncResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  sub_2376CE258(v7, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncResult(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncResult()
{
  return &type metadata for SyncResult;
}

uint64_t destroy for SyncResult.SyncType(uint64_t a1)
{
  return sub_2376CE258(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for SyncResult.SyncType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_2376CE1F4(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for SyncResult.SyncType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_2376CE1F4(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  sub_2376CE258(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SyncResult.SyncType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_BYTE *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  sub_2376CE258(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncResult.SyncType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncResult.SyncType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_2376CE6A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_2376CE6B0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SyncResult.SyncType()
{
  return &type metadata for SyncResult.SyncType;
}

ValueMetadata *type metadata accessor for SyncResult.FullSyncInfo()
{
  return &type metadata for SyncResult.FullSyncInfo;
}

uint64_t destroy for SyncResult.IncrementalSyncInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s26CalendarIntegrationSupport10SyncResultV19IncrementalSyncInfoVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SyncResult.IncrementalSyncInfo(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

uint64_t assignWithTake for SyncResult.IncrementalSyncInfo(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncResult.IncrementalSyncInfo(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncResult.IncrementalSyncInfo(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncResult.IncrementalSyncInfo()
{
  return &type metadata for SyncResult.IncrementalSyncInfo;
}

_QWORD *initializeBufferWithCopyOfBuffer for ModTag(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ModTag()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ModTag(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ModTag(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModTag(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ModTag(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ModTag()
{
  return &type metadata for ModTag;
}

uint64_t IntegrationCollectionSync.__allocating_init(syncDataProvider:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_2376D4A20(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
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

uint64_t IntegrationCollectionSync.init(syncDataProvider:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_2376D4284((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

void *sub_2376CEB08()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  char v57;
  _QWORD v58[2];
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;

  v2 = v0;
  v65 = *MEMORY[0x24BDAC8D0];
  v3 = v0 + 2;
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = v0[11];
  v7 = v0[12];
  result = (void *)(*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v5 + 32))(v2[11], v2[12], v4, v5);
  if (v1)
    return result;
  v9 = result;
  v54 = v6;
  v55 = v3;
  v10 = objc_msgSend(result, sel_externalModificationTag);
  if (v10)
  {
    v11 = v10;
    v56 = sub_2376D513C();
    v13 = v12;

    swift_bridgeObjectRetain();
  }
  else
  {

    v56 = 0;
    v13 = 0;
  }
  if (qword_2542B6C40 != -1)
    swift_once();
  v14 = sub_2376D50B8();
  __swift_project_value_buffer(v14, (uint64_t)qword_2542B7060);
  swift_bridgeObjectRetain_n();
  swift_retain();
  v15 = sub_2376D50A0();
  v16 = sub_2376D51FC();
  v53 = v7;
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v51 = (void *)swift_slowAlloc();
    v59 = v51;
    *(_DWORD *)v17 = 136446722;
    v18 = v2[9];
    v19 = v2[10];
    swift_bridgeObjectRetain();
    v58[0] = sub_2376BBA08(v18, v19, (uint64_t *)&v59);
    sub_2376D5268();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    v20 = v2[13];
    v21 = v2[14];
    swift_bridgeObjectRetain();
    v58[0] = sub_2376BBA08(v20, v21, (uint64_t *)&v59);
    sub_2376D5268();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2082;
    if (v13)
      v22 = 1752459639;
    else
      v22 = 0x74756F68746977;
    if (v13)
      v23 = 0xE400000000000000;
    else
      v23 = 0xE700000000000000;
    v58[0] = sub_2376BBA08(v22, v23, (uint64_t *)&v59);
    sub_2376D5268();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2376B5000, v15, v16, "Requesting a sync of %{public}s \"%s\" %{public}s a previous mod tag.", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B819E18](v51, -1, -1);
    MEMORY[0x23B819E18](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    v24 = swift_release();
  }
  v25 = MEMORY[0x23B8199D4](v24);
  v26 = v2[18];
  v27 = v2[19];
  __swift_project_boxed_opaque_existential_1(v2 + 15, v26);
  v58[0] = v56;
  v58[1] = v13;
  (*(void (**)(id *__return_ptr, _QWORD *, uint64_t, uint64_t))(v27 + 8))(&v59, v58, v26, v27);
  v28 = v60;
  v52 = v59;
  v29 = v61;
  v30 = v62;
  v31 = v63;
  v32 = (void *)v25;
  v33 = v64;
  objc_autoreleasePoolPop(v32);
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0)
  {
    v59 = v29;
    v60 = v30;
    v61 = (void *)v31;
    swift_bridgeObjectRetain();
    sub_2376CE1F4((uint64_t)v29, v30, v31, 1);
    sub_2376CE1F4((uint64_t)v29, v30, v31, 1);
    sub_2376CF250((uint64_t)&v59);
    v34 = (uint64_t)v29;
    v35 = v30;
    v36 = v31;
    v37 = 1;
  }
  else
  {
    v59 = v29;
    swift_bridgeObjectRetain();
    sub_2376CE1F4((uint64_t)v29, v30, v31, 0);
    sub_2376CE1F4((uint64_t)v29, v30, v31, 0);
    sub_2376D0664((uint64_t *)&v59);
    v34 = (uint64_t)v29;
    v35 = v30;
    v36 = v31;
    v37 = 0;
  }
  sub_2376CE258(v34, v35, v36, v37);
  if (!v28)
  {
    swift_bridgeObjectRelease();
    sub_2376CE258((uint64_t)v29, v30, v31, v33);
    if (!v13)
      goto LABEL_35;
    swift_bridgeObjectRelease();
    v52 = 0;
LABEL_30:
    v57 = v33;
    v39 = v28;
    v40 = v2[5];
    v41 = v2[6];
    __swift_project_boxed_opaque_existential_1(v55, v40);
    v42 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 32))(v54, v53, v40, v41);
    if (v39)
    {
      v43 = (void *)sub_2376D5130();
      swift_bridgeObjectRelease();
    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(v42, sel_setExternalModificationTag_, v43, v52);

    v44 = (void *)v2[7];
    v59 = 0;
    if (!objc_msgSend(v44, sel_saveCalendar_commit_error_, v42, 0, &v59))
    {
      v50 = v59;
      sub_2376D4EA8();

      swift_willThrow();
      swift_bridgeObjectRelease();
      return (void *)sub_2376CE258((uint64_t)v29, v30, v31, v57);
    }
    v45 = v59;

    v33 = v57;
    goto LABEL_35;
  }
  sub_2376CE258((uint64_t)v29, v30, v31, v33);
  if (!v13)
    goto LABEL_30;
  if (v52 != (id)v56 || v28 != v13)
  {
    v38 = sub_2376D5454();
    swift_bridgeObjectRelease();
    if ((v38 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_35:
  v46 = (void *)v2[7];
  v59 = 0;
  v47 = objc_msgSend(v46, sel_commitWithRollback_, &v59, v52);
  v48 = v59;
  if ((v47 & 1) == 0)
  {
    v49 = v48;
    sub_2376D4EA8();

    swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return (void *)sub_2376CE258((uint64_t)v29, v30, v31, v33);
}

void sub_2376CF250(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t isa;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  Class v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  Class v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  id v25;
  Class v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  os_log_type_t type;
  uint64_t v35;
  uint64_t v36;
  os_log_t log;
  NSObject *v38;
  id v39[2];

  v3 = v2;
  v4 = v1;
  v39[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = *(id *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  if (qword_2542B6C40 != -1)
LABEL_35:
    swift_once();
  v8 = sub_2376D50B8();
  __swift_project_value_buffer(v8, (uint64_t)qword_2542B7060);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v9 = sub_2376D50A0();
  v10 = sub_2376D5214();
  v38 = v4;
  v35 = v7;
  v36 = (uint64_t)v6;
  if (!os_log_type_enabled(v9, v10))
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v16 = swift_bridgeObjectRelease_n();
    v7 = *(_QWORD *)(v5 + 16);
    if (!v7)
      goto LABEL_23;
    goto LABEL_6;
  }
  type = v10;
  v11 = swift_slowAlloc();
  v33 = (void *)swift_slowAlloc();
  v39[0] = v33;
  *(_DWORD *)v11 = 136446978;
  isa = (uint64_t)v4[9].isa;
  v13 = (unint64_t)v4[10].isa;
  swift_bridgeObjectRetain();
  sub_2376BBA08(isa, v13, (uint64_t *)v39);
  sub_2376D5268();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 12) = 2080;
  v14 = (uint64_t)v38[13].isa;
  v15 = (unint64_t)v38[14].isa;
  swift_bridgeObjectRetain();
  sub_2376BBA08(v14, v15, (uint64_t *)v39);
  sub_2376D5268();
  swift_release_n();
  v4 = v38;
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 22) = 2048;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2376D5268();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 32) = 2048;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2376D5268();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_2376B5000, v9, type, "Performing an incremental sync for collection %{public}s \"%s\" with %ld updated or inserted items and %ld deleted items", (uint8_t *)v11, 0x2Au);
  swift_arrayDestroy();
  MEMORY[0x23B819E18](v33, -1, -1);
  MEMORY[0x23B819E18](v11, -1, -1);

  v7 = *(_QWORD *)(v5 + 16);
  if (v7)
  {
LABEL_6:
    log = v4 + 2;
    swift_bridgeObjectRetain();
    v5 += 40;
    while (1)
    {
      v17 = v4[7].isa;
      swift_bridgeObjectRetain();
      v18 = v4;
      v19 = v17;
      v20 = (void *)sub_2376D5130();
      v22 = (uint64_t)v18[5].isa;
      v21 = v18[6].isa;
      __swift_project_boxed_opaque_existential_1(log, v22);
      (*((void (**)(uint64_t, Class))v21 + 3))(v22, v21);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

LABEL_33:
        return;
      }
      sub_2376BD590(0, &qword_2542B6C88);
      v23 = (void *)sub_2376D516C();
      swift_bridgeObjectRelease();
      v6 = -[objc_class eventsWithExternalIdentifier:inCalendars:](v19, sel_eventsWithExternalIdentifier_inCalendars_, v20, v23);

      if (v6)
      {
        sub_2376BD590(0, (unint64_t *)&unk_2542B6FC0);
        v24 = sub_2376D5184();

        v4 = v38;
        if (v24 >> 62)
        {
          swift_bridgeObjectRetain();
          v28 = sub_2376D53DC();
          swift_bridgeObjectRelease();
          if (!v28)
          {
LABEL_19:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_8;
          }
        }
        else if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          goto LABEL_19;
        }
        if ((v24 & 0xC000000000000001) != 0)
        {
          v25 = (id)MEMORY[0x23B819770](0, v24);
        }
        else
        {
          if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_35;
          }
          v25 = *(id *)(v24 + 32);
        }
        v20 = v25;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v26 = v38[7].isa;
        v39[0] = 0;
        if (!-[objc_class removeEvent:span:commit:error:](v26, sel_removeEvent_span_commit_error_, v20, 1, 0, v39))
        {
          v32 = v39[0];
          swift_bridgeObjectRelease();
          sub_2376D4EA8();

          swift_willThrow();
          goto LABEL_33;
        }
        v27 = v39[0];

      }
      else
      {
        swift_bridgeObjectRelease();
        v4 = v38;
      }
LABEL_8:
      v5 += 16;
      if (!--v7)
      {
        v16 = swift_bridgeObjectRelease();
        break;
      }
    }
  }
LABEL_23:
  v29 = *(_QWORD *)(v36 + 16);
  if (v29)
  {
    v30 = 0;
    while (1)
    {
      v31 = (void *)MEMORY[0x23B8199D4](v16);
      sub_2376D1EF8(v30, v4, 50, v36);
      if (v3)
        break;
      if (__OFADD__(v30, 50))
        v30 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v30 += 50;
      objc_autoreleasePoolPop(v31);
      if (v30 >= v29)
        goto LABEL_30;
    }
    objc_autoreleasePoolPop(v31);
  }
  else
  {
LABEL_30:
    sub_2376D23D8(v35);
  }
}

void sub_2376CF880(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  id v16;
  id v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  id i;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  char *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  id v59;
  void *v60;
  char *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  int *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  unint64_t *v71;
  void *v72;
  id v73;
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  uint64_t v87;
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v100;
  void *v101;
  unsigned int v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  NSObject *v109;
  os_log_type_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  id v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  _QWORD *v121;
  _QWORD *v122;
  uint64_t v123;
  id v124;
  char *v125;
  uint64_t v126;
  id v127[3];
  id v128[4];

  v3 = v2;
  v128[3] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F28);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v8 = a1[1];
  v10 = (void *)v1[7];
  swift_bridgeObjectRetain();
  v124 = v10;
  v125 = (char *)sub_2376D5130();
  v11 = v1[5];
  v12 = v1[6];
  v123 = (uint64_t)(v1 + 2);
  __swift_project_boxed_opaque_existential_1(v1 + 2, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
  v13 = v3;
  if (!v3)
  {
    v119 = v7;
    v120 = v9;
    v122 = v1;
    sub_2376BD590(0, &qword_2542B6C88);
    v14 = (void *)sub_2376D516C();
    swift_bridgeObjectRelease();
    v16 = v124;
    v15 = v125;
    v17 = objc_msgSend(v124, sel_eventsWithExternalIdentifier_inCalendars_, v125, v14);

    v121 = (_QWORD *)v8;
    v125 = (char *)a1;
    v18 = (_QWORD *)v123;
    if (!v17)
      goto LABEL_27;
    sub_2376BD590(0, (unint64_t *)&unk_2542B6FC0);
    v19 = sub_2376D5184();

    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      v42 = sub_2376D53DC();
      swift_bridgeObjectRelease();
      if (v42)
        goto LABEL_7;
    }
    else if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_7:
      if ((v19 & 0xC000000000000001) != 0)
        goto LABEL_56;
      if (!*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_58;
      }
      for (i = *(id *)(v19 + 32); ; i = (id)MEMORY[0x23B819770](0, v19, v20))
      {
        v22 = i;
        v23 = (uint64_t)v119;
        swift_bridgeObjectRelease();
        v24 = v22;
        v25 = objc_msgSend(v24, sel_calendar);
        if (!v25)
        {
          __break(1u);
LABEL_60:
          __break(1u);
          return;
        }
        v26 = v25;
        v27 = v125;
        v28 = objc_msgSend(v25, sel_source);

        if (!v28)
          goto LABEL_60;
        v29 = objc_msgSend(v28, sel_personaIdentifier);

        if (v29)
        {
          v30 = sub_2376D513C();
          v32 = v31;

          v33 = type metadata accessor for IntegrationEntry(0);
          v34 = &v27[*(int *)(v33 + 56)];
          v35 = *((_QWORD *)v34 + 1);
          if (v35)
          {
            v36 = (int *)v33;
            if (v30 == *(_QWORD *)v34 && v35 == v32)
            {
              swift_bridgeObjectRelease();
              v124 = v24;
              goto LABEL_30;
            }
            v38 = sub_2376D5454();
            swift_bridgeObjectRelease();
            if ((v38 & 1) != 0)
            {
              v124 = v24;
              goto LABEL_30;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          v37 = type metadata accessor for IntegrationEntry(0);
          if (!*(_QWORD *)&v27[*(int *)(v37 + 56) + 8])
          {
            v36 = (int *)v37;
            v124 = v24;
            goto LABEL_30;
          }
        }
        v39 = (void *)v122[7];
        v128[0] = 0;
        if (!objc_msgSend(v39, sel_removeEvent_span_commit_error_, v24, 1, 0, v128))
        {
          v41 = v128[0];
          swift_bridgeObjectRelease();
          sub_2376D4EA8();

          swift_willThrow();
          return;
        }
        v40 = v128[0];

LABEL_27:
        v43 = v122;
        v44 = objc_msgSend((id)objc_opt_self(), sel_eventWithEventStore_, v122[7]);
        v45 = v13;
        v47 = v43[5];
        v46 = v43[6];
        __swift_project_boxed_opaque_existential_1(v18, v47);
        v123 = type metadata accessor for IntegrationEntry(0);
        v48 = &v125[*(int *)(v123 + 56)];
        v50 = *(_QWORD *)v48;
        v49 = *((_QWORD *)v48 + 1);
        v51 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 32);
        v52 = v44;
        v53 = v51(v50, v49, v47, v46);
        v13 = v45;
        if (v45)
        {
          swift_bridgeObjectRelease();

          return;
        }
        v54 = (void *)v53;
        objc_msgSend(v52, sel_setCalendar_, v53);

        v55 = (void *)sub_2376D5130();
        objc_msgSend(v52, sel_setUniqueID_, v55);

        v124 = 0;
        v23 = (uint64_t)v119;
        v36 = (int *)v123;
        v24 = v52;
LABEL_30:
        v123 = v13;
        type metadata accessor for IntegrationEntry(0);
        sub_2376CA904((uint64_t)&v125[v36[7]], v23, &qword_2542B6F28);
        v56 = sub_2376D4FBC();
        v57 = *(_QWORD *)(v56 - 8);
        v58 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v23, 1, v56);
        v59 = v24;
        v60 = 0;
        if (v58 != 1)
        {
          v60 = (void *)sub_2376D4FB0();
          (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v23, v56);
        }
        objc_msgSend(v59, sel_setTimeZone_, v60);

        v61 = v125;
        objc_msgSend(v59, sel_setAllDay_, v125[v36[9]]);
        v62 = (void *)sub_2376D4F2C();
        objc_msgSend(v59, sel_setStartDate_, v62);

        v63 = (void *)sub_2376D4F2C();
        objc_msgSend(v59, sel_setEndDate_, v63);

        v19 = *(_QWORD *)&v61[v36[8] + 8];
        v64 = v59;
        v65 = (void *)sub_2376D5130();
        objc_msgSend(v64, sel_setTitle_, v65);

        objc_msgSend(v64, sel_setCompleted_, v61[v36[10]]);
        v66 = v36;
        v67 = (uint64_t)&v61[v36[12]];
        v68 = v64;
        v69 = sub_2376D48C4(v67);
        v13 = (uint64_t)v122;
        if (v69)
        {
          v19 = v69;
          sub_2376BD590(0, &qword_256807CF8);
          v70 = (void *)sub_2376D516C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v70 = 0;
        }
        v18 = v121;
        v16 = v124;
        objc_msgSend(v68, sel_setRecurrenceRules_, v70);

        v71 = (unint64_t *)&v125[v66[15]];
        v72 = (void *)v71[1];
        if (v72)
        {
          v19 = *v71;
          v73 = v68;
          v72 = (void *)sub_2376D5130();
        }
        else
        {
          v74 = v68;
        }
        objc_msgSend(v68, sel_setExternalID_, v72);

        v75 = (uint64_t *)&v125[v66[13]];
        v76 = v75[1];
        if (v76)
        {
          v77 = *v75;
          v78 = (char *)v75[2];
          v79 = v75[3];
          v124 = v16;
          v125 = v78;
          v80 = (uint64_t *)(v13 + 64);
          v82 = v75[4];
          v81 = v75[5];
          swift_beginAccess();
          v19 = *(_QWORD *)(v13 + 64);
          v83 = *(_QWORD *)(v19 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v83)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v84 = (uint64_t)v125;
            sub_2376C6D44(v77, v76, (uint64_t)v125, v79, v82, v81);
            swift_bridgeObjectRetain();
            v85 = sub_2376D2A4C(v77, v76, v84, v79);
            if ((v86 & 1) != 0)
            {
              v87 = v77;
              v88 = *(id *)(*(_QWORD *)(v19 + 56) + 8 * v85);
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              v89 = v88;
              objc_msgSend(v68, sel_setColor_, v89);
              sub_2376C5994(v87, v76, (uint64_t)v125, v79, v82, v81);

              v16 = v124;
              v18 = v121;
              v13 = (uint64_t)v122;
              goto LABEL_48;
            }
            v118 = v82;
            v119 = (char *)v81;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v90 = v77;
            v13 = (uint64_t)v122;
          }
          else
          {
            v118 = v82;
            v119 = (char *)v81;
            sub_2376C6D44(v77, v76, (uint64_t)v125, v79, v82, v81);
            v90 = v77;
          }
          v91 = *(id *)(v13 + 56);
          v92 = (void *)sub_2376D5130();
          v93 = (void *)sub_2376D5130();
          v94 = objc_msgSend(v91, sel_colorWithProviderIdentifier_externalIdentifier_, v92, v93);

          if (!v94)
          {
            v94 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC74C0]), sel_init);
            v95 = (void *)sub_2376D5130();
            objc_msgSend(v94, sel_setProviderIdentifier_, v95);

            v96 = (void *)sub_2376D5130();
            objc_msgSend(v94, sel_setExternalID_, v96);

          }
          swift_beginAccess();
          v97 = v90;
          v98 = v94;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v126 = *v80;
          *v80 = 0x8000000000000000;
          sub_2376D37D0((uint64_t)v98, v97, v76, (uint64_t)v125, v79, isUniquelyReferenced_nonNull_native);
          *v80 = v126;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();
          v100 = v118;
          v19 = (unint64_t)v119;
          v101 = (void *)sub_2376D4EFC();
          objc_msgSend(v98, sel_setData_, v101);

          objc_msgSend(v68, sel_setColor_, v98);
          sub_2376C5994(v97, v76, (uint64_t)v125, v79, v100, v19);
          v18 = v121;
          v13 = (uint64_t)v122;
          v16 = v124;
        }
        else
        {
          objc_msgSend(v68, sel_setColor_, 0);
        }
LABEL_48:
        v15 = (char *)v68;
        v102 = objc_msgSend(v15, sel_sequenceNumber);
        v20 = v102 + 1;
        v9 = v120;
        if (!__OFADD__(v102, 1))
        {
          objc_msgSend(v15, sel_setSequenceNumber_, v20);

          v103 = *(void **)(v13 + 56);
          v127[0] = 0;
          if (objc_msgSend(v103, sel_saveEvent_span_commit_error_, v15, 1, 0, v127))
          {
            v104 = v127[0];

            goto LABEL_3;
          }
          v105 = v127[0];
          v13 = sub_2376D4EA8();

          swift_willThrow();
          if (qword_2542B6C40 == -1)
          {
LABEL_52:
            v106 = sub_2376D50B8();
            __swift_project_value_buffer(v106, (uint64_t)qword_2542B7060);
            v107 = (id)v13;
            swift_bridgeObjectRetain();
            v108 = (id)v13;
            v109 = sub_2376D50A0();
            v110 = sub_2376D5208();
            if (os_log_type_enabled(v109, v110))
            {
              v111 = swift_slowAlloc();
              v124 = v16;
              v112 = (unint64_t)v18;
              v113 = v111;
              v114 = (_QWORD *)swift_slowAlloc();
              v125 = (char *)swift_slowAlloc();
              v127[0] = v125;
              *(_DWORD *)v113 = 136446466;
              swift_bridgeObjectRetain();
              v126 = sub_2376BBA08(v9, v112, (uint64_t *)v127);
              sub_2376D5268();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v113 + 12) = 2112;
              v115 = (id)v13;
              v116 = _swift_stdlib_bridgeErrorToNSError();
              v126 = v116;
              sub_2376D5268();
              *v114 = v116;

              _os_log_impl(&dword_2376B5000, v109, v110, "Failed to save event for entry %{public}s: %@", (uint8_t *)v113, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FD0);
              swift_arrayDestroy();
              MEMORY[0x23B819E18](v114, -1, -1);
              v117 = v125;
              swift_arrayDestroy();
              MEMORY[0x23B819E18](v117, -1, -1);
              MEMORY[0x23B819E18](v113, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            return;
          }
LABEL_58:
          swift_once();
          goto LABEL_52;
        }
        __break(1u);
LABEL_56:
        ;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }

LABEL_3:
  swift_bridgeObjectRelease();
}

uint64_t sub_2376D05C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = MEMORY[0x24BEE4AF8];
    sub_2376D5328();
    v4 = a1 + 32;
    do
    {
      v4 += 8;
      sub_2376D51D8();
      sub_2376D5310();
      sub_2376D5334();
      sub_2376D5340();
      sub_2376D531C();
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

void sub_2376D0664(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v3 = v2;
  v4 = v1;
  v5 = *a1;
  if (qword_2542B6C40 != -1)
    swift_once();
  v6 = sub_2376D50B8();
  __swift_project_value_buffer(v6, (uint64_t)qword_2542B7060);
  swift_retain();
  swift_bridgeObjectRetain();
  v7 = sub_2376D50A0();
  v8 = sub_2376D5214();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v18 = v10;
    *(_DWORD *)v9 = 136446722;
    v11 = v4[9];
    v12 = v4[10];
    swift_bridgeObjectRetain();
    sub_2376BBA08(v11, v12, &v18);
    sub_2376D5268();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    v13 = v4[13];
    v14 = v4[14];
    swift_bridgeObjectRetain();
    sub_2376BBA08(v13, v14, &v18);
    sub_2376D5268();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 22) = 2048;
    sub_2376D5268();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2376B5000, v7, v8, "Performing a full sync for collection %{public}s \"%s\" with %ld IDs", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B819E18](v10, -1, -1);
    MEMORY[0x23B819E18](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
    swift_release();
  }
  v18 = v5;
  sub_2376D0910();
  if (!v3)
  {
    v15 = *(_QWORD *)(v5 + 16);
    if (v15)
    {
      v16 = 0;
      do
      {
        v17 = (void *)MEMORY[0x23B8199D4]();
        sub_2376D1EF8(v16, v4, 50, v5);
        if (__OFADD__(v16, 50))
          v16 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v16 += 50;
        objc_autoreleasePoolPop(v17);
      }
      while (v16 < v15);
    }
  }
}

void sub_2376D0910()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_2376D4364(v2);
  swift_bridgeObjectRelease();
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  v7 = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = v6;
    if (v6 >> 62)
    {
LABEL_29:
      swift_bridgeObjectRetain();
      v9 = sub_2376D53DC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v36 = v3;
    if (v9)
    {
      v39 = v8 & 0xC000000000000001;
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v3 = 4;
      v37 = v7;
      v38 = v8;
      while (1)
      {
        if (v39)
          v12 = (id)MEMORY[0x23B819770](v3 - 4, v8);
        else
          v12 = *(id *)(v8 + 8 * v3);
        v13 = v12;
        v14 = v3 - 3;
        if (__OFADD__(v3 - 4, 1))
        {
          __break(1u);
          goto LABEL_29;
        }
        v15 = objc_msgSend(v12, sel_persistentObject);
        if (!v15)
          break;
        v16 = v15;
        v17 = objc_msgSend(v15, sel_isNew);

        if ((v17 & 1) == 0)
        {
          v18 = objc_msgSend(v13, sel_calendarIdentifier);
          v19 = sub_2376D513C();
          v21 = v20;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v10 = sub_2376C30B4(0, v10[2] + 1, 1, v10);
          v22 = v10;
          v23 = v10[2];
          v24 = v22;
          v25 = v22[3];
          if (v23 >= v25 >> 1)
            v24 = sub_2376C30B4((_QWORD *)(v25 > 1), v23 + 1, 1, v24);
          v24[2] = v23 + 1;
          v11 = &v24[2 * v23];
          v10 = v24;
          v11[4] = v19;
          v11[5] = v21;
          v7 = v37;
          v8 = v38;
        }

        ++v3;
        if (v14 == v9)
          goto LABEL_20;
      }
      __break(1u);
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
      swift_bridgeObjectRelease();
      v41 = 0;
      v42 = 0;
      v40 = 0;
      v26 = v10[2];
      if (v26)
      {
        v27 = v10 + 5;
        do
        {
          v28 = *(v27 - 1);
          v29 = *v27;
          v30 = swift_bridgeObjectRetain();
          v31 = (void *)MEMORY[0x23B8199D4](v30);
          sub_2376D0D30(v36, v28, v29, &v40);
          v27 += 2;
          objc_autoreleasePoolPop(v31);
          swift_bridgeObjectRelease();
          --v26;
        }
        while (v26);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_2542B6C40 != -1)
        swift_once();
      v32 = sub_2376D50B8();
      __swift_project_value_buffer(v32, (uint64_t)qword_2542B7060);
      v33 = sub_2376D50A0();
      v34 = sub_2376D5214();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        *(_DWORD *)v35 = 134218496;
        swift_beginAccess();
        v43 = v42;
        sub_2376D5268();
        *(_WORD *)(v35 + 12) = 2048;
        v43 = v40;
        sub_2376D5268();
        *(_WORD *)(v35 + 22) = 2048;
        v43 = v41;
        sub_2376D5268();
        _os_log_impl(&dword_2376B5000, v33, v34, "Looked at %ld and removed %ld that should not be present. (Failed to remove %ld.)", (uint8_t *)v35, 0x20u);
        MEMORY[0x23B819E18](v35, -1, -1);
      }

    }
  }
}

void sub_2376D0D30(uint64_t a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  BOOL v37;
  unint64_t v38;
  _QWORD *v39;
  BOOL v40;
  unint64_t v41;
  _QWORD *v42;
  BOOL v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v92;
  uint64_t v93[9];
  id v94[5];

  v6 = (_QWORD *)v4;
  v94[3] = *(id *)MEMORY[0x24BDAC8D0];
  v10 = *(id *)(v4 + 56);
  v11 = (void *)sub_2376D5130();
  v12 = (unint64_t)objc_msgSend(v10, sel_calendarWithIdentifier_, v11);

  if (!v12)
  {
    if (qword_2542B6C40 != -1)
      goto LABEL_78;
    goto LABEL_51;
  }
  v13 = (void *)v6[7];
  v93[0] = 0;
  v94[0] = 0;
  objc_msgSend(v13, sel_loadEventIDs_uniqueIDs_calendar_, v93, v94, v12);
  v14 = v94[0];
  v15 = (void *)v93[0];
  if (!v94[0] || !v93[0])
  {
    v58 = qword_2542B6C40;
    v59 = v94[0];
    v60 = v15;
    if (v58 != -1)
      swift_once();
    v61 = sub_2376D50B8();
    __swift_project_value_buffer(v61, (uint64_t)qword_2542B7060);
    v62 = sub_2376D50A0();
    v63 = sub_2376D5208();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_2376B5000, v62, v63, "Couldn't fetch contents of calendar to check for removed reminders", v64, 2u);
      MEMORY[0x23B819E18](v64, -1, -1);
      v65 = (void *)v12;
    }
    else
    {
      v65 = v62;
      v62 = v12;
    }

    return;
  }
  v93[0] = 0;
  sub_2376BD590(0, &qword_256807CE8);
  v16 = v14;
  v17 = v15;
  v18 = v16;
  v19 = v17;
  sub_2376D5178();
  v20 = v5;
  v82 = v93[0];
  if (!v93[0])
  {
LABEL_66:
    if (qword_2542B6C40 != -1)
      swift_once();
    v68 = sub_2376D50B8();
    __swift_project_value_buffer(v68, (uint64_t)qword_2542B7060);
    v69 = sub_2376D50A0();
    v70 = sub_2376D5208();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_2376B5000, v69, v70, "Fetching contents of calendar returned unexpected results", v71, 2u);
      MEMORY[0x23B819E18](v71, -1, -1);
      v72 = (void *)v12;
      v73 = v19;
      v12 = (unint64_t)v18;
    }
    else
    {
      v72 = v69;
      v69 = v19;
      v73 = v18;
    }

    return;
  }
  v93[0] = 0;
  sub_2376D5178();
  v21 = v93[0];
  if (!v93[0])
  {
    swift_bridgeObjectRelease();
    goto LABEL_66;
  }

  v22 = *(_QWORD *)(v21 + 16);
  v23 = a4[2];
  v24 = __OFADD__(v23, v22);
  v25 = v23 + v22;
  if (v24)
  {
    __break(1u);
    goto LABEL_80;
  }
  a4[2] = v25;
  v12 = MEMORY[0x24BEE4AF8];
  v92 = MEMORY[0x24BEE4AF8];
  v26 = a1;
  if (!v22)
  {
LABEL_61:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!(v12 >> 62))
    {
      if (*(uint64_t *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
      {
LABEL_63:
        v66 = swift_bridgeObjectRetain();
        v67 = (void *)MEMORY[0x23B8199D4](v66);
        sub_2376D1784(v12, (uint64_t)v6, a4);
        if (v20)
        {
          objc_autoreleasePoolPop(v67);
          goto LABEL_58;
        }
        objc_autoreleasePoolPop(v67);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v74 = v6[5];
        v75 = v6[6];
        __swift_project_boxed_opaque_existential_1(v6 + 2, v74);
        (*(void (**)(uint64_t, uint64_t))(v75 + 40))(v74, v75);
        v76 = v6[5];
        v77 = v6[6];
        __swift_project_boxed_opaque_existential_1(v6 + 2, v76);
        v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v76, v77);
        v79 = (void *)v6[7];
        v6[7] = v78;

        swift_beginAccess();
        v6[8] = MEMORY[0x24BEE4B00];
      }
LABEL_75:
      swift_bridgeObjectRelease();
      return;
    }
LABEL_80:
    swift_bridgeObjectRetain();
    v80 = sub_2376D53DC();
    swift_bridgeObjectRelease();
    if (v80 >= 1)
      goto LABEL_63;
    goto LABEL_75;
  }
  v88 = v22;
  a2 = (uint64_t)(v6 + 2);
  v90 = v21 + 32;
  swift_beginAccess();
  a3 = 0;
  v85 = v82 & 0xC000000000000001;
  v86 = a1 + 56;
  v83 = v6;
  v81 = a4;
  v89 = v21;
  v84 = v6 + 2;
  while (a3 < *(_QWORD *)(v21 + 16))
  {
    v27 = (uint64_t *)(v90 + 16 * a3);
    v28 = v27[1];
    if (*(_QWORD *)(v26 + 16))
    {
      v29 = a4;
      v30 = v20;
      a2 = *v27;
      sub_2376D54B4();
      swift_bridgeObjectRetain();
      sub_2376D5148();
      v31 = sub_2376D54D8();
      v32 = v26;
      v33 = -1 << *(_BYTE *)(v26 + 32);
      v34 = v31 & ~v33;
      if (((*(_QWORD *)(v86 + ((v34 >> 3) & 0xFFFFFFFFFFFFF8)) >> v34) & 1) != 0)
      {
        v35 = *(_QWORD *)(v32 + 48);
        v36 = (_QWORD *)(v35 + 16 * v34);
        v37 = *v36 == a2 && v36[1] == v28;
        if (v37 || (sub_2376D5454() & 1) != 0)
        {
LABEL_9:
          v20 = v30;
          a4 = v29;
          v6 = v83;
LABEL_10:
          v26 = a1;
          goto LABEL_11;
        }
        v87 = ~v33;
        v38 = (v34 + 1) & ~v33;
        if (((*(_QWORD *)(v86 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) != 0)
        {
          v39 = (_QWORD *)(v35 + 16 * v38);
          v40 = *v39 == a2 && v39[1] == v28;
          if (v40 || (sub_2376D5454() & 1) != 0)
            goto LABEL_9;
          v41 = (v38 + 1) & v87;
          if (((*(_QWORD *)(v86 + ((v41 >> 3) & 0xFFFFFFFFFFFFF8)) >> v41) & 1) != 0)
          {
            v20 = v30;
            a4 = v29;
            v6 = v83;
            while (1)
            {
              v42 = (_QWORD *)(v35 + 16 * v41);
              v43 = *v42 == a2 && v42[1] == v28;
              if (v43 || (sub_2376D5454() & 1) != 0)
                goto LABEL_10;
              v41 = (v41 + 1) & v87;
              if (((*(_QWORD *)(v86 + ((v41 >> 3) & 0xFFFFFFFFFFFFF8)) >> v41) & 1) == 0)
                goto LABEL_37;
            }
          }
        }
      }
      v20 = v30;
      a4 = v29;
      v6 = v83;
      if (!v85)
      {
LABEL_38:
        if (a3 >= *(_QWORD *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_77;
        v44 = *(id *)(v82 + 32 + 8 * a3);
        goto LABEL_40;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_37:
      if (!v85)
        goto LABEL_38;
    }
    MEMORY[0x23B819770](a3, v82);
LABEL_40:
    MEMORY[0x23B8195E4]();
    if (*(_QWORD *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2376D519C();
    sub_2376D51A8();
    sub_2376D5190();
    swift_bridgeObjectRelease();
    v26 = a1;
    v12 = v92;
    if (v92 >> 62)
    {
      swift_bridgeObjectRetain();
      v45 = sub_2376D53DC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v45 = *(_QWORD *)((v92 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    a2 = (uint64_t)v84;
    if (v45 < 51)
      goto LABEL_12;
    v46 = swift_bridgeObjectRetain();
    v47 = (void *)MEMORY[0x23B8199D4](v46);
    sub_2376D1784(v92, (uint64_t)v6, a4);
    if (v20)
    {
      objc_autoreleasePoolPop(v47);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_75;
    }
    objc_autoreleasePoolPop(v47);
    swift_bridgeObjectRelease();
    v92 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    v48 = v6[5];
    v49 = v6[6];
    __swift_project_boxed_opaque_existential_1(v84, v48);
    (*(void (**)(uint64_t, uint64_t))(v49 + 40))(v48, v49);
    a2 = v6[5];
    v50 = v6[6];
    __swift_project_boxed_opaque_existential_1(v84, a2);
    v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8))(a2, v50);
    v52 = (void *)v6[7];
    v6[7] = v51;

    v6[8] = MEMORY[0x24BEE4B00];
    v12 = MEMORY[0x24BEE4AF8];
    a4 = v81;
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    v21 = v89;
    if (++a3 == v88)
      goto LABEL_61;
  }
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  swift_once();
LABEL_51:
  v53 = sub_2376D50B8();
  __swift_project_value_buffer(v53, (uint64_t)qword_2542B7060);
  swift_bridgeObjectRetain_n();
  v54 = sub_2376D50A0();
  v55 = sub_2376D5208();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    v57 = swift_slowAlloc();
    v93[0] = v57;
    *(_DWORD *)v56 = 136446210;
    swift_bridgeObjectRetain();
    v94[0] = (id)sub_2376BBA08(a2, a3, v93);
    sub_2376D5268();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2376B5000, v54, v55, "Couldn't find calendar with UUID %{public}s while looking for reminders to remove in a full sync; skipping it.",
      v56,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B819E18](v57, -1, -1);
    MEMORY[0x23B819E18](v56, -1, -1);

    return;
  }

LABEL_58:
  swift_bridgeObjectRelease_n();
}

void sub_2376D1784(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  os_log_t v6;
  uint64_t v7;
  __int128 v8;
  _QWORD *i;
  uint64_t v10;
  uint8_t *v11;
  uint8_t *v12;
  os_log_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  os_log_type_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  os_log_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  os_log_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _QWORD *v54;
  id v55;
  void *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  _QWORD *v61;
  void *v62;
  os_log_t v63;
  _QWORD *v64;
  int v65;
  os_log_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  id v73[2];

  v64 = a3;
  v73[1] = *(id *)MEMORY[0x24BDAC8D0];
  v72 = sub_2376D50B8();
  v67 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v6 = (os_log_t)((char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1 >> 62)
    goto LABEL_31;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (i = v64; v7; i = v64)
  {
    v66 = v6;
    v71 = a1 & 0xC000000000000001;
    v69 = i + 1;
    v10 = 4;
    *(_QWORD *)&v8 = 136446466;
    v60 = v8;
    v58 = MEMORY[0x24BEE4AD8] + 8;
    v59 = a2;
    v68 = a1;
    v70 = v7;
    while (1)
    {
      v6 = (os_log_t)(v10 - 4);
      v17 = v71 ? MEMORY[0x23B819770](v10 - 4, a1) : *(id *)(a1 + 8 * v10);
      v18 = v17;
      v19 = v10 - 3;
      if (__OFADD__(v6, 1))
        break;
      v20 = objc_msgSend(*(id *)(a2 + 56), sel_eventForObjectID_occurrenceDate_checkValid_, v17, 0, 0, v58);
      if (v20)
      {
        v6 = v20;
        v21 = *(void **)(a2 + 56);
        v73[0] = 0;
        if ((objc_msgSend(v21, sel_removeEvent_span_commit_error_, v6, 1, 0, v73) & 1) != 0)
        {
          v22 = v73[0];

          v15 = v64;
          v16 = *v64 + 1;
          if (__OFADD__(*v64, 1))
            goto LABEL_29;
          v14 = v70;
        }
        else
        {
          v24 = v73[0];
          v25 = (void *)sub_2376D4EA8();

          swift_willThrow();
          if (qword_2542B6C40 != -1)
            swift_once();
          v26 = v72;
          v27 = __swift_project_value_buffer(v72, (uint64_t)qword_2542B7060);
          v28 = v66;
          v29 = v67;
          (*(void (**)(os_log_t, uint64_t, uint64_t))(v67 + 16))(v66, v27, v26);
          v30 = v25;
          v31 = v6;
          v32 = v25;
          v6 = v31;
          v33 = sub_2376D50A0();
          v65 = sub_2376D5208();
          if (os_log_type_enabled(v33, (os_log_type_t)v65))
          {
            v63 = v33;
            v34 = swift_slowAlloc();
            v61 = (_QWORD *)swift_slowAlloc();
            v62 = (void *)swift_slowAlloc();
            v73[0] = v62;
            *(_DWORD *)v34 = v60;
            v35 = v6;
            v36 = -[NSObject uniqueID](v6, sel_uniqueID);
            if (!v36)
            {

              __break(1u);
            }
            v37 = v36;
            v38 = sub_2376D513C();
            v40 = v39;

            *(_QWORD *)(v34 + 4) = sub_2376BBA08(v38, v40, (uint64_t *)v73);
            swift_bridgeObjectRelease();
            *(_WORD *)(v34 + 12) = 2112;
            v41 = v25;
            v42 = _swift_stdlib_bridgeErrorToNSError();
            *(_QWORD *)(v34 + 14) = v42;
            v43 = v61;
            *v61 = v42;

            v6 = v63;
            _os_log_impl(&dword_2376B5000, v63, (os_log_type_t)v65, "Failed to remove event for entry %{public}s: %@", (uint8_t *)v34, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FD0);
            swift_arrayDestroy();
            MEMORY[0x23B819E18](v43, -1, -1);
            v44 = v62;
            swift_arrayDestroy();
            MEMORY[0x23B819E18](v44, -1, -1);
            MEMORY[0x23B819E18](v34, -1, -1);

            (*(void (**)(os_log_t, uint64_t))(v67 + 8))(v66, v72);
            a2 = v59;
          }
          else
          {

            (*(void (**)(os_log_t, uint64_t))(v29 + 8))(v28, v72);
          }
          a1 = v68;
          v15 = v69;
          v16 = *v69 + 1;
          v14 = v70;
          if (__OFADD__(*v69, 1))
            goto LABEL_30;
        }
      }
      else
      {
        if (qword_2542B6C40 != -1)
          swift_once();
        __swift_project_value_buffer(v72, (uint64_t)qword_2542B7060);
        v6 = (os_log_t)sub_2376D50A0();
        v23 = sub_2376D5208();
        if (os_log_type_enabled(v6, v23))
        {
          v11 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_2376B5000, v6, v23, "Couldn't turn object ID into an event", v11, 2u);
          v12 = v11;
          a1 = v68;
          MEMORY[0x23B819E18](v12, -1, -1);
          v13 = v18;
        }
        else
        {
          v13 = v6;
          v6 = v18;
        }
        v14 = v70;

        v15 = v69;
        v16 = *v69 + 1;
        if (__OFADD__(*v69, 1))
          goto LABEL_28;
      }
      *v15 = v16;
      ++v10;
      if (v19 == v14)
        goto LABEL_32;
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    v7 = sub_2376D53DC();
  }
LABEL_32:
  swift_bridgeObjectRelease();
  v45 = *(void **)(a2 + 56);
  v73[0] = 0;
  if ((objc_msgSend(v45, sel_commitWithRollback_, v73) & 1) != 0)
  {
    v46 = v73[0];
  }
  else
  {
    v47 = v73[0];
    v48 = (void *)sub_2376D4EA8();

    swift_willThrow();
    if (qword_2542B6C40 != -1)
      swift_once();
    __swift_project_value_buffer(v72, (uint64_t)qword_2542B7060);
    v49 = v48;
    v50 = v48;
    v51 = sub_2376D50A0();
    v52 = sub_2376D5208();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v53 = 138412290;
      v55 = v48;
      v56 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v73[0] = v56;
      sub_2376D5268();
      *v54 = v56;

      _os_log_impl(&dword_2376B5000, v51, v52, "Failed to commit removals: %@", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FD0);
      swift_arrayDestroy();
      MEMORY[0x23B819E18](v54, -1, -1);
      MEMORY[0x23B819E18](v53, -1, -1);
    }
    else
    {

    }
    sub_2376D4B68();
    swift_allocError();
    *v57 = 2;
    swift_willThrow();

  }
}

void sub_2376D1EF8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  _QWORD *v39;
  id v40;
  void *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  id v48[5];

  v48[4] = *(id *)MEMORY[0x24BDAC8D0];
  v9 = type metadata accessor for IntegrationEntry(0);
  v44 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1)
  {
    v47 = a3;
    v13 = a2[5];
    v12 = a2[6];
    __swift_project_boxed_opaque_existential_1(a2 + 2, v13);
    (*(void (**)(uint64_t, uint64_t))(v12 + 40))(v13, v12);
    if (v4)
      return;
    v14 = a2[5];
    v15 = a2[6];
    __swift_project_boxed_opaque_existential_1(a2 + 2, v14);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    v17 = (void *)a2[7];
    a2[7] = v16;

    swift_beginAccess();
    a2[8] = MEMORY[0x24BEE4B00];
    swift_bridgeObjectRelease();
    a3 = v47;
  }
  if (__OFADD__(a1, a3))
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (*(_QWORD *)(a4 + 16) >= a1 + a3)
    a3 += a1;
  else
    a3 = *(_QWORD *)(a4 + 16);
  v18 = a2[18];
  v19 = a2[19];
  v20 = __swift_project_boxed_opaque_existential_1(a2 + 15, v18);
  if (a3 < a1)
    goto LABEL_29;
  if (a1 < 0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v46 = v20;
  v47 = v19;
  v45 = v18;
  sub_2376D5460();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v21 = swift_dynamicCastClass();
  if (!v21)
  {
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
  }
  v22 = *(_QWORD *)(v21 + 16);
  swift_release();
  if (v22 == a3 - a1)
  {
    v23 = swift_dynamicCastClass();
    v24 = v45;
    if (!v23)
    {
      swift_bridgeObjectRelease();
      v23 = MEMORY[0x24BEE4AF8];
    }
    goto LABEL_15;
  }
LABEL_31:
  swift_bridgeObjectRelease();
  v23 = sub_2376BCD70(a4, a4 + 32, a1, (2 * a3) | 1);
  v24 = v45;
LABEL_15:
  swift_bridgeObjectRelease();
  v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 16))(v23, v24);
  swift_release();
  if (!v4)
  {
    v26 = *(_QWORD *)(v25 + 16);
    if (v26)
    {
      v27 = v25 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
      v28 = *(_QWORD *)(v44 + 72);
      do
      {
        sub_2376D4BE8(v27, (uint64_t)v11, type metadata accessor for IntegrationEntry);
        sub_2376CF880(v11);
        sub_2376CA9D0((uint64_t)v11, type metadata accessor for IntegrationEntry);
        v27 += v28;
        --v26;
      }
      while (v26);
    }
    swift_bridgeObjectRelease();
    v29 = (void *)a2[7];
    v48[0] = 0;
    if ((objc_msgSend(v29, sel_commitWithRollback_, v48) & 1) != 0)
    {
      v30 = v48[0];
    }
    else
    {
      v31 = v48[0];
      v32 = (void *)sub_2376D4EA8();

      swift_willThrow();
      if (qword_2542B6C40 != -1)
        swift_once();
      v33 = sub_2376D50B8();
      __swift_project_value_buffer(v33, (uint64_t)qword_2542B7060);
      v34 = v32;
      v35 = v32;
      v36 = sub_2376D50A0();
      v37 = sub_2376D5208();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        v39 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v38 = 138412290;
        v40 = v32;
        v41 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v48[0] = v41;
        sub_2376D5268();
        *v39 = v41;

        _os_log_impl(&dword_2376B5000, v36, v37, "Failed to commit changes to event store: %@", v38, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FD0);
        swift_arrayDestroy();
        MEMORY[0x23B819E18](v39, -1, -1);
        MEMORY[0x23B819E18](v38, -1, -1);
      }
      else
      {

      }
      sub_2376D4B68();
      swift_allocError();
      *v42 = 2;
      swift_willThrow();

    }
  }
}

char *sub_2376D23D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char *v11;
  unint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  char *v29;
  char v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35[2];

  v3 = v1;
  v35[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(v3 + 144);
  v6 = *(_QWORD *)(v3 + 152);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 120), v5);
  result = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
  if (!v2)
  {
    v8 = *((_QWORD *)result + 2);
    if (v8)
    {
      v9 = 0;
      v10 = 0;
      v31 = -v8;
      v32 = result;
      v11 = result + 72;
      v33 = v3;
      v29 = result + 72;
LABEL_5:
      v30 = v9;
      v12 = (unint64_t *)&v11[48 * v10];
      v13 = v10 + 1;
      do
      {
        if ((unint64_t)(v13 - 1) >= *((_QWORD *)result + 2))
          __break(1u);
        v15 = *(v12 - 1);
        v14 = *v12;
        v34 = v13;
        v16 = *(id *)(v3 + 56);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v17 = v15;
        v18 = v15;
        v19 = v14;
        sub_2376BCC44(v18, v14);
        v20 = (void *)sub_2376D5130();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v21 = (void *)sub_2376D5130();
        swift_bridgeObjectRelease();
        v22 = objc_msgSend(v16, sel_colorWithProviderIdentifier_externalIdentifier_, v20, v21);

        if (v22)
        {
          v23 = (void *)sub_2376D4EFC();
          objc_msgSend(v22, sel_setData_, v23);

          v24 = *(void **)(v33 + 56);
          v35[0] = 0;
          if ((objc_msgSend(v24, sel_saveColor_commit_error_, v22, 0, v35) & 1) == 0)
          {
            v28 = v35[0];
            swift_bridgeObjectRelease();
            sub_2376D4EA8();

            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            return (char *)sub_2376C5800(v17, v19);
          }
          v10 = v34;
          v25 = v35[0];
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          sub_2376C5800(v17, v19);
          v9 = 1;
          result = v32;
          v3 = v33;
          v11 = v29;
          if (v31 + v34)
            goto LABEL_5;
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2376C5800(v17, v19);
        v3 = v33;
        v13 = v34 + 1;
        result = v32;
        v12 += 6;
      }
      while (v31 + v34 + 1 != 1);
      result = (char *)swift_bridgeObjectRelease();
      if ((v30 & 1) != 0)
      {
LABEL_14:
        v26 = *(void **)(v3 + 56);
        v35[0] = 0;
        if (objc_msgSend(v26, sel_commitWithRollback_, v35, v29))
        {
          return (char *)v35[0];
        }
        else
        {
          v27 = v35[0];
          sub_2376D4EA8();

          return (char *)swift_willThrow();
        }
      }
    }
    else
    {
      return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t IntegrationCollectionSync.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_bridgeObjectRelease();
  sub_2376BC250(v0 + 72);
  return v0;
}

uint64_t IntegrationCollectionSync.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_bridgeObjectRelease();
  sub_2376BC250(v0 + 72);
  return swift_deallocClassInstance();
}

id sub_2376D2794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;

  if (a3)
  {
    sub_2376BD590(0, &qword_256807D00);
    v16 = (void *)sub_2376D516C();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    if (a4)
    {
LABEL_3:
      sub_2376BD590(0, &qword_256807C28);
      v17 = (void *)sub_2376D516C();
      swift_bridgeObjectRelease();
      if (a5)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v17 = 0;
  if (a5)
  {
LABEL_4:
    sub_2376BD590(0, &qword_256807C28);
    v18 = (void *)sub_2376D516C();
    swift_bridgeObjectRelease();
    if (a6)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v18 = 0;
  if (a6)
  {
LABEL_5:
    sub_2376BD590(0, &qword_256807C28);
    v19 = (void *)sub_2376D516C();
    swift_bridgeObjectRelease();
    if (a7)
      goto LABEL_6;
LABEL_12:
    v20 = 0;
    v21 = a9;
    if (a8)
      goto LABEL_7;
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v19 = 0;
  if (!a7)
    goto LABEL_12;
LABEL_6:
  sub_2376BD590(0, &qword_256807C28);
  v20 = (void *)sub_2376D516C();
  swift_bridgeObjectRelease();
  v21 = a9;
  if (!a8)
    goto LABEL_13;
LABEL_7:
  sub_2376BD590(0, &qword_256807C28);
  v22 = (void *)sub_2376D516C();
  swift_bridgeObjectRelease();
LABEL_14:
  v23 = objc_msgSend(v25, sel_initRecurrenceWithFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, v16, v17, v18, v19, v20, v22, v21);

  return v23;
}

unint64_t sub_2376D29BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2376D54B4();
  sub_2376D54CC();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2376D5148();
    swift_bridgeObjectRelease();
  }
  v4 = sub_2376D54D8();
  return sub_2376D395C(a1, a2, v4);
}

unint64_t sub_2376D2A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_2376D54B4();
  sub_2376D5148();
  sub_2376D5148();
  v8 = sub_2376D54D8();
  return sub_2376D3A24(a1, a2, a3, a4, v8);
}

unint64_t sub_2376D2AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2376D54B4();
  sub_2376D5148();
  v4 = sub_2376D54D8();
  return sub_2376D3B20(a1, a2, v4);
}

unint64_t sub_2376D2B3C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2376D5244();
  return sub_2376D3C00(a1, v2);
}

uint64_t sub_2376D2B6C(uint64_t a1, char a2)
{
  return sub_2376D2B78(a1, a2, &qword_2542B7008);
}

uint64_t sub_2376D2B78(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  uint64_t v35;
  __int128 v36;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = sub_2376D53F4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_42;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v35 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v33 = v3;
  v34 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v18 >= v34)
      break;
    v19 = (_QWORD *)(v6 + 64);
    v20 = *(_QWORD *)(v35 + 8 * v18);
    ++v14;
    if (!v20)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v34)
        goto LABEL_35;
      v20 = *(_QWORD *)(v35 + 8 * v14);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v34)
        {
LABEL_35:
          swift_release();
          v4 = v33;
          if ((a2 & 1) == 0)
            goto LABEL_42;
          goto LABEL_38;
        }
        v20 = *(_QWORD *)(v35 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v14 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_44;
            if (v14 >= v34)
              goto LABEL_35;
            v20 = *(_QWORD *)(v35 + 8 * v14);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v14 = v21;
      }
    }
LABEL_21:
    v11 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    v22 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v17);
    v36 = *(_OWORD *)(*(_QWORD *)(v6 + 48) + 16 * v17);
    v23 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v17 + 8);
    if ((a2 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v24 = v22;
    }
    sub_2376D54B4();
    sub_2376D54CC();
    if (v23)
    {
      swift_bridgeObjectRetain();
      sub_2376D5148();
      swift_bridgeObjectRelease();
    }
    result = sub_2376D54D8();
    v25 = -1 << *(_BYTE *)(v8 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_43;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_OWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15) = v36;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v15) = v22;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v33;
  v19 = (_QWORD *)(v6 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_42;
LABEL_38:
  v32 = 1 << *(_BYTE *)(v6 + 32);
  if (v32 >= 64)
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v32;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_42:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_2376D2EA0(uint64_t a1, char a2)
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
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  char v42;
  uint64_t v43;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B7028);
  v42 = a2;
  v6 = sub_2376D53F4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v40 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v38 = v2;
  v39 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  for (i = v5; ; v5 = i)
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
    if (v21 >= v39)
      break;
    v22 = v40;
    v23 = v40[v21];
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_33;
      v23 = v40[v13];
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_33:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = v40[v24];
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v39)
              goto LABEL_33;
            v23 = v40[v13];
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
    v29 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v20);
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 48 * v20);
    v31 = *v30;
    v32 = v30[1];
    v33 = v30[3];
    v43 = v30[2];
    v34 = v30[4];
    v35 = v30[5];
    if ((v42 & 1) == 0)
    {
      v36 = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2376BCC44(v34, v35);
    }
    result = sub_2376D5244();
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
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v29;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 48 * v17);
    *v18 = v31;
    v18[1] = v32;
    v18[2] = v43;
    v18[3] = v33;
    v18[4] = v34;
    v18[5] = v35;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v38;
  v22 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v37 = 1 << *(_BYTE *)(v5 + 32);
  if (v37 >= 64)
    bzero(v22, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v37;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2376D31D0(uint64_t a1, char a2)
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
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t i;
  char v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FF8);
  v39 = a2;
  v6 = sub_2376D53F4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
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
        if (v21 >= v36)
          goto LABEL_33;
        v22 = v37[v21];
        ++v13;
        if (!v22)
        {
          v13 = v21 + 1;
          if (v21 + 1 >= v36)
            goto LABEL_33;
          v22 = v37[v13];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v39 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v5 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v13 >= v36)
                  goto LABEL_33;
                v22 = v37[v13];
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
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 32 * v20);
      v30 = *v28;
      v29 = v28[1];
      v32 = v28[2];
      v31 = v28[3];
      v33 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v34 = v33;
      }
      sub_2376D54B4();
      sub_2376D5148();
      sub_2376D5148();
      result = sub_2376D54D8();
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
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 32 * v17);
      *v18 = v30;
      v18[1] = v29;
      v18[2] = v32;
      v18[3] = v31;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v33;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_2376D34F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2376D29BC(a2, a3);
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
    sub_2376D3D24(&qword_2542B7010);
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_2376D2B78(v15, a4 & 1, &qword_2542B7010);
  v20 = sub_2376D29BC(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256807C00);
  sub_2376D5478();
  __break(1u);
}

_QWORD *sub_2376D3664(__int128 *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *result;
  unint64_t v17;
  char v18;
  _OWORD *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v4 = v3;
  v7 = *v3;
  v9 = sub_2376D2B3C((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2376D3EC8();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      return sub_2376D4BAC((uint64_t)a1, (_QWORD *)(v15[7] + 48 * v9));
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    *(_QWORD *)(v15[6] + 8 * v9) = a2;
    v19 = (_OWORD *)(v15[7] + 48 * v9);
    v20 = *a1;
    v21 = a1[2];
    v19[1] = a1[1];
    v19[2] = v21;
    *v19 = v20;
    v22 = v15[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v15[2] = v24;
      return a2;
    }
    goto LABEL_14;
  }
  sub_2376D2EA0(v12, a3 & 1);
  v17 = sub_2376D2B3C((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      return sub_2376D4BAC((uint64_t)a1, (_QWORD *)(v15[7] + 48 * v9));
    goto LABEL_11;
  }
LABEL_15:
  sub_2376BD590(0, &qword_2542B6F98);
  result = (_QWORD *)sub_2376D5478();
  __break(1u);
  return result;
}

void sub_2376D37D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v7 = v6;
  v14 = *v6;
  v16 = sub_2376D2A4C(a2, a3, a4, a5);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_2376D40BC();
LABEL_7:
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];

      *(_QWORD *)(v23 + 8 * v16) = a1;
      return;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v26 = (uint64_t *)(v22[6] + 32 * v16);
    *v26 = a2;
    v26[1] = a3;
    v26[2] = a4;
    v26[3] = a5;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v27 = v22[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v22[2] = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_2376D31D0(v19, a6 & 1);
  v24 = sub_2376D2A4C(a2, a3, a4, a5);
  if ((v20 & 1) == (v25 & 1))
  {
    v16 = v24;
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_2376D5478();
  __break(1u);
}

unint64_t sub_2376D395C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = ~v5;
    v10 = *(_QWORD *)(v3 + 48);
    do
    {
      v11 = (_QWORD *)(v10 + 16 * v6);
      v12 = v11[1];
      if (v12)
      {
        if (a2)
        {
          v13 = *v11 == a1 && v12 == a2;
          if (v13 || (sub_2376D5454() & 1) != 0)
            return v6;
        }
      }
      else if (!a2)
      {
        return v6;
      }
      v6 = (v6 + 1) & v9;
    }
    while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

unint64_t sub_2376D3A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;

  v6 = v5 + 64;
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = a5 & ~v7;
  if (((*(_QWORD *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v13 = ~v7;
    v14 = *(_QWORD *)(v5 + 48);
    do
    {
      v15 = (_QWORD *)(v14 + 32 * v8);
      v16 = v15[2];
      v17 = v15[3];
      v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_2376D5454() & 1) != 0)
      {
        v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_2376D5454() & 1) != 0)
          break;
      }
      v8 = (v8 + 1) & v13;
    }
    while (((*(_QWORD *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

unint64_t sub_2376D3B20(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2376D5454() & 1) == 0)
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
      while (!v14 && (sub_2376D5454() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2376D3C00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_2376BD590(0, &qword_2542B6F98);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_2376D5250();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_2376D5250();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

id sub_2376D3D18()
{
  return sub_2376D3D24(&qword_2542B7008);
}

id sub_2376D3D24(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_2376D53E8();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v13 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    v17 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v16);
    *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v16) = *(_OWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16) = v17;
    swift_bridgeObjectRetain();
    result = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2376D3EC8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  uint64_t v5;
  unint64_t v6;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  id v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t *v30;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B7028);
  v30 = v0;
  v1 = *v0;
  v2 = sub_2376D53E8();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v30 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = v1 + 64;
  v6 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
    result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  v8 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v9 = 1 << *(_BYTE *)(v1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v1 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    v27 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v12)
      goto LABEL_26;
    v28 = *(_QWORD *)(v5 + 8 * v27);
    ++v8;
    if (!v28)
    {
      v8 = v27 + 1;
      if (v27 + 1 >= v12)
        goto LABEL_26;
      v28 = *(_QWORD *)(v5 + 8 * v8);
      if (!v28)
        break;
    }
LABEL_25:
    v11 = (v28 - 1) & v28;
    v14 = __clz(__rbit64(v28)) + (v8 << 6);
LABEL_12:
    v15 = 8 * v14;
    v16 = *(void **)(*(_QWORD *)(v1 + 48) + 8 * v14);
    v17 = 48 * v14;
    v18 = (uint64_t *)(*(_QWORD *)(v1 + 56) + v17);
    v19 = *v18;
    v20 = v18[1];
    v21 = v18[2];
    v22 = v18[3];
    v23 = v18[4];
    v24 = v18[5];
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + v15) = v16;
    v25 = (_QWORD *)(*(_QWORD *)(v3 + 56) + v17);
    *v25 = v19;
    v25[1] = v20;
    v25[2] = v21;
    v25[3] = v22;
    v25[4] = v23;
    v25[5] = v24;
    v26 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)sub_2376BCC44(v23, v24);
  }
  v29 = v27 + 2;
  if (v29 >= v12)
    goto LABEL_26;
  v28 = *(_QWORD *)(v5 + 8 * v29);
  if (v28)
  {
    v8 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v8 >= v12)
      goto LABEL_26;
    v28 = *(_QWORD *)(v5 + 8 * v8);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2376D40BC()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542B6FF8);
  v2 = *v0;
  v3 = sub_2376D53E8();
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
    v16 = 32 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 32 * v15);
    v18 = v17[1];
    v19 = v17[2];
    v20 = v17[3];
    v21 = 8 * v15;
    v22 = *(void **)(*(_QWORD *)(v2 + 56) + v21);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = *v17;
    v23[1] = v18;
    v23[2] = v19;
    v23[3] = v20;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = v22;
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

uint64_t sub_2376D4284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  __int128 v9;
  __int128 v10;
  _OWORD v12[5];
  uint64_t v13;
  uint64_t v14[5];

  v14[3] = a3;
  v14[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_QWORD *)(a2 + 64) = sub_2376B99AC(MEMORY[0x24BEE4AF8]);
  sub_2376B7794((uint64_t)v14, a2 + 16);
  *(_QWORD *)(a2 + 56) = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(a4 + 16))(v12, a3, a4);
  v9 = v12[3];
  *(_OWORD *)(a2 + 104) = v12[2];
  *(_OWORD *)(a2 + 120) = v9;
  *(_OWORD *)(a2 + 136) = v12[4];
  *(_QWORD *)(a2 + 152) = v13;
  v10 = v12[1];
  *(_OWORD *)(a2 + 72) = v12[0];
  *(_OWORD *)(a2 + 88) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return a2;
}

uint64_t sub_2376D4364(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_2376D51C0();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2376BC048(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_2376D43F8(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F20);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_2376D4F50();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F48);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  type metadata accessor for IntegrationRecurrence.RecurrenceEnd(0);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  MEMORY[0x24BDAC7A8](v2);
  __asm { BR              X9 }
}

id sub_2376D4538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;

  v11 = 1;
  *(_QWORD *)(v10 - 104) = v2;
  *(_QWORD *)(v10 - 96) = v1;
  *(_QWORD *)(v10 - 152) = v0;
  v12 = (int *)type metadata accessor for IntegrationRecurrence(0);
  v13 = *(_QWORD *)(v3 + v12[8]);
  if (v13)
  {
    *(_QWORD *)(v10 - 112) = v7;
    v14 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v10 - 88) = MEMORY[0x24BEE4AF8];
    v15 = *(_QWORD *)(v13 + 16);
    if (v15)
    {
      *(_QWORD *)(v10 - 168) = v6;
      *(_QWORD *)(v10 - 160) = v4;
      *(_QWORD *)(v10 - 144) = v9;
      *(_QWORD *)(v10 - 136) = v8;
      *(_QWORD *)(v10 - 128) = 1;
      *(_QWORD *)(v10 - 120) = v5;
      swift_bridgeObjectRetain();
      v16 = (_QWORD *)(v13 + 40);
      do
      {
        v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7510]), sel_initWithDayOfTheWeek_weekNumber_, *((unsigned __int8 *)v16 - 8) + 1, *v16);
        MEMORY[0x23B8195E4]();
        if (*(_QWORD *)((*(_QWORD *)(v10 - 88) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v10 - 88) & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
          sub_2376D519C();
        v16 += 2;
        sub_2376D51A8();
        sub_2376D5190();

        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      v14 = *(_QWORD *)(v10 - 88);
      v11 = *(_QWORD *)(v10 - 128);
      v5 = *(_QWORD *)(v10 - 120);
      v9 = *(_QWORD *)(v10 - 144);
      v8 = *(_QWORD *)(v10 - 136);
      v6 = *(_QWORD *)(v10 - 168);
      v4 = *(_QWORD **)(v10 - 160);
    }
    v7 = *(_QWORD *)(v10 - 112);
  }
  else
  {
    v14 = 0;
  }
  v18 = *(_QWORD *)(v10 - 96);
  *(_QWORD *)(v10 - 96) = v14;
  v19 = *(_QWORD *)(v3 + v12[9]);
  if (v19)
    *(_QWORD *)(v10 - 112) = sub_2376D05C0(v19);
  else
    *(_QWORD *)(v10 - 112) = 0;
  v20 = *(_QWORD *)(v3 + v12[12]);
  if (v20)
    *(_QWORD *)(v10 - 120) = sub_2376D05C0(v20);
  else
    *(_QWORD *)(v10 - 120) = 0;
  v21 = *(_QWORD *)(v3 + v12[11]);
  if (v21)
    *(_QWORD *)(v10 - 128) = sub_2376D05C0(v21);
  else
    *(_QWORD *)(v10 - 128) = 0;
  v22 = *(_QWORD *)(v3 + v12[10]);
  if (v22)
    *(_QWORD *)(v10 - 136) = sub_2376D05C0(v22);
  else
    *(_QWORD *)(v10 - 136) = 0;
  v23 = *(_QWORD *)(v3 + v12[13]);
  if (v23)
    *(_QWORD *)(v10 - 144) = sub_2376D05C0(v23);
  else
    *(_QWORD *)(v10 - 144) = 0;
  sub_2376CA904(v3 + v12[6], v6, &qword_2542B6F48);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 104) + 48))(v6, 1, v18) == 1)
  {
    sub_2376C589C(v6, &qword_2542B6F48);
    v24 = 0;
  }
  else
  {
    v25 = *(_QWORD *)(v10 - 152);
    sub_2376CA98C(v6, v25, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    sub_2376D4BE8(v25, (uint64_t)v4, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7518]), sel_initWithOccurrenceCount_, *v4);
      v26 = v25;
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD *, uint64_t))(v8 + 32))(v9, v4, v5);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v9, v5);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v5);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v5) == 1)
      {
        v27 = 0;
      }
      else
      {
        v27 = (void *)sub_2376D4F2C();
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v5);
      }
      v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7518]), sel_initWithEndDate_, v27);

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v5);
      v26 = *(_QWORD *)(v10 - 152);
    }
    sub_2376CA9D0(v26, type metadata accessor for IntegrationRecurrence.RecurrenceEnd);
  }
  v28 = *(_QWORD *)(v3 + 8);
  v29 = objc_allocWithZone(MEMORY[0x24BDC7528]);
  return sub_2376D2794(v11, v28, *(_QWORD *)(v10 - 96), *(_QWORD *)(v10 - 112), *(_QWORD *)(v10 - 120), *(_QWORD *)(v10 - 128), *(_QWORD *)(v10 - 136), *(_QWORD *)(v10 - 144), v24);
}

uint64_t sub_2376D48C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B6F68);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for IntegrationRecurrence(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376CA904(a1, (uint64_t)v4, &qword_2542B6F68);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_2376C589C((uint64_t)v4, &qword_2542B6F68);
    return 0;
  }
  else
  {
    sub_2376CA98C((uint64_t)v4, (uint64_t)v8, type metadata accessor for IntegrationRecurrence);
    sub_2376D43F8((uint64_t)v8);
    v9 = v10;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542B7058);
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_2376D7960;
      *(_QWORD *)(v11 + 32) = v9;
      v14 = v11;
      sub_2376D5190();
      v9 = v14;
    }
    sub_2376CA9D0((uint64_t)v8, type metadata accessor for IntegrationRecurrence);
  }
  return v9;
}

uint64_t sub_2376D4A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IntegrationCollectionSync();
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_2376D4284((uint64_t)v9, v10, a3, a4);
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.eventStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.collection.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.allCalendars.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.calendar(forPersona:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of IntegrationCollectionSyncDataProvider.refreshEventKit()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t type metadata accessor for IntegrationCollectionSync()
{
  return objc_opt_self();
}

uint64_t method lookup function for IntegrationCollectionSync()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IntegrationCollectionSync.__allocating_init(syncDataProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of IntegrationCollectionSync.sync()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

unint64_t sub_2376D4B68()
{
  unint64_t result;

  result = qword_256807CF0;
  if (!qword_256807CF0)
  {
    result = MEMORY[0x23B819D64](&unk_2376D7914, &type metadata for IntegrationCollectionSync.SyncError);
    atomic_store(result, (unint64_t *)&qword_256807CF0);
  }
  return result;
}

_QWORD *sub_2376D4BAC(uint64_t a1, _QWORD *a2)
{
  assignWithTake for IntegrationColor(a2, a1);
  return a2;
}

uint64_t sub_2376D4BE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t getEnumTagSinglePayload for IntegrationCollectionSync.SyncError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IntegrationCollectionSync.SyncError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376D4D44 + 4 * byte_2376D781A[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2376D4D78 + 4 * byte_2376D7815[v4]))();
}

uint64_t sub_2376D4D78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376D4D80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376D4D88);
  return result;
}

uint64_t sub_2376D4D94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376D4D9CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2376D4DA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376D4DA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntegrationCollectionSync.SyncError()
{
  return &type metadata for IntegrationCollectionSync.SyncError;
}

unint64_t sub_2376D4DC8()
{
  unint64_t result;

  result = qword_256807D08;
  if (!qword_256807D08)
  {
    result = MEMORY[0x23B819D64](&unk_2376D78EC, &type metadata for IntegrationCollectionSync.SyncError);
    atomic_store(result, (unint64_t *)&qword_256807D08);
  }
  return result;
}

uint64_t sub_2376D4E0C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2376D4E18()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2376D4E24()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2376D4E30()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_2376D4E3C()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_2376D4E48()
{
  return MEMORY[0x24BDCBDD0]();
}

uint64_t sub_2376D4E54()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2376D4E60()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_2376D4E6C()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_2376D4E78()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_2376D4E84()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_2376D4E90()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_2376D4E9C()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2376D4EA8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2376D4EB4()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2376D4EC0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2376D4ECC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2376D4ED8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2376D4EE4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2376D4EF0()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_2376D4EFC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2376D4F08()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_2376D4F14()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_2376D4F20()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2376D4F2C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2376D4F38()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_2376D4F44()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2376D4F50()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2376D4F5C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2376D4F68()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2376D4F74()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2376D4F80()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2376D4F8C()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2376D4F98()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_2376D4FA4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2376D4FB0()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_2376D4FBC()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2376D4FC8()
{
  return MEMORY[0x24BE7E680]();
}

uint64_t sub_2376D4FD4()
{
  return MEMORY[0x24BE7DFE8]();
}

uint64_t sub_2376D4FE0()
{
  return MEMORY[0x24BE7E020]();
}

uint64_t sub_2376D4FEC()
{
  return MEMORY[0x24BE7E028]();
}

uint64_t sub_2376D4FF8()
{
  return MEMORY[0x24BE7E030]();
}

uint64_t sub_2376D5004()
{
  return MEMORY[0x24BE7E038]();
}

uint64_t sub_2376D5010()
{
  return MEMORY[0x24BE7E040]();
}

uint64_t sub_2376D501C()
{
  return MEMORY[0x24BE7E048]();
}

uint64_t sub_2376D5028()
{
  return MEMORY[0x24BE7E050]();
}

uint64_t sub_2376D5034()
{
  return MEMORY[0x24BE7E058]();
}

uint64_t sub_2376D5040()
{
  return MEMORY[0x24BE7E070]();
}

uint64_t sub_2376D504C()
{
  return MEMORY[0x24BE7E078]();
}

uint64_t sub_2376D5058()
{
  return MEMORY[0x24BE7E080]();
}

uint64_t sub_2376D5064()
{
  return MEMORY[0x24BE7E088]();
}

uint64_t sub_2376D5070()
{
  return MEMORY[0x24BE7E090]();
}

uint64_t sub_2376D507C()
{
  return MEMORY[0x24BE7E240]();
}

uint64_t sub_2376D5088()
{
  return MEMORY[0x24BE7E250]();
}

uint64_t sub_2376D5094()
{
  return MEMORY[0x24BE7E258]();
}

uint64_t sub_2376D50A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2376D50AC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2376D50B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2376D50C4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2376D50D0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2376D50DC()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_2376D50E8()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_2376D50F4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2376D5100()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2376D510C()
{
  return MEMORY[0x24BEE0350]();
}

uint64_t sub_2376D5118()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2376D5124()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2376D5130()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2376D513C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2376D5148()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2376D5154()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2376D5160()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2376D516C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2376D5178()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_2376D5184()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2376D5190()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2376D519C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2376D51A8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2376D51B4()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2376D51C0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2376D51CC()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2376D51D8()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2376D51E4()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_2376D51F0()
{
  return MEMORY[0x24BDC73D8]();
}

uint64_t sub_2376D51FC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2376D5208()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2376D5214()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2376D5220()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2376D522C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2376D5238()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2376D5244()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2376D5250()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2376D525C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2376D5268()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2376D5274()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2376D5280()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2376D528C()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_2376D5298()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2376D52A4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2376D52B0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2376D52BC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2376D52C8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2376D52D4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2376D52E0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2376D52EC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2376D52F8()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2376D5304()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2376D5310()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2376D531C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2376D5328()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2376D5334()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2376D5340()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2376D534C()
{
  return MEMORY[0x24BEE2EA0]();
}

uint64_t sub_2376D5358()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_2376D5364()
{
  return MEMORY[0x24BEE2EB8]();
}

uint64_t sub_2376D5370()
{
  return MEMORY[0x24BEE2EC0]();
}

uint64_t sub_2376D537C()
{
  return MEMORY[0x24BEE2ED0]();
}

uint64_t sub_2376D5388()
{
  return MEMORY[0x24BEE2ED8]();
}

uint64_t sub_2376D5394()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_2376D53A0()
{
  return MEMORY[0x24BEE2EE8]();
}

uint64_t sub_2376D53AC()
{
  return MEMORY[0x24BEE2F00]();
}

uint64_t sub_2376D53B8()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_2376D53C4()
{
  return MEMORY[0x24BEE2F38]();
}

uint64_t sub_2376D53D0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2376D53DC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2376D53E8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2376D53F4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2376D5400()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2376D540C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2376D5418()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2376D5424()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_2376D5430()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2376D543C()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_2376D5448()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2376D5454()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2376D5460()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_2376D546C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2376D5478()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2376D5484()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2376D5490()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2376D549C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2376D54A8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2376D54B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2376D54C0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2376D54CC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2376D54D8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2376D54E4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2376D54F0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2376D54FC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2376D5508()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t REMReminderDefaultPriorityForPriorityLevel()
{
  return MEMORY[0x24BE7D318]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

