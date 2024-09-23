@implementation IMMediaAnalysisBlastDoorInterfaceInternal

- (IMMediaAnalysisBlastDoorInterfaceInternal)init
{
  return (IMMediaAnalysisBlastDoorInterfaceInternal *)MediaAnalysisBlastDoorInterface.init()();
}

+ (BOOL)supportsFeature:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = sub_241254F54();
  v5 = v3;
  if (v4 == 0x6572506567616D69 && v3 == 0xED00007377656976
    || (sub_241254FC0() & 1) != 0
    || v4 == 0x6572506F65646976 && v5 == 0xED00007377656976)
  {
    swift_bridgeObjectRelease();
    v6 = 1;
  }
  else
  {
    v6 = sub_241254FC0();
    swift_bridgeObjectRelease();
  }
  return v6 & 1;
}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  IMMediaAnalysisBlastDoorInterfaceInternal *v11;
  uint64_t v12;

  v6 = sub_241254D98();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_241254D80();
  _Block_copy(v10);
  v11 = self;
  sub_241254508((uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  IMMediaAnalysisBlastDoorInterfaceInternal *v13;
  void *v14;
  uint64_t v16;

  v9 = sub_241254D98();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241254D80();
  v13 = self;
  v14 = (void *)sub_241253340((uint64_t)v12, a4, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v14;
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  IMMediaAnalysisBlastDoorInterfaceInternal *v16;
  uint64_t v17;

  v10 = sub_241254D98();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a7);
  sub_241254D80();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = self;
  sub_241253890(a4, (uint64_t)v13, (uint64_t)sub_241254500, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  IMMediaAnalysisBlastDoorInterfaceInternal *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a8;
  HIDWORD(v21) = a7;
  v14 = sub_241254D98();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a10);
  sub_241254D80();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  v20 = self;
  sub_241253E00((uint64_t)v17, a4, a5, a6, SHIDWORD(v21), v22, a9, (uint64_t)sub_2412544D4, v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
