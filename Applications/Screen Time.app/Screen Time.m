int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;

  v3 = static CommandLine.argc.getter(*(_QWORD *)&argc, argv, envp);
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v3, v4, 0, 0);
  return 0;
}

uint64_t sub_100003E04()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC11Screen_TimeP33_698BD6B815B3C77214A56D6EF3665FE419ResourceBundleClass);
}
