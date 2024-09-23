@implementation IMMessagesBlastDoorInterfaceInternal

- (IMMessagesBlastDoorInterfaceInternal)initWithBlastDoorInstanceType:(id)a3
{
  id v3;
  IMMessagesBlastDoorInterfaceInternal *v4;

  v3 = a3;
  v4 = (IMMessagesBlastDoorInterfaceInternal *)sub_1BEDCD2E0(v3);

  return v4;
}

- (id)defuseTopLevelDictionary:(id)a3 error:(id *)a4
{
  return sub_1BEDCBDD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_1BEDBB794);
}

- (void)defuseTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
  sub_1BEDBEA9C(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, id, void *))sub_1BEDCDB30);
}

- (void)decontaminateTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
  sub_1BEDBEA9C(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, id, void *))sub_1BEDCEE0C);
}

- (id)defuseSMSDictionary:(id)a3 error:(id *)a4
{
  return sub_1BEDCBDD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1BEDBEB34);
}

- (void)defuseSMSDictionary:(id)a3 resultHandler:(id)a4
{
  sub_1BEDCB280(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E78B4330, (uint64_t)sub_1BEDD4890, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BEDBEDDC);
}

- (id)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  IMMessagesBlastDoorInterfaceInternal *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1BEDE8FF0();
  v12 = v11;

  v13 = sub_1BEDE98C0();
  v15 = v14;

  v16 = (void *)sub_1BEDBF088(v10, v12, v13, v15);
  swift_bridgeObjectRelease();

  sub_1BEDBB354(v10, v12);
  return v16;
}

- (void)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 resultHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  IMMessagesBlastDoorInterfaceInternal *v17;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v17 = self;
  v11 = sub_1BEDE8FF0();
  v13 = v12;

  v14 = sub_1BEDE98C0();
  v16 = v15;

  _Block_copy(v8);
  sub_1BEDCF814(v11, v13, v14, v16, (uint64_t)v17, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  sub_1BEDBB354(v11, v13);

}

- (void)defuseData:(id)a3 forPreviewType:(unsigned __int8)a4 resultHandler:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  IMMessagesBlastDoorInterfaceInternal *v13;

  v8 = _Block_copy(a5);
  v9 = a3;
  v13 = self;
  v10 = sub_1BEDE8FF0();
  v12 = v11;

  _Block_copy(v8);
  sub_1BEDCFA94(v10, v12, a4, (uint64_t)v13, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_1BEDBB354(v10, v12);

}

+ (BOOL)supportsFeature:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = sub_1BEDE98C0();
  v5 = sub_1BEDCFE04(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  IMMessagesBlastDoorInterfaceInternal *v11;
  uint64_t v12;

  v6 = sub_1BEDE8F9C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1BEDE8F78();
  _Block_copy(v10);
  v11 = self;
  sub_1BEDD0D2C((uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  IMMessagesBlastDoorInterfaceInternal *v11;
  uint64_t v12;

  v6 = sub_1BEDE8F9C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1BEDE8F78();
  _Block_copy(v10);
  v11 = self;
  sub_1BEDD1104((uint64_t)v9, 1, (char *)v11, (void (**)(_QWORD, _QWORD, _QWORD))v10, 0.0, 0.0);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)generatePreviewforAttachmentWithfileURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  IMMessagesBlastDoorInterfaceInternal *v9;
  void *v10;
  uint64_t v12;

  v5 = sub_1BEDE8F9C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE8F78();
  v9 = self;
  v10 = (void *)sub_1BEDC0154((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  IMMessagesBlastDoorInterfaceInternal *v13;
  void *v14;
  uint64_t v16;

  v9 = sub_1BEDE8F9C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE8F78();
  v13 = self;
  v14 = (void *)sub_1BEDC22C8((uint64_t)v12, a4, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v14;
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  IMMessagesBlastDoorInterfaceInternal *v15;
  uint64_t v16;

  v10 = sub_1BEDE8F9C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_1BEDE8F78();
  _Block_copy(v14);
  v15 = self;
  sub_1BEDD1104((uint64_t)v13, 0, (char *)v15, (void (**)(_QWORD, _QWORD, _QWORD))v14, a4, a5);
  _Block_release(v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  IMMessagesBlastDoorInterfaceInternal *v16;
  uint64_t v17;

  v10 = sub_1BEDE8F9C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a7);
  sub_1BEDE8F78();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = self;
  sub_1BEDC6400(a4, (uint64_t)v13, (uint64_t)sub_1BEDD4890, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 frameInterval:(int64_t)a7 resultHandler:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  IMMessagesBlastDoorInterfaceInternal *v18;
  uint64_t v19;

  v12 = sub_1BEDE8F9C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a8);
  sub_1BEDE8F78();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  v18 = self;
  sub_1BEDC6928(a4, (uint64_t)v15, a7, (uint64_t)sub_1BEDD4B1C, v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  IMMessagesBlastDoorInterfaceInternal *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a8;
  HIDWORD(v21) = a7;
  v14 = sub_1BEDE8F9C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a10);
  sub_1BEDE8F78();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  v20 = self;
  sub_1BEDC6D84((uint64_t)v17, a4, a5, a6, SHIDWORD(v21), v22, a9, (uint64_t)sub_1BEDD4324, v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)generateWorkoutPreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  IMMessagesBlastDoorInterfaceInternal *v15;
  uint64_t v16;

  v9 = sub_1BEDE8F9C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  sub_1BEDE8F78();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = self;
  sub_1BEDC730C(a4, (uint64_t)v12, (uint64_t)sub_1BEDD4890, v14);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)generatePreviewforAudioMessageWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  IMMessagesBlastDoorInterfaceInternal *v12;
  uint64_t v13;

  v6 = sub_1BEDE8F9C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1BEDE8F78();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  sub_1BEDC764C((uint64_t)v9, (uint64_t)sub_1BEDD4890, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 resultHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  IMMessagesBlastDoorInterfaceInternal *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v9 = _Block_copy(a6);
  v10 = sub_1BEDE9884();
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = sub_1BEDE8FF0();
  v16 = v15;

  v17 = sub_1BEDE98C0();
  v19 = v18;

  _Block_copy(v9);
  sub_1BEDD3BE0(v10, v14, v16, v17, v19, 0, 0xF000000000000000, 0, 0xF000000000000000, 0, 0xF000000000000000, 1u, (uint64_t)v13, (void (**)(_QWORD, _QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();
  sub_1BEDBB354(v14, v16);

  swift_bridgeObjectRelease();
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 resultHandler:(id)aBlock
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  IMMessagesBlastDoorInterfaceInternal *v38;
  uint64_t v39;

  v15 = _Block_copy(aBlock);
  v39 = sub_1BEDE9884();
  v16 = a4;
  v17 = a5;
  v38 = self;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = sub_1BEDE8FF0();
  v36 = v22;
  v37 = v21;

  v23 = sub_1BEDE98C0();
  v35 = v24;

  if (v18)
  {
    v25 = sub_1BEDE8FF0();
    v33 = v26;
    v34 = v25;

    if (v19)
      goto LABEL_3;
LABEL_6:
    v32 = 0;
    v28 = 0xF000000000000000;
    if (v20)
      goto LABEL_4;
LABEL_7:
    v29 = 0;
    v31 = 0xF000000000000000;
    goto LABEL_8;
  }
  v33 = 0xF000000000000000;
  v34 = 0;
  if (!v19)
    goto LABEL_6;
LABEL_3:
  v32 = sub_1BEDE8FF0();
  v28 = v27;

  if (!v20)
    goto LABEL_7;
LABEL_4:
  v29 = sub_1BEDE8FF0();
  v31 = v30;

LABEL_8:
  _Block_copy(v15);
  sub_1BEDD3BE0(v39, v37, v36, v23, v35, v34, v33, v32, v28, v29, v31, 1u, (uint64_t)v38, (void (**)(_QWORD, _QWORD, _QWORD))v15);
  _Block_release(v15);
  _Block_release(v15);
  sub_1BEDD42F8(v29, v31);
  sub_1BEDD42F8(v32, v28);
  sub_1BEDD42F8(v34, v33);
  swift_bridgeObjectRelease();
  sub_1BEDBB354(v37, v36);

  swift_bridgeObjectRelease();
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 processImageFields:(BOOL)a9 resultHandler:(id)aBlock
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  IMMessagesBlastDoorInterfaceInternal *v41;
  uint64_t v42;

  v16 = _Block_copy(aBlock);
  v42 = sub_1BEDE9884();
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = v18;
  v41 = self;
  v21 = a6;
  v22 = a7;
  v23 = v19;
  v24 = sub_1BEDE8FF0();
  v39 = v25;
  v40 = v24;

  v35 = sub_1BEDE98C0();
  v38 = v26;

  if (v21)
  {
    v27 = sub_1BEDE8FF0();
    v36 = v28;
    v37 = v27;

    if (v22)
      goto LABEL_3;
LABEL_6:
    v34 = 0;
    v30 = 0xF000000000000000;
    if (v23)
      goto LABEL_4;
LABEL_7:
    v31 = 0;
    v33 = 0xF000000000000000;
    goto LABEL_8;
  }
  v36 = 0xF000000000000000;
  v37 = 0;
  if (!v22)
    goto LABEL_6;
LABEL_3:
  v34 = sub_1BEDE8FF0();
  v30 = v29;

  if (!v23)
    goto LABEL_7;
LABEL_4:
  v31 = sub_1BEDE8FF0();
  v33 = v32;

LABEL_8:
  _Block_copy(v16);
  sub_1BEDD3BE0(v42, v40, v39, v35, v38, v37, v36, v34, v30, v31, v33, a9, (uint64_t)v41, (void (**)(_QWORD, _QWORD, _QWORD))v16);
  _Block_release(v16);
  _Block_release(v16);
  sub_1BEDD42F8(v31, v33);
  sub_1BEDD42F8(v34, v30);
  sub_1BEDD42F8(v37, v36);
  swift_bridgeObjectRelease();
  sub_1BEDBB354(v40, v39);

  swift_bridgeObjectRelease();
}

- (void)getMetadataForEmojiImageWithFileURL:(id)a3 maxStrikeCount:(int64_t)a4 resultHandler:(id)a5
{
  sub_1BEDCA7B4(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1E78B3F48, (uint64_t)sub_1BEDD4890, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_1BEDC8578);
}

- (void)generatePreviewForEmojiImageWithFileURL:(id)a3 frameIndex:(int64_t)a4 maxPixelDimension:(float)a5 resultHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  IMMessagesBlastDoorInterfaceInternal *v16;
  uint64_t v17;

  v10 = sub_1BEDE8F9C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_1BEDE8F78();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = self;
  sub_1BEDC878C(a5, (uint64_t)v13, a4, (uint64_t)sub_1BEDD4890, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generatePreviewForMultiFrameImageWithFileURL:(id)a3 destinationFileURL:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 maxFrameCount:(int64_t)a7 isSticker:(BOOL)a8 resultHandler:(id)a9
{
  _BOOL4 v10;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void *v22;
  uint64_t v23;
  IMMessagesBlastDoorInterfaceInternal *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;

  v10 = a8;
  v15 = sub_1BEDE8F9C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v26 - v20;
  v22 = _Block_copy(a9);
  sub_1BEDE8F78();
  sub_1BEDE8F78();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v22;
  v24 = self;
  sub_1BEDC8AE0((uint64_t)v21, (uint64_t)v19, a7, v10, (uint64_t)sub_1BEDD0D24, v23, a5, a6);

  swift_release();
  v25 = *(void (**)(char *, uint64_t))(v16 + 8);
  v25(v19, v15);
  v25(v21, v15);
}

- (void)getMetadataforAnimatedImageWithfileURL:(id)a3 maxCount:(int64_t)a4 resultHandler:(id)a5
{
  sub_1BEDCA7B4(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1E78B3ED0, (uint64_t)sub_1BEDD4890, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_1BEDCA5A0);
}

- (void)generatePreviewforAnimatedImageWithfileURL:(id)a3 maxPixelDimension:(float)a4 index:(int64_t)a5 maxCount:(int64_t)a6 resultHandler:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  IMMessagesBlastDoorInterfaceInternal *v18;
  uint64_t v19;

  v12 = sub_1BEDE8F9C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  sub_1BEDE8F78();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  v18 = self;
  sub_1BEDCA8B0(a4, (uint64_t)v15, a5, a6, (uint64_t)sub_1BEDD4890, v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)defuseCollaborationNoticePayload:(id)a3 resultHandler:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  IMMessagesBlastDoorInterfaceInternal *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v14 = self;
  v8 = sub_1BEDE8FF0();
  v10 = v9;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v6;
  sub_1BEDE95CC();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02EC8];
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1BEDD4890;
  *(_QWORD *)(v13 + 24) = v11;
  sub_1BEDD47C0(&qword_1EF5782C8, v12, MEMORY[0x1E0D02EC0]);
  swift_retain();
  sub_1BEDE91C4();
  swift_release();
  swift_release();
  sub_1BEDBB354(v8, v10);

}

- (void)defuseCollaborationNoticeActionDictionary:(id)a3 resultHandler:(id)a4
{
  sub_1BEDCB280(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E78B3E30, (uint64_t)sub_1BEDD0D1C, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BEDCAE0C);
}

- (void)defuseCollaborationClearNoticePayload:(id)a3 resultHandler:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  IMMessagesBlastDoorInterfaceInternal *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v14 = self;
  v8 = sub_1BEDE8FF0();
  v10 = v9;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v6;
  sub_1BEDE965C();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03008];
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1BEDD4890;
  *(_QWORD *)(v13 + 24) = v11;
  sub_1BEDD47C0(&qword_1EF5782D8, v12, MEMORY[0x1E0D03000]);
  swift_retain();
  sub_1BEDE91C4();
  swift_release();
  swift_release();
  sub_1BEDBB354(v8, v10);

}

- (id)defuseLiteTextMessage:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  IMMessagesBlastDoorInterfaceInternal *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v17;

  v6 = sub_1BEDE94B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  v12 = sub_1BEDE8FF0();
  v14 = v13;

  sub_1BEDD47C0((unint64_t *)&qword_1EF5782E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02CE0], MEMORY[0x1E0D02CD8]);
  sub_1BEDE91D0();
  v15 = (void *)sub_1BEDE9488();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1BEDBB354(v12, v14);
  return v15;
}

- (id)defuseSatelliteSMSTextMessageDictionary:(id)a3 error:(id *)a4
{
  return sub_1BEDCBDD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1BEDCBB3C);
}

- (id)defuseChatBotCSS:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  IMMessagesBlastDoorInterfaceInternal *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = sub_1BEDE8F9C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE8F78();
  v9 = self;
  v10 = sub_1BEDCBF94((uint64_t)v8);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  v13 = (void *)sub_1BEDE8FE4();
  sub_1BEDBB354(v10, v12);
  return v13;
}

- (id)defuseRelayGroupMutationPayloadForData:(id)a3 error:(id *)a4
{
  return sub_1BEDCC72C(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x1E0D030D0], &qword_1EF578308, MEMORY[0x1E0D030C8], MEMORY[0x1E0D030B8]);
}

- (id)defuseRelayReachabilityRequestPayloadForData:(id)a3 error:(id *)a4
{
  return sub_1BEDCC72C(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x1E0D03058], &qword_1EF578310, MEMORY[0x1E0D03050], MEMORY[0x1E0D03048]);
}

- (id)defuseRelayReachabilityResponsePayloadForData:(id)a3 error:(id *)a4
{
  return sub_1BEDCC72C(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x1E0D030F0], &qword_1EF578318, MEMORY[0x1E0D030E8], MEMORY[0x1E0D030E0]);
}

- (IMMessagesBlastDoorInterfaceInternal)init
{
  IMMessagesBlastDoorInterfaceInternal *result;

  result = (IMMessagesBlastDoorInterfaceInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
