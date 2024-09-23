@implementation BEDownloadProgress

- (BEDownloadProgress)initWithSourceURL:(id)a3 destinationURL:(id)a4 title:(id)a5 type:(id)a6 description:(id)a7 sourceDescription:(id)a8 cancellationHandler:(id)a9
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  BEDownloadProgress *v39;
  uint64_t v41[2];

  v41[1] = (uint64_t)self;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560327C0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_233073730();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v41 - v20;
  v22 = _Block_copy(a9);
  sub_233073718();
  sub_233073718();
  if (a5)
  {
    v41[0] = sub_23307397C();
    v24 = v23;
    if (a6)
      goto LABEL_3;
  }
  else
  {
    v41[0] = 0;
    v24 = 0;
    if (a6)
    {
LABEL_3:
      v25 = a8;
      v26 = a7;
      v27 = a6;
      sub_23307388C();

      v28 = sub_2330738A4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v15, 0, 1, v28);
      if (a7)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v36 = sub_2330738A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v15, 1, 1, v36);
  v37 = a8;
  v38 = a7;
  if (a7)
  {
LABEL_4:
    v29 = sub_23307397C();
    v31 = v30;

    if (a8)
      goto LABEL_5;
LABEL_10:
    v32 = 0;
    v34 = 0;
    if (v22)
      goto LABEL_6;
LABEL_11:
    v35 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v29 = 0;
  v31 = 0;
  if (!a8)
    goto LABEL_10;
LABEL_5:
  v32 = sub_23307397C();
  v34 = v33;

  if (!v22)
    goto LABEL_11;
LABEL_6:
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = v22;
  v22 = sub_2330672D4;
LABEL_12:
  v39 = (BEDownloadProgress *)sub_233066514((uint64_t)v21, (uint64_t)v19, v41[0], v24, (uint64_t)v15, v29, v31, v32, v34, (uint64_t)v22, v35);
  sub_233066A24((uint64_t)v22);
  return v39;
}

- (void)updateProgressWithBytesReceived:(int64_t)a3 bytesTotal:(int64_t)a4
{
  BEDownloadProgress *v6;

  v6 = self;
  sub_2330628E8(a3, a4);

}

- (void)publish
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadProgress_progress), sel_publish);
}

- (void)unpublish
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadProgress_progress), sel_unpublish);
}

- (void)cancel
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadProgress_progress), sel_cancel);
}

- (BEDownloadProgress)init
{
  BEDownloadProgress *result;

  result = (BEDownloadProgress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___BEDownloadProgress_id;
  v4 = sub_233073760();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR___BEDownloadProgress_type;
  v6 = sub_2330738A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = (char *)self + OBJC_IVAR___BEDownloadProgress_sourceURL;
  v8 = sub_233073730();
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  swift_bridgeObjectRelease();
  v9((char *)self + OBJC_IVAR___BEDownloadProgress_destinationURL, v8);

}

@end
