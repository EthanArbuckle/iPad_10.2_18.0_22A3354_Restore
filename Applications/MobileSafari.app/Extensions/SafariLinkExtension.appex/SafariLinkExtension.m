uint64_t sub_100003C80(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003D9C();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003D14();
  static AppExtension.main()();
  return 0;
}

unint64_t sub_100003D14()
{
  unint64_t result;

  result = qword_100008000;
  if (!qword_100008000)
  {
    result = swift_getWitnessTable(&unk_100003EA8, &type metadata for SafariLinkExtension);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

uint64_t sub_100003D5C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100003D9C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>, 1);
}

unint64_t sub_100003D9C()
{
  unint64_t result;

  result = qword_100008008;
  if (!qword_100008008)
  {
    result = swift_getWitnessTable(&unk_100003E80, &type metadata for SafariLinkExtension);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafariLinkExtension()
{
  return &type metadata for SafariLinkExtension;
}
