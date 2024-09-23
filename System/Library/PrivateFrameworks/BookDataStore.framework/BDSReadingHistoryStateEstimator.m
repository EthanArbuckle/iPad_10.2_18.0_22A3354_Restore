@implementation BDSReadingHistoryStateEstimator

- (BDSReadingHistoryStateEstimator)init
{
  return (BDSReadingHistoryStateEstimator *)ReadingHistoryStateEstimator.init()();
}

- (id)estimateCurrentStateInfoWithExistingStateInfo:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  BDSReadingHistoryStateEstimator *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  void *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;

  v5 = sub_227D68330(&qword_253F391A8);
  v7 = MEMORY[0x24BDAC7A8](v5, v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v26 - v11;
  v13 = sub_227E5F27C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a3;
  v19 = self;
  sub_227E5F270();
  v20 = (uint64_t)&v12[*(int *)(v5 + 48)];
  sub_227E03208(v12, v20, (uint64_t)v17);
  v21 = (uint64_t)&v9[*(int *)(v5 + 48)];
  v22 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v22(v9, v12, v13);
  v22((char *)v21, (char *)v20, v13);
  v23 = (void *)sub_227E035A0((uint64_t)v9, v21, v18);
  sub_227D5809C((uint64_t)v12, &qword_253F391A8);
  v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v17, v13);
  v24((char *)v21, v13);
  v24(v9, v13);

  return v23;
}

- (void).cxx_destruct
{

}

@end
