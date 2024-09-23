uint64_t sub_100003538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[8];
  _QWORD v16[9];
  char v17;

  sub_1000038F4(&qword_100008058);
  __chkstk_darwin();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[3] = type metadata accessor for Subsystems(0);
  v16[4] = &protocol witness table for Subsystems;
  v16[0] = a2;
  swift_retain(a2);
  swift_retain(a1);
  v8 = ViewfinderViewController.init(provider:session:)(v15, v16, a1);
  v9 = static SafeAreaRegions.all.getter(v8);
  LOBYTE(a1) = static Edge.Set.all.getter();
  sub_100003AAC((uint64_t)v15, (uint64_t)v16);
  v16[8] = v9;
  v17 = a1;
  sub_100003AE8((uint64_t)v15);
  v10 = enum case for ColorScheme.dark(_:);
  v11 = type metadata accessor for ColorScheme(0);
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 104))(v7, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  v13 = sub_1000038F4(&qword_100008020);
  sub_100003B1C((uint64_t)v7, a3 + *(int *)(v13 + 36), &qword_100008058);
  sub_100003B1C((uint64_t)v16, a3, &qword_100008038);
  sub_100003B60((uint64_t)v7, &qword_100008058);
  return sub_100003B60((uint64_t)v16, &qword_100008038);
}

uint64_t sub_1000036AC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *v0;
  swift_retain(v1);
  v2 = sub_1000038F4(&qword_100008020);
  v3 = sub_100003934();
  return SecureCaptureUIScene.init(content:)(sub_1000038EC, v1, v2, v3);
}

uint64_t sub_10000370C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000038A8();
  return SecureCaptureExtension.configuration.getter(a1, v2);
}

id sub_100003744@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  id result;

  v2 = type metadata accessor for Subsystems(0);
  swift_allocObject(v2, 24, 7);
  v3 = Subsystems.init()();
  result = objc_msgSend((id)objc_opt_self(CAMCaptureEngine), "preheatCaptureResources");
  *a1 = v3;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  sub_1000037F4();
  static AppExtension<>.main()();
  return 0;
}

unint64_t sub_1000037F4()
{
  unint64_t result;

  result = qword_100008008;
  if (!qword_100008008)
  {
    result = swift_getWitnessTable(&unk_100003D54, &type metadata for LockScreenCamera);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

ValueMetadata *type metadata accessor for LockScreenCamera()
{
  return &type metadata for LockScreenCamera;
}

uint64_t sub_10000384C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003DC0, 1);
}

unint64_t sub_100003860()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008010;
  if (!qword_100008010)
  {
    v1 = type metadata accessor for AppExtensionSceneConfiguration(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppExtensionSceneConfiguration, v1);
    atomic_store(result, (unint64_t *)&qword_100008010);
  }
  return result;
}

unint64_t sub_1000038A8()
{
  unint64_t result;

  result = qword_100008018;
  if (!qword_100008018)
  {
    result = swift_getWitnessTable(&unk_100003D14, &type metadata for LockScreenCamera);
    atomic_store(result, (unint64_t *)&qword_100008018);
  }
  return result;
}

uint64_t sub_1000038EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100003538(a1, v2, a2);
}

uint64_t sub_1000038F4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003934()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008028;
  if (!qword_100008028)
  {
    v1 = sub_1000039B8(&qword_100008020);
    sub_1000039FC();
    sub_100003BC8(&qword_100008048, &qword_100008050, (uint64_t)&protocol conformance descriptor for _PreferenceWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

uint64_t sub_1000039B8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000039FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008030;
  if (!qword_100008030)
  {
    v1 = sub_1000039B8(&qword_100008038);
    sub_100003A68();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100008030);
  }
  return result;
}

unint64_t sub_100003A68()
{
  unint64_t result;

  result = qword_100008040;
  if (!qword_100008040)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ViewfinderViewController, &type metadata for ViewfinderViewController);
    atomic_store(result, (unint64_t *)&qword_100008040);
  }
  return result;
}

uint64_t sub_100003AAC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for ViewfinderViewController - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100003AE8(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for ViewfinderViewController - 1) + 8))();
  return a1;
}

uint64_t sub_100003B1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000038F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100003B60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000038F4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100003B9C()
{
  return sub_100003BC8(&qword_100008060, &qword_100008068, (uint64_t)&protocol conformance descriptor for SecureCaptureUIScene<A>);
}

uint64_t sub_100003BC8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000039B8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}
