ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_1000038B4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003D7C, 1);
}

uint64_t sub_1000038CC()
{
  return static View._viewListCount(inputs:)();
}

void *sub_1000038E8()
{
  return &protocol witness table for EmptyView;
}

uint64_t sub_1000038F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100003A58(&qword_100008098);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100003A98();
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, nullsub_1, 0, &type metadata for ContentView, v4);
  v5 = sub_100003ADC();
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_1000039F4();
  static App.main()();
  return 0;
}

unint64_t sub_1000039F4()
{
  unint64_t result;

  result = qword_100008090;
  if (!qword_100008090)
  {
    result = swift_getWitnessTable(&unk_100003CEC, &type metadata for BatteriesApp);
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteriesApp()
{
  return &type metadata for BatteriesApp;
}

uint64_t sub_100003A48(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003DC0, 1);
}

uint64_t sub_100003A58(uint64_t *a1)
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

unint64_t sub_100003A98()
{
  unint64_t result;

  result = qword_1000080A0;
  if (!qword_1000080A0)
  {
    result = swift_getWitnessTable(&unk_100003C80, &type metadata for ContentView);
    atomic_store(result, (unint64_t *)&qword_1000080A0);
  }
  return result;
}

unint64_t sub_100003ADC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000080A8;
  if (!qword_1000080A8)
  {
    v1 = sub_100003B28(&qword_100008098);
    result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000080A8);
  }
  return result;
}

uint64_t sub_100003B28(uint64_t *a1)
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

uint64_t sub_100003B70()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC9BatteriesP33_8093447EC8C7614491AE39DF11E4A7B119ResourceBundleClass);
}
