@implementation __AISRepairController

- (__AISRepairController)initWithQueue:(id)a3
{
  return (__AISRepairController *)__RepairController.init(queue:)(a3);
}

- (void)repairWithContext:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  __AISRepairController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_236530CAC;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_23652DA44(v8, (uint64_t)v6, v7);
  sub_236450690((uint64_t)v6);

}

- (void)generateSymptomReportWithContext:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  __AISRepairController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_23653180C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_23652EBD4(v8, (uint64_t)v6, v7);
  sub_236450690((uint64_t)v6);

}

- (__AISRepairController)init
{
  __AISRepairController *result;

  result = (__AISRepairController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
