@implementation NSObject

- (void)ppt_startIterationWithBlock:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  id (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  id (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10002EC48;
  v26 = sub_10002EC70;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10002EC48;
  v20 = sub_10002EC70;
  v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100042154;
  v12[3] = &unk_10006D430;
  v14 = &v22;
  v15 = &v16;
  v6 = a4;
  v13 = v6;
  v7 = objc_retainBlock(v12);
  v8 = objc_msgSend(v5, "copy");
  v9 = (void *)v23[5];
  v23[5] = (uint64_t)v8;

  v10 = objc_msgSend(v7, "copy");
  v11 = (void *)v17[5];
  v17[5] = (uint64_t)v10;

  (*(void (**)(void))(v23[5] + 16))();
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

@end
