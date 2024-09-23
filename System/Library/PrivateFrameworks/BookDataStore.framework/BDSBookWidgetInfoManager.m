@implementation BDSBookWidgetInfoManager

- (BDSBookWidgetInfoManager)init
{
  BDSBookWidgetInfoManager *v2;
  BDSServiceProxy *v3;
  BDSServiceProxy *serviceProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BDSBookWidgetInfoManager;
  v2 = -[BDSBookWidgetInfoManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

  }
  return v2;
}

- (void)setBookWidgetInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBookWidgetInfo_completion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

- (void)fetchAdamIDs:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSArray *v16;
  BDSBookWidgetInfoManager *v17;
  uint64_t v18;

  v7 = sub_227D68330(&qword_255929530);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_227E60128();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_255928A60;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255928A68;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_227E54F9C((uint64_t)v10, (uint64_t)&unk_255928A70, (uint64_t)v15);
  swift_release();
}

- (void)fetchBookAssets:(NSArray *)a3 audiobookAssets:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSArray *v18;
  NSArray *v19;
  BDSBookWidgetInfoManager *v20;
  uint64_t v21;

  v9 = sub_227D68330(&qword_255929530);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  v15 = sub_227E60128();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2559289D8;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2559289E0;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_227E54F9C((uint64_t)v12, (uint64_t)&unk_2559289E8, (uint64_t)v17);
  swift_release();
}

@end
