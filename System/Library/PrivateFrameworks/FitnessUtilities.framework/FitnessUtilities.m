uint64_t DynamicPredicateComparisonDescriptor.comparisonOperator.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t DynamicPredicateComparisonDescriptor.lhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 24);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_23C43AF10(v2, v3, v4);
}

uint64_t sub_23C43AF10(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 4)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t DynamicPredicateComparisonDescriptor.rhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 48);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_23C43AF10(v2, v3, v4);
}

__n128 DynamicPredicateComparisonDescriptor.init(comparisonOperator:lhs:rhs:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  char v4;
  unsigned __int8 v5;
  __n128 result;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = a3[1].n128_u8[0];
  *(_BYTE *)a4 = a1;
  *(_OWORD *)(a4 + 8) = *(_OWORD *)a2;
  *(_BYTE *)(a4 + 24) = v4;
  result = *a3;
  *(__n128 *)(a4 + 32) = *a3;
  *(_BYTE *)(a4 + 48) = v5;
  return result;
}

uint64_t sub_23C43AF64(char a1)
{
  if (!a1)
    return 0xD000000000000012;
  if (a1 == 1)
    return 7563372;
  return 7563378;
}

BOOL sub_23C43AFB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C43AFC8()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C43B00C()
{
  return sub_23C456434();
}

uint64_t sub_23C43B034()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C43B074()
{
  char *v0;

  return sub_23C43AF64(*v0);
}

uint64_t sub_23C43B07C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C43BF30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C43B0A0()
{
  return 0;
}

void sub_23C43B0AC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23C43B0B8()
{
  sub_23C43B330();
  return sub_23C45647C();
}

uint64_t sub_23C43B0E0()
{
  sub_23C43B330();
  return sub_23C456488();
}

uint64_t DynamicPredicateComparisonDescriptor.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  char v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9EE98);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v18 = *((_QWORD *)v1 + 2);
  v19 = v9;
  v23 = v1[24];
  v10 = *((_QWORD *)v1 + 4);
  v16 = *((_QWORD *)v1 + 5);
  v17 = v10;
  HIDWORD(v15) = v1[48];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43B330();
  sub_23C456470();
  LOBYTE(v20) = v8;
  v24 = 0;
  sub_23C43B374();
  sub_23C4563B0();
  if (!v2)
  {
    v11 = BYTE4(v15);
    v13 = v16;
    v12 = v17;
    v20 = v19;
    v21 = v18;
    v22 = v23;
    v24 = 1;
    sub_23C43B3B8();
    sub_23C4563B0();
    v20 = v12;
    v21 = v13;
    v22 = v11;
    v24 = 2;
    sub_23C4563B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261F5B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t sub_23C43B330()
{
  unint64_t result;

  result = qword_256B9EEA0;
  if (!qword_256B9EEA0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C456AC8, &type metadata for DynamicPredicateComparisonDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9EEA0);
  }
  return result;
}

unint64_t sub_23C43B374()
{
  unint64_t result;

  result = qword_256B9EEA8;
  if (!qword_256B9EEA8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparisonOperator, &type metadata for DynamicPredicateComparisonOperator);
    atomic_store(result, (unint64_t *)&qword_256B9EEA8);
  }
  return result;
}

unint64_t sub_23C43B3B8()
{
  unint64_t result;

  result = qword_256B9EEB0;
  if (!qword_256B9EEB0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableValue, &type metadata for DynamicPredicateComparableValue);
    atomic_store(result, (unint64_t *)&qword_256B9EEB0);
  }
  return result;
}

uint64_t DynamicPredicateComparisonDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  int v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9EEB8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43B330();
  sub_23C456464();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v24 = 0;
  sub_23C43B698();
  sub_23C456344();
  v9 = v20;
  v24 = 1;
  sub_23C43B6DC();
  sub_23C456344();
  v18 = v9;
  v10 = v21;
  v24 = 2;
  v19 = v20;
  v23 = v22;
  sub_23C43AF10(v20, v21, v22);
  sub_23C456344();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = v20;
  v12 = v21;
  v13 = v22;
  v14 = v19;
  v15 = v23;
  sub_23C43AF10(v19, v10, v23);
  sub_23C43AF10(v11, v12, v13);
  sub_23C43B720(v14, v10, v15);
  *(_BYTE *)a2 = v18;
  *(_QWORD *)(a2 + 8) = v14;
  *(_QWORD *)(a2 + 16) = v10;
  *(_BYTE *)(a2 + 24) = v15;
  *(_QWORD *)(a2 + 32) = v11;
  *(_QWORD *)(a2 + 40) = v12;
  *(_BYTE *)(a2 + 48) = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_23C43B720(v14, v10, v15);
  return sub_23C43B720(v11, v12, v13);
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

unint64_t sub_23C43B698()
{
  unint64_t result;

  result = qword_256B9EEC0;
  if (!qword_256B9EEC0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparisonOperator, &type metadata for DynamicPredicateComparisonOperator);
    atomic_store(result, (unint64_t *)&qword_256B9EEC0);
  }
  return result;
}

unint64_t sub_23C43B6DC()
{
  unint64_t result;

  result = qword_256B9EEC8;
  if (!qword_256B9EEC8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableValue, &type metadata for DynamicPredicateComparableValue);
    atomic_store(result, (unint64_t *)&qword_256B9EEC8);
  }
  return result;
}

uint64_t sub_23C43B720(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 4)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23C43B738@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateComparisonDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C43B74C(_QWORD *a1)
{
  return DynamicPredicateComparisonDescriptor.encode(to:)(a1);
}

void DynamicPredicateComparisonDescriptor.hash(into:)()
{
  __asm { BR              X10 }
}

void sub_23C43B7C4()
{
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  DynamicPredicateComparableValue.hash(into:)();
  DynamicPredicateComparableValue.hash(into:)();
}

void DynamicPredicateComparisonDescriptor.hashValue.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23C456428();
  __asm { BR              X9 }
}

uint64_t sub_23C43B8D4()
{
  uint64_t v0;
  uint64_t v1;

  sub_23C455FF0();
  v1 = swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t))((char *)sub_23C43B948 + 4 * byte_23C4568C8[v0]))(v1);
}

uint64_t sub_23C43B948()
{
  uint64_t v0;
  uint64_t v1;

  sub_23C456434();
  v1 = sub_23C456434();
  return ((uint64_t (*)(uint64_t))((char *)sub_23C43BA30 + 4 * byte_23C4568CD[v0]))(v1);
}

uint64_t sub_23C43BA30()
{
  sub_23C456434();
  sub_23C456434();
  return sub_23C45644C();
}

void sub_23C43BB2C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23C456428();
  __asm { BR              X9 }
}

uint64_t sub_23C43BB94()
{
  uint64_t v0;
  uint64_t v1;

  sub_23C455FF0();
  v1 = swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t))((char *)sub_23C43BC08 + 4 * byte_23C4568D6[v0]))(v1);
}

uint64_t sub_23C43BC08()
{
  uint64_t v0;
  uint64_t v1;

  sub_23C456434();
  v1 = sub_23C456434();
  return ((uint64_t (*)(uint64_t))((char *)sub_23C43BCF0 + 4 * byte_23C4568DB[v0]))(v1);
}

uint64_t sub_23C43BCF0()
{
  sub_23C456434();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C43BDE8()
{
  sub_23C455FF0();
  return swift_bridgeObjectRelease();
}

void sub_23C43BE58(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23C43BEA0()
{
  sub_23C455FF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C43BF30(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x800000023C45A6A0 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7563372 && a2 == 0xE300000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7563378 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t _s16FitnessUtilities36DynamicPredicateComparisonDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(a1 + 8);
  v1 = *(_BYTE *)(a1 + 24);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  sub_23C4417DC(*(_BYTE *)a1);
  if ((v5 & 1) != 0
    && (v11 = v10,
        v12 = v9,
        v13 = v1,
        _s16FitnessUtilities31DynamicPredicateComparableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v11),
        (v6 & 1) != 0))
  {
    v11 = v2;
    v12 = v3;
    v13 = v4;
    _s16FitnessUtilities31DynamicPredicateComparableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v11);
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

unint64_t sub_23C43C144()
{
  unint64_t result;

  result = qword_256B9EED0;
  if (!qword_256B9EED0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparisonDescriptor, &type metadata for DynamicPredicateComparisonDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9EED0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DynamicPredicateComparisonDescriptor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DynamicPredicateComparisonDescriptor(uint64_t a1)
{
  sub_23C43B720(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
  return sub_23C43B720(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for DynamicPredicateComparisonDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23C43AF10(v4, v5, v6);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(v2 + 32);
  v8 = *(_QWORD *)(v2 + 40);
  LOBYTE(v2) = *(_BYTE *)(v2 + 48);
  sub_23C43AF10(v7, v8, v2);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v2;
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateComparisonDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v2 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23C43AF10(v4, v5, v6);
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v9 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23C43B720(v7, v8, v9);
  v10 = *(_QWORD *)(v2 + 32);
  v11 = *(_QWORD *)(v2 + 40);
  LOBYTE(v2) = *(_BYTE *)(v2 + 48);
  sub_23C43AF10(v10, v11, v2);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  v14 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v2;
  sub_23C43B720(v12, v13, v14);
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

uint64_t assignWithTake for DynamicPredicateComparisonDescriptor(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v7 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23C43B720(v5, v6, v7);
  v8 = *(_BYTE *)(a2 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v8;
  sub_23C43B720(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparisonDescriptor(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && a1[49])
    return (*(_DWORD *)a1 + 253);
  v3 = *a1;
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparisonDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)result = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparisonDescriptor()
{
  return &type metadata for DynamicPredicateComparisonDescriptor;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparisonDescriptor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparisonDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C43C514 + 4 * byte_23C4568EA[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C43C548 + 4 * byte_23C4568E5[v4]))();
}

uint64_t sub_23C43C548(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43C550(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C43C558);
  return result;
}

uint64_t sub_23C43C564(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C43C56CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C43C570(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43C578(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43C584(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C43C590(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparisonDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateComparisonDescriptor.CodingKeys;
}

unint64_t sub_23C43C5AC()
{
  unint64_t result;

  result = qword_256B9EED8;
  if (!qword_256B9EED8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C456AA0, &type metadata for DynamicPredicateComparisonDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9EED8);
  }
  return result;
}

unint64_t sub_23C43C5F4()
{
  unint64_t result;

  result = qword_256B9EEE0;
  if (!qword_256B9EEE0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C456A10, &type metadata for DynamicPredicateComparisonDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9EEE0);
  }
  return result;
}

unint64_t sub_23C43C63C()
{
  unint64_t result;

  result = qword_256B9EEE8;
  if (!qword_256B9EEE8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C456A38, &type metadata for DynamicPredicateComparisonDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9EEE8);
  }
  return result;
}

BOOL sub_23C43C680(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23C43C690()
{
  return sub_23C456434();
}

uint64_t sub_23C43C6B4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v3 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C43C79C()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C43C7E0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6572756C696166;
  else
    return 0x73736563637573;
}

BOOL sub_23C43C810(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23C43C680(*a1, *a2);
}

uint64_t sub_23C43C838()
{
  return sub_23C43C79C();
}

uint64_t sub_23C43C840()
{
  return sub_23C43C690();
}

uint64_t sub_23C43C860()
{
  sub_23C456428();
  sub_23C43C690();
  return sub_23C45644C();
}

uint64_t sub_23C43C89C()
{
  char *v0;

  return sub_23C43C7E0(*v0);
}

uint64_t sub_23C43C8A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C43C6B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C43C8D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C43D560();
  *a1 = result;
  return result;
}

uint64_t sub_23C43C908(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C456DA0, a1);
  return sub_23C45647C();
}

uint64_t sub_23C43C93C(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C456DA0, a1);
  return sub_23C456488();
}

uint64_t static Result<>.ResultCodableError.== infix(_:_:)()
{
  return 1;
}

uint64_t Result<>.ResultCodableError.hash(into:)()
{
  return sub_23C456434();
}

uint64_t Result<>.ResultCodableError.hashValue.getter()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C43C9DC()
{
  return 1;
}

uint64_t sub_23C43C9E4()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C43CA24()
{
  return sub_23C456434();
}

uint64_t sub_23C43CA48()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

void Result<>.encode(to:)(uint64_t a1, uint64_t a2)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[20];

  v15[7] = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  v2 = MEMORY[0x24BDAC7A8](a1);
  v15[6] = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[4] = *(_QWORD *)(*(_QWORD *)(v4 + 16) - 8);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v15[1] = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = *(_QWORD *)(v7 + 32);
  v15[5] = v9;
  v15[13] = v9;
  v15[14] = v10;
  v15[8] = v10;
  v15[15] = v11;
  v15[16] = v12;
  v15[2] = v12;
  v15[3] = v13;
  v15[17] = v14;
  v15[18] = v13;
  v15[19] = v8;
  _s10CodingKeysOMa();
}

uint64_t sub_23C43CB8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
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
  uint64_t v14;

  MEMORY[0x24261F5D0](&unk_23C456DA0, a1);
  v6 = sub_23C4563BC();
  *(_QWORD *)(v5 - 144) = v6;
  *(_QWORD *)(v5 - 160) = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - v7;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_23C456470();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 - 168), v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = *(_QWORD *)(v5 - 192);
    v9 = *(_QWORD *)(v5 - 184);
    v11 = *(_QWORD *)(v5 - 176);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v10, v4, v11);
    *(_BYTE *)(v5 - 65) = 1;
  }
  else
  {
    v9 = *(_QWORD *)(v5 - 208);
    v11 = *(_QWORD *)(v5 - 200);
    v10 = *(_QWORD *)(v5 - 232);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v10, v4, v11);
    *(_BYTE *)(v5 - 65) = 0;
  }
  v12 = *(_QWORD *)(v5 - 144);
  sub_23C456374();
  sub_23C455F6C();
  __swift_destroy_boxed_opaque_existential_1(v5 - 136);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 160) + 8))(v8, v12);
}

void _s10CodingKeysOMa()
{
  JUMPOUT(0x24261F564);
}

void Result<>.init(from:)(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
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
  uint64_t v12;
  _QWORD v13[32];

  v13[5] = a2;
  v13[3] = *(_QWORD *)(a1 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13[6] = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[4] = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v13[14] = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[24] = v6;
  v13[25] = v7;
  v13[11] = v8;
  v13[26] = v8;
  v13[27] = v9;
  v13[7] = v9;
  v13[10] = v10;
  v13[28] = v10;
  v13[29] = v11;
  v13[8] = v11;
  v13[30] = v12;
  _s10CodingKeysOMa();
}

uint64_t sub_23C43CE24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[96];

  MEMORY[0x24261F5D0](&unk_23C456DA0, a1);
  v6 = sub_23C45635C();
  *(_QWORD *)(v5 - 240) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 - 232) = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = &v21[-v7];
  *(_QWORD *)(v5 - 216) = v3;
  *(_QWORD *)(v5 - 208) = v2;
  *(_QWORD *)(v5 - 264) = v1;
  v9 = sub_23C456458();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = &v21[-v11];
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  v13 = *(_QWORD *)(v5 - 200);
  sub_23C456464();
  if (v13)
  {
    v20 = (uint64_t)v4;
  }
  else
  {
    v14 = *(_QWORD *)(v5 - 224);
    *(_QWORD *)(v5 - 336) = v12;
    *(_QWORD *)(v5 - 328) = v10;
    *(_QWORD *)(v5 - 320) = v9;
    v15 = *(_QWORD *)(v5 - 216);
    *(_QWORD *)(v5 - 200) = v4;
    *(_BYTE *)(v5 - 65) = 0;
    v16 = *(_QWORD *)(v5 - 232);
    sub_23C456308();
    sub_23C43D234((__int128 *)(v5 - 192), v5 - 144);
    sub_23C43D24C(v5 - 144, v5 - 192);
    sub_23C4561A0();
    __swift_destroy_boxed_opaque_existential_1(v5 - 144);
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v5 - 240) + 8))(v8, v16);
    v18 = *(_QWORD *)(v5 - 336);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 304) + 32))(v18, v14, v15);
    v19 = *(_QWORD *)(v5 - 320);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 328) + 32))(*(_QWORD *)(v5 - 296), v18, v19);
    v20 = *(_QWORD *)(v5 - 200);
  }
  return __swift_destroy_boxed_opaque_existential_1(v20);
}

uint64_t sub_23C43D1E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_256B9EEF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for Result<>.ResultCodableError()
{
  JUMPOUT(0x24261F564);
}

uint64_t sub_23C43D234(__int128 *a1, uint64_t a2)
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

uint64_t sub_23C43D24C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23C43D290()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C43D2A0(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  Result<>.init(from:)(*(_QWORD *)(a1 + 24), a2);
}

void sub_23C43D2C8(uint64_t a1, uint64_t a2)
{
  Result<>.encode(to:)(a1, a2);
}

uint64_t sub_23C43D2E8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for DynamicPredicateBooleanValue.CodingKeys(unsigned int *a1, int a2)
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

uint64_t sub_23C43D344(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C43D384 + 4 * byte_23C456B20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C43D3A4 + 4 * byte_23C456B25[v4]))();
}

_BYTE *sub_23C43D384(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C43D3A4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C43D3AC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C43D3B4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C43D3BC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C43D3C4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23C43D3D0()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparableKeyPath(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23C43D468(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C43D4B4 + 4 * byte_23C456B2F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C43D4E8 + 4 * byte_23C456B2A[v4]))();
}

uint64_t sub_23C43D4E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43D4F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C43D4F8);
  return result;
}

uint64_t sub_23C43D504(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C43D50CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C43D510(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43D518(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C43D524(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void sub_23C43D530()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C43D540()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C43D550()
{
  JUMPOUT(0x24261F5D0);
}

uint64_t sub_23C43D560()
{
  return 2;
}

BOOL static DynamicPredicateComparableValue.Stripped.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DynamicPredicateComparableValue.Stripped.hash(into:)()
{
  return sub_23C456434();
}

uint64_t DynamicPredicateComparableValue.Stripped.hashValue.getter()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

void DynamicPredicateComparableValue.strippedCase.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;
  unsigned int v2;

  v2 = v1[16];
  if (v2 >= 3)
  {
    if (v2 == 3)
      *a1 = *v1 & 1;
    else
      *a1 = 3;
  }
  else
  {
    *a1 = v2;
  }
}

uint64_t sub_23C43D628(char a1)
{
  return *(_QWORD *)&aDynamictgridsi[8 * a1];
}

uint64_t sub_23C43D648()
{
  char *v0;

  return sub_23C43D628(*v0);
}

uint64_t sub_23C43D650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C43F88C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C43D674(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23C43D680()
{
  sub_23C43E930();
  return sub_23C45647C();
}

uint64_t sub_23C43D6A8()
{
  sub_23C43E930();
  return sub_23C456488();
}

uint64_t sub_23C43D6DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C43FABC(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_23C43D704(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C43D710()
{
  sub_23C43EAC8();
  return sub_23C45647C();
}

uint64_t sub_23C43D738()
{
  sub_23C43EAC8();
  return sub_23C456488();
}

uint64_t sub_23C43D760()
{
  sub_23C43EA84();
  return sub_23C45647C();
}

uint64_t sub_23C43D788()
{
  sub_23C43EA84();
  return sub_23C456488();
}

uint64_t sub_23C43D7B0()
{
  sub_23C43EA40();
  return sub_23C45647C();
}

uint64_t sub_23C43D7D8()
{
  sub_23C43EA40();
  return sub_23C456488();
}

uint64_t sub_23C43D800()
{
  sub_23C43E9B8();
  return sub_23C45647C();
}

uint64_t sub_23C43D828()
{
  sub_23C43E9B8();
  return sub_23C456488();
}

uint64_t sub_23C43D850()
{
  sub_23C43E974();
  return sub_23C45647C();
}

uint64_t sub_23C43D878()
{
  sub_23C43E974();
  return sub_23C456488();
}

void DynamicPredicateComparableValue.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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
  _QWORD v13[17];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9EFF8);
  v13[12] = *(_QWORD *)(v3 - 8);
  v13[13] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v13[11] = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F000);
  v13[9] = *(_QWORD *)(v5 - 8);
  v13[10] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v13[8] = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F008);
  v13[6] = *(_QWORD *)(v7 - 8);
  v13[7] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v13[5] = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F010);
  v13[3] = *(_QWORD *)(v9 - 8);
  v13[4] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F018);
  v13[2] = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F020);
  v13[15] = *(_QWORD *)(v11 - 8);
  v13[16] = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13[14] = *(_QWORD *)v1;
  v13[1] = *(_QWORD *)(v1 + 8);
  v12 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43E930();
  sub_23C456470();
  __asm { BR              X9 }
}

uint64_t sub_23C43DAA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 - 70) = 0;
  sub_23C43EAC8();
  v4 = *(_QWORD *)(v3 - 96);
  sub_23C456368();
  *(_BYTE *)(v3 - 71) = *(_QWORD *)(v3 - 112);
  sub_23C43EB0C();
  sub_23C4563B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 208) + 8))(v2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 104) + 8))(v0, v4);
}

uint64_t DynamicPredicateComparableValue.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  _QWORD v25[4];
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;

  v34 = a2;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F068);
  v30 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F070);
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F078);
  v29 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F080);
  v27 = *(_QWORD *)(v7 - 8);
  v28 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F088);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F090);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[3];
  v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_23C43E930();
  v18 = v41;
  sub_23C456464();
  if (!v18)
  {
    v25[2] = v9;
    v25[3] = v12;
    v25[1] = v10;
    v41 = v14;
    v26 = v16;
    v19 = sub_23C456350();
    if (*(_QWORD *)(v19 + 16) == 1)
      __asm { BR              X9 }
    v20 = sub_23C4562A8();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F098);
    *v22 = &type metadata for DynamicPredicateComparableValue;
    v23 = v26;
    sub_23C4562FC();
    sub_23C45629C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v13);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
}

uint64_t sub_23C43E418@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateComparableValue.init(from:)(a1, a2);
}

void sub_23C43E42C(_QWORD *a1)
{
  DynamicPredicateComparableValue.encode(to:)(a1);
}

void DynamicPredicateComparableValue.hash(into:)()
{
  __asm { BR              X11 }
}

uint64_t sub_23C43E478()
{
  sub_23C456434();
  return sub_23C456434();
}

uint64_t sub_23C43E4B4()
{
  sub_23C456434();
  sub_23C455FF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C43E528()
{
  sub_23C456434();
  return sub_23C455FF0();
}

void DynamicPredicateComparableValue.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_23C456428();
  __asm { BR              X9 }
}

uint64_t sub_23C43E590()
{
  sub_23C456434();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C43E684()
{
  sub_23C456428();
  DynamicPredicateComparableValue.hash(into:)();
  return sub_23C45644C();
}

void _s16FitnessUtilities31DynamicPredicateComparableValueO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

BOOL sub_23C43E700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;

  if (v5)
  {
    sub_23C43AF10(v0, v2, v5);
    sub_23C43B720(v1, v3, v4);
    sub_23C43B720(v0, v2, v5);
    return 0;
  }
  else
  {
    sub_23C43B720(v1, v3, 0);
    sub_23C43B720(v0, v2, 0);
    return v0 == v1;
  }
}

unint64_t sub_23C43E930()
{
  unint64_t result;

  result = qword_256B9F028;
  if (!qword_256B9F028)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457634, &type metadata for DynamicPredicateComparableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F028);
  }
  return result;
}

unint64_t sub_23C43E974()
{
  unint64_t result;

  result = qword_256B9F030;
  if (!qword_256B9F030)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4575E4, &type metadata for DynamicPredicateComparableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F030);
  }
  return result;
}

unint64_t sub_23C43E9B8()
{
  unint64_t result;

  result = qword_256B9F038;
  if (!qword_256B9F038)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457594, &type metadata for DynamicPredicateComparableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F038);
  }
  return result;
}

unint64_t sub_23C43E9FC()
{
  unint64_t result;

  result = qword_256B9F040;
  if (!qword_256B9F040)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableKeyPath, &type metadata for DynamicPredicateComparableKeyPath);
    atomic_store(result, (unint64_t *)&qword_256B9F040);
  }
  return result;
}

unint64_t sub_23C43EA40()
{
  unint64_t result;

  result = qword_256B9F048;
  if (!qword_256B9F048)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457544, &type metadata for DynamicPredicateComparableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F048);
  }
  return result;
}

unint64_t sub_23C43EA84()
{
  unint64_t result;

  result = qword_256B9F050;
  if (!qword_256B9F050)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4574F4, &type metadata for DynamicPredicateComparableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F050);
  }
  return result;
}

unint64_t sub_23C43EAC8()
{
  unint64_t result;

  result = qword_256B9F058;
  if (!qword_256B9F058)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4574A4, &type metadata for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F058);
  }
  return result;
}

unint64_t sub_23C43EB0C()
{
  unint64_t result;

  result = qword_256B9F060;
  if (!qword_256B9F060)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateDynamicTypeSize, &type metadata for DynamicPredicateDynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B9F060);
  }
  return result;
}

unint64_t sub_23C43EB50()
{
  unint64_t result;

  result = qword_256B9F0A0;
  if (!qword_256B9F0A0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableKeyPath, &type metadata for DynamicPredicateComparableKeyPath);
    atomic_store(result, (unint64_t *)&qword_256B9F0A0);
  }
  return result;
}

unint64_t sub_23C43EB94()
{
  unint64_t result;

  result = qword_256B9F0A8;
  if (!qword_256B9F0A8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateDynamicTypeSize, &type metadata for DynamicPredicateDynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B9F0A8);
  }
  return result;
}

unint64_t sub_23C43EBDC()
{
  unint64_t result;

  result = qword_256B9F0B0;
  if (!qword_256B9F0B0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableValue.Stripped, &type metadata for DynamicPredicateComparableValue.Stripped);
    atomic_store(result, (unint64_t *)&qword_256B9F0B0);
  }
  return result;
}

unint64_t sub_23C43EC24()
{
  unint64_t result;

  result = qword_256B9F0B8;
  if (!qword_256B9F0B8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableValue, &type metadata for DynamicPredicateComparableValue);
    atomic_store(result, (unint64_t *)&qword_256B9F0B8);
  }
  return result;
}

uint64_t destroy for DynamicPredicateComparableValue(uint64_t result)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(result + 16);
  if (v1 >= 5)
    v1 = *(_DWORD *)result + 5;
  if (v1 >= 4)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16FitnessUtilities31DynamicPredicateComparableValueOwCP_0(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;

  v3 = *(unsigned __int8 *)(a2 + 16);
  while (2)
  {
    switch(v3)
    {
      case 0:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_BYTE *)(a1 + 16) = 0;
        break;
      case 1:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 16) = 1;
        break;
      case 2:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 16) = 2;
        break;
      case 3:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_BYTE *)(a1 + 16) = 3;
        break;
      case 4:
        v4 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v4;
        *(_BYTE *)(a1 + 16) = 4;
        swift_bridgeObjectRetain();
        break;
      default:
        v3 = *(_DWORD *)a2 + 5;
        continue;
    }
    break;
  }
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateComparableValue(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 5)
      v4 = *(_DWORD *)a1 + 5;
    if (v4 >= 4)
      swift_bridgeObjectRelease();
    v5 = *(unsigned __int8 *)(a2 + 16);
    while (2)
    {
      switch(v5)
      {
        case 0:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_BYTE *)(a1 + 16) = 0;
          break;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 16) = 1;
          break;
        case 2:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 16) = 2;
          break;
        case 3:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_BYTE *)(a1 + 16) = 3;
          break;
        case 4:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          *(_BYTE *)(a1 + 16) = 4;
          swift_bridgeObjectRetain();
          break;
        default:
          v5 = *(_DWORD *)a2 + 5;
          continue;
      }
      break;
    }
  }
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

_BYTE *assignWithTake for DynamicPredicateComparableValue(_BYTE *a1, _BYTE *a2)
{
  unsigned int v4;
  int v5;
  char v6;

  if (a1 != a2)
  {
    v4 = a1[16];
    if (v4 >= 5)
      v4 = *(_DWORD *)a1 + 5;
    if (v4 >= 4)
      swift_bridgeObjectRelease();
    v5 = a2[16];
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          *a1 = *a2;
          break;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          v6 = 1;
          break;
        case 2:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          v6 = 2;
          break;
        case 3:
          *a1 = *a2;
          v6 = 3;
          break;
        case 4:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v6 = 4;
          break;
        default:
          v5 = *(_DWORD *)a2 + 5;
          continue;
      }
      break;
    }
    a1[16] = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparableValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 >= 5)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparableValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23C43EF94(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 16);
  if (result >= 5)
    return (*(_DWORD *)a1 + 5);
  return result;
}

uint64_t sub_23C43EFB0(uint64_t result, unsigned int a2)
{
  if (a2 > 4)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 5;
    LOBYTE(a2) = 5;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue()
{
  return &type metadata for DynamicPredicateComparableValue;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparisonOperator(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparableValue.Stripped(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C43F0BC + 4 * byte_23C456E2D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C43F0F0 + 4 * byte_23C456E28[v4]))();
}

uint64_t sub_23C43F0F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43F0F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C43F100);
  return result;
}

uint64_t sub_23C43F10C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C43F114);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C43F118(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43F120(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.Stripped()
{
  return &type metadata for DynamicPredicateComparableValue.Stripped;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparableValue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparableValue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C43F218 + 4 * byte_23C456E37[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C43F24C + 4 * byte_23C456E32[v4]))();
}

uint64_t sub_23C43F24C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43F254(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C43F25CLL);
  return result;
}

uint64_t sub_23C43F268(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C43F270);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C43F274(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C43F27C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.CodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.GridSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.GridSizeClassCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.IntegerCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.IntegerCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.KeyPathCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.KeyPathCodingKeys;
}

uint64_t _s16FitnessUtilities31DynamicPredicateComparableValueO25DynamicTypeSizeCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C43F320 + 4 * byte_23C456E3C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C43F340 + 4 * byte_23C456E41[v4]))();
}

_BYTE *sub_23C43F320(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C43F340(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C43F348(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C43F350(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C43F358(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C43F360(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.StringCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.StringCodingKeys;
}

unint64_t sub_23C43F380()
{
  unint64_t result;

  result = qword_256B9F0C0;
  if (!qword_256B9F0C0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4570E4, &type metadata for DynamicPredicateComparableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0C0);
  }
  return result;
}

unint64_t sub_23C43F3C8()
{
  unint64_t result;

  result = qword_256B9F0C8;
  if (!qword_256B9F0C8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45719C, &type metadata for DynamicPredicateComparableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0C8);
  }
  return result;
}

unint64_t sub_23C43F410()
{
  unint64_t result;

  result = qword_256B9F0D0;
  if (!qword_256B9F0D0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457254, &type metadata for DynamicPredicateComparableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0D0);
  }
  return result;
}

unint64_t sub_23C43F458()
{
  unint64_t result;

  result = qword_256B9F0D8;
  if (!qword_256B9F0D8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45730C, &type metadata for DynamicPredicateComparableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0D8);
  }
  return result;
}

unint64_t sub_23C43F4A0()
{
  unint64_t result;

  result = qword_256B9F0E0;
  if (!qword_256B9F0E0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4573C4, &type metadata for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0E0);
  }
  return result;
}

unint64_t sub_23C43F4E8()
{
  unint64_t result;

  result = qword_256B9F0E8;
  if (!qword_256B9F0E8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45747C, &type metadata for DynamicPredicateComparableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0E8);
  }
  return result;
}

unint64_t sub_23C43F530()
{
  unint64_t result;

  result = qword_256B9F0F0;
  if (!qword_256B9F0F0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457334, &type metadata for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0F0);
  }
  return result;
}

unint64_t sub_23C43F578()
{
  unint64_t result;

  result = qword_256B9F0F8;
  if (!qword_256B9F0F8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45735C, &type metadata for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F0F8);
  }
  return result;
}

unint64_t sub_23C43F5C0()
{
  unint64_t result;

  result = qword_256B9F100;
  if (!qword_256B9F100)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45727C, &type metadata for DynamicPredicateComparableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F100);
  }
  return result;
}

unint64_t sub_23C43F608()
{
  unint64_t result;

  result = qword_256B9F108;
  if (!qword_256B9F108)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4572A4, &type metadata for DynamicPredicateComparableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F108);
  }
  return result;
}

unint64_t sub_23C43F650()
{
  unint64_t result;

  result = qword_256B9F110;
  if (!qword_256B9F110)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4571C4, &type metadata for DynamicPredicateComparableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F110);
  }
  return result;
}

unint64_t sub_23C43F698()
{
  unint64_t result;

  result = qword_256B9F118;
  if (!qword_256B9F118)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4571EC, &type metadata for DynamicPredicateComparableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F118);
  }
  return result;
}

unint64_t sub_23C43F6E0()
{
  unint64_t result;

  result = qword_256B9F120;
  if (!qword_256B9F120)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45710C, &type metadata for DynamicPredicateComparableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F120);
  }
  return result;
}

unint64_t sub_23C43F728()
{
  unint64_t result;

  result = qword_256B9F128;
  if (!qword_256B9F128)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457134, &type metadata for DynamicPredicateComparableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F128);
  }
  return result;
}

unint64_t sub_23C43F770()
{
  unint64_t result;

  result = qword_256B9F130;
  if (!qword_256B9F130)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457054, &type metadata for DynamicPredicateComparableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F130);
  }
  return result;
}

unint64_t sub_23C43F7B8()
{
  unint64_t result;

  result = qword_256B9F138;
  if (!qword_256B9F138)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45707C, &type metadata for DynamicPredicateComparableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F138);
  }
  return result;
}

unint64_t sub_23C43F800()
{
  unint64_t result;

  result = qword_256B9F140;
  if (!qword_256B9F140)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4573EC, &type metadata for DynamicPredicateComparableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F140);
  }
  return result;
}

unint64_t sub_23C43F848()
{
  unint64_t result;

  result = qword_256B9F148;
  if (!qword_256B9F148)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457414, &type metadata for DynamicPredicateComparableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F148);
  }
  return result;
}

uint64_t sub_23C43F88C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x5463696D616E7964 && a2 == 0xEF657A6953657079;
  if (v3 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A695364697267 && a2 == 0xED00007373616C43 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72656765746E69 && a2 == 0xE700000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6874615079656BLL && a2 == 0xE700000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23C43FAB0()
{
  return 12383;
}

uint64_t sub_23C43FABC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t DynamicPredicateBooleanValue.value.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

FitnessUtilities::DynamicPredicateBooleanValue __swiftcall DynamicPredicateBooleanValue.init(_:)(FitnessUtilities::DynamicPredicateBooleanValue result)
{
  FitnessUtilities::DynamicPredicateBooleanValue *v1;

  v1->value = result.value;
  return result;
}

uint64_t sub_23C43FB4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C440364(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C43FB74()
{
  sub_23C43FCAC();
  return sub_23C45647C();
}

uint64_t sub_23C43FB9C()
{
  sub_23C43FCAC();
  return sub_23C456488();
}

uint64_t DynamicPredicateBooleanValue.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F150);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43FCAC();
  sub_23C456470();
  sub_23C45638C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C43FCAC()
{
  unint64_t result;

  result = qword_256B9F158;
  if (!qword_256B9F158)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4578A0, &type metadata for DynamicPredicateBooleanValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F158);
  }
  return result;
}

uint64_t DynamicPredicateBooleanValue.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F160);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43FCAC();
  sub_23C456464();
  if (!v2)
  {
    v9 = sub_23C456320();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23C43FDF8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return DynamicPredicateBooleanValue.init(from:)(a1, a2);
}

uint64_t sub_23C43FE0C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F150);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C43FCAC();
  sub_23C456470();
  sub_23C45638C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t DynamicPredicateBooleanValue.hash(into:)()
{
  return sub_23C456440();
}

BOOL static DynamicPredicateBooleanValue.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DynamicPredicateBooleanValue.hashValue.getter()
{
  sub_23C456428();
  sub_23C456440();
  return sub_23C45644C();
}

uint64_t sub_23C43FF78()
{
  sub_23C456428();
  sub_23C456440();
  return sub_23C45644C();
}

uint64_t sub_23C43FFBC()
{
  return sub_23C456440();
}

uint64_t sub_23C43FFE4()
{
  sub_23C456428();
  sub_23C456440();
  return sub_23C45644C();
}

unint64_t sub_23C440028()
{
  unint64_t result;

  result = qword_256B9F168;
  if (!qword_256B9F168)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateBooleanValue, &type metadata for DynamicPredicateBooleanValue);
    atomic_store(result, (unint64_t *)&qword_256B9F168);
  }
  return result;
}

BOOL sub_23C44006C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateBooleanValue(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateBooleanValue(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C440170 + 4 * byte_23C4576E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C4401A4 + 4 * byte_23C4576E0[v4]))();
}

uint64_t sub_23C4401A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4401AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4401B4);
  return result;
}

uint64_t sub_23C4401C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4401C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C4401CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4401D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateBooleanValue()
{
  return &type metadata for DynamicPredicateBooleanValue;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateBooleanValue.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C440230 + 4 * byte_23C4576EA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C440250 + 4 * byte_23C4576EF[v4]))();
}

_BYTE *sub_23C440230(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C440250(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C440258(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C440260(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C440268(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C440270(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateBooleanValue.CodingKeys()
{
  return &type metadata for DynamicPredicateBooleanValue.CodingKeys;
}

unint64_t sub_23C440290()
{
  unint64_t result;

  result = qword_256B9F170;
  if (!qword_256B9F170)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457878, &type metadata for DynamicPredicateBooleanValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F170);
  }
  return result;
}

unint64_t sub_23C4402D8()
{
  unint64_t result;

  result = qword_256B9F178;
  if (!qword_256B9F178)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4577E8, &type metadata for DynamicPredicateBooleanValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F178);
  }
  return result;
}

unint64_t sub_23C440320()
{
  unint64_t result;

  result = qword_256B9F180;
  if (!qword_256B9F180)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457810, &type metadata for DynamicPredicateBooleanValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F180);
  }
  return result;
}

uint64_t sub_23C440364(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C4403E0()
{
  return 0x65756C6176;
}

uint64_t DynamicPredicateEqualityDescriptor.lhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_23C440408(v2, v3, v4);
}

uint64_t sub_23C440408(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 7u && ((1 << a3) & 0xC4) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t DynamicPredicateEqualityDescriptor.rhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 40);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_23C440408(v2, v3, v4);
}

__n128 DynamicPredicateEqualityDescriptor.init(lhs:rhs:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  char v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = *(_BYTE *)(a1 + 16);
  v4 = a2[1].n128_u8[0];
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_BYTE *)(a3 + 16) = v3;
  result = *a2;
  *(__n128 *)(a3 + 24) = *a2;
  *(_BYTE *)(a3 + 40) = v4;
  return result;
}

uint64_t sub_23C44046C(char a1)
{
  if ((a1 & 1) != 0)
    return 7563378;
  else
    return 7563372;
}

uint64_t sub_23C440488()
{
  char *v0;

  return sub_23C44046C(*v0);
}

uint64_t sub_23C440490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C44110C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C4404B4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23C4404C0()
{
  sub_23C440688();
  return sub_23C45647C();
}

uint64_t sub_23C4404E8()
{
  sub_23C440688();
  return sub_23C456488();
}

uint64_t DynamicPredicateEqualityDescriptor.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  char v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F188);
  v16 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v6 = v1[1];
  v8 = *((_BYTE *)v1 + 16);
  v9 = v1[3];
  v13 = v1[4];
  v14 = v9;
  v20 = *((unsigned __int8 *)v1 + 40);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C440688();
  sub_23C456470();
  v17 = v7;
  v18 = v6;
  v19 = v8;
  v21 = 0;
  sub_23C4406CC();
  v10 = v15;
  sub_23C4563B0();
  if (!v10)
  {
    v17 = v14;
    v18 = v13;
    v19 = v20;
    v21 = 1;
    sub_23C4563B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v5, v3);
}

unint64_t sub_23C440688()
{
  unint64_t result;

  result = qword_256B9F190;
  if (!qword_256B9F190)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457AA8, &type metadata for DynamicPredicateEqualityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F190);
  }
  return result;
}

unint64_t sub_23C4406CC()
{
  unint64_t result;

  result = qword_256B9F198;
  if (!qword_256B9F198)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableValue, &type metadata for DynamicPredicateEquatableValue);
    atomic_store(result, (unint64_t *)&qword_256B9F198);
  }
  return result;
}

uint64_t DynamicPredicateEqualityDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  int v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F1A0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C440688();
  sub_23C456464();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v21 = 0;
  sub_23C440940();
  sub_23C456344();
  v9 = v18;
  v21 = 1;
  v16 = v17;
  v20 = v19;
  sub_23C440408(v17, v18, v19);
  sub_23C456344();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = v17;
  v11 = v18;
  v12 = v19;
  v13 = v16;
  v14 = v20;
  sub_23C440408(v16, v9, v20);
  sub_23C440408(v10, v11, v12);
  sub_23C440984(v13, v9, v14);
  *(_QWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = v9;
  *(_BYTE *)(a2 + 16) = v14;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v11;
  *(_BYTE *)(a2 + 40) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_23C440984(v13, v9, v14);
  return sub_23C440984(v10, v11, v12);
}

unint64_t sub_23C440940()
{
  unint64_t result;

  result = qword_256B9F1A8;
  if (!qword_256B9F1A8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableValue, &type metadata for DynamicPredicateEquatableValue);
    atomic_store(result, (unint64_t *)&qword_256B9F1A8);
  }
  return result;
}

uint64_t sub_23C440984(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 7u && ((1 << a3) & 0xC4) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23C4409B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateEqualityDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C4409C4(_QWORD *a1)
{
  return DynamicPredicateEqualityDescriptor.encode(to:)(a1);
}

void DynamicPredicateEqualityDescriptor.hash(into:)()
{
  DynamicPredicateEquatableValue.hash(into:)();
  DynamicPredicateEquatableValue.hash(into:)();
}

uint64_t DynamicPredicateEqualityDescriptor.hashValue.getter()
{
  sub_23C456428();
  DynamicPredicateEquatableValue.hash(into:)();
  DynamicPredicateEquatableValue.hash(into:)();
  return sub_23C45644C();
}

uint64_t sub_23C440AC8()
{
  sub_23C456428();
  DynamicPredicateEquatableValue.hash(into:)();
  DynamicPredicateEquatableValue.hash(into:)();
  return sub_23C45644C();
}

void sub_23C440B4C()
{
  DynamicPredicateEquatableValue.hash(into:)();
  DynamicPredicateEquatableValue.hash(into:)();
}

uint64_t sub_23C440BB4()
{
  sub_23C456428();
  DynamicPredicateEquatableValue.hash(into:)();
  DynamicPredicateEquatableValue.hash(into:)();
  return sub_23C45644C();
}

uint64_t _s16FitnessUtilities34DynamicPredicateEqualityDescriptorV2eeoiySbAC_ACtFZ_0(__int128 *a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  __int128 v8;
  char v9;

  v1 = *((_BYTE *)a1 + 16);
  v2 = *((_QWORD *)a1 + 3);
  v3 = *((_QWORD *)a1 + 4);
  v4 = *((_BYTE *)a1 + 40);
  v8 = *a1;
  v9 = v1;
  _s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v8);
  if ((v5 & 1) != 0)
  {
    *(_QWORD *)&v8 = v2;
    *((_QWORD *)&v8 + 1) = v3;
    v9 = v4;
    _s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v8);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

unint64_t sub_23C440CD4()
{
  unint64_t result;

  result = qword_256B9F1B0;
  if (!qword_256B9F1B0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEqualityDescriptor, &type metadata for DynamicPredicateEqualityDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9F1B0);
  }
  return result;
}

uint64_t destroy for DynamicPredicateEqualityDescriptor(uint64_t a1)
{
  sub_23C440984(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return sub_23C440984(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for DynamicPredicateEqualityDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a2;
  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_23C440408(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(v2 + 24);
  v8 = *(_QWORD *)(v2 + 32);
  LOBYTE(v2) = *(_BYTE *)(v2 + 40);
  sub_23C440408(v7, v8, v2);
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v2;
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateEqualityDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;

  v2 = a2;
  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_23C440408(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  sub_23C440984(v7, v8, v9);
  v10 = *(_QWORD *)(v2 + 24);
  v11 = *(_QWORD *)(v2 + 32);
  LOBYTE(v2) = *(_BYTE *)(v2 + 40);
  sub_23C440408(v10, v11, v2);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 32) = v11;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v2;
  sub_23C440984(v12, v13, v14);
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

uint64_t assignWithTake for DynamicPredicateEqualityDescriptor(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v7 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  sub_23C440984(v5, v6, v7);
  v8 = *(_BYTE *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_23C440984(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEqualityDescriptor(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 7)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateEqualityDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 249;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEqualityDescriptor()
{
  return &type metadata for DynamicPredicateEqualityDescriptor;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateEqualityDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C440FB4 + 4 * byte_23C4578F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C440FE8 + 4 * byte_23C4578F0[v4]))();
}

uint64_t sub_23C440FE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C440FF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C440FF8);
  return result;
}

uint64_t sub_23C441004(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C44100CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C441010(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C441018(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEqualityDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateEqualityDescriptor.CodingKeys;
}

unint64_t sub_23C441038()
{
  unint64_t result;

  result = qword_256B9F1B8;
  if (!qword_256B9F1B8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457A80, &type metadata for DynamicPredicateEqualityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F1B8);
  }
  return result;
}

unint64_t sub_23C441080()
{
  unint64_t result;

  result = qword_256B9F1C0;
  if (!qword_256B9F1C0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4579F0, &type metadata for DynamicPredicateEqualityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F1C0);
  }
  return result;
}

unint64_t sub_23C4410C8()
{
  unint64_t result;

  result = qword_256B9F1C8;
  if (!qword_256B9F1C8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C457A18, &type metadata for DynamicPredicateEqualityDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F1C8);
  }
  return result;
}

uint64_t sub_23C44110C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7563372 && a2 == 0xE300000000000000;
  if (v3 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7563378 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

FitnessUtilities::DynamicPredicateComparableKeyPath_optional __swiftcall DynamicPredicateComparableKeyPath.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  FitnessUtilities::DynamicPredicateComparableKeyPath_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23C4562E4();
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

uint64_t DynamicPredicateComparableKeyPath.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x657A695364697267;
  else
    return 0x5463696D616E7964;
}

uint64_t sub_23C441284(char *a1, char *a2)
{
  return sub_23C4414D8(*a1, *a2);
}

FitnessUtilities::DynamicPredicateComparableKeyPath_optional sub_23C441290(Swift::String *a1)
{
  return DynamicPredicateComparableKeyPath.init(rawValue:)(*a1);
}

uint64_t sub_23C44129C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = DynamicPredicateComparableKeyPath.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23C4412C0()
{
  sub_23C441494();
  return sub_23C456098();
}

uint64_t sub_23C44131C()
{
  sub_23C441494();
  return sub_23C45605C();
}

unint64_t sub_23C44136C()
{
  unint64_t result;

  result = qword_256B9F1D0;
  if (!qword_256B9F1D0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableKeyPath, &type metadata for DynamicPredicateComparableKeyPath);
    atomic_store(result, (unint64_t *)&qword_256B9F1D0);
  }
  return result;
}

uint64_t sub_23C4413B0()
{
  return sub_23C441928();
}

uint64_t sub_23C4413B8()
{
  return sub_23C43BDE8();
}

uint64_t sub_23C4413C0()
{
  return sub_23C441BB4();
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparableKeyPath(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C441414 + 4 * byte_23C457B05[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C441448 + 4 * byte_23C457B00[v4]))();
}

uint64_t sub_23C441448(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C441450(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C441458);
  return result;
}

uint64_t sub_23C441464(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C44146CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C441470(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C441478(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableKeyPath()
{
  return &type metadata for DynamicPredicateComparableKeyPath;
}

unint64_t sub_23C441494()
{
  unint64_t result;

  result = qword_256B9F1D8;
  if (!qword_256B9F1D8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparableKeyPath, &type metadata for DynamicPredicateComparableKeyPath);
    atomic_store(result, (unint64_t *)&qword_256B9F1D8);
  }
  return result;
}

uint64_t sub_23C4414D8(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x657A695364697267;
  else
    v3 = 0x5463696D616E7964;
  if (v2)
    v4 = 0xEF657A6953657079;
  else
    v4 = 0xED00007373616C43;
  if ((a2 & 1) != 0)
    v5 = 0x657A695364697267;
  else
    v5 = 0x5463696D616E7964;
  if ((a2 & 1) != 0)
    v6 = 0xED00007373616C43;
  else
    v6 = 0xEF657A6953657079;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_23C4563D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_23C441590(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23C4415DC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23C441678 + 4 * byte_23C457C35[a2]))(0x5463696D616E7964);
}

uint64_t sub_23C441678(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x5463696D616E7964 && v1 == 0xEF657A6953657079)
    v2 = 1;
  else
    v2 = sub_23C4563D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_23C441758(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aPhone_1[8 * a1] == *(_QWORD *)&aPhone_1[8 * a2] && qword_23C457DB0[a1] == qword_23C457DB0[a2])
    v3 = 1;
  else
    v3 = sub_23C4563D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23C4417DC(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23C441828(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23C441890 + 4 * byte_23C457C3E[a2]))(0x5472657461657267);
}

uint64_t sub_23C441890(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x5472657461657267 && v1 == 0xEB000000006E6168)
    v2 = 1;
  else
    v2 = sub_23C4563D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_23C441928()
{
  sub_23C456428();
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

void sub_23C4419C0(char a1)
{
  sub_23C456428();
  __asm { BR              X10 }
}

uint64_t sub_23C441A18()
{
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

void sub_23C441ABC(uint64_t a1, char a2)
{
  sub_23C456428();
  __asm { BR              X10 }
}

uint64_t sub_23C441B10()
{
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

uint64_t sub_23C441BB4()
{
  sub_23C456428();
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

FitnessUtilities::DynamicPredicateEquatableKeyPath_optional __swiftcall DynamicPredicateEquatableKeyPath.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FitnessUtilities::DynamicPredicateEquatableKeyPath_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23C4562E4();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t DynamicPredicateEquatableKeyPath.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C441CD8 + 4 * byte_23C457C4C[*v0]))(0xD000000000000013, 0x800000023C45A600);
}

uint64_t sub_23C441CD8()
{
  return 0x5463696D616E7964;
}

uint64_t sub_23C441CFC()
{
  return 0x657A695364697267;
}

uint64_t sub_23C441D20()
{
  return 0x6D726F6674616C70;
}

unint64_t sub_23C441D38()
{
  return 0xD000000000000011;
}

void sub_23C441D54(char *a1)
{
  sub_23C441590(*a1);
}

FitnessUtilities::DynamicPredicateEquatableKeyPath_optional sub_23C441D60(Swift::String *a1)
{
  return DynamicPredicateEquatableKeyPath.init(rawValue:)(*a1);
}

uint64_t sub_23C441D6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = DynamicPredicateEquatableKeyPath.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23C441D90()
{
  sub_23C441F64();
  return sub_23C456098();
}

uint64_t sub_23C441DEC()
{
  sub_23C441F64();
  return sub_23C45605C();
}

unint64_t sub_23C441E3C()
{
  unint64_t result;

  result = qword_256B9F1E0;
  if (!qword_256B9F1E0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableKeyPath, &type metadata for DynamicPredicateEquatableKeyPath);
    atomic_store(result, (unint64_t *)&qword_256B9F1E0);
  }
  return result;
}

void sub_23C441E80()
{
  char *v0;

  sub_23C4419C0(*v0);
}

void sub_23C441E88(uint64_t a1)
{
  char *v1;

  sub_23C43BE58(a1, *v1);
}

void sub_23C441E90(uint64_t a1)
{
  char *v1;

  sub_23C441ABC(a1, *v1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateEquatableKeyPath(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C441EE4 + 4 * byte_23C457C56[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C441F18 + 4 * byte_23C457C51[v4]))();
}

uint64_t sub_23C441F18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C441F20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C441F28);
  return result;
}

uint64_t sub_23C441F34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C441F3CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C441F40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C441F48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableKeyPath()
{
  return &type metadata for DynamicPredicateEquatableKeyPath;
}

unint64_t sub_23C441F64()
{
  unint64_t result;

  result = qword_256B9F1E8[0];
  if (!qword_256B9F1E8[0])
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableKeyPath, &type metadata for DynamicPredicateEquatableKeyPath);
    atomic_store(result, qword_256B9F1E8);
  }
  return result;
}

id UnsafeCodableBox.base.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

void UnsafeCodableBox.init(_:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_getMetatypeMetadata();
  v4 = a1;
  v5 = sub_23C456494();
  v7 = v6;

  *a2 = a1;
  a2[1] = v5;
  a2[2] = v7;
  a2[3] = a1;
}

uint64_t sub_23C442030()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_23C4562E4();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_23C442080(char a1)
{
  if ((a1 & 1) != 0)
    return 1701869940;
  else
    return 0x73736572646461;
}

uint64_t sub_23C4420B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24261F5D0](&unk_23C457F50, a3);
  return sub_23C4563E0();
}

uint64_t sub_23C442104(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C457F50, a1);
  return sub_23C456074();
}

uint64_t sub_23C442150()
{
  MEMORY[0x24261F5D0](&unk_23C457F50);
  return sub_23C45608C();
}

uint64_t sub_23C4421A0()
{
  MEMORY[0x24261F5D0](&unk_23C457F50);
  return sub_23C456080();
}

uint64_t sub_23C4421F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C442030();
  *a1 = result;
  return result;
}

uint64_t sub_23C44221C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23C442080(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C442244()
{
  char *v0;

  return sub_23C442080(*v0);
}

uint64_t sub_23C44224C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C442030();
  *a1 = result;
  return result;
}

uint64_t sub_23C442270@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C43D560();
  *a1 = result;
  return result;
}

uint64_t sub_23C442298(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C457FF0, a1);
  return sub_23C45647C();
}

uint64_t sub_23C4422CC(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C457FF0, a1);
  return sub_23C456488();
}

uint64_t UnsafeCodableBox.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  char v21;

  v19 = a5;
  v7 = type metadata accessor for UnsafeCodableBox.CodingKeys(255, a2, a3, a4);
  MEMORY[0x24261F5D0](&unk_23C457FF0, v7);
  v8 = sub_23C45635C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C456464();
  if (!v5)
  {
    v12 = v19;
    v21 = 0;
    v13 = sub_23C456338();
    v20 = 1;
    v15 = sub_23C456314();
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    *v12 = 0;
    v12[1] = v15;
    v12[2] = v17;
    v12[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for UnsafeCodableBox.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeCodableBox.CodingKeys);
}

uint64_t UnsafeCodableBox.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;

  v6 = type metadata accessor for UnsafeCodableBox.CodingKeys(255, *(_QWORD *)(a2 + 16), a3, a4);
  MEMORY[0x24261F5D0](&unk_23C457FF0, v6);
  v7 = sub_23C4563BC();
  v15 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v14 - v8;
  v10 = *(_QWORD *)(v4 + 8);
  v14[0] = *(_QWORD *)(v4 + 16);
  v14[1] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C456470();
  v18 = 0;
  v11 = v16;
  sub_23C4563A4();
  if (v11)
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v9, v7);
  v13 = v15;
  v17 = 1;
  sub_23C456380();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v9, v7);
}

uint64_t sub_23C4425D4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  return UnsafeCodableBox.init(from:)(a1, *(_QWORD *)(a2 + 16), a3, a4, a5);
}

uint64_t sub_23C4425EC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return UnsafeCodableBox.encode(to:)(a1, a2, a3, a4);
}

id static UnsafeCodableBox.== infix(_:_:)(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v6;

  v4 = *a1;
  if (v4)
    return objc_msgSend(v4, sel_isEqual_, *a2);
  type metadata accessor for UnsafeCodableBox(0, a3, a3, a4);
  v6 = UnsafeCodableBox.hashValue.getter();
  return (id)(v6 == UnsafeCodableBox.hashValue.getter());
}

uint64_t UnsafeCodableBox.hashValue.getter()
{
  sub_23C456428();
  UnsafeCodableBox.hash(into:)();
  return sub_23C45644C();
}

uint64_t type metadata accessor for UnsafeCodableBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeCodableBox);
}

void UnsafeCodableBox.hash(into:)()
{
  id *v0;
  id v1;

  if (*v0)
  {
    v1 = *v0;
    sub_23C456224();

  }
  else
  {
    swift_bridgeObjectRetain();
    sub_23C455FF0();
    swift_bridgeObjectRelease();
    sub_23C456434();
  }
}

uint64_t sub_23C4427AC()
{
  sub_23C456428();
  UnsafeCodableBox.hash(into:)();
  return sub_23C45644C();
}

void sub_23C4427E4()
{
  JUMPOUT(0x24261F5D0);
}

id sub_23C4427F4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return static UnsafeCodableBox.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), a4);
}

uint64_t sub_23C4427FC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C442804(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *sub_23C44282C(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23C442868(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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

uint64_t sub_23C4428DC(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t sub_23C442928(uint64_t a1, int a2)
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

uint64_t sub_23C442970(uint64_t result, int a2, int a3)
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

uint64_t sub_23C4429B0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C4429B8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C442A04 + 4 * byte_23C457DD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C442A38 + 4 * byte_23C457DD0[v4]))();
}

uint64_t sub_23C442A38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C442A40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C442A48);
  return result;
}

uint64_t sub_23C442A54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C442A5CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C442A60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C442A68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23C442A74()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C442A84()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C442A94()
{
  JUMPOUT(0x24261F5D0);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24261F564](a1, v6, a5);
}

uint64_t DynamicPredicateComparisonOperator.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C442B0C + 4 * byte_23C458040[a1]))(0xD000000000000012, 0x800000023C45A650);
}

uint64_t sub_23C442B0C()
{
  return 0x5472657461657267;
}

uint64_t sub_23C442B2C()
{
  return 0x6E6168547373656CLL;
}

uint64_t sub_23C442B58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = DynamicPredicateComparisonOperator.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == DynamicPredicateComparisonOperator.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C4563D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C442BE0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16FitnessUtilities34DynamicPredicateComparisonOperatorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23C442C0C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = DynamicPredicateComparisonOperator.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C442C34()
{
  sub_23C442F34();
  return sub_23C456098();
}

uint64_t sub_23C442C90()
{
  sub_23C442F34();
  return sub_23C45605C();
}

uint64_t sub_23C442CDC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C456428();
  DynamicPredicateComparisonOperator.rawValue.getter(v1);
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

uint64_t sub_23C442D3C()
{
  unsigned __int8 *v0;

  DynamicPredicateComparisonOperator.rawValue.getter(*v0);
  sub_23C455FF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C442D7C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23C456428();
  DynamicPredicateComparisonOperator.rawValue.getter(v1);
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

uint64_t _s16FitnessUtilities34DynamicPredicateComparisonOperatorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C4562E4();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_23C442E24()
{
  unint64_t result;

  result = qword_256B9F2F0;
  if (!qword_256B9F2F0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparisonOperator, &type metadata for DynamicPredicateComparisonOperator);
    atomic_store(result, (unint64_t *)&qword_256B9F2F0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparisonOperator(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C442EB4 + 4 * byte_23C458049[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C442EE8 + 4 * byte_23C458044[v4]))();
}

uint64_t sub_23C442EE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C442EF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C442EF8);
  return result;
}

uint64_t sub_23C442F04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C442F0CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C442F10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C442F18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparisonOperator()
{
  return &type metadata for DynamicPredicateComparisonOperator;
}

unint64_t sub_23C442F34()
{
  unint64_t result;

  result = qword_256B9F2F8;
  if (!qword_256B9F2F8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparisonOperator, &type metadata for DynamicPredicateComparisonOperator);
    atomic_store(result, (unint64_t *)&qword_256B9F2F8);
  }
  return result;
}

uint64_t DynamicPredicateDynamicTypeSize.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

uint64_t sub_23C442F88@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = _s16FitnessUtilities016DynamicPredicateC8TypeSizeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_23C442FB0(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

BOOL static DynamicPredicateDynamicTypeSize.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL sub_23C442FD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_23C442FE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_23C442FF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_23C44300C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_23C443020()
{
  sub_23C443330();
  return sub_23C4560A4();
}

uint64_t sub_23C44307C()
{
  sub_23C443330();
  return sub_23C456068();
}

uint64_t sub_23C4430C8()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C44310C()
{
  return sub_23C456434();
}

uint64_t sub_23C443138()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t _s16FitnessUtilities016DynamicPredicateC8TypeSizeO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0xD)
    return 13;
  else
    return a1 - 1;
}

unint64_t sub_23C443190()
{
  unint64_t result;

  result = qword_256B9F300;
  if (!qword_256B9F300)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateDynamicTypeSize, &type metadata for DynamicPredicateDynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256B9F300);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateDynamicTypeSize(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateDynamicTypeSize(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_23C4432B0 + 4 * byte_23C458185[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_23C4432E4 + 4 * asc_23C458180[v4]))();
}

uint64_t sub_23C4432E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4432EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4432F4);
  return result;
}

uint64_t sub_23C443300(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C443308);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_23C44330C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C443314(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateDynamicTypeSize()
{
  return &type metadata for DynamicPredicateDynamicTypeSize;
}

unint64_t sub_23C443330()
{
  unint64_t result;

  result = qword_256B9F308[0];
  if (!qword_256B9F308[0])
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateDynamicTypeSize, &type metadata for DynamicPredicateDynamicTypeSize);
    atomic_store(result, qword_256B9F308);
  }
  return result;
}

uint64_t PortableEnum.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
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
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;

  v25 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v22 - v9;
  v23 = sub_23C456230();
  v11 = *(_QWORD *)(v23 - 8);
  v12 = MEMORY[0x24BDAC7A8](v23);
  v14 = (char *)&v22 - v13;
  v15 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v24 = a1;
  v18(v10, a1, AssociatedTypeWitness);
  sub_23C456050();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v23);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v25, v24, AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v24, AssociatedTypeWitness);
    v20 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v20(v17, v14, a2);
    v20(v25, v17, a2);
  }
  type metadata accessor for PortableEnum(0, a2, a3, v19);
  return swift_storeEnumTagMultiPayload();
}

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
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;

  v27 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_23C456230();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v26 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1)
  {
    v19 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v19(a1, v8);
    v19((uint64_t)v12, v8);
    v21 = type metadata accessor for PortableEnum(0, a2, a3, v20);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v27, 1, 1, v21);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v12, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, AssociatedTypeWitness);
    v23 = v27;
    PortableEnum.init(rawValue:)((uint64_t)v16, a2, a3, v27);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, AssociatedTypeWitness);
    v25 = type metadata accessor for PortableEnum(0, a2, a3, v24);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v23, 0, 1, v25);
  }
}

uint64_t type metadata accessor for PortableEnum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PortableEnum);
}

uint64_t PortableEnum.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a4, a1, a2);
  type metadata accessor for PortableEnum(0, a2, a3, v6);
  return swift_storeEnumTagMultiPayload();
}

uint64_t PortableEnum.rawValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
    sub_23C456044();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  else
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a2, v9, AssociatedTypeWitness);
  }
}

uint64_t PortableEnum.unwrapped.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(v9 + 32))(a2, v6, *(_QWORD *)(a1 + 16));
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v9 + 56))(a2, 1, 1, *(_QWORD *)(a1 + 16));
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }
}

uint64_t static PortableEnum.?? infix(_:_:)@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD v14[2];

  v9 = type metadata accessor for PortableEnum(0, a3, a4, a3);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v14 - v11, a1, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, v12, a3);
  a2();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_23C443AB4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E776F6E6BLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23C443B94(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E776F6E6BLL;
  else
    return 0x6E776F6E6B6E75;
}

BOOL sub_23C443BC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23C43C680(*a1, *a2);
}

uint64_t sub_23C443BDC()
{
  return sub_23C43C79C();
}

uint64_t sub_23C443BEC()
{
  return sub_23C43C690();
}

uint64_t sub_23C443BFC()
{
  sub_23C456428();
  sub_23C43C690();
  return sub_23C45644C();
}

uint64_t sub_23C443C40()
{
  char *v0;

  return sub_23C443B94(*v0);
}

uint64_t sub_23C443C50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C443AB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C443C7C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C43D560();
  *a1 = result;
  return result;
}

uint64_t sub_23C443CA4(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C458740, a1);
  return sub_23C45647C();
}

uint64_t sub_23C443CD8(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C458740, a1);
  return sub_23C456488();
}

uint64_t sub_23C443D0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C43FABC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C443D3C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23C43C9DC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23C443D68(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C4587E0, a1);
  return sub_23C45647C();
}

uint64_t sub_23C443D9C(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C4587E0, a1);
  return sub_23C456488();
}

uint64_t sub_23C443DD0(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C458790, a1);
  return sub_23C45647C();
}

uint64_t sub_23C443E04(uint64_t a1)
{
  MEMORY[0x24261F5D0](&unk_23C458790, a1);
  return sub_23C456488();
}

uint64_t static PortableEnum<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  char v15;
  uint64_t v17;

  v5 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PortableEnum(0, v8, v10, v9);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - v13, a1, v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v14, a3);
    v15 = sub_23C455FB4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a3);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t static PortableEnum<>.~= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  char v15;
  uint64_t v17;

  v5 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PortableEnum(0, v8, v10, v9);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - v13, a2, v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v14, a3);
    v15 = sub_23C455FB4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a3);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t Set.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];

  v10 = type metadata accessor for PortableEnum(0, a3, a5, a4);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v15 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)v15 - v12, a1, a3);
  swift_storeEnumTagMultiPayload();
  v15[0] = a4;
  v15[1] = a6;
  MEMORY[0x24261F5D0](&protocol conformance descriptor for <> PortableEnum<A>, v10, v15);
  LOBYTE(a6) = sub_23C4561AC();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return a6 & 1;
}

uint64_t PortableEnum<>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
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
  _QWORD v21[2];

  v5 = v4;
  v21[0] = a3;
  v21[1] = a4;
  v7 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)v21 - v11;
  v13 = *(_QWORD *)(v7 - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v18, v5, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v18, v7);
    sub_23C455F78();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v18, AssociatedTypeWitness);
    sub_23C455F78();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, AssociatedTypeWitness);
  }
}

uint64_t PortableEnum<>.hashValue.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE v7[72];

  sub_23C456428();
  PortableEnum<>.hash(into:)((uint64_t)v7, a1, a2, a3);
  return sub_23C45644C();
}

uint64_t sub_23C44437C(uint64_t a1, uint64_t a2)
{
  return PortableEnum<>.hashValue.getter(a1, *(_QWORD *)(a2 - 8), *(_QWORD *)(a2 - 16));
}

uint64_t sub_23C444388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PortableEnum<>.hash(into:)(a1, a2, *(_QWORD *)(a3 - 8), *(_QWORD *)(a3 - 16));
}

uint64_t sub_23C444394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[72];

  v5 = *(_QWORD *)(a3 - 16);
  v4 = *(_QWORD *)(a3 - 8);
  sub_23C456428();
  PortableEnum<>.hash(into:)((uint64_t)v7, a2, v4, v5);
  return sub_23C45644C();
}

uint64_t PortableEnum<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t AssociatedTypeWitness;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
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
  char v64;
  char v65;

  v58 = a4;
  v59 = a6;
  v9 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v10 = type metadata accessor for PortableEnum.KnownCodingKeys(255, v9, v8, a4);
  v51 = MEMORY[0x24261F5D0](&unk_23C4587E0, v10);
  v52 = v10;
  v57 = sub_23C4563BC();
  v55 = *(_QWORD *)(v57 - 8);
  v11 = MEMORY[0x24BDAC7A8](v57);
  v53 = (char *)&v42 - v12;
  v56 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v54 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PortableEnum.UnknownCodingKeys(255, v9, v8, v14);
  v16 = MEMORY[0x24261F5D0](&unk_23C458790, v15);
  v46 = v15;
  v44 = v16;
  v17 = sub_23C4563BC();
  v49 = *(_QWORD *)(v17 - 8);
  v50 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v47 = (char *)&v42 - v18;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v45 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v43 = (char *)&v42 - v20;
  v21 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = v9;
  v25 = type metadata accessor for PortableEnum.CodingKeys(255, v9, v8, v24);
  MEMORY[0x24261F5D0](&unk_23C458740, v25);
  v26 = sub_23C4563BC();
  v61 = *(_QWORD *)(v26 - 8);
  v62 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v42 - v27;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C456470();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v63, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v29 = v56;
    v30 = v54;
    v31 = v60;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v54, v23, v60);
    v65 = 1;
    v32 = v53;
    v33 = v62;
    sub_23C456368();
    v34 = v57;
    sub_23C4563B0();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v34);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  }
  else
  {
    v35 = v45;
    v36 = v43;
    v37 = v23;
    v38 = AssociatedTypeWitness;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v43, v37, AssociatedTypeWitness);
    v64 = 0;
    v39 = v47;
    v33 = v62;
    sub_23C456368();
    v40 = v50;
    sub_23C4563B0();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v39, v40);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v38);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v28, v33);
}

uint64_t type metadata accessor for PortableEnum.KnownCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PortableEnum.KnownCodingKeys);
}

uint64_t type metadata accessor for PortableEnum.UnknownCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PortableEnum.UnknownCodingKeys);
}

uint64_t type metadata accessor for PortableEnum.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PortableEnum.CodingKeys);
}

uint64_t PortableEnum<>.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
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
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *v44;
  char *v45;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  __int128 v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  _QWORD *v65;
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
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char *v89;

  v71 = a6;
  v69 = a3;
  v80 = a7;
  v10 = type metadata accessor for PortableEnum.KnownCodingKeys(255, a2, a5, a4);
  v77 = MEMORY[0x24261F5D0](&unk_23C4587E0, v10);
  v78 = v10;
  v68 = sub_23C45635C();
  v73 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v79 = (char *)&v60 - v11;
  v13 = type metadata accessor for PortableEnum.UnknownCodingKeys(255, a2, a5, v12);
  v74 = MEMORY[0x24261F5D0](&unk_23C458790, v13);
  v75 = v13;
  v67 = sub_23C45635C();
  v72 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v76 = (char *)&v60 - v14;
  v16 = type metadata accessor for PortableEnum.CodingKeys(255, a2, a5, v15);
  MEMORY[0x24261F5D0](&unk_23C458740, v16);
  v83 = sub_23C45635C();
  v81 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v18 = (char *)&v60 - v17;
  v84 = a2;
  v70 = a5;
  v82 = type metadata accessor for PortableEnum(0, a2, a5, v19);
  v66 = *(_QWORD *)(v82 - 8);
  v20 = MEMORY[0x24BDAC7A8](v82);
  v22 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v60 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v60 - v26;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v28 = v89;
  sub_23C456464();
  v29 = (uint64_t)a1;
  if (!v28)
  {
    v62 = v22;
    v63 = v25;
    v61 = v27;
    v30 = v82;
    v64 = 0;
    v65 = a1;
    v31 = v83;
    v89 = v18;
    *(_QWORD *)&v85 = sub_23C456350();
    v32 = sub_23C4560E0();
    MEMORY[0x24261F5D0](MEMORY[0x24BEE12C8], v32);
    *(_QWORD *)&v87 = sub_23C456284();
    *((_QWORD *)&v87 + 1) = v33;
    *(_QWORD *)&v88 = v34;
    *((_QWORD *)&v88 + 1) = v35;
    v36 = sub_23C456278();
    MEMORY[0x24261F5D0](MEMORY[0x24BEE2190], v36);
    sub_23C4561DC();
    v37 = v85;
    if (v85 == 2 || (v60 = v87, v85 = v87, v86 = v88, (sub_23C4561E8() & 1) == 0))
    {
      v41 = sub_23C4562A8();
      swift_allocError();
      v42 = v31;
      v44 = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F098);
      *v44 = v30;
      v45 = v89;
      sub_23C4562FC();
      sub_23C45629C();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v44, *MEMORY[0x24BEE26D0], v41);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v45, v42);
      goto LABEL_9;
    }
    if ((v37 & 1) != 0)
    {
      LOBYTE(v85) = 1;
      v47 = v79;
      v48 = v89;
      v49 = v64;
      sub_23C4562F0();
      v50 = v31;
      v51 = v80;
      if (v49)
      {
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v48, v50);
        goto LABEL_9;
      }
      v55 = v62;
      v56 = v68;
      sub_23C456344();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v47, v56);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v48, v50);
      v57 = v30;
      swift_storeEnumTagMultiPayload();
      v58 = *(void (**)(char *, char *, uint64_t))(v66 + 32);
      v59 = v61;
      v58(v61, v55, v30);
    }
    else
    {
      LOBYTE(v85) = 0;
      v38 = v76;
      v39 = v89;
      v40 = v64;
      sub_23C4562F0();
      if (v40)
      {
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v39, v31);
LABEL_9:
        v29 = (uint64_t)v65;
        return __swift_destroy_boxed_opaque_existential_1(v29);
      }
      swift_getAssociatedTypeWitness();
      v52 = v63;
      v53 = v67;
      sub_23C456344();
      v54 = v81;
      (*(void (**)(char *, uint64_t))(v72 + 8))(v38, v53);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v39, v31);
      v57 = v30;
      swift_storeEnumTagMultiPayload();
      v58 = *(void (**)(char *, char *, uint64_t))(v66 + 32);
      v59 = v61;
      v58(v61, v52, v30);
      v51 = v80;
    }
    v58(v51, v59, v57);
    goto LABEL_9;
  }
  return __swift_destroy_boxed_opaque_existential_1(v29);
}

uint64_t sub_23C444EB0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  return PortableEnum<>.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8), a4, *(_QWORD *)(a2 + 24), *(_QWORD *)(a3 - 24), a5);
}

uint64_t sub_23C444ED8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return PortableEnum<>.encode(to:)(a1, a2, a3, *(_QWORD *)(a3 - 16), a5, *(_QWORD *)(a3 - 32));
}

uint64_t static PortableEnum<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t TupleTypeMetadata2;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  char *v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v36 = a4;
  v37 = a6;
  v41 = a1;
  v42 = a2;
  v40 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v35 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v34 = (char *)&v33 - v10;
  v12 = type metadata accessor for PortableEnum(0, a3, a5, v11);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v33 - v17;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v38 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v20 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v22 = (char *)&v33 - v21;
  v23 = (char *)&v33 + *(int *)(v20 + 48) - v21;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v24((char *)&v33 - v21, v41, v12);
  v24(v23, v42, v12);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v24(v18, (uint64_t)v22, v12);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v29 = v39;
      v30 = v34;
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v34, v23, AssociatedTypeWitness);
      v27 = sub_23C455FB4();
      v31 = *(void (**)(char *, uint64_t))(v29 + 8);
      v31(v30, AssociatedTypeWitness);
      v31(v18, AssociatedTypeWitness);
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_7;
  }
  v24(v16, (uint64_t)v22, v12);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v16, a3);
LABEL_7:
    v27 = 0;
    v13 = v38;
    v12 = TupleTypeMetadata2;
    goto LABEL_9;
  }
  v25 = v40;
  v26 = v35;
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v35, v23, a3);
  v27 = sub_23C455FB4();
  v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v26, a3);
  v28(v16, a3);
LABEL_9:
  (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v12);
  return v27 & 1;
}

uint64_t sub_23C4451E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[2];

  v3 = *(_QWORD *)(*(_QWORD *)(a3 - 16) + 8);
  v5[0] = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  v5[1] = v3;
  return MEMORY[0x24261F5D0](&protocol conformance descriptor for <> PortableEnum<A>, a1, v5);
}

uint64_t sub_23C445224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static PortableEnum<>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a4 - 8), *(_QWORD *)(a3 + 24), *(_QWORD *)(a4 - 16));
}

uint64_t sub_23C445238()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_23C4452D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
    v9 = *(_QWORD *)(v7 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64);
  v10 = (*(_BYTE *)(v8 + 80) | *(_BYTE *)(v7 + 80));
  if (v10 <= 7
    && (unint64_t)(v9 + 1) <= 0x18
    && ((*(_DWORD *)(v8 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) == 0)
  {
    v14 = *((unsigned __int8 *)a2 + v9);
    if (v14 >= 2)
    {
      if (v9 <= 3)
        v15 = v9;
      else
        v15 = 4;
      __asm { BR              X14 }
    }
    if (v14 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v9) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
      *((_BYTE *)a1 + v9) = 0;
    }
  }
  else
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v10 + 16) & ~v10));
    swift_retain();
  }
  return a1;
}

uint64_t sub_23C44542C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_QWORD *)(v3 - 8);
  if (*(_QWORD *)(v7 + 64) > v6)
    v6 = *(_QWORD *)(v7 + 64);
  v8 = *(unsigned __int8 *)(a1 + v6);
  if (v8 >= 2)
  {
    if (v6 <= 3)
      v9 = v6;
    else
      v9 = 4;
    __asm { BR              X15 }
  }
  if (v8 == 1)
  {
    v5 = *(_QWORD *)(v3 - 8);
    v10 = v3;
  }
  else
  {
    v10 = AssociatedTypeWitness;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v10);
}

uint64_t sub_23C445508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
    v9 = *(_QWORD *)(v7 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64);
  v10 = *(unsigned __int8 *)(a2 + v9);
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v11 = v9;
    else
      v11 = 4;
    __asm { BR              X14 }
  }
  v12 = v10 == 1;
  if (v10 == 1)
  {
    v7 = *(_QWORD *)(v5 - 8);
    v13 = v5;
  }
  else
  {
    v13 = AssociatedTypeWitness;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v13);
  *(_BYTE *)(a1 + v9) = v12;
  return a1;
}

uint64_t sub_23C445608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v7 = AssociatedTypeWitness;
    v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v9 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v9 + 64) <= *(_QWORD *)(v8 + 64))
      v10 = *(_QWORD *)(v8 + 64);
    else
      v10 = *(_QWORD *)(v9 + 64);
    v11 = *(unsigned __int8 *)(a1 + v10);
    if (v11 >= 2)
    {
      if (v10 <= 3)
        v12 = v10;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    if (v11 == 1)
      v13 = *(_QWORD *)(v5 - 8);
    else
      v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
    if (v11 == 1)
      v14 = v5;
    else
      v14 = AssociatedTypeWitness;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v14);
    v15 = *(unsigned __int8 *)(a2 + v10);
    if (v15 >= 2)
    {
      if (v10 <= 3)
        v16 = v10;
      else
        v16 = 4;
      __asm { BR              X12 }
    }
    v17 = v15 == 1;
    if (v15 == 1)
      v18 = v9;
    else
      v18 = v8;
    if (v15 == 1)
      v19 = v5;
    else
      v19 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(a1, a2, v19);
    *(_BYTE *)(a1 + v10) = v17;
  }
  return a1;
}

uint64_t sub_23C4457A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
    v9 = *(_QWORD *)(v7 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64);
  v10 = *(unsigned __int8 *)(a2 + v9);
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v11 = v9;
    else
      v11 = 4;
    __asm { BR              X14 }
  }
  v12 = v10 == 1;
  if (v10 == 1)
  {
    v7 = *(_QWORD *)(v5 - 8);
    v13 = v5;
  }
  else
  {
    v13 = AssociatedTypeWitness;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v13);
  *(_BYTE *)(a1 + v9) = v12;
  return a1;
}

uint64_t sub_23C4458A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v7 = AssociatedTypeWitness;
    v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v9 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v9 + 64) <= *(_QWORD *)(v8 + 64))
      v10 = *(_QWORD *)(v8 + 64);
    else
      v10 = *(_QWORD *)(v9 + 64);
    v11 = *(unsigned __int8 *)(a1 + v10);
    if (v11 >= 2)
    {
      if (v10 <= 3)
        v12 = v10;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    if (v11 == 1)
      v13 = *(_QWORD *)(v5 - 8);
    else
      v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
    if (v11 == 1)
      v14 = v5;
    else
      v14 = AssociatedTypeWitness;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v14);
    v15 = *(unsigned __int8 *)(a2 + v10);
    if (v15 >= 2)
    {
      if (v10 <= 3)
        v16 = v10;
      else
        v16 = 4;
      __asm { BR              X12 }
    }
    v17 = v15 == 1;
    if (v15 == 1)
      v18 = v9;
    else
      v18 = v8;
    if (v15 == 1)
      v19 = v5;
    else
      v19 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(a1, a2, v19);
    *(_BYTE *)(a1 + v10) = v17;
  }
  return a1;
}

uint64_t sub_23C445A40(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v10;
  unsigned int v12;
  int v13;
  unsigned int v14;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  if (v7 <= *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64))
    v7 = *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v8 = v7 + 1;
  v9 = 8 * (v7 + 1);
  if ((v7 + 1) <= 3)
  {
    v12 = ((a2 + ~(-1 << v9) - 254) >> v9) + 1;
    if (HIWORD(v12))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v12 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v12 < 2)
    {
LABEL_21:
      v14 = *(unsigned __int8 *)(a1 + v7);
      if (v14 >= 2)
        return (v14 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_21;
LABEL_14:
  v13 = (v10 - 1) << v9;
  if (v8 > 3)
    v13 = 0;
  if ((_DWORD)v8)
  {
    if (v8 > 3)
      LODWORD(v8) = 4;
    __asm { BR              X11 }
  }
  return (v13 + 255);
}

void sub_23C445B94(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v8;
  size_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v7 = *(_QWORD *)(a4 + 16);
  v8 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) > v8)
    v8 = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
  v9 = v8 + 1;
  if (a3 < 0xFF)
  {
    v10 = 0;
  }
  else if (v9 <= 3)
  {
    v12 = ((a3 + ~(-1 << (8 * v9)) - 254) >> (8 * v9)) + 1;
    if (HIWORD(v12))
    {
      v10 = 4u;
    }
    else if (v12 >= 0x100)
    {
      v10 = 2;
    }
    else
    {
      v10 = v12 > 1;
    }
  }
  else
  {
    v10 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v11 = a2 - 255;
  if (v9 < 4)
  {
    if ((_DWORD)v8 != -1)
    {
      v13 = v11 & ~(-1 << (8 * v9));
      bzero(a1, v9);
      if ((_DWORD)v9 == 3)
      {
        *(_WORD *)a1 = v13;
        a1[2] = BYTE2(v13);
      }
      else if ((_DWORD)v9 == 2)
      {
        *(_WORD *)a1 = v13;
      }
      else
      {
        *a1 = v13;
      }
    }
  }
  else
  {
    bzero(a1, v8 + 1);
    *(_DWORD *)a1 = v11;
  }
  __asm { BR              X10 }
}

uint64_t sub_23C445D64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) > v4)
    v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  result = *(unsigned __int8 *)(a1 + v4);
  if (result >= 2)
  {
    if (v4 <= 3)
      v6 = v4;
    else
      v6 = 4;
    __asm { BR              X12 }
  }
  return result;
}

void sub_23C445E2C(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  size_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  if (a2 > 1)
  {
    v7 = *(_QWORD *)(a3 + 16);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) <= *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64))
      v9 = *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
    else
      v9 = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
    v10 = a2 - 2;
    if (v9 < 4)
    {
      v11 = v10 >> (8 * v9);
      v12 = v10 & ~(-1 << (8 * v9));
      a1[v9] = v11 + 2;
      bzero(a1, v9);
      if ((_DWORD)v9 == 3)
      {
        *(_WORD *)a1 = v12;
        a1[2] = BYTE2(v12);
      }
      else if ((_DWORD)v9 == 2)
      {
        *(_WORD *)a1 = v12;
      }
      else
      {
        *a1 = v12;
      }
    }
    else
    {
      a1[v9] = 2;
      bzero(a1, v9);
      *(_DWORD *)a1 = v10;
    }
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
    v6 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
    if (v5 > v6)
      v6 = v5;
    a1[v6] = a2;
  }
}

uint64_t sub_23C445F50()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23C445F58(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C445FA4 + 4 * byte_23C458330[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C445FD8 + 4 * byte_23C45832B[v4]))();
}

uint64_t sub_23C445FD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C445FE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C445FE8);
  return result;
}

uint64_t sub_23C445FF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C445FFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C446000(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C446008(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C446018(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C446058 + 4 * byte_23C458335[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C446078 + 4 * byte_23C45833A[v4]))();
}

_BYTE *sub_23C446058(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C446078(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C446080(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C446088(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C446090(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C446098(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23C4460A4()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C4460B4()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C4460C4()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C4460D4()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C4460E4()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C4460F4()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C446104()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C446114()
{
  JUMPOUT(0x24261F5D0);
}

void sub_23C446124()
{
  JUMPOUT(0x24261F5D0);
}

BOOL static GatedResource.FetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GatedResource.FetchError.hash(into:)()
{
  return sub_23C456434();
}

uint64_t GatedResource.FetchError.hashValue.getter()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t sub_23C4461C8()
{
  sub_23C456428();
  GatedResource.FetchError.hash(into:)();
  return sub_23C45644C();
}

uint64_t sub_23C446200@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 96);
  swift_beginAccess();
  v7 = type metadata accessor for GatedResource.State(0, *(_QWORD *)(v3 + 80), v5, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, v4, v7);
}

uint64_t sub_23C446270(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 96);
  swift_beginAccess();
  v7 = type metadata accessor for GatedResource.State(0, *(_QWORD *)(v3 + 80), v5, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v4, a1, v7);
  return swift_endAccess();
}

uint64_t GatedResource.__allocating_init(ttl:fetchHandler:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  GatedResource.init(ttl:fetchHandler:)(a1, a2, a3);
  return v6;
}

uint64_t *GatedResource.init(ttl:fetchHandler:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v7 = *v3;
  swift_defaultActor_initialize();
  type metadata accessor for GatedResource.State(0, *(_QWORD *)(v7 + 80), v8, v9);
  swift_storeEnumTagMultiPayload();
  *(double *)((char *)v3 + *(_QWORD *)(*v3 + 104)) = a3;
  v10 = (uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 112));
  *v10 = a1;
  v10[1] = a2;
  return v3;
}

uint64_t type metadata accessor for GatedResource.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GatedResource.State);
}

void sub_23C4463E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v5 = type metadata accessor for GatedResource.State(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  MEMORY[0x24BDAC7A8](v5);
  sub_23C446200((uint64_t)&v8 - v6);
  v7 = (char *)sub_23C44646C + 4 * byte_23C458830[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C44646C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  v2 = sub_23C456110();
  v3 = MEMORY[0x24261EF64](v1, v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24261F5C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23C446620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for GatedResource.State(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  sub_23C446200((uint64_t)&v9 - v7);
  v8 = (char *)sub_23C4466CC + 4 * byte_23C458834[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C4466CC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  swift_storeEnumTagMultiPayload();
  v4 = sub_23C446270(v0);
  *(_QWORD *)(v2 - 72) = v3;
  MEMORY[0x24BDAC7A8](v4);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  sub_23C456110();
  v5 = sub_23C4560E0();
  MEMORY[0x24261F5D0](MEMORY[0x24BEE12C8], v5);
  sub_23C456038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C4468C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t Error;
  _BYTE *v5;

  Error = type metadata accessor for GatedResource.FetchError(0, a2, a3, a4);
  MEMORY[0x24261F5D0](&protocol conformance descriptor for GatedResource<A>.FetchError, Error);
  swift_allocError();
  *v5 = 0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  sub_23C456110();
  return sub_23C4560F8();
}

uint64_t sub_23C446968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23C4468C4(a1, *(_QWORD *)(v4 + 16), a3, a4);
}

void sub_23C446980(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v11[4];

  v11[0] = a3;
  v4 = *(_QWORD *)(*(_QWORD *)v3 + 80);
  v5 = type metadata accessor for GatedResource.State(0, v4, a1, a2);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v11 - v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  v11[3] = v4;
  v8 = sub_23C456458();
  v9 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v9);
  sub_23C446200((uint64_t)v7);
  v10 = (char *)sub_23C446A8C + 4 * byte_23C458838[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C446A8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Error;
  _BYTE *v7;

  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
  Error = type metadata accessor for GatedResource.FetchError(0, *(_QWORD *)(v3 - 72), v4, v5);
  MEMORY[0x24261F5D0](&protocol conformance descriptor for GatedResource<A>.FetchError, Error);
  swift_allocError();
  *v7 = 2;
  return swift_willThrow();
}

uint64_t type metadata accessor for GatedResource.FetchError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GatedResource.FetchError);
}

uint64_t sub_23C446C68(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch();
}

uint64_t sub_23C446C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = type metadata accessor for GatedResource(255, *(_QWORD *)(*(_QWORD *)(v4 + 32) + 80), a3, a4);
  MEMORY[0x24261F5D0](&protocol conformance descriptor for GatedResource<A>, v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 40) = v6;
  *v6 = v4;
  v6[1] = sub_23C446D30;
  return sub_23C4563EC();
}

uint64_t sub_23C446D30()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C446D9C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for GatedResource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GatedResource);
}

void sub_23C446DB4(uint64_t a1, uint64_t a2)
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
  char *v21;
  _QWORD v22[14];

  v22[11] = a1;
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  v22[3] = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v22[2] = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v22[1] = (char *)v22 - v6;
  v7 = sub_23C455E70();
  v22[4] = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v9 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v9);
  v22[5] = (char *)v22 - v10;
  v22[10] = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  v11 = sub_23C456458();
  v12 = *(_QWORD *)(v11 - 8);
  v22[6] = v11;
  v22[7] = v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v14 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v14);
  v17 = type metadata accessor for GatedResource.State(0, v3, v15, v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v22[9] = (char *)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22[12] = a2;
  sub_23C446200((uint64_t)v22 - v20);
  v22[8] = v17;
  v21 = (char *)sub_23C446FD8 + 4 * byte_23C45883C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C446FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  v1 = sub_23C456110();
  sub_23C4563C8();
  v2 = *(_QWORD *)(v1 - 8);
  swift_allocObject();
  sub_23C4560B0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v3, *(_QWORD *)(v0 - 104), v1);
  sub_23C4560E0();
  v4 = sub_23C4560BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = *(uint64_t **)(v0 - 120);
  *v5 = v4;
  swift_storeEnumTagMultiPayload();
  return sub_23C446270((uint64_t)v5);
}

void sub_23C447548(uint64_t a1)
{
  uint64_t v1;

  sub_23C446DB4(a1, v1);
}

void sub_23C447550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for GatedResource.State(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  sub_23C446200((uint64_t)&v9 - v7);
  v8 = (char *)sub_23C447604 + 4 * byte_23C458840[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23C447604()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  v5 = sub_23C456458();
  sub_23C455E70();
  swift_getTupleTypeMetadata2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v1, v0, v5);
  sub_23C455E64();
  swift_storeEnumTagMultiPayload();
  v6 = sub_23C446270(v1);
  *(_QWORD *)(v3 - 88) = v4;
  MEMORY[0x24BDAC7A8](v6);
  sub_23C456110();
  v7 = sub_23C4560E0();
  MEMORY[0x24261F5D0](MEMORY[0x24BEE12C8], v7);
  sub_23C456038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C447850(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  v3 = sub_23C456110();
  return sub_23C4478D0(a2, v3);
}

uint64_t sub_23C4478B8(uint64_t a1)
{
  uint64_t v1;

  return sub_23C447850(a1, *(_QWORD *)(v1 + 24));
}

uint64_t sub_23C4478D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23C456458();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_23C4560F8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_23C456104();
  }
}

uint64_t sub_23C447A30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6A8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23C456128();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_23C44A178((uint64_t)v4);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_23C45611C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_23C4560EC();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_256B9F6B8;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_23C447BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[2] = a4;
  v5 = *(_QWORD *)(*(_QWORD *)a4 + 80);
  v4[3] = v5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  v6 = sub_23C456458();
  v4[4] = v6;
  v4[5] = *(_QWORD *)(v6 - 8);
  v4[6] = swift_task_alloc();
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23C447CA0()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  v1 = (_QWORD *)(v0[2] + *(_QWORD *)(*(_QWORD *)v0[2] + 112));
  v4 = (uint64_t (*)(_QWORD))(*(int *)*v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[9] = v2;
  *v2 = v0;
  v2[1] = sub_23C447D0C;
  return v4(v0[8]);
}

uint64_t sub_23C447D0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23C447D70()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[7] + 16))(v0[6], v0[8], v0[3]);
  swift_storeEnumTagMultiPayload();
  return swift_task_switch();
}

uint64_t sub_23C447DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = v4[5];
  v5 = v4[6];
  v7 = v4[4];
  sub_23C447550(v5, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  return swift_task_switch();
}

uint64_t sub_23C447E38()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C447E84()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 80);
  **(_QWORD **)(v0 + 48) = v1;
  swift_storeEnumTagMultiPayload();
  v2 = v1;
  return swift_task_switch();
}

uint64_t sub_23C447EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = v4[5];
  v5 = v4[6];
  v7 = v4[4];
  sub_23C447550(v5, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  return swift_task_switch();
}

uint64_t sub_23C447F3C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C447F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23C456128();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23C45611C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23C44A178(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23C4560EC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t GatedResource.deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 96);
  v6 = type metadata accessor for GatedResource.State(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_defaultActor_destroy();
  return v4;
}

uint64_t GatedResource.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  GatedResource.deinit(a1, a2, a3, a4);
  return swift_defaultActor_deallocate();
}

uint64_t GatedResource.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

void sub_23C44814C()
{
  JUMPOUT(0x24261F5D0);
}

uint64_t sub_23C44815C()
{
  return GatedResource.unownedExecutor.getter();
}

uint64_t sub_23C448178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for GatedResource.State(319, *(_QWORD *)(a1 + 80), a3, a4);
  if (v5 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for GatedResource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GatedResource.__allocating_init(ttl:fetchHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of GatedResource.pendingCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of GatedResource.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of GatedResource.query()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of GatedResource.fetch()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 176) + *(_QWORD *)(*(_QWORD *)v1 + 176));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C4482DC;
  return v6(a1);
}

uint64_t sub_23C4482DC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of GatedResource.release(result:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_23C448330(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C44837C + 4 * byte_23C458849[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C4483B0 + 4 * byte_23C458844[v4]))();
}

uint64_t sub_23C4483B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4483B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C4483C0);
  return result;
}

uint64_t sub_23C4483CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4483D4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C4483D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4483E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4483EC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v5;
  char v6;
  uint64_t v7;
  char *v8;
  char *v9;

  v7 = MEMORY[0x24BEE0158] + 64;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256B9F510);
  v0 = sub_23C456458();
  if (v1 <= 0x3F)
  {
    v2 = sub_23C455E70();
    if (v3 > 0x3F)
    {
      return v2;
    }
    else
    {
      swift_getTupleTypeLayout2();
      v8 = &v6;
      swift_getTupleTypeLayout2();
      v9 = &v5;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return v0;
}

id *sub_23C4484DC(id *a1, id *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  char *v17;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  char v29;
  id v30;
  id v31;
  char v32;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = 8;
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v6 + 64);
  v9 = sub_23C455E70();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = v8 + 1 + v11;
  v13 = (v12 & ~v11) + *(_QWORD *)(v10 + 64);
  if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16)
    v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v13 > 8)
    v7 = v13;
  v14 = v11 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v14 > 7 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v10 + 80)) & 0x100000) != 0 || (unint64_t)(v7 + 1) > 0x18)
  {
    v17 = (char *)*a2;
    *a1 = *a2;
    a1 = (id *)&v17[((v14 | 7) + 16) & ~(unint64_t)(v14 | 7)];
    swift_retain();
  }
  else
  {
    v19 = v9;
    v20 = *((unsigned __int8 *)a2 + v7);
    if (v20 >= 3)
    {
      if (v7 <= 3)
        v21 = v7;
      else
        v21 = 4;
      __asm { BR              X13 }
    }
    if (v20 == 2)
    {
      v24 = *((unsigned __int8 *)a2 + v8);
      if (v24 >= 2)
      {
        if (v8 <= 3)
          v25 = v8;
        else
          v25 = 4;
        __asm { BR              X12 }
      }
      if (v24 == 1)
      {
        v30 = *a2;
        v31 = *a2;
        *a1 = v30;
        v32 = 1;
      }
      else
      {
        (*(void (**)(id *, id *, uint64_t))(v6 + 16))(a1, a2, v5);
        v32 = 0;
      }
      *((_BYTE *)a1 + v8) = v32;
      *(_QWORD *)(((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 8) & 0xFFFFFFFFFFFFF8);
      *((_BYTE *)a1 + v7) = 2;
      swift_bridgeObjectRetain();
    }
    else if (v20 == 1)
    {
      v22 = *((unsigned __int8 *)a2 + v8);
      if (v22 >= 2)
      {
        if (v8 <= 3)
          v23 = v8;
        else
          v23 = 4;
        __asm { BR              X13 }
      }
      v26 = ~v11;
      if (v22 == 1)
      {
        v27 = *a2;
        v28 = *a2;
        *a1 = v27;
        v29 = 1;
      }
      else
      {
        (*(void (**)(id *, id *, uint64_t))(v6 + 16))(a1, a2, v5);
        v29 = 0;
      }
      *((_BYTE *)a1 + v8) = v29;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(((unint64_t)a1 + v12) & v26, ((unint64_t)a2 + v12) & v26, v19);
      *((_BYTE *)a1 + v7) = 1;
    }
    else
    {
      *a1 = *a2;
      *((_BYTE *)a1 + v7) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t sub_23C448844(id *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = sub_23C455E70();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = v5 + 1 + v8;
  v10 = (v9 & ~v8) + *(_QWORD *)(v7 + 64);
  if (v10 <= (v5 & 0xFFFFFFFFFFFFFFF8) + 16)
    v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v10 <= 8)
    v10 = 8;
  v11 = *((unsigned __int8 *)a1 + v10);
  if (v11 >= 3)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X14 }
  }
  if (v11 == 2)
  {
    v13 = *((unsigned __int8 *)a1 + v5);
    if (v13 >= 2)
    {
      if (v5 <= 3)
        v14 = v5;
      else
        v14 = 4;
      __asm { BR              X12 }
    }
    if (v13 == 1)

    else
      (*(void (**)(id *, uint64_t))(v4 + 8))(a1, v3);
    return swift_bridgeObjectRelease();
  }
  if (v11 != 1)
    return swift_bridgeObjectRelease();
  v15 = *((unsigned __int8 *)a1 + v5);
  if (v15 >= 2)
  {
    if (v5 <= 3)
      v16 = v5;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v18 = ~v8;
  if (v15 == 1)

  else
    (*(void (**)(id *, uint64_t))(v4 + 8))(a1, v3);
  return (*(uint64_t (**)(unint64_t, uint64_t))(v7 + 8))(((unint64_t)a1 + v9) & v18, v6);
}

id *sub_23C448AE8(id *a1, id *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  uint64_t v23;
  id v24;
  id v25;
  char v26;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = 8;
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v6 + 64);
  v9 = sub_23C455E70();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = v8 + 1 + v11;
  v13 = (v12 & ~v11) + *(_QWORD *)(v10 + 64);
  if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16)
    v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v13 > 8)
    v7 = v13;
  v14 = *((unsigned __int8 *)a2 + v7);
  if (v14 >= 3)
  {
    if (v7 <= 3)
      v15 = v7;
    else
      v15 = 4;
    __asm { BR              X13 }
  }
  if (v14 == 2)
  {
    v16 = *((unsigned __int8 *)a2 + v8);
    if (v16 >= 2)
    {
      if (v8 <= 3)
        v17 = v8;
      else
        v17 = 4;
      __asm { BR              X12 }
    }
    if (v16 == 1)
    {
      v20 = *a2;
      v21 = *a2;
      *a1 = v20;
      v22 = 1;
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 16))(a1, a2, v5);
      v22 = 0;
    }
    *((_BYTE *)a1 + v8) = v22;
    *(_QWORD *)(((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 8) & 0xFFFFFFFFFFFFF8);
    *((_BYTE *)a1 + v7) = 2;
    swift_bridgeObjectRetain();
  }
  else if (v14 == 1)
  {
    v18 = *((unsigned __int8 *)a2 + v8);
    if (v18 >= 2)
    {
      if (v8 <= 3)
        v19 = v8;
      else
        v19 = 4;
      __asm { BR              X13 }
    }
    v23 = ~v11;
    if (v18 == 1)
    {
      v24 = *a2;
      v25 = *a2;
      *a1 = v24;
      v26 = 1;
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 16))(a1, a2, v5);
      v26 = 0;
    }
    *((_BYTE *)a1 + v8) = v26;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(((unint64_t)a1 + v12) & v23, ((unint64_t)a2 + v12) & v23, v9);
    *((_BYTE *)a1 + v7) = 1;
  }
  else
  {
    *a1 = *a2;
    *((_BYTE *)a1 + v7) = 0;
    swift_bridgeObjectRetain();
  }
  return a1;
}

id *sub_23C448E14(id *a1, id *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  id v26;
  id v27;
  char v28;
  id v29;
  id v30;
  char v31;
  uint64_t v33;

  if (a1 == a2)
    return a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = 8;
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v6 + 64);
  v9 = sub_23C455E70();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = v8 + 1 + v11;
  v13 = (v12 & ~v11) + *(_QWORD *)(v10 + 64);
  if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16)
    v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v13 > 8)
    v7 = v13;
  v14 = *((unsigned __int8 *)a1 + v7);
  if (v14 >= 3)
  {
    if (v7 <= 3)
      v15 = v7;
    else
      v15 = 4;
    __asm { BR              X13 }
  }
  v33 = ~v11;
  if (v14 == 2)
  {
    v16 = *((unsigned __int8 *)a1 + v8);
    if (v16 >= 2)
    {
      if (v8 <= 3)
        v17 = v8;
      else
        v17 = 4;
      __asm { BR              X12 }
    }
    if (v16 == 1)

    else
      (*(void (**)(id *, uint64_t))(v6 + 8))(a1, v5);
  }
  else if (v14 == 1)
  {
    v18 = *((unsigned __int8 *)a1 + v8);
    if (v18 >= 2)
    {
      if (v8 <= 3)
        v19 = v8;
      else
        v19 = 4;
      __asm { BR              X12 }
    }
    if (v18 == 1)

    else
      (*(void (**)(id *, uint64_t))(v6 + 8))(a1, v5);
    (*(void (**)(unint64_t, uint64_t))(v10 + 8))(((unint64_t)a1 + v12) & v33, v9);
    goto LABEL_35;
  }
  swift_bridgeObjectRelease();
LABEL_35:
  v20 = *((unsigned __int8 *)a2 + v7);
  if (v20 >= 3)
  {
    if (v7 <= 3)
      v21 = v7;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  if (v20 == 2)
  {
    v24 = *((unsigned __int8 *)a2 + v8);
    if (v24 >= 2)
    {
      if (v8 <= 3)
        v25 = v8;
      else
        v25 = 4;
      __asm { BR              X12 }
    }
    if (v24 == 1)
    {
      v29 = *a2;
      v30 = *a2;
      *a1 = v29;
      v31 = 1;
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 16))(a1, a2, v5);
      v31 = 0;
    }
    *((_BYTE *)a1 + v8) = v31;
    *(_QWORD *)(((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 8) & 0xFFFFFFFFFFFFF8);
    *((_BYTE *)a1 + v7) = 2;
    goto LABEL_61;
  }
  if (v20 != 1)
  {
    *a1 = *a2;
    *((_BYTE *)a1 + v7) = 0;
LABEL_61:
    swift_bridgeObjectRetain();
    return a1;
  }
  v22 = *((unsigned __int8 *)a2 + v8);
  if (v22 >= 2)
  {
    if (v8 <= 3)
      v23 = v8;
    else
      v23 = 4;
    __asm { BR              X12 }
  }
  if (v22 == 1)
  {
    v26 = *a2;
    v27 = *a2;
    *a1 = v26;
    v28 = 1;
  }
  else
  {
    (*(void (**)(id *, id *, uint64_t))(v6 + 16))(a1, a2, v5);
    v28 = 0;
  }
  *((_BYTE *)a1 + v8) = v28;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(((unint64_t)a1 + v12) & v33, ((unint64_t)a2 + v12) & v33, v9);
  *((_BYTE *)a1 + v7) = 1;
  return a1;
}

_QWORD *sub_23C449358(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  char v23;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = 8;
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v6 + 64);
  v9 = sub_23C455E70();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = v8 + 1 + v11;
  v13 = (v12 & ~v11) + *(_QWORD *)(v10 + 64);
  if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16)
    v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v13 > 8)
    v7 = v13;
  v14 = *((unsigned __int8 *)a2 + v7);
  if (v14 >= 3)
  {
    if (v7 <= 3)
      v15 = v7;
    else
      v15 = 4;
    __asm { BR              X13 }
  }
  if (v14 == 2)
  {
    v16 = *((unsigned __int8 *)a2 + v8);
    if (v16 >= 2)
    {
      if (v8 <= 3)
        v17 = v8;
      else
        v17 = 4;
      __asm { BR              X12 }
    }
    if (v16 == 1)
    {
      *a1 = *a2;
      v20 = 1;
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v20 = 0;
    }
    *((_BYTE *)a1 + v8) = v20;
    *(_QWORD *)(((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 8) & 0xFFFFFFFFFFFFF8);
    v21 = 2;
    goto LABEL_34;
  }
  if (v14 == 1)
  {
    v18 = *((unsigned __int8 *)a2 + v8);
    if (v18 >= 2)
    {
      if (v8 <= 3)
        v19 = v8;
      else
        v19 = 4;
      __asm { BR              X13 }
    }
    v22 = ~v11;
    if (v18 == 1)
    {
      *a1 = *a2;
      v23 = 1;
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v23 = 0;
    }
    *((_BYTE *)a1 + v8) = v23;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))(((unint64_t)a1 + v12) & v22, ((unint64_t)a2 + v12) & v22, v9);
    v21 = 1;
LABEL_34:
    *((_BYTE *)a1 + v7) = v21;
    return a1;
  }
  *a1 = *a2;
  *((_BYTE *)a1 + v7) = 0;
  return a1;
}

id *sub_23C449668(id *a1, id *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  uint64_t v30;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = 8;
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v8 = 8;
    else
      v8 = *(_QWORD *)(v6 + 64);
    v9 = sub_23C455E70();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = *(unsigned __int8 *)(v10 + 80);
    v12 = v8 + 1 + v11;
    v13 = (v12 & ~v11) + *(_QWORD *)(v10 + 64);
    if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16)
      v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
    if (v13 > 8)
      v7 = v13;
    v14 = *((unsigned __int8 *)a1 + v7);
    if (v14 >= 3)
    {
      if (v7 <= 3)
        v15 = v7;
      else
        v15 = 4;
      __asm { BR              X13 }
    }
    v30 = ~v11;
    if (v14 == 2)
    {
      v16 = *((unsigned __int8 *)a1 + v8);
      if (v16 >= 2)
      {
        if (v8 <= 3)
          v17 = v8;
        else
          v17 = 4;
        __asm { BR              X12 }
      }
      if (v16 == 1)

      else
        (*(void (**)(id *, uint64_t))(v6 + 8))(a1, v5);
    }
    else if (v14 == 1)
    {
      v18 = *((unsigned __int8 *)a1 + v8);
      if (v18 >= 2)
      {
        if (v8 <= 3)
          v19 = v8;
        else
          v19 = 4;
        __asm { BR              X12 }
      }
      if (v18 == 1)

      else
        (*(void (**)(id *, uint64_t))(v6 + 8))(a1, v5);
      (*(void (**)(unint64_t, uint64_t))(v10 + 8))(((unint64_t)a1 + v12) & v30, v9);
LABEL_35:
      v20 = *((unsigned __int8 *)a2 + v7);
      if (v20 >= 3)
      {
        if (v7 <= 3)
          v21 = v7;
        else
          v21 = 4;
        __asm { BR              X12 }
      }
      if (v20 == 2)
      {
        v24 = *((unsigned __int8 *)a2 + v8);
        if (v24 >= 2)
        {
          if (v8 <= 3)
            v25 = v8;
          else
            v25 = 4;
          __asm { BR              X12 }
        }
        if (v24 == 1)
        {
          *a1 = *a2;
          v28 = 1;
        }
        else
        {
          (*(void (**)(id *, id *, uint64_t))(v6 + 32))(a1, a2, v5);
          v28 = 0;
        }
        *((_BYTE *)a1 + v8) = v28;
        *(_QWORD *)(((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 8) & 0xFFFFFFFFFFFFF8);
        v27 = 2;
      }
      else
      {
        if (v20 != 1)
        {
          *a1 = *a2;
          *((_BYTE *)a1 + v7) = 0;
          return a1;
        }
        v22 = *((unsigned __int8 *)a2 + v8);
        if (v22 >= 2)
        {
          if (v8 <= 3)
            v23 = v8;
          else
            v23 = 4;
          __asm { BR              X12 }
        }
        if (v22 == 1)
        {
          *a1 = *a2;
          v26 = 1;
        }
        else
        {
          (*(void (**)(id *, id *, uint64_t))(v6 + 32))(a1, a2, v5);
          v26 = 0;
        }
        *((_BYTE *)a1 + v8) = v26;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))(((unint64_t)a1 + v12) & v30, ((unint64_t)a2 + v12) & v30, v9);
        v27 = 1;
      }
      *((_BYTE *)a1 + v7) = v27;
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  return a1;
}

uint64_t sub_23C449B94(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unsigned int v15;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  v6 = sub_23C455E70();
  v7 = ((v5 + *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64);
  if (v7 <= (v5 & 0xFFFFFFFFFFFFFFF8) + 16)
    v7 = (v5 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v7 <= 8)
    v8 = 8;
  else
    v8 = v7;
  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_27;
  v9 = v8 + 1;
  v10 = 8 * (v8 + 1);
  if ((v8 + 1) <= 3)
  {
    v13 = ((a2 + ~(-1 << v10) - 252) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_27;
      goto LABEL_20;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_27;
      goto LABEL_20;
    }
    if (v13 < 2)
    {
LABEL_27:
      v15 = *(unsigned __int8 *)(a1 + v8);
      if (v15 >= 4)
        return (v15 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_27;
LABEL_20:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if ((_DWORD)v9)
  {
    if (v9 > 3)
      LODWORD(v9) = 4;
    __asm { BR              X11 }
  }
  return (v14 + 253);
}

void sub_23C449D04(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  v8 = sub_23C455E70();
  v9 = ((v7 + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  if (v9 <= (v7 & 0xFFFFFFFFFFFFFFF8) + 16)
    v9 = (v7 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v9 <= 8)
    v9 = 8;
  v10 = v9 + 1;
  if (a3 < 0xFD)
  {
    v11 = 0;
  }
  else if (v10 <= 3)
  {
    v13 = ((a3 + ~(-1 << (8 * v10)) - 252) >> (8 * v10)) + 1;
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
  if (a2 <= 0xFC)
    __asm { BR              X11 }
  v12 = a2 - 253;
  if (v10 < 4)
  {
    if ((_DWORD)v9 != -1)
    {
      v14 = v12 & ~(-1 << (8 * v10));
      bzero(a1, v10);
      if ((_DWORD)v10 == 3)
      {
        *(_WORD *)a1 = v14;
        a1[2] = BYTE2(v14);
      }
      else if ((_DWORD)v10 == 2)
      {
        *(_WORD *)a1 = v14;
      }
      else
      {
        *a1 = v14;
      }
    }
  }
  else
  {
    bzero(a1, v9 + 1);
    *(_DWORD *)a1 = v12;
  }
  __asm { BR              X10 }
}

uint64_t sub_23C449EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) <= 8uLL)
    v3 = 8;
  else
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  v4 = sub_23C455E70();
  v5 = ((v3 + *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  if (v5 <= (v3 & 0xFFFFFFFFFFFFFFF8) + 16)
    v5 = (v3 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v5 <= 8)
    v5 = 8;
  result = *(unsigned __int8 *)(a1 + v5);
  if (result >= 3)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X12 }
  }
  return result;
}

void sub_23C449FD8(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  v7 = sub_23C455E70();
  v8 = ((v6 + *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
  if (v8 <= (v6 & 0xFFFFFFFFFFFFFFF8) + 16)
    v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 > 8)
    v5 = v8;
  if (a2 > 2)
  {
    v9 = a2 - 3;
    if (v5 < 4)
    {
      v10 = v9 >> (8 * v5);
      v11 = v9 & ~(-1 << (8 * v5));
      a1[v5] = v10 + 3;
      bzero(a1, v5);
      if ((_DWORD)v5 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if ((_DWORD)v5 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      a1[v5] = 3;
      bzero(a1, v5);
      *(_DWORD *)a1 = v9;
    }
  }
  else
  {
    a1[v5] = a2;
  }
}

uint64_t sub_23C44A0E0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C44A10C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23C4482DC;
  return sub_23C447BFC(a1, v4, v5, v6);
}

uint64_t sub_23C44A178(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C44A1B8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C44A21C;
  return v6(a1);
}

uint64_t sub_23C44A21C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23C44A268(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23C44A2FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256B9F6C0 + dword_256B9F6C0))(a1, v4);
}

uint64_t sub_23C44A2D8()
{
  swift_release();
  return swift_deallocObject();
}

BOOL static DynamicPredicateEquatableValue.Stripped.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DynamicPredicateEquatableValue.Stripped.hash(into:)()
{
  return sub_23C456434();
}

uint64_t DynamicPredicateEquatableValue.Stripped.hashValue.getter()
{
  sub_23C456428();
  sub_23C456434();
  return sub_23C45644C();
}

uint64_t DynamicPredicateEquatableValue.strippedCase.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)sub_23C44A3A4 + 4 * byte_23C458A30[*(unsigned __int8 *)(v0 + 16)]))();
}

void sub_23C44A3A4(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

void sub_23C44A3AC(_BYTE *a1@<X8>)
{
  _DWORD *v1;

  *a1 = 0x604020100uLL >> (8 * *v1);
}

void sub_23C44A3CC(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void sub_23C44A3D8(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

void sub_23C44A3E4(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23C44A3F0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C44A42C + 4 * byte_23C458A38[a1]))(0xD000000000000013, 0x800000023C45A600);
}

uint64_t sub_23C44A42C()
{
  return 0x5463696D616E7964;
}

uint64_t sub_23C44A450()
{
  return 0x657A695364697267;
}

uint64_t sub_23C44A474()
{
  return 0x72656765746E69;
}

uint64_t sub_23C44A48C()
{
  return 0x6874615079656BLL;
}

uint64_t sub_23C44A4A4()
{
  return 0x6D726F6674616C70;
}

uint64_t sub_23C44A4BC()
{
  return 0x676E69727473;
}

unint64_t sub_23C44A4D0()
{
  return 0xD000000000000011;
}

uint64_t sub_23C44A4EC()
{
  unsigned __int8 *v0;

  return sub_23C44A3F0(*v0);
}

uint64_t sub_23C44A4F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C44D2C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C44A518(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_23C44A524()
{
  sub_23C44BF30();
  return sub_23C45647C();
}

uint64_t sub_23C44A54C()
{
  sub_23C44BF30();
  return sub_23C456488();
}

uint64_t sub_23C44A574()
{
  sub_23C44C1D8();
  return sub_23C45647C();
}

uint64_t sub_23C44A59C()
{
  sub_23C44C1D8();
  return sub_23C456488();
}

uint64_t sub_23C44A5C4()
{
  sub_23C44C194();
  return sub_23C45647C();
}

uint64_t sub_23C44A5EC()
{
  sub_23C44C194();
  return sub_23C456488();
}

uint64_t sub_23C44A614()
{
  sub_23C44C150();
  return sub_23C45647C();
}

uint64_t sub_23C44A63C()
{
  sub_23C44C150();
  return sub_23C456488();
}

uint64_t sub_23C44A664()
{
  sub_23C44C10C();
  return sub_23C45647C();
}

uint64_t sub_23C44A68C()
{
  sub_23C44C10C();
  return sub_23C456488();
}

uint64_t sub_23C44A6B4()
{
  sub_23C44C084();
  return sub_23C45647C();
}

uint64_t sub_23C44A6DC()
{
  sub_23C44C084();
  return sub_23C456488();
}

uint64_t sub_23C44A704()
{
  sub_23C44BFFC();
  return sub_23C45647C();
}

uint64_t sub_23C44A72C()
{
  sub_23C44BFFC();
  return sub_23C456488();
}

uint64_t sub_23C44A754()
{
  sub_23C44BFB8();
  return sub_23C45647C();
}

uint64_t sub_23C44A77C()
{
  sub_23C44BFB8();
  return sub_23C456488();
}

uint64_t sub_23C44A7A4()
{
  sub_23C44BF74();
  return sub_23C45647C();
}

uint64_t sub_23C44A7CC()
{
  sub_23C44BF74();
  return sub_23C456488();
}

void DynamicPredicateEquatableValue.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  _QWORD v16[2];
  uint64_t v17;
  char *v18;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6D8);
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v33 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6E0);
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v29 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6E8);
  v28 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v27 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6F0);
  v25 = *(_QWORD *)(v8 - 8);
  v26 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v24 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6F8);
  v22 = *(_QWORD *)(v10 - 8);
  v23 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v21 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F700);
  v19 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v18 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F708);
  v16[1] = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F710);
  MEMORY[0x24BDAC7A8](v13);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F718);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v14 = *v1;
  v36 = v1[1];
  v37 = v14;
  v15 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C44BF30();
  sub_23C456470();
  __asm { BR              X9 }
}

uint64_t sub_23C44AAD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 90) = 0;
  sub_23C44C1D8();
  v5 = *(_QWORD *)(v4 - 104);
  sub_23C456368();
  *(_BYTE *)(v4 - 91) = *(_QWORD *)(v4 - 128);
  sub_23C43EB0C();
  sub_23C4563B0();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v3, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8))(v2, v5);
}

uint64_t DynamicPredicateEquatableValue.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  char *v29;
  _QWORD v31[3];
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
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;

  v51 = a2;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F778);
  v45 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v53 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F780);
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F788);
  v41 = *(_QWORD *)(v6 - 8);
  v42 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v50 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F790);
  v39 = *(_QWORD *)(v8 - 8);
  v40 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F798);
  v37 = *(_QWORD *)(v10 - 8);
  v38 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v48 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F7A0);
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v47 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F7A8);
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v46 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F7B0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F7B8);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = a1[3];
  v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_23C44BF30();
  v23 = v56;
  sub_23C456464();
  if (!v23)
  {
    v31[2] = v17;
    v31[0] = v15;
    v31[1] = v14;
    v32 = v19;
    v56 = v21;
    v24 = sub_23C456350();
    v25 = v18;
    if (*(_QWORD *)(v24 + 16) == 1)
      __asm { BR              X9 }
    v26 = sub_23C4562A8();
    swift_allocError();
    v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F098);
    *v28 = &type metadata for DynamicPredicateEquatableValue;
    v29 = v56;
    sub_23C4562FC();
    sub_23C45629C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x24BEE26D0], v26);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v25);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
}

void sub_23C44B2F0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v3 - 89) = 1;
  sub_23C44C194();
  v4 = *(_QWORD *)(v3 - 184);
  sub_23C4562F0();
  if (v2)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x23C44B2C0);
  }
  v5 = *(_QWORD *)(v3 - 280);
  v6 = sub_23C45632C();
  v7 = *(_QWORD *)(v3 - 296);
  v8 = v6;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 288) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  (*(void (**)(_QWORD, uint64_t))(v7 + 8))(*(_QWORD *)(v3 - 104), v1);
  v9 = *(_QWORD *)(v3 - 144);
  *(_QWORD *)v9 = v8;
  *(_QWORD *)(v9 + 8) = 0;
  *(_BYTE *)(v9 + 16) = v0;
  JUMPOUT(0x23C44B2C8);
}

void sub_23C44B354()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
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

  v5 = v0;
  *(_BYTE *)(v4 - 72) = 2;
  sub_23C44C150();
  v6 = *(_QWORD *)(v4 - 176);
  v7 = *(_QWORD *)(v4 - 104);
  sub_23C4562F0();
  if (!v3)
  {
    *(_QWORD *)(v4 - 160) = v1;
    v8 = *(_QWORD *)(v4 - 264);
    v9 = sub_23C456314();
    v10 = v6;
    v11 = *(_QWORD *)(v4 - 296);
    v12 = v9;
    v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 272) + 8))(v10, v8);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v7, v2);
    v15 = *(_QWORD *)(v4 - 144);
    *(_QWORD *)v15 = v12;
    *(_QWORD *)(v15 + 8) = v14;
    *(_BYTE *)(v15 + 16) = v5;
    JUMPOUT(0x23C44B2C8);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x23C44B2C0);
}

uint64_t sub_23C44B954@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateEquatableValue.init(from:)(a1, a2);
}

void sub_23C44B968(_QWORD *a1)
{
  DynamicPredicateEquatableValue.encode(to:)(a1);
}

void DynamicPredicateEquatableValue.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_23C44B9B0()
{
  sub_23C456434();
  return sub_23C456434();
}

void sub_23C44BA64()
{
  sub_23C456434();
  sub_23C455FF0();
  JUMPOUT(0x23C44BB34);
}

uint64_t sub_23C44BAA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  ((void (*)(uint64_t))sub_23C456434)(6);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23C455FF0)(v2, v0, v1);
}

uint64_t sub_23C44BAD0()
{
  uint64_t v0;

  ((void (*)(uint64_t, uint64_t, unint64_t))sub_23C455FF0)(v0, 0x657A695364697267, 0xED00007373616C43);
  return ((uint64_t (*)(unint64_t))swift_bridgeObjectRelease)(0xED00007373616C43);
}

uint64_t sub_23C44BAF4()
{
  uint64_t v0;

  ((void (*)(uint64_t, uint64_t, unint64_t))sub_23C455FF0)(v0, 0x6D726F6674616C70, 0xE800000000000000);
  return ((uint64_t (*)(unint64_t))swift_bridgeObjectRelease)(0xE800000000000000);
}

void sub_23C44BB0C()
{
  JUMPOUT(0x23C44BB24);
}

uint64_t DynamicPredicateEquatableValue.hashValue.getter()
{
  sub_23C456428();
  DynamicPredicateEquatableValue.hash(into:)();
  return sub_23C45644C();
}

uint64_t sub_23C44BB94()
{
  sub_23C456428();
  DynamicPredicateEquatableValue.hash(into:)();
  return sub_23C45644C();
}

uint64_t sub_23C44BBE8()
{
  sub_23C456428();
  DynamicPredicateEquatableValue.hash(into:)();
  return sub_23C45644C();
}

void _s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

BOOL sub_23C44BC60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  int v5;

  if (v5)
  {
    sub_23C440408(v0, v1, v5);
    sub_23C440984(v2, v3, v4);
    sub_23C440984(v0, v1, v5);
    return 0;
  }
  else
  {
    sub_23C440984(v2, v3, 0);
    sub_23C440984(v0, v1, 0);
    return v0 == v2;
  }
}

unint64_t sub_23C44BF30()
{
  unint64_t result;

  result = qword_256B9F720;
  if (!qword_256B9F720)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459614, &type metadata for DynamicPredicateEquatableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F720);
  }
  return result;
}

unint64_t sub_23C44BF74()
{
  unint64_t result;

  result = qword_256B9F728;
  if (!qword_256B9F728)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4595C4, &type metadata for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F728);
  }
  return result;
}

unint64_t sub_23C44BFB8()
{
  unint64_t result;

  result = qword_256B9F730;
  if (!qword_256B9F730)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459574, &type metadata for DynamicPredicateEquatableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F730);
  }
  return result;
}

unint64_t sub_23C44BFFC()
{
  unint64_t result;

  result = qword_256B9F738;
  if (!qword_256B9F738)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459524, &type metadata for DynamicPredicateEquatableValue.PlatformCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F738);
  }
  return result;
}

unint64_t sub_23C44C040()
{
  unint64_t result;

  result = qword_256B9F740;
  if (!qword_256B9F740)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicatePlatform, &type metadata for DynamicPredicatePlatform);
    atomic_store(result, (unint64_t *)&qword_256B9F740);
  }
  return result;
}

unint64_t sub_23C44C084()
{
  unint64_t result;

  result = qword_256B9F748;
  if (!qword_256B9F748)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4594D4, &type metadata for DynamicPredicateEquatableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F748);
  }
  return result;
}

unint64_t sub_23C44C0C8()
{
  unint64_t result;

  result = qword_256B9F750;
  if (!qword_256B9F750)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableKeyPath, &type metadata for DynamicPredicateEquatableKeyPath);
    atomic_store(result, (unint64_t *)&qword_256B9F750);
  }
  return result;
}

unint64_t sub_23C44C10C()
{
  unint64_t result;

  result = qword_256B9F758;
  if (!qword_256B9F758)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459484, &type metadata for DynamicPredicateEquatableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F758);
  }
  return result;
}

unint64_t sub_23C44C150()
{
  unint64_t result;

  result = qword_256B9F760;
  if (!qword_256B9F760)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459434, &type metadata for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F760);
  }
  return result;
}

unint64_t sub_23C44C194()
{
  unint64_t result;

  result = qword_256B9F768;
  if (!qword_256B9F768)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4593E4, &type metadata for DynamicPredicateEquatableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F768);
  }
  return result;
}

unint64_t sub_23C44C1D8()
{
  unint64_t result;

  result = qword_256B9F770;
  if (!qword_256B9F770)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459394, &type metadata for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F770);
  }
  return result;
}

unint64_t sub_23C44C21C()
{
  unint64_t result;

  result = qword_256B9F7C0;
  if (!qword_256B9F7C0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicatePlatform, &type metadata for DynamicPredicatePlatform);
    atomic_store(result, (unint64_t *)&qword_256B9F7C0);
  }
  return result;
}

unint64_t sub_23C44C260()
{
  unint64_t result;

  result = qword_256B9F7C8;
  if (!qword_256B9F7C8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableKeyPath, &type metadata for DynamicPredicateEquatableKeyPath);
    atomic_store(result, (unint64_t *)&qword_256B9F7C8);
  }
  return result;
}

unint64_t sub_23C44C2A8()
{
  unint64_t result;

  result = qword_256B9F7D0;
  if (!qword_256B9F7D0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableValue.Stripped, &type metadata for DynamicPredicateEquatableValue.Stripped);
    atomic_store(result, (unint64_t *)&qword_256B9F7D0);
  }
  return result;
}

unint64_t sub_23C44C2F0()
{
  unint64_t result;

  result = qword_256B9F7D8;
  if (!qword_256B9F7D8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEquatableValue, &type metadata for DynamicPredicateEquatableValue);
    atomic_store(result, (unint64_t *)&qword_256B9F7D8);
  }
  return result;
}

uint64_t destroy for DynamicPredicateEquatableValue(uint64_t result)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(result + 16);
  if (v1 >= 8)
    v1 = *(_DWORD *)result + 8;
  if (((1 << v1) & 0x3B) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16FitnessUtilities30DynamicPredicateEquatableValueOwCP_0(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(unsigned __int8 *)(a2 + 16);
  while (2)
  {
    switch(v3)
    {
      case 0:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_BYTE *)(a1 + 16) = 0;
        return a1;
      case 1:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 16) = 1;
        return a1;
      case 2:
        v4 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v4;
        v5 = 2;
        goto LABEL_12;
      case 3:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 16) = 3;
        return a1;
      case 4:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_BYTE *)(a1 + 16) = 4;
        return a1;
      case 5:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_BYTE *)(a1 + 16) = 5;
        return a1;
      case 6:
        v6 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v6;
        v5 = 6;
        goto LABEL_12;
      case 7:
        v7 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v7;
        v5 = 7;
LABEL_12:
        *(_BYTE *)(a1 + 16) = v5;
        swift_bridgeObjectRetain();
        return a1;
      default:
        v3 = *(_DWORD *)a2 + 8;
        continue;
    }
  }
}

uint64_t assignWithCopy for DynamicPredicateEquatableValue(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  char v6;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 8)
      v4 = *(_DWORD *)a1 + 8;
    if (((1 << v4) & 0x3B) == 0)
      swift_bridgeObjectRelease();
    v5 = *(unsigned __int8 *)(a2 + 16);
    while (2)
    {
      switch(v5)
      {
        case 0:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_BYTE *)(a1 + 16) = 0;
          return a1;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 16) = 1;
          return a1;
        case 2:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          v6 = 2;
          goto LABEL_17;
        case 3:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 16) = 3;
          return a1;
        case 4:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_BYTE *)(a1 + 16) = 4;
          return a1;
        case 5:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_BYTE *)(a1 + 16) = 5;
          return a1;
        case 6:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          v6 = 6;
          goto LABEL_17;
        case 7:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          v6 = 7;
LABEL_17:
          *(_BYTE *)(a1 + 16) = v6;
          swift_bridgeObjectRetain();
          break;
        default:
          v5 = *(_DWORD *)a2 + 8;
          continue;
      }
      break;
    }
  }
  return a1;
}

_BYTE *assignWithTake for DynamicPredicateEquatableValue(_BYTE *a1, _BYTE *a2)
{
  unsigned int v4;
  int v5;
  char v6;

  if (a1 != a2)
  {
    v4 = a1[16];
    if (v4 >= 8)
      v4 = *(_DWORD *)a1 + 8;
    if (((1 << v4) & 0x3B) == 0)
      swift_bridgeObjectRelease();
    v5 = a2[16];
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          *a1 = *a2;
          break;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          v6 = 1;
          break;
        case 2:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v6 = 2;
          break;
        case 3:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          v6 = 3;
          break;
        case 4:
          *a1 = *a2;
          v6 = 4;
          break;
        case 5:
          *a1 = *a2;
          v6 = 5;
          break;
        case 6:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v6 = 6;
          break;
        case 7:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v6 = 7;
          break;
        default:
          v5 = *(_DWORD *)a2 + 8;
          continue;
      }
      break;
    }
    a1[16] = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEquatableValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 >= 8)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateEquatableValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 249;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23C44C718(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 16);
  if (result >= 8)
    return (*(_DWORD *)a1 + 8);
  return result;
}

uint64_t sub_23C44C734(uint64_t result, unsigned int a2)
{
  if (a2 > 7)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 8;
    LOBYTE(a2) = 8;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue()
{
  return &type metadata for DynamicPredicateEquatableValue;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEquatableValue.Stripped(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DynamicPredicateEquatableValue.Stripped(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C44C840 + 4 * byte_23C458A8A[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23C44C874 + 4 * byte_23C458A85[v4]))();
}

uint64_t sub_23C44C874(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C44C87C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C44C884);
  return result;
}

uint64_t sub_23C44C890(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C44C898);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23C44C89C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C44C8A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.Stripped()
{
  return &type metadata for DynamicPredicateEquatableValue.Stripped;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEquatableValue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateEquatableValue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C44C99C + 4 * byte_23C458A94[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23C44C9D0 + 4 * byte_23C458A8F[v4]))();
}

uint64_t sub_23C44C9D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C44C9D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C44C9E0);
  return result;
}

uint64_t sub_23C44C9EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C44C9F4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23C44C9F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C44CA00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.CodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.GridSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.GridSizeClassCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.IntegerCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.IntegerCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.KeyPathCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.KeyPathCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.PlatformCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.PlatformCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.StringCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.StringCodingKeys;
}

uint64_t _s16FitnessUtilities30DynamicPredicateEquatableValueO25DynamicTypeSizeCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C44CAD0 + 4 * byte_23C458A99[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C44CAF0 + 4 * byte_23C458A9E[v4]))();
}

_BYTE *sub_23C44CAD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C44CAF0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C44CAF8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C44CB00(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C44CB08(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C44CB10(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys;
}

unint64_t sub_23C44CB30()
{
  unint64_t result;

  result = qword_256B9F7E0;
  if (!qword_256B9F7E0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458DAC, &type metadata for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F7E0);
  }
  return result;
}

unint64_t sub_23C44CB78()
{
  unint64_t result;

  result = qword_256B9F7E8;
  if (!qword_256B9F7E8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458E64, &type metadata for DynamicPredicateEquatableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F7E8);
  }
  return result;
}

unint64_t sub_23C44CBC0()
{
  unint64_t result;

  result = qword_256B9F7F0;
  if (!qword_256B9F7F0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458F1C, &type metadata for DynamicPredicateEquatableValue.PlatformCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F7F0);
  }
  return result;
}

unint64_t sub_23C44CC08()
{
  unint64_t result;

  result = qword_256B9F7F8;
  if (!qword_256B9F7F8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458FD4, &type metadata for DynamicPredicateEquatableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F7F8);
  }
  return result;
}

unint64_t sub_23C44CC50()
{
  unint64_t result;

  result = qword_256B9F800;
  if (!qword_256B9F800)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45908C, &type metadata for DynamicPredicateEquatableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F800);
  }
  return result;
}

unint64_t sub_23C44CC98()
{
  unint64_t result;

  result = qword_256B9F808;
  if (!qword_256B9F808)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459144, &type metadata for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F808);
  }
  return result;
}

unint64_t sub_23C44CCE0()
{
  unint64_t result;

  result = qword_256B9F810;
  if (!qword_256B9F810)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4591FC, &type metadata for DynamicPredicateEquatableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F810);
  }
  return result;
}

unint64_t sub_23C44CD28()
{
  unint64_t result;

  result = qword_256B9F818;
  if (!qword_256B9F818)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4592B4, &type metadata for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F818);
  }
  return result;
}

unint64_t sub_23C44CD70()
{
  unint64_t result;

  result = qword_256B9F820;
  if (!qword_256B9F820)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45936C, &type metadata for DynamicPredicateEquatableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F820);
  }
  return result;
}

unint64_t sub_23C44CDB8()
{
  unint64_t result;

  result = qword_256B9F828;
  if (!qword_256B9F828)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459224, &type metadata for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F828);
  }
  return result;
}

unint64_t sub_23C44CE00()
{
  unint64_t result;

  result = qword_256B9F830;
  if (!qword_256B9F830)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45924C, &type metadata for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F830);
  }
  return result;
}

unint64_t sub_23C44CE48()
{
  unint64_t result;

  result = qword_256B9F838;
  if (!qword_256B9F838)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45916C, &type metadata for DynamicPredicateEquatableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F838);
  }
  return result;
}

unint64_t sub_23C44CE90()
{
  unint64_t result;

  result = qword_256B9F840;
  if (!qword_256B9F840)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459194, &type metadata for DynamicPredicateEquatableValue.GridSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F840);
  }
  return result;
}

unint64_t sub_23C44CED8()
{
  unint64_t result;

  result = qword_256B9F848;
  if (!qword_256B9F848)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4590B4, &type metadata for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F848);
  }
  return result;
}

unint64_t sub_23C44CF20()
{
  unint64_t result;

  result = qword_256B9F850;
  if (!qword_256B9F850)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4590DC, &type metadata for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F850);
  }
  return result;
}

unint64_t sub_23C44CF68()
{
  unint64_t result;

  result = qword_256B9F858;
  if (!qword_256B9F858)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458FFC, &type metadata for DynamicPredicateEquatableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F858);
  }
  return result;
}

unint64_t sub_23C44CFB0()
{
  unint64_t result;

  result = qword_256B9F860;
  if (!qword_256B9F860)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459024, &type metadata for DynamicPredicateEquatableValue.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F860);
  }
  return result;
}

unint64_t sub_23C44CFF8()
{
  unint64_t result;

  result = qword_256B9F868;
  if (!qword_256B9F868)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458F44, &type metadata for DynamicPredicateEquatableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F868);
  }
  return result;
}

unint64_t sub_23C44D040()
{
  unint64_t result;

  result = qword_256B9F870;
  if (!qword_256B9F870)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458F6C, &type metadata for DynamicPredicateEquatableValue.KeyPathCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F870);
  }
  return result;
}

unint64_t sub_23C44D088()
{
  unint64_t result;

  result = qword_256B9F878;
  if (!qword_256B9F878)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458E8C, &type metadata for DynamicPredicateEquatableValue.PlatformCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F878);
  }
  return result;
}

unint64_t sub_23C44D0D0()
{
  unint64_t result;

  result = qword_256B9F880;
  if (!qword_256B9F880)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458EB4, &type metadata for DynamicPredicateEquatableValue.PlatformCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F880);
  }
  return result;
}

unint64_t sub_23C44D118()
{
  unint64_t result;

  result = qword_256B9F888;
  if (!qword_256B9F888)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458DD4, &type metadata for DynamicPredicateEquatableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F888);
  }
  return result;
}

unint64_t sub_23C44D160()
{
  unint64_t result;

  result = qword_256B9F890;
  if (!qword_256B9F890)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458DFC, &type metadata for DynamicPredicateEquatableValue.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F890);
  }
  return result;
}

unint64_t sub_23C44D1A8()
{
  unint64_t result;

  result = qword_256B9F898;
  if (!qword_256B9F898)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458D1C, &type metadata for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F898);
  }
  return result;
}

unint64_t sub_23C44D1F0()
{
  unint64_t result;

  result = qword_256B9F8A0;
  if (!qword_256B9F8A0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C458D44, &type metadata for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F8A0);
  }
  return result;
}

unint64_t sub_23C44D238()
{
  unint64_t result;

  result = qword_256B9F8A8;
  if (!qword_256B9F8A8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4592DC, &type metadata for DynamicPredicateEquatableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F8A8);
  }
  return result;
}

unint64_t sub_23C44D280()
{
  unint64_t result;

  result = qword_256B9F8B0;
  if (!qword_256B9F8B0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459304, &type metadata for DynamicPredicateEquatableValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9F8B0);
  }
  return result;
}

uint64_t sub_23C44D2C4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x5463696D616E7964 && a2 == 0xEF657A6953657079;
  if (v3 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A695364697267 && a2 == 0xED00007373616C43 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C45A600 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x72656765746E69 && a2 == 0xE700000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6874615079656BLL && a2 == 0xE700000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C45A620)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t String.init(localizing:tableName:bundle:locale:comment:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, __int16 a8)
{
  uint64_t v9;

  v9 = sub_23C44D640(a1, a2, a3, a4, a5, a6, a7, a8 & 0x1FF);

  return v9;
}

uint64_t sub_23C44D640(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  char *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v39 = a8;
  v41 = a6;
  v42 = a7;
  v34 = a5;
  v35 = a4;
  v40 = a3;
  v38 = a2;
  v43 = a1;
  v8 = sub_23C455E10();
  v36 = *(_QWORD *)(v8 - 8);
  v37 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23C455E94();
  v31 = *(_QWORD *)(v11 - 8);
  v12 = v31;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23C455FC0();
  v16 = *(_QWORD *)(v15 - 8);
  v32 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_23C455E1C();
  v19 = *(_QWORD *)(v33 - 8);
  v20 = MEMORY[0x24BDAC7A8](v33);
  v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v31 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v43, v15);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v26 = v34;
  v25(v14, v34, v11);
  v27 = objc_msgSend(v35, sel_bundleURL);
  sub_23C455E40();

  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v10, *MEMORY[0x24BDCD330], v37);
  sub_23C455E28();
  v28 = v33;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, v33);
  v29 = sub_23C455FCC();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v26, v11);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v43, v32);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v28);
  return v29;
}

uint64_t View.fitnessAccessibilityIdentifier(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23C44D8BC(a1, a2, a3, (uint64_t)&type metadata for FitnessAccessibilityIdentifierModifier);
}

uint64_t View.fitnessAccessibilityScope(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23C44D8BC(a1, a2, a3, (uint64_t)&type metadata for FitnessAccessibilityScopeModifier);
}

uint64_t sub_23C44D8BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath;
  char v10;
  uint64_t v11;

  KeyPath = swift_getKeyPath();
  v10 = 0;
  v11 = a1;
  swift_bridgeObjectRetain();
  MEMORY[0x24261EDCC](&KeyPath, a2, a4, a3);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t View.rootFitnessAccessibilityScope(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  return MEMORY[0x24261EDCC](&v4, a2, &type metadata for RootFitnessAccessibilityScopeModifier, a3);
}

{
  uint64_t v4;

  v4 = a1;
  return MEMORY[0x24261EDCC](&v4, a2, &type metadata for RootFitnessAccessibilityScopeModifier, a3);
}

uint64_t withFitnessAccessibilityScope<A>(_:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  uint64_t v14;

  v8 = *(_QWORD *)(a4 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  View.fitnessAccessibilityScope(_:)(a1, a4, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a4);
}

uint64_t sub_23C44DA5C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  char v9;
  uint64_t v10;
  uint64_t inited;
  int64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  int64_t v29;

  v9 = a3 & 1;
  sub_23C44E038(a2, a3 & 1);
  v10 = sub_23C44E9D0(a2, v9);
  sub_23C44E048(a2, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F8D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23C4596B0;
  *(_QWORD *)(inited + 32) = v10;
  *(_QWORD *)(inited + 40) = a4;
  v12 = *(_QWORD *)(v10 + 16);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = sub_23C44EB98(0, v12, 1, MEMORY[0x24BEE4AF8]);
  v14 = v13;
  if (*(_QWORD *)(v10 + 16))
  {
    v15 = v13[2];
    if ((v13[3] >> 1) - v15 < v12)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v16 = (unint64_t)&v13[2 * v15 + 4];
    if (v10 + 32 < v16 + 16 * v12 && v16 < v10 + 32 + 16 * v12)
      goto LABEL_38;
    swift_arrayInitWithCopy();
    if (v12)
    {
      v18 = v14[2];
      v19 = __OFADD__(v18, v12);
      v20 = v18 + v12;
      if (v19)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      v14[2] = v20;
    }
  }
  else if (v12)
  {
    __break(1u);
    goto LABEL_28;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(inited + 40);
  v4 = *(_QWORD *)(v12 + 16);
  v5 = v14[2];
  v6 = v5 + v4;
  if (__OFADD__(v5, v4))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v21 = v14[3];
  swift_bridgeObjectRetain();
  if (v6 <= (uint64_t)(v21 >> 1))
  {
    v22 = v4;
    goto LABEL_15;
  }
LABEL_29:
  if (v5 <= v6)
    v29 = v6;
  else
    v29 = v5;
  v14 = sub_23C44EB98((_QWORD *)1, v29, 1, v14);
  v22 = *(_QWORD *)(v12 + 16);
LABEL_15:
  if (!v22)
  {
    if (!v4)
      goto LABEL_26;
    __break(1u);
    goto LABEL_34;
  }
  v23 = v14[2];
  if ((v14[3] >> 1) - v23 < v4)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v24 = (unint64_t)&v14[2 * v23 + 4];
  if (v12 + 32 < v24 + 16 * v4 && v24 < v12 + 32 + 16 * v4)
    goto LABEL_38;
  swift_arrayInitWithCopy();
  if (!v4)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F8E0);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    sub_23C44EFBC(&qword_256B9F8E8, &qword_256B9F8E0, MEMORY[0x24BEE12B0]);
    swift_bridgeObjectRetain();
    sub_23C455F9C();
    swift_bridgeObjectRelease_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F8F0);
    sub_23C44EFBC(&qword_256B9F8F8, &qword_256B9F8F0, MEMORY[0x24BDEFB78]);
    sub_23C455F30();
    return swift_bridgeObjectRelease();
  }
  v26 = v14[2];
  v19 = __OFADD__(v26, v4);
  v27 = v26 + v4;
  if (!v19)
  {
    v14[2] = v27;
    goto LABEL_26;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  result = sub_23C4562D8();
  __break(1u);
  return result;
}

uint64_t sub_23C44DDDC()
{
  uint64_t v1;

  sub_23C44ED98();
  sub_23C455F00();
  return v1;
}

uint64_t sub_23C44DE14@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_23C44ED98();
  result = sub_23C455F00();
  *a1 = v3;
  return result;
}

uint64_t sub_23C44DE60()
{
  sub_23C44ED98();
  swift_bridgeObjectRetain();
  return sub_23C455F0C();
}

uint64_t sub_23C44DEC0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx16FitnessUtilities0F31AccessibilityIdentifierModifier33_BAB2E63482B1A39DE7658A3B572CE53ALLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for FitnessAccessibilityIdentifierModifier, (uint64_t (*)(void))sub_23C44DED4);
}

unint64_t sub_23C44DED4()
{
  unint64_t result;

  result = qword_256B9F8C0;
  if (!qword_256B9F8C0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45985C, &type metadata for FitnessAccessibilityIdentifierModifier);
    atomic_store(result, (unint64_t *)&qword_256B9F8C0);
  }
  return result;
}

uint64_t sub_23C44DF18(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx16FitnessUtilities0F31AccessibilityIdentifierModifier33_BAB2E63482B1A39DE7658A3B572CE53ALLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for FitnessAccessibilityScopeModifier, (uint64_t (*)(void))sub_23C44DF2C);
}

unint64_t sub_23C44DF2C()
{
  unint64_t result;

  result = qword_256B9F8C8;
  if (!qword_256B9F8C8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45980C, &type metadata for FitnessAccessibilityScopeModifier);
    atomic_store(result, (unint64_t *)&qword_256B9F8C8);
  }
  return result;
}

uint64_t sub_23C44DF70(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx16FitnessUtilities0F31AccessibilityIdentifierModifier33_BAB2E63482B1A39DE7658A3B572CE53ALLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for RootFitnessAccessibilityScopeModifier, (uint64_t (*)(void))sub_23C44DFE0);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx16FitnessUtilities0F31AccessibilityIdentifierModifier33_BAB2E63482B1A39DE7658A3B572CE53ALLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  v4 = *(_QWORD *)(a1 + 8);
  v5 = sub_23C455EDC();
  v7[0] = v4;
  v7[1] = a3();
  return MEMORY[0x24261F5D0](MEMORY[0x24BDED308], v5, v7);
}

unint64_t sub_23C44DFE0()
{
  unint64_t result;

  result = qword_256B9F8D0;
  if (!qword_256B9F8D0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4597BC, &type metadata for RootFitnessAccessibilityScopeModifier);
    atomic_store(result, (unint64_t *)&qword_256B9F8D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for RootFitnessAccessibilityScopeModifier()
{
  return &type metadata for RootFitnessAccessibilityScopeModifier;
}

uint64_t sub_23C44E038(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return swift_retain();
}

uint64_t sub_23C44E048(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_release();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityScopeModifier()
{
  return &type metadata for FitnessAccessibilityScopeModifier;
}

uint64_t _s16FitnessUtilities33FitnessAccessibilityScopeModifierVwxx_0(uint64_t a1)
{
  sub_23C44E048(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t _s16FitnessUtilities33FitnessAccessibilityScopeModifierVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_23C44E038(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s16FitnessUtilities33FitnessAccessibilityScopeModifierVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_23C44E038(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_23C44E048(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16FitnessUtilities33FitnessAccessibilityScopeModifierVwta_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_23C44E048(v6, v7);
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16FitnessUtilities33FitnessAccessibilityScopeModifierVwet_0(uint64_t a1, int a2)
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

uint64_t sub_23C44E20C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifierModifier()
{
  return &type metadata for FitnessAccessibilityIdentifierModifier;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityScope()
{
  return &type metadata for FitnessAccessibilityScope;
}

uint64_t sub_23C44E26C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C44E284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23C44E5BC(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD))sub_23C44DA5C);
}

uint64_t sub_23C44E290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  char v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t result;
  uint64_t *v35;
  int64_t v36;

  v12 = a3 & 1;
  sub_23C44E038(a2, a3 & 1);
  v13 = sub_23C44E9D0(a2, v12);
  sub_23C44E048(a2, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F8D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23C4596B0;
  *(_QWORD *)(inited + 32) = v13;
  v15 = inited + 32;
  *(_QWORD *)(inited + 40) = a4;
  v16 = *(_QWORD *)(v13 + 16);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_23C44EB98(0, v16, 1, MEMORY[0x24BEE4AF8]);
  v18 = v17;
  if (*(_QWORD *)(v13 + 16))
  {
    v19 = v17[2];
    if ((v17[3] >> 1) - v19 < v16)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v20 = (unint64_t)&v17[2 * v19 + 4];
    if (v13 + 32 < v20 + 16 * v16 && v20 < v13 + 32 + 16 * v16)
      goto LABEL_38;
    swift_arrayInitWithCopy();
    if (v16)
    {
      v22 = v18[2];
      v23 = __OFADD__(v22, v16);
      v24 = v22 + v16;
      if (v23)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      v18[2] = v24;
    }
  }
  else if (v16)
  {
    __break(1u);
    goto LABEL_28;
  }
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(inited + 40);
  v5 = *(_QWORD *)(v16 + 16);
  v6 = v18[2];
  v7 = v6 + v5;
  if (__OFADD__(v6, v5))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v15 = a5;
  a5 = a1;
  v25 = v18[3];
  swift_bridgeObjectRetain();
  if (v7 <= (uint64_t)(v25 >> 1))
  {
    v26 = v5;
    goto LABEL_15;
  }
LABEL_29:
  if (v6 <= v7)
    v36 = v7;
  else
    v36 = v6;
  v18 = sub_23C44EB98((_QWORD *)1, v36, 1, v18);
  v26 = *(_QWORD *)(v16 + 16);
LABEL_15:
  if (!v26)
  {
    if (!v5)
      goto LABEL_26;
    __break(1u);
    goto LABEL_34;
  }
  v27 = v18[2];
  if ((v18[3] >> 1) - v27 < v5)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v28 = (unint64_t)&v18[2 * v27 + 4];
  if (v16 + 32 < v28 + 16 * v5 && v28 < v16 + 32 + 16 * v5)
    goto LABEL_38;
  swift_arrayInitWithCopy();
  if (!v5)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F8E0);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F908);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v15, a5, v33);
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F910);
    v35 = (uint64_t *)(v15 + *(int *)(result + 36));
    *v35 = KeyPath;
    v35[1] = (uint64_t)v18;
    return result;
  }
  v30 = v18[2];
  v23 = __OFADD__(v30, v5);
  v31 = v30 + v5;
  if (!v23)
  {
    v18[2] = v31;
    goto LABEL_26;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  result = sub_23C4562D8();
  __break(1u);
  return result;
}

uint64_t sub_23C44E5B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23C44E5BC(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD))sub_23C44E290);
}

uint64_t sub_23C44E5BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD))
{
  uint64_t v4;

  return a4(a1, *(_QWORD *)v4, *(unsigned __int8 *)(v4 + 8), *(_QWORD *)(v4 + 16));
}

uint64_t sub_23C44E5D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v9;
  unint64_t v10;
  uint64_t inited;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t result;
  uint64_t *v27;
  uint64_t v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F900);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23C4596C0;
  *(_QWORD *)(v9 + 32) = 0x507373656E746946;
  v10 = v9 + 32;
  *(_QWORD *)(v9 + 40) = 0xEB0000000073756CLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F8D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23C4596B0;
  *(_QWORD *)(inited + 32) = v9;
  *(_QWORD *)(inited + 40) = a2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = sub_23C44EB98(0, 1, 1, MEMORY[0x24BEE4AF8]);
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_28;
  v13 = v12;
  v14 = v12[2];
  if (v14 >= v12[3] >> 1)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v28 = a1;
  v15 = (unint64_t)&v12[2 * v14 + 4];
  if (v10 < (unint64_t)&v13[2 * v14 + 6] && v15 < v9 + 48)
    goto LABEL_29;
  swift_arrayInitWithCopy();
  ++v13[2];
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(inited + 40);
  v3 = *(_QWORD *)(v10 + 16);
  v4 = v13[2];
  v5 = v4 + v3;
  if (__OFADD__(v4, v3))
    goto LABEL_18;
  v17 = v13[3];
  swift_bridgeObjectRetain();
  if (v5 <= (uint64_t)(v17 >> 1))
  {
    if (v3)
      goto LABEL_11;
LABEL_23:
    if (!v3)
      goto LABEL_24;
    __break(1u);
    goto LABEL_26;
  }
LABEL_19:
  if (v4 <= v5)
    v23 = v5;
  else
    v23 = v4;
  v13 = sub_23C44EB98((_QWORD *)1, v23, 1, v13);
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_23;
LABEL_11:
  v18 = v13[2];
  if ((v13[3] >> 1) - v18 >= v3)
  {
    v19 = (unint64_t)&v13[2 * v18 + 4];
    if (v10 + 32 < v19 + 16 * v3 && v19 < v10 + 32 + 16 * v3)
      goto LABEL_29;
    swift_arrayInitWithCopy();
    if (!v3)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F8E0);
      swift_arrayDestroy();
      swift_bridgeObjectRelease();
      KeyPath = swift_getKeyPath();
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F918);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(a3, v28, v25);
      result = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F920);
      v27 = (uint64_t *)(a3 + *(int *)(result + 36));
      *v27 = KeyPath;
      v27[1] = (uint64_t)v13;
      return result;
    }
    v20 = v13[2];
    v21 = __OFADD__(v20, v3);
    v22 = v20 + v3;
    if (!v21)
    {
      v13[2] = v22;
      goto LABEL_24;
    }
    goto LABEL_27;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  result = sub_23C4562D8();
  __break(1u);
  return result;
}

uint64_t sub_23C44E8E0()
{
  return sub_23C455EC4();
}

uint64_t sub_23C44E8F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_23C44E5D8(a1, *v2, a2);
}

uint64_t sub_23C44E900()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23C44E910()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_23C44E920()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F900);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_23C4596C0;
  *(_QWORD *)(v0 + 32) = 0x507373656E746946;
  *(_QWORD *)(v0 + 40) = 0xEB0000000073756CLL;
  qword_256B9F8B8 = v0;
  return result;
}

uint64_t sub_23C44E97C@<X0>(_QWORD *a1@<X8>)
{
  if (qword_256B9EE90 != -1)
    swift_once();
  *a1 = qword_256B9F8B8;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C44E9D0(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_23C455EF4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    v8 = sub_23C45620C();
    v9 = sub_23C455F24();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14 = sub_23C44F4C4(0xD000000000000040, 0x800000023C45A7F0, &v15);
      sub_23C45623C();
      _os_log_impl(&dword_23C439000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24261F66C](v12, -1, -1);
      MEMORY[0x24261F66C](v11, -1, -1);
    }

    sub_23C455EE8();
    swift_getAtKeyPath();
    sub_23C44E048(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

_QWORD *sub_23C44EB98(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F900);
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
    sub_23C44ECA4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C44ECA4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23C4562D8();
  __break(1u);
  return result;
}

unint64_t sub_23C44ED98()
{
  unint64_t result;

  result = qword_256B9F928;
  if (!qword_256B9F928)
  {
    result = MEMORY[0x24261F5D0](&unk_23C4598D8, &type metadata for FitnessAccessibilityScopeEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_256B9F928);
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityScopeEnvironmentKey()
{
  return &type metadata for FitnessAccessibilityScopeEnvironmentKey;
}

unint64_t sub_23C44EDF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256B9F930;
  if (!qword_256B9F930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B9F938);
    v2[0] = sub_23C44EFBC(&qword_256B9F8F8, &qword_256B9F8F0, MEMORY[0x24BDEFB78]);
    v2[1] = sub_23C44EE74();
    result = MEMORY[0x24261F5D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256B9F930);
  }
  return result;
}

unint64_t sub_23C44EE74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B9F940;
  if (!qword_256B9F940)
  {
    v1 = sub_23C455F18();
    result = MEMORY[0x24261F5D0](MEMORY[0x24BDF1078], v1);
    atomic_store(result, (unint64_t *)&qword_256B9F940);
  }
  return result;
}

uint64_t sub_23C44EEBC()
{
  return sub_23C44EEF0(&qword_256B9F948, &qword_256B9F910, &qword_256B9F950, &qword_256B9F908);
}

uint64_t sub_23C44EEF0(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = sub_23C44EFBC(a3, a4, MEMORY[0x24BDEFB78]);
    v9[1] = sub_23C44EFBC(&qword_256B9F958, &qword_256B9F960, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24261F5D0](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C44EF88()
{
  return sub_23C44EEF0(&qword_256B9F968, &qword_256B9F920, &qword_256B9F970, &qword_256B9F918);
}

uint64_t sub_23C44EFBC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24261F5D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

Swift::Void __swiftcall Logger.trace(file:function:)(Swift::String file, Swift::String function)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
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
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  _opaque_pthread_t *v33;
  Swift::String v34;

  object = function._object;
  countAndFlagsBits = function._countAndFlagsBits;
  v4 = file._object;
  v5 = file._countAndFlagsBits;
  v34 = file;
  sub_23C44F394();
  v6 = sub_23C456254();
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = v6 + 16 * v7;
    v5 = *(_QWORD *)(v8 + 16);
    v4 = *(void **)(v8 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_23C44F3D8(46, 0xE100000000000000, v5, (unint64_t)v4);
  v9 = sub_23C456020();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_bridgeObjectRelease();
  v16 = MEMORY[0x24261EE74](v9, v11, v13, v15);
  v18 = v17;
  swift_bridgeObjectRelease();
  sub_23C44F3D8(40, 0xE100000000000000, countAndFlagsBits, (unint64_t)object);
  swift_bridgeObjectRetain();
  v19 = sub_23C456020();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  swift_bridgeObjectRelease();
  v26 = MEMORY[0x24261EE74](v19, v21, v23, v25);
  v28 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29 = sub_23C455EA0();
  v30 = sub_23C456218();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v34._countAndFlagsBits = v32;
    *(_DWORD *)v31 = 67109634;
    v33 = pthread_self();
    pthread_mach_thread_np(v33);
    sub_23C45623C();
    *(_WORD *)(v31 + 8) = 2082;
    swift_bridgeObjectRetain();
    sub_23C44F4C4(v16, v18, &v34._countAndFlagsBits);
    sub_23C45623C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 18) = 2082;
    swift_bridgeObjectRetain();
    sub_23C44F4C4(v26, v28, &v34._countAndFlagsBits);
    sub_23C45623C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C439000, v29, v30, "[%u] %{public}s::%{public}s", (uint8_t *)v31, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x24261F66C](v32, -1, -1);
    MEMORY[0x24261F66C](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

}

unint64_t sub_23C44F394()
{
  unint64_t result;

  result = qword_256B9F978;
  if (!qword_256B9F978)
  {
    result = MEMORY[0x24261F5D0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256B9F978);
  }
  return result;
}

unint64_t sub_23C44F3D8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;

  v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v4 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  v7 = 4 * v4;
  v8 = 15;
  while (sub_23C456014() != a1 || v9 != a2)
  {
    v10 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v8;
    v8 = sub_23C455FFC();
    if (v7 == v8 >> 14)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23C44F4C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23C44F594(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23C44F74C((uint64_t)v12, *a3);
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
      sub_23C44F74C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23C44F594(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23C456248();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23C44F788(a5, a6);
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
  v8 = sub_23C4562B4();
  if (!v8)
  {
    sub_23C4562CC();
    __break(1u);
LABEL_17:
    result = sub_23C4562D8();
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

uint64_t sub_23C44F74C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23C44F788(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23C44F81C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23C44F9F4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23C44F9F4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23C44F81C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23C44F990(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23C456290();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23C4562CC();
      __break(1u);
LABEL_10:
      v2 = sub_23C456008();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23C4562D8();
    __break(1u);
LABEL_14:
    result = sub_23C4562CC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23C44F990(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F980);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23C44F9F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F980);
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
  result = sub_23C4562D8();
  __break(1u);
  return result;
}

uint64_t AsyncSequence.erased()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  sub_23C456194();
  return swift_release();
}

uint64_t sub_23C44FC08()
{
  uint64_t v0;

  return sub_23C44FC9C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C44FC14()
{
  return swift_deallocObject();
}

uint64_t sub_23C44FC24()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23C4482DC;
  return sub_23C4482DC();
}

void sub_23C44FC68()
{
  sub_23C4562C0();
  JUMPOUT(0x24261F5D0);
}

uint64_t sub_23C44FC9C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t AsyncStreamPublisher.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AsyncStreamPublisher.init()();
  return v0;
}

uint64_t AsyncStreamPublisher.init()()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  sub_23C455E88();
  sub_23C45617C();
  swift_getTupleTypeMetadata2();
  sub_23C4560C8();
  sub_23C450BEC();
  *(_QWORD *)(v0 + 112) = sub_23C455F48();
  return v0;
}

uint64_t AsyncStreamPublisher.publish(_:)()
{
  uint64_t v0;

  swift_beginAccess();
  sub_23C455E88();
  sub_23C45617C();
  sub_23C450BEC();
  v0 = sub_23C455F54();
  swift_bridgeObjectRetain();
  MEMORY[0x24261F5D0](MEMORY[0x24BEE04D8], v0);
  sub_23C456038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C44FE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;

  v13 = a2;
  v4 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23C456134();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - v9;
  sub_23C455E88();
  sub_23C45617C();
  swift_getTupleTypeMetadata2();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, a3);
  sub_23C456164();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t AsyncStreamPublisher.publish<>()()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F9A0);
  v28 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F9A8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v26 - v8;
  swift_beginAccess();
  v10 = *(_QWORD *)(v0 + 112);
  v11 = *(_QWORD *)(v10 + 64);
  v26 = v10 + 64;
  v12 = 1 << *(_BYTE *)(v10 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v27 = (unint64_t)(v12 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v16 = 0;
  while (1)
  {
    if (v14)
    {
      v17 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v18 = v17 | (v16 << 6);
      goto LABEL_5;
    }
    v23 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v27)
      goto LABEL_25;
    v24 = *(_QWORD *)(v26 + 8 * v23);
    ++v16;
    if (!v24)
    {
      v16 = v23 + 1;
      if (v23 + 1 >= v27)
        goto LABEL_25;
      v24 = *(_QWORD *)(v26 + 8 * v16);
      if (!v24)
      {
        v16 = v23 + 2;
        if (v23 + 2 >= v27)
          goto LABEL_25;
        v24 = *(_QWORD *)(v26 + 8 * v16);
        if (!v24)
        {
          v16 = v23 + 3;
          if (v23 + 3 >= v27)
            goto LABEL_25;
          v24 = *(_QWORD *)(v26 + 8 * v16);
          if (!v24)
          {
            v16 = v23 + 4;
            if (v23 + 4 >= v27)
              goto LABEL_25;
            v24 = *(_QWORD *)(v26 + 8 * v16);
            if (!v24)
              break;
          }
        }
      }
    }
LABEL_24:
    v14 = (v24 - 1) & v24;
    v18 = __clz(__rbit64(v24)) + (v16 << 6);
LABEL_5:
    v19 = *(_QWORD *)(v10 + 48);
    v20 = sub_23C455E88();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v9, v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v20);
    v21 = *(_QWORD *)(v10 + 56);
    v22 = __swift_instantiateConcreteTypeFromMangledName(qword_256B9F9B0);
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(&v9[*(int *)(v4 + 48)], v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v18, v22);
    sub_23C450C4C((uint64_t)v9, (uint64_t)v7);
    sub_23C456158();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v3, v1);
    result = sub_23C450C94((uint64_t)v7);
  }
  v25 = v23 + 5;
  if (v25 >= v27)
  {
LABEL_25:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  v24 = *(_QWORD *)(v26 + 8 * v25);
  if (v24)
  {
    v16 = v25;
    goto LABEL_24;
  }
  while (1)
  {
    v16 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v16 >= v27)
      goto LABEL_25;
    v24 = *(_QWORD *)(v26 + 8 * v16);
    ++v25;
    if (v24)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23C450250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v4 = sub_23C45617C();
  v5 = sub_23C456230();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - v6;
  v8 = sub_23C455E88();
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
  v11 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v7, a1, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v4);
  swift_beginAccess();
  sub_23C450BEC();
  sub_23C455F54();
  sub_23C455F60();
  return swift_endAccess();
}

uint64_t sub_23C450398(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = sub_23C45617C();
  v3 = sub_23C456230();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - v4;
  v6 = sub_23C455E88();
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v5, 1, 1, v2);
  swift_beginAccess();
  sub_23C450BEC();
  sub_23C455F54();
  sub_23C455F60();
  return swift_endAccess();
}

uint64_t AsyncStreamPublisher.deinit()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  sub_23C455E88();
  sub_23C45617C();
  sub_23C450BEC();
  v1 = sub_23C455F54();
  swift_bridgeObjectRetain();
  MEMORY[0x24261F5D0](MEMORY[0x24BEE04D8], v1);
  sub_23C456038();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_23C4505A0()
{
  sub_23C455E88();
  sub_23C45617C();
  swift_getTupleTypeMetadata2();
  return sub_23C456170();
}

uint64_t AsyncStreamPublisher.__deallocating_deinit()
{
  AsyncStreamPublisher.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t AsyncStreamPublisher.makeStream(bufferingPolicy:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE v12[16];
  uint64_t v13;
  _BYTE *v14;

  v3 = sub_23C45614C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v12[-v5];
  v7 = sub_23C455E88();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23C455E7C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v13 = v1;
  v14 = v10;
  sub_23C456188();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23C450748(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v13)(char *, uint64_t, uint64_t);
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
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(uint64_t, char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;

  v41 = a2;
  v38 = a1;
  v33 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  v4 = v33;
  v34 = a3;
  v42 = sub_23C45617C();
  v5 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
  v39 = *(_QWORD *)(v42 - 8);
  v40 = v5;
  MEMORY[0x24BDAC7A8](v42);
  v43 = (char *)&v32 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6A8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v9;
  v10 = sub_23C455E88();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v13((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v10);
  v14 = *(unsigned __int8 *)(v11 + 80);
  v35 = v14 | 7;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v4;
  *(_QWORD *)(v15 + 24) = v41;
  v37 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v37(v15 + ((v14 + 32) & ~v14), (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  swift_retain();
  v16 = v42;
  v17 = v38;
  sub_23C456140();
  v18 = sub_23C456128();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
  v19 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v43, v17, v16);
  v13((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v34, v10);
  v20 = v33;
  v23 = type metadata accessor for AsyncStreamPublisher(255, v33, v21, v22);
  v24 = MEMORY[0x24261F5D0](&protocol conformance descriptor for AsyncStreamPublisher<A>, v23);
  v25 = v19;
  v26 = (*(unsigned __int8 *)(v19 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v27 = (v40 + v14 + v26) & ~v14;
  v28 = (char *)swift_allocObject();
  v30 = v41;
  v29 = v42;
  *((_QWORD *)v28 + 2) = v41;
  *((_QWORD *)v28 + 3) = v24;
  *((_QWORD *)v28 + 4) = v20;
  *((_QWORD *)v28 + 5) = v30;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(&v28[v26], v43, v29);
  v37((uint64_t)&v28[v27], (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  swift_retain_n();
  sub_23C447F80((uint64_t)v36, (uint64_t)&unk_256B9FA40, (uint64_t)v28);
  return swift_release();
}

uint64_t sub_23C4509DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v16;

  v5 = *a2;
  v6 = sub_23C455E88();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F6A8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23C456128();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = 0;
  *((_QWORD *)v14 + 3) = 0;
  *((_QWORD *)v14 + 4) = *(_QWORD *)(v5 + 80);
  *((_QWORD *)v14 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v14[v13], (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_retain();
  sub_23C447F80((uint64_t)v11, (uint64_t)&unk_256B9FA50, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_23C450B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_23C450B48()
{
  uint64_t v0;

  sub_23C450398(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C450B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_23C450B94()
{
  uint64_t v0;

  sub_23C450250(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AsyncStreamPublisher.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23C450BD4()
{
  return AsyncStreamPublisher.unownedExecutor.getter();
}

unint64_t sub_23C450BEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B9F998;
  if (!qword_256B9F998)
  {
    v1 = sub_23C455E88();
    result = MEMORY[0x24261F5D0](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_256B9F998);
  }
  return result;
}

uint64_t sub_23C450C34(uint64_t a1)
{
  uint64_t v1;

  return sub_23C44FE34(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 16));
}

uint64_t sub_23C450C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F9A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C450C94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F9A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C450CD4()
{
  return sub_23C4505A0();
}

uint64_t sub_23C450CEC(uint64_t a1)
{
  uint64_t v1;

  return sub_23C450748(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23C450CF4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AsyncStreamPublisher(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncStreamPublisher);
}

uint64_t method lookup function for AsyncStreamPublisher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncStreamPublisher.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_23C450D60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23C455E88();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23C450DD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_23C455E88() - 8) + 80);
  return sub_23C4509DC(a1, *(uint64_t **)(v1 + 24), v1 + ((v3 + 32) & ~v3));
}

uint64_t sub_23C450E14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_23C45617C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23C455E88();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_23C450EDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = *(_QWORD *)(sub_23C45617C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_23C455E88() - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = *(_QWORD *)(v0 + 40);
  v8 = v0 + v3;
  v9 = v0 + (v6 & ~v5);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_23C44A2FC;
  v10[3] = v8;
  v10[4] = v9;
  v10[2] = v7;
  return swift_task_switch();
}

uint64_t sub_23C450F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23C455E88();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23C451008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_23C455E88() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = v0 + ((v2 + 48) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23C4482DC;
  v5[2] = v3;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t DynamicPredicateLogicalDescriptor.lhs.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t DynamicPredicateLogicalDescriptor.logicalOperator.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t DynamicPredicateLogicalDescriptor.rhs.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t DynamicPredicateLogicalDescriptor.init(lhs:logicalOperator:rhs:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = a2 & 1;
  *(_QWORD *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_23C4510F0(char a1)
{
  return qword_23C459BC0[a1];
}

uint64_t sub_23C451110()
{
  char *v0;

  return sub_23C4510F0(*v0);
}

uint64_t sub_23C451118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C451DBC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23C45113C()
{
  sub_23C451324();
  return sub_23C45647C();
}

uint64_t sub_23C451164()
{
  sub_23C451324();
  return sub_23C456488();
}

uint64_t DynamicPredicateLogicalDescriptor.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  int v12;
  char v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FA58);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v12 = *((unsigned __int8 *)v1 + 8);
  v11 = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C451324();
  sub_23C456470();
  v14 = v8;
  v13 = 0;
  sub_23C451368();
  sub_23C4563B0();
  if (!v2)
  {
    v9 = v11;
    LOBYTE(v14) = v12;
    v13 = 1;
    sub_23C4513AC();
    sub_23C4563B0();
    v14 = v9;
    v13 = 2;
    sub_23C4563B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23C451324()
{
  unint64_t result;

  result = qword_256B9FA60;
  if (!qword_256B9FA60)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459B68, &type metadata for DynamicPredicateLogicalDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FA60);
  }
  return result;
}

unint64_t sub_23C451368()
{
  unint64_t result;

  result = qword_256B9FA68;
  if (!qword_256B9FA68)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateDescriptor, &type metadata for DynamicPredicateDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FA68);
  }
  return result;
}

unint64_t sub_23C4513AC()
{
  unint64_t result;

  result = qword_256B9FA70;
  if (!qword_256B9FA70)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateLogicalOperator, &type metadata for DynamicPredicateLogicalOperator);
    atomic_store(result, (unint64_t *)&qword_256B9FA70);
  }
  return result;
}

uint64_t DynamicPredicateLogicalDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];
  uint64_t v13;
  char v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FA78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C451324();
  sub_23C456464();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v14 = 0;
  sub_23C451634();
  sub_23C456344();
  v14 = 1;
  v13 = v15;
  v9 = v15 & 0x3FFFFFFFFFFFFFFFLL;
  sub_23C451678();
  swift_retain();
  sub_23C456344();
  v12[1] = v9;
  LOBYTE(v9) = v15;
  v14 = 2;
  sub_23C456344();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = v15;
  *(_QWORD *)a2 = v13;
  *(_BYTE *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = v11;
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_release();
  return swift_release();
}

unint64_t sub_23C451634()
{
  unint64_t result;

  result = qword_256B9FA80;
  if (!qword_256B9FA80)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateDescriptor, &type metadata for DynamicPredicateDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FA80);
  }
  return result;
}

unint64_t sub_23C451678()
{
  unint64_t result;

  result = qword_256B9FA88;
  if (!qword_256B9FA88)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateLogicalOperator, &type metadata for DynamicPredicateLogicalOperator);
    atomic_store(result, (unint64_t *)&qword_256B9FA88);
  }
  return result;
}

uint64_t sub_23C4516BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateLogicalDescriptor.init(from:)(a1, a2);
}

uint64_t sub_23C4516D0(_QWORD *a1)
{
  return DynamicPredicateLogicalDescriptor.encode(to:)(a1);
}

uint64_t DynamicPredicateLogicalDescriptor.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = v1[2];
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)(a1, v3);
  swift_release();
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)(a1, v4);
  return swift_release();
}

uint64_t DynamicPredicateLogicalDescriptor.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *v0;
  v2 = v0[2];
  sub_23C456428();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v1);
  swift_release();
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v2);
  swift_release();
  return sub_23C45644C();
}

uint64_t sub_23C451854()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v1 = *v0;
  v2 = v0[2];
  sub_23C456428();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v1);
  swift_release();
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v2);
  swift_release();
  return sub_23C45644C();
}

uint64_t _s16FitnessUtilities33DynamicPredicateLogicalDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  if ((static DynamicPredicateDescriptor.== infix(_:_:)(*(_QWORD *)a1, *(_QWORD *)a2) & 1) == 0)
    return 0;
  if (v2)
    v6 = 29295;
  else
    v6 = 6581857;
  if (v2)
    v7 = 0xE200000000000000;
  else
    v7 = 0xE300000000000000;
  if (v4)
    v8 = 29295;
  else
    v8 = 6581857;
  if (v4)
    v9 = 0xE200000000000000;
  else
    v9 = 0xE300000000000000;
  if (v6 == v8 && v7 == v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
      return 0;
  }
  return static DynamicPredicateDescriptor.== infix(_:_:)(v3, v5);
}

unint64_t sub_23C4519F4()
{
  unint64_t result;

  result = qword_256B9FA90;
  if (!qword_256B9FA90)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateLogicalDescriptor, &type metadata for DynamicPredicateLogicalDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FA90);
  }
  return result;
}

uint64_t destroy for DynamicPredicateLogicalDescriptor()
{
  swift_release();
  return swift_release();
}

uint64_t _s16FitnessUtilities33DynamicPredicateLogicalDescriptorVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateLogicalDescriptor(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for DynamicPredicateLogicalDescriptor(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateLogicalDescriptor(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateLogicalDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateLogicalDescriptor()
{
  return &type metadata for DynamicPredicateLogicalDescriptor;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateLogicalDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C451C64 + 4 * byte_23C4599A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23C451C98 + 4 * byte_23C4599A0[v4]))();
}

uint64_t sub_23C451C98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C451CA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C451CA8);
  return result;
}

uint64_t sub_23C451CB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C451CBCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23C451CC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C451CC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateLogicalDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateLogicalDescriptor.CodingKeys;
}

unint64_t sub_23C451CE8()
{
  unint64_t result;

  result = qword_256B9FA98;
  if (!qword_256B9FA98)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459B40, &type metadata for DynamicPredicateLogicalDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FA98);
  }
  return result;
}

unint64_t sub_23C451D30()
{
  unint64_t result;

  result = qword_256B9FAA0;
  if (!qword_256B9FAA0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459AB0, &type metadata for DynamicPredicateLogicalDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FAA0);
  }
  return result;
}

unint64_t sub_23C451D78()
{
  unint64_t result;

  result = qword_256B9FAA8;
  if (!qword_256B9FAA8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459AD8, &type metadata for DynamicPredicateLogicalDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FAA8);
  }
  return result;
}

uint64_t sub_23C451DBC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7563372 && a2 == 0xE300000000000000;
  if (v3 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4F6C616369676F6CLL && a2 == 0xEF726F7461726570 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7563378 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t AttributedString.isEmptyOrWhiteSpace.getter()
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
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  char *v18;
  char *v19;
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32[32];

  v0 = sub_23C455DEC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v29 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v28 = (char *)&v24 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FAB0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23C455DD4();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290];
  v10 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  sub_23C455DC8();
  v31 = v10;
  v16 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v25 = v15;
  v26 = v16;
  v16(v13, v15, v8);
  sub_23C452460(&qword_256B9FAB8, v9, MEMORY[0x24BDCC2A8]);
  sub_23C45602C();
  v17 = &v7[*(int *)(v5 + 36)];
  v30 = v1;
  v27 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  do
  {
    v18 = v28;
    v27(v28, v17, v0);
    sub_23C452460(&qword_256B9FAC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
    v19 = v29;
    sub_23C4561C4();
    sub_23C452460(&qword_256B9FAC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
    v20 = sub_23C455FB4();
    v21 = *(void (**)(char *, uint64_t))(v30 + 8);
    v21(v19, v0);
    v21(v18, v0);
    if ((v20 & 1) != 0)
      break;
    v22 = sub_23C456200();
    swift_bridgeObjectRetain();
    ((void (*)(char *, _QWORD))v22)(v32, 0);
    v26(v13, v7, v8);
    sub_23C4561D0();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v8);
    LOBYTE(v22) = sub_23C455F90();
    swift_bridgeObjectRelease();
  }
  while ((v22 & 1) != 0);
  sub_23C452424((uint64_t)v7, &qword_256B9FAB0);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v8);
  return v20 & 1;
}

uint64_t AttributedString.mergingAttributesWith(_:mergePolicy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v17;
  uint64_t v18;

  v4 = sub_23C455DE0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FAD0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23C455E04();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C4523DC(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23C452424((uint64_t)v10, &qword_256B9FAD0);
    v15 = sub_23C455DF8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCC388], v4);
    v17 = sub_23C455DF8();
    sub_23C452460(&qword_256B9FAD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC588]);
    sub_23C455E34();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a2, 0, 1, v17);
  }
}

uint64_t sub_23C4523DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FAD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C452424(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C452460(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24261F5D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

FitnessUtilities::DynamicPredicateLogicalOperator_optional __swiftcall DynamicPredicateLogicalOperator.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  FitnessUtilities::DynamicPredicateLogicalOperator_optional v2;

  v1 = sub_23C4562E4();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = FitnessUtilities_DynamicPredicateLogicalOperator_or;
  else
    v2.value = FitnessUtilities_DynamicPredicateLogicalOperator_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t DynamicPredicateLogicalOperator.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 29295;
  else
    return 6581857;
}

uint64_t sub_23C452514(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = DynamicPredicateLogicalOperator.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == DynamicPredicateLogicalOperator.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C4563D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C45259C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23C4562E4();
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

uint64_t sub_23C4525F8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = DynamicPredicateLogicalOperator.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23C452620()
{
  sub_23C4528D8();
  return sub_23C456098();
}

uint64_t sub_23C45267C()
{
  sub_23C4528D8();
  return sub_23C45605C();
}

unint64_t sub_23C4526CC()
{
  unint64_t result;

  result = qword_256B9FAE0;
  if (!qword_256B9FAE0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateLogicalOperator, &type metadata for DynamicPredicateLogicalOperator);
    atomic_store(result, (unint64_t *)&qword_256B9FAE0);
  }
  return result;
}

uint64_t sub_23C452710()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C456428();
  DynamicPredicateLogicalOperator.rawValue.getter(v1);
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

uint64_t sub_23C452770()
{
  char *v0;

  DynamicPredicateLogicalOperator.rawValue.getter(*v0);
  sub_23C455FF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C4527B0()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C456428();
  DynamicPredicateLogicalOperator.rawValue.getter(v1);
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateLogicalOperator(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C452858 + 4 * byte_23C459C05[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C45288C + 4 * byte_23C459C00[v4]))();
}

uint64_t sub_23C45288C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C452894(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C45289CLL);
  return result;
}

uint64_t sub_23C4528A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4528B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C4528B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4528BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateLogicalOperator()
{
  return &type metadata for DynamicPredicateLogicalOperator;
}

unint64_t sub_23C4528D8()
{
  unint64_t result;

  result = qword_256B9FAE8;
  if (!qword_256B9FAE8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateLogicalOperator, &type metadata for DynamicPredicateLogicalOperator);
    atomic_store(result, (unint64_t *)&qword_256B9FAE8);
  }
  return result;
}

uint64_t NSWrappedKey.wrapped.getter@<X0>(uint64_t a1@<X8>)
{
  char *v1;

  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1)
                                                                            + 0x50)
                                                                - 8)
                                                    + 16))(a1, &v1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x60)]);
}

id NSWrappedKey.__allocating_init(_:)(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  id v5;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = sub_23C452C74(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*((_QWORD *)v2 + 10) - 8) + 8))(a1);
  return v5;
}

id NSWrappedKey.init(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  id v4;

  v3 = *MEMORY[0x24BEE4EA0] & *v1;
  v4 = sub_23C452C74(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t sub_23C4529FC(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = NSWrappedKey.hash.getter();

  return v2;
}

uint64_t NSWrappedKey.hash.getter()
{
  return sub_23C455F84();
}

uint64_t NSWrappedKey.isEqual(_:)(uint64_t a1)
{
  char v2;
  void *v4;
  _BYTE v5[24];
  uint64_t v6;

  swift_getObjectType();
  sub_23C452CF0(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_23C452D38((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = sub_23C455FB4();

  return v2 & 1;
}

uint64_t sub_23C452B48(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    sub_23C45626C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = a1;
  }
  v6 = NSWrappedKey.isEqual(_:)((uint64_t)v8);

  sub_23C452D38((uint64_t)v8);
  return v6 & 1;
}

id NSWrappedKey.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void NSWrappedKey.init()()
{
  sub_23C452D78();
}

void sub_23C452BF8()
{
  sub_23C452D78();
}

id NSWrappedKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23C452C48(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

id sub_23C452C74(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x50)
                                                      - 8)
                                          + 16))(&v1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x60)], a1);
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_23C452CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256B9FAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C452D38(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_256B9FAF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23C452D78()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23C452DA4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for NSWrappedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NSWrappedKey);
}

uint64_t method lookup function for NSWrappedKey()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NSWrappedKey.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_23C452E38(char a1)
{
  return *(_QWORD *)&aBoolean_0[8 * a1];
}

uint64_t sub_23C452E58()
{
  sub_23C453D6C();
  return sub_23C45647C();
}

uint64_t sub_23C452E80()
{
  sub_23C453D6C();
  return sub_23C456488();
}

uint64_t sub_23C452EA8()
{
  char *v0;

  return sub_23C452E38(*v0);
}

uint64_t sub_23C452EB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23C454CD0(a1, a2);
  *a3 = result;
  return result;
}

void sub_23C452ED4(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23C452EE0()
{
  sub_23C453B90();
  return sub_23C45647C();
}

uint64_t sub_23C452F08()
{
  sub_23C453B90();
  return sub_23C456488();
}

uint64_t sub_23C452F30()
{
  sub_23C453CE4();
  return sub_23C45647C();
}

uint64_t sub_23C452F58()
{
  sub_23C453CE4();
  return sub_23C456488();
}

uint64_t sub_23C452F80()
{
  sub_23C453C5C();
  return sub_23C45647C();
}

uint64_t sub_23C452FA8()
{
  sub_23C453C5C();
  return sub_23C456488();
}

uint64_t sub_23C452FD0()
{
  sub_23C453BD4();
  return sub_23C45647C();
}

uint64_t sub_23C452FF8()
{
  sub_23C453BD4();
  return sub_23C456488();
}

void DynamicPredicateDescriptor.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[18];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FB78);
  v11[7] = *(_QWORD *)(v4 - 8);
  v11[8] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v11[6] = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FB80);
  v11[4] = *(_QWORD *)(v6 - 8);
  v11[5] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v11[3] = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FB88);
  v11[1] = *(_QWORD *)(v8 - 8);
  v11[2] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FB90);
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FB98);
  v11[9] = *(_QWORD *)(v10 - 8);
  v11[10] = v10;
  MEMORY[0x24BDAC7A8](v10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23C453B90();
  sub_23C456470();
  __asm { BR              X10 }
}

uint64_t sub_23C4531D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v6 = *(_BYTE *)(v3 + 16);
  *(_BYTE *)(v5 - 136) = 0;
  sub_23C453D6C();
  v7 = *(_QWORD *)(v5 - 144);
  sub_23C456368();
  *(_BYTE *)(v5 - 136) = v6;
  sub_23C453DB0();
  sub_23C4563B0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 152) + 8))(v1, v7);
}

uint64_t DynamicPredicateDescriptor.init(from:)(_QWORD *a1)
{
  return sub_23C453DF4(a1);
}

uint64_t sub_23C4534D8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23C453DF4(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_23C453500(_QWORD *a1)
{
  uint64_t *v1;

  DynamicPredicateDescriptor.encode(to:)(a1, *v1);
}

void DynamicPredicateDescriptor.hash(into:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23C453558()
{
  sub_23C456434();
  return sub_23C456440();
}

uint64_t sub_23C453858()
{
  sub_23C456434();
  sub_23C455FF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C4538E0()
{
  sub_23C456434();
  return sub_23C455FF0();
}

uint64_t DynamicPredicateDescriptor.hashValue.getter(uint64_t a1)
{
  _BYTE v3[72];

  sub_23C456428();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v3, a1);
  return sub_23C45644C();
}

uint64_t sub_23C45395C()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23C456428();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v3, v1);
  return sub_23C45644C();
}

void sub_23C4539A0(uint64_t a1)
{
  uint64_t *v1;

  DynamicPredicateDescriptor.hash(into:)(a1, *v1);
}

uint64_t sub_23C4539A8()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23C456428();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v3, v1);
  return sub_23C45644C();
}

void sub_23C4539E8(uint64_t *a1)
{
  _s16FitnessUtilities26DynamicPredicateDescriptorO2eeoiySbAC_ACtFZ_0(*a1);
}

void _s16FitnessUtilities26DynamicPredicateDescriptorO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23C453A24(uint64_t a1, unint64_t a2)
{
  char v2;

  if (a2 >> 62)
    v2 = 0;
  else
    v2 = *(_BYTE *)(a1 + 16) ^ *(_BYTE *)(a2 + 16) ^ 1;
  return v2 & 1;
}

unint64_t sub_23C453B90()
{
  unint64_t result;

  result = qword_256B9FBA0;
  if (!qword_256B9FBA0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A3BC, &type metadata for DynamicPredicateDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FBA0);
  }
  return result;
}

unint64_t sub_23C453BD4()
{
  unint64_t result;

  result = qword_256B9FBA8;
  if (!qword_256B9FBA8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A36C, &type metadata for DynamicPredicateDescriptor.LogicalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FBA8);
  }
  return result;
}

unint64_t sub_23C453C18()
{
  unint64_t result;

  result = qword_256B9FBB0;
  if (!qword_256B9FBB0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateLogicalDescriptor, &type metadata for DynamicPredicateLogicalDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FBB0);
  }
  return result;
}

unint64_t sub_23C453C5C()
{
  unint64_t result;

  result = qword_256B9FBB8;
  if (!qword_256B9FBB8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A31C, &type metadata for DynamicPredicateDescriptor.EqualityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FBB8);
  }
  return result;
}

unint64_t sub_23C453CA0()
{
  unint64_t result;

  result = qword_256B9FBC0;
  if (!qword_256B9FBC0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEqualityDescriptor, &type metadata for DynamicPredicateEqualityDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FBC0);
  }
  return result;
}

unint64_t sub_23C453CE4()
{
  unint64_t result;

  result = qword_256B9FBC8;
  if (!qword_256B9FBC8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A2CC, &type metadata for DynamicPredicateDescriptor.ComparisonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FBC8);
  }
  return result;
}

unint64_t sub_23C453D28()
{
  unint64_t result;

  result = qword_256B9FBD0;
  if (!qword_256B9FBD0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparisonDescriptor, &type metadata for DynamicPredicateComparisonDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FBD0);
  }
  return result;
}

unint64_t sub_23C453D6C()
{
  unint64_t result;

  result = qword_256B9FBD8;
  if (!qword_256B9FBD8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A27C, &type metadata for DynamicPredicateDescriptor.BooleanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FBD8);
  }
  return result;
}

unint64_t sub_23C453DB0()
{
  unint64_t result;

  result = qword_256B9FBE0;
  if (!qword_256B9FBE0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateBooleanValue, &type metadata for DynamicPredicateBooleanValue);
    atomic_store(result, (unint64_t *)&qword_256B9FBE0);
  }
  return result;
}

uint64_t sub_23C453DF4(_QWORD *a1)
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
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;

  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FC68);
  v23 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v27 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FC70);
  v24 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FC78);
  v21 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v25 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FC80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FC88);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v28 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_23C453B90();
  v12 = v29;
  sub_23C456464();
  if (!v12)
  {
    v18[1] = v6;
    v18[2] = v5;
    v29 = v8;
    v13 = sub_23C456350();
    v14 = v7;
    if (*(_QWORD *)(v13 + 16) == 1)
      __asm { BR              X10 }
    v7 = sub_23C4562A8();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256B9F098);
    *v16 = &type metadata for DynamicPredicateDescriptor;
    sub_23C4562FC();
    sub_23C45629C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v7);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v7;
}

unint64_t sub_23C454510()
{
  unint64_t result;

  result = qword_256B9FBE8;
  if (!qword_256B9FBE8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateDescriptor, &type metadata for DynamicPredicateDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FBE8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for DynamicPredicateDescriptor(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for DynamicPredicateDescriptor()
{
  return swift_release();
}

_QWORD *assignWithCopy for DynamicPredicateDescriptor(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for DynamicPredicateDescriptor(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateDescriptor(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7D && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 125);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7C)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7C)
  {
    *(_QWORD *)result = a2 - 125;
    if (a3 >= 0x7D)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7D)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_23C4546BC(_QWORD *a1)
{
  return *a1 >> 62;
}

_QWORD *sub_23C4546C8(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_23C4546D8(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor()
{
  return &type metadata for DynamicPredicateDescriptor;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C454748 + 4 * byte_23C459D73[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C45477C + 4 * byte_23C459D6E[v4]))();
}

uint64_t sub_23C45477C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C454784(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C45478CLL);
  return result;
}

uint64_t sub_23C454798(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C4547A0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C4547A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C4547AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.BooleanCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.BooleanCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.ComparisonCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.ComparisonCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.EqualityCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.EqualityCodingKeys;
}

uint64_t _s16FitnessUtilities26DynamicPredicateDescriptorO17BooleanCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23C45483C + 4 * byte_23C459D78[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23C45485C + 4 * byte_23C459D7D[v4]))();
}

_BYTE *sub_23C45483C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23C45485C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C454864(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C45486C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23C454874(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23C45487C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.LogicalCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.LogicalCodingKeys;
}

unint64_t sub_23C45489C()
{
  unint64_t result;

  result = qword_256B9FBF0;
  if (!qword_256B9FBF0)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459F74, &type metadata for DynamicPredicateDescriptor.LogicalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FBF0);
  }
  return result;
}

unint64_t sub_23C4548E4()
{
  unint64_t result;

  result = qword_256B9FBF8;
  if (!qword_256B9FBF8)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A02C, &type metadata for DynamicPredicateDescriptor.EqualityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FBF8);
  }
  return result;
}

unint64_t sub_23C45492C()
{
  unint64_t result;

  result = qword_256B9FC00;
  if (!qword_256B9FC00)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A0E4, &type metadata for DynamicPredicateDescriptor.ComparisonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC00);
  }
  return result;
}

unint64_t sub_23C454974()
{
  unint64_t result;

  result = qword_256B9FC08;
  if (!qword_256B9FC08)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A19C, &type metadata for DynamicPredicateDescriptor.BooleanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC08);
  }
  return result;
}

unint64_t sub_23C4549BC()
{
  unint64_t result;

  result = qword_256B9FC10;
  if (!qword_256B9FC10)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A254, &type metadata for DynamicPredicateDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC10);
  }
  return result;
}

unint64_t sub_23C454A04()
{
  unint64_t result;

  result = qword_256B9FC18;
  if (!qword_256B9FC18)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A10C, &type metadata for DynamicPredicateDescriptor.BooleanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC18);
  }
  return result;
}

unint64_t sub_23C454A4C()
{
  unint64_t result;

  result = qword_256B9FC20;
  if (!qword_256B9FC20)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A134, &type metadata for DynamicPredicateDescriptor.BooleanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC20);
  }
  return result;
}

unint64_t sub_23C454A94()
{
  unint64_t result;

  result = qword_256B9FC28;
  if (!qword_256B9FC28)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A054, &type metadata for DynamicPredicateDescriptor.ComparisonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC28);
  }
  return result;
}

unint64_t sub_23C454ADC()
{
  unint64_t result;

  result = qword_256B9FC30;
  if (!qword_256B9FC30)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A07C, &type metadata for DynamicPredicateDescriptor.ComparisonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC30);
  }
  return result;
}

unint64_t sub_23C454B24()
{
  unint64_t result;

  result = qword_256B9FC38;
  if (!qword_256B9FC38)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459F9C, &type metadata for DynamicPredicateDescriptor.EqualityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC38);
  }
  return result;
}

unint64_t sub_23C454B6C()
{
  unint64_t result;

  result = qword_256B9FC40;
  if (!qword_256B9FC40)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459FC4, &type metadata for DynamicPredicateDescriptor.EqualityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC40);
  }
  return result;
}

unint64_t sub_23C454BB4()
{
  unint64_t result;

  result = qword_256B9FC48;
  if (!qword_256B9FC48)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459EE4, &type metadata for DynamicPredicateDescriptor.LogicalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC48);
  }
  return result;
}

unint64_t sub_23C454BFC()
{
  unint64_t result;

  result = qword_256B9FC50;
  if (!qword_256B9FC50)
  {
    result = MEMORY[0x24261F5D0](&unk_23C459F0C, &type metadata for DynamicPredicateDescriptor.LogicalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC50);
  }
  return result;
}

unint64_t sub_23C454C44()
{
  unint64_t result;

  result = qword_256B9FC58;
  if (!qword_256B9FC58)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A1C4, &type metadata for DynamicPredicateDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC58);
  }
  return result;
}

unint64_t sub_23C454C8C()
{
  unint64_t result;

  result = qword_256B9FC60;
  if (!qword_256B9FC60)
  {
    result = MEMORY[0x24261F5D0](&unk_23C45A1EC, &type metadata for DynamicPredicateDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256B9FC60);
  }
  return result;
}

uint64_t sub_23C454CD0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E61656C6F6F62 && a2 == 0xE700000000000000;
  if (v3 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73697261706D6F63 && a2 == 0xEA00000000006E6FLL || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7974696C61757165 && a2 == 0xE800000000000000 || (sub_23C4563D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C616369676F6CLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23C4563D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23C454E78()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_23C454EAC()
{
  unint64_t result;

  result = qword_256B9FC90;
  if (!qword_256B9FC90)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateLogicalDescriptor, &type metadata for DynamicPredicateLogicalDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FC90);
  }
  return result;
}

uint64_t sub_23C454EF0()
{
  uint64_t v0;

  sub_23C440984(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  sub_23C440984(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject();
}

unint64_t sub_23C454F24()
{
  unint64_t result;

  result = qword_256B9FC98;
  if (!qword_256B9FC98)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateEqualityDescriptor, &type metadata for DynamicPredicateEqualityDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FC98);
  }
  return result;
}

uint64_t sub_23C454F68()
{
  uint64_t v0;

  sub_23C43B720(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
  sub_23C43B720(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  return swift_deallocObject();
}

unint64_t sub_23C454F9C()
{
  unint64_t result;

  result = qword_256B9FCA0;
  if (!qword_256B9FCA0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateComparisonDescriptor, &type metadata for DynamicPredicateComparisonDescriptor);
    atomic_store(result, (unint64_t *)&qword_256B9FCA0);
  }
  return result;
}

uint64_t sub_23C454FE0()
{
  return swift_deallocObject();
}

unint64_t sub_23C454FF0()
{
  unint64_t result;

  result = qword_256B9FCA8;
  if (!qword_256B9FCA8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicateBooleanValue, &type metadata for DynamicPredicateBooleanValue);
    atomic_store(result, (unint64_t *)&qword_256B9FCA8);
  }
  return result;
}

uint64_t DynamicPredicatePlatform.rawValue.getter(char a1)
{
  return *(_QWORD *)&aPhone_2[8 * a1];
}

uint64_t sub_23C45505C(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = DynamicPredicatePlatform.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == DynamicPredicatePlatform.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23C4563D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23C4550E4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16FitnessUtilities24DynamicPredicatePlatformO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23C455110@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = DynamicPredicatePlatform.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void *static DynamicPredicatePlatform.allCases.getter()
{
  return &unk_250D33410;
}

void sub_23C455144(_QWORD *a1@<X8>)
{
  *a1 = &unk_250D33438;
}

uint64_t sub_23C455154()
{
  sub_23C4554A4();
  return sub_23C456098();
}

uint64_t sub_23C4551B0()
{
  sub_23C4554A4();
  return sub_23C45605C();
}

uint64_t sub_23C4551FC()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C456428();
  DynamicPredicatePlatform.rawValue.getter(v1);
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

uint64_t sub_23C45525C()
{
  char *v0;

  DynamicPredicatePlatform.rawValue.getter(*v0);
  sub_23C455FF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C45529C()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23C456428();
  DynamicPredicatePlatform.rawValue.getter(v1);
  sub_23C455FF0();
  swift_bridgeObjectRelease();
  return sub_23C45644C();
}

uint64_t _s16FitnessUtilities24DynamicPredicatePlatformO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C4562E4();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_23C455344()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256B9FCB0;
  if (!qword_256B9FCB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256B9FCB8);
    result = MEMORY[0x24261F5D0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256B9FCB0);
  }
  return result;
}

unint64_t sub_23C455394()
{
  unint64_t result;

  result = qword_256B9FCC0;
  if (!qword_256B9FCC0)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicatePlatform, &type metadata for DynamicPredicatePlatform);
    atomic_store(result, (unint64_t *)&qword_256B9FCC0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicatePlatform(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C455424 + 4 * byte_23C45A455[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C455458 + 4 * byte_23C45A450[v4]))();
}

uint64_t sub_23C455458(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C455460(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C455468);
  return result;
}

uint64_t sub_23C455474(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C45547CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C455480(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C455488(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicatePlatform()
{
  return &type metadata for DynamicPredicatePlatform;
}

unint64_t sub_23C4554A4()
{
  unint64_t result;

  result = qword_256B9FCC8;
  if (!qword_256B9FCC8)
  {
    result = MEMORY[0x24261F5D0](&protocol conformance descriptor for DynamicPredicatePlatform, &type metadata for DynamicPredicatePlatform);
    atomic_store(result, (unint64_t *)&qword_256B9FCC8);
  }
  return result;
}

Swift::Double __swiftcall Double.milliseconds()()
{
  double v0;

  return v0 * 1000.0;
}

double static Double.minutes(_:)(double a1)
{
  return a1 * 60.0;
}

double static Double.hours(_:)(double a1)
{
  return a1 * 3600.0;
}

double static Double.days(_:)(unint64_t a1)
{
  return (double)a1 * 86400.0;
}

double static Double.years(_:)(unint64_t a1)
{
  return (double)a1 * 31536000.0;
}

BOOL Optional<A>.isEmptyOrWhiteSpace.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v4 = sub_23C455DBC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    return 1;
  v13[0] = a1;
  v13[1] = a2;
  swift_bridgeObjectRetain();
  sub_23C455DB0();
  sub_23C44F394();
  v8 = sub_23C456260();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  return v11 == 0;
}

BOOL StringProtocol.isEmptyOrWhiteSpace.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_23C455DBC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C455DB0();
  v4 = sub_23C456260();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0)
    v7 = v4 & 0xFFFFFFFFFFFFLL;
  return v7 == 0;
}

uint64_t String.init(_:)(uint64_t a1)
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
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FCD0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23C455DD4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C455DC8();
  sub_23C455808((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v9 = sub_23C455FD8();
  v10 = sub_23C455DF8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  return v9;
}

uint64_t sub_23C455808@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  char v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  char *v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FCD8);
  v3 = MEMORY[0x24BDAC7A8](v46);
  v44 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v41 - v5;
  v7 = sub_23C455DEC();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0];
  v50 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v41 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v47 = (char *)v41 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v41 - v17;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FCE0);
  v19 = MEMORY[0x24BDAC7A8](v45);
  v43 = (char *)v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v42 = (uint64_t)v41 - v21;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FCE8);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23C455DD4();
  v26 = sub_23C452460(&qword_256B9FAC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
  v51 = v1;
  v48 = v26;
  v49 = v25;
  sub_23C4561B8();
  sub_23C452460(&qword_256B9FAC8, v8, MEMORY[0x24BDCC508]);
  result = sub_23C455FB4();
  if ((result & 1) != 0)
  {
    v41[1] = a1;
    v28 = v50;
    v29 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
    v29(v18, v24, v7);
    v30 = v47;
    sub_23C4561C4();
    v41[0] = v18;
    v29(v14, v18, v7);
    v29(v11, v30, v7);
    sub_23C452424((uint64_t)v24, &qword_256B9FCE8);
    sub_23C452460((unint64_t *)&unk_256B9FCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
    v31 = sub_23C455FA8();
    v32 = *(void (**)(char *, uint64_t))(v28 + 8);
    v32(v11, v7);
    result = ((uint64_t (*)(char *, uint64_t))v32)(v14, v7);
    if ((v31 & 1) != 0)
    {
      v33 = (uint64_t)v43;
      v34 = v44;
      v35 = v46;
      v36 = &v6[*(int *)(v46 + 48)];
      v37 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
      v37(v6, (char *)v41[0], v7);
      v37(v36, v47, v7);
      v38 = &v34[*(int *)(v35 + 48)];
      v29(v34, v6, v7);
      v29(v38, v36, v7);
      v37((char *)v33, v34, v7);
      v32(v38, v7);
      v39 = &v34[*(int *)(v35 + 48)];
      v37(v34, v6, v7);
      v37(v39, v36, v7);
      v37((char *)(v33 + *(int *)(v45 + 36)), v39, v7);
      v32(v34, v7);
      v40 = v42;
      sub_23C455C10(v33, v42);
      sub_23C4561F4();
      return sub_23C452424(v40, &qword_256B9FCE0);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23C455C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256B9FCE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t Text.init(localizing:bundle:locale:comment:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v21 = a6;
  v22 = a4;
  v23 = a5;
  v20 = a1;
  v9 = sub_23C455E94();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23C455FC0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  v17 = sub_23C44D640((uint64_t)v16, 0, 0, a2, (uint64_t)v12, v22, v23, v21 & 0x1FF);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a3, v9);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v20, v13);
  return v17;
}

uint64_t sub_23C455DB0()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_23C455DBC()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23C455DC8()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_23C455DD4()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_23C455DE0()
{
  return MEMORY[0x24BDCC390]();
}

uint64_t sub_23C455DEC()
{
  return MEMORY[0x24BDCC4F0]();
}

uint64_t sub_23C455DF8()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23C455E04()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_23C455E10()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_23C455E1C()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_23C455E28()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_23C455E34()
{
  return MEMORY[0x24BDCD3D0]();
}

uint64_t sub_23C455E40()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23C455E4C()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23C455E58()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23C455E64()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23C455E70()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C455E7C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23C455E88()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23C455E94()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23C455EA0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C455EAC()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23C455EB8()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23C455EC4()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23C455ED0()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_23C455EDC()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23C455EE8()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23C455EF4()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23C455F00()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23C455F0C()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_23C455F18()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_23C455F24()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23C455F30()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_23C455F3C()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23C455F48()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23C455F54()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23C455F60()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_23C455F6C()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_23C455F78()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23C455F84()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_23C455F90()
{
  return MEMORY[0x24BEE06A0]();
}

uint64_t sub_23C455F9C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23C455FA8()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23C455FB4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23C455FC0()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23C455FCC()
{
  return MEMORY[0x24BDCFB28]();
}

uint64_t sub_23C455FD8()
{
  return MEMORY[0x24BDCFB38]();
}

uint64_t sub_23C455FE4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23C455FF0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C455FFC()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_23C456008()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23C456014()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23C456020()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23C45602C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23C456038()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_23C456044()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23C456050()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_23C45605C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23C456068()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23C456074()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_23C456080()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_23C45608C()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_23C456098()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23C4560A4()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23C4560B0()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_23C4560BC()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_23C4560C8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23C4560D4()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_23C4560E0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23C4560EC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C4560F8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23C456104()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23C456110()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_23C45611C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23C456128()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23C456134()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_23C456140()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_23C45614C()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_23C456158()
{
  return MEMORY[0x24BEE6A28]();
}

uint64_t sub_23C456164()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_23C456170()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_23C45617C()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_23C456188()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_23C456194()
{
  return MEMORY[0x24BEE6C20]();
}

uint64_t sub_23C4561A0()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_23C4561AC()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_23C4561B8()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23C4561C4()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23C4561D0()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23C4561DC()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_23C4561E8()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23C4561F4()
{
  return MEMORY[0x24BEE1A20]();
}

uint64_t sub_23C456200()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23C45620C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23C456218()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23C456224()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_23C456230()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23C45623C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23C456248()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23C456254()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_23C456260()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23C45626C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23C456278()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23C456284()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_23C456290()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23C45629C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23C4562A8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23C4562B4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23C4562C0()
{
  return MEMORY[0x24BEE6EF0]();
}

uint64_t sub_23C4562CC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C4562D8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C4562E4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C4562F0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23C4562FC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23C456308()
{
  return MEMORY[0x24BEE32C8]();
}

uint64_t sub_23C456314()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23C456320()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23C45632C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23C456338()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_23C456344()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23C456350()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23C45635C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23C456368()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23C456374()
{
  return MEMORY[0x24BEE3418]();
}

uint64_t sub_23C456380()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23C45638C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23C456398()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23C4563A4()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_23C4563B0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23C4563BC()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23C4563C8()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23C4563D4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C4563E0()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_23C4563EC()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23C4563F8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23C456404()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23C456410()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23C45641C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23C456428()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C456434()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C456440()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23C45644C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23C456458()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_23C456464()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23C456470()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23C45647C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23C456488()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23C456494()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x24BEE4C20]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

