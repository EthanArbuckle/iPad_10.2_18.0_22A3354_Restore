@implementation AddDataViewControllerProvider

- (id)addDataViewControllerForDisplayType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;

  v5 = sub_1A9A92014();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)self->healthStore;
  v10 = (void *)objc_opt_self();
  v11 = a3;
  swift_retain();
  v12 = objc_msgSend(v10, sel_sharedInstanceForHealthStore_, v9);
  sub_1A9A92008();
  v13 = (void *)sub_1A9A91FC0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = objc_msgSend(v11, sel_wd_addDataViewControllerWithHealthStore_healthToolBox_initialStartDate_, v9, v12, v13);

  swift_release();
  return v14;
}

@end
