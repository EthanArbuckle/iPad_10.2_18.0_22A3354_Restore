@implementation ExportedObject

- (void)setWithManagedAppViewData:(id)a3 reply:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v5 = _Block_copy(a4);
  v6 = a3;
  swift_retain();
  v7 = sub_2355C8418();
  v9 = v8;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v5;
  ExportedObject.set(managedAppViewData:reply:)(v7, v9, (uint64_t)sub_235590A8C, v10);
  swift_release();
  sub_23558E374(v7, v9);
  swift_release();
}

@end
