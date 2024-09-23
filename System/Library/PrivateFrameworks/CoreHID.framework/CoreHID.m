BOOL static HIDElementCollection.CollectionType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HIDElementCollection.CollectionType.hash(into:)()
{
  return sub_23922CE44();
}

uint64_t HIDElementCollection.CollectionType.hashValue.getter()
{
  sub_23922CE38();
  sub_23922CE44();
  return sub_23922CE74();
}

BOOL sub_2391EAE50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s7CoreHID13HIDReportTypeO9hashValueSivg_0()
{
  sub_23922CE38();
  sub_23922CE44();
  return sub_23922CE74();
}

uint64_t sub_2391EAEA8()
{
  return sub_23922CE44();
}

uint64_t sub_2391EAED0()
{
  sub_23922CE38();
  sub_23922CE44();
  return sub_23922CE74();
}

uint64_t sub_2391EAF10@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  if (result >= 7)
    v2 = 1;
  else
    v2 = result;
  *a2 = v2;
  return result;
}

uint64_t sub_2391EAF20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = swift_unownedRetainStrong();
  *a1 = result;
  return result;
}

uint64_t sub_2391EAF48(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_unownedRetain();
  result = swift_unownedRelease();
  *a2 = v3;
  return result;
}

uint64_t HIDElementCollection.client.getter()
{
  return swift_unownedRetainStrong();
}

uint64_t HIDElementCollection.client.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  swift_unownedRetain();
  swift_unownedRelease();
  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t (*HIDElementCollection.client.modify(uint64_t *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = swift_unownedRetainStrong();
  return sub_2391EB008;
}

void HIDElementCollection.parentCollection.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __IOHIDElement *v4;
  __IOHIDElement *v5;

  v3 = *(_QWORD *)v1;
  v4 = IOHIDElementGetParent(*(IOHIDElementRef *)(v1 + 16));
  if (v4)
  {
    v5 = v4;
    swift_unownedRetainStrong();
    sub_2391EB078(v5, v3, a1);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_2391EB078(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  __IOHIDElement *v9;
  IOHIDElementCollectionType CollectionType;
  uint64_t v11;
  uint64_t UsagePage;
  uint64_t v13;
  uint32_t Usage;
  unint64_t v15;
  void *v16;
  id v17;

  if (IOHIDElementGetType((IOHIDElementRef)a1) == kIOHIDElementTypeCollection)
  {
    v16 = a1;
    type metadata accessor for IOHIDElement();
    v7 = v6;
    v8 = a1;
    sub_239217FFC((uint64_t)&v16, v7, (uint64_t)&v17);
    v9 = (__IOHIDElement *)v17;
    swift_unownedRetain();
    CollectionType = IOHIDElementGetCollectionType(v9);
    if (CollectionType >= (kIOHIDElementCollectionTypeUsageModifier|kIOHIDElementCollectionTypeApplication))
      v11 = 1;
    else
      v11 = CollectionType;
    UsagePage = IOHIDElementGetUsagePage(v9);
    if (WORD1(UsagePage))
    {
      __break(1u);
    }
    else
    {
      v13 = UsagePage;
      Usage = IOHIDElementGetUsage(v9);

      if (!HIWORD(Usage))
      {
        HIDUsage.init(page:usage:)(Usage, v13, (uint64_t)&v17);
        swift_release();

        v15 = ((unint64_t)v17 << 16) | ((unint64_t)BYTE4(v17) << 48) | v11;
        *a3 = a2;
        a3[1] = v15;
        a3[2] = v9;
        return;
      }
    }
    __break(1u);
  }
  else
  {
    swift_release();

    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
}

void HIDElementCollection.childCollections.getter()
{
  uint64_t *v0;
  uint64_t v1;
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  char *v7;
  void *ValueAtIndex;
  id v9;
  __IOHIDElement *v10;
  uint64_t v11;
  uint64_t v12;
  __IOHIDElement *v13;
  __IOHIDElement *v14;
  IOHIDElementCollectionType CollectionType;
  char v16;
  uint64_t UsagePage;
  uint64_t v18;
  uint32_t Usage;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  CFIndex v25;
  const __CFArray *v26;
  __IOHIDElement *v27;
  id v28;

  v1 = *v0;
  v2 = IOHIDElementGetChildren((IOHIDElementRef)v0[2]);
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    if ((Count & 0x8000000000000000) == 0)
    {
      v5 = Count;
      if (!Count)
      {

        return;
      }
      v6 = 0;
      v7 = (char *)MEMORY[0x24BEE4AF8];
      v25 = Count;
      v26 = v3;
      while (v5 != v6)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v3, v6);
        if (!ValueAtIndex)
          goto LABEL_27;
        v9 = ValueAtIndex;
        swift_unownedRetainStrong();
        v10 = (__IOHIDElement *)v9;
        if (IOHIDElementGetType(v10) == kIOHIDElementTypeCollection)
        {
          v27 = v10;
          type metadata accessor for IOHIDElement();
          v12 = v11;
          v13 = v10;
          sub_239217FFC((uint64_t)&v27, v12, (uint64_t)&v28);
          v14 = (__IOHIDElement *)v28;
          swift_unownedRetain();
          CollectionType = IOHIDElementGetCollectionType(v14);
          if (CollectionType >= (kIOHIDElementCollectionTypeUsageModifier|kIOHIDElementCollectionTypeApplication))
            v16 = 1;
          else
            v16 = CollectionType;
          UsagePage = IOHIDElementGetUsagePage(v14);
          if (WORD1(UsagePage))
            goto LABEL_24;
          v18 = UsagePage;
          Usage = IOHIDElementGetUsage(v14);

          if (HIWORD(Usage))
            goto LABEL_25;
          HIDUsage.init(page:usage:)(Usage, v18, (uint64_t)&v28);
          swift_release();

          v20 = BYTE4(v28);
          v21 = v28;
          swift_unownedRetain();
          v10 = v14;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v7 = sub_2391EFF40(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
          v23 = *((_QWORD *)v7 + 2);
          v22 = *((_QWORD *)v7 + 3);
          if (v23 >= v22 >> 1)
            v7 = sub_2391EFF40((char *)(v22 > 1), v23 + 1, 1, v7);
          *((_QWORD *)v7 + 2) = v23 + 1;
          v24 = &v7[24 * v23];
          *((_QWORD *)v24 + 4) = v1;
          v24[40] = v16;
          v24[46] = (v21 | (unint64_t)(v20 << 32)) >> 32;
          *(_DWORD *)(v24 + 42) = v21;
          *((_QWORD *)v24 + 6) = v10;

          swift_unownedRelease();
          v5 = v25;
          v3 = v26;
        }
        else
        {
          swift_release();

        }
        ++v6;

        if (v5 == v6)
        {

          return;
        }
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    __break(1u);
LABEL_27:
    __break(1u);
  }
}

CFIndex HIDElementCollection.childElements.getter()
{
  uint64_t v0;
  uint64_t v1;
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex result;
  CFIndex v5;
  char *v6;
  CFIndex v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[128];
  _OWORD v21[6];
  _BYTE v22[25];

  v1 = *(_QWORD *)v0;
  v2 = IOHIDElementGetChildren(*(IOHIDElementRef *)(v0 + 16));
  if (v2)
  {
    v3 = v2;
    result = CFArrayGetCount(v2);
    if (result < 0)
    {
      __break(1u);
LABEL_23:
      __break(1u);
      return result;
    }
    v5 = result;
    if (result)
    {
      result = (CFIndex)CFArrayGetValueAtIndex(v3, 0);
      if (result)
      {
        v6 = (char *)MEMORY[0x24BEE4AF8];
        v7 = 1;
        while (1)
        {
          v8 = (id)result;
          swift_unownedRetainStrong();
          v9 = v8;
          sub_2391EB5D0(v9, v1, (uint64_t)v19);
          sub_2391F260C((uint64_t)v19, (uint64_t)v20, &qword_25691F5C0);
          sub_2391F260C((uint64_t)v20, (uint64_t)v21, &qword_25691F5C0);
          if (sub_2391F0098((uint64_t)v21) == 1)
          {

            if (v5 == v7)
              goto LABEL_18;
          }
          else
          {
            if ((v22[8] & 1) == 0)
            {
              sub_2391F260C((uint64_t)v20, (uint64_t)v19, &qword_25691F5C0);
              sub_2391F00B0((uint64_t)v19);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v6 = sub_2391F00E0(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
              v11 = *((_QWORD *)v6 + 2);
              v10 = *((_QWORD *)v6 + 3);
              if (v11 >= v10 >> 1)
                v6 = sub_2391F00E0((char *)(v10 > 1), v11 + 1, 1, v6);
              *((_QWORD *)v6 + 2) = v11 + 1;
              v12 = &v6[128 * v11];
              v13 = v21[0];
              v14 = v21[1];
              v15 = v21[3];
              *((_OWORD *)v12 + 4) = v21[2];
              *((_OWORD *)v12 + 5) = v15;
              *((_OWORD *)v12 + 2) = v13;
              *((_OWORD *)v12 + 3) = v14;
              v16 = v21[4];
              v17 = v21[5];
              v18 = *(_OWORD *)v22;
              *(_OWORD *)(v12 + 137) = *(_OWORD *)&v22[9];
              *((_OWORD *)v12 + 7) = v17;
              *((_OWORD *)v12 + 8) = v18;
              *((_OWORD *)v12 + 6) = v16;
            }

            sub_2391F01E0((uint64_t)v20);
            if (v5 == v7)
            {
LABEL_18:

              return (CFIndex)v6;
            }
          }
          result = (CFIndex)CFArrayGetValueAtIndex(v3, v7++);
          if (!result)
            goto LABEL_23;
        }
      }
      goto LABEL_23;
    }

  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2391EB5D0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  __IOHIDElement *v9;
  uint64_t result;
  char v11;
  char v12;
  IOHIDElementType Type;
  uint64_t v14;
  IOHIDElementType v15;
  char v16;
  char v17;
  uint64_t UsagePage;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFIndex LogicalMin;
  CFIndex LogicalMax;
  CFIndex PhysicalMin;
  CFIndex PhysicalMax;
  CFIndex v28;
  CFIndex v29;
  CFIndex v30;
  char v31;
  BOOL v32;
  BOOL v33;
  char v34;
  char v35;
  __int128 v36;
  char v37;
  int v38;
  int v39;
  char v40;
  char v41;
  char v42;
  CFIndex v43;
  BOOL v44;
  CFIndex v45;
  BOOL v46;
  CFIndex v47;
  BOOL v48;
  CFIndex v49;
  BOOL v50;
  __IOHIDElement *v51;
  BOOL v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  void *v56;

  v56 = a1;
  type metadata accessor for IOHIDElement();
  v7 = v6;
  v8 = a1;
  sub_239217FFC((uint64_t)&v56, v7, (uint64_t)&v36);
  v9 = (__IOHIDElement *)v36;
  swift_unownedRetain();
  result = IOHIDElementGetReportID(v9);
  if (result > 0xFF)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  HIDReportID.init(rawValue:)(result, &v36);
  v11 = v36;
  v12 = BYTE1(v36);
  Type = IOHIDElementGetType(v9);
  if (Type == kIOHIDElementTypeCollection)
  {
    swift_release();

    swift_unownedRelease();
    sub_2391F0278(&v36);
    v14 = a3;
    return sub_2391F260C((uint64_t)&v36, v14, &qword_25691F5C0);
  }
  v15 = Type;
  v16 = 2 * (Type == kIOHIDElementTypeFeature);
  if (Type == kIOHIDElementTypeOutput)
    v16 = 1;
  if (Type - 1 >= 5)
    v17 = v16;
  else
    v17 = 0;
  UsagePage = IOHIDElementGetUsagePage(v9);
  result = IOHIDElementGetUsage(v9);
  if (WORD1(UsagePage))
    goto LABEL_27;
  v19 = result;
  v34 = v17;
  v35 = v12;
  if (WORD1(result))
    v20 = 0;
  else
    v20 = (unsigned __int16)result;
  HIDUsage.init(page:usage:)(v20, UsagePage, (uint64_t)&v36);
  v21 = BYTE4(v36);
  v22 = v36;
  LODWORD(UsagePage) = IOHIDElementGetReportSize(v9);
  if (IOHIDElementIsArray(v9))
  {
    result = IOHIDElementGetReportCount(v9);
    UsagePage = UsagePage * (unint64_t)result;
    if ((UsagePage & 0xFFFFFFFF00000000) != 0)
      goto LABEL_29;
  }
  IOHIDElementGetUnit(v9);
  result = IOHIDElementGetUnitExponent(v9);
  if (result <= 0x7F)
  {
    v31 = v11;
    v23 = v22 | (v21 << 32);
    v33 = (v19 & 0xFFFF0000) != 0;
    v32 = v15 == kIOHIDElementTypeInput_NULL;
    LogicalMin = IOHIDElementGetLogicalMin(v9);
    LogicalMax = IOHIDElementGetLogicalMax(v9);
    PhysicalMin = IOHIDElementGetPhysicalMin(v9);
    PhysicalMax = IOHIDElementGetPhysicalMax(v9);
    swift_release();

    v28 = PhysicalMin | PhysicalMax;
    LOBYTE(v56) = v35;
    if (PhysicalMax)
      v29 = 0;
    else
      v29 = LogicalMin;
    if (v28)
      v30 = PhysicalMax;
    else
      v30 = LogicalMax;
    if (PhysicalMin)
      v29 = PhysicalMin;
    *(_QWORD *)&v36 = a2;
    BYTE8(v36) = v34;
    BYTE14(v36) = BYTE4(v23);
    *(_DWORD *)((char *)&v36 + 10) = v23;
    HIBYTE(v36) = v31;
    v37 = v35;
    v38 = UsagePage;
    v39 = 0;
    v40 = 1;
    v41 = 0;
    v42 = 1;
    v43 = LogicalMin;
    v44 = (LogicalMin | LogicalMax) == 0;
    v45 = LogicalMax;
    v46 = v44;
    v47 = v29;
    v48 = (v28 | LogicalMin | LogicalMax) == 0;
    v49 = v30;
    v50 = v48;
    v51 = v9;
    v52 = v32;
    v53 = v33;
    v54 = 0;
    v55 = 1;
    nullsub_1(&v36);
    v14 = a3;
    return sub_2391F260C((uint64_t)&v36, v14, &qword_25691F5C0);
  }
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void HIDElementCollection.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *HIDElementCollection.type.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*HIDElementCollection.type.modify())()
{
  return nullsub_1;
}

void HIDElementCollection.usage.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(v1 + 10);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 14);
  *(_DWORD *)a1 = v2;
}

int *HIDElementCollection.usage.setter(int *result)
{
  uint64_t v1;
  int v2;

  v2 = *result;
  *(_BYTE *)(v1 + 14) = *((_BYTE *)result + 4);
  *(_DWORD *)(v1 + 10) = v2;
  return result;
}

uint64_t (*HIDElementCollection.usage.modify())()
{
  return nullsub_1;
}

id sub_2391EB948()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void HIDElementCollection.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t HIDElementCollection.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_23922CE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t sub_2391EBB10()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_23922CE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

void sub_2391EBBF0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t sub_2391EBCC8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  sub_23922CE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t HIDElementCollection.description.getter()
{
  sub_23922CC4C();
  sub_23922CA9C();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5D8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CDB4();
  sub_23922CA9C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  sub_23922CA84();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  sub_2391F0B84();
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  return 0;
}

uint64_t HIDElement.Value.element.getter@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];

  v3 = v1[5];
  v13 = v1[4];
  v2 = v13;
  v14 = v3;
  v15[0] = v1[6];
  v4 = v15[0];
  *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v1 + 105);
  v5 = *(_OWORD *)((char *)v15 + 9);
  v6 = v1[1];
  v10[0] = *v1;
  v10[1] = v6;
  v8 = v1[3];
  v11 = v1[2];
  v7 = v11;
  v12 = v8;
  *a1 = v10[0];
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  *(_OWORD *)((char *)a1 + 105) = v5;
  return sub_2391F00B0((uint64_t)v10);
}

__n128 HIDElement.Value.element.setter(uint64_t a1)
{
  _OWORD *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  _OWORD v10[6];
  _OWORD v11[2];

  v3 = v1[5];
  v10[4] = v1[4];
  v10[5] = v3;
  v11[0] = v1[6];
  *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)v1 + 105);
  v4 = v1[1];
  v10[0] = *v1;
  v10[1] = v4;
  v5 = v1[3];
  v10[2] = v1[2];
  v10[3] = v5;
  sub_2391F0BC8((uint64_t)v10);
  v6 = *(_OWORD *)(a1 + 80);
  v1[4] = *(_OWORD *)(a1 + 64);
  v1[5] = v6;
  v1[6] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)v1 + 105) = *(_OWORD *)(a1 + 105);
  v7 = *(_OWORD *)(a1 + 16);
  *v1 = *(_OWORD *)a1;
  v1[1] = v7;
  result = *(__n128 *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 48);
  v1[2] = result;
  v1[3] = v9;
  return result;
}

uint64_t (*HIDElement.Value.element.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.Value.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for HIDElement.Value() + 20);
  v4 = sub_23922CCC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t HIDElement.Value.timestamp.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for HIDElement.Value() + 20);
  v4 = sub_23922CCC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*HIDElement.Value.timestamp.modify())(_QWORD)
{
  type metadata accessor for HIDElement.Value();
  return nullsub_1;
}

uint64_t HIDElement.Value.bytes.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for HIDElement.Value() + 24);
  v2 = *(_QWORD *)v1;
  sub_2391F0C34(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t HIDElement.Value.bytes.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + *(int *)(type metadata accessor for HIDElement.Value() + 24);
  result = sub_2391F0C78(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  return result;
}

uint64_t (*HIDElement.Value.bytes.modify())(_QWORD)
{
  type metadata accessor for HIDElement.Value();
  return nullsub_1;
}

uint64_t HIDElement.Value.init(element:fromBytes:timestamp:)@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;

  v9 = a1[5];
  a5[4] = a1[4];
  a5[5] = v9;
  a5[6] = a1[6];
  *(_OWORD *)((char *)a5 + 105) = *(_OWORD *)((char *)a1 + 105);
  v10 = a1[1];
  *a5 = *a1;
  a5[1] = v10;
  v11 = a1[3];
  a5[2] = a1[2];
  a5[3] = v11;
  v12 = type metadata accessor for HIDElement.Value();
  v13 = (_QWORD *)((char *)a5 + *(int *)(v12 + 24));
  *v13 = a2;
  v13[1] = a3;
  v14 = (char *)a5 + *(int *)(v12 + 20);
  v15 = sub_23922CCC4();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a4, v15);
}

uint64_t HIDElement.client.getter()
{
  return swift_unownedRetainStrong();
}

uint64_t HIDElement.client.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  swift_unownedRetain();
  swift_unownedRelease();
  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t (*HIDElement.client.modify(uint64_t *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = swift_unownedRetainStrong();
  return sub_2391EB008;
}

uint64_t sub_2391EC28C(uint64_t *a1, char a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v3 = *a1;
  v4 = (_QWORD *)a1[1];
  swift_unownedRetain();
  swift_unownedRelease();
  if ((a2 & 1) != 0)
  {
    *v4 = v3;
    return swift_release();
  }
  else
  {
    result = swift_release();
    *v4 = v3;
  }
  return result;
}

void HIDElement.parentCollection.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __IOHIDElement *v4;
  __IOHIDElement *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)v1;
  v4 = IOHIDElementGetParent(*(IOHIDElementRef *)(v1 + 96));
  if (v4)
  {
    v5 = v4;
    swift_unownedRetainStrong();
    sub_2391EB078(v5, v3, &v9);
    v6 = v11;
    if (v11)
    {
      v7 = v10;
      v8 = v10 >> 16;
      *(_QWORD *)a1 = v9;
      *(_BYTE *)(a1 + 8) = v7;
      *(_BYTE *)(a1 + 14) = BYTE6(v7);
      *(_DWORD *)(a1 + 10) = v8;
      *(_QWORD *)(a1 + 16) = v6;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void HIDElement.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *HIDElement.type.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*HIDElement.type.modify())()
{
  return nullsub_1;
}

uint64_t sub_2391EC3A8@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = (_DWORD)result == 129;
  if ((_DWORD)result == 257)
    v2 = 2;
  *a2 = v2;
  return result;
}

void HIDElement.usage.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(v1 + 10);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 14);
  *(_DWORD *)a1 = v2;
}

int *HIDElement.usage.setter(int *result)
{
  uint64_t v1;
  int v2;

  v2 = *result;
  *(_BYTE *)(v1 + 14) = *((_BYTE *)result + 4);
  *(_DWORD *)(v1 + 10) = v2;
  return result;
}

uint64_t (*HIDElement.usage.modify())()
{
  return nullsub_1;
}

void sub_2391EC3FC(_WORD *a1@<X8>)
{
  *a1 = 256;
}

void HIDElement.reportID.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 16);
  *a1 = *(_BYTE *)(v1 + 15);
  a1[1] = v2;
}

_BYTE *HIDElement.reportID.setter(_BYTE *result)
{
  uint64_t v1;
  char v2;

  v2 = result[1];
  *(_BYTE *)(v1 + 15) = *result;
  *(_BYTE *)(v1 + 16) = v2;
  return result;
}

uint64_t (*HIDElement.reportID.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.reportSize.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 20);
}

uint64_t HIDElement.reportSize.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 20) = result;
  return result;
}

uint64_t (*HIDElement.reportSize.modify())()
{
  return nullsub_1;
}

uint64_t sub_2391EC460()
{
  return 0x100000000;
}

unint64_t HIDElement.unit.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

uint64_t HIDElement.unit.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 24) = result;
  *(_BYTE *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*HIDElement.unit.modify())()
{
  return nullsub_1;
}

uint64_t sub_2391EC4BC()
{
  return 256;
}

uint64_t HIDElement.unitExponent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 29) | (*(unsigned __int8 *)(v0 + 30) << 8);
}

uint64_t HIDElement.unitExponent.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 29) = result;
  *(_BYTE *)(v1 + 30) = BYTE1(result) & 1;
  return result;
}

uint64_t (*HIDElement.unitExponent.modify())()
{
  return nullsub_1;
}

uint64_t sub_2391EC504()
{
  return 0;
}

uint64_t HIDElement.logicalMinimum.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t HIDElement.logicalMinimum.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.logicalMinimum.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.logicalMaximum.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t HIDElement.logicalMaximum.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = result;
  *(_BYTE *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.logicalMaximum.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.physicalMinimum.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t HIDElement.physicalMinimum.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = result;
  *(_BYTE *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.physicalMinimum.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.physicalMaximum.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t HIDElement.physicalMaximum.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = result;
  *(_BYTE *)(v2 + 88) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.physicalMaximum.modify())()
{
  return nullsub_1;
}

id sub_2391EC5C0()
{
  uint64_t v0;

  return *(id *)(v0 + 96);
}

uint64_t sub_2391EC5C8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 104);
}

uint64_t sub_2391EC5D0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 105);
}

uint64_t sub_2391EC5D8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

void HIDElement.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 96);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t HIDElement.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 96);
  sub_23922CE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t sub_2391EC7A4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 96);
  sub_23922CE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

void sub_2391EC884()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 96);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t sub_2391EC95C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 96);
  sub_23922CE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t HIDElement.description.getter()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 16);
  sub_23922CC4C();
  sub_23922CA9C();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5D8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CDB4();
  sub_23922CA9C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  sub_23922CA84();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  sub_2391F0B84();
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  if ((v1 & 1) == 0)
  {
    sub_2391F0D9C();
    sub_23922CDB4();
    sub_23922CA9C();
    swift_bridgeObjectRelease();
  }
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  return 0;
}

uint64_t HIDElement.Value.hash(into:)()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  _OWORD v12[6];
  _OWORD v13[2];

  v1 = v0[6];
  v12[5] = v0[5];
  v13[0] = v1;
  v2 = v0[4];
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)v0 + 105);
  v3 = v0[1];
  v12[0] = *v0;
  v12[1] = v3;
  v4 = v0[3];
  v12[2] = v0[2];
  v12[3] = v4;
  v12[4] = v2;
  v5 = (void *)v1;
  swift_unownedRetainStrong();
  sub_2391F00B0((uint64_t)v12);
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v6 = v5;
  sub_23922C9AC();

  sub_2391F0BC8((uint64_t)v12);
  v7 = type metadata accessor for HIDElement.Value();
  sub_23922CCC4();
  sub_2391F2650(&qword_25691F5F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v8 = (uint64_t *)((char *)v0 + *(int *)(v7 + 24));
  v9 = *v8;
  v10 = v8[1];
  sub_2391F0C34(*v8, v10);
  sub_23922C970();
  return sub_2391F0C78(v9, v10);
}

uint64_t HIDElement.Value.hashValue.getter()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  _OWORD v12[6];
  _OWORD v13[2];

  sub_23922CE38();
  v1 = v0[6];
  v12[5] = v0[5];
  v13[0] = v1;
  v2 = v0[4];
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)v0 + 105);
  v3 = v0[1];
  v12[0] = *v0;
  v12[1] = v3;
  v4 = v0[3];
  v12[2] = v0[2];
  v12[3] = v4;
  v12[4] = v2;
  v5 = (void *)v1;
  swift_unownedRetainStrong();
  sub_2391F00B0((uint64_t)v12);
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v6 = v5;
  sub_23922C9AC();

  sub_2391F0BC8((uint64_t)v12);
  v7 = type metadata accessor for HIDElement.Value();
  sub_23922CCC4();
  sub_2391F2650(&qword_25691F5F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v8 = (uint64_t *)((char *)v0 + *(int *)(v7 + 24));
  v9 = *v8;
  v10 = v8[1];
  sub_2391F0C34(*v8, v10);
  sub_23922C970();
  sub_2391F0C78(v9, v10);
  return sub_23922CE74();
}

uint64_t sub_2391ECF94(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD v14[6];
  _OWORD v15[2];

  sub_23922CE38();
  v4 = v2[6];
  v14[5] = v2[5];
  v15[0] = v4;
  v5 = v2[4];
  *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v2 + 105);
  v6 = v2[1];
  v14[0] = *v2;
  v14[1] = v6;
  v7 = v2[3];
  v14[2] = v2[2];
  v14[3] = v7;
  v14[4] = v5;
  v8 = (void *)v4;
  swift_unownedRetainStrong();
  sub_2391F00B0((uint64_t)v14);
  type metadata accessor for HIDDeviceClient();
  sub_2391F2650(&qword_25691F5C8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_23922CA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v9 = v8;
  sub_23922C9AC();

  sub_2391F0BC8((uint64_t)v14);
  sub_23922CCC4();
  sub_2391F2650(&qword_25691F5F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v10 = (uint64_t *)((char *)v2 + *(int *)(a2 + 24));
  v11 = *v10;
  v12 = v10[1];
  sub_2391F0C34(*v10, v12);
  sub_23922C970();
  sub_2391F0C78(v11, v12);
  return sub_23922CE74();
}

uint64_t HIDElement.Value.integerValue<A>(asTypeTruncatingIfNeeded:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  __int16 v16;
  __int16 v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = v3;
  v27 = a3;
  v25 = a2;
  swift_getAssociatedTypeWitness();
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v24 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for HIDElement.Value();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23922CC1C();
  v26 = v4;
  sub_2391F1214(v4, (uint64_t)v11);
  if ((v12 & 1) == 0)
  {
    sub_2391F1258((uint64_t)v11);
    goto LABEL_6;
  }
  v13 = (uint64_t *)&v11[*(int *)(v9 + 24)];
  v14 = *v13;
  v15 = v13[1];
  sub_2391F0C34(*v13, v15);
  sub_2391ED400(v14, v15);
  v17 = v16;
  result = sub_2391F0C78(v14, v15);
  if ((v17 & 0x100) == 0)
  {
    sub_2391F1258((uint64_t)v11);
    if ((v17 & 0x80) != 0)
    {
      swift_getAssociatedConformanceWitness();
      sub_23922CDE4();
      sub_23922CDC0();
      sub_23922CBF8();
      v19 = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v8, a1);
LABEL_7:
      MEMORY[0x24BDAC7A8](v19);
      *(&v23 - 4) = a1;
      *(&v23 - 3) = v20;
      *(&v23 - 2) = v21;
      return sub_2391EEA20(v27, (uint64_t)sub_2391F1294, (uint64_t)(&v23 - 6), a1, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], v22);
    }
LABEL_6:
    swift_getAssociatedConformanceWitness();
    sub_23922CDE4();
    v19 = sub_23922CDC0();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

void sub_2391ED400(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }
}

void sub_2391ED5D4(uint64_t a1, uint64_t a2)
{
  char *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F710);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&loc_2391ED664
     + dword_2391ED7A4[*(_QWORD *)(a2 + *(int *)(type metadata accessor for HIDElement.Value() + 24) + 8) >> 62];
  __asm { BR              X10 }
}

uint64_t sub_2391ED674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  sub_2391F0C34(v3, v4);
  sub_2391F0C34(v3, v4);
  sub_23922C988();
  sub_2391F0C78(v3, v4);
  *(_QWORD *)(v5 - 96) = *(int *)(v0 + 36);
  sub_23922C97C();
  sub_2391F2650(&qword_25691F718, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDD78], MEMORY[0x24BDCDD80]);
  sub_23922CBE0();
  v6 = 0;
  if ((*(_BYTE *)(v5 - 81) & 1) == 0)
  {
    v7 = 0;
    do
    {
      v8 = *(_BYTE *)(v5 - 82);
      v9 = sub_23922CCDC();
      v10 = v9 + 7;
      if (__OFADD__(v9, 7))
      {
        __break(1u);
        JUMPOUT(0x2391ED7A4);
      }
      v6 = v7 + 1;
      if (v10 < 0)
        v10 = v9 + 14;
      if (v7 >= v10 >> 3)
        break;
      *(_BYTE *)(v1 + v7) = v8;
      sub_23922CBE0();
      ++v7;
    }
    while ((*(_BYTE *)(v5 - 81) & 1) == 0);
  }
  *(_QWORD *)(v2 + *(_QWORD *)(v5 - 96)) = v6;
  return sub_2391F2690(v2, &qword_25691F710);
}

uint64_t HIDElement.Value.logicalValue<A>(asTypeTruncatingIfNeeded:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char *v31;
  char v32;
  char v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t result;
  void (*v41)(char *, uint64_t);
  char *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  char *v54;
  char *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  char *v58;
  char *v59;
  char v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;

  v4 = v3;
  v71 = a3;
  v7 = *(_QWORD *)(a2 + 8);
  v67 = *(_QWORD *)(*(_QWORD *)(v7 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = type metadata accessor for HIDElement.Value();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v70 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v65 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v61 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v69 = (char *)&v61 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v68 = (char *)&v61 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v61 - v25;
  HIDElement.Value.integerValue<A>(asTypeTruncatingIfNeeded:)(a1, a2, (uint64_t)&v61 - v25);
  if ((*(_BYTE *)(v4 + 40) & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v26, a1);
    v27 = 1;
    v28 = v71;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v28, v27, 1, a1);
  }
  v66 = v12;
  v63 = v4;
  v29 = *(_QWORD *)(v4 + 32);
  v30 = sub_23922CC1C();
  v64 = v7;
  if ((v30 & 1) != 0)
  {
    v31 = v26;
    if (sub_23922CC10() >= 64)
    {
      v72 = v29;
      sub_2391F12C0();
      v38 = v68;
      sub_23922CBEC();
      v32 = sub_23922CA3C();
      v12 = v66;
      (*(void (**)(char *, uint64_t))(v66 + 8))(v38, a1);
    }
    else
    {
      v32 = sub_23922CC04() < v29;
      v12 = v66;
    }
    v37 = (uint64_t)v70;
    goto LABEL_11;
  }
  v33 = sub_23922CC1C();
  v62 = v26;
  v34 = sub_23922CC10();
  if ((v33 & 1) == 0)
  {
    v37 = (uint64_t)v70;
    if (v34 < 64)
    {
      v31 = v62;
      v32 = sub_23922CC04() < v29;
      v12 = v66;
    }
    else
    {
      v12 = v66;
      v31 = v62;
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v17, v62, a1);
      v72 = v29;
      if (v29 < 1)
      {
        v32 = 0;
        v56 = *(void (**)(char *, uint64_t))(v12 + 8);
      }
      else
      {
        sub_2391F12C0();
        v55 = v68;
        sub_23922CBEC();
        v32 = sub_23922CA3C();
        v56 = *(void (**)(char *, uint64_t))(v12 + 8);
        v56(v55, a1);
      }
      v56(v17, a1);
    }
LABEL_11:
    v35 = v69;
    goto LABEL_12;
  }
  v35 = v69;
  if (v34 <= 64)
  {
    swift_getAssociatedConformanceWitness();
    sub_23922CDE4();
    v49 = v68;
    sub_23922CDC0();
    v50 = v62;
    v51 = sub_23922CA3C();
    v52 = v66;
    v53 = *(void (**)(char *, uint64_t))(v66 + 8);
    v54 = v49;
    v31 = v50;
    v53(v54, a1);
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v20, v50, a1);
    v32 = (v51 & 1) != 0 || sub_23922CC04() < v29;
    v53(v20, a1);
    v12 = v66;
    v37 = (uint64_t)v70;
  }
  else
  {
    v72 = v29;
    sub_2391F12C0();
    v36 = v68;
    sub_23922CBEC();
    v31 = v62;
    v32 = sub_23922CA3C();
    v12 = v66;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v36, a1);
    v37 = (uint64_t)v70;
  }
LABEL_12:
  v39 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v39(v35, v31, a1);
  result = sub_2391F1214(v63, v37);
  if ((v32 & 1) != 0)
  {
    sub_2391F1258(v37);
    v41 = *(void (**)(char *, uint64_t))(v12 + 8);
    v41(v35, a1);
    v28 = v71;
    goto LABEL_14;
  }
  if ((*(_BYTE *)(v37 + 56) & 1) == 0)
  {
    v42 = v31;
    v43 = *(_QWORD *)(v37 + 48);
    v44 = sub_23922CC1C();
    v45 = sub_23922CC10();
    if ((v44 & 1) != 0)
    {
      v28 = v71;
      if (v45 <= 64)
      {
        v57 = sub_23922CC04();
        sub_2391F1258(v37);
        v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        v41(v35, a1);
        if (v43 < v57)
          goto LABEL_14;
      }
      else
      {
        v72 = v43;
        sub_2391F12C0();
        v46 = v68;
        sub_23922CBEC();
        v47 = sub_23922CA3C();
        v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        v41(v46, a1);
        sub_2391F1258(v37);
        v41(v35, a1);
        if ((v47 & 1) != 0)
          goto LABEL_14;
      }
    }
    else if (v45 > 63)
    {
      v72 = v43;
      v58 = v65;
      v39(v65, v35, a1);
      if (v43 < 0)
      {
        v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        v41(v58, a1);
        sub_2391F1258(v37);
        v41(v35, a1);
        v28 = v71;
        v31 = v42;
        goto LABEL_14;
      }
      sub_2391F12C0();
      v59 = v68;
      sub_23922CBEC();
      v60 = sub_23922CA3C();
      v41 = *(void (**)(char *, uint64_t))(v12 + 8);
      v41(v59, a1);
      v41(v58, a1);
      sub_2391F1258(v37);
      v41(v35, a1);
      v28 = v71;
      v31 = v42;
      if ((v60 & 1) != 0)
      {
LABEL_14:
        v41(v31, a1);
        v27 = 1;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v28, v27, 1, a1);
      }
    }
    else
    {
      v48 = sub_23922CC04();
      sub_2391F1258(v37);
      v41 = *(void (**)(char *, uint64_t))(v12 + 8);
      v41(v35, a1);
      v28 = v71;
      if (v43 < v48)
        goto LABEL_14;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v28, v31, a1);
    v27 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v28, v27, 1, a1);
  }
  __break(1u);
  return result;
}

uint64_t HIDElement.Value.physicalValue<A, B>(fromTypeTruncatingIfNeeded:as:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
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
  char *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t *boxed_opaque_existential_0;
  void (*v24)(uint64_t *, char *, uint64_t);
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28;

  v6 = v5;
  v27[1] = a4;
  v28 = a3;
  v10 = sub_23922CBD4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v27 - v13;
  v15 = *(_QWORD *)(a1 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v27 - v19;
  if ((*(_BYTE *)(v6 + 120) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a5, 1, 1, a2);
  v27[0] = a5;
  HIDElement.Value.logicalValue<A>(asTypeTruncatingIfNeeded:)(a1, v28, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(v27[0], 1, 1, a2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v14, a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F600);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_23922D6C0;
    *(_QWORD *)(v22 + 56) = a1;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v22 + 32));
    v24 = *(void (**)(uint64_t *, char *, uint64_t))(v15 + 16);
    v24(boxed_opaque_existential_0, v20, a1);
    sub_23922CE2C();
    swift_bridgeObjectRelease();
    v24((uint64_t *)v18, v20, a1);
    if (sub_23922CC10() < 65)
    {
      sub_23922CC1C();
      sub_23922CC04();
    }
    else
    {
      sub_2391F1340();
      sub_2391F1384();
      sub_23922C9E8();
    }
    v25 = *(uint64_t (**)(char *, uint64_t))(v15 + 8);
    result = v25(v18, a1);
    v26 = v27[0];
    if ((*(_BYTE *)(v6 + 120) & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      sub_23922C9F4();
      v25(v20, a1);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(v26, 0, 1, a2);
    }
  }
  return result;
}

uint64_t sub_2391EE250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  int v5;
  BOOL v6;
  unsigned int v7;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 20);
  v6 = __CFADD__(v5, 7);
  v7 = v5 + 7;
  if (v6)
    __break(1u);
  *(_QWORD *)&v22 = sub_2391F13C8(v7 >> 3);
  *((_QWORD *)&v22 + 1) = v11;
  sub_2391F0720((uint64_t)&v22);
  v20 = a2;
  sub_2391EE940((uint64_t)&v20, (uint64_t)&v21, (uint64_t)&v22);
  v12 = v22;
  v13 = *(_OWORD *)(a1 + 80);
  a4[4] = *(_OWORD *)(a1 + 64);
  a4[5] = v13;
  a4[6] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)a4 + 105) = *(_OWORD *)(a1 + 105);
  v14 = *(_OWORD *)(a1 + 16);
  *a4 = *(_OWORD *)a1;
  a4[1] = v14;
  v15 = *(_OWORD *)(a1 + 48);
  a4[2] = *(_OWORD *)(a1 + 32);
  a4[3] = v15;
  v16 = type metadata accessor for HIDElement.Value();
  *(_OWORD *)((char *)a4 + *(int *)(v16 + 24)) = v12;
  v17 = (char *)a4 + *(int *)(v16 + 20);
  v18 = sub_23922CCC4();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a3, v18);
}

uint64_t HIDElement.Value.init<A>(element:fromIntegerTruncatingIfNeeded:timestamp:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  int v49;
  __int128 v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  char v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v48 = *(_QWORD *)(a4 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v47 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v45 - v14;
  v50 = *a1;
  v16 = *((_DWORD *)a1 + 4);
  v49 = *((_DWORD *)a1 + 5);
  v51 = v16;
  v17 = *(__int128 *)((char *)a1 + 88);
  v57 = *(__int128 *)((char *)a1 + 72);
  v58 = v17;
  v59 = *(__int128 *)((char *)a1 + 104);
  v60 = *((_BYTE *)a1 + 120);
  v18 = *(__int128 *)((char *)a1 + 40);
  v54 = *(__int128 *)((char *)a1 + 24);
  v55 = v18;
  v56 = *(__int128 *)((char *)a1 + 56);
  if ((sub_23922CC1C() & 1) != 0)
  {
    v19 = a3;
    if (sub_23922CC10() < 64)
    {
      v20 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v15, a2, a4);
      v21 = sub_23922CC04();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v15, a4);
LABEL_4:
      v22 = v49;
      if ((v21 & 0x8000000000000000) == 0)
        goto LABEL_16;
      goto LABEL_11;
    }
    v52 = 0;
    sub_2391F148C();
    sub_23922CBEC();
    v26 = sub_23922CA3C();
    v20 = v48;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, a4);
  }
  else
  {
    v46 = a3;
    v23 = sub_23922CC1C();
    v45 = a2;
    v24 = sub_23922CC10();
    v25 = v24 < 64;
    if ((v23 & 1) == 0)
      goto LABEL_13;
    if (v24 <= 64)
    {
      swift_getAssociatedConformanceWitness();
      sub_23922CDE4();
      sub_23922CDC0();
      a2 = v45;
      v42 = sub_23922CA3C();
      v20 = v48;
      v43 = *(void (**)(char *, uint64_t))(v48 + 8);
      v43(v15, a4);
      v44 = v47;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v47, a2, a4);
      if ((v42 & 1) != 0)
      {
        v43(v44, a4);
        v19 = v46;
        v22 = v49;
        v27 = v49 + 7;
        v25 = v49 < -7;
        if (v49 >= 0xFFFFFFF9)
          goto LABEL_12;
        goto LABEL_17;
      }
      v21 = sub_23922CC04();
      v43(v44, a4);
      v19 = v46;
      goto LABEL_4;
    }
    v52 = 0;
    sub_2391F148C();
    sub_23922CBEC();
    a2 = v45;
    v26 = sub_23922CA3C();
    v20 = v48;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, a4);
    v19 = v46;
  }
  v22 = v49;
  if ((v26 & 1) == 0)
    goto LABEL_16;
LABEL_11:
  while (1)
  {
    v27 = v22 + 7;
    v25 = (int)v22 < -7;
    if (v22 < 0xFFFFFFF9)
      break;
LABEL_12:
    while (1)
    {
      __break(1u);
LABEL_13:
      v19 = v46;
      a2 = v45;
      v22 = v49;
      v20 = v48;
      if (v25)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v15, v45, a4);
        v28 = sub_23922CC04();
        (*(void (**)(char *, uint64_t))(v20 + 8))(v15, a4);
        if (v28 < 0)
          break;
      }
LABEL_16:
      v27 = v22 + 7;
      v25 = (int)v22 < -7;
      if (v22 < 0xFFFFFFF9)
        goto LABEL_17;
    }
  }
LABEL_17:
  v52 = sub_2391F13C8(v27 >> 3);
  v53 = v29;
  sub_2391F0720((uint64_t)&v52);
  v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 16))(v15, a2, a4);
  MEMORY[0x24BDAC7A8](v30);
  *(&v45 - 2) = (uint64_t)&v52;
  sub_2391EEA20((uint64_t)v15, (uint64_t)sub_2391F1464, (uint64_t)(&v45 - 4), a4, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], v31);
  v32 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v32(a2, a4);
  v32((uint64_t)v15, a4);
  *(_OWORD *)a5 = v50;
  v33 = v56;
  *(_OWORD *)(a5 + 72) = v57;
  *(_OWORD *)(a5 + 88) = v58;
  *(_OWORD *)(a5 + 104) = v59;
  v34 = v55;
  *(_OWORD *)(a5 + 24) = v54;
  *(_OWORD *)(a5 + 40) = v34;
  v35 = v52;
  v36 = v53;
  *(_DWORD *)(a5 + 16) = v51;
  *(_DWORD *)(a5 + 20) = v22;
  *(_BYTE *)(a5 + 120) = v60;
  *(_OWORD *)(a5 + 56) = v33;
  v37 = type metadata accessor for HIDElement.Value();
  v38 = (uint64_t *)(a5 + *(int *)(v37 + 24));
  *v38 = v35;
  v38[1] = v36;
  v39 = a5 + *(int *)(v37 + 20);
  v40 = sub_23922CCC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 32))(v39, v19, v40);
}

uint64_t sub_2391EE940(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (!a2 || result != a2)
LABEL_7:
      __asm { BR              X12 }
  }
  else if (a2)
  {
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_2391EEA20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, char *);
  uint64_t result;
  uint64_t v18;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v16(v12, v12 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64), v14);
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  return result;
}

uint64_t sub_2391EEAB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[16];
  uint64_t v16;
  char v17;

  v8 = sub_23922CCC4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(_BYTE *)(a1 + 40) != 1 && *(_QWORD *)(a1 + 32) <= a2)
  {
    sub_2391F260C(a1 + 48, (uint64_t)v15, &qword_25691F708);
    result = sub_2391F260C((uint64_t)v15, (uint64_t)&v16, &qword_25691F708);
    if ((v17 & 1) != 0)
    {
      __break(1u);
      return result;
    }
    if (v16 >= a2)
    {
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, a3, v8);
      sub_2391EE250(a1, a2, (uint64_t)v11, a4);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, v8);
      v14 = type metadata accessor for HIDElement.Value();
      return (*(uint64_t (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a4, 0, 1, v14);
    }
  }
  sub_2391F0BC8(a1);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, v8);
  v13 = type metadata accessor for HIDElement.Value();
  return (*(uint64_t (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a4, 1, 1, v13);
}

uint64_t HIDElement.Value.init<A>(element:fromLogicalValueTruncatingIfNeeded:timestamp:)@<X0>(__int128 *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t AssociatedTypeWitness;
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
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  char *v39;
  BOOL v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  char v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char *v60;
  char v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  char v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t, uint64_t);
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  char *v105;
  __int128 v106[6];
  _OWORD v107[2];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _OWORD v114[3];

  v104 = a6;
  v105 = a2;
  v10 = sub_23922CCC4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v99 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = a5;
  v13 = *(char **)(a5 + 8);
  v98 = *(void (**)(char *, uint64_t, uint64_t))(*((_QWORD *)v13 + 3) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v16 = *(_QWORD *)(a4 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v102 = (char *)&v90 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v103 = (char *)&v90 - v25;
  v26 = a1[5];
  v112 = a1[4];
  v113 = v26;
  v114[0] = a1[6];
  *(_OWORD *)((char *)v114 + 9) = *(__int128 *)((char *)a1 + 105);
  v27 = a1[1];
  v108 = *a1;
  v109 = v27;
  v28 = a1[3];
  v110 = a1[2];
  v111 = v28;
  if ((BYTE8(v110) & 1) == 0)
  {
    v93 = v24;
    v94 = v23;
    v96 = a3;
    v97 = v16;
    v92 = v22;
    v101 = v11;
    v95 = v10;
    v30 = v110;
    if ((sub_23922CC1C() & 1) != 0)
    {
      v31 = (char *)v105;
      v32 = sub_23922CC10();
      v29 = v104;
      if (v32 >= 64)
      {
        *(_QWORD *)&v106[0] = v30;
        sub_2391F12C0();
        v48 = v103;
        sub_23922CBEC();
        v49 = sub_23922CA3C();
        v50 = v97;
        v37 = *(void (**)(char *, uint64_t))(v97 + 8);
        v37(v48, a4);
        v51 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
        v38 = a4;
        v39 = v102;
        v98 = v51;
        v51(v102, (uint64_t)v31, v38);
        v43 = v101;
        if ((v49 & 1) == 0)
          goto LABEL_15;
        goto LABEL_33;
      }
      v93 = v30;
      v33 = v97;
      v34 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 16);
      v35 = v103;
      v34(v103, (uint64_t)v31, a4);
      v36 = sub_23922CC04();
      v37 = *(void (**)(char *, uint64_t))(v33 + 8);
      v38 = a4;
      v37(v35, a4);
      v39 = v102;
      v98 = v34;
      v34(v102, (uint64_t)v31, v38);
      v40 = v36 < v93;
LABEL_14:
      v43 = v101;
      if (!v40)
        goto LABEL_15;
LABEL_33:
      sub_2391F0BC8((uint64_t)&v108);
      v37(v39, v38);
      v88 = v95;
      v87 = v96;
LABEL_38:
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v87, v88);
      v37(v31, v38);
      goto LABEL_39;
    }
    v41 = sub_23922CC1C();
    v42 = sub_23922CC10();
    if ((v41 & 1) != 0)
    {
      v43 = v101;
      if (v42 > 64)
      {
        *(_QWORD *)&v106[0] = v30;
        sub_2391F12C0();
        v44 = v103;
        sub_23922CBEC();
        v31 = (char *)v105;
        v45 = sub_23922CA3C();
        v46 = v97;
        v37 = *(void (**)(char *, uint64_t))(v97 + 8);
        v37(v44, a4);
        v47 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
        v38 = a4;
        v39 = v102;
        v98 = v47;
        v47(v102, (uint64_t)v31, v38);
        v29 = v104;
        if ((v45 & 1) == 0)
          goto LABEL_15;
        goto LABEL_33;
      }
      v93 = v30;
      swift_getAssociatedConformanceWitness();
      sub_23922CDE4();
      v64 = v13;
      v65 = v103;
      sub_23922CDC0();
      v91 = v64;
      v66 = v105;
      v67 = sub_23922CA3C();
      v68 = v97;
      v37 = *(void (**)(char *, uint64_t))(v97 + 8);
      v37(v65, a4);
      v69 = *(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16);
      v38 = a4;
      v70 = (char *)v94;
      v69(v94, v66, a4);
      v29 = v104;
      v39 = v102;
      if ((v67 & 1) != 0)
      {
        v37(v70, v38);
        v69((uint64_t)v39, v66, v38);
        v31 = (char *)v66;
        goto LABEL_33;
      }
      v86 = sub_23922CC04();
      v37(v70, v38);
      v98 = (void (*)(char *, uint64_t, uint64_t))v69;
      v69((uint64_t)v39, v66, v38);
      v40 = v86 < v93;
      v31 = (char *)v66;
      v13 = v91;
      if (v40)
        goto LABEL_33;
    }
    else
    {
      v52 = v30;
      if (v42 < 64)
      {
        v53 = v97;
        v54 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 16);
        v55 = v103;
        v31 = (char *)v105;
        v54(v103, v105, a4);
        v56 = sub_23922CC04();
        v37 = *(void (**)(char *, uint64_t))(v53 + 8);
        v38 = a4;
        v37(v55, a4);
        v39 = v102;
        v98 = v54;
        v54(v102, (uint64_t)v31, v38);
        v40 = v56 < v52;
        v29 = v104;
        goto LABEL_14;
      }
      v71 = v97;
      v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v97 + 16);
      v73 = v93;
      v31 = (char *)v105;
      v74 = a4;
      v72(v93, v105, a4);
      *(_QWORD *)&v106[0] = v52;
      v29 = v104;
      v98 = (void (*)(char *, uint64_t, uint64_t))v72;
      if (v52 <= 0)
      {
        v37 = *(void (**)(char *, uint64_t))(v71 + 8);
        v37((char *)v73, a4);
        v39 = v102;
        v72((uint64_t)v102, (uint64_t)v31, v74);
        v38 = v74;
        if ((BYTE8(v111) & 1) == 0)
          goto LABEL_16;
        goto LABEL_35;
      }
      sub_2391F12C0();
      v75 = (void (*)(char *, uint64_t, uint64_t))v72;
      v76 = v103;
      sub_23922CBEC();
      LODWORD(v94) = sub_23922CA3C();
      v37 = *(void (**)(char *, uint64_t))(v71 + 8);
      v37(v76, a4);
      v37((char *)v73, a4);
      v39 = v102;
      v75(v102, (uint64_t)v31, v74);
      v43 = v101;
      v38 = v74;
      if ((v94 & 1) != 0)
        goto LABEL_33;
    }
LABEL_15:
    if ((BYTE8(v111) & 1) == 0)
    {
LABEL_16:
      v57 = v111;
      v58 = sub_23922CC1C();
      v59 = sub_23922CC10();
      if ((v58 & 1) != 0)
      {
        if (v59 > 64)
        {
          *(_QWORD *)&v106[0] = v57;
          sub_2391F12C0();
          v60 = v103;
          sub_23922CBEC();
          v61 = sub_23922CA3C();
          v62 = v60;
          goto LABEL_29;
        }
LABEL_20:
        v63 = sub_23922CC04();
        v37(v39, v38);
        if (v57 >= v63)
        {
LABEL_30:
          v106[4] = v112;
          v106[5] = v113;
          v107[0] = v114[0];
          *(_OWORD *)((char *)v107 + 9) = *(_OWORD *)((char *)v114 + 9);
          v106[0] = v108;
          v106[1] = v109;
          v106[2] = v110;
          v106[3] = v111;
          v78 = (uint64_t)v103;
          v98(v103, (uint64_t)v31, v38);
          v79 = v101;
          v80 = (uint64_t)v99;
          v82 = v95;
          v81 = v96;
          (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v99, v96, v95);
          v83 = v104;
          HIDElement.Value.init<A>(element:fromIntegerTruncatingIfNeeded:timestamp:)(v106, v78, v80, v38, v104);
          (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v81, v82);
          v37(v31, v38);
          v84 = type metadata accessor for HIDElement.Value();
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v84 - 8) + 56))(v83, 0, 1, v84);
        }
        goto LABEL_37;
      }
      if (v59 <= 63)
        goto LABEL_20;
      *(_QWORD *)&v106[0] = v57;
      v13 = v92;
      v98(v92, (uint64_t)v39, v38);
      if ((v57 & 0x8000000000000000) == 0)
      {
        sub_2391F12C0();
        v77 = v103;
        sub_23922CBEC();
        v61 = sub_23922CA3C();
        v37(v77, v38);
        v62 = v13;
LABEL_29:
        v37(v62, v38);
        v37(v39, v38);
        if ((v61 & 1) == 0)
          goto LABEL_30;
        goto LABEL_37;
      }
LABEL_36:
      v37(v13, v38);
      v37(v39, v38);
LABEL_37:
      sub_2391F0BC8((uint64_t)&v108);
      v88 = v95;
      v87 = v96;
      v29 = v104;
      v43 = v101;
      goto LABEL_38;
    }
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  sub_2391F0BC8((uint64_t)&v108);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
  v29 = v104;
  (*(void (**)(char *, uint64_t))(v16 + 8))((char *)v105, a4);
LABEL_39:
  v89 = type metadata accessor for HIDElement.Value();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v29, 1, 1, v89);
}

uint64_t HIDElement.Value.init<A>(element:fromPhysicalValue:timestamp:)@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  double v24;
  uint64_t result;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  double v34;
  _OWORD v35[6];
  _BYTE v36[25];

  v32[1] = a5;
  v33 = a6;
  v10 = sub_23922CCC4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F620);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (_OWORD *)((char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v15);
  *(_OWORD *)&v36[9] = *(_OWORD *)((char *)a1 + 105);
  v20 = a1[5];
  v35[4] = a1[4];
  v35[5] = v20;
  *(_OWORD *)v36 = a1[6];
  v21 = a1[1];
  v35[0] = *a1;
  v35[1] = v21;
  v22 = a1[3];
  v35[2] = a1[2];
  v35[3] = v22;
  if ((v36[24] & 1) != 0)
  {
    sub_2391F0BC8((uint64_t)v35);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, a4);
LABEL_8:
    v30 = type metadata accessor for HIDElement.Value();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v33, 1, 1, v30);
  }
  v23 = a3;
  v24 = *(double *)&v36[16];
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a2, a4);
  sub_2391F1340();
  result = sub_23922C9DC();
  v26 = v24 * v34;
  if ((~COERCE__INT64(v24 * v34) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v26 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v26 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  v27 = (uint64_t)v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v23, v10);
  sub_2391EEAB8((uint64_t)v35, v27, (uint64_t)v13, v17);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v23, v10);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, a4);
  v28 = type metadata accessor for HIDElement.Value();
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v29 + 48))(v17, 1, v28))
  {
    sub_2391F2690((uint64_t)v17, &qword_25691F620);
    goto LABEL_8;
  }
  v31 = v33;
  sub_2391F14D0((uint64_t)v17, v33);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v31, 0, 1, v28);
}

uint64_t HIDElement.Value.description.getter()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  _OWORD v9[6];
  _OWORD v10[2];

  *(_QWORD *)&v9[0] = 0;
  *((_QWORD *)&v9[0] + 1) = 0xE000000000000000;
  sub_23922CC4C();
  sub_23922CA9C();
  v1 = v0[5];
  v9[4] = v0[4];
  v9[5] = v1;
  v10[0] = v0[6];
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)v0 + 105);
  v2 = v0[1];
  v9[0] = *v0;
  v9[1] = v2;
  v3 = v0[3];
  v9[2] = v0[2];
  v9[3] = v3;
  sub_2391F00B0((uint64_t)v9);
  HIDElement.description.getter();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_2391F0BC8((uint64_t)v9);
  sub_23922CA9C();
  v4 = type metadata accessor for HIDElement.Value();
  sub_23922CCC4();
  sub_23922CCD0();
  sub_23922CA9C();
  v5 = (uint64_t *)((char *)v0 + *(int *)(v4 + 24));
  v6 = *v5;
  v7 = v5[1];
  sub_2391F0C34(*v5, v7);
  sub_2391EFA2C(v6, v7);
  sub_2391F0C78(v6, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F628);
  sub_2391F1514();
  sub_23922CA30();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  return 0;
}

void sub_2391EFA2C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_2391EFA84(uint64_t a1)
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
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v4 = BYTE6(v22);
  if (BYTE6(v22))
  {
    *(_QWORD *)(v3 - 104) = v2;
    v5 = BYTE6(v22);
    sub_2391F0988(0, BYTE6(v22), 0);
    v2 = *(_QWORD *)(v3 - 104);
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == 1)
        v6 = (int)a1;
      else
        v6 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)(v3 - 136) = v22 & 0x3FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(v3 - 128) = v1;
    while (v5)
    {
      if ((_DWORD)v1)
      {
        if ((_DWORD)v1 == 1)
        {
          if (v6 < (int)a1 || v6 >= a1 >> 32)
            goto LABEL_29;
          v7 = sub_23922C8BC();
          if (!v7)
          {
            __break(1u);
LABEL_36:
            __break(1u);
          }
          v8 = v7;
          v9 = sub_23922C8E0();
          v10 = v6 - v9;
          if (__OFSUB__(v6, v9))
            goto LABEL_32;
        }
        else
        {
          if (v6 < *(_QWORD *)(a1 + 16))
            goto LABEL_31;
          if (v6 >= *(_QWORD *)(a1 + 24))
            goto LABEL_33;
          v12 = sub_23922C8BC();
          if (!v12)
            goto LABEL_36;
          v8 = v12;
          v13 = sub_23922C8E0();
          v10 = v6 - v13;
          if (__OFSUB__(v6, v13))
            goto LABEL_34;
        }
        v11 = *(_BYTE *)(v8 + v10);
      }
      else
      {
        if (v6 >= BYTE6(v22))
          goto LABEL_30;
        *(_QWORD *)(v3 - 118) = a1;
        *(_WORD *)(v3 - 110) = v22;
        *(_BYTE *)(v3 - 108) = BYTE2(v22);
        *(_BYTE *)(v3 - 107) = BYTE3(v22);
        *(_BYTE *)(v3 - 106) = BYTE4(v22);
        *(_BYTE *)(v3 - 105) = BYTE5(v22);
        v11 = *(_BYTE *)(v3 - 118 + v6);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691F6F8);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_23922D6C0;
      *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE4260];
      *(_QWORD *)(v14 + 64) = MEMORY[0x24BEE42B0];
      *(_BYTE *)(v14 + 32) = v11;
      v15 = sub_23922CA78();
      v17 = v16;
      *(_QWORD *)(v3 - 104) = v2;
      v19 = *(_QWORD *)(v2 + 16);
      v18 = *(_QWORD *)(v2 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_2391F0988((char *)(v18 > 1), v19 + 1, 1);
        v2 = *(_QWORD *)(v3 - 104);
      }
      *(_QWORD *)(v2 + 16) = v19 + 1;
      v20 = v2 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v15;
      *(_QWORD *)(v20 + 40) = v17;
      ++v6;
      --v5;
      --v4;
      v1 = *(_QWORD *)(v3 - 128);
      if (!v4)
        return v2;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    __break(1u);
    JUMPOUT(0x2391EFD98);
  }
  return v2;
}

uint64_t sub_2391EFDC4(uint64_t a1)
{
  MEMORY[0x23B8397A4](&unk_2392393F0, a1);
  return sub_23922C9B8();
}

uint64_t sub_2391EFE00()
{
  MEMORY[0x23B8397A4](&unk_2392393F0);
  return sub_23922C9AC();
}

uint64_t sub_2391EFE48(uint64_t a1, uint64_t a2)
{
  sub_23922CE38();
  MEMORY[0x23B8397A4](&unk_2392393F0, a2);
  sub_23922C9AC();
  return sub_23922CE74();
}

void type metadata accessor for IOHIDElement()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25691F6E0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25691F6E0);
  }
}

uint64_t sub_2391EFEF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x23B8397A4](&unk_2392393F0, a3);
  return sub_23922C9A0();
}

char *sub_2391EFF40(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F728);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B83978C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2391F0098(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 96);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_2391F00B0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 96);
  swift_unownedRetain();
  v3 = v2;
  return a1;
}

char *sub_2391F00E0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F720);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[128 * v8])
      memmove(v13, v14, v8 << 7);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2391F01E0(uint64_t a1)
{
  sub_2391F0240(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(void **)(a1 + 96));
  return a1;
}

void sub_2391F0240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  if (a13)
  {
    swift_unownedRelease();

  }
}

double sub_2391F0278(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 105) = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

void sub_2391F0294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_2391F02F4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x2391F04D8);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_2391F04FC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2391F0558()
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
  sub_2391F0294((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_2391F0C78(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

void sub_2391F0720(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_2391F077C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

char *sub_2391F0908(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_23922C940();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_23922C8BC();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_23922C8E0();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_23922C8D4();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

char *sub_2391F0988(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2391F09A4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2391F09A4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F700);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t _s7CoreHID20HIDElementCollectionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;
  char v7;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a2 + 16);
  type metadata accessor for HIDDeviceClient();
  swift_unownedRetainStrong();
  swift_unownedRetainStrong();
  v4 = static HIDDeviceClient.== infix(_:_:)();
  swift_release();
  swift_release();
  if ((v4 & 1) == 0)
    return 0;
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v5 = v2;
  v6 = v3;
  v7 = sub_23922C9A0();

  return v7 & 1;
}

unint64_t sub_2391F0B84()
{
  unint64_t result;

  result = qword_25691F5E0;
  if (!qword_25691F5E0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage, &type metadata for HIDUsage);
    atomic_store(result, (unint64_t *)&qword_25691F5E0);
  }
  return result;
}

uint64_t sub_2391F0BC8(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 96);
  swift_unownedRelease();

  return a1;
}

uint64_t type metadata accessor for HIDElement.Value()
{
  uint64_t result;

  result = qword_256920BF0;
  if (!qword_256920BF0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2391F0C34(uint64_t a1, unint64_t a2)
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

uint64_t sub_2391F0C78(uint64_t a1, unint64_t a2)
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

uint64_t _s7CoreHID10HIDElementV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v6;
  char v7;

  v2 = *(void **)(a1 + 96);
  v3 = *(void **)(a2 + 96);
  type metadata accessor for HIDDeviceClient();
  swift_unownedRetainStrong();
  swift_unownedRetainStrong();
  v4 = static HIDDeviceClient.== infix(_:_:)();
  swift_release();
  swift_release();
  if ((v4 & 1) == 0)
    return 0;
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v5 = v2;
  v6 = v3;
  v7 = sub_23922C9A0();

  return v7 & 1;
}

unint64_t sub_2391F0D9C()
{
  unint64_t result;

  result = qword_25691F5E8;
  if (!qword_25691F5E8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDReportID, &type metadata for HIDReportID);
    atomic_store(result, (unint64_t *)&qword_25691F5E8);
  }
  return result;
}

uint64_t sub_2391F0DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_23922C8BC();
  v11 = result;
  if (result)
  {
    result = sub_23922C8E0();
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
  v14 = sub_23922C8D4();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_2391F0294(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_2391F0E94(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_2391F0ED8()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_2391F0F0C + dword_2391F0FCC[v0 >> 62]))();
}

uint64_t sub_2391F0F1C@<X0>(uint64_t a1@<X8>)
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
      sub_2391F0C34(v2, v1);
      sub_2391F04FC(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t _s7CoreHID10HIDElementV5ValueV2eeoiySbAE_AEtFZ_0(_OWORD *a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  char v24;
  char v25;
  char v26;
  _OWORD v28[6];
  _OWORD v29[2];
  _OWORD v30[6];
  _OWORD v31[3];

  v4 = type metadata accessor for HIDElement.Value();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v28 - v8;
  v10 = a1[5];
  v28[4] = a1[4];
  v28[5] = v10;
  v29[0] = a1[6];
  *(_OWORD *)((char *)v29 + 9) = *(_OWORD *)((char *)a1 + 105);
  v11 = a1[1];
  v28[0] = *a1;
  v28[1] = v11;
  v12 = a1[3];
  v28[2] = a1[2];
  v28[3] = v12;
  v13 = *a2;
  v14 = a2[1];
  v15 = a2[3];
  v30[2] = a2[2];
  v30[3] = v15;
  v30[0] = v13;
  v30[1] = v14;
  v16 = a2[4];
  v17 = a2[5];
  v18 = a2[6];
  *(_OWORD *)((char *)v31 + 9) = *(__int128 *)((char *)a2 + 105);
  v30[5] = v17;
  v31[0] = v18;
  v30[4] = v16;
  type metadata accessor for HIDDeviceClient();
  swift_unownedRetainStrong();
  swift_unownedRetainStrong();
  sub_2391F00B0((uint64_t)v28);
  sub_2391F00B0((uint64_t)v30);
  v19 = static HIDDeviceClient.== infix(_:_:)();
  swift_release();
  swift_release();
  if ((v19 & 1) == 0)
  {
    sub_2391F0BC8((uint64_t)v30);
    sub_2391F0BC8((uint64_t)v28);
    sub_2391F1214((uint64_t)a1, (uint64_t)v9);
    sub_2391F1214((uint64_t)a2, (uint64_t)v7);
    goto LABEL_5;
  }
  v20 = *(void **)&v29[0];
  v21 = *(void **)&v31[0];
  type metadata accessor for IOHIDElement();
  sub_2391F2650(&qword_25691F5D0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  v22 = v20;
  v23 = v21;
  v24 = sub_23922C9A0();

  sub_2391F0BC8((uint64_t)v30);
  sub_2391F0BC8((uint64_t)v28);
  sub_2391F1214((uint64_t)a1, (uint64_t)v9);
  sub_2391F1214((uint64_t)a2, (uint64_t)v7);
  if ((v24 & 1) == 0)
  {
LABEL_5:
    v26 = 0;
    goto LABEL_6;
  }
  sub_2391F0E94(*(_QWORD *)&v9[*(int *)(v4 + 24)], *(_QWORD *)&v9[*(int *)(v4 + 24) + 8]);
  v26 = v25;
LABEL_6:
  sub_2391F1258((uint64_t)v9);
  sub_2391F1258((uint64_t)v7);
  return v26 & 1;
}

uint64_t sub_2391F1214(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HIDElement.Value();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2391F1258(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HIDElement.Value();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2391F1294(uint64_t a1)
{
  uint64_t v1;

  sub_2391ED5D4(a1, *(_QWORD *)(v1 + 32));
}

unint64_t sub_2391F12C0()
{
  unint64_t result;

  result = qword_25691F5F8;
  if (!qword_25691F5F8)
  {
    result = MEMORY[0x23B8397A4](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_25691F5F8);
  }
  return result;
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

unint64_t sub_2391F1340()
{
  unint64_t result;

  result = qword_25691F608;
  if (!qword_25691F608)
  {
    result = MEMORY[0x23B8397A4](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_25691F608);
  }
  return result;
}

unint64_t sub_2391F1384()
{
  unint64_t result;

  result = qword_25691F610;
  if (!qword_25691F610)
  {
    result = MEMORY[0x23B8397A4](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_25691F610);
  }
  return result;
}

uint64_t sub_2391F13C8(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_23922C8EC();
      swift_allocObject();
      sub_23922C8C8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_23922C94C();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_2391F1464(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2391EE940(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_2391F148C()
{
  unint64_t result;

  result = qword_25691F618;
  if (!qword_25691F618)
  {
    result = MEMORY[0x23B8397A4](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_25691F618);
  }
  return result;
}

uint64_t sub_2391F14D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HIDElement.Value();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2391F1514()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25691F630;
  if (!qword_25691F630)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25691F628);
    result = MEMORY[0x23B8397A4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25691F630);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B839798](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2391F15A8()
{
  unint64_t result;

  result = qword_25691F638;
  if (!qword_25691F638)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDElementCollection.CollectionType, &type metadata for HIDElementCollection.CollectionType);
    atomic_store(result, (unint64_t *)&qword_25691F638);
  }
  return result;
}

unint64_t sub_2391F15F0()
{
  unint64_t result;

  result = qword_25691F640;
  if (!qword_25691F640)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDElementCollection, &type metadata for HIDElementCollection);
    atomic_store(result, (unint64_t *)&qword_25691F640);
  }
  return result;
}

unint64_t sub_2391F1638()
{
  unint64_t result;

  result = qword_25691F648;
  if (!qword_25691F648)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDElement, &type metadata for HIDElement);
    atomic_store(result, (unint64_t *)&qword_25691F648);
  }
  return result;
}

uint64_t sub_2391F167C()
{
  return sub_2391F2650(&qword_25691F650, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
}

void destroy for HIDElementCollection(uint64_t a1)
{
  swift_unownedRelease();

}

uint64_t _s7CoreHID20HIDElementCollectionVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  *(_QWORD *)a1 = swift_unownedRetain();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for HIDElementCollection(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  *(_QWORD *)a1 = swift_unownedRetain();
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_DWORD *)(a1 + 10) = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v7 = v5;

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

uint64_t assignWithTake for HIDElementCollection(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for HIDElementCollection(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDElementCollection(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDElementCollection()
{
  return &type metadata for HIDElementCollection;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDElementCollection.CollectionType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDElementCollection.CollectionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2391F1984 + 4 * byte_23922D6D5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2391F19B8 + 4 * byte_23922D6D0[v4]))();
}

uint64_t sub_2391F19B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2391F19C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2391F19C8);
  return result;
}

uint64_t sub_2391F19D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2391F19DCLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2391F19E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2391F19E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2391F19F4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2391F19FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HIDElementCollection.CollectionType()
{
  return &type metadata for HIDElementCollection.CollectionType;
}

uint64_t initializeBufferWithCopyOfBuffer for HIDElement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for HIDElement(uint64_t a1)
{
  swift_unownedRelease();

}

uint64_t initializeWithCopy for HIDElement(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  *(_QWORD *)a1 = swift_unownedRetain();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  v4 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  v5 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v6 = *(void **)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v6;
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v7 = v6;
  return a1;
}

uint64_t assignWithCopy for HIDElement(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  *(_QWORD *)a1 = swift_unownedRetain();
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_DWORD *)(a1 + 10) = v4;
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  v5 = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = v5;
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  v6 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v8;
  v9 = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v9;
  v10 = *(void **)(a2 + 96);
  v11 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v10;
  v12 = v10;

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  v13 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v13;
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

uint64_t assignWithTake for HIDElement(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  v4 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v5 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDElement(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 121))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 96);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDElement(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 96) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 121) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDElement()
{
  return &type metadata for HIDElement;
}

uint64_t initializeBufferWithCopyOfBuffer for HIDElement.Value(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(_QWORD *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = swift_unownedRetain();
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    *(_DWORD *)(a1 + 10) = *(_DWORD *)((char *)a2 + 10);
    *(_BYTE *)(a1 + 14) = *((_BYTE *)a2 + 14);
    *(_WORD *)(a1 + 15) = *(_WORD *)((char *)a2 + 15);
    v8 = *((_DWORD *)a2 + 6);
    *(_DWORD *)(a1 + 20) = *((_DWORD *)a2 + 5);
    *(_DWORD *)(a1 + 24) = v8;
    *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
    *(_WORD *)(a1 + 29) = *(_WORD *)((char *)a2 + 29);
    v9 = a2[4];
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
    v10 = (void *)a2[12];
    *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
    *(_BYTE *)(a1 + 105) = *((_BYTE *)a2 + 105);
    *(_BYTE *)(a1 + 120) = *((_BYTE *)a2 + 120);
    *(_QWORD *)(a1 + 112) = a2[14];
    v11 = *(int *)(a3 + 20);
    v12 = a1 + v11;
    v13 = (uint64_t)a2 + v11;
    *(_QWORD *)(a1 + 96) = v10;
    v14 = sub_23922CCC4();
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v10;
    v15(v12, v13, v14);
    v17 = *(int *)(a3 + 24);
    v18 = (uint64_t *)(a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    v20 = *v19;
    v21 = v19[1];
    sub_2391F0C34(*v19, v21);
    *v18 = v20;
    v18[1] = v21;
  }
  return a1;
}

uint64_t destroy for HIDElement.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_unownedRelease();

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return sub_2391F0C78(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
}

uint64_t initializeWithCopy for HIDElement.Value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;

  *(_QWORD *)a1 = swift_unownedRetain();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  v6 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  v7 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v8 = *(void **)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_QWORD *)(a1 + 96) = v8;
  v12 = sub_23922CCC4();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v14 = v8;
  v13(v10, v11, v12);
  v15 = *(int *)(a3 + 24);
  v16 = (uint64_t *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v18 = *v17;
  v19 = v17[1];
  sub_2391F0C34(*v17, v19);
  *v16 = v18;
  v16[1] = v19;
  return a1;
}

uint64_t assignWithCopy for HIDElement.Value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;

  *(_QWORD *)a1 = swift_unownedRetain();
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_DWORD *)(a1 + 10) = v6;
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  v7 = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  v8 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v8;
  v9 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v9;
  v10 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v10;
  v11 = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v11;
  v12 = *(void **)(a2 + 96);
  v13 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v12;
  v14 = v12;

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  v15 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v15;
  v16 = *(int *)(a3 + 20);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v20 = *(int *)(a3 + 24);
  v21 = (uint64_t *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  v23 = *v22;
  v24 = v22[1];
  sub_2391F0C34(*v22, v24);
  v25 = *v21;
  v26 = v21[1];
  *v21 = v23;
  v21[1] = v24;
  sub_2391F0C78(v25, v26);
  return a1;
}

_OWORD *initializeWithTake for HIDElement.Value(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  a1[6] = a2[6];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)a2 + 105);
  v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  v8 = a2[3];
  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  a1[2] = a2[2];
  a1[3] = v8;
  v12 = sub_23922CCC4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for HIDElement.Value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  v6 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v7 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = *(int *)(a3 + 24);
  v13 = *(_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  sub_2391F0C78(v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDElement.Value()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2391F2438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 96);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23922CCC4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for HIDElement.Value()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2391F24C0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 96) = (a2 - 1);
  }
  else
  {
    v7 = sub_23922CCC4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2391F2534()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23922CCC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2391F25B0()
{
  return sub_2391F2650(&qword_25691F6E8, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_239239388);
}

uint64_t sub_2391F25DC()
{
  return sub_2391F2650(&qword_25691F6F0, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393B0);
}

uint64_t sub_2391F260C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2391F2650(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B8397A4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2391F2690(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t HIDVirtualDevice.Properties.descriptor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_2391F0C34(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t HIDVirtualDevice.Properties.vendorID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16);
}

unint64_t HIDVirtualDevice.Properties.productID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 20) | ((unint64_t)*(unsigned __int8 *)(v0 + 24) << 32);
}

uint64_t HIDVirtualDevice.Properties.transport.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return sub_2391F2730(v2, v3);
}

uint64_t sub_2391F2730(uint64_t a1, unint64_t a2)
{
  if (a2 != 13)
    return sub_2391F2740(a1, a2);
  return a1;
}

uint64_t sub_2391F2740(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0xD)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t HIDVirtualDevice.Properties.product.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.manufacturer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.modelNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.versionNumber.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t HIDVirtualDevice.Properties.serialNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.uniqueID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.locationID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 144);
}

void HIDVirtualDevice.Properties.localizationCode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 153);
}

uint64_t sub_2391F2854()
{
  return 0;
}

uint64_t sub_2391F285C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2391F2864(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 160) = a1;
  return result;
}

uint64_t (*sub_2391F288C())()
{
  return nullsub_1;
}

__n128 HIDVirtualDevice.Properties.init(descriptor:vendorID:productID:transport:product:manufacturer:modelNumber:versionNumber:serialNumber:uniqueID:locationID:localizationCode:extraProperties:)@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __int128 a11, uint64_t a12, char a13, __int128 a14, __int128 a15, uint64_t a16, char a17, char *a18, uint64_t a19)
{
  uint64_t v20;
  unint64_t v21;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __n128 result;
  char v32;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __n128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v20 = *a5;
  v21 = a5[1];
  v32 = *a18;
  sub_2391F0C34(a1, a2);
  sub_2391F2730(v20, v21);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a19)
  {
    v24 = sub_2391F2C70(a19);
    swift_bridgeObjectRelease();
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  *(_QWORD *)&v37 = a1;
  *((_QWORD *)&v37 + 1) = a2;
  *(_QWORD *)&v38 = __PAIR64__(a4, a3);
  BYTE8(v38) = BYTE4(a4) & 1;
  *(_QWORD *)&v39 = v20;
  *((_QWORD *)&v39 + 1) = v21;
  v40.n128_u64[0] = a6;
  v40.n128_u64[1] = a7;
  *(_QWORD *)&v41 = a8;
  *((_QWORD *)&v41 + 1) = a10;
  v42 = a11;
  *(_QWORD *)&v43 = a12;
  BYTE8(v43) = a13 & 1;
  v44 = a14;
  v45 = a15;
  *(_QWORD *)&v46 = a16;
  BYTE8(v46) = a17 & 1;
  BYTE9(v46) = v32;
  v47 = v25;
  sub_2391F2B04((uint64_t *)&v37);
  sub_2391F0C78(a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2391F2BA8(v20, v21);
  sub_2391F2BCC((uint64_t *)&v37);
  v26 = v46;
  *(_OWORD *)(a9 + 128) = v45;
  *(_OWORD *)(a9 + 144) = v26;
  *(_QWORD *)(a9 + 160) = v47;
  v27 = v42;
  *(_OWORD *)(a9 + 64) = v41;
  *(_OWORD *)(a9 + 80) = v27;
  v28 = v44;
  *(_OWORD *)(a9 + 96) = v43;
  *(_OWORD *)(a9 + 112) = v28;
  v29 = v38;
  *(_OWORD *)a9 = v37;
  *(_OWORD *)(a9 + 16) = v29;
  result = v40;
  *(_OWORD *)(a9 + 32) = v39;
  *(__n128 *)(a9 + 48) = result;
  return result;
}

uint64_t *sub_2391F2B04(uint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = a1[4];
  v3 = a1[5];
  sub_2391F0C34(*a1, a1[1]);
  sub_2391F2730(v2, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2391F2BA8(uint64_t a1, unint64_t a2)
{
  if (a2 != 13)
    return sub_2391F2BB8(a1, a2);
  return a1;
}

uint64_t sub_2391F2BB8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0xD)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t *sub_2391F2BCC(uint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = a1[4];
  v3 = a1[5];
  sub_2391F0C78(*a1, a1[1]);
  sub_2391F2BA8(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2391F2C70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = MEMORY[0x24BEE4B00];
  v31 = a1 + 64;
  v32 = MEMORY[0x24BEE4B00];
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v11 = v10 | (v7 << 6);
      goto LABEL_25;
    }
    v12 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v30)
      goto LABEL_37;
    v13 = *(_QWORD *)(v31 + 8 * v12);
    v14 = v7 + 1;
    if (!v13)
    {
      v14 = v7 + 2;
      if (v7 + 2 >= v30)
        goto LABEL_37;
      v13 = *(_QWORD *)(v31 + 8 * v14);
      if (!v13)
      {
        v14 = v7 + 3;
        if (v7 + 3 >= v30)
          goto LABEL_37;
        v13 = *(_QWORD *)(v31 + 8 * v14);
        if (!v13)
        {
          v14 = v7 + 4;
          if (v7 + 4 >= v30)
            goto LABEL_37;
          v13 = *(_QWORD *)(v31 + 8 * v14);
          if (!v13)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
    v7 = v14;
LABEL_25:
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v18 = *v16;
    v17 = v16[1];
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    v20 = *(_QWORD *)(v2 + 16);
    if (*(_QWORD *)(v2 + 24) <= v20)
    {
      v21 = v20 + 1;
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_2391F57BC(v21, 1);
      v2 = v32;
    }
    else
    {
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
    }
    sub_23922CE38();
    sub_23922CA90();
    result = sub_23922CE74();
    v22 = v2 + 64;
    v23 = -1 << *(_BYTE *)(v2 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v2 + 64 + 8 * (v24 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v2 + 64 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v22 + 8 * v25);
      }
      while (v29 == -1);
      v8 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v22 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    v9 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v8);
    *v9 = v18;
    v9[1] = v17;
    *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v8) = v19;
    ++*(_QWORD *)(v2 + 16);
    result = swift_unknownObjectRelease();
  }
  v15 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_37:
    sub_2391F794C();
    return v2;
  }
  v13 = *(_QWORD *)(v31 + 8 * v15);
  if (v13)
  {
    v14 = v7 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v30)
      goto LABEL_37;
    v13 = *(_QWORD *)(v31 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2391F2F88()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);
  v53 = *(_QWORD *)(v0 + 80);
  v51 = *(_QWORD *)(v0 + 72);
  v52 = *(_QWORD *)(v0 + 88);
  v54 = *(_BYTE *)(v0 + 104);
  v55 = *(_QWORD *)(v0 + 96);
  v56 = *(_QWORD *)(v0 + 120);
  v59 = *(_QWORD *)(v0 + 128);
  v57 = *(_QWORD *)(v0 + 112);
  v58 = *(_QWORD *)(v0 + 136);
  v61 = *(_QWORD *)(v0 + 144);
  v60 = *(_BYTE *)(v0 + 152);
  v62 = *(_BYTE *)(v0 + 153);
  v63 = *(_QWORD *)(v0 + 160);
  v6 = sub_23922C964();
  v7 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v64 = v7;
  sub_2391F5F28(v6, 0xD000000000000010, 0x8000000239239E50, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v9 = sub_23922CE8C();
  v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_2391F5F28(v9, 0x4449726F646E6556, 0xE800000000000000, v10);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F730);
  v11 = sub_23922CBC8();
  v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_2391F5F28(v11, 0x49746375646F7250, 0xE900000000000044, v12);
  v13 = v7;
  swift_bridgeObjectRelease();
  if (v2 == 13)
    v14 = 0;
  else
    v14 = v1;
  if (v2 == 13)
    v15 = 12;
  else
    v15 = v2;
  v64 = v14;
  v65 = v15;
  sub_2391F2730(v1, v2);
  v16 = sub_239217800(&v64);
  v18 = v17;
  sub_2391F2BA8(v14, v15);
  v64 = v16;
  v65 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F738);
  v19 = sub_23922CBC8();
  swift_bridgeObjectRelease();
  v20 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v13;
  sub_2391F5F28(v19, 0x726F70736E617254, 0xE900000000000074, v20);
  v21 = v64;
  swift_bridgeObjectRelease();
  v64 = v3;
  v65 = v4;
  v22 = sub_23922CBC8();
  v23 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v21;
  sub_2391F5F28(v22, 0x746375646F7250, 0xE700000000000000, v23);
  v24 = v64;
  swift_bridgeObjectRelease();
  v64 = v5;
  v65 = v51;
  v25 = sub_23922CBC8();
  v26 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v24;
  sub_2391F5F28(v25, 0x74636166756E614DLL, 0xEC00000072657275, v26);
  v27 = v64;
  swift_bridgeObjectRelease();
  v64 = v53;
  v65 = v52;
  v28 = sub_23922CBC8();
  v29 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v27;
  sub_2391F5F28(v28, 0x6D754E6C65646F4DLL, 0xEB00000000726562, v29);
  v30 = v64;
  swift_bridgeObjectRelease();
  v64 = v55;
  LOBYTE(v65) = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F740);
  v31 = sub_23922CBC8();
  v32 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v30;
  sub_2391F5F28(v31, 0x4E6E6F6973726556, 0xED00007265626D75, v32);
  v33 = v64;
  swift_bridgeObjectRelease();
  v64 = v57;
  v65 = v56;
  v34 = sub_23922CBC8();
  v35 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v33;
  sub_2391F5F28(v34, 0x754E6C6169726553, 0xEC0000007265626DLL, v35);
  v36 = v64;
  swift_bridgeObjectRelease();
  v64 = v59;
  v65 = v58;
  v37 = sub_23922CBC8();
  v38 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v36;
  sub_2391F5F28(v37, 0xD000000000000016, 0x8000000239239E70, v38);
  v39 = v64;
  swift_bridgeObjectRelease();
  v64 = v61;
  LOBYTE(v65) = v60;
  v40 = sub_23922CBC8();
  v41 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v39;
  sub_2391F5F28(v40, 0x6E6F697461636F4CLL, 0xEA00000000004449, v41);
  v42 = v64;
  swift_bridgeObjectRelease();
  LOBYTE(v64) = v62;
  v64 = sub_239217980((unsigned __int8 *)&v64);
  LOBYTE(v65) = v43 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F748);
  v44 = sub_23922CBC8();
  v45 = swift_isUniquelyReferenced_nonNull_native();
  v64 = v42;
  sub_2391F5F28(v44, 0x437972746E756F43, 0xEB0000000065646FLL, v45);
  v46 = v64;
  swift_bridgeObjectRelease();
  v47 = sub_23922CAE4();
  v48 = swift_isUniquelyReferenced_nonNull_native();
  sub_2391F5F28(v47, 0x6E492D746C697542, 0xE800000000000000, v48);
  v64 = v46;
  swift_bridgeObjectRelease();
  if (v63)
  {
    v49 = MEMORY[0x24BDAC7A8](v63);
    sub_2391F6378(v49, (void (*)(uint64_t, uint64_t, uint64_t))sub_2391F6084);
    return v64;
  }
  return v46;
}

void HIDVirtualDevice.deviceReference.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 112);
}

id sub_2391F3548()
{
  uint64_t v0;

  return *(id *)(v0 + 120);
}

double sub_2391F3550@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_2391F3560@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_2391F6510(v1 + 128, a1);
}

uint64_t sub_2391F35A8(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  sub_2391F6558(a1, v1 + 128);
  return swift_endAccess();
}

uint64_t (*sub_2391F35F8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_2391F3638()
{
  uint64_t v0;

  return *(id *)(v0 + 168);
}

uint64_t sub_2391F3640()
{
  return 0;
}

uint64_t sub_2391F3648()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 192);
}

uint64_t sub_2391F3678(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 192) = a1;
  return result;
}

uint64_t (*sub_2391F36B4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2391F36F0()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 193);
}

uint64_t sub_2391F3720(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 193) = a1;
  return result;
}

uint64_t (*sub_2391F375C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void HIDVirtualDevice.__allocating_init(properties:)(__int128 *a1)
{
  swift_allocObject();
  HIDVirtualDevice.init(properties:)(a1);
}

void HIDVirtualDevice.init(properties:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  io_registry_entry_t v17;
  CFTypeRef v18;
  uint64_t v19;
  uint64_t v20;
  CFTypeRef v21;
  uint64_t v22;
  uint64_t v23;
  __IOHIDUserDevice *v24;
  __CFString *v25;
  CFTypeRef v26;
  uint64_t v27;
  __IOHIDUserDevice *v28;
  __CFString *v29;
  CFTypeRef v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  char v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  unint64_t v48;
  uint64_t v49;
  unsigned __int16 v50;
  CFTypeRef v51;
  unint64_t v52;
  unsigned __int16 v53;
  CFTypeRef v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  v2 = v1;
  v4 = sub_23922CB74();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23922CB98();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_23922C9D0();
  MEMORY[0x24BDAC7A8](v9);
  v10 = a1[9];
  v63 = a1[8];
  v64 = v10;
  v65 = *((_QWORD *)a1 + 20);
  v11 = a1[5];
  v59 = a1[4];
  v60 = v11;
  v12 = a1[7];
  v61 = a1[6];
  v62 = v12;
  v13 = a1[1];
  v55 = *a1;
  v14 = a1[2];
  v58 = a1[3];
  v56 = v13;
  v57 = v14;
  swift_defaultActor_initialize();
  *(_OWORD *)(v2 + 128) = 0u;
  *(_WORD *)(v2 + 192) = 0;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_QWORD *)(v2 + 160) = 0;
  sub_2391F2F88();
  v15 = (void *)sub_23922CA00();
  swift_bridgeObjectRelease();
  v16 = (void *)MEMORY[0x23B839318](0, v15, 1);

  if (!v16)
    goto LABEL_4;
  v17 = IOHIDUserDeviceCopyService();
  sub_239218E2C(v17, (uint64_t)&v51);
  if ((v52 & 1) != 0)
  {

LABEL_4:
    sub_2391F2BCC((uint64_t *)&v55);
    sub_2391F2690(v2 + 128, &qword_25691F750);
    type metadata accessor for HIDVirtualDevice();
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    return;
  }
  v49 = v4;
  v18 = v51;
  v54 = v16;
  type metadata accessor for IOHIDUserDevice(0);
  v20 = v19;
  v46 = v16;
  sub_239217FFC((uint64_t)&v54, v20, (uint64_t)&v51);
  v21 = v51;
  *(_QWORD *)(v2 + 112) = v18;
  *(_QWORD *)(v2 + 120) = v21;
  v48 = sub_2391F65D4();
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F6F8);
  v22 = swift_allocObject();
  v47 = xmmword_23922D6C0;
  *(_OWORD *)(v22 + 16) = xmmword_23922D6C0;
  v23 = MEMORY[0x24BEE45B8];
  *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE4568];
  *(_QWORD *)(v22 + 64) = v23;
  *(_QWORD *)(v22 + 32) = v18;
  sub_23922CA78();
  sub_23922C9C4();
  v51 = (CFTypeRef)MEMORY[0x24BEE4AF8];
  sub_2391F66EC(&qword_25691F760, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930], MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F768);
  sub_2391F6610();
  sub_23922CC28();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5758], v49);
  *(_QWORD *)(v2 + 168) = sub_23922CBA4();
  v24 = (__IOHIDUserDevice *)*(id *)(v2 + 120);
  v25 = (__CFString *)sub_23922CA6C();
  v26 = IOHIDUserDeviceCopyProperty(v24, v25);

  if (v26)
  {
    v51 = v26;
    swift_dynamicCast();
    v27 = v53;
    v28 = (__IOHIDUserDevice *)*(id *)(v2 + 120);
    v29 = (__CFString *)sub_23922CA6C();
    v30 = IOHIDUserDeviceCopyProperty(v28, v29);

    if (v30)
    {
      v54 = v30;
      v31 = swift_dynamicCast();
      v32 = v50;
      v33 = v31 ^ 1;
      if (!v31)
        v32 = 0;
    }
    else
    {
      v32 = 0;
      v33 = 1;
    }
    v34 = v46;
    v35 = MEMORY[0x24BEE4568];
    v36 = MEMORY[0x24BEE45B8];
    HIDUsage.init(page:usage:)(v32 | (v33 << 16), v27, (uint64_t)&v54);
    v37 = (int)v54;
    v38 = BYTE4(v54);
    v51 = 0;
    v52 = 0xE000000000000000;
    sub_23922CC4C();
    sub_23922CA9C();
    BYTE4(v54) = v38;
    LODWORD(v54) = v37;
    sub_2391F0B84();
    sub_23922CDB4();
    sub_23922CA9C();
    swift_bridgeObjectRelease();
    sub_23922CA9C();
    LODWORD(v54) = v56;
    sub_23922CDB4();
    sub_23922CA9C();
    swift_bridgeObjectRelease();
    sub_23922CA9C();
    sub_2391F2BCC((uint64_t *)&v55);
    v39 = DWORD1(v56);
    if (BYTE8(v56))
      v39 = 0;
    LODWORD(v54) = v39;
    sub_23922CDB4();
    sub_23922CA9C();
    swift_bridgeObjectRelease();
    sub_23922CA9C();
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = v47;
    v41 = *(_QWORD *)(v2 + 112);
    *(_QWORD *)(v40 + 56) = v35;
    *(_QWORD *)(v40 + 64) = v36;
    *(_QWORD *)(v40 + 32) = v41;
    v42 = sub_23922CA78();
    v44 = v43;

    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 176) = v42;
    *(_QWORD *)(v2 + 184) = v44;
  }
  else
  {
    __break(1u);
  }
}

uint64_t HIDVirtualDevice.deinit()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  uint64_t result;
  _QWORD v4[6];

  swift_beginAccess();
  *(_BYTE *)(v0 + 193) = 1;
  swift_beginAccess();
  if (*(_BYTE *)(v0 + 192) != 1)
    goto LABEL_3;
  IOHIDUserDeviceCancel(*(IOHIDUserDeviceRef *)(v0 + 120));
  v1 = *(NSObject **)(v0 + 168);
  v4[4] = nullsub_1;
  v4[5] = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1107296256;
  v4[2] = sub_2391F3FAC;
  v4[3] = &block_descriptor;
  v2 = _Block_copy(v4);
  swift_release();
  dispatch_sync(v1, v2);
  _Block_release(v2);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_3:

    sub_2391F2690(v0 + 128, &qword_25691F750);
    swift_bridgeObjectRelease();
    swift_defaultActor_destroy();
    return v0;
  }
  return result;
}

uint64_t sub_2391F3FAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t HIDVirtualDevice.__deallocating_deinit()
{
  HIDVirtualDevice.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t sub_2391F3FE4(uint64_t a1)
{
  uint64_t v1;
  __IOHIDUserDevice *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t (*v15)(_QWORD);
  uint64_t v16;

  v3 = *(__IOHIDUserDevice **)(v1 + 120);
  v4 = swift_allocObject();
  swift_weakInit();
  v15 = (uint64_t (*)(_QWORD))sub_2391F6698;
  v16 = v4;
  v5 = MEMORY[0x24BDAC760];
  v11 = MEMORY[0x24BDAC760];
  v12 = 1107296256;
  v13 = (uint64_t (*)(uint64_t))sub_2391F4800;
  v14 = &block_descriptor_3;
  v6 = _Block_copy(&v11);
  swift_release();
  IOHIDUserDeviceRegisterSetReportBlock(v3, v6);
  _Block_release(v6);
  v7 = swift_allocObject();
  swift_weakInit();
  v15 = (uint64_t (*)(_QWORD))sub_2391F66A0;
  v16 = v7;
  v11 = v5;
  v12 = 1107296256;
  v13 = (uint64_t (*)(uint64_t))sub_2391F4800;
  v14 = &block_descriptor_7;
  v8 = _Block_copy(&v11);
  swift_release();
  IOHIDUserDeviceRegisterGetReportBlock(v3, v8);
  _Block_release(v8);
  v15 = nullsub_1;
  v16 = 0;
  v11 = v5;
  v12 = 1107296256;
  v13 = sub_2391F4E40;
  v14 = &block_descriptor_10;
  v9 = _Block_copy(&v11);
  IOHIDUserDeviceSetCancelHandler(v3, v9);
  _Block_release(v9);
  IOHIDUserDeviceSetDispatchQueue(v3, *(dispatch_queue_t *)(v1 + 168));
  IOHIDUserDeviceActivate(v3);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 176))(1);
  sub_2391F66A8(a1, (uint64_t)&v11);
  return (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v1 + 152))(&v11);
}

uint64_t sub_2391F41A4(int a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t Strong;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, _QWORD);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  dispatch_semaphore_t v26;
  NSObject *v27;
  uint64_t v29;
  dispatch_semaphore_t v30;
  int v31;
  int v32;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAA0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23922C934();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return *(unsigned int *)sub_239217B38();
  v16 = Strong;
  v31 = a1;
  v32 = a2;
  v30 = dispatch_semaphore_create(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCDB98], v11);
  sub_23922C928();
  if (a4)
  {
    sub_23922C8EC();
    swift_allocObject();
    swift_retain();
    v17 = sub_23922C8A4();
    a4 = sub_2391F7798(v17, a4);
    v19 = v18;
    swift_release();
  }
  else
  {
    v21 = (void (*)(uint64_t, _QWORD))sub_23922C928();
    v21(a3, 0);
    swift_release();
    swift_release();
    v19 = 0xC000000000000000;
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  type metadata accessor for HIDVirtualDevice.Context();
  v22 = swift_allocObject();
  *(_DWORD *)(v22 + 16) = 0;
  v23 = sub_23922CB20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v10, 1, 1, v23);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = 0;
  *(_QWORD *)(v24 + 24) = 0;
  *(_QWORD *)(v24 + 32) = v16;
  v25 = v32;
  *(_DWORD *)(v24 + 40) = v31;
  *(_DWORD *)(v24 + 44) = v25;
  *(_QWORD *)(v24 + 48) = a4;
  *(_QWORD *)(v24 + 56) = v19;
  v26 = v30;
  *(_QWORD *)(v24 + 64) = v22;
  *(_QWORD *)(v24 + 72) = v26;
  swift_retain();
  sub_2391F0C34(a4, v19);
  swift_retain();
  v27 = v26;
  sub_2391F46B4((uint64_t)v10, (uint64_t)&unk_25691FAD0, v24);
  swift_release();
  sub_23922CB80();
  swift_release();
  sub_2391F0C78(a4, v19);

  v20 = *(unsigned int *)(v22 + 16);
  swift_release();
  return v20;
}

uint64_t sub_2391F4454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v8 + 80) = v10;
  *(_QWORD *)(v8 + 88) = v11;
  *(_QWORD *)(v8 + 64) = a7;
  *(_QWORD *)(v8 + 72) = a8;
  *(_DWORD *)(v8 + 120) = a5;
  *(_DWORD *)(v8 + 124) = a6;
  *(_QWORD *)(v8 + 56) = a4;
  *(_QWORD *)(v8 + 96) = *(_QWORD *)(*(_QWORD *)a4 + 144);
  return swift_task_switch();
}

uint64_t sub_2391F448C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 96))();
  return swift_task_switch();
}

void sub_2391F44D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v2 = *(unsigned int *)(v0 + 120);
    v3 = *(_DWORD *)(v0 + 124);
    v4 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_239217388(v2, (char *)(v0 + 132));
    if (v3 <= 0xFF)
    {
      HIDReportID.init(rawValue:)(*(unsigned int *)(v0 + 124), (_BYTE *)(v0 + 128));
      *(_BYTE *)(v0 + 130) = *(_BYTE *)(v0 + 128);
      *(_BYTE *)(v0 + 131) = *(_BYTE *)(v0 + 129);
      v6 = (void (*)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v4 + 8)
                                                                                           + *(_QWORD *)(v4 + 8));
      v5 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v5;
      *v5 = v0;
      v5[1] = sub_2391F45B8;
      v6(*(_QWORD *)(v0 + 56), v0 + 132, v0 + 130, *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), v1, v4);
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2391F45B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2391F461C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_23922CB8C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2391F4654()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  int v3;

  v1 = *(void **)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v3 = sub_239217D28(v1);

  *(_DWORD *)(v2 + 16) = v3;
  sub_23922CB8C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2391F46B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23922CB20();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23922CB14();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2391F2690(a1, &qword_25691FAA0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23922CAF0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2391F4804(int a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t Strong;
  uint64_t v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAA0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return *(unsigned int *)sub_239217B38();
  v12 = Strong;
  v13 = dispatch_semaphore_create(0);
  v14 = *a4;
  _s7CoreHID16HIDVirtualDeviceC7ContextCMa_0();
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = v14;
  *(_QWORD *)(v15 + 32) = a3;
  v16 = sub_23922CB20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  *(_QWORD *)(v17 + 32) = v12;
  *(_DWORD *)(v17 + 40) = a1;
  *(_DWORD *)(v17 + 44) = a2;
  *(_QWORD *)(v17 + 48) = v15;
  *(_QWORD *)(v17 + 56) = v13;
  swift_retain();
  swift_retain();
  v18 = v13;
  sub_2391F46B4((uint64_t)v10, (uint64_t)&unk_25691FAB0, v17);
  swift_release();
  sub_23922CB80();
  *a4 = *(_QWORD *)(v15 + 24);
  swift_release();

  v19 = *(unsigned int *)(v15 + 16);
  swift_release();
  return v19;
}

uint64_t sub_2391F4998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 64) = a7;
  *(_QWORD *)(v8 + 72) = a8;
  *(_DWORD *)(v8 + 120) = a5;
  *(_DWORD *)(v8 + 124) = a6;
  *(_QWORD *)(v8 + 56) = a4;
  *(_QWORD *)(v8 + 80) = *(_QWORD *)(*(_QWORD *)a4 + 144);
  return swift_task_switch();
}

uint64_t sub_2391F49C4()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 80))();
  return swift_task_switch();
}

void sub_2391F4A08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;
  void (*v9)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v2 = *(unsigned int *)(v0 + 120);
    v3 = *(_DWORD *)(v0 + 124);
    v4 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_239217388(v2, (char *)(v0 + 132));
    if (v3 <= 0xFF)
    {
      v5 = *(_QWORD *)(v0 + 64);
      HIDReportID.init(rawValue:)(*(unsigned int *)(v0 + 124), (_BYTE *)(v0 + 128));
      v6 = *(_BYTE *)(v0 + 129);
      *(_BYTE *)(v0 + 130) = *(_BYTE *)(v0 + 128);
      *(_BYTE *)(v0 + 131) = v6;
      v7 = *(_QWORD *)(v5 + 24);
      v9 = (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v4 + 16)
                                                                                    + *(_QWORD *)(v4 + 16));
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v8;
      *v8 = v0;
      v8[1] = sub_2391F4AF8;
      v9(*(_QWORD *)(v0 + 56), v0 + 132, v0 + 130, v7, v1, v4);
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2391F4AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[12] = a1;
  v4[13] = a2;
  v4[14] = v2;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_2391F4B68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __asm { BR              X11 }
}

uint64_t sub_2391F4BB0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(*(_QWORD *)(v1 + 64) + 24) >= (uint64_t)*(unsigned __int8 *)(v1 + 110))
    __asm { BR              X10 }
  v2 = *(_QWORD *)(v1 + 96);
  v3 = *(_QWORD *)(v1 + 104);
  sub_2391F7504();
  v4 = (void *)swift_allocError();
  *(_DWORD *)v5 = 9;
  *(_BYTE *)(v5 + 4) = 1;
  swift_willThrow();
  sub_2391F0C78(v2, v3);
  v6 = *(_QWORD *)(v1 + 64);
  LODWORD(v3) = sub_239217D28(v4);

  *(_DWORD *)(v6 + 16) = v3;
  sub_23922CB8C();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2391F4D74()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  int v3;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v1 = *(void **)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = sub_239217D28(v1);

  *(_DWORD *)(v2 + 16) = v3;
  sub_23922CB8C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2391F4DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v10 = v9(a2, a3, a4, a5);
  swift_release();
  return v10;
}

uint64_t sub_2391F4E40(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2391F4E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_2391F4E88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v2 = v0[4];
  v1 = v0[5];
  v4 = v0[2];
  v3 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
  v5 = swift_slowAlloc();
  v0[6] = v5;
  sub_2391F66EC(&qword_25691F788, v6, (uint64_t (*)(uint64_t))type metadata accessor for HIDVirtualDevice, (uint64_t)&protocol conformance descriptor for HIDVirtualDevice);
  v7 = (_QWORD *)swift_task_alloc();
  v0[7] = v7;
  v7[2] = v5;
  v7[3] = v4;
  v7[4] = v3;
  v7[5] = v1;
  v7[6] = v2;
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = v8;
  *v8 = v0;
  v8[1] = sub_2391F4F94;
  return sub_23922CDD8();
}

uint64_t sub_2391F4F94()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2391F5008()
{
  uint64_t v0;

  MEMORY[0x23B839834](*(_QWORD *)(v0 + 48), -1, -1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2391F5044()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc();
  MEMORY[0x23B839834](v1, -1, -1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2391F5088(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned __int8 v14;
  char v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    sub_239217BBC(a2, (uint64_t)&v13);
    if ((v15 & 1) != 0)
    {
      sub_23922CB08();
    }
    else
    {
      v9 = v13 | ((unint64_t)v14 << 32);
      sub_2391F7504();
      v10 = swift_allocError();
      *(_DWORD *)v11 = v9;
      *(_BYTE *)(v11 + 4) = BYTE4(v9) & 1;
      v12 = v10;
      sub_23922CAFC();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2391F518C(uint64_t a1, uint64_t a2)
{
  sub_2391F5088(a1, a2);
  return 0;
}

uint64_t HIDVirtualDevice.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2391F51B0()
{
  uint64_t v0;

  return v0;
}

uint64_t static HIDVirtualDevice.== infix(_:_:)()
{
  type metadata accessor for IOHIDUserDevice(0);
  sub_2391F66EC(&qword_25691F790, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC70);
  return sub_23922C9A0() & 1;
}

uint64_t sub_2391F5234()
{
  type metadata accessor for IOHIDUserDevice(0);
  sub_2391F66EC(&qword_25691F790, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC70);
  return sub_23922C9A0() & 1;
}

void HIDVirtualDevice.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 120);
  type metadata accessor for IOHIDUserDevice(0);
  sub_2391F66EC(&qword_25691F790, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC70);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t HIDVirtualDevice.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_23922CE38();
  v1 = *(void **)(v0 + 120);
  type metadata accessor for IOHIDUserDevice(0);
  sub_2391F66EC(&qword_25691F790, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC70);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t sub_2391F53BC()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *v0;
  sub_23922CE38();
  v2 = *(void **)(v1 + 120);
  type metadata accessor for IOHIDUserDevice(0);
  sub_2391F66EC(&qword_25691F790, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC70);
  v3 = v2;
  sub_23922C9AC();

  return sub_23922CE74();
}

void sub_2391F5450()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)v0 + 120);
  type metadata accessor for IOHIDUserDevice(0);
  sub_2391F66EC(&qword_25691F790, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC70);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t sub_2391F54D8()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *v0;
  sub_23922CE38();
  v2 = *(void **)(v1 + 120);
  type metadata accessor for IOHIDUserDevice(0);
  sub_2391F66EC(&qword_25691F790, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC70);
  v3 = v2;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t HIDVirtualDevice.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 176);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2391F5594()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 176);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2391F55C4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2391F55D4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2391F55E4(uint64_t a1)
{
  MEMORY[0x23B8397A4](&unk_23922DC70, a1);
  return sub_23922C9B8();
}

uint64_t sub_2391F5620()
{
  MEMORY[0x23B8397A4](&unk_23922DC70);
  return sub_23922C9AC();
}

uint64_t sub_2391F5668(uint64_t a1, uint64_t a2)
{
  sub_23922CE38();
  MEMORY[0x23B8397A4](&unk_23922DC70, a2);
  sub_23922C9AC();
  return sub_23922CE74();
}

uint64_t sub_2391F56C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x23B8397A4](&unk_23922DC70, a3);
  return sub_23922C9A0();
}

uint64_t sub_2391F570C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2391F5770;
  return v6(a1);
}

uint64_t sub_2391F5770()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2391F57BC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAE0);
  v36 = a2;
  v6 = sub_23922CD90();
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
      swift_unknownObjectRetain();
    }
    sub_23922CE38();
    sub_23922CA90();
    result = sub_23922CE74();
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

uint64_t sub_2391F5AD0(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAD8);
  v36 = a2;
  v6 = sub_23922CD90();
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
      swift_unknownObjectRetain();
    }
    sub_23922CE38();
    sub_23922CA90();
    result = sub_23922CE74();
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

unint64_t sub_2391F5DE4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23922CDCC() & 1) == 0)
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
      while (!v14 && (sub_23922CDCC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2391F5EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23922CE38();
  sub_23922CA90();
  v4 = sub_23922CE74();
  return sub_2391F5DE4(a1, a2, v4);
}

uint64_t sub_2391F5F28(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2391F5EC4(a2, a3);
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
    sub_2391F6124();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease();
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
  sub_2391F5AD0(v15, a4 & 1);
  v21 = sub_2391F5EC4(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23922CDF0();
  __break(1u);
  return result;
}

uint64_t sub_2391F6084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v7 = *(uint64_t **)(v3 + 16);
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v7;
  *v7 = 0x8000000000000000;
  sub_2391F5F28(a3, a1, a2, isUniquelyReferenced_nonNull_native);
  *v7 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

void *sub_2391F6124()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAD8);
  v2 = *v0;
  v3 = sub_23922CD84();
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
    result = (void *)swift_unknownObjectRetain();
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

uint64_t sub_2391F62D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = sub_23922C8BC();
  v7 = result;
  if (result)
  {
    result = sub_23922C8E0();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v7 += a1 - result;
  }
  v8 = __OFSUB__(a2, a1);
  v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = sub_23922C8D4();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  v12 = v7 + v11;
  if (v7)
    v13 = v12;
  else
    v13 = 0;
  return a3(v7, v13);
}

uint64_t sub_2391F6378(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      v10 = v17 + 1;
      if (v17 + 1 >= v8)
        return swift_release();
      v18 = *(_QWORD *)(v4 + 8 * v10);
      if (!v18)
      {
        v10 = v17 + 2;
        if (v17 + 2 >= v8)
          return swift_release();
        v18 = *(_QWORD *)(v4 + 8 * v10);
        if (!v18)
        {
          v10 = v17 + 3;
          if (v17 + 3 >= v8)
            return swift_release();
          v18 = *(_QWORD *)(v4 + 8 * v10);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v18 - 1) & v18;
    v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    a2(v14, v15, v16);
    swift_unknownObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v19 = v17 + 4;
  if (v19 >= v8)
    return swift_release();
  v18 = *(_QWORD *)(v4 + 8 * v19);
  if (v18)
  {
    v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v10);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2391F6510(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2391F6558(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for HIDVirtualDevice()
{
  return objc_opt_self();
}

void type metadata accessor for IOHIDUserDevice(uint64_t a1)
{
  sub_2391F7968(a1, &qword_25691FA80);
}

unint64_t sub_2391F65D4()
{
  unint64_t result;

  result = qword_25691F758;
  if (!qword_25691F758)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25691F758);
  }
  return result;
}

unint64_t sub_2391F6610()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25691F770;
  if (!qword_25691F770)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25691F768);
    result = MEMORY[0x23B8397A4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25691F770);
  }
  return result;
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

uint64_t sub_2391F6674()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2391F6698(int a1, int a2, uint64_t a3, uint64_t a4)
{
  return sub_2391F41A4(a1, a2, a3, a4);
}

uint64_t sub_2391F66A0(int a1, int a2, uint64_t a3, uint64_t *a4)
{
  return sub_2391F4804(a1, a2, a3, a4);
}

uint64_t sub_2391F66A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2391F66EC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B8397A4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2391F672C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 32);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(v3, a1, v5);
  __asm { BR              X10 }
}

uint64_t sub_2391F67A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v0;
  v9 = v1;
  v10 = BYTE2(v1);
  v11 = BYTE3(v1);
  v12 = BYTE4(v1);
  v13 = BYTE5(v1);
  sub_239217E3C();
  v2 = IOHIDUserDeviceHandleReportAsyncWithTimeStamp();
  result = sub_239217BBC(v2, (uint64_t)&v7);
  if ((v7 & 0x10000000000) == 0)
  {
    v4 = v7 | ((unint64_t)BYTE4(v7) << 32);
    sub_2391F7504();
    v5 = swift_allocError();
    *(_DWORD *)v6 = v4;
    *(_BYTE *)(v6 + 4) = BYTE4(v4) & 1;
    v7 = v5;
    return sub_23922CAFC();
  }
  return result;
}

uint64_t sub_2391F6980(uint64_t a1, uint64_t a2)
{
  return sub_2391F66EC(&qword_25691F798, a2, (uint64_t (*)(uint64_t))type metadata accessor for HIDVirtualDevice, (uint64_t)&protocol conformance descriptor for HIDVirtualDevice);
}

uint64_t method lookup function for HIDVirtualDevice()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HIDVirtualDevice.__allocating_init(properties:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of HIDVirtualDevice.activate(delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of HIDVirtualDevice.dispatchInputReport(data:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 232)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 232));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_2391F6A48;
  return v10(a1, a2, a3);
}

uint64_t sub_2391F6A48()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t destroy for HIDVirtualDevice.Properties(uint64_t *a1)
{
  sub_2391F0C78(*a1, a1[1]);
  if ((unint64_t)a1[5] >= 0xE)
    swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HIDVirtualDevice.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  int v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_2391F0C34(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = (_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  if (v8 > 0xD)
  {
    *(_QWORD *)(a1 + 32) = *v7;
    *(_QWORD *)(a1 + 40) = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v7;
  }
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  v10 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v10;
  v11 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v12 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v12;
  v13 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v13;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_WORD *)(a1 + 152) = *(_WORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDVirtualDevice.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_2391F0C34(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_2391F0C78(v6, v7);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v8 = *(_DWORD *)(a2 + 20);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = v8;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a2 + 40);
  if (v9 == 13)
  {
    if (v10 >= 0xE)
      goto LABEL_8;
    goto LABEL_11;
  }
  if (v10 == 13)
  {
    sub_2391F6E10(a1 + 32);
    goto LABEL_11;
  }
  if (v9 >= 0xD)
  {
    if (v10 >= 0xD)
    {
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_2391F6DDC(a1 + 32);
    goto LABEL_11;
  }
  if (v10 < 0xD)
  {
LABEL_11:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_12;
  }
LABEL_8:
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
LABEL_12:
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v11;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = v12;
  *(_BYTE *)(a1 + 153) = *(_BYTE *)(a2 + 153);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2391F6DDC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE0D00] - 8) + 8))();
  return a1;
}

uint64_t sub_2391F6E10(uint64_t a1)
{
  destroy for HIDDeviceTransport(a1);
  return a1;
}

__n128 __swift_memcpy168_8(uint64_t a1, __int128 *a2)
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
  *(_QWORD *)(a1 + 160) = *((_QWORD *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for HIDVirtualDevice.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  int v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2391F0C78(v4, v5);
  v6 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = (_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a2 + 40);
  if (v8 != 13)
  {
    if (v9 == 13)
    {
      sub_2391F6E10(a1 + 32);
    }
    else if (v8 >= 0xD)
    {
      if (v9 >= 0xD)
      {
        *(_QWORD *)(a1 + 32) = *v7;
        *(_QWORD *)(a1 + 40) = v9;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      sub_2391F6DDC(a1 + 32);
    }
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v7;
LABEL_8:
  v10 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v13 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v14;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_WORD *)(a1 + 152) = *(_WORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDVirtualDevice.Properties(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 168))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDVirtualDevice.Properties(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 168) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 168) = 0;
    if (a2)
      *(_QWORD *)(result + 56) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDVirtualDevice.Properties()
{
  return &type metadata for HIDVirtualDevice.Properties;
}

_QWORD *initializeBufferWithCopyOfBuffer for HIDVirtualDevice.Properties.Property(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for HIDVirtualDevice.Properties.Property()
{
  return swift_unknownObjectRelease();
}

_QWORD *assignWithCopy for HIDVirtualDevice.Properties.Property(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for HIDVirtualDevice.Properties.Property(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDVirtualDevice.Properties.Property(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDVirtualDevice.Properties.Property(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDVirtualDevice.Properties.Property()
{
  return &type metadata for HIDVirtualDevice.Properties.Property;
}

uint64_t dispatch thunk of HIDVirtualDeviceDelegate.hidVirtualDevice(_:receivedSetReportRequestOfType:id:data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a7 + 8)
                                                                                              + *(_QWORD *)(a7 + 8));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_2391F79B0;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of HIDVirtualDeviceDelegate.hidVirtualDevice(_:receivedGetReportRequestOfType:id:maxSize:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 16)
                                                                                     + *(_QWORD *)(a6 + 16));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_2391F731C;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2391F731C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t type metadata accessor for HIDVirtualDevice.Context()
{
  return objc_opt_self();
}

uint64_t _s7CoreHID16HIDVirtualDeviceC7ContextCMa_0()
{
  return objc_opt_self();
}

uint64_t sub_2391F73BC()
{
  return sub_2391F66EC(&qword_25691FA88, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC08);
}

uint64_t sub_2391F73EC()
{
  return sub_2391F66EC(&qword_25691FA90, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice, (uint64_t)&unk_23922DC30);
}

uint64_t sub_2391F741C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned __int8 v7;
  char v8;

  result = sub_239217E3C();
  if (a1)
  {
    v3 = IOHIDUserDeviceHandleReportAsyncWithTimeStamp();
    result = sub_239217BBC(v3, (uint64_t)&v6);
    if ((v8 & 1) == 0)
    {
      v4 = v6 | ((unint64_t)v7 << 32);
      sub_2391F7504();
      swift_allocError();
      *(_DWORD *)v5 = v4;
      *(_BYTE *)(v5 + 4) = BYTE4(v4) & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
      return sub_23922CAFC();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2391F7504()
{
  unint64_t result;

  result = qword_25691FA98;
  if (!qword_25691FA98)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDDeviceError, &type metadata for HIDDeviceError);
    atomic_store(result, (unint64_t *)&qword_25691FA98);
  }
  return result;
}

uint64_t sub_2391F7548()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2391F7584()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_2391F79B0;
  *(_OWORD *)(v3 + 64) = v4;
  *(_QWORD *)(v3 + 120) = v5;
  *(_QWORD *)(v3 + 56) = v2;
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(*(_QWORD *)v2 + 144);
  return swift_task_switch();
}

uint64_t sub_2391F7600()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2391F7624(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2391F79B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25691FAB8 + dword_25691FAB8))(a1, v4);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

uint64_t sub_2391F76D8(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_2391F7798(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;

  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF)
      return a2 << 32;
    sub_23922C94C();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = (_BYTE *)sub_23922C8BC();
    if (!v4)
    {
LABEL_10:
      v5 = sub_23922C8D4();
      if (v5 >= a2)
        v6 = a2;
      else
        v6 = v5;
      v7 = &v4[v6];
      if (v4)
        v8 = v7;
      else
        v8 = 0;
      v3 = sub_2391F76D8(v4, v8);
      swift_release();
      return v3;
    }
    result = sub_23922C8E0();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2391F787C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_2391F0C78(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2391F78C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = swift_task_alloc();
  v6 = *(_QWORD *)(v0 + 40);
  v7 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2391F6A48;
  *(_OWORD *)(v5 + 80) = v7;
  *(_QWORD *)(v5 + 64) = v3;
  *(_QWORD *)(v5 + 72) = v4;
  *(_QWORD *)(v5 + 120) = v6;
  *(_QWORD *)(v5 + 56) = v2;
  *(_QWORD *)(v5 + 96) = *(_QWORD *)(*(_QWORD *)v2 + 144);
  return swift_task_switch();
}

uint64_t sub_2391F794C()
{
  return swift_release();
}

void type metadata accessor for IOHIDReportType(uint64_t a1)
{
  sub_2391F7968(a1, &qword_25691FAE8);
}

void sub_2391F7968(uint64_t a1, unint64_t *a2)
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

void sub_2391F79D4(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = -2;
}

void HIDDeviceManager.DeviceMatchingCriteria.primaryUsage.getter(uint64_t a1@<X8>)
{
  int *v1;
  int v2;

  v2 = *v1;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)v1 + 4);
  *(_DWORD *)a1 = v2;
}

int *HIDDeviceManager.DeviceMatchingCriteria.primaryUsage.setter(int *result)
{
  uint64_t v1;
  int v2;

  v2 = *result;
  *(_BYTE *)(v1 + 4) = *((_BYTE *)result + 4);
  *(_DWORD *)v1 = v2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.primaryUsage.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.deviceUsages.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.deviceUsages.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.deviceUsages.modify())()
{
  return nullsub_1;
}

unint64_t HIDDeviceManager.DeviceMatchingCriteria.vendorID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.vendorID.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 16) = result;
  *(_BYTE *)(v1 + 20) = BYTE4(result) & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.vendorID.modify())()
{
  return nullsub_1;
}

unint64_t HIDDeviceManager.DeviceMatchingCriteria.productID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.productID.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 24) = result;
  *(_BYTE *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.productID.modify())()
{
  return nullsub_1;
}

double sub_2391F7ADC@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = xmmword_23922DCB0;
  return result;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.transport.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return sub_2391F2730(v2, v3);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.transport.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = sub_2391F2BA8(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v3;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.transport.modify())()
{
  return nullsub_1;
}

uint64_t sub_2391F7B38()
{
  return 0;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.product.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.product.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.product.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.manufacturer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.manufacturer.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.manufacturer.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.modelNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.modelNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.modelNumber.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.versionNumber.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.versionNumber.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 96) = result;
  *(_BYTE *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.versionNumber.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.serialNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.serialNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.serialNumber.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.uniqueID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.uniqueID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.uniqueID.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.locationID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 144);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.locationID.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 144) = result;
  *(_BYTE *)(v2 + 152) = a2 & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.locationID.modify())()
{
  return nullsub_1;
}

void sub_2391F7DCC(_BYTE *a1@<X8>)
{
  *a1 = 36;
}

void HIDDeviceManager.DeviceMatchingCriteria.localizationCode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 153);
}

_BYTE *HIDDeviceManager.DeviceMatchingCriteria.localizationCode.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 153) = *result;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.localizationCode.modify())()
{
  return nullsub_1;
}

uint64_t sub_2391F7E00()
{
  return 2;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.isBuiltIn.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 154);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.isBuiltIn.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 154) = result;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.isBuiltIn.modify())()
{
  return nullsub_1;
}

__n128 HIDDeviceManager.DeviceMatchingCriteria.init(primaryUsage:deviceUsages:vendorID:productID:transport:product:manufacturer:modelNumber:versionNumber:serialNumber:uniqueID:locationID:localizationCode:isBuiltIn:extraProperties:)@<Q0>(unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __int128 a11, uint64_t a12, char a13, __int128 a14, __int128 a15, uint64_t a16, char a17, char *a18, char a19, uint64_t a20)
{
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __n128 result;
  char v31;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __n128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v22 = *a1 | ((unint64_t)*((unsigned __int8 *)a1 + 4) << 32);
  v23 = *a5;
  v24 = a5[1];
  v31 = *a18;
  swift_bridgeObjectRetain();
  sub_2391F2730(v23, v24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a20)
  {
    v25 = sub_2391F81E0(a20);
    swift_bridgeObjectRelease();
  }
  else
  {
    v25 = 0;
  }
  LODWORD(v37) = v22;
  BYTE4(v37) = BYTE4(v22);
  *((_QWORD *)&v37 + 1) = a2;
  LODWORD(v38) = a3;
  BYTE4(v38) = BYTE4(a3) & 1;
  DWORD2(v38) = a4;
  BYTE12(v38) = BYTE4(a4) & 1;
  *(_QWORD *)&v39 = v23;
  *((_QWORD *)&v39 + 1) = v24;
  v40.n128_u64[0] = a6;
  v40.n128_u64[1] = a7;
  *(_QWORD *)&v41 = a8;
  *((_QWORD *)&v41 + 1) = a10;
  v42 = a11;
  *(_QWORD *)&v43 = a12;
  BYTE8(v43) = a13 & 1;
  v44 = a14;
  v45 = a15;
  *(_QWORD *)&v46 = a16;
  BYTE8(v46) = a17 & 1;
  BYTE9(v46) = v31;
  BYTE10(v46) = a19;
  v47 = v25;
  sub_2391F80A0((uint64_t)&v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2391F2BA8(v23, v24);
  swift_bridgeObjectRelease();
  sub_2391F8140((uint64_t)&v37);
  v26 = v46;
  *(_OWORD *)(a9 + 128) = v45;
  *(_OWORD *)(a9 + 144) = v26;
  *(_QWORD *)(a9 + 160) = v47;
  v27 = v42;
  *(_OWORD *)(a9 + 64) = v41;
  *(_OWORD *)(a9 + 80) = v27;
  v28 = v44;
  *(_OWORD *)(a9 + 96) = v43;
  *(_OWORD *)(a9 + 112) = v28;
  v29 = v38;
  *(_OWORD *)a9 = v37;
  *(_OWORD *)(a9 + 16) = v29;
  result = v40;
  *(_OWORD *)(a9 + 32) = v39;
  *(__n128 *)(a9 + 48) = result;
  return result;
}

uint64_t sub_2391F80A0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain();
  sub_2391F2730(v2, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2391F8140(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRelease();
  sub_2391F2BA8(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2391F81E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = MEMORY[0x24BEE4B00];
  v31 = a1 + 64;
  v32 = MEMORY[0x24BEE4B00];
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v11 = v10 | (v7 << 6);
      goto LABEL_25;
    }
    v12 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v30)
      goto LABEL_37;
    v13 = *(_QWORD *)(v31 + 8 * v12);
    v14 = v7 + 1;
    if (!v13)
    {
      v14 = v7 + 2;
      if (v7 + 2 >= v30)
        goto LABEL_37;
      v13 = *(_QWORD *)(v31 + 8 * v14);
      if (!v13)
      {
        v14 = v7 + 3;
        if (v7 + 3 >= v30)
          goto LABEL_37;
        v13 = *(_QWORD *)(v31 + 8 * v14);
        if (!v13)
        {
          v14 = v7 + 4;
          if (v7 + 4 >= v30)
            goto LABEL_37;
          v13 = *(_QWORD *)(v31 + 8 * v14);
          if (!v13)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
    v7 = v14;
LABEL_25:
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v18 = *v16;
    v17 = v16[1];
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    v20 = *(_QWORD *)(v2 + 16);
    if (*(_QWORD *)(v2 + 24) <= v20)
    {
      v21 = v20 + 1;
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_2391F9BC0(v21, 1);
      v2 = v32;
    }
    else
    {
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
    }
    sub_23922CE38();
    sub_23922CA90();
    result = sub_23922CE74();
    v22 = v2 + 64;
    v23 = -1 << *(_BYTE *)(v2 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v2 + 64 + 8 * (v24 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v2 + 64 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v22 + 8 * v25);
      }
      while (v29 == -1);
      v8 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v22 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    v9 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v8);
    *v9 = v18;
    v9[1] = v17;
    *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v8) = v19;
    ++*(_QWORD *)(v2 + 16);
    result = swift_unknownObjectRelease();
  }
  v15 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_37:
    sub_2391F794C();
    return v2;
  }
  v13 = *(_QWORD *)(v31 + 8 * v15);
  if (v13)
  {
    v14 = v7 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v30)
      goto LABEL_37;
    v13 = *(_QWORD *)(v31 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_2391F84F8()
{
  unsigned int *v0;
  unsigned int v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  unint64_t result;
  char v56;
  _QWORD *v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  char v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
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
  int v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;

  v1 = *((unsigned __int8 *)v0 + 4);
  v2 = *v0;
  v88 = *((_QWORD *)v0 + 1);
  v3 = *((_BYTE *)v0 + 20);
  v4 = *((_BYTE *)v0 + 28);
  v79 = *((_QWORD *)v0 + 5);
  v80 = *((_QWORD *)v0 + 4);
  v5 = *((_QWORD *)v0 + 7);
  v73 = *((_QWORD *)v0 + 6);
  v74 = *((_QWORD *)v0 + 8);
  v84 = *((_QWORD *)v0 + 9);
  v75 = *((_QWORD *)v0 + 10);
  v86 = *((_QWORD *)v0 + 11);
  v71 = *((_QWORD *)v0 + 12);
  v87 = *((_BYTE *)v0 + 104);
  v76 = *((_QWORD *)v0 + 14);
  v81 = *((_QWORD *)v0 + 15);
  v6 = *((_QWORD *)v0 + 17);
  v77 = *((_QWORD *)v0 + 16);
  v72 = *((_QWORD *)v0 + 18);
  v7 = *((_BYTE *)v0 + 152);
  v82 = *((unsigned __int8 *)v0 + 154);
  v83 = *((_BYTE *)v0 + 153);
  v78 = *((_QWORD *)v0 + 20);
  v8 = MEMORY[0x24BEE4B00];
  v92 = MEMORY[0x24BEE4B00];
  v9 = sub_23922CA6C();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_2391F5F28(v9, 0x6469766F72504F49, 0xEF7373616C437265, isUniquelyReferenced_nonNull_native);
  v11 = v8;
  swift_bridgeObjectRelease();
  if (v1 >> 1 <= 0x7EuLL)
  {
    v12 = v2 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v1 << 32);
    v13 = v8;
    HIDUsage.page.getter();
    v14 = sub_23922CE80();
    v15 = swift_isUniquelyReferenced_nonNull_native();
    HIDWORD(v90) = HIDWORD(v13);
    sub_2391F5F28(v14, 0xD000000000000010, 0x8000000239239EB0, v15);
    swift_bridgeObjectRelease();
    BYTE4(v90) = BYTE4(v12);
    LODWORD(v90) = v12;
    HIDUsage.usage.getter();
    if ((v16 & 0x10000) != 0)
    {
      v11 = v13;
    }
    else
    {
      HIDUsage.usage.getter();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691FB10);
      v17 = sub_23922CBC8();
      v18 = swift_isUniquelyReferenced_nonNull_native();
      sub_2391F5F28(v17, 0x557972616D697250, 0xEC00000065676173, v18);
      v11 = v13;
      swift_bridgeObjectRelease();
    }
  }
  if ((v3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F730);
    v19 = sub_23922CBC8();
    v20 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v19, 0x4449726F646E6556, 0xE800000000000000, v20);
    swift_bridgeObjectRelease();
  }
  v21 = v88;
  if ((v4 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F730);
    v22 = sub_23922CBC8();
    v23 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v22, 0x49746375646F7250, 0xE900000000000044, v23);
    swift_bridgeObjectRelease();
  }
  v90 = (_QWORD *)v80;
  v91 = v79;
  sub_239217800((uint64_t *)&v90);
  if (v24)
  {
    v25 = sub_23922CA6C();
    swift_bridgeObjectRelease();
    v26 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v25, 0x726F70736E617254, 0xE900000000000074, v26);
    v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  if (v5)
  {
    v90 = (_QWORD *)v73;
    v91 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F738);
    v27 = sub_23922CBC8();
    v28 = v92;
    v29 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v28;
    sub_2391F5F28(v27, 0x746375646F7250, 0xE700000000000000, v29);
    v92 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  if (v84)
  {
    v90 = (_QWORD *)v74;
    v91 = v84;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F738);
    v30 = sub_23922CBC8();
    v31 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v30, 0x74636166756E614DLL, 0xEC00000072657275, v31);
    v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  if (v86)
  {
    v90 = (_QWORD *)v75;
    v91 = v86;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F738);
    v32 = sub_23922CBC8();
    v33 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v32, 0x6D754E6C65646F4DLL, 0xEB00000000726562, v33);
    v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  if ((v87 & 1) == 0)
  {
    v90 = (_QWORD *)v71;
    LOBYTE(v91) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F740);
    v34 = sub_23922CBC8();
    v35 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v34, 0x4E6E6F6973726556, 0xED00007265626D75, v35);
    v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  if (v81)
  {
    v90 = (_QWORD *)v76;
    v91 = v81;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F738);
    v36 = sub_23922CBC8();
    v37 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v36, 0x754E6C6169726553, 0xEC0000007265626DLL, v37);
    v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  if (v6)
  {
    v90 = (_QWORD *)v77;
    v91 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F738);
    v38 = sub_23922CBC8();
    v39 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v38, 0xD000000000000016, 0x8000000239239E70, v39);
    v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  if ((v7 & 1) == 0)
  {
    v90 = (_QWORD *)v72;
    LOBYTE(v91) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691F740);
    v40 = sub_23922CBC8();
    v41 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v11;
    sub_2391F5F28(v40, 0x6E6F697461636F4CLL, 0xEA00000000004449, v41);
    v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }
  LOBYTE(v90) = v83;
  sub_239217980((unsigned __int8 *)&v90);
  if ((v42 & 1) != 0)
  {
    if (v82 == 2)
      goto LABEL_27;
  }
  else
  {
    v43 = sub_23922CB68();
    v44 = v92;
    v45 = swift_isUniquelyReferenced_nonNull_native();
    v90 = (_QWORD *)v44;
    sub_2391F5F28(v43, 0x437972746E756F43, 0xEB0000000065646FLL, v45);
    v92 = (uint64_t)v90;
    swift_bridgeObjectRelease();
    if (v82 == 2)
    {
LABEL_27:
      if (!v88)
        goto LABEL_43;
      goto LABEL_31;
    }
  }
  LOBYTE(v90) = v82;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FB08);
  v46 = sub_23922CBC8();
  v47 = v92;
  v48 = swift_isUniquelyReferenced_nonNull_native();
  v90 = (_QWORD *)v47;
  sub_2391F5F28(v46, 0x6E492D746C697542, 0xE800000000000000, v48);
  v92 = (uint64_t)v90;
  swift_bridgeObjectRelease();
  if (!v88)
  {
LABEL_43:
    if (v78)
    {
      v68 = MEMORY[0x24BDAC7A8](v78);
      sub_2391F6378(v68, (void (*)(uint64_t, uint64_t, uint64_t))sub_2391F6084);
    }
    if (*(_QWORD *)(v92 + 16))
    {
      swift_bridgeObjectRetain();
      v69 = sub_23922CA00();
      swift_bridgeObjectRelease();
      v70 = swift_isUniquelyReferenced_nonNull_native();
      v90 = (_QWORD *)v11;
      sub_2391F5F28(v69, 0x7265706F72504F49, 0xEF686374614D7974, v70);
      v11 = (uint64_t)v90;
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    return v11;
  }
LABEL_31:
  v49 = *(_QWORD *)(v88 + 16);
  if (!v49)
    goto LABEL_43;
  v85 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAF0);
  swift_bridgeObjectRetain();
  v50 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v51 = 32;
  while (1)
  {
    v52 = *(unsigned __int8 *)(v21 + v51 + 4);
    v53 = *(unsigned int *)(v21 + v51);
    BYTE4(v90) = v52;
    LODWORD(v90) = v53;
    v89 = (unsigned __int16)HIDUsage.page.getter();
    v54 = (_QWORD *)sub_23922CDA8();
    swift_retain();
    swift_bridgeObjectRetain();
    result = sub_2391F5EC4(0x7355656369766544, 0xEF65676150656761);
    if ((v56 & 1) != 0)
      break;
    v54[(result >> 6) + 8] |= 1 << result;
    v57 = (_QWORD *)(v54[6] + 16 * result);
    *v57 = 0x7355656369766544;
    v57[1] = 0xEF65676150656761;
    *(_QWORD *)(v54[7] + 8 * result) = v89;
    v58 = v54[2];
    v59 = __OFADD__(v58, 1);
    v60 = v58 + 1;
    if (v59)
      goto LABEL_49;
    v54[2] = v60;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAF8);
    swift_arrayDestroy();
    swift_release();
    BYTE4(v90) = (v53 | (unint64_t)(v52 << 32)) >> 32;
    LODWORD(v90) = v53;
    HIDUsage.usage.getter();
    if ((v61 & 0x10000) == 0)
    {
      v62 = (unsigned __int16)v61;
      v63 = swift_isUniquelyReferenced_nonNull_native();
      v90 = v54;
      sub_2391FA2FC(v62, 0x7355656369766544, 0xEB00000000656761, v63);
      v54 = v90;
      swift_bridgeObjectRelease();
    }
    v21 = v88;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v50 = sub_2391FA1DC(0, v50[2] + 1, 1, v50);
    v65 = v50[2];
    v64 = v50[3];
    if (v65 >= v64 >> 1)
      v50 = sub_2391FA1DC((_QWORD *)(v64 > 1), v65 + 1, 1, v50);
    v50[2] = v65 + 1;
    v50[v65 + 4] = v54;
    v51 += 6;
    if (!--v49)
    {
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691FB00);
      v66 = sub_23922CAB4();
      swift_bridgeObjectRelease();
      v67 = swift_isUniquelyReferenced_nonNull_native();
      v90 = (_QWORD *)v85;
      sub_2391F5F28(v66, 0xD000000000000010, 0x800000023923A140, v67);
      v11 = (uint64_t)v90;
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

uint64_t sub_2391F8FA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  _QWORD v8[2];

  v0 = sub_23922CB74();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23922CB98();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_23922C9D0();
  MEMORY[0x24BDAC7A8](v6);
  sub_2391FA600(0, (unint64_t *)&qword_25691F758);
  sub_23922C9C4();
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_2391F66EC(&qword_25691F760, 255, v5, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F768);
  sub_2391F6610();
  sub_23922CC28();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5758], v0);
  return sub_23922CBA4();
}

id sub_2391F915C()
{
  uint64_t v0;

  return *(id *)(v0 + 112);
}

uint64_t HIDDeviceManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  HIDDeviceManager.init()();
  return v0;
}

uint64_t HIDDeviceManager.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  _QWORD v9[2];

  v1 = sub_23922CB74();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23922CB98();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_23922C9D0();
  MEMORY[0x24BDAC7A8](v7);
  swift_defaultActor_initialize();
  sub_2391FA600(0, (unint64_t *)&qword_25691F758);
  sub_23922C9C4();
  v9[1] = MEMORY[0x24BEE4AF8];
  sub_2391F66EC(&qword_25691F760, 255, v6, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F768);
  sub_2391F6610();
  sub_23922CC28();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5758], v1);
  *(_QWORD *)(v0 + 112) = sub_23922CBA4();
  return v0;
}

uint64_t sub_2391F9364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[16];
  uint64_t v8;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FB18);
  MEMORY[0x24BDAC7A8](v3);
  v8 = v1;
  v9 = a1;
  (*(void (**)(_BYTE *, _QWORD))(v5 + 104))(&v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x24BEE6CA0]);
  return sub_23922CB5C();
}

void sub_2391F9410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  IONotificationPortRef v10;
  IONotificationPort *v11;
  _QWORD *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  io_iterator_t notification;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FC98);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  if (!v10)
    __break(1u);
  v11 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  type metadata accessor for HIDDeviceManager.Context();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v12+ OBJC_IVAR____TtCFFC7CoreHID16HIDDeviceManager20monitorNotificationsFT16matchingCriteriaGSaVS0_22DeviceMatchingCriteria__GVs19AsyncThrowingStreamOS0_12NotificationPs5Error__U_FGVS2_12ContinuationS3_PS4____T_L_7Context_continuation, v9, v6);
  IONotificationPortSetDispatchQueue(v11, *(dispatch_queue_t *)(a2 + 112));
  swift_retain();
  sub_23922CB2C();
  v13 = *(_QWORD *)(a3 + 16);
  if (v13)
  {
    v33[0] = v6;
    v33[1] = a1;
    swift_bridgeObjectRetain();
    v14 = *(_OWORD *)(a3 + 176);
    v44 = *(_OWORD *)(a3 + 160);
    v45 = v14;
    v46 = *(_QWORD *)(a3 + 192);
    v15 = *(_OWORD *)(a3 + 112);
    v40 = *(_OWORD *)(a3 + 96);
    v41 = v15;
    v16 = *(_OWORD *)(a3 + 144);
    v42 = *(_OWORD *)(a3 + 128);
    v43 = v16;
    v17 = *(_OWORD *)(a3 + 48);
    v36 = *(_OWORD *)(a3 + 32);
    v37 = v17;
    v18 = *(_OWORD *)(a3 + 80);
    v19 = v13 - 1;
    v20 = 200;
    v38 = *(_OWORD *)(a3 + 64);
    v39 = v18;
    while (1)
    {
      sub_2391F84F8();
      v21 = (void *)sub_23922CA00();
      swift_bridgeObjectRelease();
      notification = 0;
      v22 = v21;
      v23 = IOServiceAddMatchingNotification(v11, "IOServiceFirstMatch", v22, (IOServiceMatchingCallback)sub_2391F98E8, v12, &notification);
      sub_239217BBC(v23, (uint64_t)&v35);
      if ((v35 & 0x10000000000) == 0)
      {
        v30 = v35 | ((unint64_t)BYTE4(v35) << 32);
        swift_bridgeObjectRelease();
        sub_2391F7504();
        v31 = swift_allocError();
        *(_DWORD *)v32 = v30;
        *(_BYTE *)(v32 + 4) = BYTE4(v30) & 1;
        v35 = v31;
        sub_23922CB44();
        swift_release();

        return;
      }
      sub_2391F9734(notification, (IONotificationPortRef *)v12);

      if (!v19)
        break;
      v24 = *(_OWORD *)(a3 + v20 + 144);
      v44 = *(_OWORD *)(a3 + v20 + 128);
      v45 = v24;
      v46 = *(_QWORD *)(a3 + v20 + 160);
      v25 = *(_OWORD *)(a3 + v20 + 80);
      v40 = *(_OWORD *)(a3 + v20 + 64);
      v41 = v25;
      v26 = *(_OWORD *)(a3 + v20 + 112);
      v42 = *(_OWORD *)(a3 + v20 + 96);
      v43 = v26;
      v27 = *(_OWORD *)(a3 + v20 + 16);
      v36 = *(_OWORD *)(a3 + v20);
      v29 = *(_OWORD *)(a3 + v20 + 32);
      v28 = *(_OWORD *)(a3 + v20 + 48);
      v20 += 168;
      --v19;
      v39 = v28;
      v37 = v27;
      v38 = v29;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_2391F9734(io_iterator_t a1, IONotificationPortRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  io_object_t v8;
  io_registry_entry_t v9;
  io_object_t notification[2];
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FCA0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&notification[-2] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v8 = IOIteratorNext(a1);
  if (v8)
  {
    v9 = v8;
    do
    {
      sub_239218E2C(v9, (uint64_t)notification);
      if ((v13 & 1) == 0)
      {
        v13 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25691FC98);
        sub_23922CB38();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        notification[0] = 0;
        IOServiceAddInterestNotification(a2[2], v9, "IOGeneralInterest", (IOServiceInterestCallback)sub_2391F98E4, a2, notification);
      }
      v9 = IOIteratorNext(a1);
    }
    while (v9);
  }
  return swift_release();
}

IONotificationPortRef *sub_2391F98E8(IONotificationPortRef *result, io_iterator_t a2)
{
  if (result)
    return (IONotificationPortRef *)sub_2391F9734(a2, result);
  __break(1u);
  return result;
}

uint64_t HIDDeviceManager.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t HIDDeviceManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t HIDDeviceManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t static HIDDeviceManager.== infix(_:_:)()
{
  sub_2391FA600(0, &qword_25691FB20);
  return sub_23922CBB0() & 1;
}

uint64_t sub_2391F99A4()
{
  sub_2391FA600(0, &qword_25691FB20);
  return sub_23922CBB0() & 1;
}

void HIDDeviceManager.hash(into:)()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 112);
  sub_23922CBBC();

}

uint64_t HIDDeviceManager.hashValue.getter()
{
  uint64_t v0;
  id v1;

  sub_23922CE38();
  v1 = *(id *)(v0 + 112);
  sub_23922CBBC();

  return sub_23922CE74();
}

uint64_t sub_2391F9A88()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;

  v1 = *v0;
  sub_23922CE38();
  v2 = *(id *)(v1 + 112);
  sub_23922CBBC();

  return sub_23922CE74();
}

void sub_2391F9AD8()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(*(_QWORD *)v0 + 112);
  sub_23922CBBC();

}

uint64_t sub_2391F9B20()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;

  v1 = *v0;
  sub_23922CE38();
  v2 = *(id *)(v1 + 112);
  sub_23922CBBC();

  return sub_23922CE74();
}

uint64_t sub_2391F9B6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0
     + OBJC_IVAR____TtCFFC7CoreHID16HIDDeviceManager20monitorNotificationsFT16matchingCriteriaGSaVS0_22DeviceMatchingCriteria__GVs19AsyncThrowingStreamOS0_12NotificationPs5Error__U_FGVS2_12ContinuationS3_PS4____T_L_7Context_continuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FC98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2391F9BC0(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FCB0);
  v36 = a2;
  v6 = sub_23922CD90();
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
      swift_unknownObjectRetain();
    }
    sub_23922CE38();
    sub_23922CA90();
    result = sub_23922CE74();
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

uint64_t sub_2391F9ED4(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAF0);
  v37 = a2;
  v6 = sub_23922CD90();
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
    sub_23922CE38();
    sub_23922CA90();
    result = sub_23922CE74();
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

_QWORD *sub_2391FA1DC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FCA8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FB00);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2391FA2FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2391F5EC4(a2, a3);
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
    result = (uint64_t)sub_2391FA44C();
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
  sub_2391F9ED4(result, a4 & 1);
  result = sub_2391F5EC4(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23922CDF0();
  __break(1u);
  return result;
}

void *sub_2391FA44C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAF0);
  v2 = *v0;
  v3 = sub_23922CD84();
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

void sub_2391FA5F8(uint64_t a1)
{
  uint64_t v1;

  sub_2391F9410(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2391FA600(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2391FA638(uint64_t a1, uint64_t a2)
{
  return sub_2391F66EC(&qword_25691FB28, a2, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceManager, (uint64_t)&protocol conformance descriptor for HIDDeviceManager);
}

uint64_t type metadata accessor for HIDDeviceManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HIDDeviceManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HIDDeviceManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of HIDDeviceManager.monitorNotifications(matchingCriteria:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t destroy for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 40) >= 0xEuLL)
    swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  v4 = (_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  if (v5 > 0xD)
  {
    *(_QWORD *)(a1 + 32) = *v4;
    *(_QWORD *)(a1 + 40) = v5;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v4;
  }
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
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  v10 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v10;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v5;
  v6 = a2[6];
  *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *((_QWORD *)a2 + 5);
  if (v7 == 13)
  {
    if (v8 >= 0xE)
      goto LABEL_8;
    goto LABEL_11;
  }
  if (v8 == 13)
  {
    sub_2391F6E10(a1 + 32);
    goto LABEL_11;
  }
  if (v7 >= 0xD)
  {
    if (v8 >= 0xD)
    {
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_2391F6DDC(a1 + 32);
    goto LABEL_11;
  }
  if (v8 < 0xD)
  {
LABEL_11:
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    goto LABEL_12;
  }
LABEL_8:
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
LABEL_12:
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 8);
  *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)a2 + 12);
  *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
  *(_QWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_QWORD *)(a1 + 120) = *((_QWORD *)a2 + 15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *((_QWORD *)a2 + 16);
  *(_QWORD *)(a1 + 136) = *((_QWORD *)a2 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *((_QWORD *)a2 + 18);
  *(_BYTE *)(a1 + 152) = *((_BYTE *)a2 + 152);
  *(_QWORD *)(a1 + 144) = v10;
  *(_BYTE *)(a1 + 153) = *((_BYTE *)a2 + 153);
  *(_BYTE *)(a1 + 154) = *((_BYTE *)a2 + 154);
  *(_QWORD *)(a1 + 160) = *((_QWORD *)a2 + 20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  v4 = (_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a2 + 40);
  if (v5 != 13)
  {
    if (v6 == 13)
    {
      sub_2391F6E10(a1 + 32);
    }
    else if (v5 >= 0xD)
    {
      if (v6 >= 0xD)
      {
        *(_QWORD *)(a1 + 32) = *v4;
        *(_QWORD *)(a1 + 40) = v6;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      sub_2391F6DDC(a1 + 32);
    }
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v4;
LABEL_8:
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 168))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceManager.DeviceMatchingCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 168) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 168) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceManager.DeviceMatchingCriteria()
{
  return &type metadata for HIDDeviceManager.DeviceMatchingCriteria;
}

ValueMetadata *type metadata accessor for HIDDeviceManager.DeviceMatchingCriteria.Property()
{
  return &type metadata for HIDDeviceManager.DeviceMatchingCriteria.Property;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDDeviceManager.Notification(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceManager.Notification(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_2391FAD1C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2391FAD24(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceManager.Notification()
{
  return &type metadata for HIDDeviceManager.Notification;
}

uint64_t sub_2391FAD40()
{
  return type metadata accessor for HIDDeviceManager.Context();
}

uint64_t type metadata accessor for HIDDeviceManager.Context()
{
  uint64_t result;

  result = qword_256921288;
  if (!qword_256921288)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2391FAD84()
{
  unint64_t v0;

  sub_2391FAE00();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2391FAE00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25691FC08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25691FC10);
    v0 = sub_23922CB50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25691FC08);
  }
}

void sub_2391FAE68()
{
  uint64_t v0;

  IONotificationPortDestroy(*(IONotificationPortRef *)(v0 + 16));
}

uint64_t sub_2391FAE70(uint64_t a1, io_registry_entry_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FCA0);
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 == -536870896)
  {
    result = sub_239218E2C(a2, (uint64_t)&v12);
    if ((v13 & 1) == 0)
    {
      if (a1)
      {
        v11 = v12;
        swift_retain();
        v12 = v11;
        v13 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25691FC98);
        sub_23922CB38();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t HIDUsage.page.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_2391FAF9C
                                          + 4 * aA[*(unsigned __int8 *)(v0 + 4) >> 2]))(1);
}

uint64_t sub_2391FAF9C()
{
  return 2;
}

uint64_t sub_2391FAFA4()
{
  return 3;
}

uint64_t sub_2391FAFAC()
{
  return 4;
}

uint64_t sub_2391FAFB4()
{
  return 5;
}

uint64_t sub_2391FAFBC()
{
  return 6;
}

uint64_t sub_2391FAFC4()
{
  return 7;
}

uint64_t sub_2391FAFCC()
{
  return 8;
}

uint64_t sub_2391FAFD4()
{
  return 9;
}

uint64_t sub_2391FAFDC()
{
  return 10;
}

uint64_t sub_2391FAFE4()
{
  return 11;
}

uint64_t sub_2391FAFEC()
{
  return 12;
}

uint64_t sub_2391FAFF4()
{
  return 13;
}

uint64_t sub_2391FAFFC()
{
  return 14;
}

uint64_t sub_2391FB004()
{
  return 15;
}

uint64_t sub_2391FB00C()
{
  return 17;
}

uint64_t sub_2391FB014()
{
  return 18;
}

uint64_t sub_2391FB01C()
{
  return 20;
}

uint64_t sub_2391FB024()
{
  return 32;
}

uint64_t sub_2391FB02C()
{
  return 64;
}

uint64_t sub_2391FB034()
{
  return 65;
}

uint64_t sub_2391FB03C()
{
  return 89;
}

uint64_t sub_2391FB044()
{
  return 128;
}

uint64_t sub_2391FB04C()
{
  return 129;
}

uint64_t sub_2391FB054()
{
  return 130;
}

uint64_t sub_2391FB05C()
{
  return 132;
}

uint64_t sub_2391FB064()
{
  return 133;
}

uint64_t sub_2391FB06C()
{
  return 140;
}

uint64_t sub_2391FB074()
{
  return 141;
}

uint64_t sub_2391FB07C()
{
  return 142;
}

uint64_t sub_2391FB084()
{
  return 144;
}

uint64_t sub_2391FB08C()
{
  return 145;
}

uint64_t sub_2391FB094()
{
  return 61904;
}

uint64_t sub_2391FB09C@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void *sub_2391FB0A4()
{
  return &unk_2392332F8;
}

void *sub_2391FB0B0()
{
  return &unk_2392332FA;
}

void *sub_2391FB0BC()
{
  return &unk_2392332FC;
}

void *sub_2391FB0C8()
{
  return &unk_2392332FE;
}

void *sub_2391FB0D4()
{
  return &unk_239233300;
}

void *sub_2391FB0E0()
{
  return &unk_239233302;
}

const __int16 *sub_2391FB0EC()
{
  return asc_239233304;
}

__int16 *sub_2391FB0F8()
{
  return &asc_239233304[1];
}

__int16 *sub_2391FB104()
{
  return &asc_239233304[2];
}

__int16 *sub_2391FB110()
{
  return &asc_239233304[3];
}

__int16 *sub_2391FB11C()
{
  return &asc_239233304[4];
}

void *sub_2391FB128()
{
  return &unk_23923330E;
}

void *sub_2391FB134()
{
  return &unk_239233310;
}

void *sub_2391FB140()
{
  return &unk_239233312;
}

void *sub_2391FB14C()
{
  return &unk_239233314;
}

void *sub_2391FB158()
{
  return &unk_239233316;
}

void *sub_2391FB164()
{
  return &unk_239233318;
}

void *sub_2391FB170()
{
  return &unk_23923331A;
}

const __int16 *sub_2391FB17C()
{
  return aAy;
}

__int16 *sub_2391FB188()
{
  return &aAy[1];
}

__int16 *sub_2391FB194()
{
  return &aAy[2];
}

__int16 *sub_2391FB1A0()
{
  return &aAy[3];
}

void *sub_2391FB1AC()
{
  return &unk_239233324;
}

void *sub_2391FB1B8()
{
  return &unk_239233326;
}

void *sub_2391FB1C4()
{
  return &unk_239233328;
}

void *sub_2391FB1D0()
{
  return &unk_23923332A;
}

void *sub_2391FB1DC()
{
  return &unk_23923332C;
}

void *sub_2391FB1E8()
{
  return &unk_23923332E;
}

void *sub_2391FB1F4()
{
  return &unk_239233330;
}

void *sub_2391FB200()
{
  return &unk_239233332;
}

void *sub_2391FB20C()
{
  return &unk_239233334;
}

void *sub_2391FB218()
{
  return &unk_239233336;
}

void *sub_2391FB224()
{
  return &unk_239233338;
}

void HIDUsage.usage.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_2391FB25C()
{
  char v0;

  if (v0 != 114)
    __asm { BR              X12 }
  return 0x10000;
}

uint64_t HIDUsage.GenericDesktopUsage.rawValue.getter()
{
  char *v0;

  return word_239237542[*v0];
}

uint64_t HIDUsage.SimulationControlsUsage.rawValue.getter()
{
  char *v0;

  return word_239237626[*v0];
}

uint64_t HIDUsage.VRControlsUsage.rawValue.getter()
{
  char *v0;

  return word_23923768C[*v0];
}

uint64_t HIDUsage.SportControlsUsage.rawValue.getter()
{
  char *v0;

  return word_2392376A4[*v0];
}

uint64_t HIDUsage.GameControlsUsage.rawValue.getter()
{
  char *v0;

  return word_2392376E8[*v0];
}

uint64_t HIDUsage.GenericDeviceControlsUsage.rawValue.getter()
{
  char *v0;

  return word_239237722[*v0];
}

uint64_t HIDUsage.KeyboardOrKeypadUsage.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_239203758 + 4 * word_23922F3FE[*v0]))(1);
}

uint64_t sub_239203758()
{
  return 2;
}

uint64_t sub_239203760()
{
  return 3;
}

uint64_t sub_239203768()
{
  return 4;
}

uint64_t sub_239203770()
{
  return 5;
}

uint64_t sub_239203778()
{
  return 6;
}

uint64_t sub_239203780()
{
  return 7;
}

uint64_t sub_239203788()
{
  return 8;
}

uint64_t sub_239203790()
{
  return 9;
}

uint64_t sub_239203798()
{
  return 10;
}

uint64_t sub_2392037A0()
{
  return 11;
}

uint64_t sub_2392037A8()
{
  return 12;
}

uint64_t sub_2392037B0()
{
  return 13;
}

uint64_t sub_2392037B8()
{
  return 14;
}

uint64_t sub_2392037C0()
{
  return 15;
}

uint64_t sub_2392037C8()
{
  return 16;
}

uint64_t sub_2392037D0()
{
  return 17;
}

uint64_t sub_2392037D8()
{
  return 18;
}

uint64_t sub_2392037E0()
{
  return 19;
}

uint64_t sub_2392037E8()
{
  return 20;
}

uint64_t sub_2392037F0()
{
  return 21;
}

uint64_t sub_2392037F8()
{
  return 22;
}

uint64_t sub_239203800()
{
  return 23;
}

uint64_t sub_239203808()
{
  return 24;
}

uint64_t sub_239203810()
{
  return 25;
}

uint64_t sub_239203818()
{
  return 26;
}

uint64_t sub_239203820()
{
  return 27;
}

uint64_t sub_239203828()
{
  return 28;
}

uint64_t sub_239203830()
{
  return 29;
}

uint64_t sub_239203838()
{
  return 30;
}

uint64_t sub_239203840()
{
  return 31;
}

uint64_t sub_239203848()
{
  return 32;
}

uint64_t sub_239203850()
{
  return 33;
}

uint64_t sub_239203858()
{
  return 34;
}

uint64_t sub_239203860()
{
  return 35;
}

uint64_t sub_239203868()
{
  return 36;
}

uint64_t sub_239203870()
{
  return 37;
}

uint64_t sub_239203878()
{
  return 38;
}

uint64_t sub_239203880()
{
  return 39;
}

uint64_t sub_239203888()
{
  return 40;
}

uint64_t sub_239203890()
{
  return 41;
}

uint64_t sub_239203898()
{
  return 42;
}

uint64_t sub_2392038A0()
{
  return 43;
}

uint64_t sub_2392038A8()
{
  return 44;
}

uint64_t sub_2392038B0()
{
  return 45;
}

uint64_t sub_2392038B8()
{
  return 46;
}

uint64_t sub_2392038C0()
{
  return 47;
}

uint64_t sub_2392038C8()
{
  return 48;
}

uint64_t sub_2392038D0()
{
  return 49;
}

uint64_t sub_2392038D8()
{
  return 50;
}

uint64_t sub_2392038E0()
{
  return 51;
}

uint64_t sub_2392038E8()
{
  return 52;
}

uint64_t sub_2392038F0()
{
  return 53;
}

uint64_t sub_2392038F8()
{
  return 54;
}

uint64_t sub_239203900()
{
  return 55;
}

uint64_t sub_239203908()
{
  return 56;
}

uint64_t sub_239203910()
{
  return 57;
}

uint64_t sub_239203918()
{
  return 58;
}

uint64_t sub_239203920()
{
  return 59;
}

uint64_t sub_239203928()
{
  return 60;
}

uint64_t sub_239203930()
{
  return 61;
}

uint64_t sub_239203938()
{
  return 62;
}

uint64_t sub_239203940()
{
  return 63;
}

uint64_t sub_239203948()
{
  return 64;
}

uint64_t sub_239203950()
{
  return 65;
}

uint64_t sub_239203958()
{
  return 66;
}

uint64_t sub_239203960()
{
  return 67;
}

uint64_t sub_239203968()
{
  return 68;
}

uint64_t sub_239203970()
{
  return 69;
}

uint64_t sub_239203978()
{
  return 70;
}

uint64_t sub_239203980()
{
  return 71;
}

uint64_t sub_239203988()
{
  return 72;
}

uint64_t sub_239203990()
{
  return 73;
}

uint64_t sub_239203998()
{
  return 74;
}

uint64_t sub_2392039A0()
{
  return 75;
}

uint64_t sub_2392039A8()
{
  return 76;
}

uint64_t sub_2392039B0()
{
  return 77;
}

uint64_t sub_2392039B8()
{
  return 78;
}

uint64_t sub_2392039C0()
{
  return 79;
}

uint64_t sub_2392039C8()
{
  return 80;
}

uint64_t sub_2392039D0()
{
  return 81;
}

uint64_t sub_2392039D8()
{
  return 82;
}

uint64_t sub_2392039E0()
{
  return 83;
}

uint64_t sub_2392039E8()
{
  return 84;
}

uint64_t sub_2392039F0()
{
  return 85;
}

uint64_t sub_2392039F8()
{
  return 86;
}

uint64_t sub_239203A00()
{
  return 87;
}

uint64_t sub_239203A08()
{
  return 88;
}

uint64_t sub_239203A10()
{
  return 89;
}

uint64_t sub_239203A18()
{
  return 90;
}

uint64_t sub_239203A20()
{
  return 91;
}

uint64_t sub_239203A28()
{
  return 92;
}

uint64_t sub_239203A30()
{
  return 93;
}

uint64_t sub_239203A38()
{
  return 94;
}

uint64_t sub_239203A40()
{
  return 95;
}

uint64_t sub_239203A48()
{
  return 96;
}

uint64_t sub_239203A50()
{
  return 97;
}

uint64_t sub_239203A58()
{
  return 98;
}

uint64_t sub_239203A60()
{
  return 99;
}

uint64_t sub_239203A68()
{
  return 100;
}

uint64_t sub_239203A70()
{
  return 101;
}

uint64_t sub_239203A78()
{
  return 102;
}

uint64_t sub_239203A80()
{
  return 103;
}

uint64_t sub_239203A88()
{
  return 104;
}

uint64_t sub_239203A90()
{
  return 105;
}

uint64_t sub_239203A98()
{
  return 106;
}

uint64_t sub_239203AA0()
{
  return 107;
}

uint64_t sub_239203AA8()
{
  return 108;
}

uint64_t sub_239203AB0()
{
  return 109;
}

uint64_t sub_239203AB8()
{
  return 110;
}

uint64_t sub_239203AC0()
{
  return 111;
}

uint64_t sub_239203AC8()
{
  return 112;
}

uint64_t sub_239203AD0()
{
  return 113;
}

uint64_t sub_239203AD8()
{
  return 114;
}

uint64_t sub_239203AE0()
{
  return 115;
}

uint64_t sub_239203AE8()
{
  return 116;
}

uint64_t sub_239203AF0()
{
  return 117;
}

uint64_t sub_239203AF8()
{
  return 118;
}

uint64_t sub_239203B00()
{
  return 119;
}

uint64_t sub_239203B08()
{
  return 120;
}

uint64_t sub_239203B10()
{
  return 121;
}

uint64_t sub_239203B18()
{
  return 122;
}

uint64_t sub_239203B20()
{
  return 123;
}

uint64_t sub_239203B28()
{
  return 124;
}

uint64_t sub_239203B30()
{
  return 125;
}

uint64_t sub_239203B38()
{
  return 126;
}

uint64_t sub_239203B40()
{
  return 127;
}

uint64_t sub_239203B48()
{
  return 128;
}

uint64_t sub_239203B50()
{
  return 129;
}

uint64_t sub_239203B58()
{
  return 130;
}

uint64_t sub_239203B60()
{
  return 131;
}

uint64_t sub_239203B68()
{
  return 132;
}

uint64_t sub_239203B70()
{
  return 133;
}

uint64_t sub_239203B78()
{
  return 134;
}

uint64_t sub_239203B80()
{
  return 135;
}

uint64_t sub_239203B88()
{
  return 136;
}

uint64_t sub_239203B90()
{
  return 137;
}

uint64_t sub_239203B98()
{
  return 138;
}

uint64_t sub_239203BA0()
{
  return 139;
}

uint64_t sub_239203BA8()
{
  return 140;
}

uint64_t sub_239203BB0()
{
  return 141;
}

uint64_t sub_239203BB8()
{
  return 142;
}

uint64_t sub_239203BC0()
{
  return 143;
}

uint64_t sub_239203BC8()
{
  return 144;
}

uint64_t sub_239203BD0()
{
  return 145;
}

uint64_t sub_239203BD8()
{
  return 146;
}

uint64_t sub_239203BE0()
{
  return 147;
}

uint64_t sub_239203BE8()
{
  return 148;
}

uint64_t sub_239203BF0()
{
  return 149;
}

uint64_t sub_239203BF8()
{
  return 150;
}

uint64_t sub_239203C00()
{
  return 151;
}

uint64_t sub_239203C08()
{
  return 152;
}

uint64_t sub_239203C10()
{
  return 153;
}

uint64_t sub_239203C18()
{
  return 154;
}

uint64_t sub_239203C20()
{
  return 155;
}

uint64_t sub_239203C28()
{
  return 156;
}

uint64_t sub_239203C30()
{
  return 157;
}

uint64_t sub_239203C38()
{
  return 158;
}

uint64_t sub_239203C40()
{
  return 159;
}

uint64_t sub_239203C48()
{
  return 160;
}

uint64_t sub_239203C50()
{
  return 161;
}

uint64_t sub_239203C58()
{
  return 162;
}

uint64_t sub_239203C60()
{
  return 163;
}

uint64_t sub_239203C68()
{
  return 164;
}

uint64_t sub_239203C70()
{
  return 176;
}

uint64_t sub_239203C78()
{
  return 177;
}

uint64_t sub_239203C80()
{
  return 178;
}

uint64_t sub_239203C88()
{
  return 179;
}

uint64_t sub_239203C90()
{
  return 180;
}

uint64_t sub_239203C98()
{
  return 181;
}

uint64_t sub_239203CA0()
{
  return 182;
}

uint64_t sub_239203CA8()
{
  return 183;
}

uint64_t sub_239203CB0()
{
  return 184;
}

uint64_t sub_239203CB8()
{
  return 185;
}

uint64_t sub_239203CC0()
{
  return 186;
}

uint64_t sub_239203CC8()
{
  return 187;
}

uint64_t sub_239203CD0()
{
  return 188;
}

uint64_t sub_239203CD8()
{
  return 189;
}

uint64_t sub_239203CE0()
{
  return 190;
}

uint64_t sub_239203CE8()
{
  return 191;
}

uint64_t sub_239203CF0()
{
  return 192;
}

uint64_t sub_239203CF8()
{
  return 193;
}

uint64_t sub_239203D00()
{
  return 194;
}

uint64_t sub_239203D08()
{
  return 195;
}

uint64_t sub_239203D10()
{
  return 196;
}

uint64_t sub_239203D18()
{
  return 197;
}

uint64_t sub_239203D20()
{
  return 198;
}

uint64_t sub_239203D28()
{
  return 199;
}

uint64_t sub_239203D30()
{
  return 200;
}

uint64_t sub_239203D38()
{
  return 201;
}

uint64_t sub_239203D40()
{
  return 202;
}

uint64_t sub_239203D48()
{
  return 203;
}

uint64_t sub_239203D50()
{
  return 204;
}

uint64_t sub_239203D58()
{
  return 205;
}

uint64_t sub_239203D60()
{
  return 206;
}

uint64_t sub_239203D68()
{
  return 207;
}

uint64_t sub_239203D70()
{
  return 208;
}

uint64_t sub_239203D78()
{
  return 209;
}

uint64_t sub_239203D80()
{
  return 210;
}

uint64_t sub_239203D88()
{
  return 211;
}

uint64_t sub_239203D90()
{
  return 212;
}

uint64_t sub_239203D98()
{
  return 213;
}

uint64_t sub_239203DA0()
{
  return 214;
}

uint64_t sub_239203DA8()
{
  return 215;
}

uint64_t sub_239203DB0()
{
  return 216;
}

uint64_t sub_239203DB8()
{
  return 217;
}

uint64_t sub_239203DC0()
{
  return 218;
}

uint64_t sub_239203DC8()
{
  return 219;
}

uint64_t sub_239203DD0()
{
  return 220;
}

uint64_t sub_239203DD8()
{
  return 221;
}

uint64_t sub_239203DE0()
{
  return 224;
}

uint64_t sub_239203DE8()
{
  return 225;
}

uint64_t sub_239203DF0()
{
  return 226;
}

uint64_t sub_239203DF8()
{
  return 227;
}

uint64_t sub_239203E00()
{
  return 228;
}

uint64_t sub_239203E08()
{
  return 229;
}

uint64_t sub_239203E10()
{
  return 230;
}

uint64_t sub_239203E18()
{
  return 231;
}

uint64_t HIDUsage.LEDUsage.rawValue.getter()
{
  char *v0;

  return word_239237752[*v0];
}

uint64_t HIDUsage.TelephonyDeviceUsage.rawValue.getter()
{
  char *v0;

  return word_239237812[*v0];
}

uint64_t HIDUsage.ConsumerUsage.rawValue.getter()
{
  __int16 *v0;

  return word_2392378D8[*v0];
}

uint64_t HIDUsage.DigitizersUsage.rawValue.getter()
{
  char *v0;

  return word_239237C5C[*v0];
}

uint64_t HIDUsage.HapticsUsage.rawValue.getter()
{
  char *v0;

  return word_239237D34[*v0];
}

uint64_t HIDUsage.PhysicalInputDeviceUsage.rawValue.getter()
{
  char *v0;

  return word_239237D6E[*v0];
}

uint64_t HIDUsage.EyeAndHeadTrackersUsage.rawValue.getter()
{
  char *v0;

  return word_239237E40[*v0];
}

uint64_t HIDUsage.AuxiliaryDisplayUsage.rawValue.getter()
{
  char *v0;

  return word_239237E84[*v0];
}

uint64_t HIDUsage.SensorsUsage.rawValue.getter()
{
  __int16 *v0;

  return word_239237F1A[*v0];
}

uint64_t HIDUsage.MedicalInstrumentUsage.rawValue.getter()
{
  char *v0;

  return word_23923844C[*v0];
}

uint64_t HIDUsage.BrailleDisplayUsage.rawValue.getter()
{
  char *v0;

  return word_239238486[*v0];
}

uint64_t HIDUsage.LightingAndIlluminationUsage.rawValue.getter()
{
  char *v0;

  return word_2392384DC[*v0];
}

uint64_t HIDUsage.MonitorUsage.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

uint64_t HIDUsage.VESAVirtualControlsUsage.rawValue.getter()
{
  char *v0;

  return word_23923851E[*v0];
}

uint64_t HIDUsage.PowerUsage.rawValue.getter()
{
  char *v0;

  return word_239238578[*v0];
}

uint64_t HIDUsage.BatterySystemUsage.rawValue.getter()
{
  char *v0;

  return word_239238612[*v0];
}

uint64_t HIDUsage.BarcodeScannerUsage.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_239203F78 + 4 * word_23922F5B2[*v0]))(1);
}

uint64_t sub_239203F78()
{
  return 2;
}

uint64_t sub_239203F80()
{
  return 3;
}

uint64_t sub_239203F88()
{
  return 4;
}

uint64_t sub_239203F90()
{
  return 5;
}

uint64_t sub_239203F98()
{
  return 16;
}

uint64_t sub_239203FA0()
{
  return 17;
}

uint64_t sub_239203FA8()
{
  return 18;
}

uint64_t sub_239203FB0()
{
  return 19;
}

uint64_t sub_239203FB8()
{
  return 20;
}

uint64_t sub_239203FC0()
{
  return 21;
}

uint64_t sub_239203FC8()
{
  return 22;
}

uint64_t sub_239203FD0()
{
  return 23;
}

uint64_t sub_239203FD8()
{
  return 24;
}

uint64_t sub_239203FE0()
{
  return 25;
}

uint64_t sub_239203FE8()
{
  return 26;
}

uint64_t sub_239203FF0()
{
  return 27;
}

uint64_t sub_239203FF8()
{
  return 28;
}

uint64_t sub_239204000()
{
  return 29;
}

uint64_t sub_239204008()
{
  return 30;
}

uint64_t sub_239204010()
{
  return 31;
}

uint64_t sub_239204018()
{
  return 48;
}

uint64_t sub_239204020()
{
  return 49;
}

uint64_t sub_239204028()
{
  return 50;
}

uint64_t sub_239204030()
{
  return 51;
}

uint64_t sub_239204038()
{
  return 52;
}

uint64_t sub_239204040()
{
  return 53;
}

uint64_t sub_239204048()
{
  return 54;
}

uint64_t sub_239204050()
{
  return 55;
}

uint64_t sub_239204058()
{
  return 56;
}

uint64_t sub_239204060()
{
  return 57;
}

uint64_t sub_239204068()
{
  return 58;
}

uint64_t sub_239204070()
{
  return 59;
}

uint64_t sub_239204078()
{
  return 60;
}

uint64_t sub_239204080()
{
  return 61;
}

uint64_t sub_239204088()
{
  return 62;
}

uint64_t sub_239204090()
{
  return 63;
}

uint64_t sub_239204098()
{
  return 64;
}

uint64_t sub_2392040A0()
{
  return 65;
}

uint64_t sub_2392040A8()
{
  return 66;
}

uint64_t sub_2392040B0()
{
  return 67;
}

uint64_t sub_2392040B8()
{
  return 68;
}

uint64_t sub_2392040C0()
{
  return 69;
}

uint64_t sub_2392040C8()
{
  return 70;
}

uint64_t sub_2392040D0()
{
  return 77;
}

uint64_t sub_2392040D8()
{
  return 78;
}

uint64_t sub_2392040E0()
{
  return 79;
}

uint64_t sub_2392040E8()
{
  return 80;
}

uint64_t sub_2392040F0()
{
  return 81;
}

uint64_t sub_2392040F8()
{
  return 82;
}

uint64_t sub_239204100()
{
  return 85;
}

uint64_t sub_239204108()
{
  return 86;
}

uint64_t sub_239204110()
{
  return 87;
}

uint64_t sub_239204118()
{
  return 88;
}

uint64_t sub_239204120()
{
  return 89;
}

uint64_t sub_239204128()
{
  return 90;
}

uint64_t sub_239204130()
{
  return 91;
}

uint64_t sub_239204138()
{
  return 92;
}

uint64_t sub_239204140()
{
  return 93;
}

uint64_t sub_239204148()
{
  return 94;
}

uint64_t sub_239204150()
{
  return 95;
}

uint64_t sub_239204158()
{
  return 96;
}

uint64_t sub_239204160()
{
  return 97;
}

uint64_t sub_239204168()
{
  return 98;
}

uint64_t sub_239204170()
{
  return 99;
}

uint64_t sub_239204178()
{
  return 100;
}

uint64_t sub_239204180()
{
  return 101;
}

uint64_t sub_239204188()
{
  return 102;
}

uint64_t sub_239204190()
{
  return 109;
}

uint64_t sub_239204198()
{
  return 110;
}

uint64_t sub_2392041A0()
{
  return 111;
}

uint64_t sub_2392041A8()
{
  return 112;
}

uint64_t sub_2392041B0()
{
  return 117;
}

uint64_t sub_2392041B8()
{
  return 118;
}

uint64_t sub_2392041C0()
{
  return 122;
}

uint64_t sub_2392041C8()
{
  return 123;
}

uint64_t sub_2392041D0()
{
  return 124;
}

uint64_t sub_2392041D8()
{
  return 125;
}

uint64_t sub_2392041E0()
{
  return 126;
}

uint64_t sub_2392041E8()
{
  return 127;
}

uint64_t sub_2392041F0()
{
  return 128;
}

uint64_t sub_2392041F8()
{
  return 130;
}

uint64_t sub_239204200()
{
  return 131;
}

uint64_t sub_239204208()
{
  return 132;
}

uint64_t sub_239204210()
{
  return 133;
}

uint64_t sub_239204218()
{
  return 134;
}

uint64_t sub_239204220()
{
  return 135;
}

uint64_t sub_239204228()
{
  return 136;
}

uint64_t sub_239204230()
{
  return 137;
}

uint64_t sub_239204238()
{
  return 138;
}

uint64_t sub_239204240()
{
  return 139;
}

uint64_t sub_239204248()
{
  return 145;
}

uint64_t sub_239204250()
{
  return 146;
}

uint64_t sub_239204258()
{
  return 147;
}

uint64_t sub_239204260()
{
  return 148;
}

uint64_t sub_239204268()
{
  return 149;
}

uint64_t sub_239204270()
{
  return 150;
}

uint64_t sub_239204278()
{
  return 151;
}

uint64_t sub_239204280()
{
  return 152;
}

uint64_t sub_239204288()
{
  return 153;
}

uint64_t sub_239204290()
{
  return 154;
}

uint64_t sub_239204298()
{
  return 155;
}

uint64_t sub_2392042A0()
{
  return 156;
}

uint64_t sub_2392042A8()
{
  return 157;
}

uint64_t sub_2392042B0()
{
  return 158;
}

uint64_t sub_2392042B8()
{
  return 159;
}

uint64_t sub_2392042C0()
{
  return 160;
}

uint64_t sub_2392042C8()
{
  return 161;
}

uint64_t sub_2392042D0()
{
  return 162;
}

uint64_t sub_2392042D8()
{
  return 169;
}

uint64_t sub_2392042E0()
{
  return 170;
}

uint64_t sub_2392042E8()
{
  return 171;
}

uint64_t sub_2392042F0()
{
  return 172;
}

uint64_t sub_2392042F8()
{
  return 173;
}

uint64_t sub_239204300()
{
  return 174;
}

uint64_t sub_239204308()
{
  return 175;
}

uint64_t sub_239204310()
{
  return 176;
}

uint64_t sub_239204318()
{
  return 177;
}

uint64_t sub_239204320()
{
  return 178;
}

uint64_t sub_239204328()
{
  return 179;
}

uint64_t sub_239204330()
{
  return 180;
}

uint64_t sub_239204338()
{
  return 181;
}

uint64_t sub_239204340()
{
  return 183;
}

uint64_t sub_239204348()
{
  return 184;
}

uint64_t sub_239204350()
{
  return 185;
}

uint64_t sub_239204358()
{
  return 186;
}

uint64_t sub_239204360()
{
  return 187;
}

uint64_t sub_239204368()
{
  return 188;
}

uint64_t sub_239204370()
{
  return 189;
}

uint64_t sub_239204378()
{
  return 190;
}

uint64_t sub_239204380()
{
  return 191;
}

uint64_t sub_239204388()
{
  return 192;
}

uint64_t sub_239204390()
{
  return 195;
}

uint64_t sub_239204398()
{
  return 196;
}

uint64_t sub_2392043A0()
{
  return 199;
}

uint64_t sub_2392043A8()
{
  return 200;
}

uint64_t sub_2392043B0()
{
  return 201;
}

uint64_t sub_2392043B8()
{
  return 202;
}

uint64_t sub_2392043C0()
{
  return 203;
}

uint64_t sub_2392043C8()
{
  return 204;
}

uint64_t sub_2392043D0()
{
  return 205;
}

uint64_t sub_2392043D8()
{
  return 206;
}

uint64_t sub_2392043E0()
{
  return 211;
}

uint64_t sub_2392043E8()
{
  return 212;
}

uint64_t sub_2392043F0()
{
  return 213;
}

uint64_t sub_2392043F8()
{
  return 214;
}

uint64_t sub_239204400()
{
  return 215;
}

uint64_t sub_239204408()
{
  return 216;
}

uint64_t sub_239204410()
{
  return 217;
}

uint64_t sub_239204418()
{
  return 218;
}

uint64_t sub_239204420()
{
  return 219;
}

uint64_t sub_239204428()
{
  return 220;
}

uint64_t sub_239204430()
{
  return 221;
}

uint64_t sub_239204438()
{
  return 222;
}

uint64_t sub_239204440()
{
  return 223;
}

uint64_t sub_239204448()
{
  return 240;
}

uint64_t sub_239204450()
{
  return 241;
}

uint64_t sub_239204458()
{
  return 242;
}

uint64_t sub_239204460()
{
  return 251;
}

uint64_t sub_239204468()
{
  return 252;
}

uint64_t sub_239204470()
{
  return 253;
}

uint64_t sub_239204478()
{
  return 254;
}

uint64_t sub_239204480()
{
  return 255;
}

uint64_t sub_239204488()
{
  return 256;
}

uint64_t sub_239204490()
{
  return 257;
}

uint64_t sub_239204498()
{
  return 258;
}

uint64_t sub_2392044A0()
{
  return 259;
}

uint64_t sub_2392044A8()
{
  return 260;
}

uint64_t sub_2392044B0()
{
  return 262;
}

uint64_t sub_2392044B8()
{
  return 263;
}

uint64_t sub_2392044C0()
{
  return 264;
}

uint64_t sub_2392044C8()
{
  return 265;
}

uint64_t sub_2392044D0()
{
  return 266;
}

uint64_t sub_2392044D8()
{
  return 267;
}

uint64_t sub_2392044E0()
{
  return 268;
}

uint64_t sub_2392044E8()
{
  return 269;
}

uint64_t sub_2392044F0()
{
  return 272;
}

uint64_t sub_2392044F8()
{
  return 273;
}

uint64_t sub_239204500()
{
  return 274;
}

uint64_t sub_239204508()
{
  return 275;
}

uint64_t sub_239204510()
{
  return 276;
}

uint64_t sub_239204518()
{
  return 277;
}

uint64_t sub_239204520()
{
  return 278;
}

uint64_t sub_239204528()
{
  return 279;
}

uint64_t sub_239204530()
{
  return 280;
}

uint64_t sub_239204538()
{
  return 281;
}

uint64_t sub_239204540()
{
  return 282;
}

uint64_t sub_239204548()
{
  return 283;
}

uint64_t sub_239204550()
{
  return 284;
}

uint64_t sub_239204558()
{
  return 285;
}

uint64_t sub_239204560()
{
  return 286;
}

uint64_t sub_239204568()
{
  return 287;
}

uint64_t sub_239204570()
{
  return 288;
}

uint64_t sub_239204578()
{
  return 289;
}

uint64_t HIDUsage.ScalesUsage.rawValue.getter()
{
  char *v0;

  return word_2392386C8[*v0];
}

uint64_t HIDUsage.MagneticStripeReaderUsage.rawValue.getter()
{
  char *v0;

  return word_239238724[*v0];
}

uint64_t HIDUsage.CameraControlUsage.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 33;
  else
    return 32;
}

uint64_t HIDUsage.ArcadeUsage.rawValue.getter()
{
  char *v0;

  return word_239238738[*v0];
}

unint64_t HIDUsage.FIDOAllianceUsage.rawValue.getter()
{
  _BYTE *v0;

  return 0x2100200001uLL >> (16 * *v0);
}

char HIDUsage.init(page:usage:)@<W0>(int rawValue@<W1>, uint64_t a2@<X0>, uint64_t a3@<X8>)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned __int16 v18;

  v5 = rawValue & 0x10000;
  switch((__int16)a2)
  {
    case 1:
      if ((_DWORD)v5)
      {
        v6 = 114;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.GenericDesktopUsage.init(rawValue:)(rawValue);
        v6 = v18;
        if (v18 == 114)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) - 1;
      }
      goto LABEL_155;
    case 2:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.SimulationControlsUsage.init(rawValue:)(rawValue);
        v10 = v18 == 51;
        v6 = v18 | 0x400000000;
        v11 = (rawValue << 16);
        v12 = 0xFFFFFF8400000002;
        goto LABEL_109;
      }
      v6 = 0x400000033;
      goto LABEL_155;
    case 3:
      if ((_DWORD)v5)
      {
        v6 = 0x80000000CLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.VRControlsUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x800000000;
        if (v18 == 12)
          v6 = (rawValue << 16) | 0xFFFFFF8400000003;
      }
      goto LABEL_155;
    case 4:
      if ((_DWORD)v5)
      {
        v6 = 0xC00000022;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.SportControlsUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0xC00000000;
        if (v18 == 34)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 2;
      }
      goto LABEL_155;
    case 5:
      if ((_DWORD)v5)
      {
        v6 = 0x100000001DLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.GameControlsUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x1000000000;
        if (v18 == 29)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 3;
      }
      goto LABEL_155;
    case 6:
      if ((_DWORD)v5)
      {
        v6 = 0x1400000018;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.GenericDeviceControlsUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x1400000000;
        if (v18 == 24)
          v6 = (rawValue << 16) | 0xFFFFFF8400000006;
      }
      goto LABEL_155;
    case 7:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.KeyboardOrKeypadUsage.init(rawValue:)(rawValue);
        v10 = v18 == 218;
        v6 = v18 | 0x1800000000;
        v11 = (rawValue << 16);
        v13 = 5;
        goto LABEL_108;
      }
      v6 = 0x18000000DALL;
      goto LABEL_155;
    case 8:
      if ((_DWORD)v5)
      {
        v6 = 0x1C00000060;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.LEDUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x1C00000000;
        if (v18 == 96)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 6;
      }
      goto LABEL_155;
    case 9:
      v6 = rawValue & 0x1FFFF | 0x2000000000;
      goto LABEL_155;
    case 10:
      v6 = rawValue & 0x1FFFF | 0x2400000000;
      goto LABEL_155;
    case 11:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.TelephonyDeviceUsage.init(rawValue:)(rawValue);
        v10 = v18 == 99;
        v6 = v18 | 0x2800000000;
        v11 = (rawValue << 16);
        v13 = 9;
        goto LABEL_108;
      }
      v6 = 0x2800000063;
      goto LABEL_155;
    case 12:
      if ((_DWORD)v5)
      {
        v6 = 0x2C000001C2;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.ConsumerUsage.init(rawValue:)(rawValue).value;
        v6 = v18 | 0x2C00000000;
        if (v18 == 450)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 10;
      }
      goto LABEL_155;
    case 13:
      if ((_DWORD)v5)
      {
        v6 = 0x300000006CLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.DigitizersUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x3000000000;
        if (v18 == 108)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 11;
      }
      goto LABEL_155;
    case 14:
      if ((_DWORD)v5)
      {
        v6 = 0x340000001DLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.HapticsUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x3400000000;
        if (v18 == 29)
          v6 = (rawValue << 16) | 0xFFFFFF840000000ELL;
      }
      goto LABEL_155;
    case 15:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.PhysicalInputDeviceUsage.init(rawValue:)(rawValue);
        v10 = v18 == 105;
        v6 = v18 | 0x3800000000;
        v11 = (rawValue << 16);
        v13 = 13;
        goto LABEL_108;
      }
      v6 = 0x3800000069;
      goto LABEL_155;
    case 16:
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 131:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 143:
      goto LABEL_14;
    case 17:
      v6 = 0x3C0000000ALL;
      v9 = ((rawValue << 16) | 0xFFFFFF8400000002) + 15;
      if ((unsigned __int16)(rawValue - 1) < 0xAu)
        v9 = (rawValue - 1) | 0x3C00000000;
      goto LABEL_59;
    case 18:
      if ((_DWORD)v5)
      {
        v6 = 0x4000000022;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.EyeAndHeadTrackersUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x4000000000;
        if (v18 == 34)
          v6 = (rawValue << 16) | 0xFFFFFF8400000012;
      }
      goto LABEL_155;
    case 20:
      if ((_DWORD)v5)
      {
        v6 = 0x440000004BLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.AuxiliaryDisplayUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x4400000000;
        if (v18 == 75)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 18;
      }
      goto LABEL_155;
    case 32:
      if ((_DWORD)v5)
      {
        v6 = 0x4800000299;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.SensorsUsage.init(rawValue:)(rawValue).value;
        v6 = v18 | 0x4800000000;
        if (v18 == 665)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 30;
      }
      goto LABEL_155;
    case 64:
      if ((_DWORD)v5)
      {
        v6 = 0x4C0000001DLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.MedicalInstrumentUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x4C00000000;
        if (v18 == 29)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 62;
      }
      goto LABEL_155;
    case 65:
      if ((_DWORD)v5)
      {
        v6 = 0x500000002BLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.BrailleDisplayUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x5000000000;
        if (v18 == 43)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 63;
      }
      goto LABEL_155;
    case 89:
      if ((_DWORD)v5)
      {
        v6 = 0x5400000021;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.LightingAndIlluminationUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x5400000000;
        if (v18 == 33)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 87;
      }
      goto LABEL_155;
    case 128:
      v6 = 0x5800000001;
      if ((_DWORD)v5)
      {
        v6 = 0x5800000004;
      }
      else
      {
        switch((__int16)rawValue)
        {
          case 1:
            v6 = 0x5800000000;
            break;
          case 2:
            goto LABEL_155;
          case 3:
            v6 = 0x5800000002;
            break;
          case 4:
            v6 = 0x5800000003;
            break;
          default:
            v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 126;
            break;
        }
      }
      goto LABEL_155;
    case 129:
      v6 = rawValue & 0x1FFFF | 0x5C00000000;
      goto LABEL_155;
    case 130:
      if ((_DWORD)v5)
      {
        v6 = 0x600000002DLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.VESAVirtualControlsUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x6000000000;
        if (v18 == 45)
          v6 = (rawValue << 16) | 0xFFFFFF8400000082;
      }
      goto LABEL_155;
    case 132:
      if ((_DWORD)v5)
      {
        v6 = 0x640000004DLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.PowerUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x6400000000;
        if (v18 == 77)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 130;
      }
      goto LABEL_155;
    case 133:
      if ((_DWORD)v5)
      {
        v6 = 0x680000005BLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.BatterySystemUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x6800000000;
        if (v18 == 91)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 131;
      }
      goto LABEL_155;
    case 140:
      if ((_DWORD)v5)
      {
        v6 = 0x6C000000C2;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.BarcodeScannerUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x6C00000000;
        if (v18 == 194)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 138;
      }
      goto LABEL_155;
    case 141:
      if ((_DWORD)v5)
      {
        v6 = 0x700000002ELL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.ScalesUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x7000000000;
        if (v18 == 46)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 139;
      }
      goto LABEL_155;
    case 142:
      if ((_DWORD)v5)
      {
        v6 = 0x740000000ALL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.MagneticStripeReaderUsage.init(rawValue:)(rawValue);
        v10 = v18 == 10;
        v6 = v18 | 0x7400000000;
        v11 = (rawValue << 16);
        v13 = 140;
LABEL_108:
        v12 = v13 | 0xFFFFFF8400000002;
LABEL_109:
        v14 = v11 | v12;
        if (v10)
          v6 = v14;
      }
      goto LABEL_155;
    case 144:
      v15 = ((rawValue << 16) | 0xFFFFFF8400000002) + 142;
      if ((unsigned __int16)rawValue == 33)
        v15 = 0x7800000001;
      if ((unsigned __int16)rawValue == 32)
        v16 = 0x7800000000;
      else
        v16 = v15;
      if ((_DWORD)v5)
        v6 = 0x7800000002;
      else
        v6 = v16;
      goto LABEL_155;
    case 145:
      if ((_DWORD)v5)
      {
        v6 = 0x7C0000001BLL;
      }
      else
      {
        LOBYTE(a2) = HIDUsage.ArcadeUsage.init(rawValue:)(rawValue);
        v6 = v18 | 0x7C00000000;
        if (v18 == 27)
          v6 = ((rawValue << 16) | 0xFFFFFF8400000002) + 143;
      }
      goto LABEL_155;
    default:
      if ((unsigned __int16)a2 == 61904)
      {
        v6 = 0x8000000003;
        v7 = 0x8000000001;
        v8 = (rawValue << 16) | 0xFFFFFF840000F1D0;
        if ((unsigned __int16)rawValue == 33)
          v8 = 0x8000000002;
        if ((unsigned __int16)rawValue != 32)
          v7 = v8;
        if ((unsigned __int16)rawValue == 1)
          v9 = 0x8000000000;
        else
          v9 = v7;
LABEL_59:
        if (!(_DWORD)v5)
          v6 = v9;
      }
      else
      {
LABEL_14:
        a2 = (unsigned __int16)a2 | ((unsigned __int16)rawValue << 16);
        v6 = (a2 | (v5 << 16)) - 0x7C00000000;
      }
LABEL_155:
      *(_DWORD *)a3 = v6;
      *(_BYTE *)(a3 + 4) = BYTE4(v6);
      return a2;
  }
}

CoreHID::HIDUsage::GenericDesktopUsage_optional __swiftcall HIDUsage.GenericDesktopUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 96;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_98;
    case 2u:
      v2 = 1;
      goto LABEL_98;
    case 4u:
      v2 = 2;
      goto LABEL_98;
    case 5u:
      v2 = 3;
      goto LABEL_98;
    case 6u:
      v2 = 4;
      goto LABEL_98;
    case 7u:
      v2 = 5;
      goto LABEL_98;
    case 8u:
      v2 = 6;
      goto LABEL_98;
    case 9u:
      v2 = 7;
      goto LABEL_98;
    case 0xAu:
      v2 = 8;
      goto LABEL_98;
    case 0xBu:
      v2 = 9;
      goto LABEL_98;
    case 0xCu:
      v2 = 10;
      goto LABEL_98;
    case 0xDu:
      v2 = 11;
      goto LABEL_98;
    case 0xEu:
      v2 = 12;
      goto LABEL_98;
    case 0xFu:
      v2 = 13;
      goto LABEL_98;
    case 0x10u:
      v2 = 14;
      goto LABEL_98;
    case 0x11u:
      v2 = 15;
      goto LABEL_98;
    case 0x12u:
      v2 = 16;
      goto LABEL_98;
    case 0x13u:
      v2 = 17;
      goto LABEL_98;
    case 0x30u:
      v2 = 18;
      goto LABEL_98;
    case 0x31u:
      v2 = 19;
      goto LABEL_98;
    case 0x32u:
      v2 = 20;
      goto LABEL_98;
    case 0x33u:
      v2 = 21;
      goto LABEL_98;
    case 0x34u:
      v2 = 22;
      goto LABEL_98;
    case 0x35u:
      v2 = 23;
      goto LABEL_98;
    case 0x36u:
      v2 = 24;
      goto LABEL_98;
    case 0x37u:
      v2 = 25;
      goto LABEL_98;
    case 0x38u:
      v2 = 26;
      goto LABEL_98;
    case 0x39u:
      v2 = 27;
      goto LABEL_98;
    case 0x3Au:
      v2 = 28;
      goto LABEL_98;
    case 0x3Bu:
      v2 = 29;
      goto LABEL_98;
    case 0x3Cu:
      v2 = 30;
      goto LABEL_98;
    case 0x3Du:
      v2 = 31;
      goto LABEL_98;
    case 0x3Eu:
      v2 = 32;
      goto LABEL_98;
    case 0x40u:
      v2 = 33;
      goto LABEL_98;
    case 0x41u:
      v2 = 34;
      goto LABEL_98;
    case 0x42u:
      v2 = 35;
      goto LABEL_98;
    case 0x43u:
      v2 = 36;
      goto LABEL_98;
    case 0x44u:
      v2 = 37;
      goto LABEL_98;
    case 0x45u:
      v2 = 38;
      goto LABEL_98;
    case 0x46u:
      v2 = 39;
      goto LABEL_98;
    case 0x47u:
      v2 = 40;
      goto LABEL_98;
    case 0x48u:
      v2 = 41;
      goto LABEL_98;
    case 0x49u:
      v2 = 42;
      goto LABEL_98;
    case 0x4Au:
      v2 = 43;
      goto LABEL_98;
    case 0x4Bu:
      v2 = 44;
      goto LABEL_98;
    case 0x4Cu:
      v2 = 45;
      goto LABEL_98;
    case 0x80u:
      v2 = 46;
      goto LABEL_98;
    case 0x81u:
      v2 = 47;
      goto LABEL_98;
    case 0x82u:
      v2 = 48;
      goto LABEL_98;
    case 0x83u:
      v2 = 49;
      goto LABEL_98;
    case 0x84u:
      v2 = 50;
      goto LABEL_98;
    case 0x85u:
      v2 = 51;
      goto LABEL_98;
    case 0x86u:
      v2 = 52;
      goto LABEL_98;
    case 0x87u:
      v2 = 53;
      goto LABEL_98;
    case 0x88u:
      v2 = 54;
      goto LABEL_98;
    case 0x89u:
      v2 = 55;
      goto LABEL_98;
    case 0x8Au:
      v2 = 56;
      goto LABEL_98;
    case 0x8Bu:
      v2 = 57;
      goto LABEL_98;
    case 0x8Cu:
      v2 = 58;
      goto LABEL_98;
    case 0x8Du:
      v2 = 59;
      goto LABEL_98;
    case 0x8Eu:
      v2 = 60;
      goto LABEL_98;
    case 0x8Fu:
      v2 = 61;
      goto LABEL_98;
    case 0x90u:
      v2 = 62;
      goto LABEL_98;
    case 0x91u:
      v2 = 63;
      goto LABEL_98;
    case 0x92u:
      v2 = 64;
      goto LABEL_98;
    case 0x93u:
      v2 = 65;
      goto LABEL_98;
    case 0x94u:
      v2 = 66;
      goto LABEL_98;
    case 0x95u:
      v2 = 67;
      goto LABEL_98;
    case 0x96u:
      v2 = 68;
      goto LABEL_98;
    case 0x97u:
      v2 = 69;
      goto LABEL_98;
    case 0x98u:
      v2 = 70;
      goto LABEL_98;
    case 0x99u:
      v2 = 71;
      goto LABEL_98;
    case 0x9Au:
      v2 = 72;
      goto LABEL_98;
    case 0x9Bu:
      v2 = 73;
      goto LABEL_98;
    case 0xA0u:
      v2 = 74;
      goto LABEL_98;
    case 0xA1u:
      v2 = 75;
      goto LABEL_98;
    case 0xA2u:
      v2 = 76;
      goto LABEL_98;
    case 0xA3u:
      v2 = 77;
      goto LABEL_98;
    case 0xA4u:
      v2 = 78;
      goto LABEL_98;
    case 0xA5u:
      v2 = 79;
      goto LABEL_98;
    case 0xA6u:
      v2 = 80;
      goto LABEL_98;
    case 0xA7u:
      v2 = 81;
      goto LABEL_98;
    case 0xA8u:
      v2 = 82;
      goto LABEL_98;
    case 0xA9u:
      v2 = 83;
      goto LABEL_98;
    case 0xB0u:
      v2 = 84;
      goto LABEL_98;
    case 0xB1u:
      v2 = 85;
      goto LABEL_98;
    case 0xB2u:
      v2 = 86;
      goto LABEL_98;
    case 0xB3u:
      v2 = 87;
      goto LABEL_98;
    case 0xB4u:
      v2 = 88;
      goto LABEL_98;
    case 0xB5u:
      v2 = 89;
      goto LABEL_98;
    case 0xB6u:
      v2 = 90;
      goto LABEL_98;
    case 0xB7u:
      v2 = 91;
      goto LABEL_98;
    case 0xC0u:
      v2 = 92;
      goto LABEL_98;
    case 0xC1u:
      v2 = 93;
      goto LABEL_98;
    case 0xC2u:
      v2 = 94;
      goto LABEL_98;
    case 0xC3u:
      v2 = 95;
LABEL_98:
      v3 = v2;
      goto LABEL_99;
    case 0xC4u:
LABEL_99:
      *v1 = v3;
      break;
    case 0xC5u:
      *v1 = 97;
      break;
    case 0xC6u:
      *v1 = 98;
      break;
    case 0xC7u:
      *v1 = 99;
      break;
    case 0xC8u:
      *v1 = 100;
      break;
    case 0xC9u:
      *v1 = 101;
      break;
    case 0xCAu:
      *v1 = 102;
      break;
    case 0xCBu:
      *v1 = 103;
      break;
    case 0xD0u:
      *v1 = 104;
      break;
    case 0xD1u:
      *v1 = 105;
      break;
    case 0xD2u:
      *v1 = 106;
      break;
    case 0xD3u:
      *v1 = 107;
      break;
    case 0xD4u:
      *v1 = 108;
      break;
    case 0xD5u:
      *v1 = 109;
      break;
    case 0xD6u:
      *v1 = 110;
      break;
    case 0xE0u:
      *v1 = 111;
      break;
    case 0xE1u:
      *v1 = 112;
      break;
    case 0xE2u:
      *v1 = 113;
      break;
    default:
      *v1 = 114;
      break;
  }
  return (CoreHID::HIDUsage::GenericDesktopUsage_optional)rawValue;
}

CoreHID::HIDUsage::SimulationControlsUsage_optional __swiftcall HIDUsage.SimulationControlsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 33;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_35;
    case 2u:
      v2 = 1;
      goto LABEL_35;
    case 3u:
      v2 = 2;
      goto LABEL_35;
    case 4u:
      v2 = 3;
      goto LABEL_35;
    case 5u:
      v2 = 4;
      goto LABEL_35;
    case 6u:
      v2 = 5;
      goto LABEL_35;
    case 7u:
      v2 = 6;
      goto LABEL_35;
    case 8u:
      v2 = 7;
      goto LABEL_35;
    case 9u:
      v2 = 8;
      goto LABEL_35;
    case 0xAu:
      v2 = 9;
      goto LABEL_35;
    case 0xBu:
      v2 = 10;
      goto LABEL_35;
    case 0xCu:
      v2 = 11;
      goto LABEL_35;
    case 0x20u:
      v2 = 12;
      goto LABEL_35;
    case 0x21u:
      v2 = 13;
      goto LABEL_35;
    case 0x22u:
      v2 = 14;
      goto LABEL_35;
    case 0x23u:
      v2 = 15;
      goto LABEL_35;
    case 0x24u:
      v2 = 16;
      goto LABEL_35;
    case 0x25u:
      v2 = 17;
      goto LABEL_35;
    case 0xB0u:
      v2 = 18;
      goto LABEL_35;
    case 0xB1u:
      v2 = 19;
      goto LABEL_35;
    case 0xB2u:
      v2 = 20;
      goto LABEL_35;
    case 0xB3u:
      v2 = 21;
      goto LABEL_35;
    case 0xB4u:
      v2 = 22;
      goto LABEL_35;
    case 0xB5u:
      v2 = 23;
      goto LABEL_35;
    case 0xB6u:
      v2 = 24;
      goto LABEL_35;
    case 0xB7u:
      v2 = 25;
      goto LABEL_35;
    case 0xB8u:
      v2 = 26;
      goto LABEL_35;
    case 0xB9u:
      v2 = 27;
      goto LABEL_35;
    case 0xBAu:
      v2 = 28;
      goto LABEL_35;
    case 0xBBu:
      v2 = 29;
      goto LABEL_35;
    case 0xBCu:
      v2 = 30;
      goto LABEL_35;
    case 0xBDu:
      v2 = 31;
      goto LABEL_35;
    case 0xBEu:
      v2 = 32;
LABEL_35:
      v3 = v2;
      goto LABEL_36;
    case 0xBFu:
LABEL_36:
      *v1 = v3;
      break;
    case 0xC0u:
      *v1 = 34;
      break;
    case 0xC1u:
      *v1 = 35;
      break;
    case 0xC2u:
      *v1 = 36;
      break;
    case 0xC3u:
      *v1 = 37;
      break;
    case 0xC4u:
      *v1 = 38;
      break;
    case 0xC5u:
      *v1 = 39;
      break;
    case 0xC6u:
      *v1 = 40;
      break;
    case 0xC7u:
      *v1 = 41;
      break;
    case 0xC8u:
      *v1 = 42;
      break;
    case 0xC9u:
      *v1 = 43;
      break;
    case 0xCAu:
      *v1 = 44;
      break;
    case 0xCBu:
      *v1 = 45;
      break;
    case 0xCCu:
      *v1 = 46;
      break;
    case 0xCDu:
      *v1 = 47;
      break;
    case 0xCEu:
      *v1 = 48;
      break;
    case 0xCFu:
      *v1 = 49;
      break;
    case 0xD0u:
      *v1 = 50;
      break;
    default:
      *v1 = 51;
      break;
  }
  return (CoreHID::HIDUsage::SimulationControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::VRControlsUsage_optional __swiftcall HIDUsage.VRControlsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;

  v2 = 1;
  switch(rawValue)
  {
    case 1u:
      v2 = 0;
      goto LABEL_3;
    case 2u:
LABEL_3:
      *v1 = v2;
      break;
    case 3u:
      *v1 = 2;
      break;
    case 4u:
      *v1 = 3;
      break;
    case 5u:
      *v1 = 4;
      break;
    case 6u:
      *v1 = 5;
      break;
    case 7u:
      *v1 = 6;
      break;
    case 8u:
      *v1 = 7;
      break;
    case 9u:
      *v1 = 8;
      break;
    case 0xAu:
      *v1 = 9;
      break;
    case 0x20u:
      *v1 = 10;
      break;
    case 0x21u:
      *v1 = 11;
      break;
    default:
      *v1 = 12;
      break;
  }
  return (CoreHID::HIDUsage::VRControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::SportControlsUsage_optional __swiftcall HIDUsage.SportControlsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 16;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_18;
    case 2u:
      v2 = 1;
      goto LABEL_18;
    case 3u:
      v2 = 2;
      goto LABEL_18;
    case 4u:
      v2 = 3;
      goto LABEL_18;
    case 0x30u:
      v2 = 4;
      goto LABEL_18;
    case 0x31u:
      v2 = 5;
      goto LABEL_18;
    case 0x32u:
      v2 = 6;
      goto LABEL_18;
    case 0x33u:
      v2 = 7;
      goto LABEL_18;
    case 0x34u:
      v2 = 8;
      goto LABEL_18;
    case 0x35u:
      v2 = 9;
      goto LABEL_18;
    case 0x36u:
      v2 = 10;
      goto LABEL_18;
    case 0x37u:
      v2 = 11;
      goto LABEL_18;
    case 0x38u:
      v2 = 12;
      goto LABEL_18;
    case 0x39u:
      v2 = 13;
      goto LABEL_18;
    case 0x50u:
      v2 = 14;
      goto LABEL_18;
    case 0x51u:
      v2 = 15;
LABEL_18:
      v3 = v2;
      goto LABEL_19;
    case 0x52u:
LABEL_19:
      *v1 = v3;
      break;
    case 0x53u:
      *v1 = 17;
      break;
    case 0x54u:
      *v1 = 18;
      break;
    case 0x55u:
      *v1 = 19;
      break;
    case 0x56u:
      *v1 = 20;
      break;
    case 0x57u:
      *v1 = 21;
      break;
    case 0x58u:
      *v1 = 22;
      break;
    case 0x59u:
      *v1 = 23;
      break;
    case 0x5Au:
      *v1 = 24;
      break;
    case 0x5Bu:
      *v1 = 25;
      break;
    case 0x5Cu:
      *v1 = 26;
      break;
    case 0x5Du:
      *v1 = 27;
      break;
    case 0x5Eu:
      *v1 = 28;
      break;
    case 0x5Fu:
      *v1 = 29;
      break;
    case 0x60u:
      *v1 = 30;
      break;
    case 0x61u:
      *v1 = 31;
      break;
    case 0x62u:
      *v1 = 32;
      break;
    case 0x63u:
      *v1 = 33;
      break;
    default:
      *v1 = 34;
      break;
  }
  return (CoreHID::HIDUsage::SportControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::GameControlsUsage_optional __swiftcall HIDUsage.GameControlsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 11;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_13;
    case 2u:
      v2 = 1;
      goto LABEL_13;
    case 3u:
      v2 = 2;
      goto LABEL_13;
    case 0x20u:
      v2 = 3;
      goto LABEL_13;
    case 0x21u:
      v2 = 4;
      goto LABEL_13;
    case 0x22u:
      v2 = 5;
      goto LABEL_13;
    case 0x23u:
      v2 = 6;
      goto LABEL_13;
    case 0x24u:
      v2 = 7;
      goto LABEL_13;
    case 0x25u:
      v2 = 8;
      goto LABEL_13;
    case 0x26u:
      v2 = 9;
      goto LABEL_13;
    case 0x27u:
      v2 = 10;
LABEL_13:
      v3 = v2;
      goto LABEL_14;
    case 0x28u:
LABEL_14:
      *v1 = v3;
      break;
    case 0x29u:
      *v1 = 12;
      break;
    case 0x2Au:
      *v1 = 13;
      break;
    case 0x2Bu:
      *v1 = 14;
      break;
    case 0x2Cu:
      *v1 = 15;
      break;
    case 0x2Du:
      *v1 = 16;
      break;
    case 0x2Eu:
      *v1 = 17;
      break;
    case 0x2Fu:
      *v1 = 18;
      break;
    case 0x30u:
      *v1 = 19;
      break;
    case 0x31u:
      *v1 = 20;
      break;
    case 0x32u:
      *v1 = 21;
      break;
    case 0x33u:
      *v1 = 22;
      break;
    case 0x34u:
      *v1 = 23;
      break;
    case 0x35u:
      *v1 = 24;
      break;
    case 0x36u:
      *v1 = 25;
      break;
    case 0x37u:
      *v1 = 26;
      break;
    case 0x39u:
      *v1 = 27;
      break;
    case 0x3Au:
      *v1 = 28;
      break;
    default:
      *v1 = 29;
      break;
  }
  return (CoreHID::HIDUsage::GameControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::GenericDeviceControlsUsage_optional __swiftcall HIDUsage.GenericDeviceControlsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 6;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_8;
    case 0x20u:
      v2 = 1;
      goto LABEL_8;
    case 0x21u:
      v2 = 2;
      goto LABEL_8;
    case 0x22u:
      v2 = 3;
      goto LABEL_8;
    case 0x23u:
      v2 = 4;
      goto LABEL_8;
    case 0x24u:
      v2 = 5;
LABEL_8:
      v3 = v2;
      goto LABEL_9;
    case 0x25u:
LABEL_9:
      *v1 = v3;
      break;
    case 0x26u:
      *v1 = 7;
      break;
    case 0x27u:
      *v1 = 8;
      break;
    case 0x28u:
      *v1 = 9;
      break;
    case 0x29u:
      *v1 = 10;
      break;
    case 0x2Au:
      *v1 = 11;
      break;
    case 0x2Bu:
      *v1 = 12;
      break;
    case 0x2Cu:
      *v1 = 13;
      break;
    case 0x2Du:
      *v1 = 14;
      break;
    case 0x2Eu:
      *v1 = 15;
      break;
    case 0x2Fu:
      *v1 = 16;
      break;
    case 0x30u:
      *v1 = 17;
      break;
    case 0x31u:
      *v1 = 18;
      break;
    case 0x32u:
      *v1 = 19;
      break;
    case 0x33u:
      *v1 = 20;
      break;
    case 0x34u:
      *v1 = 21;
      break;
    case 0x40u:
      *v1 = 22;
      break;
    case 0x41u:
      *v1 = 23;
      break;
    default:
      *v1 = 24;
      break;
  }
  return (CoreHID::HIDUsage::GenericDeviceControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional __swiftcall HIDUsage.KeyboardOrKeypadUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = rawValue - 1;
  if ((unsigned __int16)(rawValue - 1) >= 0x80u)
  {
    v2 = 0x80;
    switch(rawValue)
    {
      case 0x81u:
        goto LABEL_2;
      case 0x82u:
        *v1 = -127;
        break;
      case 0x83u:
        *v1 = -126;
        break;
      case 0x84u:
        *v1 = -125;
        break;
      case 0x85u:
        *v1 = -124;
        break;
      case 0x86u:
        *v1 = -123;
        break;
      case 0x87u:
        *v1 = -122;
        break;
      case 0x88u:
        *v1 = -121;
        break;
      case 0x89u:
        *v1 = -120;
        break;
      case 0x8Au:
        *v1 = -119;
        break;
      case 0x8Bu:
        *v1 = -118;
        break;
      case 0x8Cu:
        *v1 = -117;
        break;
      case 0x8Du:
        *v1 = -116;
        break;
      case 0x8Eu:
        *v1 = -115;
        break;
      case 0x8Fu:
        *v1 = -114;
        break;
      case 0x90u:
        *v1 = -113;
        break;
      case 0x91u:
        *v1 = -112;
        break;
      case 0x92u:
        *v1 = -111;
        break;
      case 0x93u:
        *v1 = -110;
        break;
      case 0x94u:
        *v1 = -109;
        break;
      case 0x95u:
        *v1 = -108;
        break;
      case 0x96u:
        *v1 = -107;
        break;
      case 0x97u:
        *v1 = -106;
        break;
      case 0x98u:
        *v1 = -105;
        break;
      case 0x99u:
        *v1 = -104;
        break;
      case 0x9Au:
        *v1 = -103;
        break;
      case 0x9Bu:
        *v1 = -102;
        break;
      case 0x9Cu:
        *v1 = -101;
        break;
      case 0x9Du:
        *v1 = -100;
        break;
      case 0x9Eu:
        *v1 = -99;
        break;
      case 0x9Fu:
        *v1 = -98;
        break;
      case 0xA0u:
        *v1 = -97;
        break;
      case 0xA1u:
        *v1 = -96;
        break;
      case 0xA2u:
        *v1 = -95;
        break;
      case 0xA3u:
        *v1 = -94;
        break;
      case 0xA4u:
        *v1 = -93;
        break;
      case 0xB0u:
        *v1 = -92;
        break;
      case 0xB1u:
        *v1 = -91;
        break;
      case 0xB2u:
        *v1 = -90;
        break;
      case 0xB3u:
        *v1 = -89;
        break;
      case 0xB4u:
        *v1 = -88;
        break;
      case 0xB5u:
        *v1 = -87;
        break;
      case 0xB6u:
        *v1 = -86;
        break;
      case 0xB7u:
        *v1 = -85;
        break;
      case 0xB8u:
        *v1 = -84;
        break;
      case 0xB9u:
        *v1 = -83;
        break;
      case 0xBAu:
        *v1 = -82;
        break;
      case 0xBBu:
        *v1 = -81;
        break;
      case 0xBCu:
        *v1 = -80;
        break;
      case 0xBDu:
        *v1 = -79;
        break;
      case 0xBEu:
        *v1 = -78;
        break;
      case 0xBFu:
        *v1 = -77;
        break;
      case 0xC0u:
        *v1 = -76;
        break;
      case 0xC1u:
        *v1 = -75;
        break;
      case 0xC2u:
        *v1 = -74;
        break;
      case 0xC3u:
        *v1 = -73;
        break;
      case 0xC4u:
        *v1 = -72;
        break;
      case 0xC5u:
        *v1 = -71;
        break;
      case 0xC6u:
        *v1 = -70;
        break;
      case 0xC7u:
        *v1 = -69;
        break;
      case 0xC8u:
        *v1 = -68;
        break;
      case 0xC9u:
        *v1 = -67;
        break;
      case 0xCAu:
        *v1 = -66;
        break;
      case 0xCBu:
        *v1 = -65;
        break;
      default:
        v3 = -56;
        v2 = -64;
        switch(rawValue)
        {
          case 0xCCu:
            goto LABEL_2;
          case 0xCDu:
            *v1 = -63;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xCEu:
            *v1 = -62;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xCFu:
            *v1 = -61;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD0u:
            *v1 = -60;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD1u:
            *v1 = -59;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD2u:
            *v1 = -58;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD3u:
            *v1 = -57;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD4u:
            goto LABEL_85;
          case 0xD5u:
            *v1 = -55;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD6u:
            *v1 = -54;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD7u:
            *v1 = -53;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD8u:
            *v1 = -52;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD9u:
            *v1 = -51;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDAu:
            *v1 = -50;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDBu:
            *v1 = -49;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDCu:
            *v1 = -48;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDDu:
            *v1 = -47;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE0u:
            *v1 = -46;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE1u:
            *v1 = -45;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE2u:
            *v1 = -44;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE3u:
            *v1 = -43;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE4u:
            *v1 = -42;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE5u:
            *v1 = -41;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE6u:
            *v1 = -40;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE7u:
            *v1 = -39;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          default:
            v3 = -38;
LABEL_85:
            *v1 = v3;
            break;
        }
        break;
    }
  }
  else
  {
LABEL_2:
    *v1 = v2;
  }
  return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
}

CoreHID::HIDUsage::LEDUsage_optional __swiftcall HIDUsage.LEDUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 78;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_79;
    case 2u:
      v2 = 1;
      goto LABEL_79;
    case 3u:
      v2 = 2;
      goto LABEL_79;
    case 4u:
      v2 = 3;
      goto LABEL_79;
    case 5u:
      v2 = 4;
      goto LABEL_79;
    case 6u:
      v2 = 5;
      goto LABEL_79;
    case 7u:
      v2 = 6;
      goto LABEL_79;
    case 8u:
      v2 = 7;
      goto LABEL_79;
    case 9u:
      v2 = 8;
      goto LABEL_79;
    case 0xAu:
      v2 = 9;
      goto LABEL_79;
    case 0xBu:
      v2 = 10;
      goto LABEL_79;
    case 0xCu:
      v2 = 11;
      goto LABEL_79;
    case 0xDu:
      v2 = 12;
      goto LABEL_79;
    case 0xEu:
      v2 = 13;
      goto LABEL_79;
    case 0xFu:
      v2 = 14;
      goto LABEL_79;
    case 0x10u:
      v2 = 15;
      goto LABEL_79;
    case 0x11u:
      v2 = 16;
      goto LABEL_79;
    case 0x12u:
      v2 = 17;
      goto LABEL_79;
    case 0x13u:
      v2 = 18;
      goto LABEL_79;
    case 0x14u:
      v2 = 19;
      goto LABEL_79;
    case 0x15u:
      v2 = 20;
      goto LABEL_79;
    case 0x16u:
      v2 = 21;
      goto LABEL_79;
    case 0x17u:
      v2 = 22;
      goto LABEL_79;
    case 0x18u:
      v2 = 23;
      goto LABEL_79;
    case 0x19u:
      v2 = 24;
      goto LABEL_79;
    case 0x1Au:
      v2 = 25;
      goto LABEL_79;
    case 0x1Bu:
      v2 = 26;
      goto LABEL_79;
    case 0x1Cu:
      v2 = 27;
      goto LABEL_79;
    case 0x1Du:
      v2 = 28;
      goto LABEL_79;
    case 0x1Eu:
      v2 = 29;
      goto LABEL_79;
    case 0x1Fu:
      v2 = 30;
      goto LABEL_79;
    case 0x20u:
      v2 = 31;
      goto LABEL_79;
    case 0x21u:
      v2 = 32;
      goto LABEL_79;
    case 0x22u:
      v2 = 33;
      goto LABEL_79;
    case 0x23u:
      v2 = 34;
      goto LABEL_79;
    case 0x24u:
      v2 = 35;
      goto LABEL_79;
    case 0x25u:
      v2 = 36;
      goto LABEL_79;
    case 0x26u:
      v2 = 37;
      goto LABEL_79;
    case 0x27u:
      v2 = 38;
      goto LABEL_79;
    case 0x28u:
      v2 = 39;
      goto LABEL_79;
    case 0x29u:
      v2 = 40;
      goto LABEL_79;
    case 0x2Au:
      v2 = 41;
      goto LABEL_79;
    case 0x2Bu:
      v2 = 42;
      goto LABEL_79;
    case 0x2Cu:
      v2 = 43;
      goto LABEL_79;
    case 0x2Du:
      v2 = 44;
      goto LABEL_79;
    case 0x2Eu:
      v2 = 45;
      goto LABEL_79;
    case 0x2Fu:
      v2 = 46;
      goto LABEL_79;
    case 0x30u:
      v2 = 47;
      goto LABEL_79;
    case 0x31u:
      v2 = 48;
      goto LABEL_79;
    case 0x32u:
      v2 = 49;
      goto LABEL_79;
    case 0x33u:
      v2 = 50;
      goto LABEL_79;
    case 0x34u:
      v2 = 51;
      goto LABEL_79;
    case 0x35u:
      v2 = 52;
      goto LABEL_79;
    case 0x36u:
      v2 = 53;
      goto LABEL_79;
    case 0x37u:
      v2 = 54;
      goto LABEL_79;
    case 0x38u:
      v2 = 55;
      goto LABEL_79;
    case 0x39u:
      v2 = 56;
      goto LABEL_79;
    case 0x3Au:
      v2 = 57;
      goto LABEL_79;
    case 0x3Bu:
      v2 = 58;
      goto LABEL_79;
    case 0x3Cu:
      v2 = 59;
      goto LABEL_79;
    case 0x3Du:
      v2 = 60;
      goto LABEL_79;
    case 0x3Eu:
      v2 = 61;
      goto LABEL_79;
    case 0x3Fu:
      v2 = 62;
      goto LABEL_79;
    case 0x40u:
      v2 = 63;
      goto LABEL_79;
    case 0x41u:
      v2 = 64;
      goto LABEL_79;
    case 0x42u:
      v2 = 65;
      goto LABEL_79;
    case 0x43u:
      v2 = 66;
      goto LABEL_79;
    case 0x44u:
      v2 = 67;
      goto LABEL_79;
    case 0x45u:
      v2 = 68;
      goto LABEL_79;
    case 0x46u:
      v2 = 69;
      goto LABEL_79;
    case 0x47u:
      v2 = 70;
      goto LABEL_79;
    case 0x48u:
      v2 = 71;
      goto LABEL_79;
    case 0x49u:
      v2 = 72;
      goto LABEL_79;
    case 0x4Au:
      v2 = 73;
      goto LABEL_79;
    case 0x4Bu:
      v2 = 74;
      goto LABEL_79;
    case 0x4Cu:
      v2 = 75;
      goto LABEL_79;
    case 0x4Du:
      v2 = 76;
      goto LABEL_79;
    case 0x4Eu:
      v2 = 77;
LABEL_79:
      v3 = v2;
      goto LABEL_80;
    case 0x4Fu:
LABEL_80:
      *v1 = v3;
      break;
    case 0x50u:
      *v1 = 79;
      break;
    case 0x51u:
      *v1 = 80;
      break;
    case 0x52u:
      *v1 = 81;
      break;
    case 0x53u:
      *v1 = 82;
      break;
    case 0x54u:
      *v1 = 83;
      break;
    case 0x55u:
      *v1 = 84;
      break;
    case 0x56u:
      *v1 = 85;
      break;
    case 0x57u:
      *v1 = 86;
      break;
    case 0x60u:
      *v1 = 87;
      break;
    case 0x61u:
      *v1 = 88;
      break;
    case 0x62u:
      *v1 = 89;
      break;
    case 0x63u:
      *v1 = 90;
      break;
    case 0x64u:
      *v1 = 91;
      break;
    case 0x65u:
      *v1 = 92;
      break;
    case 0x66u:
      *v1 = 93;
      break;
    case 0x67u:
      *v1 = 94;
      break;
    case 0x68u:
      *v1 = 95;
      break;
    default:
      *v1 = 96;
      break;
  }
  return (CoreHID::HIDUsage::LEDUsage_optional)rawValue;
}

CoreHID::HIDUsage::TelephonyDeviceUsage_optional __swiftcall HIDUsage.TelephonyDeviceUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 81;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_83;
    case 2u:
      v2 = 1;
      goto LABEL_83;
    case 3u:
      v2 = 2;
      goto LABEL_83;
    case 4u:
      v2 = 3;
      goto LABEL_83;
    case 5u:
      v2 = 4;
      goto LABEL_83;
    case 6u:
      v2 = 5;
      goto LABEL_83;
    case 7u:
      v2 = 6;
      goto LABEL_83;
    case 0x20u:
      v2 = 7;
      goto LABEL_83;
    case 0x21u:
      v2 = 8;
      goto LABEL_83;
    case 0x22u:
      v2 = 9;
      goto LABEL_83;
    case 0x23u:
      v2 = 10;
      goto LABEL_83;
    case 0x24u:
      v2 = 11;
      goto LABEL_83;
    case 0x25u:
      v2 = 12;
      goto LABEL_83;
    case 0x26u:
      v2 = 13;
      goto LABEL_83;
    case 0x27u:
      v2 = 14;
      goto LABEL_83;
    case 0x28u:
      v2 = 15;
      goto LABEL_83;
    case 0x29u:
      v2 = 16;
      goto LABEL_83;
    case 0x2Au:
      v2 = 17;
      goto LABEL_83;
    case 0x2Bu:
      v2 = 18;
      goto LABEL_83;
    case 0x2Cu:
      v2 = 19;
      goto LABEL_83;
    case 0x2Du:
      v2 = 20;
      goto LABEL_83;
    case 0x2Eu:
      v2 = 21;
      goto LABEL_83;
    case 0x2Fu:
      v2 = 22;
      goto LABEL_83;
    case 0x30u:
      v2 = 23;
      goto LABEL_83;
    case 0x31u:
      v2 = 24;
      goto LABEL_83;
    case 0x50u:
      v2 = 25;
      goto LABEL_83;
    case 0x51u:
      v2 = 26;
      goto LABEL_83;
    case 0x52u:
      v2 = 27;
      goto LABEL_83;
    case 0x53u:
      v2 = 28;
      goto LABEL_83;
    case 0x70u:
      v2 = 29;
      goto LABEL_83;
    case 0x71u:
      v2 = 30;
      goto LABEL_83;
    case 0x72u:
      v2 = 31;
      goto LABEL_83;
    case 0x73u:
      v2 = 32;
      goto LABEL_83;
    case 0x74u:
      v2 = 33;
      goto LABEL_83;
    case 0x90u:
      v2 = 34;
      goto LABEL_83;
    case 0x91u:
      v2 = 35;
      goto LABEL_83;
    case 0x92u:
      v2 = 36;
      goto LABEL_83;
    case 0x93u:
      v2 = 37;
      goto LABEL_83;
    case 0x94u:
      v2 = 38;
      goto LABEL_83;
    case 0x95u:
      v2 = 39;
      goto LABEL_83;
    case 0x96u:
      v2 = 40;
      goto LABEL_83;
    case 0x97u:
      v2 = 41;
      goto LABEL_83;
    case 0x98u:
      v2 = 42;
      goto LABEL_83;
    case 0x99u:
      v2 = 43;
      goto LABEL_83;
    case 0x9Au:
      v2 = 44;
      goto LABEL_83;
    case 0x9Bu:
      v2 = 45;
      goto LABEL_83;
    case 0x9Cu:
      v2 = 46;
      goto LABEL_83;
    case 0x9Du:
      v2 = 47;
      goto LABEL_83;
    case 0x9Eu:
      v2 = 48;
      goto LABEL_83;
    case 0xB0u:
      v2 = 49;
      goto LABEL_83;
    case 0xB1u:
      v2 = 50;
      goto LABEL_83;
    case 0xB2u:
      v2 = 51;
      goto LABEL_83;
    case 0xB3u:
      v2 = 52;
      goto LABEL_83;
    case 0xB4u:
      v2 = 53;
      goto LABEL_83;
    case 0xB5u:
      v2 = 54;
      goto LABEL_83;
    case 0xB6u:
      v2 = 55;
      goto LABEL_83;
    case 0xB7u:
      v2 = 56;
      goto LABEL_83;
    case 0xB8u:
      v2 = 57;
      goto LABEL_83;
    case 0xB9u:
      v2 = 58;
      goto LABEL_83;
    case 0xBAu:
      v2 = 59;
      goto LABEL_83;
    case 0xBBu:
      v2 = 60;
      goto LABEL_83;
    case 0xBCu:
      v2 = 61;
      goto LABEL_83;
    case 0xBDu:
      v2 = 62;
      goto LABEL_83;
    case 0xBEu:
      v2 = 63;
      goto LABEL_83;
    case 0xBFu:
      v2 = 64;
      goto LABEL_83;
    case 0xC0u:
      v2 = 65;
      goto LABEL_83;
    case 0xC1u:
      v2 = 66;
      goto LABEL_83;
    case 0xC2u:
      v2 = 67;
      goto LABEL_83;
    case 0xF0u:
      v2 = 68;
      goto LABEL_83;
    case 0xF1u:
      v2 = 69;
      goto LABEL_83;
    case 0xF2u:
      v2 = 70;
      goto LABEL_83;
    case 0xF3u:
      v2 = 71;
      goto LABEL_83;
    case 0xF4u:
      v2 = 72;
      goto LABEL_83;
    case 0xF5u:
      v2 = 73;
      goto LABEL_83;
    case 0xF8u:
      v2 = 74;
      goto LABEL_83;
    case 0xF9u:
      v2 = 75;
      goto LABEL_83;
    case 0xFAu:
      v2 = 76;
      goto LABEL_83;
    case 0xFBu:
      v2 = 77;
      goto LABEL_83;
    case 0xFCu:
      v2 = 78;
      goto LABEL_83;
    case 0xFDu:
      v2 = 79;
      goto LABEL_83;
    case 0xFEu:
      v2 = 80;
LABEL_83:
      v3 = v2;
      goto LABEL_84;
    case 0x108u:
LABEL_84:
      *v1 = v3;
      break;
    case 0x109u:
      *v1 = 82;
      break;
    case 0x10Au:
      *v1 = 83;
      break;
    case 0x110u:
      *v1 = 84;
      break;
    case 0x111u:
      *v1 = 85;
      break;
    case 0x112u:
      *v1 = 86;
      break;
    case 0x113u:
      *v1 = 87;
      break;
    case 0x114u:
      *v1 = 88;
      break;
    case 0x140u:
      *v1 = 89;
      break;
    case 0x141u:
      *v1 = 90;
      break;
    case 0x142u:
      *v1 = 91;
      break;
    case 0x143u:
      *v1 = 92;
      break;
    case 0x144u:
      *v1 = 93;
      break;
    case 0x145u:
      *v1 = 94;
      break;
    case 0x146u:
      *v1 = 95;
      break;
    case 0x147u:
      *v1 = 96;
      break;
    case 0x14Au:
      *v1 = 97;
      break;
    case 0x14Bu:
      *v1 = 98;
      break;
    default:
      *v1 = 99;
      break;
  }
  return (CoreHID::HIDUsage::TelephonyDeviceUsage_optional)rawValue;
}

CoreHID::HIDUsage::ConsumerUsage_optional __swiftcall HIDUsage.ConsumerUsage.init(rawValue:)(CoreHID::HIDUsage::ConsumerUsage_optional rawValue)
{
  __int16 *v1;
  __int16 v2;
  __int16 v3;
  __int16 v4;

  v2 = 0;
  switch(rawValue.value)
  {
    case CoreHID_HIDUsage_ConsumerUsage_numericKeyPad:
LABEL_2:
      *v1 = v2;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_programmableButtons:
      *v1 = 1;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_microphone:
      *v1 = 2;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_headphone:
      *v1 = 3;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_graphicEqualizer:
      *v1 = 4;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_plus10:
      *v1 = 5;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_pictureInPictureToggle:
      *v1 = 6;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_pictureInPictureSwap:
      *v1 = 7;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_redMenuButton:
      *v1 = 8;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_cameraAccessDisabled:
      *v1 = 9;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_cameraAccessToggle:
      *v1 = 10;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBrightnessIncrement:
      *v1 = 11;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBrightnessDecrement:
      *v1 = 12;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBacklightSetLevel:
      *v1 = 13;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBacklightOOC:
      *v1 = 14;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBacklightSetMinimum:
      *v1 = 15;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelection:
      *v1 = 16;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectComputer:
      *v1 = 17;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectTV:
      *v1 = 18;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectWWW:
      *v1 = 19;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectDVD:
      *v1 = 20;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectTelephone:
      *v1 = 21;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectProgramGuide:
      *v1 = 22;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectVideoPhone:
      *v1 = 23;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectGames:
      *v1 = 24;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_fastForward:
      *v1 = 25;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_rewind:
      *v1 = 26;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_scanNextTrack:
      *v1 = 27;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_scanPreviousTrack:
      *v1 = 28;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_stop:
      *v1 = 29;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_eject:
      *v1 = 30;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_randomPlay:
      *v1 = 31;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_selectDisc:
      *v1 = 32;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_enterDisc:
      *v1 = 33;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_repeatTrack:
      *v1 = 34;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_tracking:
      *v1 = 35;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_trackNormal:
      *v1 = 36;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_slowTracking:
      *v1 = 37;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_frameForward:
      *v1 = 38;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_frameBack:
      *v1 = 39;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mark:
      *v1 = 40;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_clearMark:
      *v1 = 41;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_repeatFromMark:
      *v1 = 42;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_returnToMark:
      *v1 = 43;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_searchMarkForward:
      *v1 = 44;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_searchMarkBackwards:
      *v1 = 45;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_counterReset:
      *v1 = 46;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_showCounter:
      *v1 = 47;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_trackingIncrement:
      *v1 = 48;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_trackingDecrement:
      *v1 = 49;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_stopOrEject:
      *v1 = 50;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_playOrPause:
      *v1 = 51;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_playOrSkip:
      *v1 = 52;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_voiceCommand:
      *v1 = 53;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_invokeCaptureInterface:
      *v1 = 54;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopGameRecording:
      *v1 = 55;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_historicalGameCapture:
      *v1 = 56;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_captureGameScreenshot:
      *v1 = 57;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_showOrHideRecordingIndicator:
      *v1 = 58;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopMicrophoneCapture:
      *v1 = 59;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopCameraCapture:
      *v1 = 60;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopGameBroadcast:
      *v1 = 61;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopVoiceDictationSession:
      *v1 = 62;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_invokeOrDismissEmojiPicker:
      *v1 = 63;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_volume:
      *v1 = 64;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_balance:
      *v1 = 65;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mute:
      *v1 = 66;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_bass:
      *v1 = 67;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_treble:
      *v1 = 68;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_bassBoost:
      *v1 = 69;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_surroundMode:
      *v1 = 70;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_loudness:
      *v1 = 71;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mpx:
      *v1 = 72;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_volumeIncrement:
      *v1 = 73;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_volumeDecrement:
      *v1 = 74;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_speedSelect:
      *v1 = 75;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_playbackSpeed:
      *v1 = 76;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_standardPlay:
      *v1 = 77;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_longPlay:
      *v1 = 78;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_extendedPlay:
      *v1 = 79;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_slow:
      *v1 = 80;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_fanEnable:
      *v1 = 81;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_fanSpeed:
      *v1 = 82;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_lightEnable:
      *v1 = 83;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_lightIlluminationLevel:
      *v1 = 84;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_climateControlEnable:
      *v1 = 85;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_roomTemperature:
      *v1 = 86;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_securityEnable:
      *v1 = 87;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_policeAlarm:
      *v1 = 88;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_proximity:
      *v1 = 89;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_motion:
      *v1 = 90;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_duressAlarm:
      *v1 = 91;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_holdupAlarm:
      *v1 = 92;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelFront:
      *v1 = 93;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelCenterFront:
      *v1 = 94;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelSide:
      *v1 = 95;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelSurround:
      *v1 = 96;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelLowFrequencyEnhancement:
      *v1 = 97;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelTop:
      *v1 = 98;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelUnknown:
      *v1 = 99;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_subChannel:
      *v1 = 100;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_subChannelIncrement:
      *v1 = 101;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_subChannelDecrement:
      *v1 = 102;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alternateAudioIncrement:
      *v1 = 103;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alternateAudioDecrement:
      *v1 = 104;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_applicationLaunchButtons:
      *v1 = 105;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLaunchButtonConfigurationTool:
      *v1 = 106;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alProgrammableButtonConfiguration:
      *v1 = 107;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alConsumerControlConfiguration:
      *v1 = 108;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alWordProcessor:
      *v1 = 109;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alTextEditor:
      *v1 = 110;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alSpreadsheet:
      *v1 = 111;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alGraphicsEditor:
      *v1 = 112;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alPresentationApp:
      *v1 = 113;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alDatabaseApp:
      *v1 = 114;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alEmailReader:
      *v1 = 115;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alNewsreader:
      *v1 = 116;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alVoicemail:
      *v1 = 117;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alContactsOrAddressBook:
      *v1 = 118;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alCalendarOrSchedule:
      *v1 = 119;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alTaskOrProjectManager:
      *v1 = 120;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLogOrJournalOrTimecard:
      *v1 = 121;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alCheckbookOrFinance:
      *v1 = 122;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alCalculator:
      *v1 = 123;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alAVCaptureOrPlayback:
      *v1 = 124;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLocalMachineBrowser:
      *v1 = 125;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLANOrWANBrowser:
      *v1 = 126;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alInternetBrowser:
      *v1 = 127;
      break;
    default:
      v2 = 128;
      switch(rawValue.value)
      {
        case CoreHID_HIDUsage_ConsumerUsage_alRemoteNetworkingOrISPConnect:
          goto LABEL_2;
        case CoreHID_HIDUsage_ConsumerUsage_alNetworkConference:
          *v1 = 129;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alNetworkChat:
          *v1 = 130;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alTelephonyOrDialer:
          *v1 = 131;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alLogon:
          *v1 = 132;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alLogoff:
          *v1 = 133;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alLogonOrLogoff:
          *v1 = 134;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alPreviousTaskOrApplication:
          *v1 = 135;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alPreemptiveHaltTaskOrApplication:
          *v1 = 136;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alIntegratedHelpCenter:
          *v1 = 137;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDocuments:
          *v1 = 138;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alThesaurus:
          *v1 = 139;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDictionary:
          *v1 = 140;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDesktop:
          *v1 = 141;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alSpellCheck:
          *v1 = 142;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alGrammarCheck:
          *v1 = 143;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alWirelessStatus:
          *v1 = 144;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alKeyboardLayout:
          *v1 = 145;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alFileBrowser:
          *v1 = 146;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alPowerStatus:
          *v1 = 147;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alImageBrowser:
          *v1 = 148;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alAudioBrowser:
          *v1 = 149;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alMovieBrowser:
          *v1 = 150;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDigitalRightsManager:
          *v1 = 151;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alOnlineActivityBrowser:
          *v1 = 152;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alResearchOrSearchBrowser:
          *v1 = 153;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alAudioPlayer:
          *v1 = 154;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alMessageStatus:
          *v1 = 155;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alContactSync:
          *v1 = 156;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alNavigation:
          *v1 = 157;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alContextAwareDesktopAssistant:
          *v1 = 158;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_genericGUIApplicationControls:
          *v1 = 159;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acNew:
          *v1 = 160;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acOpen:
          *v1 = 161;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acClose:
          *v1 = 162;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acExit:
          *v1 = 163;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acMaximize:
          *v1 = 164;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acMinimize:
          *v1 = 165;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acRestartNumbering:
          *v1 = 166;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acBulletedList:
          *v1 = 167;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acPromote:
          *v1 = 168;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acDemote:
          *v1 = 169;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acYes:
          *v1 = 170;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acNo:
          *v1 = 171;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acInsertMode:
          *v1 = 172;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acDelete:
          *v1 = 173;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acLock:
          *v1 = 174;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acUnlock:
          *v1 = 175;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acProtect:
          *v1 = 176;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acUnprotect:
          *v1 = 177;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acAttachComment:
          *v1 = 178;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acDeleteComment:
          *v1 = 179;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acViewComment:
          *v1 = 180;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSelectWord:
          *v1 = 181;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSelectSentence:
          *v1 = 182;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acRedoOrRepeat:
          *v1 = 183;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSort:
          *v1 = 184;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSortAscending:
          *v1 = 185;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSortDescending:
          *v1 = 186;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acFilter:
          *v1 = 187;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acReply:
          *v1 = 188;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acReplyAll:
          *v1 = 189;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acForwardMsg:
          *v1 = 190;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSend:
          *v1 = 191;
          break;
        default:
          v2 = 192;
          switch(rawValue.value)
          {
            case CoreHID_HIDUsage_ConsumerUsage_acAttachFile:
              goto LABEL_2;
            case CoreHID_HIDUsage_ConsumerUsage_acUpload:
              *v1 = 193;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDownloadSaveTargetAs:
              *v1 = 194;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSetBorders:
              *v1 = 195;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertRow:
              *v1 = 196;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertColumn:
              *v1 = 197;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertFile:
              *v1 = 198;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertPicture:
              *v1 = 199;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertObject:
              *v1 = 200;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertSymbol:
              *v1 = 201;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSaveAndClose:
              *v1 = 202;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acRename:
              *v1 = 203;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acMerge:
              *v1 = 204;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSplit:
              *v1 = 205;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDisributeHorizontally:
              *v1 = 206;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDistributeVertically:
              *v1 = 207;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acNextKeyboardLayoutSelect:
              *v1 = 208;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acNavigationGuidance:
              *v1 = 209;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDesktopShowAllWindows:
              *v1 = 210;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSoftKeyLeft:
              *v1 = 211;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSoftKeyRight:
              *v1 = 212;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDesktopShowAllApplications:
              *v1 = 213;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acIdleKeepAlive:
              *v1 = 214;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_extendedKeyboardAttributesCollection:
              *v1 = 215;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardFormFactor:
              *v1 = 216;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardKeyType:
              *v1 = 217;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardPhysicalLayout:
              *v1 = 218;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_vendorSpecificKeyboardPhysicalLayout:
              *v1 = 219;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardIETFLanguageTagIndex:
              *v1 = 220;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_implementedKeyboardInputAssistControls:
              *v1 = 221;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistPrevious:
              *v1 = 222;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistNext:
              *v1 = 223;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistPreviousGroup:
              *v1 = 224;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistNextGroup:
              *v1 = 225;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistAccept:
              *v1 = 226;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistCancel:
              *v1 = 227;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenToggle:
              *v1 = 228;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelDecrement:
              *v1 = 229;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelIncrement:
              *v1 = 230;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelMinimum:
              *v1 = 231;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelMaximum:
              *v1 = 232;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEdited:
              *v1 = 233;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactAdded:
              *v1 = 234;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactRecordActive:
              *v1 = 235;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactIndex:
              *v1 = 236;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactNickname:
              *v1 = 237;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactFirstName:
              *v1 = 238;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactLastName:
              *v1 = 239;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactFullName:
              *v1 = 240;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberPersonal:
              *v1 = 241;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberBusiness:
              *v1 = 242;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberMobile:
              *v1 = 243;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberPager:
              *v1 = 244;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberFax:
              *v1 = 245;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberOther:
              *v1 = 246;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEmailBusiness:
              *v1 = 247;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEmailOther:
              *v1 = 248;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEmailMain:
              *v1 = 249;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactSpeedDialNumber:
              *v1 = 250;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactStatusFlag:
              *v1 = 251;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactMiscellaneous:
              *v1 = 252;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_unknownDefault:
              *v1 = 253;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_unknownDefault|CoreHID_HIDUsage_ConsumerUsage_numericKeyPad:
              *v1 = 254;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactStatusFlag|CoreHID_HIDUsage_ConsumerUsage_headphone:
              *v1 = 255;
              break;
            default:
              v2 = 256;
              switch(rawValue.value)
              {
                case 0x1C5:
                  goto LABEL_2;
                case 0x1C6:
                  *v1 = 257;
                  break;
                case 0x1C7:
                  *v1 = 258;
                  break;
                case 0x1C8:
                  *v1 = 259;
                  break;
                case 0x1C9:
                  *v1 = 260;
                  break;
                case 0x1CA:
                  *v1 = 261;
                  break;
                case 0x1CB:
                  *v1 = 262;
                  break;
                case 0x200:
                  *v1 = 263;
                  break;
                case 0x201:
                  *v1 = 264;
                  break;
                case 0x202:
                  *v1 = 265;
                  break;
                case 0x203:
                  *v1 = 266;
                  break;
                case 0x204:
                  *v1 = 267;
                  break;
                case 0x205:
                  *v1 = 268;
                  break;
                case 0x206:
                  *v1 = 269;
                  break;
                case 0x207:
                  *v1 = 270;
                  break;
                case 0x208:
                  *v1 = 271;
                  break;
                case 0x209:
                  *v1 = 272;
                  break;
                case 0x21A:
                  *v1 = 273;
                  break;
                case 0x21B:
                  *v1 = 274;
                  break;
                case 0x21C:
                  *v1 = 275;
                  break;
                case 0x21D:
                  *v1 = 276;
                  break;
                case 0x21E:
                  *v1 = 277;
                  break;
                case 0x21F:
                  *v1 = 278;
                  break;
                case 0x220:
                  *v1 = 279;
                  break;
                case 0x221:
                  *v1 = 280;
                  break;
                case 0x222:
                  *v1 = 281;
                  break;
                case 0x223:
                  *v1 = 282;
                  break;
                case 0x224:
                  *v1 = 283;
                  break;
                case 0x225:
                  *v1 = 284;
                  break;
                case 0x226:
                  *v1 = 285;
                  break;
                case 0x227:
                  *v1 = 286;
                  break;
                case 0x228:
                  *v1 = 287;
                  break;
                case 0x229:
                  *v1 = 288;
                  break;
                case 0x22A:
                  *v1 = 289;
                  break;
                case 0x22B:
                  *v1 = 290;
                  break;
                case 0x22C:
                  *v1 = 291;
                  break;
                case 0x22D:
                  *v1 = 292;
                  break;
                case 0x22E:
                  *v1 = 293;
                  break;
                case 0x22F:
                  *v1 = 294;
                  break;
                case 0x230:
                  *v1 = 295;
                  break;
                case 0x231:
                  *v1 = 296;
                  break;
                case 0x232:
                  *v1 = 297;
                  break;
                case 0x233:
                  *v1 = 298;
                  break;
                case 0x234:
                  *v1 = 299;
                  break;
                case 0x235:
                  *v1 = 300;
                  break;
                case 0x236:
                  *v1 = 301;
                  break;
                case 0x237:
                  *v1 = 302;
                  break;
                case 0x238:
                  *v1 = 303;
                  break;
                case 0x239:
                  *v1 = 304;
                  break;
                case 0x23A:
                  *v1 = 305;
                  break;
                case 0x23B:
                  *v1 = 306;
                  break;
                case 0x23C:
                  *v1 = 307;
                  break;
                case 0x23D:
                  *v1 = 308;
                  break;
                case 0x23E:
                  *v1 = 309;
                  break;
                case 0x23F:
                  *v1 = 310;
                  break;
                case 0x240:
                  *v1 = 311;
                  break;
                case 0x241:
                  *v1 = 312;
                  break;
                case 0x242:
                  *v1 = 313;
                  break;
                case 0x243:
                  *v1 = 314;
                  break;
                case 0x244:
                  *v1 = 315;
                  break;
                case 0x245:
                  *v1 = 316;
                  break;
                case 0x246:
                  *v1 = 317;
                  break;
                case 0x247:
                  *v1 = 318;
                  break;
                case 0x248:
                  *v1 = 319;
                  break;
                default:
                  if ((unsigned __int16)(rawValue.value - 585) >= 0x40u)
                  {
                    v2 = 384;
                    switch(rawValue.value)
                    {
                      case CoreHID_HIDUsage_ConsumerUsage_mute|0x200:
                        goto LABEL_2;
                      case CoreHID_HIDUsage_ConsumerUsage_bass|0x200:
                        *v1 = 385;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_treble|0x200:
                        *v1 = 386;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_bassBoost|0x200:
                        *v1 = 387;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_surroundMode|0x200:
                        *v1 = 388;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_loudness|0x200:
                        *v1 = 389;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_mpx|0x200:
                        *v1 = 390;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_volumeIncrement|0x200:
                        *v1 = 391;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_volumeDecrement|0x200:
                        *v1 = 392;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_speedSelect|0x200:
                        *v1 = 393;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_playbackSpeed|0x200:
                        *v1 = 394;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_standardPlay|0x200:
                        *v1 = 395;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_longPlay|0x200:
                        *v1 = 396;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_extendedPlay|0x200:
                        *v1 = 397;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_slow|0x200:
                        *v1 = 398;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_fanEnable|0x200:
                        *v1 = 399;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_fanSpeed|0x200:
                        *v1 = 400;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_lightEnable|0x200:
                        *v1 = 401;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_lightIlluminationLevel|0x200:
                        *v1 = 402;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_climateControlEnable|0x200:
                        *v1 = 403;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_roomTemperature|0x200:
                        *v1 = 404;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_securityEnable|0x200:
                        *v1 = 405;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_fireAlarm|0x200:
                        *v1 = 406;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_policeAlarm|0x200:
                        *v1 = 407;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_proximity|0x200:
                        *v1 = 408;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_motion|0x200:
                        *v1 = 409;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_channelFront|0x200:
                        *v1 = 410;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alWordProcessor|0x200:
                        *v1 = 411;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alTextEditor|0x200:
                        *v1 = 412;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alSpreadsheet|0x200:
                        *v1 = 413;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alGraphicsEditor|0x200:
                        *v1 = 414;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alPresentationApp|0x200:
                        *v1 = 415;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alDatabaseApp|0x200:
                        *v1 = 416;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alEmailReader|0x200:
                        *v1 = 417;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alNewsreader|0x200:
                        *v1 = 418;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alVoicemail|0x200:
                        *v1 = 419;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alContactsOrAddressBook|0x200:
                        *v1 = 420;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alCalendarOrSchedule|0x200:
                        *v1 = 421;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alTaskOrProjectManager|0x200:
                        *v1 = 422;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alLogOrJournalOrTimecard|0x200:
                        *v1 = 423;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alLocalMachineBrowser|0x200:
                        *v1 = 424;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alLANOrWANBrowser|0x200:
                        *v1 = 425;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alInternetBrowser|0x200:
                        *v1 = 426;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alRemoteNetworkingOrISPConnect|0x200:
                        *v1 = 427;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alNetworkConference|0x200:
                        *v1 = 428;
                        break;
                      default:
                        if (rawValue.value == (CoreHID_HIDUsage_ConsumerUsage_acPaste|0x400))
                          v3 = 449;
                        else
                          v3 = 450;
                        if (rawValue.value == (CoreHID_HIDUsage_ConsumerUsage_acCut|0x400))
                          v4 = 448;
                        else
                          v4 = v3;
                        *v1 = v4;
                        break;
                    }
                  }
                  else
                  {
                    *v1 = rawValue.value - 265;
                  }
                  break;
              }
              break;
          }
          break;
      }
      break;
  }
  return rawValue;
}

CoreHID::HIDUsage::DigitizersUsage_optional __swiftcall HIDUsage.DigitizersUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 90;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_92;
    case 2u:
      v2 = 1;
      goto LABEL_92;
    case 3u:
      v2 = 2;
      goto LABEL_92;
    case 4u:
      v2 = 3;
      goto LABEL_92;
    case 5u:
      v2 = 4;
      goto LABEL_92;
    case 6u:
      v2 = 5;
      goto LABEL_92;
    case 7u:
      v2 = 6;
      goto LABEL_92;
    case 8u:
      v2 = 7;
      goto LABEL_92;
    case 9u:
      v2 = 8;
      goto LABEL_92;
    case 0xAu:
      v2 = 9;
      goto LABEL_92;
    case 0xBu:
      v2 = 10;
      goto LABEL_92;
    case 0xCu:
      v2 = 11;
      goto LABEL_92;
    case 0xDu:
      v2 = 12;
      goto LABEL_92;
    case 0xEu:
      v2 = 13;
      goto LABEL_92;
    case 0xFu:
      v2 = 14;
      goto LABEL_92;
    case 0x20u:
      v2 = 15;
      goto LABEL_92;
    case 0x21u:
      v2 = 16;
      goto LABEL_92;
    case 0x22u:
      v2 = 17;
      goto LABEL_92;
    case 0x23u:
      v2 = 18;
      goto LABEL_92;
    case 0x24u:
      v2 = 19;
      goto LABEL_92;
    case 0x30u:
      v2 = 20;
      goto LABEL_92;
    case 0x31u:
      v2 = 21;
      goto LABEL_92;
    case 0x32u:
      v2 = 22;
      goto LABEL_92;
    case 0x33u:
      v2 = 23;
      goto LABEL_92;
    case 0x34u:
      v2 = 24;
      goto LABEL_92;
    case 0x35u:
      v2 = 25;
      goto LABEL_92;
    case 0x36u:
      v2 = 26;
      goto LABEL_92;
    case 0x37u:
      v2 = 27;
      goto LABEL_92;
    case 0x38u:
      v2 = 28;
      goto LABEL_92;
    case 0x39u:
      v2 = 29;
      goto LABEL_92;
    case 0x3Au:
      v2 = 30;
      goto LABEL_92;
    case 0x3Bu:
      v2 = 31;
      goto LABEL_92;
    case 0x3Cu:
      v2 = 32;
      goto LABEL_92;
    case 0x3Du:
      v2 = 33;
      goto LABEL_92;
    case 0x3Eu:
      v2 = 34;
      goto LABEL_92;
    case 0x3Fu:
      v2 = 35;
      goto LABEL_92;
    case 0x40u:
      v2 = 36;
      goto LABEL_92;
    case 0x41u:
      v2 = 37;
      goto LABEL_92;
    case 0x42u:
      v2 = 38;
      goto LABEL_92;
    case 0x43u:
      v2 = 39;
      goto LABEL_92;
    case 0x44u:
      v2 = 40;
      goto LABEL_92;
    case 0x45u:
      v2 = 41;
      goto LABEL_92;
    case 0x46u:
      v2 = 42;
      goto LABEL_92;
    case 0x47u:
      v2 = 43;
      goto LABEL_92;
    case 0x48u:
      v2 = 44;
      goto LABEL_92;
    case 0x49u:
      v2 = 45;
      goto LABEL_92;
    case 0x51u:
      v2 = 46;
      goto LABEL_92;
    case 0x52u:
      v2 = 47;
      goto LABEL_92;
    case 0x53u:
      v2 = 48;
      goto LABEL_92;
    case 0x54u:
      v2 = 49;
      goto LABEL_92;
    case 0x55u:
      v2 = 50;
      goto LABEL_92;
    case 0x56u:
      v2 = 51;
      goto LABEL_92;
    case 0x57u:
      v2 = 52;
      goto LABEL_92;
    case 0x58u:
      v2 = 53;
      goto LABEL_92;
    case 0x59u:
      v2 = 54;
      goto LABEL_92;
    case 0x5Au:
      v2 = 55;
      goto LABEL_92;
    case 0x5Bu:
      v2 = 56;
      goto LABEL_92;
    case 0x5Cu:
      v2 = 57;
      goto LABEL_92;
    case 0x5Du:
      v2 = 58;
      goto LABEL_92;
    case 0x5Eu:
      v2 = 59;
      goto LABEL_92;
    case 0x5Fu:
      v2 = 60;
      goto LABEL_92;
    case 0x60u:
      v2 = 61;
      goto LABEL_92;
    case 0x61u:
      v2 = 62;
      goto LABEL_92;
    case 0x62u:
      v2 = 63;
      goto LABEL_92;
    case 0x63u:
      v2 = 64;
      goto LABEL_92;
    case 0x64u:
      v2 = 65;
      goto LABEL_92;
    case 0x65u:
      v2 = 66;
      goto LABEL_92;
    case 0x66u:
      v2 = 67;
      goto LABEL_92;
    case 0x67u:
      v2 = 68;
      goto LABEL_92;
    case 0x68u:
      v2 = 69;
      goto LABEL_92;
    case 0x69u:
      v2 = 70;
      goto LABEL_92;
    case 0x6Au:
      v2 = 71;
      goto LABEL_92;
    case 0x6Bu:
      v2 = 72;
      goto LABEL_92;
    case 0x6Cu:
      v2 = 73;
      goto LABEL_92;
    case 0x6Du:
      v2 = 74;
      goto LABEL_92;
    case 0x6Eu:
      v2 = 75;
      goto LABEL_92;
    case 0x6Fu:
      v2 = 76;
      goto LABEL_92;
    case 0x70u:
      v2 = 77;
      goto LABEL_92;
    case 0x71u:
      v2 = 78;
      goto LABEL_92;
    case 0x72u:
      v2 = 79;
      goto LABEL_92;
    case 0x73u:
      v2 = 80;
      goto LABEL_92;
    case 0x74u:
      v2 = 81;
      goto LABEL_92;
    case 0x75u:
      v2 = 82;
      goto LABEL_92;
    case 0x76u:
      v2 = 83;
      goto LABEL_92;
    case 0x77u:
      v2 = 84;
      goto LABEL_92;
    case 0x80u:
      v2 = 85;
      goto LABEL_92;
    case 0x81u:
      v2 = 86;
      goto LABEL_92;
    case 0x82u:
      v2 = 87;
      goto LABEL_92;
    case 0x83u:
      v2 = 88;
      goto LABEL_92;
    case 0x84u:
      v2 = 89;
LABEL_92:
      v3 = v2;
      goto LABEL_93;
    case 0x85u:
LABEL_93:
      *v1 = v3;
      break;
    case 0x90u:
      *v1 = 91;
      break;
    case 0x91u:
      *v1 = 92;
      break;
    case 0x92u:
      *v1 = 93;
      break;
    case 0x93u:
      *v1 = 94;
      break;
    case 0x94u:
      *v1 = 95;
      break;
    case 0x95u:
      *v1 = 96;
      break;
    case 0x96u:
      *v1 = 97;
      break;
    case 0x97u:
      *v1 = 98;
      break;
    case 0x98u:
      *v1 = 99;
      break;
    case 0xA0u:
      *v1 = 100;
      break;
    case 0xA1u:
      *v1 = 101;
      break;
    case 0xA2u:
      *v1 = 102;
      break;
    case 0xA3u:
      *v1 = 103;
      break;
    case 0xA4u:
      *v1 = 104;
      break;
    case 0xA5u:
      *v1 = 105;
      break;
    case 0xA6u:
      *v1 = 106;
      break;
    case 0xB0u:
      *v1 = 107;
      break;
    default:
      *v1 = 108;
      break;
  }
  return (CoreHID::HIDUsage::DigitizersUsage_optional)rawValue;
}

CoreHID::HIDUsage::HapticsUsage_optional __swiftcall HIDUsage.HapticsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  switch(rawValue)
  {
    case 0x1001u:
      *v1 = 12;
      break;
    case 0x1002u:
      *v1 = 13;
      break;
    case 0x1003u:
      *v1 = 14;
      break;
    case 0x1004u:
      *v1 = 15;
      break;
    case 0x1005u:
      *v1 = 16;
      break;
    case 0x1006u:
      *v1 = 17;
      break;
    case 0x1007u:
      *v1 = 18;
      break;
    case 0x1008u:
      *v1 = 19;
      break;
    case 0x1009u:
      *v1 = 20;
      break;
    case 0x100Au:
      *v1 = 21;
      break;
    case 0x100Bu:
      *v1 = 22;
      break;
    case 0x100Cu:
      *v1 = 23;
      break;
    case 0x100Du:
      *v1 = 24;
      break;
    case 0x100Eu:
      *v1 = 25;
      break;
    case 0x100Fu:
      *v1 = 26;
      break;
    case 0x1010u:
      *v1 = 27;
      break;
    case 0x1011u:
      *v1 = 28;
      break;
    default:
      v2 = 0;
      v3 = 11;
      switch(rawValue)
      {
        case 1u:
          goto LABEL_30;
        case 0x10u:
          v2 = 1;
          goto LABEL_30;
        case 0x11u:
          v2 = 2;
          goto LABEL_30;
        case 0x20u:
          v2 = 3;
          goto LABEL_30;
        case 0x21u:
          v2 = 4;
          goto LABEL_30;
        case 0x22u:
          v2 = 5;
          goto LABEL_30;
        case 0x23u:
          v2 = 6;
          goto LABEL_30;
        case 0x24u:
          v2 = 7;
          goto LABEL_30;
        case 0x25u:
          v2 = 8;
          goto LABEL_30;
        case 0x26u:
          v2 = 9;
          goto LABEL_30;
        case 0x27u:
          v2 = 10;
LABEL_30:
          v3 = v2;
          goto LABEL_31;
        case 0x28u:
LABEL_31:
          *v1 = v3;
          break;
        default:
          *v1 = 29;
          break;
      }
      break;
  }
  return (CoreHID::HIDUsage::HapticsUsage_optional)rawValue;
}

CoreHID::HIDUsage::PhysicalInputDeviceUsage_optional __swiftcall HIDUsage.PhysicalInputDeviceUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 87;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_89;
    case 0x20u:
      v2 = 1;
      goto LABEL_89;
    case 0x21u:
      v2 = 2;
      goto LABEL_89;
    case 0x22u:
      v2 = 3;
      goto LABEL_89;
    case 0x23u:
      v2 = 4;
      goto LABEL_89;
    case 0x24u:
      v2 = 5;
      goto LABEL_89;
    case 0x25u:
      v2 = 6;
      goto LABEL_89;
    case 0x26u:
      v2 = 7;
      goto LABEL_89;
    case 0x27u:
      v2 = 8;
      goto LABEL_89;
    case 0x28u:
      v2 = 9;
      goto LABEL_89;
    case 0x30u:
      v2 = 10;
      goto LABEL_89;
    case 0x31u:
      v2 = 11;
      goto LABEL_89;
    case 0x32u:
      v2 = 12;
      goto LABEL_89;
    case 0x33u:
      v2 = 13;
      goto LABEL_89;
    case 0x34u:
      v2 = 14;
      goto LABEL_89;
    case 0x40u:
      v2 = 15;
      goto LABEL_89;
    case 0x41u:
      v2 = 16;
      goto LABEL_89;
    case 0x42u:
      v2 = 17;
      goto LABEL_89;
    case 0x43u:
      v2 = 18;
      goto LABEL_89;
    case 0x50u:
      v2 = 19;
      goto LABEL_89;
    case 0x51u:
      v2 = 20;
      goto LABEL_89;
    case 0x52u:
      v2 = 21;
      goto LABEL_89;
    case 0x53u:
      v2 = 22;
      goto LABEL_89;
    case 0x54u:
      v2 = 23;
      goto LABEL_89;
    case 0x55u:
      v2 = 24;
      goto LABEL_89;
    case 0x56u:
      v2 = 25;
      goto LABEL_89;
    case 0x57u:
      v2 = 26;
      goto LABEL_89;
    case 0x58u:
      v2 = 27;
      goto LABEL_89;
    case 0x59u:
      v2 = 28;
      goto LABEL_89;
    case 0x5Au:
      v2 = 29;
      goto LABEL_89;
    case 0x5Bu:
      v2 = 30;
      goto LABEL_89;
    case 0x5Cu:
      v2 = 31;
      goto LABEL_89;
    case 0x5Du:
      v2 = 32;
      goto LABEL_89;
    case 0x5Eu:
      v2 = 33;
      goto LABEL_89;
    case 0x5Fu:
      v2 = 34;
      goto LABEL_89;
    case 0x60u:
      v2 = 35;
      goto LABEL_89;
    case 0x61u:
      v2 = 36;
      goto LABEL_89;
    case 0x62u:
      v2 = 37;
      goto LABEL_89;
    case 0x63u:
      v2 = 38;
      goto LABEL_89;
    case 0x64u:
      v2 = 39;
      goto LABEL_89;
    case 0x65u:
      v2 = 40;
      goto LABEL_89;
    case 0x66u:
      v2 = 41;
      goto LABEL_89;
    case 0x67u:
      v2 = 42;
      goto LABEL_89;
    case 0x68u:
      v2 = 43;
      goto LABEL_89;
    case 0x69u:
      v2 = 44;
      goto LABEL_89;
    case 0x6Au:
      v2 = 45;
      goto LABEL_89;
    case 0x6Bu:
      v2 = 46;
      goto LABEL_89;
    case 0x6Cu:
      v2 = 47;
      goto LABEL_89;
    case 0x6Du:
      v2 = 48;
      goto LABEL_89;
    case 0x6Eu:
      v2 = 49;
      goto LABEL_89;
    case 0x6Fu:
      v2 = 50;
      goto LABEL_89;
    case 0x70u:
      v2 = 51;
      goto LABEL_89;
    case 0x71u:
      v2 = 52;
      goto LABEL_89;
    case 0x72u:
      v2 = 53;
      goto LABEL_89;
    case 0x73u:
      v2 = 54;
      goto LABEL_89;
    case 0x74u:
      v2 = 55;
      goto LABEL_89;
    case 0x75u:
      v2 = 56;
      goto LABEL_89;
    case 0x76u:
      v2 = 57;
      goto LABEL_89;
    case 0x77u:
      v2 = 58;
      goto LABEL_89;
    case 0x78u:
      v2 = 59;
      goto LABEL_89;
    case 0x79u:
      v2 = 60;
      goto LABEL_89;
    case 0x7Au:
      v2 = 61;
      goto LABEL_89;
    case 0x7Bu:
      v2 = 62;
      goto LABEL_89;
    case 0x7Cu:
      v2 = 63;
      goto LABEL_89;
    case 0x7Du:
      v2 = 64;
      goto LABEL_89;
    case 0x7Eu:
      v2 = 65;
      goto LABEL_89;
    case 0x7Fu:
      v2 = 66;
      goto LABEL_89;
    case 0x80u:
      v2 = 67;
      goto LABEL_89;
    case 0x81u:
      v2 = 68;
      goto LABEL_89;
    case 0x82u:
      v2 = 69;
      goto LABEL_89;
    case 0x83u:
      v2 = 70;
      goto LABEL_89;
    case 0x84u:
      v2 = 71;
      goto LABEL_89;
    case 0x85u:
      v2 = 72;
      goto LABEL_89;
    case 0x86u:
      v2 = 73;
      goto LABEL_89;
    case 0x87u:
      v2 = 74;
      goto LABEL_89;
    case 0x88u:
      v2 = 75;
      goto LABEL_89;
    case 0x89u:
      v2 = 76;
      goto LABEL_89;
    case 0x8Bu:
      v2 = 77;
      goto LABEL_89;
    case 0x8Cu:
      v2 = 78;
      goto LABEL_89;
    case 0x8Du:
      v2 = 79;
      goto LABEL_89;
    case 0x8Eu:
      v2 = 80;
      goto LABEL_89;
    case 0x8Fu:
      v2 = 81;
      goto LABEL_89;
    case 0x90u:
      v2 = 82;
      goto LABEL_89;
    case 0x91u:
      v2 = 83;
      goto LABEL_89;
    case 0x92u:
      v2 = 84;
      goto LABEL_89;
    case 0x94u:
      v2 = 85;
      goto LABEL_89;
    case 0x95u:
      v2 = 86;
LABEL_89:
      v3 = v2;
      goto LABEL_90;
    case 0x96u:
LABEL_90:
      *v1 = v3;
      break;
    case 0x97u:
      *v1 = 88;
      break;
    case 0x98u:
      *v1 = 89;
      break;
    case 0x99u:
      *v1 = 90;
      break;
    case 0x9Au:
      *v1 = 91;
      break;
    case 0x9Bu:
      *v1 = 92;
      break;
    case 0x9Cu:
      *v1 = 93;
      break;
    case 0x9Fu:
      *v1 = 94;
      break;
    case 0xA0u:
      *v1 = 95;
      break;
    case 0xA4u:
      *v1 = 96;
      break;
    case 0xA5u:
      *v1 = 97;
      break;
    case 0xA6u:
      *v1 = 98;
      break;
    case 0xA7u:
      *v1 = 99;
      break;
    case 0xA8u:
      *v1 = 100;
      break;
    case 0xA9u:
      *v1 = 101;
      break;
    case 0xAAu:
      *v1 = 102;
      break;
    case 0xABu:
      *v1 = 103;
      break;
    case 0xACu:
      *v1 = 104;
      break;
    default:
      *v1 = 105;
      break;
  }
  return (CoreHID::HIDUsage::PhysicalInputDeviceUsage_optional)rawValue;
}

CoreHID::HIDUsage::SOCUsage_optional __swiftcall HIDUsage.SOCUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  _BYTE *v1;
  unsigned int v2;

  v2 = (unsigned __int16)(rawValue - 1);
  if (v2 >= 0xA)
    LOBYTE(v2) = 10;
  *v1 = v2;
  return (CoreHID::HIDUsage::SOCUsage_optional)rawValue;
}

CoreHID::HIDUsage::EyeAndHeadTrackersUsage_optional __swiftcall HIDUsage.EyeAndHeadTrackersUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  if (rawValue > 0xFFu)
  {
    if (rawValue <= 0x1FFu)
    {
      switch(rawValue)
      {
        case 0x100u:
          *v1 = 19;
          break;
        case 0x101u:
          *v1 = 20;
          break;
        case 0x102u:
          *v1 = 21;
          break;
        case 0x103u:
          *v1 = 22;
          break;
        case 0x104u:
          *v1 = 23;
          break;
        case 0x105u:
          *v1 = 24;
          break;
        default:
          goto LABEL_44;
      }
    }
    else if (rawValue > 0x2FFu)
    {
      switch(rawValue)
      {
        case 0x300u:
          *v1 = 31;
          break;
        case 0x301u:
          *v1 = 32;
          break;
        case 0x400u:
          *v1 = 33;
          break;
        default:
LABEL_44:
          *v1 = 34;
          break;
      }
    }
    else
    {
      switch(rawValue)
      {
        case 0x200u:
          *v1 = 25;
          break;
        case 0x201u:
          *v1 = 26;
          break;
        case 0x202u:
          *v1 = 27;
          break;
        case 0x203u:
          *v1 = 28;
          break;
        case 0x204u:
          *v1 = 29;
          break;
        case 0x205u:
          *v1 = 30;
          break;
        default:
          goto LABEL_44;
      }
    }
  }
  else
  {
    v2 = 0;
    v3 = 16;
    switch(rawValue)
    {
      case 1u:
        goto LABEL_28;
      case 2u:
        v2 = 1;
        goto LABEL_28;
      case 0x10u:
        v2 = 2;
        goto LABEL_28;
      case 0x11u:
        v2 = 3;
        goto LABEL_28;
      case 0x12u:
        v2 = 4;
        goto LABEL_28;
      case 0x13u:
        v2 = 5;
        goto LABEL_28;
      case 0x14u:
        v2 = 6;
        goto LABEL_28;
      case 0x20u:
        v2 = 7;
        goto LABEL_28;
      case 0x21u:
        v2 = 8;
        goto LABEL_28;
      case 0x22u:
        v2 = 9;
        goto LABEL_28;
      case 0x23u:
        v2 = 10;
        goto LABEL_28;
      case 0x24u:
        v2 = 11;
        goto LABEL_28;
      case 0x25u:
        v2 = 12;
        goto LABEL_28;
      case 0x26u:
        v2 = 13;
        goto LABEL_28;
      case 0x27u:
        v2 = 14;
        goto LABEL_28;
      case 0x28u:
        v2 = 15;
LABEL_28:
        v3 = v2;
        goto LABEL_29;
      case 0x29u:
LABEL_29:
        *v1 = v3;
        break;
      case 0x2Au:
        *v1 = 17;
        break;
      case 0x2Bu:
        *v1 = 18;
        break;
      default:
        goto LABEL_44;
    }
  }
  return (CoreHID::HIDUsage::EyeAndHeadTrackersUsage_optional)rawValue;
}

CoreHID::HIDUsage::AuxiliaryDisplayUsage_optional __swiftcall HIDUsage.AuxiliaryDisplayUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 57;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_58;
    case 2u:
      v2 = 1;
      goto LABEL_58;
    case 0x20u:
      v2 = 2;
      goto LABEL_58;
    case 0x21u:
      v2 = 3;
      goto LABEL_58;
    case 0x22u:
      v2 = 4;
      goto LABEL_58;
    case 0x23u:
      v2 = 5;
      goto LABEL_58;
    case 0x24u:
      v2 = 6;
      goto LABEL_58;
    case 0x25u:
      v2 = 7;
      goto LABEL_58;
    case 0x26u:
      v2 = 8;
      goto LABEL_58;
    case 0x27u:
      v2 = 9;
      goto LABEL_58;
    case 0x28u:
      v2 = 10;
      goto LABEL_58;
    case 0x29u:
      v2 = 11;
      goto LABEL_58;
    case 0x2Au:
      v2 = 12;
      goto LABEL_58;
    case 0x2Bu:
      v2 = 13;
      goto LABEL_58;
    case 0x2Cu:
      v2 = 14;
      goto LABEL_58;
    case 0x2Du:
      v2 = 15;
      goto LABEL_58;
    case 0x2Eu:
      v2 = 16;
      goto LABEL_58;
    case 0x2Fu:
      v2 = 17;
      goto LABEL_58;
    case 0x30u:
      v2 = 18;
      goto LABEL_58;
    case 0x31u:
      v2 = 19;
      goto LABEL_58;
    case 0x32u:
      v2 = 20;
      goto LABEL_58;
    case 0x33u:
      v2 = 21;
      goto LABEL_58;
    case 0x34u:
      v2 = 22;
      goto LABEL_58;
    case 0x35u:
      v2 = 23;
      goto LABEL_58;
    case 0x36u:
      v2 = 24;
      goto LABEL_58;
    case 0x37u:
      v2 = 25;
      goto LABEL_58;
    case 0x38u:
      v2 = 26;
      goto LABEL_58;
    case 0x39u:
      v2 = 27;
      goto LABEL_58;
    case 0x3Au:
      v2 = 28;
      goto LABEL_58;
    case 0x3Bu:
      v2 = 29;
      goto LABEL_58;
    case 0x3Cu:
      v2 = 30;
      goto LABEL_58;
    case 0x3Du:
      v2 = 31;
      goto LABEL_58;
    case 0x3Eu:
      v2 = 32;
      goto LABEL_58;
    case 0x3Fu:
      v2 = 33;
      goto LABEL_58;
    case 0x40u:
      v2 = 34;
      goto LABEL_58;
    case 0x41u:
      v2 = 35;
      goto LABEL_58;
    case 0x42u:
      v2 = 36;
      goto LABEL_58;
    case 0x43u:
      v2 = 37;
      goto LABEL_58;
    case 0x44u:
      v2 = 38;
      goto LABEL_58;
    case 0x45u:
      v2 = 39;
      goto LABEL_58;
    case 0x46u:
      v2 = 40;
      goto LABEL_58;
    case 0x47u:
      v2 = 41;
      goto LABEL_58;
    case 0x48u:
      v2 = 42;
      goto LABEL_58;
    case 0x49u:
      v2 = 43;
      goto LABEL_58;
    case 0x4Au:
      v2 = 44;
      goto LABEL_58;
    case 0x4Bu:
      v2 = 45;
      goto LABEL_58;
    case 0x4Cu:
      v2 = 46;
      goto LABEL_58;
    case 0x4Du:
      v2 = 47;
      goto LABEL_58;
    case 0x80u:
      v2 = 48;
      goto LABEL_58;
    case 0x81u:
      v2 = 49;
      goto LABEL_58;
    case 0x82u:
      v2 = 50;
      goto LABEL_58;
    case 0x83u:
      v2 = 51;
      goto LABEL_58;
    case 0x84u:
      v2 = 52;
      goto LABEL_58;
    case 0x85u:
      v2 = 53;
      goto LABEL_58;
    case 0x86u:
      v2 = 54;
      goto LABEL_58;
    case 0x87u:
      v2 = 55;
      goto LABEL_58;
    case 0x88u:
      v2 = 56;
LABEL_58:
      v3 = v2;
      goto LABEL_59;
    case 0x8Au:
LABEL_59:
      *v1 = v3;
      break;
    case 0x8Bu:
      *v1 = 58;
      break;
    case 0x8Cu:
      *v1 = 59;
      break;
    case 0x8Du:
      *v1 = 60;
      break;
    case 0x8Eu:
      *v1 = 61;
      break;
    case 0x8Fu:
      *v1 = 62;
      break;
    case 0x90u:
      *v1 = 63;
      break;
    case 0x91u:
      *v1 = 64;
      break;
    case 0x92u:
      *v1 = 65;
      break;
    case 0x93u:
      *v1 = 66;
      break;
    case 0x94u:
      *v1 = 67;
      break;
    case 0x95u:
      *v1 = 68;
      break;
    case 0xC2u:
      *v1 = 69;
      break;
    case 0xCCu:
      *v1 = 70;
      break;
    case 0xCFu:
      *v1 = 71;
      break;
    case 0xDDu:
      *v1 = 72;
      break;
    case 0xDFu:
      *v1 = 73;
      break;
    case 0xFFu:
      *v1 = 74;
      break;
    default:
      *v1 = 75;
      break;
  }
  return (CoreHID::HIDUsage::AuxiliaryDisplayUsage_optional)rawValue;
}

CoreHID::HIDUsage::SensorsUsage_optional __swiftcall HIDUsage.SensorsUsage.init(rawValue:)(CoreHID::HIDUsage::SensorsUsage_optional rawValue)
{
  __int16 *v1;
  __int16 v2;
  __int16 v3;

  v2 = 0;
  switch(rawValue.value)
  {
    case CoreHID_HIDUsage_SensorsUsage_biometric:
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalResistance:
      v2 = 1;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalVoltage:
      v2 = 2;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalPotentiometer:
      v2 = 3;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalFrequency:
      v2 = 4;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalPeriod:
      v2 = 5;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmental:
      v2 = 6;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalAtmosphericPressure:
      v2 = 7;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalHumidity:
      v2 = 8;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalTemperature:
      v2 = 9;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalWindDirection:
      v2 = 10;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalObjectProximity:
      v2 = 11;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_light:
      v2 = 12;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightAmbientLight:
      v2 = 13;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightConsumerInfrared:
      v2 = 14;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightInfraredLight:
      v2 = 15;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightVisibleLight:
      v2 = 16;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightUltravioletLight:
      v2 = 17;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_location:
      v2 = 18;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_locationBroadcast:
      v2 = 19;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_locationDeadReckoning:
      v2 = 20;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalBooleanSwitch:
      v2 = 21;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalBooleanSwitchArray:
      v2 = 22;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalMultivalueSwitch:
      v2 = 23;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalForce:
      v2 = 24;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalPressure:
      v2 = 25;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalStrain:
      v2 = 26;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalWeight:
      v2 = 27;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalHapticVibrator:
      v2 = 28;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalHallEffectSwitch:
      v2 = 29;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motion:
      v2 = 30;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionAccelerometer1D:
      v2 = 31;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionAccelerometer2D:
      v2 = 32;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionMotionDetector:
      v2 = 33;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionSpeedometer:
      v2 = 34;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionAccelerometer:
      v2 = 35;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionGyrometer:
      v2 = 36;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionGravityVector:
      v2 = 37;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionLinearAccelerometer:
      v2 = 38;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationDeviceOrientation:
      v2 = 39;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationCompass:
      v2 = 40;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationInclinometer:
      v2 = 41;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationDistance:
      v2 = 42;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationRelativeOrientation:
      v2 = 43;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationSimpleOrientation:
      v2 = 44;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_scanner:
      v2 = 45;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_scannerBarcode:
      v2 = 46;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_personalActivityPedometer:
      v2 = 47;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_personalActivityStepDetection:
      v2 = 48;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationExtended:
      v2 = 49;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationExtendedGeomagneticOrientation:
      v2 = 50;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationExtendedMagnetometer:
      v2 = 51;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_gesture:
      v2 = 52;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_gestureChassisFlipGesture:
      v2 = 53;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_gestureHingeFoldGesture:
      v2 = 54;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_other:
      v2 = 55;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_otherCustom:
      v2 = 56;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved4:
      v2 = 57;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved5:
      v2 = 58;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved6:
      v2 = 59;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved7:
      v2 = 60;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved8:
      v2 = 61;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved9:
      v2 = 62;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved10:
      v2 = 63;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved11:
      v2 = 64;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved12:
      v2 = 65;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved13:
      v2 = 66;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved14:
      v2 = 67;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved15:
      v2 = 68;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved16:
      v2 = 69;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_property:
      v2 = 70;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyFriendlyName:
      v2 = 71;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyPersistentUniqueID:
      v2 = 72;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorStatus:
      v2 = 73;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyMinimumReportInterval:
      v2 = 74;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorManufacturer:
      v2 = 75;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorModel:
      v2 = 76;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorSerialNumber:
      v2 = 77;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorDescription:
      v2 = 78;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorConnectionType:
      v2 = 79;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorDevicePath:
      v2 = 80;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyHardwareRevision:
      v2 = 81;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyFirmwareVersion:
      v2 = 82;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyReleaseDate:
      v2 = 83;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyReportInterval:
      v2 = 84;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyChangeSensitivityAbsolute:
      v2 = 85;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyChangeSensitivityPercentOfRange:
      v2 = 86;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyChangeSensitivityPercentRelative:
      v2 = 87;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyAccuracy:
      v2 = 88;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyResolution:
      v2 = 89;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldLocation:
      v2 = 90;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAltitudeAntennaSeaLevel:
      v2 = 91;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDifferentialReferenceStationID:
      v2 = 92;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldHorizontalDilutionOfPrecision:
      v2 = 93;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldVerticalDilutionOfPrecision:
      v2 = 94;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldLatitude:
      v2 = 95;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldLongitude:
      v2 = 96;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTrueHeading:
      v2 = 97;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldNMEASentence:
      v2 = 98;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAddressLine1:
      v2 = 99;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAddressLine2:
      v2 = 100;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldEquivalentCO2:
      v2 = 101;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldVolatileOrganicCompoundConcentration:
      v2 = 102;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldObjectPresence:
      v2 = 103;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularVelocityAboutZAxis:
      v2 = 104;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPosition:
      v2 = 105;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPositionAboutXAxis:
      v2 = 106;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPositionAboutYAxis:
      v2 = 107;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPositionAboutZAxis:
      v2 = 108;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistance:
      v2 = 109;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceXAxis:
      v2 = 110;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceYAxis:
      v2 = 111;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceZAxis:
      v2 = 112;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceOutOfRange:
      v2 = 113;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTilt:
      v2 = 114;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTiltXAxis:
      v2 = 115;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTiltYAxis:
      v2 = 116;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTiltZAxis:
      v2 = 117;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldRotationMatrix:
      v2 = 118;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldQuaternion:
      v2 = 119;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFlux:
      v2 = 120;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFluxXAxis:
      v2 = 121;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFluxYAxis:
      v2 = 122;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFluxZAxis:
      v2 = 123;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagnetometerAccuracy:
      v2 = 124;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_magnetometerAccuracyMedium:
      v2 = 125;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_magnetometerAccuracyHigh:
      v2 = 126;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_simpleOrientationDirectionNotRotated:
      v2 = 127;
LABEL_131:
      v3 = v2;
LABEL_132:
      *v1 = v3;
      return rawValue;
    default:
      v2 = 128;
      switch(rawValue.value)
      {
        case 0x300:
          goto LABEL_131;
        case 0x301:
          v2 = 129;
          goto LABEL_131;
        case 0x302:
          v2 = 130;
          goto LABEL_131;
        case 0x303:
          v2 = 131;
          goto LABEL_131;
        case 0x304:
          v2 = 132;
          goto LABEL_131;
        case 0x305:
          v2 = 133;
          goto LABEL_131;
        case 0x306:
          v2 = 134;
          goto LABEL_131;
        case 0x307:
          v2 = 135;
          goto LABEL_131;
        case 0x308:
          v2 = 136;
          goto LABEL_131;
        case 0x309:
          v2 = 137;
          goto LABEL_131;
        case 0x30A:
          v2 = 138;
          goto LABEL_131;
        case 0x30B:
          v2 = 139;
          goto LABEL_131;
        case 0x30C:
          v2 = 140;
          goto LABEL_131;
        case 0x30D:
          v2 = 141;
          goto LABEL_131;
        case 0x30E:
          v2 = 142;
          goto LABEL_131;
        case 0x30F:
          v2 = 143;
          goto LABEL_131;
        case 0x310:
          v2 = 144;
          goto LABEL_131;
        case 0x311:
          v2 = 145;
          goto LABEL_131;
        case 0x312:
          v2 = 146;
          goto LABEL_131;
        case 0x313:
          v2 = 147;
          goto LABEL_131;
        case 0x314:
          v2 = 148;
          goto LABEL_131;
        case 0x315:
          v2 = 149;
          goto LABEL_131;
        case 0x316:
          v2 = 150;
          goto LABEL_131;
        case 0x317:
          v2 = 151;
          goto LABEL_131;
        case 0x318:
          v2 = 152;
          goto LABEL_131;
        case 0x319:
          v2 = 153;
          goto LABEL_131;
        case 0x31A:
          v2 = 154;
          goto LABEL_131;
        case 0x31B:
          v2 = 155;
          goto LABEL_131;
        case 0x31C:
          v2 = 156;
          goto LABEL_131;
        case 0x31D:
          v2 = 157;
          goto LABEL_131;
        case 0x31E:
          v2 = 158;
          goto LABEL_131;
        case 0x31F:
          v2 = 159;
          goto LABEL_131;
        case 0x400:
          v2 = 160;
          goto LABEL_131;
        case 0x402:
          v2 = 161;
          goto LABEL_131;
        case 0x403:
          v2 = 162;
          goto LABEL_131;
        case 0x404:
          v2 = 163;
          goto LABEL_131;
        case 0x405:
          v2 = 164;
          goto LABEL_131;
        case 0x406:
          v2 = 165;
          goto LABEL_131;
        case 0x407:
          v2 = 166;
          goto LABEL_131;
        case 0x408:
          v2 = 167;
          goto LABEL_131;
        case 0x409:
          v2 = 168;
          goto LABEL_131;
        case 0x40A:
          v2 = 169;
          goto LABEL_131;
        case 0x40B:
          v2 = 170;
          goto LABEL_131;
        case 0x40C:
          v2 = 171;
          goto LABEL_131;
        case 0x40D:
          v2 = 172;
          goto LABEL_131;
        case 0x40E:
          v2 = 173;
          goto LABEL_131;
        case 0x40F:
          v2 = 174;
          goto LABEL_131;
        case 0x410:
          v2 = 175;
          goto LABEL_131;
        case 0x411:
          v2 = 176;
          goto LABEL_131;
        case 0x412:
          v2 = 177;
          goto LABEL_131;
        case 0x413:
          v2 = 178;
          goto LABEL_131;
        case 0x414:
          v2 = 179;
          goto LABEL_131;
        case 0x415:
          v2 = 180;
          goto LABEL_131;
        case 0x416:
          v2 = 181;
          goto LABEL_131;
        case 0x417:
          v2 = 182;
          goto LABEL_131;
        case 0x418:
          v2 = 183;
          goto LABEL_131;
        case 0x419:
          v2 = 184;
          goto LABEL_131;
        case 0x41A:
          v2 = 185;
          goto LABEL_131;
        case 0x41B:
          v2 = 186;
          goto LABEL_131;
        case 0x41C:
          v2 = 187;
          goto LABEL_131;
        case 0x41D:
          v2 = 188;
          goto LABEL_131;
        case 0x41E:
          v2 = 189;
          goto LABEL_131;
        case 0x41F:
          v2 = 190;
          goto LABEL_131;
        case 0x420:
          v2 = 191;
          goto LABEL_131;
        default:
          v2 = 192;
          switch(rawValue.value)
          {
            case 0x421:
              goto LABEL_131;
            case 0x422:
              v2 = 193;
              goto LABEL_131;
            case 0x423:
              v2 = 194;
              goto LABEL_131;
            case 0x424:
              v2 = 195;
              goto LABEL_131;
            case 0x425:
              v2 = 196;
              goto LABEL_131;
            case 0x426:
              v2 = 197;
              goto LABEL_131;
            case 0x427:
              v2 = 198;
              goto LABEL_131;
            case 0x42A:
              v2 = 199;
              goto LABEL_131;
            case 0x42B:
              v2 = 200;
              goto LABEL_131;
            case 0x430:
              v2 = 201;
              goto LABEL_131;
            case 0x431:
              v2 = 202;
              goto LABEL_131;
            case 0x433:
              v2 = 203;
              goto LABEL_131;
            case 0x434:
              v2 = 204;
              goto LABEL_131;
            case 0x435:
              v2 = 205;
              goto LABEL_131;
            case 0x436:
              v2 = 206;
              goto LABEL_131;
            case 0x437:
              v2 = 207;
              goto LABEL_131;
            case 0x438:
              v2 = 208;
              goto LABEL_131;
            case 0x439:
              v2 = 209;
              goto LABEL_131;
            case 0x43A:
              v2 = 210;
              goto LABEL_131;
            case 0x43B:
              v2 = 211;
              goto LABEL_131;
            case 0x43C:
              v2 = 212;
              goto LABEL_131;
            case 0x440:
              v2 = 213;
              goto LABEL_131;
            case 0x441:
              v2 = 214;
              goto LABEL_131;
            case 0x450:
              v2 = 215;
              goto LABEL_131;
            case 0x451:
              v2 = 216;
              goto LABEL_131;
            case 0x452:
              v2 = 217;
              goto LABEL_131;
            case 0x453:
              v2 = 218;
              goto LABEL_131;
            case 0x454:
              v2 = 219;
              goto LABEL_131;
            case 0x455:
              v2 = 220;
              goto LABEL_131;
            case 0x456:
              v2 = 221;
              goto LABEL_131;
            case 0x457:
              v2 = 222;
              goto LABEL_131;
            case 0x458:
              v2 = 223;
              goto LABEL_131;
            case 0x459:
              v2 = 224;
              goto LABEL_131;
            case 0x45A:
              v2 = 225;
              goto LABEL_131;
            case 0x45B:
              v2 = 226;
              goto LABEL_131;
            case 0x45C:
              v2 = 227;
              goto LABEL_131;
            case 0x45D:
              v2 = 228;
              goto LABEL_131;
            case 0x45E:
              v2 = 229;
              goto LABEL_131;
            case 0x45F:
              v2 = 230;
              goto LABEL_131;
            case 0x470:
              v2 = 231;
              goto LABEL_131;
            case 0x471:
              v2 = 232;
              goto LABEL_131;
            case 0x472:
              v2 = 233;
              goto LABEL_131;
            case 0x473:
              v2 = 234;
              goto LABEL_131;
            case 0x474:
              v2 = 235;
              goto LABEL_131;
            case 0x475:
              v2 = 236;
              goto LABEL_131;
            case 0x476:
              v2 = 237;
              goto LABEL_131;
            case 0x477:
              v2 = 238;
              goto LABEL_131;
            case 0x478:
              v2 = 239;
              goto LABEL_131;
            case 0x479:
              v2 = 240;
              goto LABEL_131;
            case 0x47A:
              v2 = 241;
              goto LABEL_131;
            case 0x47B:
              v2 = 242;
              goto LABEL_131;
            case 0x47C:
              v2 = 243;
              goto LABEL_131;
            case 0x47D:
              v2 = 244;
              goto LABEL_131;
            case 0x47E:
              v2 = 245;
              goto LABEL_131;
            case 0x47F:
              v2 = 246;
              goto LABEL_131;
            case 0x480:
              v2 = 247;
              goto LABEL_131;
            case 0x481:
              v2 = 248;
              goto LABEL_131;
            case 0x482:
              v2 = 249;
              goto LABEL_131;
            case 0x483:
              v2 = 250;
              goto LABEL_131;
            case 0x484:
              v2 = 251;
              goto LABEL_131;
            case 0x485:
              v2 = 252;
              goto LABEL_131;
            case 0x486:
              v2 = 253;
              goto LABEL_131;
            case 0x487:
              v2 = 254;
              goto LABEL_131;
            case 0x488:
              v2 = 255;
              goto LABEL_131;
            default:
              v2 = 256;
              switch(rawValue.value)
              {
                case 0x489:
                  goto LABEL_131;
                case 0x490:
                  v2 = 257;
                  goto LABEL_131;
                case 0x491:
                  v2 = 258;
                  goto LABEL_131;
                case 0x492:
                  v2 = 259;
                  goto LABEL_131;
                case 0x493:
                  v2 = 260;
                  goto LABEL_131;
                case 0x494:
                  v2 = 261;
                  goto LABEL_131;
                case 0x495:
                  v2 = 262;
                  goto LABEL_131;
                case 0x496:
                  v2 = 263;
                  goto LABEL_131;
                case 0x497:
                  v2 = 264;
                  goto LABEL_131;
                case 0x498:
                  v2 = 265;
                  goto LABEL_131;
                case 0x4A0:
                  v2 = 266;
                  goto LABEL_131;
                case 0x4A1:
                  v2 = 267;
                  goto LABEL_131;
                case 0x4A2:
                  v2 = 268;
                  goto LABEL_131;
                case 0x4A3:
                  v2 = 269;
                  goto LABEL_131;
                case 0x4B0:
                  v2 = 270;
                  goto LABEL_131;
                case 0x4B1:
                  v2 = 271;
                  goto LABEL_131;
                case 0x4B2:
                  v2 = 272;
                  goto LABEL_131;
                case 0x4B3:
                  v2 = 273;
                  goto LABEL_131;
                case 0x4B4:
                  v2 = 274;
                  goto LABEL_131;
                case 0x4B5:
                  v2 = 275;
                  goto LABEL_131;
                case 0x4B6:
                  v2 = 276;
                  goto LABEL_131;
                case 0x4B7:
                  v2 = 277;
                  goto LABEL_131;
                case 0x4B8:
                  v2 = 278;
                  goto LABEL_131;
                case 0x4B9:
                  v2 = 279;
                  goto LABEL_131;
                case 0x4BA:
                  v2 = 280;
                  goto LABEL_131;
                case 0x4BB:
                  v2 = 281;
                  goto LABEL_131;
                case 0x4BC:
                  v2 = 282;
                  goto LABEL_131;
                case 0x4BD:
                  v2 = 283;
                  goto LABEL_131;
                case 0x4D0:
                  v2 = 284;
                  goto LABEL_131;
                case 0x4D1:
                  v2 = 285;
                  goto LABEL_131;
                case 0x4D2:
                  v2 = 286;
                  goto LABEL_131;
                case 0x4D3:
                  v2 = 287;
                  goto LABEL_131;
                case 0x4D4:
                  v2 = 288;
                  goto LABEL_131;
                case 0x4D5:
                  v2 = 289;
                  goto LABEL_131;
                case 0x4D6:
                  v2 = 290;
                  goto LABEL_131;
                case 0x4D7:
                  v2 = 291;
                  goto LABEL_131;
                case 0x4D8:
                  v2 = 292;
                  goto LABEL_131;
                case 0x4D9:
                  v2 = 293;
                  goto LABEL_131;
                case 0x4DA:
                  v2 = 294;
                  goto LABEL_131;
                case 0x4DB:
                  v2 = 295;
                  goto LABEL_131;
                case 0x4DC:
                  v2 = 296;
                  goto LABEL_131;
                case 0x4DD:
                  v2 = 297;
                  goto LABEL_131;
                case 0x4DE:
                  v2 = 298;
                  goto LABEL_131;
                case 0x4DF:
                  v2 = 299;
                  goto LABEL_131;
                case 0x4E0:
                  v2 = 300;
                  goto LABEL_131;
                case 0x4E2:
                  v2 = 301;
                  goto LABEL_131;
                case 0x4E3:
                  v2 = 302;
                  goto LABEL_131;
                case 0x4F0:
                  v2 = 303;
                  goto LABEL_131;
                case 0x4F1:
                  v2 = 304;
                  goto LABEL_131;
                case 0x4F2:
                  v2 = 305;
                  goto LABEL_131;
                case 0x4F8:
                  v2 = 306;
                  goto LABEL_131;
                case 0x4F9:
                  v2 = 307;
                  goto LABEL_131;
                case 0x500:
                  v2 = 308;
                  goto LABEL_131;
                case 0x501:
                  v2 = 309;
                  goto LABEL_131;
                case 0x502:
                  v2 = 310;
                  goto LABEL_131;
                case 0x503:
                  v2 = 311;
                  goto LABEL_131;
                case 0x504:
                  v2 = 312;
                  goto LABEL_131;
                case 0x505:
                  v2 = 313;
                  goto LABEL_131;
                case 0x506:
                  v2 = 314;
                  goto LABEL_131;
                case 0x507:
                  v2 = 315;
                  goto LABEL_131;
                case 0x508:
                  v2 = 316;
                  goto LABEL_131;
                case 0x509:
                  v2 = 317;
                  goto LABEL_131;
                case 0x520:
                  v2 = 318;
                  goto LABEL_131;
                case 0x521:
                  v2 = 319;
                  goto LABEL_131;
                default:
                  v2 = 320;
                  switch(rawValue.value)
                  {
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldConsumerIRSentenceReceive|0x400:
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldInfraredLight|0x400:
                      v2 = 321;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldRedLight|0x400:
                      v2 = 322;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldGreenLight|0x400:
                      v2 = 323;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldBlueLight|0x400:
                      v2 = 324;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldUltravioletALight|0x400:
                      v2 = 325;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldUltravioletBLight|0x400:
                      v2 = 326;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldUltravioletIndex|0x400:
                      v2 = 327;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldNearInfraredLight|0x400:
                      v2 = 328;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyLight|0x400:
                      v2 = 329;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldRFIDTag40Bit|0x400:
                      v2 = 330;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldNFCSentenceReceive|0x400:
                      v2 = 331;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyScanner|0x400:
                      v2 = 332;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyNFCSentenceSend|0x400:
                      v2 = 333;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldElectrical|0x400:
                      v2 = 334;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCapacitance|0x400:
                      v2 = 335;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldMonth|0x400:
                      v2 = 336;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldDay|0x400:
                      v2 = 337;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldDayOfWeek|0x400:
                      v2 = 338;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldHour|0x400:
                      v2 = 339;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldMinute|0x400:
                      v2 = 340;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldSecond|0x400:
                      v2 = 341;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldMillisecond|0x400:
                      v2 = 342;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldTimestamp|0x400:
                      v2 = 343;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldJulianDayOfYear|0x400:
                      v2 = 344;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldTimeSinceSystemBoot|0x400:
                      v2 = 345;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTime|0x400:
                      v2 = 346;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneOffsetFromUTC|0x400:
                      v2 = 347;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneName|0x400:
                      v2 = 348;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyDaylightSavingsTimeObserved|0x400:
                      v2 = 349;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTimeTrimAdjustment|0x400:
                      v2 = 350;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyArmAlarm|0x400:
                      v2 = 351;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustom|0x400:
                      v2 = 352;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomUsage|0x400:
                      v2 = 353;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomBooleanArray|0x400:
                      v2 = 354;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue|0x400:
                      v2 = 355;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue1|0x400:
                      v2 = 356;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue2|0x400:
                      v2 = 357;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue3|0x400:
                      v2 = 358;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue4|0x400:
                      v2 = 359;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue5|0x400:
                      v2 = 360;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue6|0x400:
                      v2 = 361;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue7|0x400:
                      v2 = 362;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue8|0x400:
                      v2 = 363;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue9|0x400:
                      v2 = 364;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue10|0x400:
                      v2 = 365;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue11|0x400:
                      v2 = 366;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue12|0x400:
                      v2 = 367;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue13|0x400:
                      v2 = 368;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue14|0x400:
                      v2 = 369;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue15|0x400:
                      v2 = 370;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue16|0x400:
                      v2 = 371;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue17|0x400:
                      v2 = 372;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue18|0x400:
                      v2 = 373;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue19|0x400:
                      v2 = 374;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue20|0x400:
                      v2 = 375;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue21|0x400:
                      v2 = 376;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue22|0x400:
                      v2 = 377;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue23|0x400:
                      v2 = 378;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue24|0x400:
                      v2 = 379;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue25|0x400:
                      v2 = 380;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue26|0x400:
                      v2 = 381;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue27|0x400:
                      v2 = 382;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue28|0x400:
                      v2 = 383;
                      goto LABEL_131;
                    default:
                      v2 = 384;
                      switch(rawValue.value)
                      {
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGeneric|0x400:
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKey|0x400:
                          v2 = 385;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericCategoryGUID|0x400:
                          v2 = 386;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTypeGUID|0x400:
                          v2 = 387;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEventPropertyKey|0x400:
                          v2 = 388;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyPropertyKey|0x400:
                          v2 = 389;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataFieldPropertyKey|0x400:
                          v2 = 390;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEvent|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericProperty|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataField|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowIndex|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKeyKind|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUID|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyKey|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTopLevelCollectionID|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitOfMeasure|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitExponent|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportSize|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyGeneric|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyEnumeratorTableRowIndex|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyEnumeratorTableRowCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldPersonalActivity|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldActivityType|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldActivityState|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldDevicePosition|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepCountReset|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomTypeID|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustom|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue1|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue2|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue3|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue4|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue5|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue6|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue13|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue14|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue15|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue16|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHinge|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeAngle|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGestureSensor|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGestureState|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldInitialAngle|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldFinalAngle|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldType|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateUndefined|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateReady|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateNotAvailable|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateNoData|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateInitializing|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateAccessDenied|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateError|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventUnknown|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventStateChanged|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventPropertyChanged|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventDataUpdated|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventPollResponse|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventChangeSensitivity|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventRangeMaximumReached|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateWakeOnAllEvents|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateWakeOnThresholdEvents|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateUndefined|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD0FullPower|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD1LowPower|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD2StandbyPowerWithWakeup|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD3SleepWithWakeup|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD4PowerOff|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyDefault|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyHigh|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyMedium|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyLow|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixQualityNoFix|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixQualityGPS|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixQualityDGPS|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeDGPSSPSModeFixValid|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeGPSPPSModeFixValid|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeRealTimeKinematic|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeFloatRTK|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeEstimatedDeadReckoned|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeManualInputMode|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeSimulatorMode|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsOperationModeManual|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsOperationModeAutomatic|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeAutonomous|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeDGPS|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeEstimatedDeadReckoned|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeManualInput|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeSimulator|0x400:
                          goto LABEL_452;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportID|0x400:
                          v2 = 391;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportItemPositionIndex|0x400:
                          v2 = 392;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericFirmwareVARTYPE|0x400:
                          v2 = 393;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepDuration|0x400:
                          v2 = 394;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepType|0x400:
                          v2 = 395;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyMinimumActivityDetectionInterval|0x400:
                          v2 = 396;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySupportedActivityTypes|0x400:
                          v2 = 397;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySubscribedActivityTypes|0x400:
                          v2 = 398;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySupportedStepTypes|0x400:
                          v2 = 399;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySubscribedStepTypes|0x400:
                          v2 = 400;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyFloorHeight|0x400:
                          v2 = 401;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue7|0x400:
                          v2 = 402;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue8|0x400:
                          v2 = 403;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue9|0x400:
                          v2 = 404;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue10|0x400:
                          v2 = 405;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue11|0x400:
                          v2 = 406;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue12|0x400:
                          v2 = 407;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldContributingPanel|0x400:
                          v2 = 408;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventRangeMinimumReached|0x400:
                          v2 = 409;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossUpward|0x400:
                          v2 = 410;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossDownward|0x400:
                          v2 = 411;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventLowThresholdCrossUpward|0x400:
                          v2 = 412;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventLowThresholdCrossDownward|0x400:
                          v2 = 413;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventZeroThresholdCrossUpward|0x400:
                          v2 = 414;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventZeroThresholdCrossDownward|0x400:
                          v2 = 415;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventPeriodExceeded|0x400:
                          v2 = 416;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventFrequencyExceeded|0x400:
                          v2 = 417;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventComplexTrigger|0x400:
                          v2 = 418;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_connectionTypePCIntegrated|0x400:
                          v2 = 419;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_connectionTypePCAttached|0x400:
                          v2 = 420;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_connectionTypePCExternal|0x400:
                          v2 = 421;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateReportNoEvents|0x400:
                          v2 = 422;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateReportAllEvents|0x400:
                          v2 = 423;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateReportThresholdEvents|0x400:
                          v2 = 424;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateWakeOnNoEvents|0x400:
                          v2 = 425;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeNoFix|0x400:
                          v2 = 426;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeGPSSPSModeFixValid|0x400:
                          v2 = 427;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeDataNotValid|0x400:
                          v2 = 428;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_gpsStatusDataValid|0x400:
                          v2 = 429;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_gpsStatusDataNotValid|0x400:
                          v2 = 430;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dayOfWeekSunday|0x400:
                          v2 = 431;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dayOfWeekMonday|0x400:
                          v2 = 432;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dayOfWeekTuesday|0x400:
                          v2 = 433;
                          goto LABEL_131;
                        default:
                          switch(rawValue.value)
                          {
                            case 0x800:
                              v2 = 434;
                              goto LABEL_131;
                            case 0x801:
                              v2 = 435;
                              goto LABEL_131;
                            case 0x802:
                              v2 = 436;
                              goto LABEL_131;
                            case 0x803:
                              v2 = 437;
                              goto LABEL_131;
                            case 0x804:
                              v2 = 438;
                              goto LABEL_131;
                            case 0x805:
                              v2 = 439;
                              goto LABEL_131;
                            case 0x806:
                              v2 = 440;
                              goto LABEL_131;
                            case 0x810:
                              v2 = 441;
                              goto LABEL_131;
                            case 0x811:
                              v2 = 442;
                              goto LABEL_131;
                            case 0x812:
                              v2 = 443;
                              goto LABEL_131;
                            case 0x813:
                              v2 = 444;
                              goto LABEL_131;
                            case 0x814:
                              v2 = 445;
                              goto LABEL_131;
                            case 0x815:
                              v2 = 446;
                              goto LABEL_131;
                            case 0x816:
                              v2 = 447;
                              goto LABEL_131;
                            default:
                              goto LABEL_452;
                          }
                      }
                  }
              }
          }
      }
  }
LABEL_452:
  v2 = 448;
  switch(rawValue.value)
  {
    case 0x817:
      goto LABEL_131;
    case 0x818:
      v2 = 449;
      goto LABEL_131;
    case 0x819:
      v2 = 450;
      goto LABEL_131;
    case 0x81A:
      v2 = 451;
      goto LABEL_131;
    case 0x81B:
      v2 = 452;
      goto LABEL_131;
    case 0x81C:
      v2 = 453;
      goto LABEL_131;
    case 0x81D:
      v2 = 454;
      goto LABEL_131;
    case 0x81E:
      v2 = 455;
      goto LABEL_131;
    case 0x81F:
      v2 = 456;
      goto LABEL_131;
    case 0x820:
      v2 = 457;
      goto LABEL_131;
    case 0x830:
      v2 = 458;
      goto LABEL_131;
    case 0x831:
      v2 = 459;
      goto LABEL_131;
    case 0x832:
      v2 = 460;
      goto LABEL_131;
    case 0x840:
      v2 = 461;
      goto LABEL_131;
    case 0x841:
      v2 = 462;
      goto LABEL_131;
    case 0x842:
      v2 = 463;
      goto LABEL_131;
    case 0x843:
      v2 = 464;
      goto LABEL_131;
    case 0x844:
      v2 = 465;
      goto LABEL_131;
    case 0x845:
      v2 = 466;
      goto LABEL_131;
    case 0x850:
      v2 = 467;
      goto LABEL_131;
    case 0x851:
      v2 = 468;
      goto LABEL_131;
    case 0x852:
      v2 = 469;
      goto LABEL_131;
    case 0x853:
      v2 = 470;
      goto LABEL_131;
    case 0x854:
      v2 = 471;
      goto LABEL_131;
    case 0x855:
      v2 = 472;
      goto LABEL_131;
    case 0x860:
      v2 = 473;
      goto LABEL_131;
    case 0x861:
      v2 = 474;
      goto LABEL_131;
    case 0x862:
      v2 = 475;
      goto LABEL_131;
    case 0x863:
      v2 = 476;
      goto LABEL_131;
    case 0x870:
      v2 = 477;
      goto LABEL_131;
    case 0x871:
      v2 = 478;
      goto LABEL_131;
    case 0x872:
      v2 = 479;
      goto LABEL_131;
    case 0x880:
      v2 = 480;
      goto LABEL_131;
    case 0x881:
      v2 = 481;
      goto LABEL_131;
    case 0x882:
      v2 = 482;
      goto LABEL_131;
    case 0x883:
      v2 = 483;
      goto LABEL_131;
    case 0x884:
      v2 = 484;
      goto LABEL_131;
    case 0x885:
      v2 = 485;
      goto LABEL_131;
    case 0x886:
      v2 = 486;
      goto LABEL_131;
    case 0x887:
      v2 = 487;
      goto LABEL_131;
    case 0x888:
      v2 = 488;
      goto LABEL_131;
    case 0x890:
      v2 = 489;
      goto LABEL_131;
    case 0x891:
      v2 = 490;
      goto LABEL_131;
    case 0x8A0:
      v2 = 491;
      goto LABEL_131;
    case 0x8A1:
      v2 = 492;
      goto LABEL_131;
    case 0x8A2:
      v2 = 493;
      goto LABEL_131;
    case 0x8A3:
      v2 = 494;
      goto LABEL_131;
    case 0x8A4:
      v2 = 495;
      goto LABEL_131;
    case 0x8A5:
      v2 = 496;
      goto LABEL_131;
    case 0x8B0:
      v2 = 497;
      goto LABEL_131;
    case 0x8B1:
      v2 = 498;
      goto LABEL_131;
    case 0x8C0:
      v2 = 499;
      goto LABEL_131;
    case 0x8C1:
      v2 = 500;
      goto LABEL_131;
    case 0x8C2:
      v2 = 501;
      goto LABEL_131;
    case 0x8C3:
      v2 = 502;
      goto LABEL_131;
    case 0x8C4:
      v2 = 503;
      goto LABEL_131;
    case 0x8C5:
      v2 = 504;
      goto LABEL_131;
    case 0x8C6:
      v2 = 505;
      goto LABEL_131;
    case 0x8D0:
      v2 = 506;
      goto LABEL_131;
    case 0x8D1:
      v2 = 507;
      goto LABEL_131;
    case 0x8D2:
      v2 = 508;
      goto LABEL_131;
    case 0x8D3:
      v2 = 509;
      goto LABEL_131;
    case 0x8D4:
      v2 = 510;
      goto LABEL_131;
    case 0x8E0:
      v2 = 511;
      goto LABEL_131;
    default:
      v2 = 512;
      switch(rawValue.value)
      {
        case 0x8E1:
          goto LABEL_131;
        case 0x8E2:
          v2 = 513;
          goto LABEL_131;
        case 0x8F0:
          v2 = 514;
          goto LABEL_131;
        case 0x8F1:
          v2 = 515;
          goto LABEL_131;
        case 0x8F2:
          v2 = 516;
          goto LABEL_131;
        case 0x8F3:
          v2 = 517;
          goto LABEL_131;
        case 0x8F4:
          v2 = 518;
          goto LABEL_131;
        case 0x8F5:
          v2 = 519;
          goto LABEL_131;
        case 0x900:
          v2 = 520;
          goto LABEL_131;
        case 0x901:
          v2 = 521;
          goto LABEL_131;
        case 0x902:
          v2 = 522;
          goto LABEL_131;
        case 0x903:
          v2 = 523;
          goto LABEL_131;
        case 0x904:
          v2 = 524;
          goto LABEL_131;
        case 0x905:
          v2 = 525;
          goto LABEL_131;
        case 0x906:
          v2 = 526;
          goto LABEL_131;
        case 0x907:
          v2 = 527;
          goto LABEL_131;
        case 0x908:
          v2 = 528;
          goto LABEL_131;
        case 0x909:
          v2 = 529;
          goto LABEL_131;
        case 0x90A:
          v2 = 530;
          goto LABEL_131;
        case 0x90B:
          v2 = 531;
          goto LABEL_131;
        case 0x90C:
          v2 = 532;
          goto LABEL_131;
        case 0x90D:
          v2 = 533;
          goto LABEL_131;
        case 0x90E:
          v2 = 534;
          goto LABEL_131;
        case 0x90F:
          v2 = 535;
          goto LABEL_131;
        case 0x910:
          v2 = 536;
          goto LABEL_131;
        case 0x911:
          v2 = 537;
          goto LABEL_131;
        case 0x912:
          v2 = 538;
          goto LABEL_131;
        case 0x913:
          v2 = 539;
          goto LABEL_131;
        case 0x914:
          v2 = 540;
          goto LABEL_131;
        case 0x915:
          v2 = 541;
          goto LABEL_131;
        case 0x916:
          v2 = 542;
          goto LABEL_131;
        case 0x917:
          v2 = 543;
          goto LABEL_131;
        case 0x918:
          v2 = 544;
          goto LABEL_131;
        case 0x919:
          v2 = 545;
          goto LABEL_131;
        case 0x91A:
          v2 = 546;
          goto LABEL_131;
        case 0x91B:
          v2 = 547;
          goto LABEL_131;
        case 0x91C:
          v2 = 548;
          goto LABEL_131;
        case 0x91D:
          v2 = 549;
          goto LABEL_131;
        case 0x91E:
          v2 = 550;
          goto LABEL_131;
        case 0x91F:
          v2 = 551;
          goto LABEL_131;
        case 0x920:
          v2 = 552;
          goto LABEL_131;
        case 0x921:
          v2 = 553;
          goto LABEL_131;
        case 0x922:
          v2 = 554;
          goto LABEL_131;
        case 0x923:
          v2 = 555;
          goto LABEL_131;
        case 0x924:
          v2 = 556;
          goto LABEL_131;
        case 0x925:
          v2 = 557;
          goto LABEL_131;
        case 0x926:
          v2 = 558;
          goto LABEL_131;
        case 0x927:
          v2 = 559;
          goto LABEL_131;
        case 0x928:
          v2 = 560;
          goto LABEL_131;
        case 0x929:
          v2 = 561;
          goto LABEL_131;
        case 0x92A:
          v2 = 562;
          goto LABEL_131;
        case 0x92B:
          v2 = 563;
          goto LABEL_131;
        case 0x92C:
          v2 = 564;
          goto LABEL_131;
        case 0x92D:
          v2 = 565;
          goto LABEL_131;
        case 0x92E:
          v2 = 566;
          goto LABEL_131;
        case 0x92F:
          v2 = 567;
          goto LABEL_131;
        case 0x930:
          v2 = 568;
          goto LABEL_131;
        case 0x931:
          v2 = 569;
          goto LABEL_131;
        case 0x932:
          v2 = 570;
          goto LABEL_131;
        case 0x933:
          v2 = 571;
          goto LABEL_131;
        case 0x934:
          v2 = 572;
          goto LABEL_131;
        case 0x935:
          v2 = 573;
          goto LABEL_131;
        case 0x936:
          v2 = 574;
          goto LABEL_131;
        case 0x937:
          v2 = 575;
          goto LABEL_131;
        default:
          v2 = 576;
          switch(rawValue.value)
          {
            case CoreHID_HIDUsage_SensorsUsage_dataFieldMonth|0x800:
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldDay|0x800:
              v2 = 577;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldDayOfWeek|0x800:
              v2 = 578;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldHour|0x800:
              v2 = 579;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldMinute|0x800:
              v2 = 580;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldSecond|0x800:
              v2 = 581;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldMillisecond|0x800:
              v2 = 582;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldTimestamp|0x800:
              v2 = 583;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldJulianDayOfYear|0x800:
              v2 = 584;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldTimeSinceSystemBoot|0x800:
              v2 = 585;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTime|0x800:
              v2 = 586;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneOffsetFromUTC|0x800:
              v2 = 587;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneName|0x800:
              v2 = 588;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyDaylightSavingsTimeObserved|0x800:
              v2 = 589;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTimeTrimAdjustment|0x800:
              v2 = 590;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyArmAlarm|0x800:
              v2 = 591;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustom|0x800:
              v2 = 592;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomUsage|0x800:
              v2 = 593;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomBooleanArray|0x800:
              v2 = 594;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue|0x800:
              v2 = 595;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue1|0x800:
              v2 = 596;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue2|0x800:
              v2 = 597;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue3|0x800:
              v2 = 598;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue4|0x800:
              v2 = 599;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue5|0x800:
              v2 = 600;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue6|0x800:
              v2 = 601;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue7|0x800:
              v2 = 602;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue8|0x800:
              v2 = 603;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue9|0x800:
              v2 = 604;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue10|0x800:
              v2 = 605;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue11|0x800:
              v2 = 606;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue13|0x800:
              v2 = 607;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue14|0x800:
              v2 = 608;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue15|0x800:
              v2 = 609;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGeneric|0x800:
              v2 = 610;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKey|0x800:
              v2 = 611;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericCategoryGUID|0x800:
              v2 = 612;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTypeGUID|0x800:
              v2 = 613;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEventPropertyKey|0x800:
              v2 = 614;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyPropertyKey|0x800:
              v2 = 615;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataFieldPropertyKey|0x800:
              v2 = 616;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEvent|0x800:
              v2 = 617;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericProperty|0x800:
              v2 = 618;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataField|0x800:
              v2 = 619;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowIndex|0x800:
              v2 = 620;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowCount|0x800:
              v2 = 621;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKeyKind|0x800:
              v2 = 622;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUID|0x800:
              v2 = 623;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyKey|0x800:
              v2 = 624;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTopLevelCollectionID|0x800:
              v2 = 625;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportID|0x800:
              v2 = 626;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportItemPositionIndex|0x800:
              v2 = 627;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericFirmwareVARTYPE|0x800:
              v2 = 628;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitOfMeasure|0x800:
              v2 = 629;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitExponent|0x800:
              v2 = 630;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportSize|0x800:
              v2 = 631;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldStepDuration|0x800:
              v2 = 632;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldStepType|0x800:
              v2 = 633;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyMinimumActivityDetectionInterval|0x800:
              v2 = 634;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue7|0x800:
              v2 = 635;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue8|0x800:
              v2 = 636;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue9|0x800:
              v2 = 637;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue10|0x800:
              v2 = 638;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldContributingPanel|0x800:
              v2 = 639;
              goto LABEL_131;
            default:
              if ((unsigned __int16)rawValue.value >= 0x4000u)
              {
                if ((unsigned __int16)rawValue.value >= 0xA000u)
                {
                  if ((unsigned __int16)rawValue.value >= 0xD000u)
                  {
                    switch((unsigned __int16)rawValue.value)
                    {
                      case 0xD000u:
                        *v1 = 662;
                        return rawValue;
                      case 0xE000u:
                        *v1 = 663;
                        return rawValue;
                      case 0xF000u:
                        *v1 = 664;
                        return rawValue;
                    }
                  }
                  else
                  {
                    switch((unsigned __int16)rawValue.value)
                    {
                      case 0xA000u:
                        *v1 = 659;
                        return rawValue;
                      case 0xB000u:
                        *v1 = 660;
                        return rawValue;
                      case 0xC000u:
                        *v1 = 661;
                        return rawValue;
                    }
                  }
                }
                else if ((unsigned __int16)rawValue.value >= 0x7000u)
                {
                  switch((unsigned __int16)rawValue.value)
                  {
                    case 0x7000u:
                      *v1 = 656;
                      return rawValue;
                    case 0x8000u:
                      *v1 = 657;
                      return rawValue;
                    case 0x9000u:
                      *v1 = 658;
                      return rawValue;
                  }
                }
                else
                {
                  switch(rawValue.value)
                  {
                    case 0x4000:
                      *v1 = 653;
                      return rawValue;
                    case 0x5000:
                      *v1 = 654;
                      return rawValue;
                    case 0x6000:
                      *v1 = 655;
                      return rawValue;
                  }
                }
LABEL_671:
                *v1 = 665;
                return rawValue;
              }
              if ((unsigned __int16)rawValue.value > (CoreHID_HIDUsage_SensorsUsage_unknownDefault|CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue19|0xC00))
              {
                switch(rawValue.value)
                {
                  case 0x1000:
                    *v1 = 650;
                    return rawValue;
                  case 0x2000:
                    *v1 = 651;
                    return rawValue;
                  case 0x3000:
                    *v1 = 652;
                    return rawValue;
                }
                goto LABEL_671;
              }
              v3 = 647;
              v2 = 640;
              switch(rawValue.value)
              {
                case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldType|0x800:
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateUndefined|0x800:
                  v2 = 641;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateReady|0x800:
                  v2 = 642;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateNotAvailable|0x800:
                  v2 = 643;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateNoData|0x800:
                  v2 = 644;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateInitializing|0x800:
                  v2 = 645;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventRangeMinimumReached|0x800:
                  v2 = 646;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossUpward|0x800:
                  goto LABEL_132;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossDownward|0x800:
                  *v1 = 648;
                  break;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventLowThresholdCrossUpward|0x800:
                  *v1 = 649;
                  break;
                default:
                  goto LABEL_671;
              }
              return rawValue;
          }
      }
  }
}

CoreHID::HIDUsage::MedicalInstrumentUsage_optional __swiftcall HIDUsage.MedicalInstrumentUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 11;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_13;
    case 0x20u:
      v2 = 1;
      goto LABEL_13;
    case 0x21u:
      v2 = 2;
      goto LABEL_13;
    case 0x22u:
      v2 = 3;
      goto LABEL_13;
    case 0x23u:
      v2 = 4;
      goto LABEL_13;
    case 0x24u:
      v2 = 5;
      goto LABEL_13;
    case 0x25u:
      v2 = 6;
      goto LABEL_13;
    case 0x26u:
      v2 = 7;
      goto LABEL_13;
    case 0x27u:
      v2 = 8;
      goto LABEL_13;
    case 0x40u:
      v2 = 9;
      goto LABEL_13;
    case 0x41u:
      v2 = 10;
LABEL_13:
      v3 = v2;
      goto LABEL_14;
    case 0x42u:
LABEL_14:
      *v1 = v3;
      break;
    case 0x43u:
      *v1 = 12;
      break;
    case 0x44u:
      *v1 = 13;
      break;
    case 0x60u:
      *v1 = 14;
      break;
    case 0x61u:
      *v1 = 15;
      break;
    case 0x70u:
      *v1 = 16;
      break;
    case 0x80u:
      *v1 = 17;
      break;
    case 0x81u:
      *v1 = 18;
      break;
    case 0x82u:
      *v1 = 19;
      break;
    case 0x83u:
      *v1 = 20;
      break;
    case 0x84u:
      *v1 = 21;
      break;
    case 0x85u:
      *v1 = 22;
      break;
    case 0x86u:
      *v1 = 23;
      break;
    case 0x87u:
      *v1 = 24;
      break;
    case 0x88u:
      *v1 = 25;
      break;
    case 0x89u:
      *v1 = 26;
      break;
    case 0xA0u:
      *v1 = 27;
      break;
    case 0xA1u:
      *v1 = 28;
      break;
    default:
      *v1 = 29;
      break;
  }
  return (CoreHID::HIDUsage::MedicalInstrumentUsage_optional)rawValue;
}

CoreHID::HIDUsage::BrailleDisplayUsage_optional __swiftcall HIDUsage.BrailleDisplayUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  _BYTE *v1;

  switch(rawValue)
  {
    case 0xFAu:
      *v1 = 7;
      break;
    case 0xFBu:
      *v1 = 8;
      break;
    case 0xFCu:
      *v1 = 9;
      break;
    case 0x100u:
      *v1 = 10;
      break;
    case 0x101u:
      *v1 = 11;
      break;
    case 0x200u:
      *v1 = 12;
      break;
    case 0x201u:
      *v1 = 13;
      break;
    case 0x202u:
      *v1 = 14;
      break;
    case 0x203u:
      *v1 = 15;
      break;
    case 0x204u:
      *v1 = 16;
      break;
    case 0x205u:
      *v1 = 17;
      break;
    case 0x206u:
      *v1 = 18;
      break;
    case 0x207u:
      *v1 = 19;
      break;
    case 0x208u:
      *v1 = 20;
      break;
    case 0x209u:
      *v1 = 21;
      break;
    case 0x20Au:
      *v1 = 22;
      break;
    case 0x20Bu:
      *v1 = 23;
      break;
    case 0x20Cu:
      *v1 = 24;
      break;
    case 0x20Du:
      *v1 = 25;
      break;
    case 0x20Eu:
      *v1 = 26;
      break;
    case 0x20Fu:
      *v1 = 27;
      break;
    case 0x210u:
      *v1 = 28;
      break;
    case 0x211u:
      *v1 = 29;
      break;
    case 0x212u:
      *v1 = 30;
      break;
    case 0x213u:
      *v1 = 31;
      break;
    case 0x214u:
      *v1 = 32;
      break;
    case 0x215u:
      *v1 = 33;
      break;
    case 0x216u:
      *v1 = 34;
      break;
    case 0x217u:
      *v1 = 35;
      break;
    case 0x218u:
      *v1 = 36;
      break;
    case 0x219u:
      *v1 = 37;
      break;
    case 0x21Au:
      *v1 = 38;
      break;
    case 0x21Bu:
      *v1 = 39;
      break;
    case 0x21Cu:
      *v1 = 40;
      break;
    case 0x21Du:
      *v1 = 41;
      break;
    case 0x21Eu:
      *v1 = 42;
      break;
    default:
      *v1 = 43;
      break;
  }
  return (CoreHID::HIDUsage::BrailleDisplayUsage_optional)rawValue;
}

CoreHID::HIDUsage::LightingAndIlluminationUsage_optional __swiftcall HIDUsage.LightingAndIlluminationUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 15;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_16;
    case 2u:
      v2 = 1;
      goto LABEL_16;
    case 3u:
      v2 = 2;
      goto LABEL_16;
    case 4u:
      v2 = 3;
      goto LABEL_16;
    case 5u:
      v2 = 4;
      goto LABEL_16;
    case 6u:
      v2 = 5;
      goto LABEL_16;
    case 7u:
      v2 = 6;
      goto LABEL_16;
    case 8u:
      v2 = 7;
      goto LABEL_16;
    case 0x20u:
      v2 = 8;
      goto LABEL_16;
    case 0x21u:
      v2 = 9;
      goto LABEL_16;
    case 0x22u:
      v2 = 10;
      goto LABEL_16;
    case 0x23u:
      v2 = 11;
      goto LABEL_16;
    case 0x24u:
      v2 = 12;
      goto LABEL_16;
    case 0x25u:
      v2 = 13;
      goto LABEL_16;
    case 0x26u:
      v2 = 14;
LABEL_16:
      v3 = v2;
      goto LABEL_17;
    case 0x27u:
LABEL_17:
      *v1 = v3;
      break;
    case 0x28u:
      *v1 = 16;
      break;
    case 0x29u:
      *v1 = 17;
      break;
    case 0x2Au:
      *v1 = 18;
      break;
    case 0x2Bu:
      *v1 = 19;
      break;
    case 0x2Cu:
      *v1 = 20;
      break;
    case 0x2Du:
      *v1 = 21;
      break;
    case 0x50u:
      *v1 = 22;
      break;
    case 0x51u:
      *v1 = 23;
      break;
    case 0x52u:
      *v1 = 24;
      break;
    case 0x53u:
      *v1 = 25;
      break;
    case 0x54u:
      *v1 = 26;
      break;
    case 0x55u:
      *v1 = 27;
      break;
    case 0x60u:
      *v1 = 28;
      break;
    case 0x61u:
      *v1 = 29;
      break;
    case 0x62u:
      *v1 = 30;
      break;
    case 0x70u:
      *v1 = 31;
      break;
    case 0x71u:
      *v1 = 32;
      break;
    default:
      *v1 = 33;
      break;
  }
  return (CoreHID::HIDUsage::LightingAndIlluminationUsage_optional)rawValue;
}

CoreHID::HIDUsage::MonitorUsage_optional __swiftcall HIDUsage.MonitorUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;

  if (rawValue >= 5u)
    v2 = 4;
  else
    v2 = 0x302010004uLL >> (8 * rawValue);
  *v1 = v2;
  return (CoreHID::HIDUsage::MonitorUsage_optional)rawValue;
}

CoreHID::HIDUsage::VESAVirtualControlsUsage_optional __swiftcall HIDUsage.VESAVirtualControlsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 27;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_29;
    case 0x10u:
      v2 = 1;
      goto LABEL_29;
    case 0x12u:
      v2 = 2;
      goto LABEL_29;
    case 0x16u:
      v2 = 3;
      goto LABEL_29;
    case 0x18u:
      v2 = 4;
      goto LABEL_29;
    case 0x1Au:
      v2 = 5;
      goto LABEL_29;
    case 0x1Cu:
      v2 = 6;
      goto LABEL_29;
    case 0x20u:
      v2 = 7;
      goto LABEL_29;
    case 0x22u:
      v2 = 8;
      goto LABEL_29;
    case 0x24u:
      v2 = 9;
      goto LABEL_29;
    case 0x26u:
      v2 = 10;
      goto LABEL_29;
    case 0x28u:
      v2 = 11;
      goto LABEL_29;
    case 0x2Au:
      v2 = 12;
      goto LABEL_29;
    case 0x2Cu:
      v2 = 13;
      goto LABEL_29;
    case 0x30u:
      v2 = 14;
      goto LABEL_29;
    case 0x32u:
      v2 = 15;
      goto LABEL_29;
    case 0x34u:
      v2 = 16;
      goto LABEL_29;
    case 0x36u:
      v2 = 17;
      goto LABEL_29;
    case 0x38u:
      v2 = 18;
      goto LABEL_29;
    case 0x3Au:
      v2 = 19;
      goto LABEL_29;
    case 0x3Cu:
      v2 = 20;
      goto LABEL_29;
    case 0x40u:
      v2 = 21;
      goto LABEL_29;
    case 0x42u:
      v2 = 22;
      goto LABEL_29;
    case 0x44u:
      v2 = 23;
      goto LABEL_29;
    case 0x46u:
      v2 = 24;
      goto LABEL_29;
    case 0x48u:
      v2 = 25;
      goto LABEL_29;
    case 0x4Au:
      v2 = 26;
LABEL_29:
      v3 = v2;
      goto LABEL_30;
    case 0x4Cu:
LABEL_30:
      *v1 = v3;
      break;
    case 0x56u:
      *v1 = 28;
      break;
    case 0x58u:
      *v1 = 29;
      break;
    case 0x5Eu:
      *v1 = 30;
      break;
    case 0x60u:
      *v1 = 31;
      break;
    case 0x6Cu:
      *v1 = 32;
      break;
    case 0x6Eu:
      *v1 = 33;
      break;
    case 0x70u:
      *v1 = 34;
      break;
    case 0xA2u:
      *v1 = 35;
      break;
    case 0xA4u:
      *v1 = 36;
      break;
    case 0xA6u:
      *v1 = 37;
      break;
    case 0xA8u:
      *v1 = 38;
      break;
    case 0xAAu:
      *v1 = 39;
      break;
    case 0xACu:
      *v1 = 40;
      break;
    case 0xAEu:
      *v1 = 41;
      break;
    case 0xB0u:
      *v1 = 42;
      break;
    case 0xCAu:
      *v1 = 43;
      break;
    case 0xD4u:
      *v1 = 44;
      break;
    default:
      *v1 = 45;
      break;
  }
  return (CoreHID::HIDUsage::VESAVirtualControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::PowerUsage_optional __swiftcall HIDUsage.PowerUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 59;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_60;
    case 2u:
      v2 = 1;
      goto LABEL_60;
    case 3u:
      v2 = 2;
      goto LABEL_60;
    case 4u:
      v2 = 3;
      goto LABEL_60;
    case 5u:
      v2 = 4;
      goto LABEL_60;
    case 0x10u:
      v2 = 5;
      goto LABEL_60;
    case 0x11u:
      v2 = 6;
      goto LABEL_60;
    case 0x12u:
      v2 = 7;
      goto LABEL_60;
    case 0x13u:
      v2 = 8;
      goto LABEL_60;
    case 0x14u:
      v2 = 9;
      goto LABEL_60;
    case 0x15u:
      v2 = 10;
      goto LABEL_60;
    case 0x16u:
      v2 = 11;
      goto LABEL_60;
    case 0x17u:
      v2 = 12;
      goto LABEL_60;
    case 0x18u:
      v2 = 13;
      goto LABEL_60;
    case 0x19u:
      v2 = 14;
      goto LABEL_60;
    case 0x1Au:
      v2 = 15;
      goto LABEL_60;
    case 0x1Bu:
      v2 = 16;
      goto LABEL_60;
    case 0x1Cu:
      v2 = 17;
      goto LABEL_60;
    case 0x1Du:
      v2 = 18;
      goto LABEL_60;
    case 0x1Eu:
      v2 = 19;
      goto LABEL_60;
    case 0x1Fu:
      v2 = 20;
      goto LABEL_60;
    case 0x20u:
      v2 = 21;
      goto LABEL_60;
    case 0x21u:
      v2 = 22;
      goto LABEL_60;
    case 0x22u:
      v2 = 23;
      goto LABEL_60;
    case 0x23u:
      v2 = 24;
      goto LABEL_60;
    case 0x24u:
      v2 = 25;
      goto LABEL_60;
    case 0x25u:
      v2 = 26;
      goto LABEL_60;
    case 0x30u:
      v2 = 27;
      goto LABEL_60;
    case 0x31u:
      v2 = 28;
      goto LABEL_60;
    case 0x32u:
      v2 = 29;
      goto LABEL_60;
    case 0x33u:
      v2 = 30;
      goto LABEL_60;
    case 0x34u:
      v2 = 31;
      goto LABEL_60;
    case 0x35u:
      v2 = 32;
      goto LABEL_60;
    case 0x36u:
      v2 = 33;
      goto LABEL_60;
    case 0x37u:
      v2 = 34;
      goto LABEL_60;
    case 0x38u:
      v2 = 35;
      goto LABEL_60;
    case 0x40u:
      v2 = 36;
      goto LABEL_60;
    case 0x41u:
      v2 = 37;
      goto LABEL_60;
    case 0x42u:
      v2 = 38;
      goto LABEL_60;
    case 0x43u:
      v2 = 39;
      goto LABEL_60;
    case 0x44u:
      v2 = 40;
      goto LABEL_60;
    case 0x45u:
      v2 = 41;
      goto LABEL_60;
    case 0x46u:
      v2 = 42;
      goto LABEL_60;
    case 0x47u:
      v2 = 43;
      goto LABEL_60;
    case 0x50u:
      v2 = 44;
      goto LABEL_60;
    case 0x51u:
      v2 = 45;
      goto LABEL_60;
    case 0x52u:
      v2 = 46;
      goto LABEL_60;
    case 0x53u:
      v2 = 47;
      goto LABEL_60;
    case 0x54u:
      v2 = 48;
      goto LABEL_60;
    case 0x55u:
      v2 = 49;
      goto LABEL_60;
    case 0x56u:
      v2 = 50;
      goto LABEL_60;
    case 0x57u:
      v2 = 51;
      goto LABEL_60;
    case 0x58u:
      v2 = 52;
      goto LABEL_60;
    case 0x59u:
      v2 = 53;
      goto LABEL_60;
    case 0x5Au:
      v2 = 54;
      goto LABEL_60;
    case 0x60u:
      v2 = 55;
      goto LABEL_60;
    case 0x61u:
      v2 = 56;
      goto LABEL_60;
    case 0x62u:
      v2 = 57;
      goto LABEL_60;
    case 0x63u:
      v2 = 58;
LABEL_60:
      v3 = v2;
      goto LABEL_61;
    case 0x64u:
LABEL_61:
      *v1 = v3;
      break;
    case 0x65u:
      *v1 = 60;
      break;
    case 0x66u:
      *v1 = 61;
      break;
    case 0x67u:
      *v1 = 62;
      break;
    case 0x68u:
      *v1 = 63;
      break;
    case 0x69u:
      *v1 = 64;
      break;
    case 0x6Bu:
      *v1 = 65;
      break;
    case 0x6Cu:
      *v1 = 66;
      break;
    case 0x6Du:
      *v1 = 67;
      break;
    case 0x6Eu:
      *v1 = 68;
      break;
    case 0x6Fu:
      *v1 = 69;
      break;
    case 0x70u:
      *v1 = 70;
      break;
    case 0x71u:
      *v1 = 71;
      break;
    case 0x72u:
      *v1 = 72;
      break;
    case 0x73u:
      *v1 = 73;
      break;
    case 0xFDu:
      *v1 = 74;
      break;
    case 0xFEu:
      *v1 = 75;
      break;
    case 0xFFu:
      *v1 = 76;
      break;
    default:
      *v1 = 77;
      break;
  }
  return (CoreHID::HIDUsage::PowerUsage_optional)rawValue;
}

CoreHID::HIDUsage::BatterySystemUsage_optional __swiftcall HIDUsage.BatterySystemUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 73;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_75;
    case 2u:
      v2 = 1;
      goto LABEL_75;
    case 3u:
      v2 = 2;
      goto LABEL_75;
    case 4u:
      v2 = 3;
      goto LABEL_75;
    case 5u:
      v2 = 4;
      goto LABEL_75;
    case 6u:
      v2 = 5;
      goto LABEL_75;
    case 7u:
      v2 = 6;
      goto LABEL_75;
    case 8u:
      v2 = 7;
      goto LABEL_75;
    case 9u:
      v2 = 8;
      goto LABEL_75;
    case 0x10u:
      v2 = 9;
      goto LABEL_75;
    case 0x11u:
      v2 = 10;
      goto LABEL_75;
    case 0x12u:
      v2 = 11;
      goto LABEL_75;
    case 0x13u:
      v2 = 12;
      goto LABEL_75;
    case 0x14u:
      v2 = 13;
      goto LABEL_75;
    case 0x15u:
      v2 = 14;
      goto LABEL_75;
    case 0x16u:
      v2 = 15;
      goto LABEL_75;
    case 0x17u:
      v2 = 16;
      goto LABEL_75;
    case 0x18u:
      v2 = 17;
      goto LABEL_75;
    case 0x19u:
      v2 = 18;
      goto LABEL_75;
    case 0x1Au:
      v2 = 19;
      goto LABEL_75;
    case 0x1Bu:
      v2 = 20;
      goto LABEL_75;
    case 0x1Cu:
      v2 = 21;
      goto LABEL_75;
    case 0x1Du:
      v2 = 22;
      goto LABEL_75;
    case 0x28u:
      v2 = 23;
      goto LABEL_75;
    case 0x29u:
      v2 = 24;
      goto LABEL_75;
    case 0x2Au:
      v2 = 25;
      goto LABEL_75;
    case 0x2Bu:
      v2 = 26;
      goto LABEL_75;
    case 0x2Cu:
      v2 = 27;
      goto LABEL_75;
    case 0x2Du:
      v2 = 28;
      goto LABEL_75;
    case 0x2Eu:
      v2 = 29;
      goto LABEL_75;
    case 0x2Fu:
      v2 = 30;
      goto LABEL_75;
    case 0x40u:
      v2 = 31;
      goto LABEL_75;
    case 0x41u:
      v2 = 32;
      goto LABEL_75;
    case 0x42u:
      v2 = 33;
      goto LABEL_75;
    case 0x43u:
      v2 = 34;
      goto LABEL_75;
    case 0x44u:
      v2 = 35;
      goto LABEL_75;
    case 0x45u:
      v2 = 36;
      goto LABEL_75;
    case 0x46u:
      v2 = 37;
      goto LABEL_75;
    case 0x47u:
      v2 = 38;
      goto LABEL_75;
    case 0x48u:
      v2 = 39;
      goto LABEL_75;
    case 0x49u:
      v2 = 40;
      goto LABEL_75;
    case 0x4Au:
      v2 = 41;
      goto LABEL_75;
    case 0x4Bu:
      v2 = 42;
      goto LABEL_75;
    case 0x60u:
      v2 = 43;
      goto LABEL_75;
    case 0x61u:
      v2 = 44;
      goto LABEL_75;
    case 0x62u:
      v2 = 45;
      goto LABEL_75;
    case 0x63u:
      v2 = 46;
      goto LABEL_75;
    case 0x64u:
      v2 = 47;
      goto LABEL_75;
    case 0x65u:
      v2 = 48;
      goto LABEL_75;
    case 0x66u:
      v2 = 49;
      goto LABEL_75;
    case 0x67u:
      v2 = 50;
      goto LABEL_75;
    case 0x68u:
      v2 = 51;
      goto LABEL_75;
    case 0x69u:
      v2 = 52;
      goto LABEL_75;
    case 0x6Au:
      v2 = 53;
      goto LABEL_75;
    case 0x6Bu:
      v2 = 54;
      goto LABEL_75;
    case 0x80u:
      v2 = 55;
      goto LABEL_75;
    case 0x81u:
      v2 = 56;
      goto LABEL_75;
    case 0x82u:
      v2 = 57;
      goto LABEL_75;
    case 0x83u:
      v2 = 58;
      goto LABEL_75;
    case 0x84u:
      v2 = 59;
      goto LABEL_75;
    case 0x85u:
      v2 = 60;
      goto LABEL_75;
    case 0x86u:
      v2 = 61;
      goto LABEL_75;
    case 0x87u:
      v2 = 62;
      goto LABEL_75;
    case 0x88u:
      v2 = 63;
      goto LABEL_75;
    case 0x89u:
      v2 = 64;
      goto LABEL_75;
    case 0x8Au:
      v2 = 65;
      goto LABEL_75;
    case 0x8Bu:
      v2 = 66;
      goto LABEL_75;
    case 0x8Cu:
      v2 = 67;
      goto LABEL_75;
    case 0x8Du:
      v2 = 68;
      goto LABEL_75;
    case 0x8Eu:
      v2 = 69;
      goto LABEL_75;
    case 0x8Fu:
      v2 = 70;
      goto LABEL_75;
    case 0xC0u:
      v2 = 71;
      goto LABEL_75;
    case 0xC1u:
      v2 = 72;
LABEL_75:
      v3 = v2;
      goto LABEL_76;
    case 0xC2u:
LABEL_76:
      *v1 = v3;
      break;
    case 0xD0u:
      *v1 = 74;
      break;
    case 0xD1u:
      *v1 = 75;
      break;
    case 0xD2u:
      *v1 = 76;
      break;
    case 0xD3u:
      *v1 = 77;
      break;
    case 0xD4u:
      *v1 = 78;
      break;
    case 0xD5u:
      *v1 = 79;
      break;
    case 0xD6u:
      *v1 = 80;
      break;
    case 0xD7u:
      *v1 = 81;
      break;
    case 0xD8u:
      *v1 = 82;
      break;
    case 0xD9u:
      *v1 = 83;
      break;
    case 0xDAu:
      *v1 = 84;
      break;
    case 0xDBu:
      *v1 = 85;
      break;
    case 0xDCu:
      *v1 = 86;
      break;
    case 0xF0u:
      *v1 = 87;
      break;
    case 0xF1u:
      *v1 = 88;
      break;
    case 0xF2u:
      *v1 = 89;
      break;
    case 0xF3u:
      *v1 = 90;
      break;
    default:
      *v1 = 91;
      break;
  }
  return (CoreHID::HIDUsage::BatterySystemUsage_optional)rawValue;
}

CoreHID::HIDUsage::BarcodeScannerUsage_optional __swiftcall HIDUsage.BarcodeScannerUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;
  char v4;

  v2 = 0;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_131;
    case 2u:
      v2 = 1;
      goto LABEL_131;
    case 3u:
      v2 = 2;
      goto LABEL_131;
    case 4u:
      v2 = 3;
      goto LABEL_131;
    case 5u:
      v2 = 4;
      goto LABEL_131;
    case 0x10u:
      v2 = 5;
      goto LABEL_131;
    case 0x11u:
      v2 = 6;
      goto LABEL_131;
    case 0x12u:
      v2 = 7;
      goto LABEL_131;
    case 0x13u:
      v2 = 8;
      goto LABEL_131;
    case 0x14u:
      v2 = 9;
      goto LABEL_131;
    case 0x15u:
      v2 = 10;
      goto LABEL_131;
    case 0x16u:
      v2 = 11;
      goto LABEL_131;
    case 0x17u:
      v2 = 12;
      goto LABEL_131;
    case 0x18u:
      v2 = 13;
      goto LABEL_131;
    case 0x19u:
      v2 = 14;
      goto LABEL_131;
    case 0x1Au:
      v2 = 15;
      goto LABEL_131;
    case 0x1Bu:
      v2 = 16;
      goto LABEL_131;
    case 0x1Cu:
      v2 = 17;
      goto LABEL_131;
    case 0x1Du:
      v2 = 18;
      goto LABEL_131;
    case 0x1Eu:
      v2 = 19;
      goto LABEL_131;
    case 0x1Fu:
      v2 = 20;
      goto LABEL_131;
    case 0x30u:
      v2 = 21;
      goto LABEL_131;
    case 0x31u:
      v2 = 22;
      goto LABEL_131;
    case 0x32u:
      v2 = 23;
      goto LABEL_131;
    case 0x33u:
      v2 = 24;
      goto LABEL_131;
    case 0x34u:
      v2 = 25;
      goto LABEL_131;
    case 0x35u:
      v2 = 26;
      goto LABEL_131;
    case 0x36u:
      v2 = 27;
      goto LABEL_131;
    case 0x37u:
      v2 = 28;
      goto LABEL_131;
    case 0x38u:
      v2 = 29;
      goto LABEL_131;
    case 0x39u:
      v2 = 30;
      goto LABEL_131;
    case 0x3Au:
      v2 = 31;
      goto LABEL_131;
    case 0x3Bu:
      v2 = 32;
      goto LABEL_131;
    case 0x3Cu:
      v2 = 33;
      goto LABEL_131;
    case 0x3Du:
      v2 = 34;
      goto LABEL_131;
    case 0x3Eu:
      v2 = 35;
      goto LABEL_131;
    case 0x3Fu:
      v2 = 36;
      goto LABEL_131;
    case 0x40u:
      v2 = 37;
      goto LABEL_131;
    case 0x41u:
      v2 = 38;
      goto LABEL_131;
    case 0x42u:
      v2 = 39;
      goto LABEL_131;
    case 0x43u:
      v2 = 40;
      goto LABEL_131;
    case 0x44u:
      v2 = 41;
      goto LABEL_131;
    case 0x45u:
      v2 = 42;
      goto LABEL_131;
    case 0x46u:
      v2 = 43;
      goto LABEL_131;
    case 0x4Du:
      v2 = 44;
      goto LABEL_131;
    case 0x4Eu:
      v2 = 45;
      goto LABEL_131;
    case 0x4Fu:
      v2 = 46;
      goto LABEL_131;
    case 0x50u:
      v2 = 47;
      goto LABEL_131;
    case 0x51u:
      v2 = 48;
      goto LABEL_131;
    case 0x52u:
      v2 = 49;
      goto LABEL_131;
    case 0x55u:
      v2 = 50;
      goto LABEL_131;
    case 0x56u:
      v2 = 51;
      goto LABEL_131;
    case 0x57u:
      v2 = 52;
      goto LABEL_131;
    case 0x58u:
      v2 = 53;
      goto LABEL_131;
    case 0x59u:
      v2 = 54;
      goto LABEL_131;
    case 0x5Au:
      v2 = 55;
      goto LABEL_131;
    case 0x5Bu:
      v2 = 56;
      goto LABEL_131;
    case 0x5Cu:
      v2 = 57;
      goto LABEL_131;
    case 0x5Du:
      v2 = 58;
      goto LABEL_131;
    case 0x5Eu:
      v2 = 59;
      goto LABEL_131;
    case 0x5Fu:
      v2 = 60;
      goto LABEL_131;
    case 0x60u:
      v2 = 61;
      goto LABEL_131;
    case 0x61u:
      v2 = 62;
      goto LABEL_131;
    case 0x62u:
      v2 = 63;
      goto LABEL_131;
    case 0x63u:
      v2 = 64;
      goto LABEL_131;
    case 0x64u:
      v2 = 65;
      goto LABEL_131;
    case 0x65u:
      v2 = 66;
      goto LABEL_131;
    case 0x66u:
      v2 = 67;
      goto LABEL_131;
    case 0x6Du:
      v2 = 68;
      goto LABEL_131;
    case 0x6Eu:
      v2 = 69;
      goto LABEL_131;
    case 0x6Fu:
      v2 = 70;
      goto LABEL_131;
    case 0x70u:
      v2 = 71;
      goto LABEL_131;
    case 0x75u:
      v2 = 72;
      goto LABEL_131;
    case 0x76u:
      v2 = 73;
      goto LABEL_131;
    case 0x7Au:
      v2 = 74;
      goto LABEL_131;
    case 0x7Bu:
      v2 = 75;
      goto LABEL_131;
    case 0x7Cu:
      v2 = 76;
      goto LABEL_131;
    case 0x7Du:
      v2 = 77;
      goto LABEL_131;
    case 0x7Eu:
      v2 = 78;
      goto LABEL_131;
    case 0x7Fu:
      v2 = 79;
      goto LABEL_131;
    case 0x80u:
      v2 = 80;
      goto LABEL_131;
    case 0x82u:
      v2 = 81;
      goto LABEL_131;
    case 0x83u:
      v2 = 82;
      goto LABEL_131;
    case 0x84u:
      v2 = 83;
      goto LABEL_131;
    case 0x85u:
      v2 = 84;
      goto LABEL_131;
    case 0x86u:
      v2 = 85;
      goto LABEL_131;
    case 0x87u:
      v2 = 86;
      goto LABEL_131;
    case 0x88u:
      v2 = 87;
      goto LABEL_131;
    case 0x89u:
      v2 = 88;
      goto LABEL_131;
    case 0x8Au:
      v2 = 89;
      goto LABEL_131;
    case 0x8Bu:
      v2 = 90;
      goto LABEL_131;
    case 0x91u:
      v2 = 91;
      goto LABEL_131;
    case 0x92u:
      v2 = 92;
      goto LABEL_131;
    case 0x93u:
      v2 = 93;
      goto LABEL_131;
    case 0x94u:
      v2 = 94;
      goto LABEL_131;
    case 0x95u:
      v2 = 95;
      goto LABEL_131;
    case 0x96u:
      v2 = 96;
      goto LABEL_131;
    case 0x97u:
      v2 = 97;
      goto LABEL_131;
    case 0x98u:
      v2 = 98;
      goto LABEL_131;
    case 0x99u:
      v2 = 99;
      goto LABEL_131;
    case 0x9Au:
      v2 = 100;
      goto LABEL_131;
    case 0x9Bu:
      v2 = 101;
      goto LABEL_131;
    case 0x9Cu:
      v2 = 102;
      goto LABEL_131;
    case 0x9Du:
      v2 = 103;
      goto LABEL_131;
    case 0x9Eu:
      v2 = 104;
      goto LABEL_131;
    case 0x9Fu:
      v2 = 105;
      goto LABEL_131;
    case 0xA0u:
      v2 = 106;
      goto LABEL_131;
    case 0xA1u:
      v2 = 107;
      goto LABEL_131;
    case 0xA2u:
      v2 = 108;
      goto LABEL_131;
    case 0xA9u:
      v2 = 109;
      goto LABEL_131;
    case 0xAAu:
      v2 = 110;
      goto LABEL_131;
    case 0xABu:
      v2 = 111;
      goto LABEL_131;
    case 0xACu:
      v2 = 112;
      goto LABEL_131;
    case 0xADu:
      v2 = 113;
      goto LABEL_131;
    case 0xAEu:
      v2 = 114;
      goto LABEL_131;
    case 0xAFu:
      v2 = 115;
      goto LABEL_131;
    case 0xB0u:
      v2 = 116;
      goto LABEL_131;
    case 0xB1u:
      v2 = 117;
      goto LABEL_131;
    case 0xB2u:
      v2 = 118;
      goto LABEL_131;
    case 0xB3u:
      v2 = 119;
      goto LABEL_131;
    case 0xB4u:
      v2 = 120;
      goto LABEL_131;
    case 0xB5u:
      v2 = 121;
      goto LABEL_131;
    case 0xB7u:
      v2 = 122;
      goto LABEL_131;
    case 0xB8u:
      v2 = 123;
      goto LABEL_131;
    case 0xB9u:
      v2 = 124;
      goto LABEL_131;
    case 0xBAu:
      v2 = 125;
      goto LABEL_131;
    case 0xBBu:
      v2 = 126;
      goto LABEL_131;
    case 0xBCu:
      v2 = 127;
LABEL_131:
      v3 = v2;
LABEL_132:
      *v1 = v3;
      break;
    default:
      v3 = -80;
      v2 = 0x80;
      switch(rawValue)
      {
        case 0xBDu:
          goto LABEL_131;
        case 0xBEu:
          v2 = -127;
          goto LABEL_131;
        case 0xBFu:
          v2 = -126;
          goto LABEL_131;
        case 0xC0u:
          v2 = -125;
          goto LABEL_131;
        case 0xC3u:
          v2 = -124;
          goto LABEL_131;
        case 0xC4u:
          v2 = -123;
          goto LABEL_131;
        case 0xC7u:
          v2 = -122;
          goto LABEL_131;
        case 0xC8u:
          v2 = -121;
          goto LABEL_131;
        case 0xC9u:
          v2 = -120;
          goto LABEL_131;
        case 0xCAu:
          v2 = -119;
          goto LABEL_131;
        case 0xCBu:
          v2 = -118;
          goto LABEL_131;
        case 0xCCu:
          v2 = -117;
          goto LABEL_131;
        case 0xCDu:
          v2 = -116;
          goto LABEL_131;
        case 0xCEu:
          v2 = -115;
          goto LABEL_131;
        case 0xD3u:
          v2 = -114;
          goto LABEL_131;
        case 0xD4u:
          v2 = -113;
          goto LABEL_131;
        case 0xD5u:
          v2 = -112;
          goto LABEL_131;
        case 0xD6u:
          v2 = -111;
          goto LABEL_131;
        case 0xD7u:
          v2 = -110;
          goto LABEL_131;
        case 0xD8u:
          v2 = -109;
          goto LABEL_131;
        case 0xD9u:
          v2 = -108;
          goto LABEL_131;
        case 0xDAu:
          v2 = -107;
          goto LABEL_131;
        case 0xDBu:
          v2 = -106;
          goto LABEL_131;
        case 0xDCu:
          v2 = -105;
          goto LABEL_131;
        case 0xDDu:
          v2 = -104;
          goto LABEL_131;
        case 0xDEu:
          v2 = -103;
          goto LABEL_131;
        case 0xDFu:
          v2 = -102;
          goto LABEL_131;
        case 0xF0u:
          v2 = -101;
          goto LABEL_131;
        case 0xF1u:
          v2 = -100;
          goto LABEL_131;
        case 0xF2u:
          v2 = -99;
          goto LABEL_131;
        case 0xFBu:
          v2 = -98;
          goto LABEL_131;
        case 0xFCu:
          v2 = -97;
          goto LABEL_131;
        case 0xFDu:
          v2 = -96;
          goto LABEL_131;
        case 0xFEu:
          v2 = -95;
          goto LABEL_131;
        case 0xFFu:
          v2 = -94;
          goto LABEL_131;
        case 0x100u:
          v2 = -93;
          goto LABEL_131;
        case 0x101u:
          v2 = -92;
          goto LABEL_131;
        case 0x102u:
          v2 = -91;
          goto LABEL_131;
        case 0x103u:
          v2 = -90;
          goto LABEL_131;
        case 0x104u:
          v2 = -89;
          goto LABEL_131;
        case 0x106u:
          v2 = -88;
          goto LABEL_131;
        case 0x107u:
          v2 = -87;
          goto LABEL_131;
        case 0x108u:
          v2 = -86;
          goto LABEL_131;
        case 0x109u:
          v2 = -85;
          goto LABEL_131;
        case 0x10Au:
          v2 = -84;
          goto LABEL_131;
        case 0x10Bu:
          v2 = -83;
          goto LABEL_131;
        case 0x10Cu:
          v2 = -82;
          goto LABEL_131;
        case 0x10Du:
          v2 = -81;
          goto LABEL_131;
        case 0x110u:
          goto LABEL_132;
        case 0x111u:
          *v1 = -79;
          break;
        case 0x112u:
          *v1 = -78;
          break;
        case 0x113u:
          *v1 = -77;
          break;
        case 0x114u:
          *v1 = -76;
          break;
        case 0x115u:
          *v1 = -75;
          break;
        case 0x116u:
          *v1 = -74;
          break;
        case 0x117u:
          *v1 = -73;
          break;
        case 0x118u:
          *v1 = -72;
          break;
        case 0x119u:
          *v1 = -71;
          break;
        case 0x11Au:
          *v1 = -70;
          break;
        case 0x11Bu:
          *v1 = -69;
          break;
        case 0x11Cu:
          *v1 = -68;
          break;
        case 0x11Du:
          *v1 = -67;
          break;
        case 0x11Eu:
          *v1 = -66;
          break;
        case 0x11Fu:
          *v1 = -65;
          break;
        default:
          if (rawValue == 289)
            v4 = -63;
          else
            v4 = -62;
          if (rawValue == 288)
            v4 = -64;
          *v1 = v4;
          break;
      }
      break;
  }
  return (CoreHID::HIDUsage::BarcodeScannerUsage_optional)rawValue;
}

CoreHID::HIDUsage::ScalesUsage_optional __swiftcall HIDUsage.ScalesUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 28;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_30;
    case 0x20u:
      v2 = 1;
      goto LABEL_30;
    case 0x21u:
      v2 = 2;
      goto LABEL_30;
    case 0x22u:
      v2 = 3;
      goto LABEL_30;
    case 0x23u:
      v2 = 4;
      goto LABEL_30;
    case 0x24u:
      v2 = 5;
      goto LABEL_30;
    case 0x25u:
      v2 = 6;
      goto LABEL_30;
    case 0x26u:
      v2 = 7;
      goto LABEL_30;
    case 0x27u:
      v2 = 8;
      goto LABEL_30;
    case 0x28u:
      v2 = 9;
      goto LABEL_30;
    case 0x29u:
      v2 = 10;
      goto LABEL_30;
    case 0x2Au:
      v2 = 11;
      goto LABEL_30;
    case 0x30u:
      v2 = 12;
      goto LABEL_30;
    case 0x31u:
      v2 = 13;
      goto LABEL_30;
    case 0x32u:
      v2 = 14;
      goto LABEL_30;
    case 0x33u:
      v2 = 15;
      goto LABEL_30;
    case 0x34u:
      v2 = 16;
      goto LABEL_30;
    case 0x35u:
      v2 = 17;
      goto LABEL_30;
    case 0x40u:
      v2 = 18;
      goto LABEL_30;
    case 0x41u:
      v2 = 19;
      goto LABEL_30;
    case 0x50u:
      v2 = 20;
      goto LABEL_30;
    case 0x51u:
      v2 = 21;
      goto LABEL_30;
    case 0x52u:
      v2 = 22;
      goto LABEL_30;
    case 0x53u:
      v2 = 23;
      goto LABEL_30;
    case 0x54u:
      v2 = 24;
      goto LABEL_30;
    case 0x55u:
      v2 = 25;
      goto LABEL_30;
    case 0x56u:
      v2 = 26;
      goto LABEL_30;
    case 0x57u:
      v2 = 27;
LABEL_30:
      v3 = v2;
      goto LABEL_31;
    case 0x58u:
LABEL_31:
      *v1 = v3;
      break;
    case 0x59u:
      *v1 = 29;
      break;
    case 0x5Au:
      *v1 = 30;
      break;
    case 0x5Bu:
      *v1 = 31;
      break;
    case 0x5Cu:
      *v1 = 32;
      break;
    case 0x60u:
      *v1 = 33;
      break;
    case 0x61u:
      *v1 = 34;
      break;
    case 0x70u:
      *v1 = 35;
      break;
    case 0x71u:
      *v1 = 36;
      break;
    case 0x72u:
      *v1 = 37;
      break;
    case 0x73u:
      *v1 = 38;
      break;
    case 0x74u:
      *v1 = 39;
      break;
    case 0x75u:
      *v1 = 40;
      break;
    case 0x76u:
      *v1 = 41;
      break;
    case 0x77u:
      *v1 = 42;
      break;
    case 0x78u:
      *v1 = 43;
      break;
    case 0x80u:
      *v1 = 44;
      break;
    case 0x81u:
      *v1 = 45;
      break;
    default:
      *v1 = 46;
      break;
  }
  return (CoreHID::HIDUsage::ScalesUsage_optional)rawValue;
}

CoreHID::HIDUsage::MagneticStripeReaderUsage_optional __swiftcall HIDUsage.MagneticStripeReaderUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;

  v2 = 1;
  switch(rawValue)
  {
    case 1u:
      v2 = 0;
      goto LABEL_3;
    case 0x11u:
LABEL_3:
      *v1 = v2;
      break;
    case 0x12u:
      *v1 = 2;
      break;
    case 0x13u:
      *v1 = 3;
      break;
    case 0x14u:
      *v1 = 4;
      break;
    case 0x20u:
      *v1 = 5;
      break;
    case 0x21u:
      *v1 = 6;
      break;
    case 0x22u:
      *v1 = 7;
      break;
    case 0x23u:
      *v1 = 8;
      break;
    case 0x24u:
      *v1 = 9;
      break;
    default:
      *v1 = 10;
      break;
  }
  return (CoreHID::HIDUsage::MagneticStripeReaderUsage_optional)rawValue;
}

CoreHID::HIDUsage::CameraControlUsage_optional __swiftcall HIDUsage.CameraControlUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  if (rawValue == 33)
    v2 = 1;
  else
    v2 = 2;
  if (rawValue == 32)
    v3 = 0;
  else
    v3 = v2;
  *v1 = v3;
  return (CoreHID::HIDUsage::CameraControlUsage_optional)rawValue;
}

CoreHID::HIDUsage::ArcadeUsage_optional __swiftcall HIDUsage.ArcadeUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 9;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_11;
    case 2u:
      v2 = 1;
      goto LABEL_11;
    case 3u:
      v2 = 2;
      goto LABEL_11;
    case 0x30u:
      v2 = 3;
      goto LABEL_11;
    case 0x31u:
      v2 = 4;
      goto LABEL_11;
    case 0x32u:
      v2 = 5;
      goto LABEL_11;
    case 0x33u:
      v2 = 6;
      goto LABEL_11;
    case 0x34u:
      v2 = 7;
      goto LABEL_11;
    case 0x35u:
      v2 = 8;
LABEL_11:
      v3 = v2;
      goto LABEL_12;
    case 0x36u:
LABEL_12:
      *v1 = v3;
      break;
    case 0x37u:
      *v1 = 10;
      break;
    case 0x38u:
      *v1 = 11;
      break;
    case 0x39u:
      *v1 = 12;
      break;
    case 0x40u:
      *v1 = 13;
      break;
    case 0x41u:
      *v1 = 14;
      break;
    case 0x42u:
      *v1 = 15;
      break;
    case 0x43u:
      *v1 = 16;
      break;
    case 0x44u:
      *v1 = 17;
      break;
    case 0x45u:
      *v1 = 18;
      break;
    case 0x46u:
      *v1 = 19;
      break;
    case 0x47u:
      *v1 = 20;
      break;
    case 0x48u:
      *v1 = 21;
      break;
    case 0x49u:
      *v1 = 22;
      break;
    case 0x4Au:
      *v1 = 23;
      break;
    case 0x4Bu:
      *v1 = 24;
      break;
    case 0x4Cu:
      *v1 = 25;
      break;
    case 0x4Du:
      *v1 = 26;
      break;
    default:
      *v1 = 27;
      break;
  }
  return (CoreHID::HIDUsage::ArcadeUsage_optional)rawValue;
}

CoreHID::HIDUsage::FIDOAllianceUsage_optional __swiftcall HIDUsage.FIDOAllianceUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char *v1;
  char v2;
  char v3;
  char v4;

  if (rawValue == 33)
    v2 = 2;
  else
    v2 = 3;
  if (rawValue == 32)
    v3 = 1;
  else
    v3 = v2;
  if (rawValue == 1)
    v4 = 0;
  else
    v4 = v3;
  *v1 = v4;
  return (CoreHID::HIDUsage::FIDOAllianceUsage_optional)rawValue;
}

void HIDUsage.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_23920B688()
{
  char v0;

  sub_23922CE44();
  if (v0 == 114)
    return sub_23922CE50();
  sub_23922CE50();
  return sub_23922CE5C();
}

uint64_t HIDUsage.hashValue.getter()
{
  sub_23922CE38();
  HIDUsage.hash(into:)();
  return sub_23922CE74();
}

uint64_t sub_23920C9AC()
{
  sub_23922CE38();
  HIDUsage.hash(into:)();
  return sub_23922CE74();
}

uint64_t sub_23920CA00()
{
  sub_23922CE38();
  HIDUsage.hash(into:)();
  return sub_23922CE74();
}

void HIDUsage.description.getter()
{
  int v0;
  int v1;

  sub_23922CC4C();
  swift_bridgeObjectRelease();
  HIDUsage.page.getter();
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  HIDUsage.usage.getter();
  if ((v0 & 0x10000) != 0)
    goto LABEL_4;
  HIDUsage.usage.getter();
  if ((v1 & 0x10000) == 0)
  {
    sub_23922CDB4();
    sub_23922CA9C();
    swift_bridgeObjectRelease();
LABEL_4:
    sub_23922CA9C();
    swift_bridgeObjectRelease();
    sub_23922CA9C();
    return;
  }
  __break(1u);
}

uint64_t static HIDUsage.GenericDesktopUsage.page.getter()
{
  return 1;
}

BOOL sub_23920CBC4(char *a1, char *a2)
{
  return word_239237542[*a1] == word_239237542[*a2];
}

uint64_t sub_23920CBE8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_23920CC34()
{
  return sub_23922CE5C();
}

uint64_t sub_23920CC68()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::GenericDesktopUsage_optional sub_23920CCB0(Swift::UInt16 *a1)
{
  return HIDUsage.GenericDesktopUsage.init(rawValue:)(*a1);
}

void sub_23920CCB8(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237542[*v1];
}

uint64_t static HIDUsage.SimulationControlsUsage.page.getter()
{
  return 2;
}

BOOL sub_23920CCD8(char *a1, char *a2)
{
  return word_239237626[*a1] == word_239237626[*a2];
}

uint64_t sub_23920CCFC()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_23920CD48()
{
  return sub_23922CE5C();
}

uint64_t sub_23920CD7C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::SimulationControlsUsage_optional sub_23920CDC4(Swift::UInt16 *a1)
{
  return HIDUsage.SimulationControlsUsage.init(rawValue:)(*a1);
}

void sub_23920CDCC(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237626[*v1];
}

uint64_t static HIDUsage.VRControlsUsage.page.getter()
{
  return 3;
}

BOOL sub_23920CDEC(char *a1, char *a2)
{
  return word_23923768C[*a1] == word_23923768C[*a2];
}

uint64_t sub_23920CE10()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_23920CE5C()
{
  return sub_23922CE5C();
}

uint64_t sub_23920CE90()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::VRControlsUsage_optional sub_23920CED8(Swift::UInt16 *a1)
{
  return HIDUsage.VRControlsUsage.init(rawValue:)(*a1);
}

void sub_23920CEE0(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_23923768C[*v1];
}

uint64_t static HIDUsage.SportControlsUsage.page.getter()
{
  return 4;
}

BOOL sub_23920CF00(char *a1, char *a2)
{
  return word_2392376A4[*a1] == word_2392376A4[*a2];
}

uint64_t sub_23920CF24()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_23920CF70()
{
  return sub_23922CE5C();
}

uint64_t sub_23920CFA4()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::SportControlsUsage_optional sub_23920CFEC(Swift::UInt16 *a1)
{
  return HIDUsage.SportControlsUsage.init(rawValue:)(*a1);
}

void sub_23920CFF4(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_2392376A4[*v1];
}

uint64_t static HIDUsage.GameControlsUsage.page.getter()
{
  return 5;
}

BOOL sub_23920D014(char *a1, char *a2)
{
  return word_2392376E8[*a1] == word_2392376E8[*a2];
}

uint64_t sub_23920D038()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_23920D084()
{
  return sub_23922CE5C();
}

uint64_t sub_23920D0B8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::GameControlsUsage_optional sub_23920D100(Swift::UInt16 *a1)
{
  return HIDUsage.GameControlsUsage.init(rawValue:)(*a1);
}

void sub_23920D108(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_2392376E8[*v1];
}

uint64_t static HIDUsage.GenericDeviceControlsUsage.page.getter()
{
  return 6;
}

BOOL sub_23920D128(char *a1, char *a2)
{
  return word_239237722[*a1] == word_239237722[*a2];
}

uint64_t sub_23920D14C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_23920D198()
{
  return sub_23922CE5C();
}

uint64_t sub_23920D1CC()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::GenericDeviceControlsUsage_optional sub_23920D214(Swift::UInt16 *a1)
{
  return HIDUsage.GenericDeviceControlsUsage.init(rawValue:)(*a1);
}

void sub_23920D21C(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237722[*v1];
}

uint64_t static HIDUsage.KeyboardOrKeypadUsage.page.getter()
{
  return 7;
}

uint64_t sub_23920D23C(unsigned __int8 *a1)
{
  return ((uint64_t (*)())((char *)sub_23920D260 + 4 * word_239231E60[*a1]))();
}

uint64_t sub_23920D260()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)sub_23920D940 + 4 * word_239232014[v0]))();
}

BOOL sub_23920D940@<W0>(int a1@<W8>)
{
  return a1 == 2;
}

void sub_23920E010()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23922CE38();
  __asm { BR              X9 }
}

uint64_t sub_23920E04C()
{
  sub_23922CE5C();
  return sub_23922CE74();
}

void sub_23920E730()
{
  __asm { BR              X11 }
}

uint64_t sub_23920E760()
{
  return sub_23922CE5C();
}

void sub_23920EE38()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23922CE38();
  __asm { BR              X9 }
}

uint64_t sub_23920EE70()
{
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional sub_23920F554(Swift::UInt16 *a1)
{
  return HIDUsage.KeyboardOrKeypadUsage.init(rawValue:)(*a1);
}

uint64_t sub_23920F55C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23920F57C + 4 * word_2392326E4[*v0]))();
}

void sub_23920F57C(_WORD *a1@<X8>)
{
  *a1 = 2;
}

void sub_23920F588(_WORD *a1@<X8>)
{
  *a1 = 3;
}

void sub_23920F594(_WORD *a1@<X8>)
{
  *a1 = 4;
}

void sub_23920F5A0(_WORD *a1@<X8>)
{
  *a1 = 5;
}

void sub_23920F5AC(_WORD *a1@<X8>)
{
  *a1 = 6;
}

void sub_23920F5B8(_WORD *a1@<X8>)
{
  *a1 = 7;
}

void sub_23920F5C4(_WORD *a1@<X8>)
{
  *a1 = 8;
}

void sub_23920F5D0(_WORD *a1@<X8>)
{
  *a1 = 9;
}

void sub_23920F5DC(_WORD *a1@<X8>)
{
  *a1 = 10;
}

void sub_23920F5E8(_WORD *a1@<X8>)
{
  *a1 = 11;
}

void sub_23920F5F4(_WORD *a1@<X8>)
{
  *a1 = 12;
}

void sub_23920F600(_WORD *a1@<X8>)
{
  *a1 = 13;
}

void sub_23920F60C(_WORD *a1@<X8>)
{
  *a1 = 14;
}

void sub_23920F618(_WORD *a1@<X8>)
{
  *a1 = 15;
}

void sub_23920F624(_WORD *a1@<X8>)
{
  *a1 = 16;
}

void sub_23920F630(_WORD *a1@<X8>)
{
  *a1 = 17;
}

void sub_23920F63C(_WORD *a1@<X8>)
{
  *a1 = 18;
}

void sub_23920F648(_WORD *a1@<X8>)
{
  *a1 = 19;
}

void sub_23920F654(_WORD *a1@<X8>)
{
  *a1 = 20;
}

void sub_23920F660(_WORD *a1@<X8>)
{
  *a1 = 21;
}

void sub_23920F66C(_WORD *a1@<X8>)
{
  *a1 = 22;
}

void sub_23920F678(_WORD *a1@<X8>)
{
  *a1 = 23;
}

void sub_23920F684(_WORD *a1@<X8>)
{
  *a1 = 24;
}

void sub_23920F690(_WORD *a1@<X8>)
{
  *a1 = 25;
}

void sub_23920F69C(_WORD *a1@<X8>)
{
  *a1 = 26;
}

void sub_23920F6A8(_WORD *a1@<X8>)
{
  *a1 = 27;
}

void sub_23920F6B4(_WORD *a1@<X8>)
{
  *a1 = 28;
}

void sub_23920F6C0(_WORD *a1@<X8>)
{
  *a1 = 29;
}

void sub_23920F6CC(_WORD *a1@<X8>)
{
  *a1 = 30;
}

void sub_23920F6D8(_WORD *a1@<X8>)
{
  *a1 = 31;
}

void sub_23920F6E4(_WORD *a1@<X8>)
{
  *a1 = 32;
}

void sub_23920F6F0(_WORD *a1@<X8>)
{
  *a1 = 33;
}

void sub_23920F6FC(_WORD *a1@<X8>)
{
  *a1 = 34;
}

void sub_23920F708(_WORD *a1@<X8>)
{
  *a1 = 35;
}

void sub_23920F714(_WORD *a1@<X8>)
{
  *a1 = 36;
}

void sub_23920F720(_WORD *a1@<X8>)
{
  *a1 = 37;
}

void sub_23920F72C(_WORD *a1@<X8>)
{
  *a1 = 38;
}

void sub_23920F738(_WORD *a1@<X8>)
{
  *a1 = 39;
}

void sub_23920F744(_WORD *a1@<X8>)
{
  *a1 = 40;
}

void sub_23920F750(_WORD *a1@<X8>)
{
  *a1 = 41;
}

void sub_23920F75C(_WORD *a1@<X8>)
{
  *a1 = 42;
}

void sub_23920F768(_WORD *a1@<X8>)
{
  *a1 = 43;
}

void sub_23920F774(_WORD *a1@<X8>)
{
  *a1 = 44;
}

void sub_23920F780(_WORD *a1@<X8>)
{
  *a1 = 45;
}

void sub_23920F78C(_WORD *a1@<X8>)
{
  *a1 = 46;
}

void sub_23920F798(_WORD *a1@<X8>)
{
  *a1 = 47;
}

void sub_23920F7A4(_WORD *a1@<X8>)
{
  *a1 = 48;
}

void sub_23920F7B0(_WORD *a1@<X8>)
{
  *a1 = 49;
}

void sub_23920F7BC(_WORD *a1@<X8>)
{
  *a1 = 50;
}

void sub_23920F7C8(_WORD *a1@<X8>)
{
  *a1 = 51;
}

void sub_23920F7D4(_WORD *a1@<X8>)
{
  *a1 = 52;
}

void sub_23920F7E0(_WORD *a1@<X8>)
{
  *a1 = 53;
}

void sub_23920F7EC(_WORD *a1@<X8>)
{
  *a1 = 54;
}

void sub_23920F7F8(_WORD *a1@<X8>)
{
  *a1 = 55;
}

void sub_23920F804(_WORD *a1@<X8>)
{
  *a1 = 56;
}

void sub_23920F810(_WORD *a1@<X8>)
{
  *a1 = 57;
}

void sub_23920F81C(_WORD *a1@<X8>)
{
  *a1 = 58;
}

void sub_23920F828(_WORD *a1@<X8>)
{
  *a1 = 59;
}

void sub_23920F834(_WORD *a1@<X8>)
{
  *a1 = 60;
}

void sub_23920F840(_WORD *a1@<X8>)
{
  *a1 = 61;
}

void sub_23920F84C(_WORD *a1@<X8>)
{
  *a1 = 62;
}

void sub_23920F858(_WORD *a1@<X8>)
{
  *a1 = 63;
}

void sub_23920F864(_WORD *a1@<X8>)
{
  *a1 = 64;
}

void sub_23920F870(_WORD *a1@<X8>)
{
  *a1 = 65;
}

void sub_23920F87C(_WORD *a1@<X8>)
{
  *a1 = 66;
}

void sub_23920F888(_WORD *a1@<X8>)
{
  *a1 = 67;
}

void sub_23920F894(_WORD *a1@<X8>)
{
  *a1 = 68;
}

void sub_23920F8A0(_WORD *a1@<X8>)
{
  *a1 = 69;
}

void sub_23920F8AC(_WORD *a1@<X8>)
{
  *a1 = 70;
}

void sub_23920F8B8(_WORD *a1@<X8>)
{
  *a1 = 71;
}

void sub_23920F8C4(_WORD *a1@<X8>)
{
  *a1 = 72;
}

void sub_23920F8D0(_WORD *a1@<X8>)
{
  *a1 = 73;
}

void sub_23920F8DC(_WORD *a1@<X8>)
{
  *a1 = 74;
}

void sub_23920F8E8(_WORD *a1@<X8>)
{
  *a1 = 75;
}

void sub_23920F8F4(_WORD *a1@<X8>)
{
  *a1 = 76;
}

void sub_23920F900(_WORD *a1@<X8>)
{
  *a1 = 77;
}

void sub_23920F90C(_WORD *a1@<X8>)
{
  *a1 = 78;
}

void sub_23920F918(_WORD *a1@<X8>)
{
  *a1 = 79;
}

void sub_23920F924(_WORD *a1@<X8>)
{
  *a1 = 80;
}

void sub_23920F930(_WORD *a1@<X8>)
{
  *a1 = 81;
}

void sub_23920F93C(_WORD *a1@<X8>)
{
  *a1 = 82;
}

void sub_23920F948(_WORD *a1@<X8>)
{
  *a1 = 83;
}

void sub_23920F954(_WORD *a1@<X8>)
{
  *a1 = 84;
}

void sub_23920F960(_WORD *a1@<X8>)
{
  *a1 = 85;
}

void sub_23920F96C(_WORD *a1@<X8>)
{
  *a1 = 86;
}

void sub_23920F978(_WORD *a1@<X8>)
{
  *a1 = 87;
}

void sub_23920F984(_WORD *a1@<X8>)
{
  *a1 = 88;
}

void sub_23920F990(_WORD *a1@<X8>)
{
  *a1 = 89;
}

void sub_23920F99C(_WORD *a1@<X8>)
{
  *a1 = 90;
}

void sub_23920F9A8(_WORD *a1@<X8>)
{
  *a1 = 91;
}

void sub_23920F9B4(_WORD *a1@<X8>)
{
  *a1 = 92;
}

void sub_23920F9C0(_WORD *a1@<X8>)
{
  *a1 = 93;
}

void sub_23920F9CC(_WORD *a1@<X8>)
{
  *a1 = 94;
}

void sub_23920F9D8(_WORD *a1@<X8>)
{
  *a1 = 95;
}

void sub_23920F9E4(_WORD *a1@<X8>)
{
  *a1 = 96;
}

void sub_23920F9F0(_WORD *a1@<X8>)
{
  *a1 = 97;
}

void sub_23920F9FC(_WORD *a1@<X8>)
{
  *a1 = 98;
}

void sub_23920FA08(_WORD *a1@<X8>)
{
  *a1 = 99;
}

void sub_23920FA14(_WORD *a1@<X8>)
{
  *a1 = 100;
}

void sub_23920FA20(_WORD *a1@<X8>)
{
  *a1 = 101;
}

void sub_23920FA2C(_WORD *a1@<X8>)
{
  *a1 = 102;
}

void sub_23920FA38(_WORD *a1@<X8>)
{
  *a1 = 103;
}

void sub_23920FA44(_WORD *a1@<X8>)
{
  *a1 = 104;
}

void sub_23920FA50(_WORD *a1@<X8>)
{
  *a1 = 105;
}

void sub_23920FA5C(_WORD *a1@<X8>)
{
  *a1 = 106;
}

void sub_23920FA68(_WORD *a1@<X8>)
{
  *a1 = 107;
}

void sub_23920FA74(_WORD *a1@<X8>)
{
  *a1 = 108;
}

void sub_23920FA80(_WORD *a1@<X8>)
{
  *a1 = 109;
}

void sub_23920FA8C(_WORD *a1@<X8>)
{
  *a1 = 110;
}

void sub_23920FA98(_WORD *a1@<X8>)
{
  *a1 = 111;
}

void sub_23920FAA4(_WORD *a1@<X8>)
{
  *a1 = 112;
}

void sub_23920FAB0(_WORD *a1@<X8>)
{
  *a1 = 113;
}

void sub_23920FABC(_WORD *a1@<X8>)
{
  *a1 = 114;
}

void sub_23920FAC8(_WORD *a1@<X8>)
{
  *a1 = 115;
}

void sub_23920FAD4(_WORD *a1@<X8>)
{
  *a1 = 116;
}

void sub_23920FAE0(_WORD *a1@<X8>)
{
  *a1 = 117;
}

void sub_23920FAEC(_WORD *a1@<X8>)
{
  *a1 = 118;
}

void sub_23920FAF8(_WORD *a1@<X8>)
{
  *a1 = 119;
}

void sub_23920FB04(_WORD *a1@<X8>)
{
  *a1 = 120;
}

void sub_23920FB10(_WORD *a1@<X8>)
{
  *a1 = 121;
}

void sub_23920FB1C(_WORD *a1@<X8>)
{
  *a1 = 122;
}

void sub_23920FB28(_WORD *a1@<X8>)
{
  *a1 = 123;
}

void sub_23920FB34(_WORD *a1@<X8>)
{
  *a1 = 124;
}

void sub_23920FB40(_WORD *a1@<X8>)
{
  *a1 = 125;
}

void sub_23920FB4C(_WORD *a1@<X8>)
{
  *a1 = 126;
}

void sub_23920FB58(_WORD *a1@<X8>)
{
  *a1 = 127;
}

void sub_23920FB64(_WORD *a1@<X8>)
{
  *a1 = 128;
}

void sub_23920FB70(_WORD *a1@<X8>)
{
  *a1 = 129;
}

void sub_23920FB7C(_WORD *a1@<X8>)
{
  *a1 = 130;
}

void sub_23920FB88(_WORD *a1@<X8>)
{
  *a1 = 131;
}

void sub_23920FB94(_WORD *a1@<X8>)
{
  *a1 = 132;
}

void sub_23920FBA0(_WORD *a1@<X8>)
{
  *a1 = 133;
}

void sub_23920FBAC(_WORD *a1@<X8>)
{
  *a1 = 134;
}

void sub_23920FBB8(_WORD *a1@<X8>)
{
  *a1 = 135;
}

void sub_23920FBC4(_WORD *a1@<X8>)
{
  *a1 = 136;
}

void sub_23920FBD0(_WORD *a1@<X8>)
{
  *a1 = 137;
}

void sub_23920FBDC(_WORD *a1@<X8>)
{
  *a1 = 138;
}

void sub_23920FBE8(_WORD *a1@<X8>)
{
  *a1 = 139;
}

void sub_23920FBF4(_WORD *a1@<X8>)
{
  *a1 = 140;
}

void sub_23920FC00(_WORD *a1@<X8>)
{
  *a1 = 141;
}

void sub_23920FC0C(_WORD *a1@<X8>)
{
  *a1 = 142;
}

void sub_23920FC18(_WORD *a1@<X8>)
{
  *a1 = 143;
}

void sub_23920FC24(_WORD *a1@<X8>)
{
  *a1 = 144;
}

void sub_23920FC30(_WORD *a1@<X8>)
{
  *a1 = 145;
}

void sub_23920FC3C(_WORD *a1@<X8>)
{
  *a1 = 146;
}

void sub_23920FC48(_WORD *a1@<X8>)
{
  *a1 = 147;
}

void sub_23920FC54(_WORD *a1@<X8>)
{
  *a1 = 148;
}

void sub_23920FC60(_WORD *a1@<X8>)
{
  *a1 = 149;
}

void sub_23920FC6C(_WORD *a1@<X8>)
{
  *a1 = 150;
}

void sub_23920FC78(_WORD *a1@<X8>)
{
  *a1 = 151;
}

void sub_23920FC84(_WORD *a1@<X8>)
{
  *a1 = 152;
}

void sub_23920FC90(_WORD *a1@<X8>)
{
  *a1 = 153;
}

void sub_23920FC9C(_WORD *a1@<X8>)
{
  *a1 = 154;
}

void sub_23920FCA8(_WORD *a1@<X8>)
{
  *a1 = 155;
}

void sub_23920FCB4(_WORD *a1@<X8>)
{
  *a1 = 156;
}

void sub_23920FCC0(_WORD *a1@<X8>)
{
  *a1 = 157;
}

void sub_23920FCCC(_WORD *a1@<X8>)
{
  *a1 = 158;
}

void sub_23920FCD8(_WORD *a1@<X8>)
{
  *a1 = 159;
}

void sub_23920FCE4(_WORD *a1@<X8>)
{
  *a1 = 160;
}

void sub_23920FCF0(_WORD *a1@<X8>)
{
  *a1 = 161;
}

void sub_23920FCFC(_WORD *a1@<X8>)
{
  *a1 = 162;
}

void sub_23920FD08(_WORD *a1@<X8>)
{
  *a1 = 163;
}

void sub_23920FD14(_WORD *a1@<X8>)
{
  *a1 = 164;
}

void sub_23920FD20(_WORD *a1@<X8>)
{
  *a1 = 176;
}

void sub_23920FD2C(_WORD *a1@<X8>)
{
  *a1 = 177;
}

void sub_23920FD38(_WORD *a1@<X8>)
{
  *a1 = 178;
}

void sub_23920FD44(_WORD *a1@<X8>)
{
  *a1 = 179;
}

void sub_23920FD50(_WORD *a1@<X8>)
{
  *a1 = 180;
}

void sub_23920FD5C(_WORD *a1@<X8>)
{
  *a1 = 181;
}

void sub_23920FD68(_WORD *a1@<X8>)
{
  *a1 = 182;
}

void sub_23920FD74(_WORD *a1@<X8>)
{
  *a1 = 183;
}

void sub_23920FD80(_WORD *a1@<X8>)
{
  *a1 = 184;
}

void sub_23920FD8C(_WORD *a1@<X8>)
{
  *a1 = 185;
}

void sub_23920FD98(_WORD *a1@<X8>)
{
  *a1 = 186;
}

void sub_23920FDA4(_WORD *a1@<X8>)
{
  *a1 = 187;
}

void sub_23920FDB0(_WORD *a1@<X8>)
{
  *a1 = 188;
}

void sub_23920FDBC(_WORD *a1@<X8>)
{
  *a1 = 189;
}

void sub_23920FDC8(_WORD *a1@<X8>)
{
  *a1 = 190;
}

void sub_23920FDD4(_WORD *a1@<X8>)
{
  *a1 = 191;
}

void sub_23920FDE0(_WORD *a1@<X8>)
{
  *a1 = 192;
}

void sub_23920FDEC(_WORD *a1@<X8>)
{
  *a1 = 193;
}

void sub_23920FDF8(_WORD *a1@<X8>)
{
  *a1 = 194;
}

void sub_23920FE04(_WORD *a1@<X8>)
{
  *a1 = 195;
}

void sub_23920FE10(_WORD *a1@<X8>)
{
  *a1 = 196;
}

void sub_23920FE1C(_WORD *a1@<X8>)
{
  *a1 = 197;
}

void sub_23920FE28(_WORD *a1@<X8>)
{
  *a1 = 198;
}

void sub_23920FE34(_WORD *a1@<X8>)
{
  *a1 = 199;
}

void sub_23920FE40(_WORD *a1@<X8>)
{
  *a1 = 200;
}

void sub_23920FE4C(_WORD *a1@<X8>)
{
  *a1 = 201;
}

void sub_23920FE58(_WORD *a1@<X8>)
{
  *a1 = 202;
}

void sub_23920FE64(_WORD *a1@<X8>)
{
  *a1 = 203;
}

void sub_23920FE70(_WORD *a1@<X8>)
{
  *a1 = 204;
}

void sub_23920FE7C(_WORD *a1@<X8>)
{
  *a1 = 205;
}

void sub_23920FE88(_WORD *a1@<X8>)
{
  *a1 = 206;
}

void sub_23920FE94(_WORD *a1@<X8>)
{
  *a1 = 207;
}

void sub_23920FEA0(_WORD *a1@<X8>)
{
  *a1 = 208;
}

void sub_23920FEAC(_WORD *a1@<X8>)
{
  *a1 = 209;
}

void sub_23920FEB8(_WORD *a1@<X8>)
{
  *a1 = 210;
}

void sub_23920FEC4(_WORD *a1@<X8>)
{
  *a1 = 211;
}

void sub_23920FED0(_WORD *a1@<X8>)
{
  *a1 = 212;
}

void sub_23920FEDC(_WORD *a1@<X8>)
{
  *a1 = 213;
}

void sub_23920FEE8(_WORD *a1@<X8>)
{
  *a1 = 214;
}

void sub_23920FEF4(_WORD *a1@<X8>)
{
  *a1 = 215;
}

void sub_23920FF00(_WORD *a1@<X8>)
{
  *a1 = 216;
}

void sub_23920FF0C(_WORD *a1@<X8>)
{
  *a1 = 217;
}

void sub_23920FF18(_WORD *a1@<X8>)
{
  *a1 = 218;
}

void sub_23920FF24(_WORD *a1@<X8>)
{
  *a1 = 219;
}

void sub_23920FF30(_WORD *a1@<X8>)
{
  *a1 = 220;
}

void sub_23920FF3C(_WORD *a1@<X8>)
{
  *a1 = 221;
}

void sub_23920FF48(_WORD *a1@<X8>)
{
  *a1 = 224;
}

void sub_23920FF54(_WORD *a1@<X8>)
{
  *a1 = 225;
}

void sub_23920FF60(_WORD *a1@<X8>)
{
  *a1 = 226;
}

void sub_23920FF6C(_WORD *a1@<X8>)
{
  *a1 = 227;
}

void sub_23920FF78(_WORD *a1@<X8>)
{
  *a1 = 228;
}

void sub_23920FF84(_WORD *a1@<X8>)
{
  *a1 = 229;
}

void sub_23920FF90(_WORD *a1@<X8>)
{
  *a1 = 230;
}

void sub_23920FF9C(_WORD *a1@<X8>)
{
  *a1 = 231;
}

uint64_t static HIDUsage.LEDUsage.page.getter()
{
  return 8;
}

BOOL sub_23920FFB0(char *a1, char *a2)
{
  return word_239237752[*a1] == word_239237752[*a2];
}

uint64_t sub_23920FFD4()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210020()
{
  return sub_23922CE5C();
}

uint64_t sub_239210054()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::LEDUsage_optional sub_23921009C(Swift::UInt16 *a1)
{
  return HIDUsage.LEDUsage.init(rawValue:)(*a1);
}

void sub_2392100A4(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237752[*v1];
}

uint64_t static HIDUsage.ButtonUsage.page.getter()
{
  return 9;
}

uint64_t static HIDUsage.OrdinalUsage.page.getter()
{
  return 10;
}

uint64_t static HIDUsage.TelephonyDeviceUsage.page.getter()
{
  return 11;
}

BOOL sub_2392100D4(char *a1, char *a2)
{
  return word_239237812[*a1] == word_239237812[*a2];
}

uint64_t sub_2392100F8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210144()
{
  return sub_23922CE5C();
}

uint64_t sub_239210178()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::TelephonyDeviceUsage_optional sub_2392101C0(Swift::UInt16 *a1)
{
  return HIDUsage.TelephonyDeviceUsage.init(rawValue:)(*a1);
}

void sub_2392101C8(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237812[*v1];
}

uint64_t static HIDUsage.ConsumerUsage.page.getter()
{
  return 12;
}

BOOL sub_2392101E8(__int16 *a1, __int16 *a2)
{
  return word_2392378D8[*a1] == word_2392378D8[*a2];
}

uint64_t sub_23921020C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210258()
{
  return sub_23922CE5C();
}

uint64_t sub_23921028C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::ConsumerUsage_optional sub_2392102D4(Swift::UInt16 *a1)
{
  return HIDUsage.ConsumerUsage.init(rawValue:)(*a1);
}

void sub_2392102DC(_WORD *a1@<X8>)
{
  __int16 *v1;

  *a1 = word_2392378D8[*v1];
}

uint64_t static HIDUsage.DigitizersUsage.page.getter()
{
  return 13;
}

BOOL sub_2392102FC(char *a1, char *a2)
{
  return word_239237C5C[*a1] == word_239237C5C[*a2];
}

uint64_t sub_239210320()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_23921036C()
{
  return sub_23922CE5C();
}

uint64_t sub_2392103A0()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::DigitizersUsage_optional sub_2392103E8(Swift::UInt16 *a1)
{
  return HIDUsage.DigitizersUsage.init(rawValue:)(*a1);
}

void sub_2392103F0(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237C5C[*v1];
}

uint64_t static HIDUsage.HapticsUsage.page.getter()
{
  return 14;
}

BOOL sub_239210410(char *a1, char *a2)
{
  return word_239237D34[*a1] == word_239237D34[*a2];
}

uint64_t sub_239210434()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210480()
{
  return sub_23922CE5C();
}

uint64_t sub_2392104B4()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::HapticsUsage_optional sub_2392104FC(Swift::UInt16 *a1)
{
  return HIDUsage.HapticsUsage.init(rawValue:)(*a1);
}

void sub_239210504(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237D34[*v1];
}

uint64_t static HIDUsage.PhysicalInputDeviceUsage.page.getter()
{
  return 15;
}

BOOL sub_239210524(char *a1, char *a2)
{
  return word_239237D6E[*a1] == word_239237D6E[*a2];
}

uint64_t sub_239210548()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210594()
{
  return sub_23922CE5C();
}

uint64_t sub_2392105C8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::PhysicalInputDeviceUsage_optional sub_239210610(Swift::UInt16 *a1)
{
  return HIDUsage.PhysicalInputDeviceUsage.init(rawValue:)(*a1);
}

void sub_239210618(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237D6E[*v1];
}

uint64_t static HIDUsage.SOCUsage.page.getter()
{
  return 17;
}

CoreHID::HIDUsage::SOCUsage_optional sub_239210640(Swift::UInt16 *a1)
{
  return HIDUsage.SOCUsage.init(rawValue:)(*a1);
}

uint64_t static HIDUsage.EyeAndHeadTrackersUsage.page.getter()
{
  return 18;
}

BOOL sub_239210650(char *a1, char *a2)
{
  return word_239237E40[*a1] == word_239237E40[*a2];
}

uint64_t sub_239210674()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_2392106C0()
{
  return sub_23922CE5C();
}

uint64_t sub_2392106F4()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::EyeAndHeadTrackersUsage_optional sub_23921073C(Swift::UInt16 *a1)
{
  return HIDUsage.EyeAndHeadTrackersUsage.init(rawValue:)(*a1);
}

void sub_239210744(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237E40[*v1];
}

uint64_t static HIDUsage.AuxiliaryDisplayUsage.page.getter()
{
  return 20;
}

BOOL sub_239210764(char *a1, char *a2)
{
  return word_239237E84[*a1] == word_239237E84[*a2];
}

uint64_t sub_239210788()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_2392107D4()
{
  return sub_23922CE5C();
}

uint64_t sub_239210808()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::AuxiliaryDisplayUsage_optional sub_239210850(Swift::UInt16 *a1)
{
  return HIDUsage.AuxiliaryDisplayUsage.init(rawValue:)(*a1);
}

void sub_239210858(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239237E84[*v1];
}

uint64_t static HIDUsage.SensorsUsage.page.getter()
{
  return 32;
}

BOOL sub_239210878(__int16 *a1, __int16 *a2)
{
  return word_239237F1A[*a1] == word_239237F1A[*a2];
}

uint64_t sub_23921089C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_2392108E8()
{
  return sub_23922CE5C();
}

uint64_t sub_23921091C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::SensorsUsage_optional sub_239210964(Swift::UInt16 *a1)
{
  return HIDUsage.SensorsUsage.init(rawValue:)(*a1);
}

void sub_23921096C(_WORD *a1@<X8>)
{
  __int16 *v1;

  *a1 = word_239237F1A[*v1];
}

uint64_t static HIDUsage.MedicalInstrumentUsage.page.getter()
{
  return 64;
}

BOOL sub_23921098C(char *a1, char *a2)
{
  return word_23923844C[*a1] == word_23923844C[*a2];
}

uint64_t sub_2392109B0()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_2392109FC()
{
  return sub_23922CE5C();
}

uint64_t sub_239210A30()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::MedicalInstrumentUsage_optional sub_239210A78(Swift::UInt16 *a1)
{
  return HIDUsage.MedicalInstrumentUsage.init(rawValue:)(*a1);
}

void sub_239210A80(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_23923844C[*v1];
}

uint64_t static HIDUsage.BrailleDisplayUsage.page.getter()
{
  return 65;
}

BOOL sub_239210AA0(char *a1, char *a2)
{
  return word_239238486[*a1] == word_239238486[*a2];
}

uint64_t sub_239210AC4()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210B10()
{
  return sub_23922CE5C();
}

uint64_t sub_239210B44()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::BrailleDisplayUsage_optional sub_239210B8C(Swift::UInt16 *a1)
{
  return HIDUsage.BrailleDisplayUsage.init(rawValue:)(*a1);
}

void sub_239210B94(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239238486[*v1];
}

uint64_t static HIDUsage.LightingAndIlluminationUsage.page.getter()
{
  return 89;
}

BOOL sub_239210BB4(char *a1, char *a2)
{
  return word_2392384DC[*a1] == word_2392384DC[*a2];
}

uint64_t sub_239210BD8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210C24()
{
  return sub_23922CE5C();
}

uint64_t sub_239210C58()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::LightingAndIlluminationUsage_optional sub_239210CA0(Swift::UInt16 *a1)
{
  return HIDUsage.LightingAndIlluminationUsage.init(rawValue:)(*a1);
}

void sub_239210CA8(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_2392384DC[*v1];
}

uint64_t static HIDUsage.MonitorUsage.page.getter()
{
  return 128;
}

uint64_t sub_239210CC8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210D0C()
{
  return sub_23922CE5C();
}

uint64_t sub_239210D38()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::MonitorUsage_optional sub_239210D78(Swift::UInt16 *a1)
{
  return HIDUsage.MonitorUsage.init(rawValue:)(*a1);
}

void sub_239210D80(_WORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t static HIDUsage.MonitorEnumeratedUsage.page.getter()
{
  return 129;
}

uint64_t static HIDUsage.VESAVirtualControlsUsage.page.getter()
{
  return 130;
}

BOOL sub_239210DA0(char *a1, char *a2)
{
  return word_23923851E[*a1] == word_23923851E[*a2];
}

uint64_t sub_239210DC4()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210E10()
{
  return sub_23922CE5C();
}

uint64_t sub_239210E44()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::VESAVirtualControlsUsage_optional sub_239210E8C(Swift::UInt16 *a1)
{
  return HIDUsage.VESAVirtualControlsUsage.init(rawValue:)(*a1);
}

void sub_239210E94(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_23923851E[*v1];
}

uint64_t static HIDUsage.PowerUsage.page.getter()
{
  return 132;
}

BOOL sub_239210EB4(char *a1, char *a2)
{
  return word_239238578[*a1] == word_239238578[*a2];
}

uint64_t sub_239210ED8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239210F24()
{
  return sub_23922CE5C();
}

uint64_t sub_239210F58()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::PowerUsage_optional sub_239210FA0(Swift::UInt16 *a1)
{
  return HIDUsage.PowerUsage.init(rawValue:)(*a1);
}

void sub_239210FA8(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239238578[*v1];
}

uint64_t static HIDUsage.BatterySystemUsage.page.getter()
{
  return 133;
}

BOOL sub_239210FC8(char *a1, char *a2)
{
  return word_239238612[*a1] == word_239238612[*a2];
}

uint64_t sub_239210FEC()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239211038()
{
  return sub_23922CE5C();
}

uint64_t sub_23921106C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::BatterySystemUsage_optional sub_2392110B4(Swift::UInt16 *a1)
{
  return HIDUsage.BatterySystemUsage.init(rawValue:)(*a1);
}

void sub_2392110BC(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239238612[*v1];
}

uint64_t static HIDUsage.BarcodeScannerUsage.page.getter()
{
  return 140;
}

uint64_t sub_2392110DC(unsigned __int8 *a1)
{
  return ((uint64_t (*)())((char *)sub_239211100 + 4 * word_239232898[*a1]))();
}

uint64_t sub_239211100()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)sub_239211720 + 4 * word_239232A1C[v0]))();
}

BOOL sub_239211720@<W0>(int a1@<W8>)
{
  return a1 == 2;
}

void sub_239211D30()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23922CE38();
  __asm { BR              X9 }
}

uint64_t sub_239211D6C()
{
  sub_23922CE5C();
  return sub_23922CE74();
}

void sub_239212390()
{
  __asm { BR              X11 }
}

uint64_t sub_2392123C0()
{
  return sub_23922CE5C();
}

void sub_2392129D8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23922CE38();
  __asm { BR              X9 }
}

uint64_t sub_239212A10()
{
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::BarcodeScannerUsage_optional sub_239213034(Swift::UInt16 *a1)
{
  return HIDUsage.BarcodeScannerUsage.init(rawValue:)(*a1);
}

uint64_t sub_23921303C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23921305C + 4 * word_23923302C[*v0]))();
}

void sub_23921305C(_WORD *a1@<X8>)
{
  *a1 = 2;
}

void sub_239213068(_WORD *a1@<X8>)
{
  *a1 = 3;
}

void sub_239213074(_WORD *a1@<X8>)
{
  *a1 = 4;
}

void sub_239213080(_WORD *a1@<X8>)
{
  *a1 = 5;
}

void sub_23921308C(_WORD *a1@<X8>)
{
  *a1 = 16;
}

void sub_239213098(_WORD *a1@<X8>)
{
  *a1 = 17;
}

void sub_2392130A4(_WORD *a1@<X8>)
{
  *a1 = 18;
}

void sub_2392130B0(_WORD *a1@<X8>)
{
  *a1 = 19;
}

void sub_2392130BC(_WORD *a1@<X8>)
{
  *a1 = 20;
}

void sub_2392130C8(_WORD *a1@<X8>)
{
  *a1 = 21;
}

void sub_2392130D4(_WORD *a1@<X8>)
{
  *a1 = 22;
}

void sub_2392130E0(_WORD *a1@<X8>)
{
  *a1 = 23;
}

void sub_2392130EC(_WORD *a1@<X8>)
{
  *a1 = 24;
}

void sub_2392130F8(_WORD *a1@<X8>)
{
  *a1 = 25;
}

void sub_239213104(_WORD *a1@<X8>)
{
  *a1 = 26;
}

void sub_239213110(_WORD *a1@<X8>)
{
  *a1 = 27;
}

void sub_23921311C(_WORD *a1@<X8>)
{
  *a1 = 28;
}

void sub_239213128(_WORD *a1@<X8>)
{
  *a1 = 29;
}

void sub_239213134(_WORD *a1@<X8>)
{
  *a1 = 30;
}

void sub_239213140(_WORD *a1@<X8>)
{
  *a1 = 31;
}

void sub_23921314C(_WORD *a1@<X8>)
{
  *a1 = 48;
}

void sub_239213158(_WORD *a1@<X8>)
{
  *a1 = 49;
}

void sub_239213164(_WORD *a1@<X8>)
{
  *a1 = 50;
}

void sub_239213170(_WORD *a1@<X8>)
{
  *a1 = 51;
}

void sub_23921317C(_WORD *a1@<X8>)
{
  *a1 = 52;
}

void sub_239213188(_WORD *a1@<X8>)
{
  *a1 = 53;
}

void sub_239213194(_WORD *a1@<X8>)
{
  *a1 = 54;
}

void sub_2392131A0(_WORD *a1@<X8>)
{
  *a1 = 55;
}

void sub_2392131AC(_WORD *a1@<X8>)
{
  *a1 = 56;
}

void sub_2392131B8(_WORD *a1@<X8>)
{
  *a1 = 57;
}

void sub_2392131C4(_WORD *a1@<X8>)
{
  *a1 = 58;
}

void sub_2392131D0(_WORD *a1@<X8>)
{
  *a1 = 59;
}

void sub_2392131DC(_WORD *a1@<X8>)
{
  *a1 = 60;
}

void sub_2392131E8(_WORD *a1@<X8>)
{
  *a1 = 61;
}

void sub_2392131F4(_WORD *a1@<X8>)
{
  *a1 = 62;
}

void sub_239213200(_WORD *a1@<X8>)
{
  *a1 = 63;
}

void sub_23921320C(_WORD *a1@<X8>)
{
  *a1 = 64;
}

void sub_239213218(_WORD *a1@<X8>)
{
  *a1 = 65;
}

void sub_239213224(_WORD *a1@<X8>)
{
  *a1 = 66;
}

void sub_239213230(_WORD *a1@<X8>)
{
  *a1 = 67;
}

void sub_23921323C(_WORD *a1@<X8>)
{
  *a1 = 68;
}

void sub_239213248(_WORD *a1@<X8>)
{
  *a1 = 69;
}

void sub_239213254(_WORD *a1@<X8>)
{
  *a1 = 70;
}

void sub_239213260(_WORD *a1@<X8>)
{
  *a1 = 77;
}

void sub_23921326C(_WORD *a1@<X8>)
{
  *a1 = 78;
}

void sub_239213278(_WORD *a1@<X8>)
{
  *a1 = 79;
}

void sub_239213284(_WORD *a1@<X8>)
{
  *a1 = 80;
}

void sub_239213290(_WORD *a1@<X8>)
{
  *a1 = 81;
}

void sub_23921329C(_WORD *a1@<X8>)
{
  *a1 = 82;
}

void sub_2392132A8(_WORD *a1@<X8>)
{
  *a1 = 85;
}

void sub_2392132B4(_WORD *a1@<X8>)
{
  *a1 = 86;
}

void sub_2392132C0(_WORD *a1@<X8>)
{
  *a1 = 87;
}

void sub_2392132CC(_WORD *a1@<X8>)
{
  *a1 = 88;
}

void sub_2392132D8(_WORD *a1@<X8>)
{
  *a1 = 89;
}

void sub_2392132E4(_WORD *a1@<X8>)
{
  *a1 = 90;
}

void sub_2392132F0(_WORD *a1@<X8>)
{
  *a1 = 91;
}

void sub_2392132FC(_WORD *a1@<X8>)
{
  *a1 = 92;
}

void sub_239213308(_WORD *a1@<X8>)
{
  *a1 = 93;
}

void sub_239213314(_WORD *a1@<X8>)
{
  *a1 = 94;
}

void sub_239213320(_WORD *a1@<X8>)
{
  *a1 = 95;
}

void sub_23921332C(_WORD *a1@<X8>)
{
  *a1 = 96;
}

void sub_239213338(_WORD *a1@<X8>)
{
  *a1 = 97;
}

void sub_239213344(_WORD *a1@<X8>)
{
  *a1 = 98;
}

void sub_239213350(_WORD *a1@<X8>)
{
  *a1 = 99;
}

void sub_23921335C(_WORD *a1@<X8>)
{
  *a1 = 100;
}

void sub_239213368(_WORD *a1@<X8>)
{
  *a1 = 101;
}

void sub_239213374(_WORD *a1@<X8>)
{
  *a1 = 102;
}

void sub_239213380(_WORD *a1@<X8>)
{
  *a1 = 109;
}

void sub_23921338C(_WORD *a1@<X8>)
{
  *a1 = 110;
}

void sub_239213398(_WORD *a1@<X8>)
{
  *a1 = 111;
}

void sub_2392133A4(_WORD *a1@<X8>)
{
  *a1 = 112;
}

void sub_2392133B0(_WORD *a1@<X8>)
{
  *a1 = 117;
}

void sub_2392133BC(_WORD *a1@<X8>)
{
  *a1 = 118;
}

void sub_2392133C8(_WORD *a1@<X8>)
{
  *a1 = 122;
}

void sub_2392133D4(_WORD *a1@<X8>)
{
  *a1 = 123;
}

void sub_2392133E0(_WORD *a1@<X8>)
{
  *a1 = 124;
}

void sub_2392133EC(_WORD *a1@<X8>)
{
  *a1 = 125;
}

void sub_2392133F8(_WORD *a1@<X8>)
{
  *a1 = 126;
}

void sub_239213404(_WORD *a1@<X8>)
{
  *a1 = 127;
}

void sub_239213410(_WORD *a1@<X8>)
{
  *a1 = 128;
}

void sub_23921341C(_WORD *a1@<X8>)
{
  *a1 = 130;
}

void sub_239213428(_WORD *a1@<X8>)
{
  *a1 = 131;
}

void sub_239213434(_WORD *a1@<X8>)
{
  *a1 = 132;
}

void sub_239213440(_WORD *a1@<X8>)
{
  *a1 = 133;
}

void sub_23921344C(_WORD *a1@<X8>)
{
  *a1 = 134;
}

void sub_239213458(_WORD *a1@<X8>)
{
  *a1 = 135;
}

void sub_239213464(_WORD *a1@<X8>)
{
  *a1 = 136;
}

void sub_239213470(_WORD *a1@<X8>)
{
  *a1 = 137;
}

void sub_23921347C(_WORD *a1@<X8>)
{
  *a1 = 138;
}

void sub_239213488(_WORD *a1@<X8>)
{
  *a1 = 139;
}

void sub_239213494(_WORD *a1@<X8>)
{
  *a1 = 145;
}

void sub_2392134A0(_WORD *a1@<X8>)
{
  *a1 = 146;
}

void sub_2392134AC(_WORD *a1@<X8>)
{
  *a1 = 147;
}

void sub_2392134B8(_WORD *a1@<X8>)
{
  *a1 = 148;
}

void sub_2392134C4(_WORD *a1@<X8>)
{
  *a1 = 149;
}

void sub_2392134D0(_WORD *a1@<X8>)
{
  *a1 = 150;
}

void sub_2392134DC(_WORD *a1@<X8>)
{
  *a1 = 151;
}

void sub_2392134E8(_WORD *a1@<X8>)
{
  *a1 = 152;
}

void sub_2392134F4(_WORD *a1@<X8>)
{
  *a1 = 153;
}

void sub_239213500(_WORD *a1@<X8>)
{
  *a1 = 154;
}

void sub_23921350C(_WORD *a1@<X8>)
{
  *a1 = 155;
}

void sub_239213518(_WORD *a1@<X8>)
{
  *a1 = 156;
}

void sub_239213524(_WORD *a1@<X8>)
{
  *a1 = 157;
}

void sub_239213530(_WORD *a1@<X8>)
{
  *a1 = 158;
}

void sub_23921353C(_WORD *a1@<X8>)
{
  *a1 = 159;
}

void sub_239213548(_WORD *a1@<X8>)
{
  *a1 = 160;
}

void sub_239213554(_WORD *a1@<X8>)
{
  *a1 = 161;
}

void sub_239213560(_WORD *a1@<X8>)
{
  *a1 = 162;
}

void sub_23921356C(_WORD *a1@<X8>)
{
  *a1 = 169;
}

void sub_239213578(_WORD *a1@<X8>)
{
  *a1 = 170;
}

void sub_239213584(_WORD *a1@<X8>)
{
  *a1 = 171;
}

void sub_239213590(_WORD *a1@<X8>)
{
  *a1 = 172;
}

void sub_23921359C(_WORD *a1@<X8>)
{
  *a1 = 173;
}

void sub_2392135A8(_WORD *a1@<X8>)
{
  *a1 = 174;
}

void sub_2392135B4(_WORD *a1@<X8>)
{
  *a1 = 175;
}

void sub_2392135C0(_WORD *a1@<X8>)
{
  *a1 = 176;
}

void sub_2392135CC(_WORD *a1@<X8>)
{
  *a1 = 177;
}

void sub_2392135D8(_WORD *a1@<X8>)
{
  *a1 = 178;
}

void sub_2392135E4(_WORD *a1@<X8>)
{
  *a1 = 179;
}

void sub_2392135F0(_WORD *a1@<X8>)
{
  *a1 = 180;
}

void sub_2392135FC(_WORD *a1@<X8>)
{
  *a1 = 181;
}

void sub_239213608(_WORD *a1@<X8>)
{
  *a1 = 183;
}

void sub_239213614(_WORD *a1@<X8>)
{
  *a1 = 184;
}

void sub_239213620(_WORD *a1@<X8>)
{
  *a1 = 185;
}

void sub_23921362C(_WORD *a1@<X8>)
{
  *a1 = 186;
}

void sub_239213638(_WORD *a1@<X8>)
{
  *a1 = 187;
}

void sub_239213644(_WORD *a1@<X8>)
{
  *a1 = 188;
}

void sub_239213650(_WORD *a1@<X8>)
{
  *a1 = 189;
}

void sub_23921365C(_WORD *a1@<X8>)
{
  *a1 = 190;
}

void sub_239213668(_WORD *a1@<X8>)
{
  *a1 = 191;
}

void sub_239213674(_WORD *a1@<X8>)
{
  *a1 = 192;
}

void sub_239213680(_WORD *a1@<X8>)
{
  *a1 = 195;
}

void sub_23921368C(_WORD *a1@<X8>)
{
  *a1 = 196;
}

void sub_239213698(_WORD *a1@<X8>)
{
  *a1 = 199;
}

void sub_2392136A4(_WORD *a1@<X8>)
{
  *a1 = 200;
}

void sub_2392136B0(_WORD *a1@<X8>)
{
  *a1 = 201;
}

void sub_2392136BC(_WORD *a1@<X8>)
{
  *a1 = 202;
}

void sub_2392136C8(_WORD *a1@<X8>)
{
  *a1 = 203;
}

void sub_2392136D4(_WORD *a1@<X8>)
{
  *a1 = 204;
}

void sub_2392136E0(_WORD *a1@<X8>)
{
  *a1 = 205;
}

void sub_2392136EC(_WORD *a1@<X8>)
{
  *a1 = 206;
}

void sub_2392136F8(_WORD *a1@<X8>)
{
  *a1 = 211;
}

void sub_239213704(_WORD *a1@<X8>)
{
  *a1 = 212;
}

void sub_239213710(_WORD *a1@<X8>)
{
  *a1 = 213;
}

void sub_23921371C(_WORD *a1@<X8>)
{
  *a1 = 214;
}

void sub_239213728(_WORD *a1@<X8>)
{
  *a1 = 215;
}

void sub_239213734(_WORD *a1@<X8>)
{
  *a1 = 216;
}

void sub_239213740(_WORD *a1@<X8>)
{
  *a1 = 217;
}

void sub_23921374C(_WORD *a1@<X8>)
{
  *a1 = 218;
}

void sub_239213758(_WORD *a1@<X8>)
{
  *a1 = 219;
}

void sub_239213764(_WORD *a1@<X8>)
{
  *a1 = 220;
}

void sub_239213770(_WORD *a1@<X8>)
{
  *a1 = 221;
}

void sub_23921377C(_WORD *a1@<X8>)
{
  *a1 = 222;
}

void sub_239213788(_WORD *a1@<X8>)
{
  *a1 = 223;
}

void sub_239213794(_WORD *a1@<X8>)
{
  *a1 = 240;
}

void sub_2392137A0(_WORD *a1@<X8>)
{
  *a1 = 241;
}

void sub_2392137AC(_WORD *a1@<X8>)
{
  *a1 = 242;
}

void sub_2392137B8(_WORD *a1@<X8>)
{
  *a1 = 251;
}

void sub_2392137C4(_WORD *a1@<X8>)
{
  *a1 = 252;
}

void sub_2392137D0(_WORD *a1@<X8>)
{
  *a1 = 253;
}

void sub_2392137DC(_WORD *a1@<X8>)
{
  *a1 = 254;
}

void sub_2392137E8(_WORD *a1@<X8>)
{
  *a1 = 255;
}

void sub_2392137F4(_WORD *a1@<X8>)
{
  *a1 = 256;
}

void sub_239213800(_WORD *a1@<X8>)
{
  *a1 = 257;
}

void sub_23921380C(_WORD *a1@<X8>)
{
  *a1 = 258;
}

void sub_239213818(_WORD *a1@<X8>)
{
  *a1 = 259;
}

void sub_239213824(_WORD *a1@<X8>)
{
  *a1 = 260;
}

void sub_239213830(_WORD *a1@<X8>)
{
  *a1 = 262;
}

void sub_23921383C(_WORD *a1@<X8>)
{
  *a1 = 263;
}

void sub_239213848(_WORD *a1@<X8>)
{
  *a1 = 264;
}

void sub_239213854(_WORD *a1@<X8>)
{
  *a1 = 265;
}

void sub_239213860(_WORD *a1@<X8>)
{
  *a1 = 266;
}

void sub_23921386C(_WORD *a1@<X8>)
{
  *a1 = 267;
}

void sub_239213878(_WORD *a1@<X8>)
{
  *a1 = 268;
}

void sub_239213884(_WORD *a1@<X8>)
{
  *a1 = 269;
}

void sub_239213890(_WORD *a1@<X8>)
{
  *a1 = 272;
}

void sub_23921389C(_WORD *a1@<X8>)
{
  *a1 = 273;
}

void sub_2392138A8(_WORD *a1@<X8>)
{
  *a1 = 274;
}

void sub_2392138B4(_WORD *a1@<X8>)
{
  *a1 = 275;
}

void sub_2392138C0(_WORD *a1@<X8>)
{
  *a1 = 276;
}

void sub_2392138CC(_WORD *a1@<X8>)
{
  *a1 = 277;
}

void sub_2392138D8(_WORD *a1@<X8>)
{
  *a1 = 278;
}

void sub_2392138E4(_WORD *a1@<X8>)
{
  *a1 = 279;
}

void sub_2392138F0(_WORD *a1@<X8>)
{
  *a1 = 280;
}

void sub_2392138FC(_WORD *a1@<X8>)
{
  *a1 = 281;
}

void sub_239213908(_WORD *a1@<X8>)
{
  *a1 = 282;
}

void sub_239213914(_WORD *a1@<X8>)
{
  *a1 = 283;
}

void sub_239213920(_WORD *a1@<X8>)
{
  *a1 = 284;
}

void sub_23921392C(_WORD *a1@<X8>)
{
  *a1 = 285;
}

void sub_239213938(_WORD *a1@<X8>)
{
  *a1 = 286;
}

void sub_239213944(_WORD *a1@<X8>)
{
  *a1 = 287;
}

void sub_239213950(_WORD *a1@<X8>)
{
  *a1 = 288;
}

void sub_23921395C(_WORD *a1@<X8>)
{
  *a1 = 289;
}

uint64_t static HIDUsage.ScalesUsage.page.getter()
{
  return 141;
}

BOOL sub_239213970(char *a1, char *a2)
{
  return word_2392386C8[*a1] == word_2392386C8[*a2];
}

uint64_t sub_239213994()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_2392139E0()
{
  return sub_23922CE5C();
}

uint64_t sub_239213A14()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::ScalesUsage_optional sub_239213A5C(Swift::UInt16 *a1)
{
  return HIDUsage.ScalesUsage.init(rawValue:)(*a1);
}

void sub_239213A64(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_2392386C8[*v1];
}

uint64_t static HIDUsage.MagneticStripeReaderUsage.page.getter()
{
  return 142;
}

BOOL sub_239213A84(char *a1, char *a2)
{
  return word_239238724[*a1] == word_239238724[*a2];
}

uint64_t sub_239213AA8()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239213AF4()
{
  return sub_23922CE5C();
}

uint64_t sub_239213B28()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::MagneticStripeReaderUsage_optional sub_239213B70(Swift::UInt16 *a1)
{
  return HIDUsage.MagneticStripeReaderUsage.init(rawValue:)(*a1);
}

void sub_239213B78(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239238724[*v1];
}

uint64_t static HIDUsage.CameraControlUsage.page.getter()
{
  return 144;
}

BOOL sub_239213B98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_239213BB0()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239213BFC()
{
  return sub_23922CE5C();
}

uint64_t sub_239213C30()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

unsigned __int16 *sub_239213C78@<X0>(unsigned __int16 *result@<X0>, char *a2@<X8>)
{
  int v2;
  char v3;
  char v4;

  v2 = *result;
  if (v2 == 33)
    v3 = 1;
  else
    v3 = 2;
  if (v2 == 32)
    v4 = 0;
  else
    v4 = v3;
  *a2 = v4;
  return result;
}

void sub_239213C98(__int16 *a1@<X8>)
{
  _BYTE *v1;
  __int16 v2;

  if (*v1)
    v2 = 33;
  else
    v2 = 32;
  *a1 = v2;
}

uint64_t static HIDUsage.ArcadeUsage.page.getter()
{
  return 145;
}

BOOL sub_239213CB8(char *a1, char *a2)
{
  return word_239238738[*a1] == word_239238738[*a2];
}

uint64_t sub_239213CDC()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239213D28()
{
  return sub_23922CE5C();
}

uint64_t sub_239213D5C()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::ArcadeUsage_optional sub_239213DA4(Swift::UInt16 *a1)
{
  return HIDUsage.ArcadeUsage.init(rawValue:)(*a1);
}

void sub_239213DAC(_WORD *a1@<X8>)
{
  char *v1;

  *a1 = word_239238738[*v1];
}

uint64_t static HIDUsage.FIDOAllianceUsage.page.getter()
{
  return 61904;
}

BOOL sub_239213DCC(_BYTE *a1, _BYTE *a2)
{
  return (unsigned __int16)(0x2100200001uLL >> (16 * *a1)) == (unsigned __int16)(0x2100200001uLL >> (16 * *a2));
}

uint64_t sub_239213E04()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

uint64_t sub_239213E58()
{
  return sub_23922CE5C();
}

uint64_t sub_239213E94()
{
  sub_23922CE38();
  sub_23922CE5C();
  return sub_23922CE74();
}

CoreHID::HIDUsage::FIDOAllianceUsage_optional sub_239213EE4(Swift::UInt16 *a1)
{
  return HIDUsage.FIDOAllianceUsage.init(rawValue:)(*a1);
}

void sub_239213EEC(_WORD *a1@<X8>)
{
  _BYTE *v1;

  *a1 = 0x2100200001uLL >> (16 * *v1);
}

void _s7CoreHID8HIDUsageO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X12 }
}

uint64_t sub_239213F58()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)sub_23921407C + 4 * byte_2392331D2[(v0 >> 34) & 0x3F]))();
}

BOOL sub_23921407C()
{
  int v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v5;

  if (v0 != 2)
    return 0;
  HIDUsage.usage.getter();
  v2 = v1;
  HIDUsage.usage.getter();
  v5 = (v3 & 0x10000) == 0 && (unsigned __int16)v2 == (unsigned __int16)v3;
  if ((v2 & 0x10000) != 0)
    return HIWORD(v3) & 1;
  else
    return v5;
}

unint64_t sub_239214280()
{
  unint64_t result;

  result = qword_25691FCB8;
  if (!qword_25691FCB8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage, &type metadata for HIDUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCB8);
  }
  return result;
}

unint64_t sub_2392142C8()
{
  unint64_t result;

  result = qword_25691FCC0;
  if (!qword_25691FCC0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.GenericDesktopUsage, &type metadata for HIDUsage.GenericDesktopUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCC0);
  }
  return result;
}

unint64_t sub_239214310()
{
  unint64_t result;

  result = qword_25691FCC8;
  if (!qword_25691FCC8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.SimulationControlsUsage, &type metadata for HIDUsage.SimulationControlsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCC8);
  }
  return result;
}

unint64_t sub_239214358()
{
  unint64_t result;

  result = qword_25691FCD0;
  if (!qword_25691FCD0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.VRControlsUsage, &type metadata for HIDUsage.VRControlsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCD0);
  }
  return result;
}

unint64_t sub_2392143A0()
{
  unint64_t result;

  result = qword_25691FCD8;
  if (!qword_25691FCD8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.SportControlsUsage, &type metadata for HIDUsage.SportControlsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCD8);
  }
  return result;
}

unint64_t sub_2392143E8()
{
  unint64_t result;

  result = qword_25691FCE0;
  if (!qword_25691FCE0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.GameControlsUsage, &type metadata for HIDUsage.GameControlsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCE0);
  }
  return result;
}

unint64_t sub_239214430()
{
  unint64_t result;

  result = qword_25691FCE8;
  if (!qword_25691FCE8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.GenericDeviceControlsUsage, &type metadata for HIDUsage.GenericDeviceControlsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCE8);
  }
  return result;
}

unint64_t sub_239214478()
{
  unint64_t result;

  result = qword_25691FCF0;
  if (!qword_25691FCF0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.KeyboardOrKeypadUsage, &type metadata for HIDUsage.KeyboardOrKeypadUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCF0);
  }
  return result;
}

unint64_t sub_2392144C0()
{
  unint64_t result;

  result = qword_25691FCF8;
  if (!qword_25691FCF8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.LEDUsage, &type metadata for HIDUsage.LEDUsage);
    atomic_store(result, (unint64_t *)&qword_25691FCF8);
  }
  return result;
}

unint64_t sub_239214508()
{
  unint64_t result;

  result = qword_25691FD00;
  if (!qword_25691FD00)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.TelephonyDeviceUsage, &type metadata for HIDUsage.TelephonyDeviceUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD00);
  }
  return result;
}

unint64_t sub_239214550()
{
  unint64_t result;

  result = qword_25691FD08;
  if (!qword_25691FD08)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.ConsumerUsage, &type metadata for HIDUsage.ConsumerUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD08);
  }
  return result;
}

unint64_t sub_239214598()
{
  unint64_t result;

  result = qword_25691FD10;
  if (!qword_25691FD10)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.DigitizersUsage, &type metadata for HIDUsage.DigitizersUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD10);
  }
  return result;
}

unint64_t sub_2392145E0()
{
  unint64_t result;

  result = qword_25691FD18;
  if (!qword_25691FD18)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.HapticsUsage, &type metadata for HIDUsage.HapticsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD18);
  }
  return result;
}

unint64_t sub_239214628()
{
  unint64_t result;

  result = qword_25691FD20;
  if (!qword_25691FD20)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.PhysicalInputDeviceUsage, &type metadata for HIDUsage.PhysicalInputDeviceUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD20);
  }
  return result;
}

unint64_t sub_239214670()
{
  unint64_t result;

  result = qword_25691FD28;
  if (!qword_25691FD28)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.SOCUsage, &type metadata for HIDUsage.SOCUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD28);
  }
  return result;
}

unint64_t sub_2392146B8()
{
  unint64_t result;

  result = qword_25691FD30;
  if (!qword_25691FD30)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.EyeAndHeadTrackersUsage, &type metadata for HIDUsage.EyeAndHeadTrackersUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD30);
  }
  return result;
}

unint64_t sub_239214700()
{
  unint64_t result;

  result = qword_25691FD38;
  if (!qword_25691FD38)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.AuxiliaryDisplayUsage, &type metadata for HIDUsage.AuxiliaryDisplayUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD38);
  }
  return result;
}

unint64_t sub_239214748()
{
  unint64_t result;

  result = qword_25691FD40;
  if (!qword_25691FD40)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.SensorsUsage, &type metadata for HIDUsage.SensorsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD40);
  }
  return result;
}

unint64_t sub_239214790()
{
  unint64_t result;

  result = qword_25691FD48;
  if (!qword_25691FD48)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.MedicalInstrumentUsage, &type metadata for HIDUsage.MedicalInstrumentUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD48);
  }
  return result;
}

unint64_t sub_2392147D8()
{
  unint64_t result;

  result = qword_25691FD50;
  if (!qword_25691FD50)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.BrailleDisplayUsage, &type metadata for HIDUsage.BrailleDisplayUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD50);
  }
  return result;
}

unint64_t sub_239214820()
{
  unint64_t result;

  result = qword_25691FD58;
  if (!qword_25691FD58)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.LightingAndIlluminationUsage, &type metadata for HIDUsage.LightingAndIlluminationUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD58);
  }
  return result;
}

unint64_t sub_239214868()
{
  unint64_t result;

  result = qword_25691FD60;
  if (!qword_25691FD60)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.MonitorUsage, &type metadata for HIDUsage.MonitorUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD60);
  }
  return result;
}

unint64_t sub_2392148B0()
{
  unint64_t result;

  result = qword_25691FD68;
  if (!qword_25691FD68)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.VESAVirtualControlsUsage, &type metadata for HIDUsage.VESAVirtualControlsUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD68);
  }
  return result;
}

unint64_t sub_2392148F8()
{
  unint64_t result;

  result = qword_25691FD70;
  if (!qword_25691FD70)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.PowerUsage, &type metadata for HIDUsage.PowerUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD70);
  }
  return result;
}

unint64_t sub_239214940()
{
  unint64_t result;

  result = qword_25691FD78;
  if (!qword_25691FD78)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.BatterySystemUsage, &type metadata for HIDUsage.BatterySystemUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD78);
  }
  return result;
}

unint64_t sub_239214988()
{
  unint64_t result;

  result = qword_25691FD80;
  if (!qword_25691FD80)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.BarcodeScannerUsage, &type metadata for HIDUsage.BarcodeScannerUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD80);
  }
  return result;
}

unint64_t sub_2392149D0()
{
  unint64_t result;

  result = qword_25691FD88;
  if (!qword_25691FD88)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.ScalesUsage, &type metadata for HIDUsage.ScalesUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD88);
  }
  return result;
}

unint64_t sub_239214A18()
{
  unint64_t result;

  result = qword_25691FD90;
  if (!qword_25691FD90)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.MagneticStripeReaderUsage, &type metadata for HIDUsage.MagneticStripeReaderUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD90);
  }
  return result;
}

unint64_t sub_239214A60()
{
  unint64_t result;

  result = qword_25691FD98;
  if (!qword_25691FD98)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.CameraControlUsage, &type metadata for HIDUsage.CameraControlUsage);
    atomic_store(result, (unint64_t *)&qword_25691FD98);
  }
  return result;
}

unint64_t sub_239214AA8()
{
  unint64_t result;

  result = qword_25691FDA0;
  if (!qword_25691FDA0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.ArcadeUsage, &type metadata for HIDUsage.ArcadeUsage);
    atomic_store(result, (unint64_t *)&qword_25691FDA0);
  }
  return result;
}

unint64_t sub_239214AF0()
{
  unint64_t result;

  result = qword_25691FDA8;
  if (!qword_25691FDA8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDUsage.FIDOAllianceUsage, &type metadata for HIDUsage.FIDOAllianceUsage);
    atomic_store(result, (unint64_t *)&qword_25691FDA8);
  }
  return result;
}

uint64_t __swift_memcpy5_2(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDUsage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x5F && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 95);
  v3 = ((*(unsigned __int8 *)(a1 + 4) >> 2) & 0xFFFFFFBF | (((*(unsigned __int8 *)(a1 + 4) >> 1) & 1) << 6)) ^ 0x7F;
  if (v3 >= 0x5E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HIDUsage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x5E)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 95;
    if (a3 >= 0x5F)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0x5F)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
    {
      *(_DWORD *)result = 0;
      *(_BYTE *)(result + 4) = 2 * (((-a2 & 0x40) != 0) - 2 * a2);
    }
  }
  return result;
}

uint64_t sub_239214BF0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4) >> 2;
}

uint64_t sub_239214BFC(uint64_t result)
{
  *(_BYTE *)(result + 4) &= 3u;
  return result;
}

unsigned int *sub_239214C14(unsigned int *result, uint64_t a2)
{
  *((_BYTE *)result + 4) = ((*result | ((unint64_t)*((unsigned __int8 *)result + 4) << 32)) & 0x1FFFFFFFFLL | (a2 << 34)) >> 32;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage()
{
  return &type metadata for HIDUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.GenericDesktopUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0x8F)
    goto LABEL_17;
  if (a2 + 113 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 113) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 113;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 113;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 113;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x72;
  v8 = v6 - 114;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.GenericDesktopUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 113 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 113) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x8F)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x8E)
    return ((uint64_t (*)(void))((char *)&loc_239214D20 + 4 * byte_2392331F9[v4]))();
  *a1 = a2 + 113;
  return ((uint64_t (*)(void))((char *)sub_239214D54 + 4 * byte_2392331F4[v4]))();
}

uint64_t sub_239214D54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239214D5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239214D64);
  return result;
}

uint64_t sub_239214D70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239214D78);
  *(_BYTE *)result = a2 + 113;
  return result;
}

uint64_t sub_239214D7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239214D84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.GenericDesktopUsage()
{
  return &type metadata for HIDUsage.GenericDesktopUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.SimulationControlsUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xCE)
    goto LABEL_17;
  if (a2 + 50 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 50) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 50;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 50;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 50;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x33;
  v8 = v6 - 51;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.SimulationControlsUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 50 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 50) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xCE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xCD)
    return ((uint64_t (*)(void))((char *)&loc_239214E7C + 4 * byte_239233203[v4]))();
  *a1 = a2 + 50;
  return ((uint64_t (*)(void))((char *)sub_239214EB0 + 4 * byte_2392331FE[v4]))();
}

uint64_t sub_239214EB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239214EB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239214EC0);
  return result;
}

uint64_t sub_239214ECC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239214ED4);
  *(_BYTE *)result = a2 + 50;
  return result;
}

uint64_t sub_239214ED8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239214EE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.SimulationControlsUsage()
{
  return &type metadata for HIDUsage.SimulationControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.VRControlsUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.VRControlsUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_239214FD8 + 4 * byte_23923320D[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23921500C + 4 * byte_239233208[v4]))();
}

uint64_t sub_23921500C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215014(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23921501CLL);
  return result;
}

uint64_t sub_239215028(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239215030);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_239215034(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23921503C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.VRControlsUsage()
{
  return &type metadata for HIDUsage.VRControlsUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.SportControlsUsage()
{
  return &type metadata for HIDUsage.SportControlsUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.GameControlsUsage()
{
  return &type metadata for HIDUsage.GameControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.GenericDeviceControlsUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE9)
    goto LABEL_17;
  if (a2 + 23 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 23) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 23;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 23;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 23;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x18;
  v8 = v6 - 24;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.GenericDeviceControlsUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 23 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 23) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE8)
    return ((uint64_t (*)(void))((char *)&loc_239215164 + 4 * byte_239233217[v4]))();
  *a1 = a2 + 23;
  return ((uint64_t (*)(void))((char *)sub_239215198 + 4 * byte_239233212[v4]))();
}

uint64_t sub_239215198(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392151A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2392151A8);
  return result;
}

uint64_t sub_2392151B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2392151BCLL);
  *(_BYTE *)result = a2 + 23;
  return result;
}

uint64_t sub_2392151C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392151C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.GenericDeviceControlsUsage()
{
  return &type metadata for HIDUsage.GenericDeviceControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.KeyboardOrKeypadUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0x27)
    goto LABEL_17;
  if (a2 + 217 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 217) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 217;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 217;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 217;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xDA;
  v8 = v6 - 218;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.KeyboardOrKeypadUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 217 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 217) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x27)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x26)
    return ((uint64_t (*)(void))((char *)&loc_2392152C0 + 4 * byte_239233221[v4]))();
  *a1 = a2 - 39;
  return ((uint64_t (*)(void))((char *)sub_2392152F4 + 4 * byte_23923321C[v4]))();
}

uint64_t sub_2392152F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392152FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239215304);
  return result;
}

uint64_t sub_239215310(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239215318);
  *(_BYTE *)result = a2 - 39;
  return result;
}

uint64_t sub_23921531C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215324(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.KeyboardOrKeypadUsage()
{
  return &type metadata for HIDUsage.KeyboardOrKeypadUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.LEDUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xA1)
    goto LABEL_17;
  if (a2 + 95 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 95) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 95;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 95;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 95;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x60;
  v8 = v6 - 96;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.LEDUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 95 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 95) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xA1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xA0)
    return ((uint64_t (*)(void))((char *)&loc_23921541C + 4 * byte_23923322B[v4]))();
  *a1 = a2 + 95;
  return ((uint64_t (*)(void))((char *)sub_239215450 + 4 * byte_239233226[v4]))();
}

uint64_t sub_239215450(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215458(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239215460);
  return result;
}

uint64_t sub_23921546C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239215474);
  *(_BYTE *)result = a2 + 95;
  return result;
}

uint64_t sub_239215478(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215480(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.LEDUsage()
{
  return &type metadata for HIDUsage.LEDUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.ButtonUsage()
{
  return &type metadata for HIDUsage.ButtonUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.OrdinalUsage()
{
  return &type metadata for HIDUsage.OrdinalUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.TelephonyDeviceUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0x9E)
    goto LABEL_17;
  if (a2 + 98 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 98) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 98;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 98;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 98;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x63;
  v8 = v6 - 99;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.TelephonyDeviceUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 98 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 98) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x9E)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x9D)
    return ((uint64_t (*)(void))((char *)&loc_239215598 + 4 * byte_239233235[v4]))();
  *a1 = a2 + 98;
  return ((uint64_t (*)(void))((char *)sub_2392155CC + 4 * byte_239233230[v4]))();
}

uint64_t sub_2392155CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392155D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2392155DCLL);
  return result;
}

uint64_t sub_2392155E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2392155F0);
  *(_BYTE *)result = a2 + 98;
  return result;
}

uint64_t sub_2392155F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392155FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.TelephonyDeviceUsage()
{
  return &type metadata for HIDUsage.TelephonyDeviceUsage;
}

_WORD *__swift_memcpy2_2(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDUsage.ConsumerUsage(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE3F)
    goto LABEL_17;
  if (a2 + 449 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 449 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 449;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 449;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 449;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1C2;
  v8 = v6 - 450;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.ConsumerUsage(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;

  if (a3 + 449 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 449 < 0xFF0000)
    v4 = 1;
  else
    v4 = v3;
  if (a3 >= 0xFE3F)
    v5 = v4;
  else
    v5 = 0;
  if (a2 <= 0xFE3E)
    return ((uint64_t (*)(void))((char *)&loc_239215704 + 4 * byte_23923323F[v5]))();
  *a1 = a2 + 449;
  return ((uint64_t (*)(void))((char *)sub_23921573C + 4 * byte_23923323A[v5]))();
}

uint64_t sub_23921573C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_239215744(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x23921574CLL);
  return result;
}

uint64_t sub_239215758(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x239215760);
  *(_WORD *)result = a2 + 449;
  return result;
}

uint64_t sub_239215764(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23921576C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.ConsumerUsage()
{
  return &type metadata for HIDUsage.ConsumerUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.DigitizersUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0x95)
    goto LABEL_17;
  if (a2 + 107 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 107) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 107;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 107;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 107;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x6C;
  v8 = v6 - 108;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.DigitizersUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 107 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 107) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x95)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x94)
    return ((uint64_t (*)(void))((char *)&loc_239215864 + 4 * byte_239233249[v4]))();
  *a1 = a2 + 107;
  return ((uint64_t (*)(void))((char *)sub_239215898 + 4 * byte_239233244[v4]))();
}

uint64_t sub_239215898(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392158A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2392158A8);
  return result;
}

uint64_t sub_2392158B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2392158BCLL);
  *(_BYTE *)result = a2 + 107;
  return result;
}

uint64_t sub_2392158C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392158C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.DigitizersUsage()
{
  return &type metadata for HIDUsage.DigitizersUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.HapticsUsage()
{
  return &type metadata for HIDUsage.HapticsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.PhysicalInputDeviceUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0x98)
    goto LABEL_17;
  if (a2 + 104 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 104) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 104;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 104;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 104;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x69;
  v8 = v6 - 105;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.PhysicalInputDeviceUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 104 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 104) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x98)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x97)
    return ((uint64_t (*)(void))((char *)&loc_2392159D0 + 4 * byte_239233253[v4]))();
  *a1 = a2 + 104;
  return ((uint64_t (*)(void))((char *)sub_239215A04 + 4 * byte_23923324E[v4]))();
}

uint64_t sub_239215A04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215A0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239215A14);
  return result;
}

uint64_t sub_239215A20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239215A28);
  *(_BYTE *)result = a2 + 104;
  return result;
}

uint64_t sub_239215A2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215A34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.PhysicalInputDeviceUsage()
{
  return &type metadata for HIDUsage.PhysicalInputDeviceUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.SOCUsage()
{
  return &type metadata for HIDUsage.SOCUsage;
}

uint64_t _s7CoreHID8HIDUsageO18SportControlsUsageOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDF)
    goto LABEL_17;
  if (a2 + 33 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 33) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 33;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 33;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 33;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x22;
  v8 = v6 - 34;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s7CoreHID8HIDUsageO18SportControlsUsageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 33 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 33) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDE)
    return ((uint64_t (*)(void))((char *)&loc_239215B44 + 4 * byte_23923325D[v4]))();
  *a1 = a2 + 33;
  return ((uint64_t (*)(void))((char *)sub_239215B78 + 4 * byte_239233258[v4]))();
}

uint64_t sub_239215B78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215B80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239215B88);
  return result;
}

uint64_t sub_239215B94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239215B9CLL);
  *(_BYTE *)result = a2 + 33;
  return result;
}

uint64_t sub_239215BA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215BA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.EyeAndHeadTrackersUsage()
{
  return &type metadata for HIDUsage.EyeAndHeadTrackersUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.AuxiliaryDisplayUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xB6)
    goto LABEL_17;
  if (a2 + 74 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 74) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 74;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 74;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 74;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x4B;
  v8 = v6 - 75;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.AuxiliaryDisplayUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 74 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 74) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xB6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xB5)
    return ((uint64_t (*)(void))((char *)&loc_239215CA0 + 4 * byte_239233267[v4]))();
  *a1 = a2 + 74;
  return ((uint64_t (*)(void))((char *)sub_239215CD4 + 4 * byte_239233262[v4]))();
}

uint64_t sub_239215CD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215CDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239215CE4);
  return result;
}

uint64_t sub_239215CF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239215CF8);
  *(_BYTE *)result = a2 + 74;
  return result;
}

uint64_t sub_239215CFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215D04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.AuxiliaryDisplayUsage()
{
  return &type metadata for HIDUsage.AuxiliaryDisplayUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.SensorsUsage(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD68)
    goto LABEL_17;
  if (a2 + 664 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 664 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 664;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 664;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 664;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x299;
  v8 = v6 - 665;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.SensorsUsage(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;

  if (a3 + 664 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 664 < 0xFF0000)
    v4 = 1;
  else
    v4 = v3;
  if (a3 >= 0xFD68)
    v5 = v4;
  else
    v5 = 0;
  if (a2 <= 0xFD67)
    return ((uint64_t (*)(void))((char *)&loc_239215E00 + 4 * byte_239233271[v5]))();
  *a1 = a2 + 664;
  return ((uint64_t (*)(void))((char *)sub_239215E38 + 4 * byte_23923326C[v5]))();
}

uint64_t sub_239215E38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_239215E40(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x239215E48);
  return result;
}

uint64_t sub_239215E54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x239215E5CLL);
  *(_WORD *)result = a2 + 664;
  return result;
}

uint64_t sub_239215E60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_239215E68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_239215E74(unsigned __int16 *a1)
{
  return *a1;
}

_WORD *sub_239215E7C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.SensorsUsage()
{
  return &type metadata for HIDUsage.SensorsUsage;
}

uint64_t _s7CoreHID8HIDUsageO17GameControlsUsageOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE4)
    goto LABEL_17;
  if (a2 + 28 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 28) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 28;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 28;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 28;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1D;
  v8 = v6 - 29;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s7CoreHID8HIDUsageO17GameControlsUsageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 28 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 28) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE3)
    return ((uint64_t (*)(void))((char *)&loc_239215F70 + 4 * byte_23923327B[v4]))();
  *a1 = a2 + 28;
  return ((uint64_t (*)(void))((char *)sub_239215FA4 + 4 * byte_239233276[v4]))();
}

uint64_t sub_239215FA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215FAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239215FB4);
  return result;
}

uint64_t sub_239215FC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239215FC8);
  *(_BYTE *)result = a2 + 28;
  return result;
}

uint64_t sub_239215FCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239215FD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.MedicalInstrumentUsage()
{
  return &type metadata for HIDUsage.MedicalInstrumentUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.BrailleDisplayUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xD6)
    goto LABEL_17;
  if (a2 + 42 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 42) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 42;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 42;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 42;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x2B;
  v8 = v6 - 43;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.BrailleDisplayUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 42 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 42) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD5)
    return ((uint64_t (*)(void))((char *)&loc_2392160CC + 4 * byte_239233285[v4]))();
  *a1 = a2 + 42;
  return ((uint64_t (*)(void))((char *)sub_239216100 + 4 * byte_239233280[v4]))();
}

uint64_t sub_239216100(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216108(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216110);
  return result;
}

uint64_t sub_23921611C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216124);
  *(_BYTE *)result = a2 + 42;
  return result;
}

uint64_t sub_239216128(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216130(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.BrailleDisplayUsage()
{
  return &type metadata for HIDUsage.BrailleDisplayUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.LightingAndIlluminationUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE0)
    goto LABEL_17;
  if (a2 + 32 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 32) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 32;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 32;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 32;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x21;
  v8 = v6 - 33;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.LightingAndIlluminationUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 32 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 32) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDF)
    return ((uint64_t (*)(void))((char *)&loc_239216228 + 4 * byte_23923328F[v4]))();
  *a1 = a2 + 32;
  return ((uint64_t (*)(void))((char *)sub_23921625C + 4 * byte_23923328A[v4]))();
}

uint64_t sub_23921625C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216264(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23921626CLL);
  return result;
}

uint64_t sub_239216278(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216280);
  *(_BYTE *)result = a2 + 32;
  return result;
}

uint64_t sub_239216284(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23921628C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.LightingAndIlluminationUsage()
{
  return &type metadata for HIDUsage.LightingAndIlluminationUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.MonitorUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.MonitorUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_239216384 + 4 * byte_239233299[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2392163B8 + 4 * byte_239233294[v4]))();
}

uint64_t sub_2392163B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392163C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2392163C8);
  return result;
}

uint64_t sub_2392163D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2392163DCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2392163E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392163E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.MonitorUsage()
{
  return &type metadata for HIDUsage.MonitorUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.MonitorEnumeratedUsage()
{
  return &type metadata for HIDUsage.MonitorEnumeratedUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.VESAVirtualControlsUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xD4)
    goto LABEL_17;
  if (a2 + 44 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 44) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 44;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 44;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 44;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x2D;
  v8 = v6 - 45;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.VESAVirtualControlsUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 44 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 44) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD3)
    return ((uint64_t (*)(void))((char *)&loc_2392164F0 + 4 * byte_2392332A3[v4]))();
  *a1 = a2 + 44;
  return ((uint64_t (*)(void))((char *)sub_239216524 + 4 * byte_23923329E[v4]))();
}

uint64_t sub_239216524(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23921652C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216534);
  return result;
}

uint64_t sub_239216540(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216548);
  *(_BYTE *)result = a2 + 44;
  return result;
}

uint64_t sub_23921654C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216554(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.VESAVirtualControlsUsage()
{
  return &type metadata for HIDUsage.VESAVirtualControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.PowerUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xB4)
    goto LABEL_17;
  if (a2 + 76 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 76) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 76;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 76;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 76;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x4D;
  v8 = v6 - 77;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.PowerUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 76 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 76) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xB4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xB3)
    return ((uint64_t (*)(void))((char *)&loc_23921664C + 4 * byte_2392332AD[v4]))();
  *a1 = a2 + 76;
  return ((uint64_t (*)(void))((char *)sub_239216680 + 4 * byte_2392332A8[v4]))();
}

uint64_t sub_239216680(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216688(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216690);
  return result;
}

uint64_t sub_23921669C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2392166A4);
  *(_BYTE *)result = a2 + 76;
  return result;
}

uint64_t sub_2392166A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392166B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.PowerUsage()
{
  return &type metadata for HIDUsage.PowerUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.BatterySystemUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xA6)
    goto LABEL_17;
  if (a2 + 90 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 90) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 90;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 90;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 90;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x5B;
  v8 = v6 - 91;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.BatterySystemUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 90 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 90) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xA6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xA5)
    return ((uint64_t (*)(void))((char *)&loc_2392167A8 + 4 * byte_2392332B7[v4]))();
  *a1 = a2 + 90;
  return ((uint64_t (*)(void))((char *)sub_2392167DC + 4 * byte_2392332B2[v4]))();
}

uint64_t sub_2392167DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392167E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2392167ECLL);
  return result;
}

uint64_t sub_2392167F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216800);
  *(_BYTE *)result = a2 + 90;
  return result;
}

uint64_t sub_239216804(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23921680C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.BatterySystemUsage()
{
  return &type metadata for HIDUsage.BatterySystemUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.BarcodeScannerUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0x3F)
    goto LABEL_17;
  if (a2 + 193 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 193) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 193;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 193;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 193;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC2;
  v8 = v6 - 194;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.BarcodeScannerUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 193 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 193) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x3F)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x3E)
    return ((uint64_t (*)(void))((char *)&loc_239216904 + 4 * byte_2392332C1[v4]))();
  *a1 = a2 - 63;
  return ((uint64_t (*)(void))((char *)sub_239216938 + 4 * byte_2392332BC[v4]))();
}

uint64_t sub_239216938(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216940(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216948);
  return result;
}

uint64_t sub_239216954(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23921695CLL);
  *(_BYTE *)result = a2 - 63;
  return result;
}

uint64_t sub_239216960(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216968(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.BarcodeScannerUsage()
{
  return &type metadata for HIDUsage.BarcodeScannerUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.ScalesUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xD3)
    goto LABEL_17;
  if (a2 + 45 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 45) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 45;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 45;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 45;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x2E;
  v8 = v6 - 46;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.ScalesUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 45 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 45) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD2)
    return ((uint64_t (*)(void))((char *)&loc_239216A60 + 4 * byte_2392332CB[v4]))();
  *a1 = a2 + 45;
  return ((uint64_t (*)(void))((char *)sub_239216A94 + 4 * byte_2392332C6[v4]))();
}

uint64_t sub_239216A94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216A9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216AA4);
  return result;
}

uint64_t sub_239216AB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216AB8);
  *(_BYTE *)result = a2 + 45;
  return result;
}

uint64_t sub_239216ABC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216AC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.ScalesUsage()
{
  return &type metadata for HIDUsage.ScalesUsage;
}

uint64_t _s7CoreHID8HIDUsageO8SOCUsageOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s7CoreHID8HIDUsageO8SOCUsageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_239216BBC + 4 * byte_2392332D5[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_239216BF0 + 4 * byte_2392332D0[v4]))();
}

uint64_t sub_239216BF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216BF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216C00);
  return result;
}

uint64_t sub_239216C0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216C14);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_239216C18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216C20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.MagneticStripeReaderUsage()
{
  return &type metadata for HIDUsage.MagneticStripeReaderUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.CameraControlUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.CameraControlUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_239216D18 + 4 * byte_2392332DF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_239216D4C + 4 * byte_2392332DA[v4]))();
}

uint64_t sub_239216D4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216D54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216D5CLL);
  return result;
}

uint64_t sub_239216D68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216D70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_239216D74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216D7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_239216D88(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.CameraControlUsage()
{
  return &type metadata for HIDUsage.CameraControlUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.ArcadeUsage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE6)
    goto LABEL_17;
  if (a2 + 26 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 26) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 26;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 26;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 26;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1B;
  v8 = v6 - 27;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDUsage.ArcadeUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 26 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 26) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE5)
    return ((uint64_t (*)(void))((char *)&loc_239216E80 + 4 * byte_2392332E9[v4]))();
  *a1 = a2 + 26;
  return ((uint64_t (*)(void))((char *)sub_239216EB4 + 4 * byte_2392332E4[v4]))();
}

uint64_t sub_239216EB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216EBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239216EC4);
  return result;
}

uint64_t sub_239216ED0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239216ED8);
  *(_BYTE *)result = a2 + 26;
  return result;
}

uint64_t sub_239216EDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239216EE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.ArcadeUsage()
{
  return &type metadata for HIDUsage.ArcadeUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.FIDOAllianceUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.FIDOAllianceUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_239216FDC + 4 * byte_2392332F3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_239217010 + 4 * byte_2392332EE[v4]))();
}

uint64_t sub_239217010(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_239217018(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239217020);
  return result;
}

uint64_t sub_23921702C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x239217034);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_239217038(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_239217040(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.FIDOAllianceUsage()
{
  return &type metadata for HIDUsage.FIDOAllianceUsage;
}

uint64_t HIDReportID.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t HIDReportID.rawValue.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*HIDReportID.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t HIDReportID.init(rawValue:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  a2[1] = result == 0;
  return result;
}

BOOL static HIDReportID.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

void *sub_2392170C4()
{
  return &unk_2392388BB;
}

void static HIDReportID.allReports.getter(_WORD *a1@<X8>)
{
  *a1 = -255;
}

_BYTE *sub_2392170DC@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  BOOL v2;

  v2 = *result == 0;
  *a2 = *result;
  a2[1] = v2;
  return result;
}

void sub_2392170F4(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

BOOL sub_239217100(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_239217114(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_239217128(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_23921713C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_239217150()
{
  sub_23922CE38();
  sub_23922CE50();
  return sub_23922CE74();
}

uint64_t sub_239217194()
{
  return sub_23922CE50();
}

uint64_t sub_2392171BC()
{
  sub_23922CE38();
  sub_23922CE50();
  return sub_23922CE74();
}

unint64_t HIDReportID.description.getter()
{
  sub_23922CC4C();
  swift_bridgeObjectRelease();
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  return 0xD000000000000014;
}

uint64_t sub_23921729C()
{
  sub_23922CC4C();
  sub_23922CA9C();
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  return 0;
}

BOOL static HIDReportType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HIDReportType.hash(into:)()
{
  return sub_23922CE44();
}

uint64_t sub_239217388@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = (_DWORD)result == 1;
  if ((_DWORD)result == 2)
    v2 = 2;
  *a2 = v2;
  return result;
}

uint64_t sub_2392173A8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  __int128 v6;

  if (!a2)
  {
    v6 = xmmword_23922DCB0;
LABEL_11:
    *(_OWORD *)a3 = v6;
    return result;
  }
  v5 = result;
  if (result == 4346709 && a2 == 0xE300000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return result;
  }
  if (v5 == 0x746F6F7465756C42 && a2 == 0xE900000000000068 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_239238820;
    goto LABEL_11;
  }
  if (v5 == 0xD000000000000012 && a2 == 0x800000023923A300 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_239238810;
    goto LABEL_11;
  }
  if (v5 == 0x504341412D5442 && a2 == 0xE700000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_239238800;
    goto LABEL_11;
  }
  if (v5 == 4475201 && a2 == 0xE300000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_2392387F0;
    goto LABEL_11;
  }
  if (v5 == 4403785 && a2 == 0xE300000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_2392387E0;
    goto LABEL_11;
  }
  if (v5 == 4804691 && a2 == 0xE300000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_2392387D0;
    goto LABEL_11;
  }
  if (v5 == 0x6C6169726553 && a2 == 0xE600000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_2392387C0;
    goto LABEL_11;
  }
  if (v5 == 5259625 && a2 == 0xE300000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_2392387B0;
    goto LABEL_11;
  }
  if (v5 == 0x79616C50726941 && a2 == 0xE700000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_2392387A0;
    goto LABEL_11;
  }
  if (v5 == 5591123 && a2 == 0xE300000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_239238790;
    goto LABEL_11;
  }
  if (v5 == 1330006342 && a2 == 0xE400000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_239238780;
    goto LABEL_11;
  }
  if (v5 == 0x6C617574726956 && a2 == 0xE700000000000000 || (result = sub_23922CDCC(), (result & 1) != 0))
  {
    v6 = xmmword_239238770;
    goto LABEL_11;
  }
  *(_QWORD *)a3 = v5;
  *(_QWORD *)(a3 + 8) = a2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_239217800(uint64_t *a1)
{
  unint64_t v1;

  v1 = 0;
  switch(a1[1])
  {
    case 0:
      v1 = 4346709;
      break;
    case 1:
      v1 = 0x746F6F7465756C42;
      break;
    case 2:
      v1 = 0xD000000000000012;
      break;
    case 3:
      v1 = 0x504341412D5442;
      break;
    case 4:
      v1 = 4475201;
      break;
    case 5:
      v1 = 4403785;
      break;
    case 6:
      v1 = 4804691;
      break;
    case 7:
      v1 = 0x6C6169726553;
      break;
    case 8:
      v1 = 5259625;
      break;
    case 9:
      v1 = 0x79616C50726941;
      break;
    case 10:
      v1 = 5591123;
      break;
    case 11:
      v1 = 1330006342;
      break;
    case 12:
      v1 = 0x6C617574726956;
      break;
    case 13:
      return v1;
    default:
      v1 = *a1;
      sub_2391F2740(*a1, 0);
      break;
  }
  return v1;
}

uint64_t sub_239217964@<X0>(uint64_t result@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  char v3;

  if ((unint64_t)(result - 1) <= 0x22)
    v3 = result;
  else
    v3 = 0;
  if ((a2 & 1) != 0)
    v3 = 0;
  *a3 = v3;
  return result;
}

uint64_t sub_239217980(unsigned __int8 *a1)
{
  if (*a1 == 36)
    return 0;
  else
    return *a1;
}

uint64_t HIDDeviceError.errorDescription.getter()
{
  unsigned int *v0;

  if (*((_BYTE *)v0 + 4) == 1)
    return ((uint64_t (*)(unint64_t, unint64_t))((char *)&loc_2392179D4 + 4
                                                                                                * byte_23923883E[*v0]))(0xD000000000000047, 0x800000023923A690);
  else
    return 0xD000000000000059;
}

void sub_2392179FC()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A0C()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A1C()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A2C()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A3C()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A4C()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A5C()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A6C()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A78()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A88()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217A98()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217AA8()
{
  JUMPOUT(0x2392179F0);
}

void sub_239217AB8()
{
  JUMPOUT(0x2392179F0);
}

void *sub_239217AF0()
{
  return &unk_2392388C0;
}

void *sub_239217AFC()
{
  return &unk_2392388C4;
}

void *sub_239217B08()
{
  return &unk_2392388C8;
}

void *sub_239217B14()
{
  return &unk_2392388CC;
}

void *sub_239217B20()
{
  return &unk_2392388D0;
}

void *sub_239217B2C()
{
  return &unk_2392388D4;
}

void *sub_239217B38()
{
  return &unk_2392388D8;
}

void *sub_239217B44()
{
  return &unk_2392388DC;
}

void *sub_239217B50()
{
  return &unk_2392388E0;
}

void *sub_239217B5C()
{
  return &unk_2392388E4;
}

void *sub_239217B68()
{
  return &unk_2392388E8;
}

void *sub_239217B74()
{
  return &unk_2392388EC;
}

void *sub_239217B80()
{
  return &unk_2392388F0;
}

void *sub_239217B8C()
{
  return &unk_2392388F4;
}

void *sub_239217B98()
{
  return &unk_2392388F8;
}

void *sub_239217BA4()
{
  return &unk_2392388FC;
}

void *sub_239217BB0()
{
  return &unk_239238900;
}

uint64_t sub_239217BBC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  switch(result)
  {
    case 0xE00002BE:
      v2 = 0;
      v3 = 0x100000000;
      break;
    case 0xE00002BF:
    case 0xE00002C0:
    case 0xE00002C3:
    case 0xE00002C4:
    case 0xE00002C6:
    case 0xE00002C8:
    case 0xE00002C9:
    case 0xE00002CB:
    case 0xE00002CC:
    case 0xE00002CD:
    case 0xE00002CE:
    case 0xE00002CF:
    case 0xE00002D0:
    case 0xE00002D1:
    case 0xE00002D2:
    case 0xE00002D3:
    case 0xE00002D4:
    case 0xE00002D7:
    case 0xE00002D9:
    case 0xE00002DA:
    case 0xE00002DB:
    case 0xE00002DC:
    case 0xE00002DD:
    case 0xE00002DE:
    case 0xE00002DF:
    case 0xE00002E0:
    case 0xE00002E4:
    case 0xE00002E5:
    case 0xE00002E6:
    case 0xE00002E7:
    case 0xE00002E8:
    case 0xE00002EA:
    case 0xE00002EC:
      goto LABEL_5;
    case 0xE00002C1:
      v2 = 0;
      v3 = 0x100000001;
      break;
    case 0xE00002C2:
      v2 = 0;
      v3 = 0x100000002;
      break;
    case 0xE00002C5:
      v2 = 0;
      v3 = 0x100000003;
      break;
    case 0xE00002C7:
      v2 = 0;
      v3 = 0x100000004;
      break;
    case 0xE00002CA:
      v2 = 0;
      v3 = 0x100000005;
      break;
    case 0xE00002D5:
      v2 = 0;
      v3 = 0x100000006;
      break;
    case 0xE00002D6:
      v2 = 0;
      v4 = 5;
      goto LABEL_17;
    case 0xE00002D8:
      v2 = 0;
      v3 = 0x100000008;
      break;
    case 0xE00002E1:
      v2 = 0;
      v3 = 0x100000009;
      break;
    case 0xE00002E2:
      v2 = 0;
      v3 = 0x10000000ALL;
      break;
    case 0xE00002E3:
      v2 = 0;
      v4 = 9;
LABEL_17:
      v3 = v4 | 0x100000002;
      break;
    case 0xE00002E9:
      v2 = 0;
      v3 = 0x10000000CLL;
      break;
    case 0xE00002EB:
      v2 = 0;
      v3 = 0x10000000DLL;
      break;
    case 0xE00002ED:
      v2 = 0;
      v3 = 0x10000000ELL;
      break;
    default:
      if ((_DWORD)result)
      {
LABEL_5:
        v2 = 0;
        v3 = result;
      }
      else
      {
        v3 = 0;
        v2 = 1;
      }
      break;
  }
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = BYTE4(v3);
  *(_BYTE *)(a2 + 5) = v2;
  return result;
}

uint64_t sub_239217D28(void *a1)
{
  id v1;
  uint64_t result;
  unsigned int v3;
  char v4;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_25691FC10);
  if (!swift_dynamicCast())
    return 3758096385;
  result = v3;
  if ((v4 & 1) != 0)
    return dword_239238D7C[v3];
  return result;
}

uint64_t sub_239217D98()
{
  uint64_t result;

  result = swift_slowAlloc();
  qword_2569251F0 = result;
  return result;
}

uint64_t *sub_239217DBC()
{
  if (qword_256924120 != -1)
    swift_once();
  return &qword_2569251F0;
}

uint64_t sub_239217DFC()
{
  if (qword_256924120 != -1)
    swift_once();
  return qword_2569251F0;
}

unint64_t sub_239217E3C()
{
  unsigned int *v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t result;
  unint64_t v4;
  unint64_t v5;

  if (qword_256924120 != -1)
    swift_once();
  v0 = (unsigned int *)qword_2569251F0;
  mach_timebase_info((mach_timebase_info_t)qword_2569251F0);
  v2 = *v0;
  v1 = v0[1];
  result = sub_23922CE98();
  if (!is_mul_ok(result, 0x3B9ACA00uLL))
  {
    __break(1u);
    goto LABEL_10;
  }
  if (((result | v4) & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v5 = 1000000000 * result + v4 / 0x3B9ACA00;
  if (__CFADD__(1000000000 * result, v4 / 0x3B9ACA00))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!is_mul_ok(v5, v1))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((_DWORD)v2)
    return v5 * v1 / v2;
LABEL_13:
  __break(1u);
  return result;
}

unint64_t sub_239217EF8@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unsigned int *v4;
  unint64_t result;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;

  sub_23922CCAC();
  sub_23922CCC4();
  if (qword_256924120 != -1)
    swift_once();
  v4 = (unsigned int *)qword_2569251F0;
  result = mach_timebase_info((mach_timebase_info_t)qword_2569251F0);
  if (!is_mul_ok(a1, *v4))
  {
    __break(1u);
    goto LABEL_11;
  }
  v6 = v4[1];
  if (!(_DWORD)v6)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v7 = a1 * *v4 / v6;
  result = v7 / 0x3B9ACA00;
  v8 = v7 >= 1000000000 * (v7 / 0x3B9ACA00);
  v9 = v7 % 0x3B9ACA00;
  if (!v8)
    goto LABEL_12;
  if (!is_mul_ok(v9, 0x3B9ACA00uLL))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (((1000000000 * v9) & 0x8000000000000000) == 0)
  {
    result = sub_23922CEA4();
    *a2 = result;
    a2[1] = v10;
    return result;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_239217FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_239217FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

unint64_t sub_239218014(unint64_t result)
{
  if (HIDWORD(result))
    __break(1u);
  return result;
}

uint64_t _s7CoreHID18HIDDeviceTransportO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
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
        goto LABEL_34;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_34;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_34;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_34;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_34;
      v6 = 1;
      v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5)
        goto LABEL_34;
      v6 = 1;
      v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6)
        goto LABEL_34;
      v6 = 1;
      v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7)
        goto LABEL_34;
      v6 = 1;
      v3 = 7;
      break;
    case 8uLL:
      if (v5 != 8)
        goto LABEL_34;
      v6 = 1;
      v3 = 8;
      break;
    case 9uLL:
      if (v5 != 9)
        goto LABEL_34;
      v6 = 1;
      v3 = 9;
      break;
    case 0xAuLL:
      if (v5 != 10)
        goto LABEL_34;
      v6 = 1;
      v3 = 10;
      break;
    case 0xBuLL:
      if (v5 != 11)
        goto LABEL_34;
      v6 = 1;
      v3 = 11;
      break;
    case 0xCuLL:
      if (v5 != 12)
        goto LABEL_34;
      v6 = 1;
      v3 = 12;
      break;
    default:
      if (v5 < 0xD)
      {
LABEL_34:
        v6 = 0;
      }
      else if (v2 == v4 && v3 == v5)
      {
        v6 = 1;
      }
      else
      {
        v6 = sub_23922CDCC();
      }
      sub_2391F2740(v4, v5);
      sub_2391F2740(v2, v3);
      break;
  }
  sub_2391F2BB8(v2, v3);
  sub_2391F2BB8(v4, v5);
  return v6 & 1;
}

uint64_t _s7CoreHID14HIDDeviceErrorO2eeoiySbAC_ACtFZ_0(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*((_BYTE *)a1 + 4) == 1)
    return ((uint64_t (*)(void))((char *)&loc_239218218 + 4 * byte_23923888A[v2]))();
  if ((*(_BYTE *)(a2 + 4) & 1) != 0)
    return 0;
  return (_DWORD)v2 == *(_DWORD *)a2;
}

uint64_t sub_239218244@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 1)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_239218258@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 2)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_23921826C@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 3)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_239218280@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 4)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_239218294@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 5)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_2392182A8@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 6)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_2392182BC@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 7)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_2392182D0@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 9)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_2392182E4@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 10)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_2392182F8@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 11)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_23921830C@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 12)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_239218320@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 13)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_239218334@<X0>(char a1@<W8>)
{
  unsigned int v1;

  if (v1 <= 0xD)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

uint64_t sub_239218348@<X0>(char a1@<W8>)
{
  int v1;

  if (v1 != 8)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x239218230);
  return 1;
}

unint64_t sub_239218360()
{
  unint64_t result;

  result = qword_25691FDB0;
  if (!qword_25691FDB0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDReportID, &type metadata for HIDReportID);
    atomic_store(result, (unint64_t *)&qword_25691FDB0);
  }
  return result;
}

unint64_t sub_2392183A8()
{
  unint64_t result;

  result = qword_25691FDB8;
  if (!qword_25691FDB8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDReportType, &type metadata for HIDReportType);
    atomic_store(result, (unint64_t *)&qword_25691FDB8);
  }
  return result;
}

unint64_t sub_2392183F0()
{
  unint64_t result;

  result = qword_25691FDC0;
  if (!qword_25691FDC0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDDeviceLocalizationCode, &type metadata for HIDDeviceLocalizationCode);
    atomic_store(result, (unint64_t *)&qword_25691FDC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDReportID()
{
  return &type metadata for HIDReportID;
}

uint64_t storeEnumTagSinglePayload for HIDReportType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_239218494 + 4 * byte_23923889E[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2392184C8 + 4 * byte_239238899[v4]))();
}

uint64_t sub_2392184C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392184D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2392184D8);
  return result;
}

uint64_t sub_2392184E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2392184ECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2392184F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392184F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDReportType()
{
  return &type metadata for HIDReportType;
}

unint64_t destroy for HIDDeviceTransport(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s7CoreHID18HIDDeviceTransportOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for HIDDeviceTransport(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for HIDDeviceTransport(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for HIDDeviceTransport(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483635);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 12;
  if (v4 >= 0xE)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HIDDeviceTransport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF3)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483635;
    if (a3 >= 0x7FFFFFF3)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF3)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 12;
  }
  return result;
}

uint64_t sub_23921872C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_239218744(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for HIDDeviceTransport()
{
  return &type metadata for HIDDeviceTransport;
}

uint64_t getEnumTagSinglePayload for HIDDeviceLocalizationCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDD)
    goto LABEL_17;
  if (a2 + 35 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 35) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 35;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 35;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 35;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x24;
  v8 = v6 - 36;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceLocalizationCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 35 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 35) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDC)
    return ((uint64_t (*)(void))((char *)&loc_239218850 + 4 * byte_2392388A8[v4]))();
  *a1 = a2 + 35;
  return ((uint64_t (*)(void))((char *)sub_239218884 + 4 * byte_2392388A3[v4]))();
}

uint64_t sub_239218884(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23921888C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x239218894);
  return result;
}

uint64_t sub_2392188A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2392188A8);
  *(_BYTE *)result = a2 + 35;
  return result;
}

uint64_t sub_2392188AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2392188B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceLocalizationCode()
{
  return &type metadata for HIDDeviceLocalizationCode;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDDeviceError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HIDDeviceError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_239218930(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23921894C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceError()
{
  return &type metadata for HIDDeviceError;
}

uint64_t sub_23921897C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_239218984()
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

uint64_t *sub_2392189F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_239218A60(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_239218A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_239218AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_239218AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_239218B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_239218B30(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_239218BE0 + 4 * byte_2392388AD[(v7 - 1)]))();
}

void sub_239218C30(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    v11 = 0;
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

uint64_t type metadata accessor for IOHIDObjectWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IOHIDObjectWrapper);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B839750](a1, v6, a5);
}

uint64_t HIDDeviceClient.DeviceReference.deviceID.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_239218E2C@<X0>(io_registry_entry_t a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  result = IORegistryEntryGetRegistryEntryID(a1, v5);
  if ((_DWORD)result)
    v4 = 0;
  else
    v4 = v5[0];
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = (_DWORD)result != 0;
  return result;
}

uint64_t HIDDeviceClient.DeviceReference.hash(into:)()
{
  return sub_23922CE68();
}

BOOL static HIDDeviceClient.DeviceReference.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t HIDDeviceClient.DeviceReference.hashValue.getter()
{
  sub_23922CE38();
  sub_23922CE68();
  return sub_23922CE74();
}

uint64_t sub_239218F28()
{
  sub_23922CE38();
  sub_23922CE68();
  return sub_23922CE74();
}

uint64_t sub_239218F6C()
{
  return sub_23922CE68();
}

uint64_t sub_239218F94()
{
  sub_23922CE38();
  sub_23922CE68();
  return sub_23922CE74();
}

BOOL sub_239218FD4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void HIDDeviceClient.deviceReference.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 112);
}

uint64_t sub_239218FF4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 320))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_239219024(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 120);
  v6 = *(_QWORD *)(*a2 + 128);
  *(_QWORD *)(v4 + 120) = *a1;
  *(_QWORD *)(v4 + 128) = v3;
  sub_2391F0C34(v2, v3);
  return sub_239219144(v5, v6);
}

_QWORD *sub_239219060()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v9[2];

  v1 = v0[15];
  v2 = v0[16];
  v3 = v1;
  if (v2 >> 60 != 15)
    goto LABEL_4;
  result = (*(_QWORD *(**)(_QWORD *__return_ptr, unint64_t, unint64_t))(*v0 + 848))(v9, 0xD000000000000010, 0x8000000239239E50);
  if (v9[0])
  {
    v9[1] = v9[0];
    swift_dynamicCast();
    v3 = v7;
    v5 = v0[15];
    v6 = v0[16];
    v0[15] = v7;
    v0[16] = v8;
    sub_2391F0C34(v7, v8);
    sub_239219144(v5, v6);
LABEL_4:
    sub_239219158(v1, v2);
    return (_QWORD *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_239219144(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2391F0C78(a1, a2);
  return a1;
}

uint64_t sub_239219158(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2391F0C34(a1, a2);
  return a1;
}

uint64_t sub_23921916C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(v2 + 120);
  v4 = *(_QWORD *)(v2 + 128);
  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return sub_239219144(v3, v4);
}

uint64_t sub_239219180()
{
  return 0;
}

void HIDDeviceClient.primaryUsage.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(v1 + 136);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 140);
  *(_DWORD *)a1 = v2;
}

uint64_t sub_2392191A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 344))();
  *a2 = result;
  return result;
}

uint64_t sub_2392191D0(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 144) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_239219200()
{
  _QWORD *v0;
  unint64_t v1;
  _QWORD *v2;
  unint64_t result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (v0[18])
  {
    v1 = v0[18];
LABEL_20:
    swift_bridgeObjectRetain();
    return v1;
  }
  v2 = v0;
  result = (unint64_t)(*(_QWORD *(**)(uint64_t *__return_ptr, unint64_t, unint64_t))(*v0 + 848))(&v19, 0xD000000000000010, 0x800000023923A140);
  if (v19)
  {
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256920660);
    result = swift_dynamicCast();
    v4 = *(_QWORD *)(v18 + 16);
    if (!v4)
    {
      v1 = MEMORY[0x24BEE4AF8];
LABEL_19:
      swift_bridgeObjectRelease();
      v2[18] = v1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v5 = (uint64_t *)(v18 + 32);
    v1 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v6 = *v5;
      if (!*(_QWORD *)(*v5 + 16))
        break;
      swift_bridgeObjectRetain();
      result = sub_2391F5EC4(0x7355656369766544, 0xEF65676150656761);
      if ((v7 & 1) == 0)
        goto LABEL_22;
      v8 = *(unsigned __int16 *)(*(_QWORD *)(v6 + 56) + 2 * result);
      if (*(_QWORD *)(v6 + 16) && (v9 = sub_2391F5EC4(0x7355656369766544, 0xEB00000000656761), (v10 & 1) != 0))
      {
        v11 = 0;
        v12 = *(unsigned __int16 *)(*(_QWORD *)(v6 + 56) + 2 * v9);
      }
      else
      {
        v12 = 0;
        v11 = 1;
      }
      swift_bridgeObjectRelease();
      HIDUsage.init(page:usage:)(v12 | (v11 << 16), v8, (uint64_t)&v20);
      v13 = BYTE4(v20);
      v14 = v20;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (unint64_t)sub_23922757C(0, *(_QWORD *)(v1 + 16) + 1, 1, (char *)v1);
        v1 = result;
      }
      v16 = *(_QWORD *)(v1 + 16);
      v15 = *(_QWORD *)(v1 + 24);
      if (v16 >= v15 >> 1)
      {
        result = (unint64_t)sub_23922757C((char *)(v15 > 1), v16 + 1, 1, (char *)v1);
        v1 = result;
      }
      *(_QWORD *)(v1 + 16) = v16 + 1;
      v17 = v1 + 6 * v16;
      *(_BYTE *)(v17 + 36) = (v14 | (unint64_t)(v13 << 32)) >> 32;
      *(_DWORD *)(v17 + 32) = v14;
      ++v5;
      if (!--v4)
        goto LABEL_19;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23921943C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 144) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t HIDDeviceClient.vendorID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 152);
}

uint64_t HIDDeviceClient.productID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 156);
}

double sub_23921945C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)a1 + 368))(&v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_23921949C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 160);
  v6 = *(_QWORD *)(*a2 + 168);
  *(_QWORD *)(v4 + 160) = *a1;
  *(_QWORD *)(v4 + 168) = v3;
  sub_2391F2730(v2, v3);
  return sub_2392195E4(v5, v6);
}

uint64_t sub_2392194D8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v3 = v1[20];
  v4 = v1[21];
  v5 = v3;
  v6 = v4;
  if (v4 == 14)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*v1 + 848))(&v14, 0x726F70736E617254, 0xE900000000000074);
    if (v14)
    {
      v16 = v14;
      v7 = swift_dynamicCast();
      v8 = v7 == 0;
      if (v7)
        v9 = v14;
      else
        v9 = 0;
      if (v8)
        v10 = 0;
      else
        v10 = v15;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    sub_2392173A8(v9, v10, (uint64_t)&v14);
    swift_bridgeObjectRelease();
    v5 = v14;
    v6 = v15;
    v11 = v1[20];
    v12 = v1[21];
    v1[20] = v14;
    v1[21] = v6;
    sub_2391F2730(v5, v6);
    sub_2392195E4(v11, v12);
  }
  *a1 = v5;
  a1[1] = v6;
  return sub_2392195F4(v3, v4);
}

uint64_t sub_2392195E4(uint64_t a1, unint64_t a2)
{
  if (a2 != 14)
    return sub_2391F2BA8(a1, a2);
  return a1;
}

uint64_t sub_2392195F4(uint64_t a1, unint64_t a2)
{
  if (a2 != 14)
    return sub_2391F2730(a1, a2);
  return a1;
}

uint64_t sub_239219604(_OWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 160);
  v2 = *(_QWORD *)(v1 + 168);
  *(_OWORD *)(v1 + 160) = *a1;
  return sub_2392195E4(v3, v2);
}

double sub_239219618@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = xmmword_239238DC0;
  return result;
}

uint64_t sub_239219628@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 392))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_239219658(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 176);
  v6 = *(_QWORD *)(*a2 + 184);
  *(_QWORD *)(v4 + 176) = v3;
  *(_QWORD *)(v4 + 184) = v2;
  swift_bridgeObjectRetain();
  return sub_239219778(v5, v6);
}

uint64_t sub_23921968C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];

  v1 = v0[22];
  v2 = v0[23];
  v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(_QWORD *__return_ptr, uint64_t, unint64_t))(*v0 + 848))(v9, 0x746375646F7250, 0xE700000000000000);
    if (v9[0])
    {
      v9[2] = v9[0];
      v4 = swift_dynamicCast();
      if (v4)
        v3 = v9[0];
      else
        v3 = 0;
      if (v4)
        v5 = v9[1];
      else
        v5 = 0;
    }
    else
    {
      v3 = 0;
      v5 = 0;
    }
    v6 = v0[22];
    v7 = v0[23];
    v0[22] = v3;
    v0[23] = v5;
    swift_bridgeObjectRetain();
    sub_239219778(v6, v7);
  }
  sub_23921978C(v1, v2);
  return v3;
}

uint64_t sub_239219778(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23921978C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2392197A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 176);
  v4 = *(_QWORD *)(v2 + 184);
  *(_QWORD *)(v2 + 176) = a1;
  *(_QWORD *)(v2 + 184) = a2;
  return sub_239219778(v3, v4);
}

uint64_t sub_2392197B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 416))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2392197E4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 192);
  v6 = *(_QWORD *)(*a2 + 200);
  *(_QWORD *)(v4 + 192) = v3;
  *(_QWORD *)(v4 + 200) = v2;
  swift_bridgeObjectRetain();
  return sub_239219778(v5, v6);
}

uint64_t sub_239219818()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];

  v1 = v0[24];
  v2 = v0[25];
  v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(_QWORD *__return_ptr, uint64_t, unint64_t))(*v0 + 848))(v9, 0x74636166756E614DLL, 0xEC00000072657275);
    if (v9[0])
    {
      v9[2] = v9[0];
      v4 = swift_dynamicCast();
      if (v4)
        v3 = v9[0];
      else
        v3 = 0;
      if (v4)
        v5 = v9[1];
      else
        v5 = 0;
    }
    else
    {
      v3 = 0;
      v5 = 0;
    }
    v6 = v0[24];
    v7 = v0[25];
    v0[24] = v3;
    v0[25] = v5;
    swift_bridgeObjectRetain();
    sub_239219778(v6, v7);
  }
  sub_23921978C(v1, v2);
  return v3;
}

uint64_t sub_23921990C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 192);
  v4 = *(_QWORD *)(v2 + 200);
  *(_QWORD *)(v2 + 192) = a1;
  *(_QWORD *)(v2 + 200) = a2;
  return sub_239219778(v3, v4);
}

uint64_t sub_239219920@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 440))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_239219950(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 208);
  v6 = *(_QWORD *)(*a2 + 216);
  *(_QWORD *)(v4 + 208) = v3;
  *(_QWORD *)(v4 + 216) = v2;
  swift_bridgeObjectRetain();
  return sub_239219778(v5, v6);
}

uint64_t sub_239219984()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];

  v1 = v0[26];
  v2 = v0[27];
  v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(_QWORD *__return_ptr, uint64_t, unint64_t))(*v0 + 848))(v9, 0x6D754E6C65646F4DLL, 0xEB00000000726562);
    if (v9[0])
    {
      v9[2] = v9[0];
      v4 = swift_dynamicCast();
      if (v4)
        v3 = v9[0];
      else
        v3 = 0;
      if (v4)
        v5 = v9[1];
      else
        v5 = 0;
    }
    else
    {
      v3 = 0;
      v5 = 0;
    }
    v6 = v0[26];
    v7 = v0[27];
    v0[26] = v3;
    v0[27] = v5;
    swift_bridgeObjectRetain();
    sub_239219778(v6, v7);
  }
  sub_23921978C(v1, v2);
  return v3;
}

uint64_t sub_239219A78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 208);
  v4 = *(_QWORD *)(v2 + 216);
  *(_QWORD *)(v2 + 208) = a1;
  *(_QWORD *)(v2 + 216) = a2;
  return sub_239219778(v3, v4);
}

uint64_t sub_239219A8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 464))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_239219AC4(uint64_t result, uint64_t *a2)
{
  unsigned __int8 v2;
  uint64_t v3;

  v2 = *(_BYTE *)(result + 8);
  v3 = *a2;
  *(_QWORD *)(v3 + 224) = *(_QWORD *)result;
  *(_WORD *)(v3 + 232) = v2;
  return result;
}

uint64_t sub_239219AE0()
{
  uint64_t v0;
  int v1;
  uint64_t result;
  char v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)(v0 + 233) & 1) == 0)
    return *(_QWORD *)(v0 + 224);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v0 + 848))(&v5, 0x4E6E6F6973726556, 0xED00007265626D75);
  if (v5)
  {
    v1 = swift_dynamicCast();
    if (v1)
      result = v4;
    else
      result = 0;
    v3 = v1 ^ 1;
  }
  else
  {
    result = 0;
    v3 = 1;
  }
  *(_QWORD *)(v0 + 224) = result;
  *(_BYTE *)(v0 + 232) = v3;
  *(_BYTE *)(v0 + 233) = 0;
  return result;
}

uint64_t sub_239219B9C(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 224) = result;
  *(_BYTE *)(v2 + 232) = a2 & 1;
  *(_BYTE *)(v2 + 233) = 0;
  return result;
}

uint64_t sub_239219BB0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 488))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_239219BE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 240);
  v6 = *(_QWORD *)(*a2 + 248);
  *(_QWORD *)(v4 + 240) = v3;
  *(_QWORD *)(v4 + 248) = v2;
  swift_bridgeObjectRetain();
  return sub_239219778(v5, v6);
}

uint64_t sub_239219C14()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];

  v1 = v0[30];
  v2 = v0[31];
  v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(_QWORD *__return_ptr, uint64_t, unint64_t))(*v0 + 848))(v9, 0x754E6C6169726553, 0xEC0000007265626DLL);
    if (v9[0])
    {
      v9[2] = v9[0];
      v4 = swift_dynamicCast();
      if (v4)
        v3 = v9[0];
      else
        v3 = 0;
      if (v4)
        v5 = v9[1];
      else
        v5 = 0;
    }
    else
    {
      v3 = 0;
      v5 = 0;
    }
    v6 = v0[30];
    v7 = v0[31];
    v0[30] = v3;
    v0[31] = v5;
    swift_bridgeObjectRetain();
    sub_239219778(v6, v7);
  }
  sub_23921978C(v1, v2);
  return v3;
}

uint64_t sub_239219D08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 240);
  v4 = *(_QWORD *)(v2 + 248);
  *(_QWORD *)(v2 + 240) = a1;
  *(_QWORD *)(v2 + 248) = a2;
  return sub_239219778(v3, v4);
}

uint64_t sub_239219D1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 512))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_239219D4C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 256);
  v6 = *(_QWORD *)(*a2 + 264);
  *(_QWORD *)(v4 + 256) = v3;
  *(_QWORD *)(v4 + 264) = v2;
  swift_bridgeObjectRetain();
  return sub_239219778(v5, v6);
}

uint64_t sub_239219D80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];

  v1 = v0[32];
  v2 = v0[33];
  v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(_QWORD *__return_ptr, unint64_t, unint64_t))(*v0 + 848))(v9, 0xD000000000000016, 0x8000000239239E70);
    if (v9[0])
    {
      v9[2] = v9[0];
      v4 = swift_dynamicCast();
      if (v4)
        v3 = v9[0];
      else
        v3 = 0;
      if (v4)
        v5 = v9[1];
      else
        v5 = 0;
    }
    else
    {
      v3 = 0;
      v5 = 0;
    }
    v6 = v0[32];
    v7 = v0[33];
    v0[32] = v3;
    v0[33] = v5;
    swift_bridgeObjectRetain();
    sub_239219778(v6, v7);
  }
  sub_23921978C(v1, v2);
  return v3;
}

uint64_t sub_239219E70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 256);
  v4 = *(_QWORD *)(v2 + 264);
  *(_QWORD *)(v2 + 256) = a1;
  *(_QWORD *)(v2 + 264) = a2;
  return sub_239219778(v3, v4);
}

uint64_t sub_239219E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 536))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_239219EBC(uint64_t result, uint64_t *a2)
{
  unsigned __int8 v2;
  uint64_t v3;

  v2 = *(_BYTE *)(result + 8);
  v3 = *a2;
  *(_QWORD *)(v3 + 272) = *(_QWORD *)result;
  *(_WORD *)(v3 + 280) = v2;
  return result;
}

uint64_t sub_239219ED8()
{
  uint64_t v0;
  int v1;
  uint64_t result;
  char v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)(v0 + 281) & 1) == 0)
    return *(_QWORD *)(v0 + 272);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v0 + 848))(&v5, 0x6E6F697461636F4CLL, 0xEA00000000004449);
  if (v5)
  {
    v1 = swift_dynamicCast();
    if (v1)
      result = v4;
    else
      result = 0;
    v3 = v1 ^ 1;
  }
  else
  {
    result = 0;
    v3 = 1;
  }
  *(_QWORD *)(v0 + 272) = result;
  *(_BYTE *)(v0 + 280) = v3;
  *(_BYTE *)(v0 + 281) = 0;
  return result;
}

uint64_t sub_239219F98(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 272) = result;
  *(_BYTE *)(v2 + 280) = a2 & 1;
  *(_BYTE *)(v2 + 281) = 0;
  return result;
}

uint64_t sub_239219FAC()
{
  return 0;
}

_QWORD *sub_239219FC0@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 560))(&v4);
  *a2 = v4;
  return result;
}

_BYTE *sub_23921A000(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 282) = *result;
  return result;
}

void sub_23921A010(_BYTE *a1@<X8>)
{
  unsigned __int8 *v1;
  int v3;
  int v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v3 = v1[282];
  if (v3 == 36)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v1 + 848))(&v8, 0x437972746E756F43, 0xEB0000000065646FLL);
    if (v8)
    {
      v4 = swift_dynamicCast();
      if (v4)
        v5 = v7;
      else
        v5 = 0;
      v6 = v4 ^ 1;
    }
    else
    {
      v5 = 0;
      v6 = 1;
    }
    sub_239217964(v5, v6, &v8);
    LOBYTE(v3) = v8;
    v1[282] = v8;
  }
  *a1 = v3;
}

_BYTE *sub_23921A0D0(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 282) = *result;
  return result;
}

uint64_t sub_23921A0DC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 584))();
  *a2 = result & 1;
  return result;
}

_BYTE *sub_23921A110(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 283) = *result;
  return result;
}

uint64_t sub_23921A120()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t result;
  unsigned __int8 v3;
  uint64_t v4;

  v1 = v0[283];
  if (v1 != 2)
    return v1 & 1;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v0 + 848))(&v4, 0x6E492D746C697542, 0xE800000000000000);
  if (v4 && (swift_dynamicCast() & 1) != 0)
    result = v3;
  else
    result = 0;
  v0[283] = result;
  return result;
}

uint64_t sub_23921A1B4(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 283) = result;
  return result;
}

uint64_t sub_23921A1BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 608))();
  *a2 = result;
  return result;
}

uint64_t sub_23921A1EC(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 288) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

CFIndex sub_23921A21C()
{
  uint64_t v0;
  char *v1;
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex result;
  CFIndex v5;
  CFIndex v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _BYTE v18[128];
  _OWORD v19[6];
  _BYTE v20[25];

  if (*(_QWORD *)(v0 + 288))
  {
    v1 = *(char **)(v0 + 288);
LABEL_24:
    swift_bridgeObjectRetain();
    return (CFIndex)v1;
  }
  v2 = IOHIDDeviceCopyMatchingElements(*(IOHIDDeviceRef *)(v0 + 296), 0, 0);
  if (!v2)
    goto LABEL_22;
  v3 = v2;
  result = CFArrayGetCount(v2);
  if ((result & 0x8000000000000000) == 0)
  {
    v5 = result;
    if (result)
    {
      result = (CFIndex)CFArrayGetValueAtIndex(v3, 0);
      if (result)
      {
        v1 = (char *)MEMORY[0x24BEE4AF8];
        v6 = 1;
        while (1)
        {
          v7 = (id)result;
          swift_retain();
          sub_2391EB5D0(v7, v0, (uint64_t)v17);
          sub_23922C2C0((uint64_t)v17, (uint64_t)v18);
          sub_23922C2C0((uint64_t)v18, (uint64_t)v19);
          if (sub_2391F0098((uint64_t)v19) == 1)
          {

            if (v5 == v6)
              goto LABEL_20;
          }
          else
          {
            if ((v20[8] & 1) == 0)
            {
              sub_23922C2C0((uint64_t)v18, (uint64_t)v17);
              sub_2391F00B0((uint64_t)v17);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v1 = sub_2391F00E0(0, *((_QWORD *)v1 + 2) + 1, 1, v1);
              v9 = *((_QWORD *)v1 + 2);
              v8 = *((_QWORD *)v1 + 3);
              if (v9 >= v8 >> 1)
                v1 = sub_2391F00E0((char *)(v8 > 1), v9 + 1, 1, v1);
              *((_QWORD *)v1 + 2) = v9 + 1;
              v10 = &v1[128 * v9];
              v11 = v19[0];
              v12 = v19[1];
              v13 = v19[3];
              *((_OWORD *)v10 + 4) = v19[2];
              *((_OWORD *)v10 + 5) = v13;
              *((_OWORD *)v10 + 2) = v11;
              *((_OWORD *)v10 + 3) = v12;
              v14 = v19[4];
              v15 = v19[5];
              v16 = *(_OWORD *)v20;
              *(_OWORD *)(v10 + 137) = *(_OWORD *)&v20[9];
              *((_OWORD *)v10 + 7) = v15;
              *((_OWORD *)v10 + 8) = v16;
              *((_OWORD *)v10 + 6) = v14;
            }

            sub_2391F01E0((uint64_t)v18);
            if (v5 == v6)
            {
LABEL_20:

              goto LABEL_23;
            }
          }
          result = (CFIndex)CFArrayGetValueAtIndex(v3, v6++);
          if (!result)
            goto LABEL_26;
        }
      }
      goto LABEL_26;
    }

LABEL_22:
    v1 = (char *)MEMORY[0x24BEE4AF8];
LABEL_23:
    *(_QWORD *)(v0 + 288) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23921A428(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 288) = a1;
  return swift_bridgeObjectRelease();
}

id sub_23921A438()
{
  uint64_t v0;

  return *(id *)(v0 + 296);
}

id sub_23921A440()
{
  uint64_t v0;

  return *(id *)(v0 + 304);
}

uint64_t sub_23921A448()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 328);
}

uint64_t sub_23921A450()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 336);
}

uint64_t sub_23921A458()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 344);
}

uint64_t sub_23921A488(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 344) = a1;
  return result;
}

uint64_t (*sub_23921A4C4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23921A500()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 352);
}

uint64_t sub_23921A530(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 352) = a1;
  return result;
}

uint64_t (*sub_23921A56C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23921A5A8()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 353);
}

uint64_t sub_23921A5D8(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 353) = a1;
  return result;
}

uint64_t (*sub_23921A614())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23921A650()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 354);
}

uint64_t sub_23921A680(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 354) = a1;
  return result;
}

uint64_t (*sub_23921A6BC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23921A6F8()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 355);
}

uint64_t sub_23921A728(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 355) = a1;
  return result;
}

uint64_t (*sub_23921A764())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23921A7A0()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23921A7AC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23921A7E0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 360) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23921A824())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23921A860()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 368);
}

void HIDDeviceClient.__allocating_init(deviceReference:)(uint64_t *a1)
{
  swift_allocObject();
  HIDDeviceClient.init(deviceReference:)(a1);
}

void HIDDeviceClient.init(deviceReference:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_port_t v10;
  uint64_t inited;
  const __CFDictionary *v12;
  io_service_t MatchingService;
  IOHIDDeviceRef v14;
  IOHIDDeviceRef v15;
  uint64_t v16;
  uint64_t v17;
  __IOHIDDevice *v18;
  void *v19;
  IONotificationPortRef v20;
  __IOHIDDevice *v21;
  __CFString *v22;
  CFTypeRef v23;
  uint64_t v24;
  __IOHIDDevice *v25;
  __CFString *v26;
  __IOHIDDevice *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  __IOHIDDevice *v32;
  __CFString *v33;
  CFTypeRef v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __IOHIDDevice *v38;
  __CFString *v39;
  CFTypeRef v40;
  __IOHIDDevice *v41;
  __CFString *v42;
  CFTypeRef v43;
  char v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];
  __IOHIDDevice *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  __int128 v58;
  unsigned __int16 v59;
  _QWORD v60[2];
  unsigned __int16 v61;
  IOHIDDeviceRef v62;

  v2 = v1;
  v4 = sub_23922CB74();
  v56 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v57 = (char *)v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23922CB98();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23922C9D0();
  MEMORY[0x24BDAC7A8](v7);
  v8 = *a1;
  swift_defaultActor_initialize();
  *(_OWORD *)(v1 + 120) = xmmword_239238DD0;
  *(_QWORD *)(v1 + 144) = 0;
  *(_OWORD *)(v1 + 160) = xmmword_239238DC0;
  *(_OWORD *)(v1 + 176) = xmmword_239238820;
  *(_OWORD *)(v1 + 192) = xmmword_239238820;
  *(_OWORD *)(v1 + 208) = xmmword_239238820;
  *(_QWORD *)(v1 + 224) = 0;
  *(_WORD *)(v1 + 232) = 256;
  *(_OWORD *)(v1 + 240) = xmmword_239238820;
  *(_OWORD *)(v1 + 256) = xmmword_239238820;
  *(_QWORD *)(v1 + 272) = 0;
  *(_DWORD *)(v1 + 280) = 35913984;
  *(_QWORD *)(v1 + 288) = 0;
  *(_QWORD *)(v1 + 344) = 0;
  *(_DWORD *)(v1 + 352) = 0;
  v9 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 360) = MEMORY[0x24BEE4AF8];
  v10 = *MEMORY[0x24BDD8B18];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDC8);
  inited = swift_initStackObject();
  v58 = xmmword_23922D6C0;
  *(_OWORD *)(inited + 16) = xmmword_23922D6C0;
  *(_QWORD *)(inited + 32) = 0xD000000000000011;
  *(_QWORD *)(inited + 40) = 0x800000023923A6E0;
  *(_QWORD *)(inited + 48) = v8;
  sub_23921B104(inited);
  v12 = (const __CFDictionary *)sub_23922CA00();
  swift_bridgeObjectRelease();
  MatchingService = IOServiceGetMatchingService(v10, v12);
  if (!MatchingService || (v14 = IOHIDDeviceCreate(0, MatchingService)) == 0)
  {
    sub_239219144(*(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128));
    swift_bridgeObjectRelease();
    sub_2392195E4(*(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 168));
    sub_239219778(*(_QWORD *)(v1 + 176), *(_QWORD *)(v1 + 184));
    sub_239219778(*(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 200));
    sub_239219778(*(_QWORD *)(v1 + 208), *(_QWORD *)(v1 + 216));
    sub_239219778(*(_QWORD *)(v1 + 240), *(_QWORD *)(v1 + 248));
    sub_239219778(*(_QWORD *)(v1 + 256), *(_QWORD *)(v1 + 264));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for HIDDeviceClient();
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    return;
  }
  v15 = v14;
  v55 = v4;
  v62 = v14;
  type metadata accessor for IOHIDDevice(0);
  v17 = v16;
  v18 = v15;
  sub_239217FFC((uint64_t)&v62, v17, (uint64_t)v60);
  v19 = (void *)v60[0];
  *(_QWORD *)(v1 + 296) = v60[0];
  *(_QWORD *)(v1 + 112) = v8;
  v20 = IONotificationPortCreate(v10);
  if (!v20)
  {
    __break(1u);
    goto LABEL_19;
  }
  v54 = v18;
  *(_QWORD *)(v1 + 368) = v20;
  v21 = v19;
  v22 = (__CFString *)sub_23922CA6C();
  v23 = (id)IOHIDDeviceGetProperty(v21, v22);

  if (!v23)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v60[0] = v23;
  swift_dynamicCast();
  v24 = v61;
  v25 = (__IOHIDDevice *)*(id *)(v1 + 296);
  v26 = (__CFString *)sub_23922CA6C();
  v27 = (id)IOHIDDeviceGetProperty(v25, v26);

  if (v27)
  {
    v62 = v27;
    v28 = swift_dynamicCast();
    v29 = v59;
    v30 = v28 ^ 1;
    if (!v28)
      v29 = 0;
  }
  else
  {
    v29 = 0;
    v30 = 1;
  }
  HIDUsage.init(page:usage:)(v29 | (v30 << 16), v24, (uint64_t)&v62);
  v31 = (int)v62;
  *(_BYTE *)(v1 + 140) = BYTE4(v62);
  *(_DWORD *)(v1 + 136) = v31;
  v32 = (__IOHIDDevice *)*(id *)(v1 + 296);
  v33 = (__CFString *)sub_23922CA6C();
  v34 = (id)IOHIDDeviceGetProperty(v32, v33);

  if (!v34)
    goto LABEL_20;
  v60[0] = v34;
  swift_dynamicCast();
  *(_DWORD *)(v1 + 152) = (_DWORD)v62;
  sub_2391F65D4();
  v53[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F6F8);
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = v58;
  v36 = *(_QWORD *)(v1 + 112);
  v37 = MEMORY[0x24BEE45B8];
  *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE4568];
  *(_QWORD *)(v35 + 64) = v37;
  *(_QWORD *)(v35 + 32) = v36;
  sub_23922CA78();
  sub_23922C9C4();
  v60[0] = v9;
  sub_2391F66EC(&qword_25691F760, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930], MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F768);
  sub_2391F6610();
  sub_23922CC28();
  (*(void (**)(char *, _QWORD, uint64_t))(v56 + 104))(v57, *MEMORY[0x24BEE5758], v55);
  *(_QWORD *)(v1 + 304) = sub_23922CBA4();
  v38 = (__IOHIDDevice *)*(id *)(v1 + 296);
  v39 = (__CFString *)sub_23922CA6C();
  v40 = (id)IOHIDDeviceGetProperty(v38, v39);

  if (!v40)
  {
LABEL_21:
    __break(1u);
    return;
  }
  v60[0] = v40;
  swift_dynamicCast();
  *(_QWORD *)(v2 + 328) = v62;
  *(_QWORD *)(v2 + 336) = swift_slowAlloc();
  v41 = (__IOHIDDevice *)*(id *)(v2 + 296);
  v42 = (__CFString *)sub_23922CA6C();
  v43 = (id)IOHIDDeviceGetProperty(v41, v42);

  if (v43)
  {
    v60[0] = v43;
    v44 = swift_dynamicCast();
    v45 = MEMORY[0x24BEE45B8];
    if ((v44 & 1) != 0)
      v46 = (int)v62;
    else
      v46 = 0;
  }
  else
  {
    v46 = 0;
    v45 = MEMORY[0x24BEE45B8];
  }
  *(_DWORD *)(v2 + 156) = v46;
  v60[0] = 0;
  v60[1] = 0xE000000000000000;
  sub_23922CC4C();
  sub_23922CA9C();
  v47 = *(_DWORD *)(v2 + 136);
  BYTE4(v62) = *(_BYTE *)(v2 + 140);
  LODWORD(v62) = v47;
  sub_2391F0B84();
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  LODWORD(v62) = *(_DWORD *)(v2 + 152);
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  LODWORD(v62) = *(_DWORD *)(v2 + 156);
  sub_23922CDB4();
  sub_23922CA9C();
  swift_bridgeObjectRelease();
  sub_23922CA9C();
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = v58;
  v49 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v48 + 56) = MEMORY[0x24BEE4568];
  *(_QWORD *)(v48 + 64) = v45;
  *(_QWORD *)(v48 + 32) = v49;
  v50 = sub_23922CA78();
  v52 = v51;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 312) = v50;
  *(_QWORD *)(v2 + 320) = v52;
}

unint64_t sub_23921B104(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256920658);
  v2 = (_QWORD *)sub_23922CDA8();
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
    swift_bridgeObjectRetain();
    result = sub_2391F5EC4(v5, v6);
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

uint64_t type metadata accessor for HIDDeviceClient()
{
  return objc_opt_self();
}

void type metadata accessor for IOHIDDevice(uint64_t a1)
{
  sub_2391F7968(a1, &qword_2569205A8);
}

unint64_t sub_23921B248(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAD8);
  v2 = (_QWORD *)sub_23922CDA8();
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
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = sub_2391F5EC4(v5, v6);
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
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_23921B360(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(char *), uint64_t (*a5)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t result;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t *v32;
  uint64_t (*v33)(char *);

  v32 = a2;
  v33 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_23922CDA8();
  v13 = (_QWORD *)v12;
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
    goto LABEL_9;
  v15 = &v11[*(int *)(v8 + 48)];
  v16 = a1;
  v17 = v12 + 64;
  v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v31[1] = v16;
  v19 = v16 + v18;
  v20 = *(_QWORD *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_23922C490(v19, (uint64_t)v11, v32);
    result = v33(v11);
    if ((v22 & 1) != 0)
      break;
    v23 = result;
    *(_QWORD *)(v17 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v24 = v13[6];
    v25 = a5(0);
    result = sub_23922A824((uint64_t)v11, v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v23, a5);
    v26 = v13[7] + 16 * v23;
    v27 = v15[8];
    *(_QWORD *)v26 = *(_QWORD *)v15;
    *(_BYTE *)(v26 + 8) = v27;
    v28 = v13[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_12;
    v13[2] = v30;
    v19 += v20;
    if (!--v14)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (unint64_t)v13;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t HIDDeviceClient.deinit()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  uint64_t result;
  _QWORD v4[6];

  swift_beginAccess();
  *(_BYTE *)(v0 + 353) = 1;
  swift_beginAccess();
  if (*(_BYTE *)(v0 + 352) != 1)
    goto LABEL_3;
  IONotificationPortDestroy(*(IONotificationPortRef *)(v0 + 368));
  IOHIDDeviceCancel(*(IOHIDDeviceRef *)(v0 + 296));
  v1 = *(NSObject **)(v0 + 304);
  v4[4] = nullsub_1;
  v4[5] = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1107296256;
  v4[2] = sub_2391F3FAC;
  v4[3] = &block_descriptor_0;
  v2 = _Block_copy(v4);
  swift_release();
  dispatch_sync(v1, v2);
  _Block_release(v2);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_3:
    MEMORY[0x23B839834](*(_QWORD *)(v0 + 336), -1, -1);
    sub_239219144(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
    swift_bridgeObjectRelease();
    sub_2392195E4(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
    sub_239219778(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
    sub_239219778(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200));
    sub_239219778(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216));
    sub_239219778(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 248));
    sub_239219778(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 264));
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_defaultActor_destroy();
    return v0;
  }
  return result;
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

uint64_t HIDDeviceClient.__deallocating_deinit()
{
  HIDDeviceClient.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23921B6BC()
{
  _QWORD *v0;
  uint64_t result;
  IONotificationPort *v2;
  NSObject *v3;
  mach_port_t v4;
  uint64_t inited;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  uint64_t (*v8)(void);
  uint64_t v9;
  __IOHIDDevice *v10;
  uint8_t *v11;
  CFIndex v12;
  void *v13;
  _QWORD aBlock[6];
  io_object_t notification;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = (*(uint64_t (**)(void))(*v0 + 656))();
  if ((result & 1) == 0)
  {
    (*(void (**)(_QWORD *))(*v0 + 640))(v0);
    v2 = (IONotificationPort *)v0[46];
    v3 = v0[38];
    IONotificationPortSetDispatchQueue(v2, v3);
    notification = 0;
    v4 = *MEMORY[0x24BDD8B18];
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDC8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23922D6C0;
    *(_QWORD *)(inited + 32) = 0xD000000000000011;
    *(_QWORD *)(inited + 40) = 0x800000023923A6E0;
    *(_QWORD *)(inited + 48) = v0[14];
    sub_23921B104(inited);
    v6 = (const __CFDictionary *)sub_23922CA00();
    swift_bridgeObjectRelease();
    MatchingService = IOServiceGetMatchingService(v4, v6);
    v8 = *(uint64_t (**)(void))(*v0 + 632);
    result = v8();
    if (result)
    {
      v9 = IOServiceAddInterestNotification(v2, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)sub_23921BA84, (void *)result, &notification);
      v10 = (__IOHIDDevice *)v0[37];
      result = ((uint64_t (*)(uint64_t))v8)(v9);
      if (result)
      {
        IOHIDDeviceRegisterRemovalCallback(v10, (IOHIDCallback)sub_23921BB5C, (void *)result);
        v12 = v0[41];
        v11 = (uint8_t *)v0[42];
        result = v8();
        if (result)
        {
          IOHIDDeviceRegisterInputReportWithTimeStampCallback(v10, v11, v12, (IOHIDReportWithTimeStampCallback)sub_23921BE44, (void *)result);
          result = v8();
          if (result)
          {
            IOHIDDeviceRegisterInputValueCallback(v10, (IOHIDValueCallback)sub_23921C1C8, (void *)result);
            aBlock[4] = nullsub_1;
            aBlock[5] = 0;
            aBlock[0] = MEMORY[0x24BDAC760];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_2391F4E40;
            aBlock[3] = &block_descriptor_3_0;
            v13 = _Block_copy(aBlock);
            IOHIDDeviceSetCancelHandler(v10, v13);
            _Block_release(v13);
            IOHIDDeviceSetDispatchQueue(v10, v3);
            IOHIDDeviceActivate(v10);
            return (*(uint64_t (**)(uint64_t))(*v0 + 664))(1);
          }
LABEL_11:
          __break(1u);
          return result;
        }
LABEL_10:
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_23921B904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7)
{
  uint64_t v7;

  *(_DWORD *)(v7 + 64) = a5;
  *(_DWORD *)(v7 + 68) = a6;
  *(_QWORD *)(v7 + 16) = a4;
  *(_QWORD *)(v7 + 24) = a7;
  *(_QWORD *)(v7 + 32) = type metadata accessor for HIDDeviceClient.Notification(0);
  *(_QWORD *)(v7 + 40) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23921B964()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + 16);
  v0[6] = v1;
  swift_retain();
  swift_storeEnumTagMultiPayload();
  v0[7] = *(_QWORD *)(*(_QWORD *)v1 + 824);
  return swift_task_switch();
}

uint64_t sub_23921B9E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  (*(void (**)(uint64_t))(v0 + 56))(v1);
  sub_2392279B0(v1, type metadata accessor for HIDDeviceClient.Notification);
  return swift_task_switch();
}

uint64_t sub_23921BA38()
{
  uint64_t v0;

  sub_23922CB8C();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23921BA84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_23922A084(a1, a3, a4);
}

uint64_t sub_23921BA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  v5[4] = type metadata accessor for HIDDeviceClient.Notification(0);
  v5[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23921BAEC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + 16);
  v0[6] = v1;
  swift_retain();
  swift_storeEnumTagMultiPayload();
  v0[7] = *(_QWORD *)(*(_QWORD *)v1 + 824);
  return swift_task_switch();
}

uint64_t sub_23921BB5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAA0);
  result = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    type metadata accessor for HIDDeviceClient.Context();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a1;
    v7 = dispatch_semaphore_create(0);
    v8 = sub_23922CB20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v6;
    v9[5] = v7;
    swift_retain();
    v10 = v7;
    sub_2391F46B4((uint64_t)v5, (uint64_t)&unk_256920640, (uint64_t)v9);
    swift_release();
    sub_23922CB80();

    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23921BC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;

  *(_QWORD *)(v8 + 40) = a8;
  *(_QWORD *)(v8 + 48) = v10;
  *(_QWORD *)(v8 + 24) = a6;
  *(_QWORD *)(v8 + 32) = a7;
  *(_DWORD *)(v8 + 88) = a5;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 56) = type metadata accessor for HIDDeviceClient.Notification(0);
  *(_QWORD *)(v8 + 64) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23921BCD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;

  v1 = *(unsigned int *)(v0 + 88);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16);
  *(_QWORD *)(v0 + 72) = v2;
  result = swift_retain();
  if (v1 > 0xFF)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 24);
    v8 = (unint64_t *)(v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00) + 64));
    HIDReportID.init(rawValue:)(v1, (_BYTE *)v4);
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v6;
    sub_2391F0C34(v7, v6);
    sub_239217EF8(v5, v8);
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(*(_QWORD *)v2 + 824);
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_23921BDA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  (*(void (**)(uint64_t))(v0 + 80))(v1);
  sub_2392279B0(v1, type metadata accessor for HIDDeviceClient.Notification);
  return swift_task_switch();
}

uint64_t sub_23921BDF8()
{
  uint64_t v0;

  sub_23922CB8C();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23921BE44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _BYTE *a6, uint64_t a7, uint64_t a8)
{
  return sub_23922A278(a1, a5, a6, a7, a8);
}

uint64_t sub_23921BE58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[68] = a6;
  v6[67] = a5;
  v6[66] = a4;
  sub_23922CCC4();
  v6[69] = swift_task_alloc();
  v6[70] = type metadata accessor for HIDDeviceClient.Notification(0);
  v6[71] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23921BEDC()
{
  uint64_t v0;
  __IOHIDValue *v1;
  uint64_t v2;
  __IOHIDElement *v3;
  uint64_t *v5;
  unint64_t *v6;
  __IOHIDValue *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t *BytePtr;
  CFIndex Length;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t TimeStamp;
  _OWORD v20[6];
  _OWORD v21[2];

  v1 = *(__IOHIDValue **)(v0 + 536);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 528) + 16);
  *(_QWORD *)(v0 + 576) = v2;
  swift_retain();
  v3 = IOHIDValueGetElement(v1);
  swift_retain();
  sub_2391EB5D0(v3, v2, v0 + 272);
  sub_23922C2C0(v0 + 272, v0 + 144);
  sub_23922C2C0(v0 + 144, v0 + 16);
  if (sub_2391F0098(v0 + 16) == 1)
  {
    sub_23922CB8C();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(uint64_t **)(v0 + 568);
    v6 = *(unint64_t **)(v0 + 552);
    v7 = *(__IOHIDValue **)(v0 + 536);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569205E0);
    v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HIDElement.Value() - 8) + 80);
    v9 = (v8 + 32) & ~v8;
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_23922D6C0;
    v11 = *(_OWORD *)(v0 + 96);
    v20[4] = *(_OWORD *)(v0 + 80);
    v20[5] = v11;
    v21[0] = *(_OWORD *)(v0 + 112);
    *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)(v0 + 121);
    v12 = *(_OWORD *)(v0 + 32);
    v20[0] = *(_OWORD *)(v0 + 16);
    v20[1] = v12;
    v13 = *(_OWORD *)(v0 + 64);
    v20[2] = *(_OWORD *)(v0 + 48);
    v20[3] = v13;
    sub_23922C2C0(v0 + 144, v0 + 400);
    sub_2391F00B0(v0 + 400);
    BytePtr = (uint8_t *)IOHIDValueGetBytePtr(v7);
    Length = IOHIDValueGetLength(v7);
    v16 = sub_23922A1CC(BytePtr, Length);
    v18 = v17;
    TimeStamp = IOHIDValueGetTimeStamp(v7);
    sub_239217EF8(TimeStamp, v6);
    HIDElement.Value.init(element:fromBytes:timestamp:)(v20, v16, v18, (uint64_t)v6, (_OWORD *)(v10 + v9));
    *v5 = v10;
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)(v0 + 584) = *(_QWORD *)(*(_QWORD *)v2 + 824);
    return swift_task_switch();
  }
}

uint64_t sub_23921C10C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 568);
  (*(void (**)(uint64_t))(v0 + 584))(v1);
  sub_2392279B0(v1, type metadata accessor for HIDDeviceClient.Notification);
  return swift_task_switch();
}

uint64_t sub_23921C164()
{
  uint64_t v0;

  sub_2391F01E0(v0 + 144);
  sub_23922CB8C();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23921C1C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  v5 = a4;
  sub_23922A3D8(a1, v5);

}

void sub_23921C204()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  unint64_t v4;
  uint64_t i;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __IOHIDElement *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t Cookie;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  __IOHIDDevice *v52;
  const __CFArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD v62[6];
  _OWORD v63[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDD0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23922D6C0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23922D6C0;
  *(_QWORD *)(inited + 32) = 1701869908;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 48) = sub_23922CB68();
  *(_QWORD *)(v1 + 32) = sub_23921B248(inited);
  v54 = v0;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 752))();
  if (v4 >> 62)
    goto LABEL_33;
  for (i = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10); i; i = sub_23922CD78())
  {
    v6 = 0;
    v58 = v4 & 0xC000000000000001;
    v55 = v4 & 0xFFFFFFFFFFFFFF8;
    v56 = i;
    v57 = v4;
    while (1)
    {
      if (v58)
      {
        v7 = MEMORY[0x23B838ED4](v6, v4);
        v8 = __OFADD__(v6, 1);
        v9 = v6 + 1;
        if (v8)
          goto LABEL_31;
      }
      else
      {
        if (v6 >= *(_QWORD *)(v55 + 16))
          goto LABEL_32;
        v7 = swift_retain();
        v8 = __OFADD__(v6, 1);
        v9 = v6 + 1;
        if (v8)
          goto LABEL_31;
      }
      v59 = v9;
      v10 = *(_QWORD *)(v7 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor);
      v11 = *(_QWORD *)(v10 + 16);
      if (v11)
        break;
      swift_release();
LABEL_5:
      v6 = v59;
      if (v59 == i)
        goto LABEL_34;
    }
    swift_bridgeObjectRetain();
    v61 = v11 - 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAD8);
    for (j = 32; ; j = v60 + 128)
    {
      v13 = v10;
      v60 = j;
      v14 = (__int128 *)(v10 + j);
      v15 = v14[4];
      v16 = v14[5];
      v17 = *(__int128 *)((char *)v14 + 105);
      v63[0] = v14[6];
      v18 = *v14;
      v19 = v14[1];
      v20 = v14[3];
      v62[2] = v14[2];
      v62[3] = v20;
      v62[0] = v18;
      v62[1] = v19;
      *(_OWORD *)((char *)v63 + 9) = v17;
      v62[4] = v15;
      v62[5] = v16;
      v21 = *(__IOHIDElement **)&v63[0];
      v22 = v2;
      v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_239238DE0;
      *(_QWORD *)(v23 + 32) = 1701869908;
      *(_QWORD *)(v23 + 40) = 0xE400000000000000;
      sub_2391F00B0((uint64_t)v62);
      *(_QWORD *)(v23 + 48) = sub_23922CE8C();
      *(_QWORD *)(v23 + 56) = 0x444974726F706552;
      *(_QWORD *)(v23 + 64) = 0xE800000000000000;
      IOHIDElementGetReportID(v21);
      *(_QWORD *)(v23 + 72) = sub_23922CE8C();
      v4 = sub_23922CDA8();
      v2 = *(_QWORD *)(v23 + 32);
      v24 = *(_QWORD *)(v23 + 40);
      v25 = *(_QWORD *)(v23 + 48);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_retain();
      v26 = sub_2391F5EC4(v2, v24);
      if ((v27 & 1) != 0)
        break;
      *(_QWORD *)(v4 + 64 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      v28 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v26);
      *v28 = v2;
      v28[1] = v24;
      *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v26) = v25;
      v29 = *(_QWORD *)(v4 + 16);
      v8 = __OFADD__(v29, 1);
      v30 = v29 + 1;
      if (v8)
        goto LABEL_28;
      *(_QWORD *)(v4 + 16) = v30;
      v31 = *(_QWORD *)(v23 + 56);
      v2 = *(_QWORD *)(v23 + 64);
      v32 = *(_QWORD *)(v23 + 72);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      v33 = sub_2391F5EC4(v31, v2);
      if ((v34 & 1) != 0)
        break;
      *(_QWORD *)(v4 + 64 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
      v35 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v33);
      *v35 = v31;
      v35[1] = v2;
      *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v33) = v32;
      v36 = *(_QWORD *)(v4 + 16);
      v8 = __OFADD__(v36, 1);
      v37 = v36 + 1;
      if (v8)
        goto LABEL_28;
      *(_QWORD *)(v4 + 16) = v37;
      swift_release();
      swift_bridgeObjectRelease();
      v39 = *(_QWORD *)(v1 + 16);
      v38 = *(_QWORD *)(v1 + 24);
      if (v39 >= v38 >> 1)
        v1 = (uint64_t)sub_2392277F4((_QWORD *)(v38 > 1), v39 + 1, 1, (_QWORD *)v1);
      v2 = v22;
      *(_QWORD *)(v1 + 16) = v39 + 1;
      *(_QWORD *)(v1 + 8 * v39 + 32) = v4;
      v40 = swift_initStackObject();
      *(_OWORD *)(v40 + 16) = xmmword_23922D6C0;
      strcpy((char *)(v40 + 32), "ElementCookie");
      *(_WORD *)(v40 + 46) = -4864;
      Cookie = IOHIDElementGetCookie(v21);
      nullsub_1(Cookie);
      *(_QWORD *)(v40 + 48) = sub_23922CE8C();
      v4 = sub_23922CDA8();
      swift_retain();
      v42 = *(_QWORD *)(v40 + 32);
      v43 = *(_QWORD *)(v40 + 40);
      v44 = *(_QWORD *)(v40 + 48);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      v45 = sub_2391F5EC4(v42, v43);
      if ((v46 & 1) != 0)
        goto LABEL_29;
      *(_QWORD *)(v4 + 8 * (v45 >> 6) + 64) |= 1 << v45;
      v47 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v45);
      *v47 = v42;
      v47[1] = v43;
      *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v45) = v44;
      v48 = *(_QWORD *)(v4 + 16);
      v8 = __OFADD__(v48, 1);
      v49 = v48 + 1;
      if (v8)
        goto LABEL_30;
      *(_QWORD *)(v4 + 16) = v49;
      swift_release();
      swift_bridgeObjectRelease();
      v51 = *(_QWORD *)(v1 + 16);
      v50 = *(_QWORD *)(v1 + 24);
      if (v51 >= v50 >> 1)
        v1 = (uint64_t)sub_2392277F4((_QWORD *)(v50 > 1), v51 + 1, 1, (_QWORD *)v1);
      v10 = v13;
      *(_QWORD *)(v1 + 16) = v51 + 1;
      *(_QWORD *)(v1 + 8 * v51 + 32) = v4;
      sub_2391F0BC8((uint64_t)v62);
      if (!v61)
      {
        swift_release();
        swift_bridgeObjectRelease();
        i = v56;
        v4 = v57;
        goto LABEL_5;
      }
      --v61;
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    ;
  }
LABEL_34:
  swift_bridgeObjectRelease();
  v52 = *(__IOHIDDevice **)(v54 + 296);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDE0);
  v53 = (const __CFArray *)sub_23922CAB4();
  swift_bridgeObjectRelease();
  IOHIDDeviceSetInputValueMatchingMultiple(v52, v53);

}

uint64_t sub_23921C754(char a1, char a2)
{
  IOHIDDeviceRef *v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  char v11;

  if ((a2 & 1) != 0)
    (*((void (**)(void))*v2 + 99))();
  result = (*((uint64_t (**)(void))*v2 + 88))();
  if ((result & 1) == 0)
  {
    (*((void (**)(void))*v2 + 98))();
    v5 = a1 & 1;
    v6 = IOHIDDeviceOpen(v2[37], v5);
    sub_239217BBC(v6, (uint64_t)&v9);
    if ((v11 & 1) != 0)
    {
      (*((void (**)(uint64_t))*v2 + 89))(1);
      return (*((uint64_t (**)(uint64_t))*v2 + 92))(v5);
    }
    else
    {
      v7 = v9 | ((unint64_t)v10 << 32);
      v11 = 0;
      sub_239227914();
      if ((sub_23922CA60() & 1) != 0)
        (*((void (**)(uint64_t))*v2 + 89))(1);
      sub_2391F7504();
      swift_allocError();
      *(_DWORD *)v8 = v7;
      *(_BYTE *)(v8 + 4) = BYTE4(v7) & 1;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_23921C8A4()
{
  IOHIDDeviceRef *v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  result = (*((uint64_t (**)(void))*v0 + 88))();
  if ((result & 1) != 0)
  {
    result = (*((uint64_t (**)(void))*v0 + 91))();
    if ((result & 1) == 0)
    {
      v2 = (*((uint64_t (**)(void))*v0 + 94))();
      if (!(v2 >> 62))
      {
        v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
        result = swift_bridgeObjectRelease();
        if (v3)
          return result;
LABEL_7:
        IOHIDDeviceClose(v0[37], 0);
        (*((void (**)(_QWORD))*v0 + 89))(0);
        return (*((uint64_t (**)(_QWORD))*v0 + 92))(0);
      }
      v4 = sub_23922CD78();
      result = swift_bridgeObjectRelease();
      if (!v4)
        goto LABEL_7;
    }
  }
  return result;
}

void sub_23921C968()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  int v5;
  char v6;

  if (((*(uint64_t (**)(void))(*(_QWORD *)v0 + 704))() & 1) != 0)
  {
    sub_2391F7504();
    swift_allocError();
    *(_DWORD *)v2 = 6;
    *(_BYTE *)(v2 + 4) = 1;
    swift_willThrow();
  }
  else
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)v0 + 656))() & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)v0 + 784))();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v0 + 800))(1, 0);
    if (v1)
    {
      v3 = v1;
      __swift_instantiateConcreteTypeFromMangledName(qword_25691FC10);
      if (swift_dynamicCast() && v6 == 1 && v5 == 3)
      {

        (*(void (**)(void))(*(_QWORD *)v0 + 808))();
        sub_2391F7504();
        swift_allocError();
        *(_DWORD *)v4 = 3;
        *(_BYTE *)(v4 + 4) = 1;
        swift_willThrow();
      }

    }
  }
}

uint64_t sub_23921CABC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23921CB04()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23921CB14()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23921CB24()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23921CB6C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23921CBBC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23921CC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues) = MEMORY[0x24BEE4AF8];
  v7 = v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a1, v8);
  *(_QWORD *)(v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor) = a2;
  *(_QWORD *)(v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor) = a3;
  return v6;
}

uint64_t sub_23921CCA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues) = MEMORY[0x24BEE4AF8];
  v7 = v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a1, v8);
  *(_QWORD *)(v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor) = a2;
  *(_QWORD *)(v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor) = a3;
  return v3;
}

uint64_t sub_23921CD3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23921CDB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23921CE38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  BOOL v19;
  int EnumCaseMultiPayload;
  unsigned __int8 v21;
  unsigned __int8 v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void (*v34)(__int128 *, _QWORD);
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;
  char v45;
  char v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
  char v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  void (*v58)(_OWORD *, _QWORD);
  _QWORD **v59;
  _QWORD *v60;
  _QWORD *v61;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char v69;
  char v70;
  char v71;
  char *v72;
  uint64_t v73;
  unsigned __int8 *v74;
  uint64_t v75;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  unsigned __int8 *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  int v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  int v121;
  char v122;
  char v123;
  char v124;
  uint64_t v125;
  char v126;
  char v127;
  char v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  char v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  char v138;
  char v139;
  uint64_t v140;
  char v141;
  _OWORD v142[6];
  _OWORD v143[2];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _OWORD v150[2];
  char v151;
  char v152;
  char v153;
  char v154;
  char v155;
  unsigned __int8 v156;
  unsigned __int8 v157;
  unsigned __int8 v158;

  v91 = a1;
  v2 = type metadata accessor for HIDElement.Value();
  v103 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v86 = (uint64_t)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v77 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF8);
  v98 = *(_QWORD *)(v7 - 8);
  v99 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v97 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = type metadata accessor for HIDDeviceClient.Notification(0);
  v9 = MEMORY[0x24BDAC7A8](v94);
  v96 = (uint64_t *)((char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = MEMORY[0x24BDAC7A8](v9);
  v90 = (unsigned __int8 *)&v77 - v12;
  v13 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 752);
  v78 = v1;
  v14 = v13(v11);
  v84 = v14;
  if (v14 >> 62)
    goto LABEL_54;
  v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v15)
  {
    v16 = 0;
    v83 = v14 & 0xC000000000000001;
    v79 = v14 + 32;
    v80 = v14 & 0xFFFFFFFFFFFFFF8;
    v85 = (char *)v142 + 1;
    v87 = v6;
    v82 = v15;
    while (!v83)
    {
      if (v16 >= *(_QWORD *)(v80 + 16))
        goto LABEL_53;
      v18 = *(_QWORD *)(v79 + 8 * v16);
      swift_retain();
      v19 = __OFADD__(v16++, 1);
      if (v19)
        goto LABEL_52;
LABEL_12:
      sub_23922796C(v91, (uint64_t)v90, type metadata accessor for HIDDeviceClient.Notification);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload != 2)
      {
        v93 = v16;
        v101 = v18;
        if (EnumCaseMultiPayload != 1)
        {
          if (EnumCaseMultiPayload)
          {
            sub_23922796C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
            __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
            v17 = v97;
            sub_23922CB38();
            swift_release();
            (*(void (**)(char *, uint64_t))(v98 + 8))(v17, v99);
            sub_2392279B0((uint64_t)v90, type metadata accessor for HIDDeviceClient.Notification);
          }
          else
          {
            v21 = *v90;
            v22 = v90[1];
            sub_2391F0C78(*((_QWORD *)v90 + 1), *((_QWORD *)v90 + 2));
            if ((v22 & 1) != 0)
            {
              sub_23922796C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
              __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
              v23 = v97;
              sub_23922CB38();
              swift_release();
              (*(void (**)(char *, uint64_t))(v98 + 8))(v23, v99);
            }
            else
            {
              v66 = *(_QWORD *)(v18 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor);
              v67 = *(_QWORD *)(v66 + 16);
              if (v67)
              {
                sub_2392279EC();
                swift_bridgeObjectRetain();
                v118 = v66;
                v68 = (char *)(v66 + 33);
                do
                {
                  v69 = *(v68 - 1);
                  v70 = *v68;
                  LOBYTE(v119) = v21;
                  LOBYTE(v144) = v69;
                  BYTE1(v144) = v70;
                  v71 = sub_23922CA48();
                  v158 = v21;
                  LOBYTE(v142[0]) = v69;
                  BYTE1(v142[0]) = v70;
                  if ((v71 & 1) != 0 && (sub_23922CA54() & 1) != 0)
                  {
                    sub_23922796C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
                    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
                    v72 = v97;
                    sub_23922CB38();
                    (*(void (**)(char *, uint64_t))(v98 + 8))(v72, v99);
                  }
                  v68 += 2;
                  --v67;
                }
                while (v67);
                swift_bridgeObjectRelease();
                swift_release();
                v6 = v87;
                v16 = v93;
              }
              else
              {
                swift_release();
              }
            }
            v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00);
            v74 = &v90[*(int *)(v73 + 64)];
            v75 = sub_23922CCC4();
            (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v75 - 8) + 8))(v74, v75);
          }
          goto LABEL_5;
        }
        v25 = *(_QWORD *)v90;
        v104 = *(_QWORD *)(*(_QWORD *)v90 + 16);
        if (v104)
        {
          v26 = 0;
          v95 = OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor;
          v88 = v25;
          v89 = v18 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
          v81 = (*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
          v102 = v25 + v81;
          do
          {
            if (v26 >= *(_QWORD *)(v25 + 16))
            {
              __break(1u);
              goto LABEL_52;
            }
            v27 = *(_QWORD *)(v103 + 72);
            v28 = sub_23922796C(v102 + v27 * v26, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
            if (v6[104] == 1)
            {
              v29 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 112);
              v30 = *(_QWORD *)(v29(v28) + 16);
              v31 = swift_bridgeObjectRelease();
              if (v30)
              {
                v32 = v29(v31);
                *v96 = v32;
                swift_storeEnumTagMultiPayload();
                __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
                v33 = v97;
                sub_23922CB38();
                (*(void (**)(char *, uint64_t))(v98 + 8))(v33, v99);
                v34 = (void (*)(__int128 *, _QWORD))(*(uint64_t (**)(__int128 *))(*(_QWORD *)v18 + 128))(&v144);
                *v35 = MEMORY[0x24BEE4AF8];
                swift_bridgeObjectRelease();
                v34(&v144, 0);
              }
            }
            else
            {
              v36 = *(_QWORD *)(v18 + v95);
              v37 = *(_QWORD *)(v36 + 16);
              if (v37)
              {
                v92 = v27;
                v100 = v26;
                v118 = *(_QWORD *)v6;
                v117 = v6[8];
                v38 = *(unsigned int *)(v6 + 10) | ((unint64_t)v6[14] << 32);
                v116 = v6[15];
                v39 = v6[16];
                v40 = *(_QWORD *)(v6 + 20);
                v41 = v6[28];
                v115 = v6[29];
                v42 = v6[30];
                v114 = *((_QWORD *)v6 + 4);
                v43 = v6[40];
                v44 = *((_QWORD *)v6 + 6);
                v45 = v6[56];
                v112 = *((_QWORD *)v6 + 8);
                v113 = v44;
                v46 = v6[72];
                v111 = *((_QWORD *)v6 + 10);
                LOBYTE(v44) = v6[88];
                v110 = *((_QWORD *)v6 + 12);
                v109 = v6[105];
                v108 = *((_QWORD *)v6 + 14);
                v47 = v6[120];
                v158 = v39;
                v157 = v41;
                v156 = v42;
                v155 = v43;
                v154 = v45;
                v153 = v46;
                v152 = v44;
                v151 = v47;
                swift_bridgeObjectRetain();
                v48 = *(_OWORD *)(v36 + 112);
                v148 = *(_OWORD *)(v36 + 96);
                v149 = v48;
                v150[0] = *(_OWORD *)(v36 + 128);
                *(_OWORD *)((char *)v150 + 9) = *(_OWORD *)(v36 + 137);
                v49 = *(_OWORD *)(v36 + 48);
                v144 = *(_OWORD *)(v36 + 32);
                v145 = v49;
                v50 = *(_OWORD *)(v36 + 80);
                v146 = *(_OWORD *)(v36 + 64);
                v147 = v50;
                v106 = v157;
                v107 = v158;
                v105 = v156;
                v51 = v155;
                v52 = v154;
                v53 = v153;
                v54 = v152;
                v55 = v37 - 1;
                v56 = 160;
                v57 = v151;
                while (1)
                {
                  v142[4] = v148;
                  v142[5] = v149;
                  v143[0] = v150[0];
                  *(_OWORD *)((char *)v143 + 9) = *(_OWORD *)((char *)v150 + 9);
                  v142[0] = v144;
                  v142[1] = v145;
                  v142[2] = v146;
                  v142[3] = v147;
                  v119 = v118;
                  v120 = v117;
                  v122 = BYTE4(v38);
                  v121 = v38;
                  v123 = v116;
                  v124 = v107;
                  v125 = v40;
                  v126 = v106;
                  v127 = v115;
                  v128 = v105;
                  v129 = v114;
                  v130 = v51;
                  v131 = v113;
                  v132 = v52;
                  v133 = v112;
                  v134 = v53;
                  v135 = v111;
                  v136 = v54;
                  v137 = v110;
                  v138 = 0;
                  v139 = v109;
                  v140 = v108;
                  v141 = v57;
                  if ((static HIDElement.== infix(_:_:)((uint64_t)v142, (uint64_t)&v119) & 1) != 0)
                    break;
                  if (!v55)
                  {
                    swift_bridgeObjectRelease();
                    v6 = v87;
                    v25 = v88;
                    v16 = v93;
                    v26 = v100;
                    v18 = v101;
                    goto LABEL_22;
                  }
                  v148 = *(_OWORD *)(v36 + v56 + 64);
                  v149 = *(_OWORD *)(v36 + v56 + 80);
                  v150[0] = *(_OWORD *)(v36 + v56 + 96);
                  *(_OWORD *)((char *)v150 + 9) = *(_OWORD *)(v36 + v56 + 105);
                  v144 = *(_OWORD *)(v36 + v56);
                  v145 = *(_OWORD *)(v36 + v56 + 16);
                  v146 = *(_OWORD *)(v36 + v56 + 32);
                  v147 = *(_OWORD *)(v36 + v56 + 48);
                  v56 += 128;
                  --v55;
                }
                swift_bridgeObjectRelease();
                v6 = v87;
                sub_23922796C((uint64_t)v87, v86, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
                v58 = (void (*)(_OWORD *, _QWORD))(*(uint64_t (**)(_OWORD *))(*(_QWORD *)v101
                                                                                                 + 128))(v142);
                v60 = v59;
                v61 = *v59;
                isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                *v60 = v61;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                {
                  v61 = (_QWORD *)sub_239227680(0, v61[2] + 1, 1, v61);
                  *v60 = v61;
                }
                v64 = v61[2];
                v63 = v61[3];
                if (v64 >= v63 >> 1)
                {
                  v61 = (_QWORD *)sub_239227680(v63 > 1, v64 + 1, 1, v61);
                  *v60 = v61;
                }
                v65 = v92;
                v16 = v93;
                v61[2] = v64 + 1;
                sub_23922A824(v86, (uint64_t)v61 + v81 + v64 * v65, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
                v58(v142, 0);
                sub_2392279B0((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
                v26 = v100;
                v18 = v101;
                v25 = v88;
                goto LABEL_23;
              }
            }
LABEL_22:
            sub_2392279B0((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
LABEL_23:
            ++v26;
          }
          while (v26 != v104);
        }
        swift_bridgeObjectRelease();
LABEL_40:
        swift_release();
        goto LABEL_5;
      }
      if (((*(uint64_t (**)(void))(*(_QWORD *)v78 + 728))() & 1) != 0)
        goto LABEL_40;
      sub_23922796C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
      v24 = v97;
      sub_23922CB38();
      swift_release();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v24, v99);
LABEL_5:
      v14 = v84;
      if (v16 == v82)
        return swift_bridgeObjectRelease();
    }
    v18 = MEMORY[0x23B838ED4](v16, v14);
    v19 = __OFADD__(v16++, 1);
    if (!v19)
      goto LABEL_12;
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    v15 = sub_23922CD78();
    v14 = v84;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23921D85C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  char v6;
  char v7;
  uint64_t result;
  uint64_t (*v9)(_BYTE *, _QWORD);
  uint64_t v10;
  _BYTE v11[40];

  v2 = v1;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 752))();
  swift_retain();
  v5 = sub_23922A52C(v4, a1);
  v7 = v6;
  swift_bridgeObjectRelease();
  result = swift_release();
  if ((v7 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v2 + 768))(v11);
    sub_23921D920(v5);
    swift_release();
    v10 = v9(v11, 0);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 808))(v10);
  }
  return result;
}

uint64_t sub_23921D920(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!(_DWORD)result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
    sub_23922802C(v3);
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v5 + 8 * a1;
    v9 = *(_QWORD *)(v8 + 32);
    memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * (v6 - 1 - a1));
    *(_QWORD *)(v5 + 16) = v7;
    sub_23922CAC0();
    return v9;
  }
  return result;
}

uint64_t sub_23921D9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = a1;
  v12 = a2;
  v13 = v2;
  type metadata accessor for HIDDeviceClient.Notification(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE6CA0], v5);
  return sub_23922CB5C();
}

uint64_t sub_23921DA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *);
  void (*v14)(_QWORD *, _QWORD);
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];

  v20 = type metadata accessor for HIDDeviceClient.Notification(0);
  MEMORY[0x24BDAC7A8](v20);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF8);
  v19[1] = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDF0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  type metadata accessor for HIDDeviceClient.StreamWrapper(0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues) = MEMORY[0x24BEE4AF8];
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation, v11, v8);
  *(_QWORD *)(v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor) = a2;
  *(_QWORD *)(v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor) = a3;
  v13 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)a4 + 768);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v14 = (void (*)(_QWORD *, _QWORD))v13(v22);
  v16 = v15;
  MEMORY[0x23B838D24]();
  if (*(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23922CACC();
  sub_23922CAD8();
  sub_23922CAC0();
  v14(v22, 0);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a4;
  *(_QWORD *)(v17 + 24) = v12;
  swift_retain();
  swift_retain();
  sub_23922CB2C();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)a4 + 800))(0, 1);
  return swift_release();
}

uint64_t sub_23921DDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAA0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23922CB20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  swift_retain();
  swift_retain();
  sub_2391F46B4((uint64_t)v6, (uint64_t)&unk_256920608, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_23921DE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  v5[4] = *(_QWORD *)(*(_QWORD *)a4 + 832);
  return swift_task_switch();
}

uint64_t sub_23921DEB8()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 32))(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HIDDeviceClient.UnsafeProperty.unsafeObject.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_23921DEF4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

_QWORD *sub_23921DEFC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v5;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr, _QWORD, _QWORD))(**(_QWORD **)a1 + 848))(&v5, *a2, a2[1]);
  *a3 = v5;
  return result;
}

uint64_t sub_23921DF40(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t *, uint64_t, uint64_t);
  uint64_t v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = *a2;
  v8 = *a1;
  v6 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)v5 + 856);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return v6(&v8, v3, v4);
}

void sub_23921DF9C(_QWORD *a1@<X8>)
{
  uint64_t v1;
  __IOHIDDevice *v3;
  __CFString *v4;
  CFTypeRef v5;

  v3 = *(__IOHIDDevice **)(v1 + 296);
  v4 = (__CFString *)sub_23922CA6C();
  v5 = (id)IOHIDDeviceGetProperty(v3, v4);

  *a1 = v5;
}

uint64_t sub_23921DFEC()
{
  uint64_t v0;
  __IOHIDDevice *v1;
  __CFString *v2;
  const void *v3;

  v1 = *(__IOHIDDevice **)(v0 + 296);
  v2 = (__CFString *)sub_23922CA6C();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE18);
  v3 = (const void *)sub_23922CBC8();
  swift_unknownObjectRelease();
  IOHIDDeviceSetProperty(v1, v2, v3);

  return swift_unknownObjectRelease();
}

void (*sub_23921E080(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  __IOHIDDevice *v8;
  __CFString *v9;
  CFTypeRef v10;

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[2] = a2;
  v7[3] = a3;
  v8 = *(__IOHIDDevice **)(v3 + 296);
  v7[4] = v8;
  v9 = (__CFString *)sub_23922CA6C();
  v10 = (id)IOHIDDeviceGetProperty(v8, v9);

  *v7 = v10;
  return sub_23921E10C;
}

void sub_23921E10C(uint64_t **a1, char a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  __IOHIDDevice *v5;
  __CFString *v6;
  const void *v7;
  __CFString *v8;
  const void *v9;

  v2 = *a1;
  v3 = *a1 + 1;
  v4 = **a1;
  v5 = (__IOHIDDevice *)(*a1)[4];
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    v6 = (__CFString *)sub_23922CA6C();
    swift_bridgeObjectRelease();
    v2[1] = v4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE18);
    v7 = (const void *)sub_23922CBC8();
    swift_unknownObjectRelease();
    IOHIDDeviceSetProperty(v5, v6, v7);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    v8 = (__CFString *)sub_23922CA6C();
    swift_bridgeObjectRelease();
    *v3 = v4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE18);
    v9 = (const void *)sub_23922CBC8();
    swift_unknownObjectRelease();
    IOHIDDeviceSetProperty(v5, v8, v9);
    swift_unknownObjectRelease();

  }
  free(v2);
}

uint64_t sub_23921E21C(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 + 48) = a6;
  *(_QWORD *)(v8 + 56) = v7;
  *(_BYTE *)(v8 + 101) = a7;
  *(_QWORD *)(v8 + 32) = a4;
  *(_QWORD *)(v8 + 40) = a5;
  *(_QWORD *)(v8 + 24) = a3;
  *(_BYTE *)(v8 + 102) = *a1;
  *(_BYTE *)(v8 + 103) = *a2;
  *(_BYTE *)(v8 + 104) = a2[1];
  return swift_task_switch();
}

uint64_t sub_23921E258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int16 v12;
  char v13;

  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(v0 + 56) + 800))(0, 0);
  v12 = *(_WORD *)(v0 + 102);
  v13 = *(_BYTE *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_BYTE *)(v0 + 101);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
  v7 = swift_slowAlloc();
  *(_QWORD *)(v0 + 64) = v7;
  sub_2391F66EC((unint64_t *)&unk_25691FE28, v8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  v9 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v9;
  *(_QWORD *)(v9 + 16) = v7;
  *(_QWORD *)(v9 + 24) = v5;
  *(_QWORD *)(v9 + 32) = v2;
  *(_BYTE *)(v9 + 40) = v3 & 1;
  *(_QWORD *)(v9 + 48) = v6;
  *(_QWORD *)(v9 + 56) = v4;
  *(_QWORD *)(v9 + 64) = v1;
  *(_WORD *)(v9 + 72) = v12;
  *(_BYTE *)(v9 + 74) = v13;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v10;
  *v10 = v0;
  v10[1] = sub_23921E498;
  return sub_23922CDD8();
}

uint64_t sub_23921E498()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23921E50C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  (*(void (**)(void))(**(_QWORD **)(v0 + 56) + 808))();
  MEMORY[0x23B839834](v1, -1, -1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23921E558()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc();
  MEMORY[0x23B839834](v1, -1, -1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23921E59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(a2, a1, v11);
  if ((a5 & 1) == 0)
  {
    sub_23922CE98();
    v12 = sub_23922CE98();
  }
  MEMORY[0x24BDAC7A8](v12);
  __asm { BR              X10 }
}

void sub_23921E6C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 v3;
  __int16 v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 128) = v0;
  *(_WORD *)(v5 - 120) = v1;
  *(_BYTE *)(v5 - 118) = BYTE2(v1);
  *(_BYTE *)(v5 - 117) = BYTE3(v1);
  *(_BYTE *)(v5 - 116) = BYTE4(v1);
  *(_BYTE *)(v5 - 115) = BYTE5(v1);
  sub_23921E844(v5 - 128, v2, v3, v4 & 0x1FF, v0, v1);
}

void sub_23921E844(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v8;

  v8 = a3;
  sub_2391F19F4(&v8);
  if (a1)
    __asm { BR              X12 }
  __break(1u);
  JUMPOUT(0x23921E998);
}

uint64_t sub_23921E9A8(uint64_t a1, uint64_t a2)
{
  return sub_2391F5088(a1, a2);
}

uint64_t sub_23921E9BC(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 48) = a4;
  *(_QWORD *)(v6 + 56) = v5;
  *(_BYTE *)(v6 + 117) = a5;
  *(_QWORD *)(v6 + 40) = a3;
  *(_BYTE *)(v6 + 118) = *a1;
  *(_BYTE *)(v6 + 119) = *a2;
  *(_BYTE *)(v6 + 120) = a2[1];
  return swift_task_switch();
}

uint64_t sub_23921E9F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int16 v12;
  char v13;

  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(v0 + 56) + 800))(0, 0);
  v12 = *(_WORD *)(v0 + 118);
  v13 = *(_BYTE *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_BYTE *)(v0 + 117);
  v4 = *(_QWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE38);
  v5 = swift_slowAlloc();
  *(_QWORD *)(v0 + 64) = v5;
  v6 = swift_slowAlloc();
  *(_QWORD *)(v0 + 72) = v6;
  v7 = swift_slowAlloc();
  *(_QWORD *)(v0 + 80) = v7;
  sub_2391F66EC((unint64_t *)&unk_25691FE28, v8, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  v9 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v9;
  *(_QWORD *)(v9 + 16) = v5;
  *(_QWORD *)(v9 + 24) = v6;
  *(_QWORD *)(v9 + 32) = v1;
  *(_QWORD *)(v9 + 40) = v4;
  *(_QWORD *)(v9 + 48) = v2;
  *(_BYTE *)(v9 + 56) = v3 & 1;
  *(_WORD *)(v9 + 57) = v12;
  *(_BYTE *)(v9 + 59) = v13;
  *(_QWORD *)(v9 + 64) = v7;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v10;
  *v10 = v0;
  v10[1] = sub_23921EC64;
  return sub_23922CDD8();
}

uint64_t sub_23921EC64()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23921ECD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  (*(void (**)(void))(**(_QWORD **)(v0 + 56) + 808))();
  MEMORY[0x23B839834](v3, -1, -1);
  MEMORY[0x23B839834](v2, -1, -1);
  MEMORY[0x23B839834](v1, -1, -1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v5);
}

uint64_t sub_23921ED64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc();
  MEMORY[0x23B839834](v3, -1, -1);
  MEMORY[0x23B839834](v2, -1, -1);
  MEMORY[0x23B839834](v1, -1, -1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23921EDD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7)
{
  sub_23922A9A0(a1, a2, a6, a7);
}

uint64_t HIDDeviceClient.ProvideElementUpdate.values.getter()
{
  return sub_23921F4E8((void (*)(_QWORD))type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t HIDDeviceClient.ProvideElementUpdate.values.setter(uint64_t a1)
{
  return sub_23921F518(a1, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t (*HIDDeviceClient.ProvideElementUpdate.values.modify())(_QWORD)
{
  type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  return nullsub_1;
}

uint64_t HIDDeviceClient.ProvideElementUpdate.init(values:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  sub_23922CCAC();
  result = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  *(_QWORD *)(a2 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t HIDDeviceClient.ProvideElementUpdate.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0) + 20));
  v2 = *(_QWORD *)(v1 + 16);
  result = sub_23922CE44();
  if (v2)
  {
    v4 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
    v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    sub_2391F66EC(&qword_25691FE40, 255, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_23922CA24();
      v5 += v6;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t static HIDDeviceClient.ProvideElementUpdate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((sub_23922CCB8() & 1) == 0)
    return 0;
  v4 = *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0) + 20);
  return sub_23921F0BC(*(_QWORD *)(a1 + v4), *(_QWORD *)(a2 + v4));
}

uint64_t sub_23921EFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v7 = 1;
    }
    else
    {
      v3 = a1 + 32;
      v4 = a2 + 32;
      sub_2391F1638();
      v5 = v2 - 1;
      do
      {
        v6 = v5;
        v7 = sub_23922CA60();
        if ((v7 & 1) == 0)
          break;
        v5 = v6 - 1;
        v3 += 128;
        v4 += 128;
      }
      while (v6);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_23921F0BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for HIDElement.Value();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_23922796C(a1 + v12, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        sub_23922796C(a2 + v12, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        sub_2391F66EC(&qword_25691F650, 255, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
        v15 = sub_23922CA60();
        sub_2392279B0((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        sub_2392279B0((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t HIDDeviceClient.ProvideElementUpdate.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23922CE38();
  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0) + 20));
  v2 = *(_QWORD *)(v1 + 16);
  sub_23922CE44();
  if (v2)
  {
    v3 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v5 = *(_QWORD *)(v3 + 72);
    sub_2391F66EC(&qword_25691FE40, 255, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_23922CA24();
      v4 += v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return sub_23922CE74();
}

uint64_t sub_23921F340(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23922CE38();
  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v4 = *(_QWORD *)(v2 + *(int *)(a2 + 20));
  v5 = *(_QWORD *)(v4 + 16);
  sub_23922CE44();
  if (v5)
  {
    v6 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
    v7 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    sub_2391F66EC(&qword_25691FE40, 255, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_23922CA24();
      v7 += v8;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  return sub_23922CE74();
}

uint64_t sub_23921F450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_23922CCB8() & 1) != 0)
    return sub_23921F0BC(*(_QWORD *)(a1 + *(int *)(a3 + 20)), *(_QWORD *)(a2 + *(int *)(a3 + 20)));
  else
    return 0;
}

uint64_t sub_23921F4A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23922CCC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t HIDDeviceClient.RequestElementUpdate.elements.getter()
{
  return sub_23921F4E8((void (*)(_QWORD))type metadata accessor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_23921F4E8(void (*a1)(_QWORD))
{
  a1(0);
  return swift_bridgeObjectRetain();
}

uint64_t HIDDeviceClient.RequestElementUpdate.elements.setter(uint64_t a1)
{
  return sub_23921F518(a1, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_23921F518(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2(0) + 20);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*HIDDeviceClient.RequestElementUpdate.elements.modify())(_QWORD)
{
  type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  return nullsub_1;
}

uint64_t HIDDeviceClient.RequestElementUpdate.pollDevice.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0) + 24));
}

uint64_t HIDDeviceClient.RequestElementUpdate.pollDevice.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*HIDDeviceClient.RequestElementUpdate.pollDevice.modify())(_QWORD)
{
  type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  return nullsub_1;
}

uint64_t sub_23921F5F0()
{
  return 1;
}

uint64_t HIDDeviceClient.RequestElementUpdate.init(elements:pollDevice:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t result;

  sub_23922CCAC();
  result = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  *(_QWORD *)(a3 + *(int *)(result + 20)) = a1;
  *(_BYTE *)(a3 + *(int *)(result + 24)) = a2;
  return result;
}

uint64_t HIDDeviceClient.RequestElementUpdate.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v3 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0) + 20));
  swift_bridgeObjectRetain();
  sub_239229B94(a1, v3);
  swift_bridgeObjectRelease();
  return sub_23922CE50();
}

uint64_t static HIDDeviceClient.RequestElementUpdate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  if ((sub_23922CCB8() & 1) != 0
    && (v4 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0),
        (sub_23921EFC4(*(_QWORD *)(a1 + *(int *)(v4 + 20)), *(_QWORD *)(a2 + *(int *)(v4 + 20))) & 1) != 0))
  {
    v5 = *(_BYTE *)(a1 + *(int *)(v4 + 24)) ^ *(_BYTE *)(a2 + *(int *)(v4 + 24)) ^ 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t HIDDeviceClient.RequestElementUpdate.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  sub_23922CE38();
  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0) + 20));
  swift_bridgeObjectRetain();
  sub_239229B94((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  sub_23922CE50();
  return sub_23922CE74();
}

uint64_t sub_23921F810(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[72];

  sub_23922CE38();
  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v3 = *(_QWORD *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  sub_239229B94((uint64_t)v5, v3);
  swift_bridgeObjectRelease();
  sub_23922CE50();
  return sub_23922CE74();
}

uint64_t sub_23921F8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v5 = *(_QWORD *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_239229B94(a1, v5);
  swift_bridgeObjectRelease();
  return sub_23922CE50();
}

uint64_t sub_23921F958(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[72];

  sub_23922CE38();
  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v4 = *(_QWORD *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_239229B94((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  sub_23922CE50();
  return sub_23922CE74();
}

uint64_t sub_23921FA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;

  if ((sub_23922CCB8() & 1) != 0
    && (sub_23921EFC4(*(_QWORD *)(a1 + *(int *)(a3 + 20)), *(_QWORD *)(a2 + *(int *)(a3 + 20))) & 1) != 0)
  {
    v6 = *(_BYTE *)(a1 + *(int *)(a3 + 24)) ^ *(_BYTE *)(a2 + *(int *)(a3 + 24)) ^ 1;
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

unint64_t sub_23921FA74()
{
  return sub_23921B360(MEMORY[0x24BEE4AF8], &qword_2569205F8, &qword_2569205E8, (uint64_t (*)(char *))sub_2392272F0, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t sub_23921FAB0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23921FAB8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*sub_23921FAE0())()
{
  return nullsub_1;
}

unint64_t sub_23921FAF0()
{
  return sub_23921B360(MEMORY[0x24BEE4AF8], &qword_2569205F0, &qword_2569205C8, (uint64_t (*)(char *))sub_239227424, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_23921FB2C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23921FB34(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*sub_23921FB5C())()
{
  return nullsub_1;
}

uint64_t sub_23921FB6C(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v21;
  int v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  id v29;
  char v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  id v34;
  char v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD v42[5];

  v3 = v2;
  v41 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE48);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  v40 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v39 = (uint64_t)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v38 = (uint64_t)&v37 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE50);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v37 - v20;
  sub_2391F66A8(a1, (uint64_t)v42);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE58);
  v22 = swift_dynamicCast();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  if (v22)
  {
    v23(v14, 0, 1, v15);
    v24 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate;
    sub_23922A824((uint64_t)v14, (uint64_t)v21, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    sub_23922796C((uint64_t)v21, (uint64_t)v18, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    v25 = (uint64_t)v41;
    v26 = v41;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v42[0] = *v3;
    *v3 = 0x8000000000000000;
    sub_2392293D8(v25, 1, (uint64_t)v18, isUniquelyReferenced_nonNull_native);
    *v3 = v42[0];
    swift_bridgeObjectRelease();
    sub_2392279B0((uint64_t)v18, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    v28 = (uint64_t)v21;
    return sub_2392279B0(v28, v24);
  }
  v29 = v41;
  v23(v14, 1, 1, v15);
  sub_2391F2690((uint64_t)v14, &qword_25691FE50);
  sub_2391F66A8(a1, (uint64_t)v42);
  v30 = swift_dynamicCast();
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56);
  if ((v30 & 1) != 0)
  {
    v31(v7, 0, 1, v8);
    v24 = type metadata accessor for HIDDeviceClient.RequestElementUpdate;
    v32 = v38;
    sub_23922A824((uint64_t)v7, v38, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    v33 = v39;
    sub_23922796C(v32, v39, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    v34 = v29;
    v35 = swift_isUniquelyReferenced_nonNull_native();
    v42[0] = v3[1];
    v3[1] = 0x8000000000000000;
    sub_239229244((uint64_t)v29, 1, v33, v35);
    v3[1] = v42[0];
    swift_bridgeObjectRelease();
    sub_2392279B0(v33, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    v28 = v32;
    return sub_2392279B0(v28, v24);
  }
  v31(v7, 1, 1, v8);
  return sub_2391F2690((uint64_t)v7, &qword_25691FE48);
}

id HIDDeviceClient.HIDElementUpdateResult.subscript.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  id v6;

  v2 = *v1;
  if (!*(_QWORD *)(v2 + 16))
    return 0;
  v3 = sub_2392272F0(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = *(_QWORD *)(v2 + 56) + 16 * v3;
  v6 = *(id *)v5;
  sub_23922A868(*(id *)v5, *(_BYTE *)(v5 + 8));
  return v6;
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(v1 + 8);
  if (!*(_QWORD *)(v2 + 16))
    return 0;
  v3 = sub_239227424(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = *(_QWORD *)(v2 + 56) + 16 * (_QWORD)v3;
  v6 = *(id *)v5;
  sub_23922A874(*(id *)v5, *(_BYTE *)(v5 + 8));
  return v6;
}

unint64_t sub_23921FF98@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t result;

  v2 = MEMORY[0x24BEE4AF8];
  v3 = sub_23921B360(MEMORY[0x24BEE4AF8], &qword_2569205F8, &qword_2569205E8, (uint64_t (*)(char *))sub_2392272F0, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  result = sub_23921B360(v2, &qword_2569205F0, &qword_2569205C8, (uint64_t (*)(char *))sub_239227424, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  *a1 = v3;
  a1[1] = result;
  return result;
}

uint64_t sub_23922001C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_239220024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v6 + 280) = a4;
  *(_QWORD *)(v6 + 288) = v5;
  *(_BYTE *)(v6 + 532) = a5;
  *(_QWORD *)(v6 + 264) = a2;
  *(_QWORD *)(v6 + 272) = a3;
  *(_QWORD *)(v6 + 256) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE48);
  *(_QWORD *)(v6 + 296) = swift_task_alloc();
  v7 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  *(_QWORD *)(v6 + 304) = v7;
  *(_QWORD *)(v6 + 312) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 320) = swift_task_alloc();
  *(_QWORD *)(v6 + 328) = swift_task_alloc();
  v8 = type metadata accessor for HIDElement.Value();
  *(_QWORD *)(v6 + 336) = v8;
  *(_QWORD *)(v6 + 344) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 352) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE50);
  *(_QWORD *)(v6 + 360) = swift_task_alloc();
  v9 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  *(_QWORD *)(v6 + 368) = v9;
  *(_QWORD *)(v6 + 376) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v6 + 384) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23922016C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  int v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
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
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;

  v1 = *(_BYTE *)(v0 + 532);
  v2 = MEMORY[0x24BEE4AF8];
  v3 = sub_23921B360(MEMORY[0x24BEE4AF8], &qword_2569205F8, &qword_2569205E8, (uint64_t (*)(char *))sub_2392272F0, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  v4 = sub_23921B360(v2, &qword_2569205F0, &qword_2569205C8, (uint64_t (*)(char *))sub_239227424, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  *(_QWORD *)(v0 + 136) = v3;
  *(_QWORD *)(v0 + 144) = v4;
  v5 = 0.0;
  if ((v1 & 1) == 0)
  {
    v6 = (double)sub_23922CE98() * 1000.0;
    sub_23922CE98();
    v5 = v6 + (double)v7 / 1000000.0;
  }
  *(double *)(v0 + 392) = v5;
  v8 = *(_QWORD *)(v0 + 288);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
  *(_QWORD *)(v0 + 400) = swift_slowAlloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE68);
  *(_QWORD *)(v0 + 408) = swift_slowAlloc();
  *(_QWORD *)(v0 + 416) = swift_slowAlloc();
  v9 = 0;
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)v8 + 800))(0, 0);
  *(_QWORD *)(v0 + 424) = 0;
  v10 = *(_QWORD *)(*(_QWORD *)(v0 + 264) + 16);
  *(_QWORD *)(v0 + 432) = v10;
  if (!v10)
  {
LABEL_12:
    v25 = *(_QWORD *)(v0 + 408);
    v26 = *(_QWORD *)(v0 + 416);
    v27 = *(_QWORD *)(v0 + 400);
    v28 = *(_QWORD **)(v0 + 256);
    (*(void (**)(void))(**(_QWORD **)(v0 + 288) + 808))();
    v29 = *(_QWORD *)(v0 + 144);
    *v28 = *(_QWORD *)(v0 + 136);
    v28[1] = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x23B839834](v27, -1, -1);
    MEMORY[0x23B839834](v25, -1, -1);
    MEMORY[0x23B839834](v26, -1, -1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v11 = v0 + 16;
  v12 = (uint64_t *)(v0 + 232);
  swift_bridgeObjectRetain();
  v13 = 0;
  while (1)
  {
    *(_QWORD *)(v0 + 440) = v13;
    v16 = *(_QWORD *)(v0 + 424);
    sub_2391F66A8(*(_QWORD *)(v0 + 264) + 40 * v13 + 32, v11);
    if (v16)
    {
      v14 = *(id *)(v0 + 424);
      swift_willThrow();
      v15 = *(void **)(v0 + 424);
      sub_23921FB6C(v11, v15);

      __swift_destroy_boxed_opaque_existential_1(v11);
      goto LABEL_6;
    }
    v17 = *(_QWORD *)(v0 + 376);
    sub_2391F66A8(v11, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE58);
    v18 = swift_dynamicCast();
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
    if (v18)
      break;
    v20 = *(_QWORD *)(v0 + 360);
    v21 = *(_QWORD *)(v0 + 312);
    v19(v20, 1, 1, *(_QWORD *)(v0 + 368));
    sub_2391F2690(v20, &qword_25691FE50);
    sub_2391F66A8(v11, v0 + 96);
    v22 = swift_dynamicCast();
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    if (v22)
    {
      v39 = *(_QWORD *)(v0 + 328);
      v41 = *(_QWORD *)(v0 + 296);
      v40 = *(_QWORD *)(v0 + 304);
      v23(v41, 0, 1, v40);
      sub_23922A824(v41, v39, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      v43 = *(_QWORD *)(v39 + *(int *)(v40 + 20));
      v44 = *(_QWORD *)(v43 + 16);
      v45 = MEMORY[0x24BEE4AF8];
      if (v44)
      {
        *v12 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_23922CC88();
        v46 = 128;
        do
        {
          v47 = *(id *)(v43 + v46);
          sub_23922CC70();
          sub_23922CC94();
          sub_23922CCA0();
          sub_23922CC7C();
          v46 += 128;
          --v44;
        }
        while (v44);
        v45 = *v12;
        swift_bridgeObjectRelease();
      }
      *(_QWORD *)(v0 + 472) = v45;
      v49 = *(_QWORD *)(v0 + 408);
      v48 = *(_QWORD *)(v0 + 416);
      v50 = *(_QWORD *)(v0 + 392);
      v51 = *(_QWORD *)(v0 + 288);
      sub_2391F66EC((unint64_t *)&unk_25691FE28, v42, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
      v52 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 480) = v52;
      v52[2] = v49;
      v52[3] = v51;
      v52[4] = v45;
      v52[5] = v48;
      v52[6] = v50;
      v53 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 488) = v53;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE70);
      *v53 = v0;
      v53[1] = sub_239222B10;
      return sub_23922CDD8();
    }
    v24 = *(_QWORD *)(v0 + 296);
    v23(v24, 1, 1, *(_QWORD *)(v0 + 304));
    __swift_destroy_boxed_opaque_existential_1(v11);
    sub_2391F2690(v24, &qword_25691FE48);
LABEL_6:
    v13 = *(_QWORD *)(v0 + 440) + 1;
    if (v13 == *(_QWORD *)(v0 + 432))
    {
      swift_bridgeObjectRelease();
      v9 = *(void **)(v0 + 424);
      goto LABEL_12;
    }
  }
  v31 = *(_QWORD *)(v0 + 384);
  v33 = *(_QWORD *)(v0 + 360);
  v32 = *(_QWORD *)(v0 + 368);
  v19(v33, 0, 1, v32);
  sub_23922A824(v33, v31, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  *(_QWORD *)(v0 + 168) = MEMORY[0x24BEE4B00];
  v35 = *(_QWORD *)(v31 + *(int *)(v32 + 20));
  if (*(_QWORD *)(v35 + 16))
  {
    v36 = v35
        + ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80));
    swift_bridgeObjectRetain();
    v37 = *(_QWORD *)(v0 + 352);
    v38 = *(_QWORD *)(v0 + 336);
    sub_23922796C(v36, v37, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
    __asm { BR              X9 }
  }
  v54 = *(_QWORD *)(v0 + 400);
  v55 = *(_QWORD *)(v0 + 392);
  v56 = *(_QWORD *)(v0 + 384);
  v57 = *(_QWORD *)(v0 + 288);
  sub_2391F66EC((unint64_t *)&unk_25691FE28, v34, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  v58 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v58;
  v58[2] = v54;
  v58[3] = v57;
  v58[4] = v0 + 168;
  v58[5] = v55;
  v58[6] = v0 + 136;
  v58[7] = v56;
  v59 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 456) = v59;
  *v59 = v0;
  v59[1] = sub_2392216B4;
  return sub_23922CDD8();
}

uint64_t sub_2392216B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 464) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_239221770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  int v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;

  v1 = *(_QWORD *)(v0 + 384);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_2392279B0(v1, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 440) + 1;
  if (v2 == *(_QWORD *)(v0 + 432))
  {
LABEL_2:
    v3 = swift_bridgeObjectRelease();
    v5 = *(_QWORD *)(v0 + 416);
    v4 = *(void **)(v0 + 424);
    v7 = *(_QWORD *)(v0 + 400);
    v6 = *(_QWORD *)(v0 + 408);
    v8 = *(_QWORD **)(v0 + 256);
    (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 288) + 808))(v3);
    v9 = *(_QWORD *)(v0 + 144);
    *v8 = *(_QWORD *)(v0 + 136);
    v8[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x23B839834](v7, -1, -1);
    MEMORY[0x23B839834](v6, -1, -1);
    MEMORY[0x23B839834](v5, -1, -1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v11 = (uint64_t *)(v0 + 232);
  while (1)
  {
    *(_QWORD *)(v0 + 440) = v2;
    v14 = *(_QWORD *)(v0 + 424);
    sub_2391F66A8(*(_QWORD *)(v0 + 264) + 40 * v2 + 32, v0 + 16);
    if (v14)
    {
      v12 = *(id *)(v0 + 424);
      swift_willThrow();
      v13 = *(void **)(v0 + 424);
      sub_23921FB6C(v0 + 16, v13);

      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      goto LABEL_5;
    }
    v15 = *(_QWORD *)(v0 + 376);
    sub_2391F66A8(v0 + 16, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE58);
    v16 = swift_dynamicCast();
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
    if (v16)
      break;
    v18 = *(_QWORD *)(v0 + 360);
    v19 = *(_QWORD *)(v0 + 312);
    v17(v18, 1, 1, *(_QWORD *)(v0 + 368));
    sub_2391F2690(v18, &qword_25691FE50);
    sub_2391F66A8(v0 + 16, v0 + 96);
    v20 = swift_dynamicCast();
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    if (v20)
    {
      v29 = *(_QWORD *)(v0 + 328);
      v31 = *(_QWORD *)(v0 + 296);
      v30 = *(_QWORD *)(v0 + 304);
      v21(v31, 0, 1, v30);
      sub_23922A824(v31, v29, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      v33 = *(_QWORD *)(v29 + *(int *)(v30 + 20));
      v34 = *(_QWORD *)(v33 + 16);
      v35 = MEMORY[0x24BEE4AF8];
      if (v34)
      {
        *v11 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_23922CC88();
        v36 = 128;
        do
        {
          v37 = *(id *)(v33 + v36);
          sub_23922CC70();
          sub_23922CC94();
          sub_23922CCA0();
          sub_23922CC7C();
          v36 += 128;
          --v34;
        }
        while (v34);
        v35 = *v11;
        swift_bridgeObjectRelease();
      }
      *(_QWORD *)(v0 + 472) = v35;
      v39 = *(_QWORD *)(v0 + 408);
      v38 = *(_QWORD *)(v0 + 416);
      v40 = *(_QWORD *)(v0 + 392);
      v41 = *(_QWORD *)(v0 + 288);
      sub_2391F66EC((unint64_t *)&unk_25691FE28, v32, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
      v42 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 480) = v42;
      v42[2] = v39;
      v42[3] = v41;
      v42[4] = v35;
      v42[5] = v38;
      v42[6] = v40;
      v43 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 488) = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE70);
      *v43 = v0;
      v43[1] = sub_239222B10;
      return sub_23922CDD8();
    }
    v22 = *(_QWORD *)(v0 + 296);
    v21(v22, 1, 1, *(_QWORD *)(v0 + 304));
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    sub_2391F2690(v22, &qword_25691FE48);
LABEL_5:
    v2 = *(_QWORD *)(v0 + 440) + 1;
    if (v2 == *(_QWORD *)(v0 + 432))
      goto LABEL_2;
  }
  v23 = *(_QWORD *)(v0 + 384);
  v25 = *(_QWORD *)(v0 + 360);
  v24 = *(_QWORD *)(v0 + 368);
  v17(v25, 0, 1, v24);
  sub_23922A824(v25, v23, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  *(_QWORD *)(v0 + 168) = MEMORY[0x24BEE4B00];
  v27 = *(_QWORD *)(v23 + *(int *)(v24 + 20));
  if (*(_QWORD *)(v27 + 16))
  {
    v28 = v27
        + ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80));
    swift_bridgeObjectRetain();
    v44 = *(_QWORD *)(v0 + 352);
    v45 = *(_QWORD *)(v0 + 336);
    sub_23922796C(v28, v44, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
    __asm { BR              X9 }
  }
  v46 = *(_QWORD *)(v0 + 400);
  v47 = *(_QWORD *)(v0 + 392);
  v48 = *(_QWORD *)(v0 + 384);
  v49 = *(_QWORD *)(v0 + 288);
  sub_2391F66EC((unint64_t *)&unk_25691FE28, v26, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  v50 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v50;
  v50[2] = v46;
  v50[3] = v49;
  v50[4] = v0 + 168;
  v50[5] = v47;
  v50[6] = v0 + 136;
  v50[7] = v48;
  v51 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 456) = v51;
  *v51 = v0;
  v51[1] = sub_2392216B4;
  return sub_23922CDD8();
}

uint64_t sub_239222B10()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 496) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_239222BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  char v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  void (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  int v43;
  void (*v44)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;

  v2 = *(_QWORD *)(v0 + 320);
  v1 = *(_QWORD *)(v0 + 328);
  v3 = sub_23922AAC8(*(_QWORD *)(v0 + 208), (void (*)(void))sub_23922A998, *(_QWORD *)(v0 + 288));
  swift_bridgeObjectRelease();
  sub_23922796C(v1, v2, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v5 = *(_QWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 160) = v5;
  *(_QWORD *)(v0 + 144) = 0x8000000000000000;
  v7 = (unint64_t)sub_239227424(v2);
  v8 = *(_QWORD *)(v5 + 16);
  v9 = (v6 & 1) == 0;
  v10 = v8 + v9;
  if (__OFADD__(v8, v9))
  {
    __break(1u);
    goto LABEL_31;
  }
  v11 = v6;
  if (*(_QWORD *)(v5 + 24) >= v10)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      sub_23922961C(type metadata accessor for HIDDeviceClient.RequestElementUpdate, &qword_2569205C8, (uint64_t (*)(uint64_t, uint64_t))sub_23922A874);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 320);
    sub_239228300(v10, isUniquelyReferenced_nonNull_native);
    v13 = sub_239227424(v12);
    if ((v11 & 1) != (v14 & 1))
      return sub_23922CDF0();
    v7 = (unint64_t)v13;
  }
  v16 = *(_QWORD **)(v0 + 160);
  if ((v11 & 1) == 0)
  {
    v19 = *(_QWORD *)(v0 + 312);
    v18 = *(_QWORD *)(v0 + 320);
    v16[(v7 >> 6) + 8] |= 1 << v7;
    sub_23922796C(v18, v16[6] + *(_QWORD *)(v19 + 72) * v7, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    v20 = v16[7] + 16 * v7;
    *(_QWORD *)v20 = v3;
    *(_BYTE *)(v20 + 8) = 0;
    v21 = v16[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      goto LABEL_12;
    }
LABEL_31:
    __break(1u);
    JUMPOUT(0x2392240ACLL);
  }
  v17 = v16[7] + 16 * v7;
  sub_23922AD78(*(id *)v17, *(_BYTE *)(v17 + 8));
  *(_QWORD *)v17 = v3;
  *(_BYTE *)(v17 + 8) = 0;
LABEL_12:
  v24 = *(_QWORD *)(v0 + 320);
  v25 = *(_QWORD *)(v0 + 328);
  *(_QWORD *)(v0 + 144) = v16;
  swift_bridgeObjectRelease();
  sub_2392279B0(v24, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  sub_2392279B0(v25, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v26 = *(_QWORD *)(v0 + 440) + 1;
  if (v26 == *(_QWORD *)(v0 + 432))
  {
LABEL_13:
    v27 = swift_bridgeObjectRelease();
    v29 = *(_QWORD *)(v0 + 416);
    v28 = *(void **)(v0 + 424);
    v31 = *(_QWORD *)(v0 + 400);
    v30 = *(_QWORD *)(v0 + 408);
    v32 = *(_QWORD **)(v0 + 256);
    (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 288) + 808))(v27);
    v33 = *(_QWORD *)(v0 + 144);
    *v32 = *(_QWORD *)(v0 + 136);
    v32[1] = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x23B839834](v31, -1, -1);
    MEMORY[0x23B839834](v30, -1, -1);
    MEMORY[0x23B839834](v29, -1, -1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v34 = (uint64_t *)(v0 + 232);
  while (1)
  {
    *(_QWORD *)(v0 + 440) = v26;
    v37 = *(_QWORD *)(v0 + 424);
    sub_2391F66A8(*(_QWORD *)(v0 + 264) + 40 * v26 + 32, v0 + 16);
    if (v37)
    {
      v35 = *(id *)(v0 + 424);
      swift_willThrow();
      v36 = *(void **)(v0 + 424);
      sub_23921FB6C(v0 + 16, v36);

      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      goto LABEL_16;
    }
    v38 = *(_QWORD *)(v0 + 376);
    sub_2391F66A8(v0 + 16, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE58);
    v39 = swift_dynamicCast();
    v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
    if (v39)
      break;
    v41 = *(_QWORD *)(v0 + 360);
    v42 = *(_QWORD *)(v0 + 312);
    v40(v41, 1, 1, *(_QWORD *)(v0 + 368));
    sub_2391F2690(v41, &qword_25691FE50);
    sub_2391F66A8(v0 + 16, v0 + 96);
    v43 = swift_dynamicCast();
    v44 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56);
    if (v43)
    {
      v52 = *(_QWORD *)(v0 + 328);
      v54 = *(_QWORD *)(v0 + 296);
      v53 = *(_QWORD *)(v0 + 304);
      v44(v54, 0, 1, v53);
      sub_23922A824(v54, v52, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      v56 = *(_QWORD *)(v52 + *(int *)(v53 + 20));
      v57 = *(_QWORD *)(v56 + 16);
      v58 = MEMORY[0x24BEE4AF8];
      if (v57)
      {
        *v34 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_23922CC88();
        v59 = 128;
        do
        {
          v60 = *(id *)(v56 + v59);
          sub_23922CC70();
          sub_23922CC94();
          sub_23922CCA0();
          sub_23922CC7C();
          v59 += 128;
          --v57;
        }
        while (v57);
        v58 = *v34;
        swift_bridgeObjectRelease();
      }
      *(_QWORD *)(v0 + 472) = v58;
      v62 = *(_QWORD *)(v0 + 408);
      v61 = *(_QWORD *)(v0 + 416);
      v63 = *(_QWORD *)(v0 + 392);
      v64 = *(_QWORD *)(v0 + 288);
      sub_2391F66EC((unint64_t *)&unk_25691FE28, v55, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
      v65 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 480) = v65;
      v65[2] = v62;
      v65[3] = v64;
      v65[4] = v58;
      v65[5] = v61;
      v65[6] = v63;
      v66 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 488) = v66;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE70);
      *v66 = v0;
      v66[1] = sub_239222B10;
      return sub_23922CDD8();
    }
    v45 = *(_QWORD *)(v0 + 296);
    v44(v45, 1, 1, *(_QWORD *)(v0 + 304));
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    sub_2391F2690(v45, &qword_25691FE48);
LABEL_16:
    v26 = *(_QWORD *)(v0 + 440) + 1;
    if (v26 == *(_QWORD *)(v0 + 432))
      goto LABEL_13;
  }
  v46 = *(_QWORD *)(v0 + 384);
  v48 = *(_QWORD *)(v0 + 360);
  v47 = *(_QWORD *)(v0 + 368);
  v40(v48, 0, 1, v47);
  sub_23922A824(v48, v46, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  *(_QWORD *)(v0 + 168) = MEMORY[0x24BEE4B00];
  v50 = *(_QWORD *)(v46 + *(int *)(v47 + 20));
  if (*(_QWORD *)(v50 + 16))
  {
    v51 = v50
        + ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80));
    swift_bridgeObjectRetain();
    v67 = *(_QWORD *)(v0 + 352);
    v68 = *(_QWORD *)(v0 + 336);
    sub_23922796C(v51, v67, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
    __asm { BR              X9 }
  }
  v69 = *(_QWORD *)(v0 + 400);
  v70 = *(_QWORD *)(v0 + 392);
  v71 = *(_QWORD *)(v0 + 384);
  v72 = *(_QWORD *)(v0 + 288);
  sub_2391F66EC((unint64_t *)&unk_25691FE28, v49, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  v73 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v73;
  v73[2] = v69;
  v73[3] = v72;
  v73[4] = v0 + 168;
  v73[5] = v70;
  v73[6] = v0 + 136;
  v73[7] = v71;
  v74 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 456) = v74;
  *v74 = v0;
  v74[1] = sub_2392216B4;
  return sub_23922CDD8();
}

uint64_t sub_23922411C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  int v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;

  sub_2392279B0(*(_QWORD *)(v0 + 384), type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 464);
  sub_23921FB6C(v0 + 16, v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v2 = *(_QWORD *)(v0 + 440) + 1;
  if (v2 == *(_QWORD *)(v0 + 432))
  {
LABEL_2:
    v3 = swift_bridgeObjectRelease();
    v5 = *(_QWORD *)(v0 + 416);
    v4 = *(void **)(v0 + 424);
    v7 = *(_QWORD *)(v0 + 400);
    v6 = *(_QWORD *)(v0 + 408);
    v8 = *(_QWORD **)(v0 + 256);
    (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 288) + 808))(v3);
    v9 = *(_QWORD *)(v0 + 144);
    *v8 = *(_QWORD *)(v0 + 136);
    v8[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x23B839834](v7, -1, -1);
    MEMORY[0x23B839834](v6, -1, -1);
    MEMORY[0x23B839834](v5, -1, -1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v11 = (uint64_t *)(v0 + 232);
    while (1)
    {
      while (1)
      {
        *(_QWORD *)(v0 + 440) = v2;
        v14 = *(_QWORD *)(v0 + 424);
        sub_2391F66A8(*(_QWORD *)(v0 + 264) + 40 * v2 + 32, v0 + 16);
        if (!v14)
          break;
        v12 = *(id *)(v0 + 424);
        swift_willThrow();
        v13 = *(void **)(v0 + 424);
        sub_23921FB6C(v0 + 16, v13);

        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        v2 = *(_QWORD *)(v0 + 440) + 1;
        if (v2 == *(_QWORD *)(v0 + 432))
          goto LABEL_2;
      }
      v15 = *(_QWORD *)(v0 + 376);
      sub_2391F66A8(v0 + 16, v0 + 56);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE58);
      v16 = swift_dynamicCast();
      v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      if (v16)
        break;
      v18 = *(_QWORD *)(v0 + 360);
      v19 = *(_QWORD *)(v0 + 312);
      v17(v18, 1, 1, *(_QWORD *)(v0 + 368));
      sub_2391F2690(v18, &qword_25691FE50);
      sub_2391F66A8(v0 + 16, v0 + 96);
      v20 = swift_dynamicCast();
      v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      if (v20)
      {
        v29 = *(_QWORD *)(v0 + 328);
        v31 = *(_QWORD *)(v0 + 296);
        v30 = *(_QWORD *)(v0 + 304);
        v21(v31, 0, 1, v30);
        sub_23922A824(v31, v29, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        v33 = *(_QWORD *)(v29 + *(int *)(v30 + 20));
        v34 = *(_QWORD *)(v33 + 16);
        v35 = MEMORY[0x24BEE4AF8];
        if (v34)
        {
          *v11 = MEMORY[0x24BEE4AF8];
          swift_bridgeObjectRetain();
          sub_23922CC88();
          v36 = 128;
          do
          {
            v37 = *(id *)(v33 + v36);
            sub_23922CC70();
            sub_23922CC94();
            sub_23922CCA0();
            sub_23922CC7C();
            v36 += 128;
            --v34;
          }
          while (v34);
          v35 = *v11;
          swift_bridgeObjectRelease();
        }
        *(_QWORD *)(v0 + 472) = v35;
        v39 = *(_QWORD *)(v0 + 408);
        v38 = *(_QWORD *)(v0 + 416);
        v40 = *(_QWORD *)(v0 + 392);
        v41 = *(_QWORD *)(v0 + 288);
        sub_2391F66EC((unint64_t *)&unk_25691FE28, v32, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
        v42 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 480) = v42;
        v42[2] = v39;
        v42[3] = v41;
        v42[4] = v35;
        v42[5] = v38;
        v42[6] = v40;
        v43 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 488) = v43;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE70);
        *v43 = v0;
        v43[1] = sub_239222B10;
        return sub_23922CDD8();
      }
      v22 = *(_QWORD *)(v0 + 296);
      v21(v22, 1, 1, *(_QWORD *)(v0 + 304));
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      sub_2391F2690(v22, &qword_25691FE48);
      v2 = *(_QWORD *)(v0 + 440) + 1;
      if (v2 == *(_QWORD *)(v0 + 432))
        goto LABEL_2;
    }
    v23 = *(_QWORD *)(v0 + 384);
    v25 = *(_QWORD *)(v0 + 360);
    v24 = *(_QWORD *)(v0 + 368);
    v17(v25, 0, 1, v24);
    sub_23922A824(v25, v23, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    *(_QWORD *)(v0 + 168) = MEMORY[0x24BEE4B00];
    v27 = *(_QWORD *)(v23 + *(int *)(v24 + 20));
    if (*(_QWORD *)(v27 + 16))
    {
      v28 = v27
          + ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80));
      swift_bridgeObjectRetain();
      v44 = *(_QWORD *)(v0 + 352);
      v45 = *(_QWORD *)(v0 + 336);
      sub_23922796C(v28, v44, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
      __asm { BR              X9 }
    }
    v46 = *(_QWORD *)(v0 + 400);
    v47 = *(_QWORD *)(v0 + 392);
    v48 = *(_QWORD *)(v0 + 384);
    v49 = *(_QWORD *)(v0 + 288);
    sub_2391F66EC((unint64_t *)&unk_25691FE28, v26, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
    v50 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 448) = v50;
    v50[2] = v46;
    v50[3] = v49;
    v50[4] = v0 + 168;
    v50[5] = v47;
    v50[6] = v0 + 136;
    v50[7] = v48;
    v51 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 456) = v51;
    *v51 = v0;
    v51[1] = sub_2392216B4;
    return sub_23922CDD8();
  }
}

uint64_t sub_2392254E0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  int v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;

  sub_2392279B0(*(_QWORD *)(v0 + 328), type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  v1 = *(void **)(v0 + 496);
  sub_23921FB6C(v0 + 16, v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v2 = *(_QWORD *)(v0 + 440) + 1;
  if (v2 == *(_QWORD *)(v0 + 432))
  {
LABEL_2:
    v3 = swift_bridgeObjectRelease();
    v5 = *(_QWORD *)(v0 + 416);
    v4 = *(void **)(v0 + 424);
    v7 = *(_QWORD *)(v0 + 400);
    v6 = *(_QWORD *)(v0 + 408);
    v8 = *(_QWORD **)(v0 + 256);
    (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 288) + 808))(v3);
    v9 = *(_QWORD *)(v0 + 144);
    *v8 = *(_QWORD *)(v0 + 136);
    v8[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x23B839834](v7, -1, -1);
    MEMORY[0x23B839834](v6, -1, -1);
    MEMORY[0x23B839834](v5, -1, -1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v11 = (uint64_t *)(v0 + 232);
    while (1)
    {
      while (1)
      {
        *(_QWORD *)(v0 + 440) = v2;
        v14 = *(_QWORD *)(v0 + 424);
        sub_2391F66A8(*(_QWORD *)(v0 + 264) + 40 * v2 + 32, v0 + 16);
        if (!v14)
          break;
        v12 = *(id *)(v0 + 424);
        swift_willThrow();
        v13 = *(void **)(v0 + 424);
        sub_23921FB6C(v0 + 16, v13);

        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        v2 = *(_QWORD *)(v0 + 440) + 1;
        if (v2 == *(_QWORD *)(v0 + 432))
          goto LABEL_2;
      }
      v15 = *(_QWORD *)(v0 + 376);
      sub_2391F66A8(v0 + 16, v0 + 56);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25691FE58);
      v16 = swift_dynamicCast();
      v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      if (v16)
        break;
      v18 = *(_QWORD *)(v0 + 360);
      v19 = *(_QWORD *)(v0 + 312);
      v17(v18, 1, 1, *(_QWORD *)(v0 + 368));
      sub_2391F2690(v18, &qword_25691FE50);
      sub_2391F66A8(v0 + 16, v0 + 96);
      v20 = swift_dynamicCast();
      v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      if (v20)
      {
        v31 = *(_QWORD *)(v0 + 328);
        v33 = *(_QWORD *)(v0 + 296);
        v32 = *(_QWORD *)(v0 + 304);
        v21(v33, 0, 1, v32);
        sub_23922A824(v33, v31, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        v35 = *(_QWORD *)(v31 + *(int *)(v32 + 20));
        v36 = *(_QWORD *)(v35 + 16);
        v37 = MEMORY[0x24BEE4AF8];
        if (v36)
        {
          *v11 = MEMORY[0x24BEE4AF8];
          swift_bridgeObjectRetain();
          sub_23922CC88();
          v38 = 128;
          do
          {
            v39 = *(id *)(v35 + v38);
            sub_23922CC70();
            sub_23922CC94();
            sub_23922CCA0();
            sub_23922CC7C();
            v38 += 128;
            --v36;
          }
          while (v36);
          v37 = *v11;
          swift_bridgeObjectRelease();
        }
        *(_QWORD *)(v0 + 472) = v37;
        v41 = *(_QWORD *)(v0 + 408);
        v40 = *(_QWORD *)(v0 + 416);
        v42 = *(_QWORD *)(v0 + 392);
        v43 = *(_QWORD *)(v0 + 288);
        sub_2391F66EC((unint64_t *)&unk_25691FE28, v34, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
        v44 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 480) = v44;
        v44[2] = v41;
        v44[3] = v43;
        v44[4] = v37;
        v44[5] = v40;
        v44[6] = v42;
        v45 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 488) = v45;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE70);
        *v45 = v0;
        v45[1] = sub_239222B10;
        return sub_23922CDD8();
      }
      v22 = *(_QWORD *)(v0 + 296);
      v21(v22, 1, 1, *(_QWORD *)(v0 + 304));
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      sub_2391F2690(v22, &qword_25691FE48);
      v2 = *(_QWORD *)(v0 + 440) + 1;
      if (v2 == *(_QWORD *)(v0 + 432))
        goto LABEL_2;
    }
    v23 = *(_QWORD *)(v0 + 384);
    v25 = *(_QWORD *)(v0 + 360);
    v24 = *(_QWORD *)(v0 + 368);
    v17(v25, 0, 1, v24);
    sub_23922A824(v25, v23, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    *(_QWORD *)(v0 + 168) = MEMORY[0x24BEE4B00];
    v27 = *(_QWORD *)(v23 + *(int *)(v24 + 20));
    if (*(_QWORD *)(v27 + 16))
    {
      v28 = v27
          + ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 344) + 80));
      swift_bridgeObjectRetain();
      v29 = *(_QWORD *)(v0 + 352);
      v30 = *(_QWORD *)(v0 + 336);
      sub_23922796C(v28, v29, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
      __asm { BR              X9 }
    }
    v46 = *(_QWORD *)(v0 + 400);
    v47 = *(_QWORD *)(v0 + 392);
    v48 = *(_QWORD *)(v0 + 384);
    v49 = *(_QWORD *)(v0 + 288);
    sub_2391F66EC((unint64_t *)&unk_25691FE28, v26, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
    v50 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 448) = v50;
    v50[2] = v46;
    v50[3] = v49;
    v50[4] = v0 + 168;
    v50[5] = v47;
    v50[6] = v0 + 136;
    v50[7] = v48;
    v51 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 456) = v51;
    *v51 = v0;
    v51[1] = sub_2392216B4;
    return sub_23922CDD8();
  }
}

uint64_t sub_2392268FC(uint64_t a1, void *a2, uint64_t a3, CFTimeInterval a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __IOHIDDevice *v16;
  const __CFDictionary *v17;
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = a7;
  v12 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F780);
  (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(a2, a1, v15);
  v16 = *(__IOHIDDevice **)(a3 + 296);
  type metadata accessor for IOHIDElement();
  type metadata accessor for IOHIDValue(0);
  sub_2391F66EC(&qword_25691F6F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393B0);
  swift_bridgeObjectRetain();
  v17 = (const __CFDictionary *)sub_23922CA00();
  swift_bridgeObjectRelease();
  v18 = IOHIDDeviceSetValueMultipleWithCallback(v16, v17, a4, (IOHIDValueMultipleCallback)sub_239226B0C, a2);

  sub_239217BBC(v18, (uint64_t)&v25);
  if ((v25 & 0x10000000000) != 0)
  {
    sub_23922796C(v24, (uint64_t)v14, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = *a6;
    *a6 = 0x8000000000000000;
    sub_2392293D8(0, 0, (uint64_t)v14, isUniquelyReferenced_nonNull_native);
    *a6 = v25;
    swift_bridgeObjectRelease();
    return sub_2392279B0((uint64_t)v14, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  }
  else
  {
    v21 = v25 | ((unint64_t)BYTE4(v25) << 32);
    sub_2391F7504();
    v22 = swift_allocError();
    *(_DWORD *)v23 = v21;
    *(_BYTE *)(v23 + 4) = BYTE4(v21) & 1;
    v25 = v22;
    return sub_23922CAFC();
  }
}

uint64_t sub_239226B0C(uint64_t a1, uint64_t a2)
{
  return sub_2391F5088(a1, a2);
}

void sub_239226B20(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;

  v6 = a4;
  sub_23922C308(a1, a2);

}

uint64_t sub_239226B64@<X0>(void *a1@<X0>, __IOHIDValue *a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  id v11;
  uint64_t result;
  uint8_t *BytePtr;
  CFIndex Length;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t TimeStamp;
  _OWORD v19[6];
  _OWORD v20[2];
  _BYTE v21[128];
  _BYTE v22[128];
  _OWORD v23[6];
  _OWORD v24[2];

  v8 = sub_23922CCC4();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (unint64_t *)((char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = a1;
  swift_retain();
  sub_2391EB5D0(v11, a3, (uint64_t)v21);
  sub_23922C2C0((uint64_t)v21, (uint64_t)v22);
  sub_23922C2C0((uint64_t)v22, (uint64_t)v23);
  result = sub_2391F0098((uint64_t)v23);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v19[4] = v23[4];
    v19[5] = v23[5];
    v20[0] = v24[0];
    *(_OWORD *)((char *)v20 + 9) = *(_OWORD *)((char *)v24 + 9);
    v19[0] = v23[0];
    v19[1] = v23[1];
    v19[2] = v23[2];
    v19[3] = v23[3];
    BytePtr = (uint8_t *)IOHIDValueGetBytePtr(a2);
    Length = IOHIDValueGetLength(a2);
    v15 = sub_23922A1CC(BytePtr, Length);
    v17 = v16;
    TimeStamp = IOHIDValueGetTimeStamp(a2);
    sub_239217EF8(TimeStamp, v10);
    return HIDElement.Value.init(element:fromBytes:timestamp:)(v19, v15, v17, (uint64_t)v10, a4);
  }
  return result;
}

uint64_t HIDDeviceClient.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t static HIDDeviceClient.== infix(_:_:)()
{
  type metadata accessor for IOHIDDevice(0);
  sub_2391F66EC(&qword_25691FE78, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239418);
  return sub_23922C9A0() & 1;
}

uint64_t sub_239226D2C()
{
  type metadata accessor for IOHIDDevice(0);
  sub_2391F66EC(&qword_25691FE78, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239418);
  return sub_23922C9A0() & 1;
}

void HIDDeviceClient.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 296);
  type metadata accessor for IOHIDDevice(0);
  sub_2391F66EC(&qword_25691FE78, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239418);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t HIDDeviceClient.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_23922CE38();
  v1 = *(void **)(v0 + 296);
  type metadata accessor for IOHIDDevice(0);
  sub_2391F66EC(&qword_25691FE78, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239418);
  v2 = v1;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t sub_239226EB4()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *v0;
  sub_23922CE38();
  v2 = *(void **)(v1 + 296);
  type metadata accessor for IOHIDDevice(0);
  sub_2391F66EC(&qword_25691FE78, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239418);
  v3 = v2;
  sub_23922C9AC();

  return sub_23922CE74();
}

void sub_239226F48()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)v0 + 296);
  type metadata accessor for IOHIDDevice(0);
  sub_2391F66EC(&qword_25691FE78, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239418);
  v2 = v1;
  sub_23922C9AC();

}

uint64_t sub_239226FD0()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *v0;
  sub_23922CE38();
  v2 = *(void **)(v1 + 296);
  type metadata accessor for IOHIDDevice(0);
  sub_2391F66EC(&qword_25691FE78, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239418);
  v3 = v2;
  sub_23922C9AC();

  return sub_23922CE74();
}

uint64_t HIDDeviceClient.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 312);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23922708C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 312);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceClient.DeviceReference.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F6F8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23922D6C0;
  v3 = MEMORY[0x24BEE45B8];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE4568];
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 32) = v1;
  return sub_23922CA78();
}

uint64_t sub_239227130()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25691F6F8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23922D6C0;
  v3 = MEMORY[0x24BEE45B8];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE4568];
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 32) = v1;
  return sub_23922CA78();
}

uint64_t sub_2392271A4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2392271B4(uint64_t a1)
{
  MEMORY[0x23B8397A4](&unk_239239418, a1);
  return sub_23922C9B8();
}

uint64_t sub_2392271F0()
{
  MEMORY[0x23B8397A4](&unk_239239418);
  return sub_23922C9AC();
}

uint64_t sub_239227238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_239227244(a1, a2, a3, (uint64_t)&unk_239239418);
}

uint64_t sub_239227244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23922CE38();
  MEMORY[0x23B8397A4](a4, a2);
  sub_23922C9AC();
  return sub_23922CE74();
}

uint64_t sub_2392272A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x23B8397A4](&unk_239239418, a3);
  return sub_23922C9A0();
}

unint64_t sub_2392272F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23922CE38();
  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v2 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0) + 20));
  v3 = *(_QWORD *)(v2 + 16);
  sub_23922CE44();
  if (v3)
  {
    v4 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
    v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    sub_2391F66EC(&qword_25691FE40, 255, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_23922CA24();
      v5 += v6;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  v7 = sub_23922CE74();
  return sub_239227A30(a1, v7);
}

void *sub_239227424(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[72];

  sub_23922CE38();
  sub_23922CCC4();
  sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
  sub_23922CA24();
  v2 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0) + 20));
  swift_bridgeObjectRetain();
  sub_239229B94((uint64_t)v5, v2);
  swift_bridgeObjectRelease();
  sub_23922CE50();
  v3 = sub_23922CE74();
  return sub_239227CD4(a1, v3);
}

unint64_t sub_2392274F0(uint64_t a1)
{
  uint64_t v2;

  sub_23922CE38();
  type metadata accessor for IOHIDElement();
  sub_2391F66EC(&qword_25691F5D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
  sub_23922C9AC();
  v2 = sub_23922CE74();
  return sub_239227EE8(a1, v2);
}

char *sub_23922757C(char *result, int64_t a2, char a3, char *a4)
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
  size_t v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256920668);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 6 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_239227680(size_t result, int64_t a2, char a3, _QWORD *a4)
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569205E0);
  v10 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
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
  v15 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
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

_QWORD *sub_2392277F4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDD0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25691FDE0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_239227914()
{
  unint64_t result;

  result = qword_25691FDE8;
  if (!qword_25691FDE8)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDDeviceError, &type metadata for HIDDeviceError);
    atomic_store(result, (unint64_t *)&qword_25691FDE8);
  }
  return result;
}

uint64_t type metadata accessor for HIDDeviceClient.Notification(uint64_t a1)
{
  return sub_23922B7E4(a1, (uint64_t *)&unk_256924EB0);
}

uint64_t sub_23922796C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2392279B0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2392279EC()
{
  unint64_t result;

  result = qword_25691FE08;
  if (!qword_25691FE08)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDReportID, &type metadata for HIDReportID);
    atomic_store(result, (unint64_t *)&qword_25691FE08);
  }
  return result;
}

unint64_t sub_239227A30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v30 = a1;
  v33 = type metadata accessor for HIDElement.Value();
  v23 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - v7;
  v24 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  MEMORY[0x24BDAC7A8](v24);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v2;
  v12 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v12;
  v26 = v2 + 64;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v25 = ~v12;
    v27 = *(_QWORD *)(v9 + 72);
    v29 = v11;
    while (1)
    {
      v14 = *(_QWORD *)(v28 + 48);
      v31 = result;
      sub_23922796C(v14 + result * v27, (uint64_t)v11, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      if ((sub_23922CCB8() & 1) != 0)
      {
        v15 = *(int *)(v24 + 20);
        v16 = *(_QWORD *)&v29[v15];
        v17 = *(_QWORD *)(v30 + v15);
        v18 = *(_QWORD *)(v16 + 16);
        if (v18 == *(_QWORD *)(v17 + 16))
          break;
      }
LABEL_3:
      v11 = v29;
      sub_2392279B0((uint64_t)v29, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      result = (v31 + 1) & v25;
      if (((*(_QWORD *)(v26 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) == 0)
        return result;
    }
    if (!v18 || v16 == v17)
    {
LABEL_12:
      sub_2392279B0((uint64_t)v29, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      return v31;
    }
    else
    {
      v19 = 0;
      v20 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
      v32 = *(_QWORD *)(v23 + 72);
      while (1)
      {
        result = sub_23922796C(v16 + v20, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        if (v19 >= *(_QWORD *)(v17 + 16))
          break;
        sub_23922796C(v17 + v20, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        sub_2391F66EC(&qword_25691F650, 255, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
        v21 = sub_23922CA60();
        sub_2392279B0((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        sub_2392279B0((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
        if ((v21 & 1) == 0)
          goto LABEL_3;
        ++v19;
        v20 += v32;
        if (v18 == v19)
          goto LABEL_12;
      }
      __break(1u);
    }
  }
  return result;
}

void *sub_239227CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  char *v17;
  char *v18;
  void *result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a1;
  v21 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v2 + 64;
  v25 = v2;
  v7 = -1 << *(_BYTE *)(v2 + 32);
  v8 = a2 & ~v7;
  if (((*(_QWORD *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
    return (void *)v8;
  v22 = ~v7;
  v23 = *(_QWORD *)(v4 + 72);
  v9 = type metadata accessor for HIDDeviceClient.RequestElementUpdate;
  while (1)
  {
    v10 = v9;
    sub_23922796C(*(_QWORD *)(v25 + 48) + v8 * v23, (uint64_t)v6, v9);
    if ((sub_23922CCB8() & 1) == 0)
      goto LABEL_4;
    v11 = *(int *)(v21 + 20);
    v12 = *(_QWORD *)&v6[v11];
    v13 = *(_QWORD *)(v26 + v11);
    v14 = *(_QWORD *)(v12 + 16);
    if (v14 != *(_QWORD *)(v13 + 16))
      goto LABEL_4;
    if (v14 && v12 != v13)
      break;
LABEL_3:
    if (v6[*(int *)(v21 + 24)] == *(_BYTE *)(v26 + *(int *)(v21 + 24)))
    {
      sub_2392279B0((uint64_t)v6, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      return (void *)v8;
    }
LABEL_4:
    v9 = v10;
    sub_2392279B0((uint64_t)v6, v10);
    v8 = (v8 + 1) & v22;
    if (((*(_QWORD *)(v24 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
      return (void *)v8;
  }
  v16 = 0;
  v17 = (char *)(v12 + 32);
  v18 = (char *)(v13 + 32);
  while (1)
  {
    result = memmove(&v28, v17, 0x79uLL);
    if (v16 >= *(_QWORD *)(v13 + 16))
      break;
    memmove(&v27, v18, 0x79uLL);
    sub_2391F1638();
    if ((sub_23922CA60() & 1) == 0)
      goto LABEL_4;
    ++v16;
    v17 += 128;
    v18 += 128;
    if (v14 == v16)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

unint64_t sub_239227EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for IOHIDElement();
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_2391F66EC(&qword_25691F5D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
    v7 = v6;
    v8 = sub_23922C9A0();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_23922C9A0();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

void sub_23922802C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23922CD78();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B838EE0);
}

uint64_t sub_239228094(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569205C0);
    v2 = sub_23922CD9C();
    v17 = v2;
    sub_23922CCF4();
    if (sub_23922CD60())
    {
      type metadata accessor for IOHIDElement();
      do
      {
        swift_dynamicCast();
        type metadata accessor for IOHIDValue(0);
        swift_dynamicCast();
        v2 = v17;
        v10 = *(_QWORD *)(v17 + 16);
        if (*(_QWORD *)(v17 + 24) <= v10)
        {
          sub_239228D0C(v10 + 1, 1);
          v2 = v17;
        }
        sub_23922CE38();
        sub_2391F66EC(&qword_25691F5D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
        sub_23922C9AC();
        result = sub_23922CE74();
        v4 = v2 + 64;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 64 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 64 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v11 = 0;
          v12 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v12 && (v11 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v13 = v7 == v12;
            if (v7 == v12)
              v7 = 0;
            v11 |= v13;
            v14 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v14 == -1);
          v8 = __clz(__rbit64(~v14)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        v9 = 8 * v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v9) = v16;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v9) = v15;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_23922CD60());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_239228300(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  int64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _OWORD v68[2];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _OWORD v75[2];

  v3 = v2;
  v61 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  v54 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569205C8);
  v55 = a2;
  v8 = sub_23922CD90();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v51 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v49 = v3;
    v50 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    v52 = v7;
    v53 = v9;
    while (1)
    {
      if (v13)
      {
        v59 = (v13 - 1) & v13;
        v20 = __clz(__rbit64(v13)) | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          return result;
        }
        if (v21 >= v50)
          goto LABEL_39;
        v22 = v51[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v50)
            goto LABEL_39;
          v22 = v51[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v50)
            {
LABEL_39:
              swift_release();
              v3 = v49;
              if ((v55 & 1) != 0)
              {
                v48 = 1 << *(_BYTE *)(v7 + 32);
                if (v48 >= 64)
                  bzero(v51, ((unint64_t)(v48 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v51 = -1 << v48;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v51[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_46;
                if (v16 >= v50)
                  goto LABEL_39;
                v22 = v51[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v59 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v54 + 72);
      v25 = *(_QWORD *)(v7 + 48) + v24 * v20;
      v26 = 16 * v20;
      v60 = v16;
      v58 = v24;
      v27 = v61;
      if ((v55 & 1) != 0)
      {
        sub_23922A824(v25, (uint64_t)v6, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        v28 = v7;
        v29 = *(_QWORD *)(v7 + 56) + v26;
        v57 = *(id *)v29;
        v56 = *(unsigned __int8 *)(v29 + 8);
      }
      else
      {
        sub_23922796C(v25, (uint64_t)v6, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        v28 = v7;
        v30 = *(_QWORD *)(v7 + 56) + v26;
        v31 = *(unsigned __int8 *)(v30 + 8);
        v57 = *(id *)v30;
        v56 = v31;
        sub_23922A874(v57, v31);
      }
      sub_23922CE38();
      sub_23922CCC4();
      sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
      sub_23922CA24();
      v32 = *(int *)(v27 + 20);
      v33 = (uint64_t)v6;
      v34 = *(_QWORD *)&v6[v32];
      sub_23922CE44();
      v35 = *(_QWORD *)(v34 + 16);
      v7 = v28;
      if (v35)
      {
        sub_23922C264();
        swift_bridgeObjectRetain();
        v36 = v35 - 1;
        for (i = 32; ; i += 128)
        {
          *(_OWORD *)((char *)v75 + 9) = *(_OWORD *)(v34 + i + 105);
          v38 = *(_OWORD *)(v34 + i + 96);
          v74 = *(_OWORD *)(v34 + i + 80);
          v75[0] = v38;
          v39 = *(_OWORD *)(v34 + i + 64);
          v72 = *(_OWORD *)(v34 + i + 48);
          v73 = v39;
          v40 = *(_OWORD *)(v34 + i + 16);
          v69 = *(_OWORD *)(v34 + i);
          v70 = v40;
          v71 = *(_OWORD *)(v34 + i + 32);
          v66 = v39;
          v67 = v74;
          v68[0] = v75[0];
          *(_OWORD *)((char *)v68 + 9) = *(_OWORD *)((char *)v75 + 9);
          v62 = v69;
          v63 = v40;
          v64 = v71;
          v65 = v72;
          sub_23922CA24();
          if (!v36)
            break;
          --v36;
        }
        swift_bridgeObjectRelease();
        v7 = v52;
        v9 = v53;
      }
      v6 = (char *)v33;
      sub_23922CE50();
      result = sub_23922CE74();
      v41 = -1 << *(_BYTE *)(v9 + 32);
      v42 = result & ~v41;
      v43 = v42 >> 6;
      if (((-1 << v42) & ~*(_QWORD *)(v14 + 8 * (v42 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v42) & ~*(_QWORD *)(v14 + 8 * (v42 >> 6)))) | v42 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v44 = 0;
        v45 = (unint64_t)(63 - v41) >> 6;
        do
        {
          if (++v43 == v45 && (v44 & 1) != 0)
          {
            __break(1u);
            goto LABEL_45;
          }
          v46 = v43 == v45;
          if (v43 == v45)
            v43 = 0;
          v44 |= v46;
          v47 = *(_QWORD *)(v14 + 8 * v43);
        }
        while (v47 == -1);
        v17 = __clz(__rbit64(~v47)) + (v43 << 6);
      }
      v18 = v58;
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      result = sub_23922A824(v33, *(_QWORD *)(v9 + 48) + v17 * v18, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      v19 = *(_QWORD *)(v9 + 56) + 16 * v17;
      *(_QWORD *)v19 = v57;
      *(_BYTE *)(v19 + 8) = v56;
      ++*(_QWORD *)(v9 + 16);
      v13 = v59;
      v16 = v60;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_2392287E4(uint64_t a1, int a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  char v42;
  unint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  int64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int64_t v58;
  int v59;
  id v60;
  uint64_t v61;
  uint64_t v62;

  v3 = v2;
  v5 = type metadata accessor for HIDElement.Value();
  v51 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  v55 = *(_QWORD *)(v8 - 8);
  v56 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569205E8);
  v57 = a2;
  v12 = sub_23922CD90();
  v13 = (_QWORD *)v12;
  if (*(_QWORD *)(v11 + 16))
  {
    v47 = v3;
    v14 = 1 << *(_BYTE *)(v11 + 32);
    v15 = *(_QWORD *)(v11 + 64);
    v49 = (_QWORD *)(v11 + 64);
    if (v14 < 64)
      v16 = ~(-1 << v14);
    else
      v16 = -1;
    v17 = v16 & v15;
    v48 = (unint64_t)(v14 + 63) >> 6;
    v18 = v12 + 64;
    result = swift_retain();
    v20 = 0;
    v21 = v11;
    v52 = v11;
    v53 = v10;
    v54 = v13;
    v50 = v18;
    while (1)
    {
      if (v17)
      {
        v62 = (v17 - 1) & v17;
        v25 = __clz(__rbit64(v17)) | (v20 << 6);
      }
      else
      {
        v26 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
          return result;
        }
        if (v26 >= v48)
          goto LABEL_38;
        v27 = v49[v26];
        ++v20;
        if (!v27)
        {
          v20 = v26 + 1;
          if (v26 + 1 >= v48)
            goto LABEL_38;
          v27 = v49[v20];
          if (!v27)
          {
            v28 = v26 + 2;
            if (v28 >= v48)
            {
LABEL_38:
              swift_release();
              v3 = v47;
              if ((v57 & 1) != 0)
              {
                v46 = 1 << *(_BYTE *)(v52 + 32);
                if (v46 >= 64)
                  bzero(v49, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v49 = -1 << v46;
                *(_QWORD *)(v52 + 16) = 0;
              }
              break;
            }
            v27 = v49[v28];
            if (!v27)
            {
              while (1)
              {
                v20 = v28 + 1;
                if (__OFADD__(v28, 1))
                  goto LABEL_47;
                if (v20 >= v48)
                  goto LABEL_38;
                v27 = v49[v20];
                ++v28;
                if (v27)
                  goto LABEL_21;
              }
            }
            v20 = v28;
          }
        }
LABEL_21:
        v62 = (v27 - 1) & v27;
        v25 = __clz(__rbit64(v27)) + (v20 << 6);
      }
      v29 = *(_QWORD *)(v21 + 48) + *(_QWORD *)(v55 + 72) * v25;
      v30 = 16 * v25;
      v61 = *(_QWORD *)(v55 + 72);
      if ((v57 & 1) != 0)
      {
        sub_23922A824(v29, (uint64_t)v10, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
        v31 = *(_QWORD *)(v21 + 56) + v30;
        v60 = *(id *)v31;
        v59 = *(unsigned __int8 *)(v31 + 8);
      }
      else
      {
        sub_23922796C(v29, (uint64_t)v10, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
        v32 = *(_QWORD *)(v21 + 56) + v30;
        v33 = *(unsigned __int8 *)(v32 + 8);
        v60 = *(id *)v32;
        v59 = v33;
        sub_23922A868(v60, v33);
      }
      sub_23922CE38();
      sub_23922CCC4();
      sub_2391F66EC(&qword_25691F5F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E70], MEMORY[0x24BEE6E80]);
      sub_23922CA24();
      v34 = *(_QWORD *)&v10[*(int *)(v56 + 20)];
      sub_23922CE44();
      v35 = *(_QWORD *)(v34 + 16);
      if (v35)
      {
        v58 = v20;
        v36 = v51;
        v37 = v34 + ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80));
        swift_bridgeObjectRetain();
        v38 = *(_QWORD *)(v36 + 72);
        do
        {
          sub_23922796C(v37, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
          sub_2391F66EC(&qword_25691FE40, 255, (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value, (uint64_t)&protocol conformance descriptor for HIDElement.Value);
          sub_23922CA24();
          sub_2392279B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
          v37 += v38;
          --v35;
        }
        while (v35);
        swift_bridgeObjectRelease();
        v21 = v52;
        v18 = v50;
        v20 = v58;
      }
      result = sub_23922CE74();
      v13 = v54;
      v39 = -1 << *((_BYTE *)v54 + 32);
      v40 = result & ~v39;
      v41 = v40 >> 6;
      if (((-1 << v40) & ~*(_QWORD *)(v18 + 8 * (v40 >> 6))) != 0)
      {
        v22 = __clz(__rbit64((-1 << v40) & ~*(_QWORD *)(v18 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
        v10 = v53;
      }
      else
      {
        v42 = 0;
        v43 = (unint64_t)(63 - v39) >> 6;
        v10 = v53;
        do
        {
          if (++v41 == v43 && (v42 & 1) != 0)
          {
            __break(1u);
            goto LABEL_46;
          }
          v44 = v41 == v43;
          if (v41 == v43)
            v41 = 0;
          v42 |= v44;
          v45 = *(_QWORD *)(v18 + 8 * v41);
        }
        while (v45 == -1);
        v22 = __clz(__rbit64(~v45)) + (v41 << 6);
      }
      v23 = v61;
      *(_QWORD *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      result = sub_23922A824((uint64_t)v10, v13[6] + v22 * v23, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      v24 = v13[7] + 16 * v22;
      *(_QWORD *)v24 = v60;
      *(_BYTE *)(v24 + 8) = v59;
      ++v13[2];
      v17 = v62;
    }
  }
  result = swift_release();
  *v3 = v13;
  return result;
}

uint64_t sub_239228D0C(uint64_t a1, char a2)
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
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569205C0);
  v6 = sub_23922CD90();
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
          if ((a2 & 1) == 0)
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
    v29 = 8 * v20;
    v30 = *(void **)(*(_QWORD *)(v5 + 48) + v29);
    v31 = *(void **)(*(_QWORD *)(v5 + 56) + v29);
    if ((a2 & 1) == 0)
    {
      v32 = v30;
      v33 = v31;
    }
    sub_23922CE38();
    type metadata accessor for IOHIDElement();
    sub_2391F66EC(&qword_25691F5D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
    sub_23922C9AC();
    result = sub_23922CE74();
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
    v18 = 8 * v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v31;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_239229038(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_23922CC34();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(void **)(*(_QWORD *)(a2 + 48) + 8 * v6);
        sub_23922CE38();
        type metadata accessor for IOHIDElement();
        sub_2391F66EC(&qword_25691F5D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393F0);
        v11 = v10;
        sub_23922C9AC();
        v12 = sub_23922CE74();

        v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 < v9)
            goto LABEL_5;
        }
        else if (v13 >= v9)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v22 = *v20;
    v21 = (-1 << a1) - 1;
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
}

void sub_239229244(uint64_t a1, char a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  char v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = (_QWORD **)v4;
  v10 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = (unint64_t)sub_239227424(a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
    goto LABEL_9;
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_23922961C(type metadata accessor for HIDDeviceClient.RequestElementUpdate, &qword_2569205C8, (uint64_t (*)(uint64_t, uint64_t))sub_23922A874);
    goto LABEL_9;
  }
  sub_239228300(v18, a4 & 1);
  v21 = sub_239227424(a3);
  if ((v19 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_23922CDF0();
    __break(1u);
    return;
  }
  v15 = (unint64_t)v21;
LABEL_9:
  v23 = a2 & 1;
  v24 = *v5;
  if ((v19 & 1) != 0)
  {
    v25 = v24[7] + 16 * v15;
    sub_23922AD78(*(id *)v25, *(_BYTE *)(v25 + 8));
    *(_QWORD *)v25 = a1;
    *(_BYTE *)(v25 + 8) = v23 != 0;
  }
  else
  {
    sub_23922796C(a3, (uint64_t)v12, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    sub_23922956C(v15, (uint64_t)v12, a1, v23, v24, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  }
}

void sub_2392293D8(uint64_t a1, char a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = (_QWORD **)v4;
  v10 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = sub_2392272F0(a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
    goto LABEL_9;
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_23922961C(type metadata accessor for HIDDeviceClient.ProvideElementUpdate, &qword_2569205E8, (uint64_t (*)(uint64_t, uint64_t))sub_23922A868);
    goto LABEL_9;
  }
  sub_2392287E4(v18, a4 & 1);
  v21 = sub_2392272F0(a3);
  if ((v19 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_23922CDF0();
    __break(1u);
    return;
  }
  v15 = v21;
LABEL_9:
  v23 = a2 & 1;
  v24 = *v5;
  if ((v19 & 1) != 0)
  {
    v25 = v24[7] + 16 * v15;
    sub_23922C484(*(id *)v25, *(_BYTE *)(v25 + 8));
    *(_QWORD *)v25 = a1;
    *(_BYTE *)(v25 + 8) = v23 != 0;
  }
  else
  {
    sub_23922796C(a3, (uint64_t)v12, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    sub_23922956C(v15, (uint64_t)v12, a1, v23, v24, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  }
}

uint64_t sub_23922956C(unint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, uint64_t (*a6)(_QWORD))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v12 = a5[6];
  v13 = a6(0);
  result = sub_23922A824(a2, v12 + *(_QWORD *)(*(_QWORD *)(v13 - 8) + 72) * a1, a6);
  v15 = a5[7] + 16 * a1;
  *(_QWORD *)v15 = a3;
  *(_BYTE *)(v15 + 8) = a4 & 1;
  v16 = a5[2];
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    a5[2] = v18;
  return result;
}

void *sub_23922961C(uint64_t (*a1)(_QWORD), uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *result;
  unint64_t v14;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);

  v36 = a3;
  v6 = a1(0);
  v35 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v31 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v32 = v3;
  v9 = *v3;
  v10 = sub_23922CD84();
  v11 = v10;
  v12 = *(_QWORD *)(v9 + 16);
  if (!v12)
  {
LABEL_26:
    result = (void *)swift_release();
    *v32 = v11;
    return result;
  }
  result = (void *)(v10 + 64);
  v14 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 64 + 8 * v14)
  {
    result = memmove(result, (const void *)(v9 + 64), 8 * v14);
    v12 = *(_QWORD *)(v9 + 16);
  }
  v16 = 0;
  *(_QWORD *)(v11 + 16) = v12;
  v17 = 1 << *(_BYTE *)(v9 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(v9 + 64);
  v33 = v9 + 64;
  v34 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      v20 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v21 = v20 | (v16 << 6);
      goto LABEL_12;
    }
    v28 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v34)
      goto LABEL_26;
    v29 = *(_QWORD *)(v33 + 8 * v28);
    ++v16;
    if (!v29)
    {
      v16 = v28 + 1;
      if (v28 + 1 >= v34)
        goto LABEL_26;
      v29 = *(_QWORD *)(v33 + 8 * v16);
      if (!v29)
        break;
    }
LABEL_25:
    v19 = (v29 - 1) & v29;
    v21 = __clz(__rbit64(v29)) + (v16 << 6);
LABEL_12:
    v22 = *(_QWORD *)(v35 + 72) * v21;
    sub_23922796C(*(_QWORD *)(v9 + 48) + v22, (uint64_t)v8, a1);
    v23 = 16 * v21;
    v24 = *(_QWORD *)(v9 + 56) + 16 * v21;
    v25 = *(_QWORD *)v24;
    v26 = *(unsigned __int8 *)(v24 + 8);
    sub_23922A824((uint64_t)v8, *(_QWORD *)(v11 + 48) + v22, a1);
    v27 = *(_QWORD *)(v11 + 56) + v23;
    *(_QWORD *)v27 = v25;
    *(_BYTE *)(v27 + 8) = v26;
    result = (void *)v36(v25, v26);
  }
  v30 = v28 + 2;
  if (v30 >= v34)
    goto LABEL_26;
  v29 = *(_QWORD *)(v33 + 8 * v30);
  if (v29)
  {
    v16 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v16 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v16 >= v34)
      goto LABEL_26;
    v29 = *(_QWORD *)(v33 + 8 * v16);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_239229860()
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569205C0);
  v2 = *v0;
  v3 = sub_23922CD84();
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
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
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

size_t sub_239229A04(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_239229A20(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t sub_239229A20(size_t result, int64_t a2, char a3, _QWORD *a4)
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569205E0);
  v10 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
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
  v15 = *(_QWORD *)(type metadata accessor for HIDElement.Value() - 8);
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

uint64_t sub_239229B94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23922CE44();
  if (v3)
  {
    v5 = a2 + 32;
    sub_23922C264();
    do
    {
      result = sub_23922CA24();
      v5 += 128;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_239229C3C(uint64_t a1)
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
    return sub_23922CCE8();
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

void sub_239229CFC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
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
        sub_23922CC40();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_23922CD18() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_23922CD24();
  sub_23922C2B4(a1, a2, 1);
  type metadata accessor for IOHIDElement();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_2392274F0((uint64_t)v8);
  v7 = v6;

  if ((v7 & 1) != 0)
  {
    sub_23922CD00();
    sub_23922CD3C();
    sub_23922C2A8(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_239229E88(_QWORD *a1, uint64_t a2, int a3, char a4, uint64_t a5)
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
      sub_23922CD48();
      type metadata accessor for IOHIDElement();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      type metadata accessor for IOHIDValue(0);
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
    if (sub_23922CD18() == *(_DWORD *)(a5 + 36))
    {
      sub_23922CD24();
      type metadata accessor for IOHIDElement();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      v6 = sub_2392274F0((uint64_t)v13);
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

uint64_t sub_23922A084(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  dispatch_semaphore_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAA0);
  result = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 && (a2 | 0x10) == 0xE0000110 && (a3 & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HIDDeviceClient.Context();
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = a1;
      v11 = dispatch_semaphore_create(0);
      v12 = sub_23922CB20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = 0;
      *(_QWORD *)(v13 + 24) = 0;
      *(_QWORD *)(v13 + 32) = v10;
      *(_DWORD *)(v13 + 40) = a2;
      *(_DWORD *)(v13 + 44) = -536870656;
      *(_QWORD *)(v13 + 48) = v11;
      swift_retain();
      v14 = v11;
      sub_2391F46B4((uint64_t)v9, (uint64_t)&unk_256920650, v13);
      swift_release();
      sub_23922CB80();

      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23922A1CC(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_2391F76D8(__src, &__src[a2]);
  sub_23922C8EC();
  swift_allocObject();
  sub_23922C8B0();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_23922C94C();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_23922A278(uint64_t a1, int a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  dispatch_semaphore_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAA0);
  result = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    type metadata accessor for HIDDeviceClient.Context();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a1;
    v15 = dispatch_semaphore_create(0);
    v16 = sub_23922A1CC(a3, a4);
    v18 = v17;
    v19 = sub_23922CB20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 1, 1, v19);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = 0;
    *(_QWORD *)(v20 + 24) = 0;
    *(_QWORD *)(v20 + 32) = v14;
    *(_DWORD *)(v20 + 40) = a2;
    *(_QWORD *)(v20 + 48) = v16;
    *(_QWORD *)(v20 + 56) = v18;
    *(_QWORD *)(v20 + 64) = a5;
    *(_QWORD *)(v20 + 72) = v15;
    swift_retain();
    sub_2391F0C34(v16, v18);
    v21 = v15;
    sub_2391F46B4((uint64_t)v13, (uint64_t)&unk_256920630, v20);
    swift_release();
    sub_23922CB80();
    sub_2391F0C78(v16, v18);

    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23922A3D8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FAA0);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    type metadata accessor for HIDDeviceClient.Context();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a1;
    v9 = dispatch_semaphore_create(0);
    v18 = a2;
    type metadata accessor for IOHIDValue(0);
    v11 = v10;
    v12 = a2;
    sub_239217FFC((uint64_t)&v18, v11, (uint64_t)&v19);
    v13 = v19;
    v14 = sub_23922CB20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 1, 1, v14);
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v8;
    v15[5] = v13;
    v15[6] = v9;
    swift_retain();
    v16 = v13;
    v17 = v9;
    sub_2391F46B4((uint64_t)v7, (uint64_t)&unk_256920620, (uint64_t)v15);
    swift_release();
    sub_23922CB80();

    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23922A52C(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x23B838ED4](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2)
          return v5;
      }
      else if (*(_QWORD *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1))
        break;
      if (++v5 == v4)
        return 0;
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    v4 = sub_23922CD78();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_23922A618(uint64_t a1)
{
  uint64_t *v1;

  return sub_23921DA84(a1, v1[2], v1[3], v1[4]);
}

void sub_23922A624(uint64_t a1)
{
  uint64_t v1;

  sub_23921E59C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_BYTE *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_23922A66C(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  CFIndex *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  __IOHIDDevice *v12;
  IOHIDReportType v13;
  CFIndex v14;
  uint64_t ReportWithCallback;
  uint64_t result;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint8_t *report;
  uint64_t v23;

  v3 = *(void **)(v1 + 16);
  v4 = *(CFIndex **)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(_BYTE *)(v1 + 56);
  v7 = *(_BYTE *)(v1 + 57);
  v20 = *(unsigned __int8 *)(v1 + 59);
  v21 = *(unsigned __int8 *)(v1 + 58);
  report = *(uint8_t **)(v1 + 64);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE38);
  (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v3, a1, v8);
  *v4 = *(_QWORD *)(v5 + 328);
  v9 = 0.0;
  if ((v6 & 1) == 0)
  {
    v10 = (double)sub_23922CE98() * 1000.0;
    sub_23922CE98();
    v9 = v10 + (double)v11 / 1000000.0;
  }
  v12 = *(__IOHIDDevice **)(v5 + 296);
  LOBYTE(v23) = v7;
  v13 = sub_2391F19F4((unsigned __int8 *)&v23);
  if (v20)
    v14 = 0;
  else
    v14 = v21;
  ReportWithCallback = IOHIDDeviceGetReportWithCallback(v12, v13, v14, report, v4, v9, (IOHIDReportCallback)sub_23921EDD4, v3);
  result = sub_239217BBC(ReportWithCallback, (uint64_t)&v23);
  if ((v23 & 0x10000000000) == 0)
  {
    v17 = v23 | ((unint64_t)BYTE4(v23) << 32);
    sub_2391F7504();
    v18 = swift_allocError();
    *(_DWORD *)v19 = v17;
    *(_BYTE *)(v19 + 4) = BYTE4(v17) & 1;
    v23 = v18;
    return sub_23922CAFC();
  }
  return result;
}

uint64_t type metadata accessor for HIDDeviceClient.ProvideElementUpdate(uint64_t a1)
{
  return sub_23922B7E4(a1, (uint64_t *)&unk_256924ED0);
}

uint64_t type metadata accessor for HIDDeviceClient.RequestElementUpdate(uint64_t a1)
{
  return sub_23922B7E4(a1, qword_256924EE0);
}

uint64_t sub_23922A824(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_23922A868(id result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

id sub_23922A874(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

uint64_t sub_23922A880(uint64_t a1)
{
  double *v1;
  void *v3;
  uint64_t v4;
  CFDictionaryRef *v5;
  CFTimeInterval v6;
  uint64_t v7;
  __IOHIDDevice *v8;
  const __CFArray *v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int8 v15;
  char v16;

  v3 = (void *)*((_QWORD *)v1 + 2);
  v4 = *((_QWORD *)v1 + 3);
  v5 = (CFDictionaryRef *)*((_QWORD *)v1 + 5);
  v6 = v1[6];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE68);
  (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v3, a1, v7);
  v8 = *(__IOHIDDevice **)(v4 + 296);
  type metadata accessor for IOHIDElement();
  v9 = (const __CFArray *)sub_23922CAB4();
  v10 = IOHIDDeviceCopyValueMultipleWithCallback(v8, v9, v5, v6, (IOHIDValueMultipleCallback)sub_239226B20, v3);

  result = sub_239217BBC(v10, (uint64_t)&v14);
  if ((v16 & 1) == 0)
  {
    v12 = v14 | ((unint64_t)v15 << 32);
    sub_2391F7504();
    swift_allocError();
    *(_DWORD *)v13 = v12;
    *(_BYTE *)(v13 + 4) = BYTE4(v12) & 1;
    return sub_23922CAFC();
  }
  return result;
}

uint64_t sub_23922A998@<X0>(void *a1@<X0>, __IOHIDValue *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_239226B64(a1, a2, v3, a3);
}

void sub_23922A9A0(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE38);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, double))(v9 + 16))(v12, a1, v8, v10);
    sub_239217BBC(a2, (uint64_t)v17);
    if ((v17[0] & 0x10000000000) != 0)
    {
      v17[0] = sub_23922A1CC(a3, a4);
      v17[1] = v13;
      sub_23922CB08();
    }
    else
    {
      v14 = LODWORD(v17[0]) | ((unint64_t)BYTE4(v17[0]) << 32);
      sub_2391F7504();
      v15 = swift_allocError();
      *(_DWORD *)v16 = v14;
      *(_BYTE *)(v16 + 4) = BYTE4(v14) & 1;
      v17[0] = v15;
      sub_23922CAFC();
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23922AAC8(uint64_t a1, void (*a2)(void), uint64_t a3)
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
  v4 = type metadata accessor for HIDElement.Value();
  v31 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v7 = sub_23922CD30();
  else
    v7 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v38 = MEMORY[0x24BEE4AF8];
    sub_239229A04(0, v7 & ~(v7 >> 63), 0);
    result = sub_239229C3C(a1);
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
          sub_239229E88(v34, v35, v36, v37, a1);
          v23 = v22;
          v24 = (void *)v34[0];
          v32();

          v25 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_239229A04(0, *(_QWORD *)(v25 + 16) + 1, 1);
            v25 = v38;
          }
          v27 = *(_QWORD *)(v25 + 16);
          v26 = *(_QWORD *)(v25 + 24);
          if (v27 >= v26 >> 1)
          {
            sub_239229A04(v26 > 1, v27 + 1, 1);
            v25 = v38;
          }
          *(_QWORD *)(v25 + 16) = v27 + 1;
          result = sub_23922A824((uint64_t)v6, v25+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v27, (uint64_t (*)(_QWORD))type metadata accessor for HIDElement.Value);
          if (v30)
            break;
          a1 = v21;
          sub_239229CFC(v19, v18, v20, v21);
          v13 = v12;
          v15 = v14;
          v17 = v16;
          sub_23922C2A8(v19, v18, v20);
          v35 = v13;
          v36 = v15;
          v37 = v17 & 1;
          if (!--v7)
            goto LABEL_19;
        }
        if ((v20 & 1) == 0)
          goto LABEL_22;
        a1 = v21;
        if (sub_23922CD0C())
          swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569205D8);
        v28 = (void (*)(_QWORD *, _QWORD))sub_23922CA18();
        sub_23922CD6C();
        v28(v34, 0);
        --v7;
      }
      while (v7);
LABEL_19:
      sub_23922C2A8(v35, v36, v37);
      return v38;
    }
  }
  return result;
}

void sub_23922AD78(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_23922AD84(uint64_t a1)
{
  uint64_t v1;

  return sub_2392268FC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(CFTimeInterval *)(v1 + 40), *(_QWORD *)(v1 + 32), *(uint64_t **)(v1 + 48), *(_QWORD *)(v1 + 56));
}

unint64_t sub_23922AD9C()
{
  unint64_t result;

  result = qword_25691FE80;
  if (!qword_25691FE80)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDDeviceClient.DeviceReference, &type metadata for HIDDeviceClient.DeviceReference);
    atomic_store(result, (unint64_t *)&qword_25691FE80);
  }
  return result;
}

uint64_t sub_23922ADE0(uint64_t a1)
{
  uint64_t result;

  result = sub_2391F66EC(&qword_25691FE88, 255, type metadata accessor for HIDDeviceClient.ProvideElementUpdate, (uint64_t)&protocol conformance descriptor for HIDDeviceClient.ProvideElementUpdate);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23922AE20()
{
  return sub_2391F66EC(&qword_25691FE90, 255, type metadata accessor for HIDDeviceClient.ProvideElementUpdate, (uint64_t)&protocol conformance descriptor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t sub_23922AE50(uint64_t a1)
{
  uint64_t result;

  result = sub_2391F66EC(&qword_25691FE98, 255, type metadata accessor for HIDDeviceClient.RequestElementUpdate, (uint64_t)&protocol conformance descriptor for HIDDeviceClient.RequestElementUpdate);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23922AE90()
{
  return sub_2391F66EC(&qword_25691FEA0, 255, type metadata accessor for HIDDeviceClient.RequestElementUpdate, (uint64_t)&protocol conformance descriptor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_23922AEC0(uint64_t a1, uint64_t a2)
{
  return sub_2391F66EC(&qword_25691FEA8, a2, (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient, (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
}

uint64_t sub_23922AEEC()
{
  return 0;
}

uint64_t method lookup function for HIDDeviceClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HIDDeviceClient.descriptor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of HIDDeviceClient.deviceUsages.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of HIDDeviceClient.transport.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of HIDDeviceClient.product.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of HIDDeviceClient.manufacturer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of HIDDeviceClient.modelNumber.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of HIDDeviceClient.versionNumber.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of HIDDeviceClient.serialNumber.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of HIDDeviceClient.uniqueID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of HIDDeviceClient.locationID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of HIDDeviceClient.localizationCode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of HIDDeviceClient.isBuiltIn.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 584))();
}

uint64_t dispatch thunk of HIDDeviceClient.elements.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 608))();
}

uint64_t dispatch thunk of HIDDeviceClient.__allocating_init(deviceReference:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 776))();
}

uint64_t dispatch thunk of HIDDeviceClient.seizeDevice()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 816))();
}

uint64_t dispatch thunk of HIDDeviceClient.monitorNotifications(reportIDsToMonitor:elementsToMonitor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 840))();
}

uint64_t dispatch thunk of HIDDeviceClient.subscript.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 848))();
}

uint64_t dispatch thunk of HIDDeviceClient.subscript.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 856))();
}

uint64_t dispatch thunk of HIDDeviceClient.subscript.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 864))();
}

uint64_t dispatch thunk of HIDDeviceClient.dispatchSetReportRequest(type:id:data:timeout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v7 + 872)
                                                                                              + *(_QWORD *)(*(_QWORD *)v7 + 872));
  v15 = a7 & 1;
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v16;
  *v16 = v8;
  v16[1] = sub_2391F6A48;
  return v18(a1, a2, a3, a4, a5, a6, v15);
}

uint64_t dispatch thunk of HIDDeviceClient.dispatchGetReportRequest(type:id:timeout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = a5 & 1;
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v5 + 880)
                                                                            + *(_QWORD *)(*(_QWORD *)v5 + 880));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v12;
  *v12 = v6;
  v12[1] = sub_2391F731C;
  return v14(a1, a2, a3, a4, v11);
}

uint64_t dispatch thunk of HIDDeviceClient.updateElements(_:timeout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = a5 & 1;
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v5 + 888)
                                                                            + *(_QWORD *)(*(_QWORD *)v5 + 888));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v12;
  *v12 = v6;
  v12[1] = sub_2391F6A48;
  return v14(a1, a2, a3, a4, v11);
}

ValueMetadata *type metadata accessor for HIDDeviceClient.DeviceReference()
{
  return &type metadata for HIDDeviceClient.DeviceReference;
}

uint64_t *initializeBufferWithCopyOfBuffer for HIDDeviceClient.Notification(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      *(_WORD *)a1 = *(_WORD *)a2;
      v8 = a2[1];
      v9 = a2[2];
      sub_2391F0C34(v8, v9);
      a1[1] = v8;
      a1[2] = v9;
      v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00) + 64);
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = sub_23922CCC4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for HIDDeviceClient.Notification(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    sub_2391F0C78(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
    v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00) + 64);
    v4 = sub_23922CCC4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  return result;
}

_QWORD *initializeWithCopy for HIDDeviceClient.Notification(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    v7 = a2[1];
    v8 = a2[2];
    sub_2391F0C34(v7, v8);
    a1[1] = v7;
    a1[2] = v8;
    v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00) + 64);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23922CCC4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for HIDDeviceClient.Notification(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_2392279B0((uint64_t)a1, type metadata accessor for HIDDeviceClient.Notification);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *(_WORD *)a1 = *(_WORD *)a2;
      v7 = a2[1];
      v8 = a2[2];
      sub_2391F0C34(v7, v8);
      a1[1] = v7;
      a1[2] = v8;
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00) + 64);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_23922CCC4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_WORD *initializeWithTake for HIDDeviceClient.Notification(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
    v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00) + 64);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_23922CCC4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_WORD *assignWithTake for HIDDeviceClient.Notification(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_2392279B0((uint64_t)a1, type metadata accessor for HIDDeviceClient.Notification);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25691FE00) + 64);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_23922CCC4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.Notification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.Notification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23922B72C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23922B73C()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  result = sub_23922CCC4();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[4] = v2;
    v2[5] = MEMORY[0x24BEE0158] + 64;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23922B7C8()
{
  return type metadata accessor for HIDDeviceClient.StreamWrapper(0);
}

uint64_t type metadata accessor for HIDDeviceClient.StreamWrapper(uint64_t a1)
{
  return sub_23922B7E4(a1, (uint64_t *)&unk_256924EC0);
}

uint64_t sub_23922B7E4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23922B818()
{
  unint64_t v0;

  sub_23922B894();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_23922B894()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256920348[0])
  {
    type metadata accessor for HIDDeviceClient.Notification(255);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25691FC10);
    v0 = sub_23922CB50();
    if (!v1)
      atomic_store(v0, qword_256920348);
  }
}

ValueMetadata *type metadata accessor for HIDDeviceClient.UnsafeProperty()
{
  return &type metadata for HIDDeviceClient.UnsafeProperty;
}

uint64_t *initializeBufferWithCopyOfBuffer for HIDDeviceClient.ProvideElementUpdate(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23922CCC4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t initializeWithCopy for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.ProvideElementUpdate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.ProvideElementUpdate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23922BB50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23922CCC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for HIDDeviceClient.RequestElementUpdate(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23922CCC4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s7CoreHID15HIDDeviceClientC20ProvideElementUpdateVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23922CCC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.RequestElementUpdate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23922CCC4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.RequestElementUpdate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23922CCC4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23922BF64()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23922CCC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for HIDDeviceClient.HIDElementUpdateResult()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s7CoreHID15HIDDeviceClientC22HIDElementUpdateResultVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HIDDeviceClient.HIDElementUpdateResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for HIDDeviceClient.HIDElementUpdateResult(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.HIDElementUpdateResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.HIDElementUpdateResult(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HIDDeviceClient.HIDElementUpdateResult()
{
  return &type metadata for HIDDeviceClient.HIDElementUpdateResult;
}

uint64_t type metadata accessor for HIDDeviceClient.Context()
{
  return objc_opt_self();
}

void type metadata accessor for IOHIDValue(uint64_t a1)
{
  sub_2391F7968(a1, &qword_2569205A0);
}

uint64_t sub_23922C1A4()
{
  return sub_2391F66EC(&qword_2569205B0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239320);
}

uint64_t sub_23922C1D4()
{
  return sub_2391F66EC(&qword_25691F6E8, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_239239388);
}

uint64_t sub_23922C204()
{
  return sub_2391F66EC(&qword_25691F6F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393B0);
}

uint64_t sub_23922C234()
{
  return sub_2391F66EC(&qword_2569205B8, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice, (uint64_t)&unk_239239348);
}

unint64_t sub_23922C264()
{
  unint64_t result;

  result = qword_2569205D0;
  if (!qword_2569205D0)
  {
    result = MEMORY[0x23B8397A4](&protocol conformance descriptor for HIDElement, &type metadata for HIDElement);
    atomic_store(result, (unint64_t *)&qword_2569205D0);
  }
  return result;
}

uint64_t sub_23922C2A8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23922C2B4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23922C2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691F5C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23922C308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25691FE68);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))(v8, a1, v4, v6);
    sub_239217BBC(a2, (uint64_t)&v13);
    if ((v13 & 0x10000000000) == 0)
    {
      v9 = v13 | ((unint64_t)BYTE4(v13) << 32);
      sub_2391F7504();
      v10 = swift_allocError();
      *(_DWORD *)v11 = v9;
      *(_BYTE *)(v11 + 4) = BYTE4(v9) & 1;
      v13 = v10;
      sub_23922CAFC();
      goto LABEL_6;
    }
    v13 = 0;
    type metadata accessor for IOHIDElement();
    type metadata accessor for IOHIDValue(0);
    sub_2391F66EC(&qword_25691F6F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement, (uint64_t)&unk_2392393B0);
    sub_23922CA0C();
    if (v13)
    {
      sub_23922CB08();
LABEL_6:
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23922C484(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_23922C490(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_23922C4D4(uint64_t a1)
{
  uint64_t v1;

  sub_23921E844(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), *(unsigned __int8 *)(v1 + 25) | (*(unsigned __int8 *)(v1 + 26) << 8), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23922C518()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23922C544()
{
  uint64_t v0;

  return sub_23921DDC4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23922C54C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23922C580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2391F79B0;
  *(_OWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(*(_QWORD *)v3 + 832);
  return swift_task_switch();
}

uint64_t sub_23922C5EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23922C610()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23922C64C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2391F79B0;
  return sub_23921BE58((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_23922C6AC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_2391F0C78(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));

  return swift_deallocObject();
}

uint64_t sub_23922C6E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_DWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2391F79B0;
  return sub_23921BC64((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_23922C764()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23922C798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2391F79B0;
  return sub_23921BA90((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_23922C7E8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23922C81C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_DWORD *)(v0 + 40);
  v4 = *(_DWORD *)(v0 + 44);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2391F79B0;
  return sub_23921B904((uint64_t)v6, v7, v8, v2, v3, v4, v5);
}

void sub_23922C884()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_23922C8A4()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23922C8B0()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23922C8BC()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23922C8C8()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23922C8D4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23922C8E0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23922C8EC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23922C8F8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_23922C904()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_23922C910()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_23922C91C()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23922C928()
{
  return MEMORY[0x24BDCDB80]();
}

uint64_t sub_23922C934()
{
  return MEMORY[0x24BDCDBB0]();
}

uint64_t sub_23922C940()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_23922C94C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23922C958()
{
  return MEMORY[0x24BDCDC68]();
}

uint64_t sub_23922C964()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23922C970()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_23922C97C()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_23922C988()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t sub_23922C994()
{
  return MEMORY[0x24BDCDDA8]();
}

uint64_t sub_23922C9A0()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_23922C9AC()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_23922C9B8()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_23922C9C4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23922C9D0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23922C9DC()
{
  return MEMORY[0x24BEE0228]();
}

uint64_t sub_23922C9E8()
{
  return MEMORY[0x24BEE0240]();
}

uint64_t sub_23922C9F4()
{
  return MEMORY[0x24BEE0250]();
}

uint64_t sub_23922CA00()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23922CA0C()
{
  return MEMORY[0x24BDCF818]();
}

uint64_t sub_23922CA18()
{
  return MEMORY[0x24BEE0350]();
}

uint64_t sub_23922CA24()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23922CA30()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23922CA3C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23922CA48()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_23922CA54()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23922CA60()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23922CA6C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23922CA78()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23922CA84()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23922CA90()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23922CA9C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23922CAA8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23922CAB4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23922CAC0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23922CACC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23922CAD8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23922CAE4()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23922CAF0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23922CAFC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23922CB08()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23922CB14()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23922CB20()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23922CB2C()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_23922CB38()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_23922CB44()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_23922CB50()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_23922CB5C()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_23922CB68()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23922CB74()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23922CB80()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_23922CB8C()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_23922CB98()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_23922CBA4()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_23922CBB0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23922CBBC()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_23922CBC8()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t sub_23922CBD4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23922CBE0()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23922CBEC()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_23922CBF8()
{
  return MEMORY[0x24BEE1FF8]();
}

uint64_t sub_23922CC04()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_23922CC10()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_23922CC1C()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_23922CC28()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23922CC34()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23922CC40()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_23922CC4C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23922CC58()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23922CC64()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23922CC70()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23922CC7C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23922CC88()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23922CC94()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23922CCA0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23922CCAC()
{
  return MEMORY[0x24BEE6E30]();
}

uint64_t sub_23922CCB8()
{
  return MEMORY[0x24BEE6E50]();
}

uint64_t sub_23922CCC4()
{
  return MEMORY[0x24BEE6E70]();
}

uint64_t sub_23922CCD0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23922CCDC()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_23922CCE8()
{
  return MEMORY[0x24BEE2EA0]();
}

uint64_t sub_23922CCF4()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_23922CD00()
{
  return MEMORY[0x24BEE2EB8]();
}

uint64_t sub_23922CD0C()
{
  return MEMORY[0x24BEE2EC0]();
}

uint64_t sub_23922CD18()
{
  return MEMORY[0x24BEE2ED0]();
}

uint64_t sub_23922CD24()
{
  return MEMORY[0x24BEE2ED8]();
}

uint64_t sub_23922CD30()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_23922CD3C()
{
  return MEMORY[0x24BEE2EE8]();
}

uint64_t sub_23922CD48()
{
  return MEMORY[0x24BEE2F00]();
}

uint64_t sub_23922CD54()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_23922CD60()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_23922CD6C()
{
  return MEMORY[0x24BEE2F38]();
}

uint64_t sub_23922CD78()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23922CD84()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23922CD90()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23922CD9C()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_23922CDA8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23922CDB4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23922CDC0()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_23922CDCC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23922CDD8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23922CDE4()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_23922CDF0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23922CDFC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23922CE08()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23922CE14()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23922CE20()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23922CE2C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23922CE38()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23922CE44()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23922CE50()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23922CE5C()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_23922CE68()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23922CE74()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23922CE80()
{
  return MEMORY[0x24BDD07B8]();
}

uint64_t sub_23922CE8C()
{
  return MEMORY[0x24BDD07D0]();
}

uint64_t sub_23922CE98()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_23922CEA4()
{
  return MEMORY[0x24BEE4848]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
  MEMORY[0x24BDD8008](device);
}

void IOHIDDeviceCancel(IOHIDDeviceRef device)
{
  MEMORY[0x24BDD8010](device);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8018](device, *(_QWORD *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x24BDD8028](device, matching, *(_QWORD *)&options);
}

IOReturn IOHIDDeviceCopyValueMultipleWithCallback(IOHIDDeviceRef device, CFArrayRef elements, CFDictionaryRef *pMultiple, CFTimeInterval timeout, IOHIDValueMultipleCallback callback, void *context)
{
  return MEMORY[0x24BDD8030](device, elements, pMultiple, callback, context, timeout);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x24BDD8038](allocator, *(_QWORD *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8040](device, key);
}

IOReturn IOHIDDeviceGetReportWithCallback(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x24BDD8050](device, *(_QWORD *)&reportType, reportID, report, pReportLength, callback, context, timeout);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8060](device, *(_QWORD *)&options);
}

void IOHIDDeviceRegisterInputReportWithTimeStampCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportWithTimeStampCallback callback, void *context)
{
  MEMORY[0x24BDD8070](device, report, reportLength, callback, context);
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
  MEMORY[0x24BDD8078](device, callback, context);
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
  MEMORY[0x24BDD8080](device, callback, context);
}

void IOHIDDeviceSetCancelHandler(IOHIDDeviceRef device, dispatch_block_t handler)
{
  MEMORY[0x24BDD8088](device, handler);
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
  MEMORY[0x24BDD8090](device, queue);
}

void IOHIDDeviceSetInputValueMatchingMultiple(IOHIDDeviceRef device, CFArrayRef multiple)
{
  MEMORY[0x24BDD8098](device, multiple);
}

Boolean IOHIDDeviceSetProperty(IOHIDDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x24BDD80A0](device, key, property);
}

IOReturn IOHIDDeviceSetReportWithCallback(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x24BDD80B0](device, *(_QWORD *)&reportType, reportID, report, reportLength, callback, context, timeout);
}

IOReturn IOHIDDeviceSetValueMultipleWithCallback(IOHIDDeviceRef device, CFDictionaryRef multiple, CFTimeInterval timeout, IOHIDValueMultipleCallback callback, void *context)
{
  return MEMORY[0x24BDD80B8](device, multiple, callback, context, timeout);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return (CFArrayRef)MEMORY[0x24BDD80C0](element);
}

IOHIDElementCollectionType IOHIDElementGetCollectionType(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80C8](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80D0](element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80D8](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80E0](element);
}

IOHIDElementRef IOHIDElementGetParent(IOHIDElementRef element)
{
  return (IOHIDElementRef)MEMORY[0x24BDD80E8](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80F0](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80F8](element);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8100](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8108](element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8110](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8118](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8120](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8128](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8130](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8138](element);
}

Boolean IOHIDElementIsArray(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8140](element);
}

void IOHIDUserDeviceActivate(IOHIDUserDeviceRef device)
{
  MEMORY[0x24BDD8590](device);
}

void IOHIDUserDeviceCancel(IOHIDUserDeviceRef device)
{
  MEMORY[0x24BDD8598](device);
}

CFTypeRef IOHIDUserDeviceCopyProperty(IOHIDUserDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD85A0](device, key);
}

uint64_t IOHIDUserDeviceCopyService()
{
  return MEMORY[0x24BDD85A8]();
}

IOHIDUserDeviceRef IOHIDUserDeviceCreateWithProperties(CFAllocatorRef allocator, CFDictionaryRef properties, IOOptionBits options)
{
  return (IOHIDUserDeviceRef)MEMORY[0x24BDD85B8](allocator, properties, *(_QWORD *)&options);
}

uint64_t IOHIDUserDeviceHandleReportAsyncWithTimeStamp()
{
  return MEMORY[0x24BDD85C8]();
}

void IOHIDUserDeviceRegisterGetReportBlock(IOHIDUserDeviceRef device, IOHIDUserDeviceGetReportBlock block)
{
  MEMORY[0x24BDD85D0](device, block);
}

void IOHIDUserDeviceRegisterSetReportBlock(IOHIDUserDeviceRef device, IOHIDUserDeviceSetReportBlock block)
{
  MEMORY[0x24BDD85E0](device, block);
}

void IOHIDUserDeviceSetCancelHandler(IOHIDUserDeviceRef device, dispatch_block_t handler)
{
  MEMORY[0x24BDD8600](device, handler);
}

void IOHIDUserDeviceSetDispatchQueue(IOHIDUserDeviceRef device, dispatch_queue_t queue)
{
  MEMORY[0x24BDD8608](device, queue);
}

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x24BDD8620](allocator, element, timeStamp, bytes, length);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x24BDD8630](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x24BDD8638](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x24BDD8648](value);
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x24BDD8658](value);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
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

