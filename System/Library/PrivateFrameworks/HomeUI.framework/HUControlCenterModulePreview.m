@implementation HUControlCenterModulePreview

+ (id)previewWithPackage:(id)a3 forGridSize:(HUGridSize)a4
{
  int64_t columnsAcross;
  int64_t rowsDown;
  id v7;
  void *v8;

  columnsAcross = a4.columnsAcross;
  rowsDown = a4.rowsDown;
  swift_getObjCClassMetadata();
  v7 = a3;
  v8 = (void *)static HUControlCenterModulePreview.preview(package:size:)(v7, rowsDown, columnsAcross);

  return v8;
}

+ (id)previewWithSystemIcon:(id)a3 forGridSize:(HUGridSize)a4
{
  int64_t columnsAcross;
  int64_t rowsDown;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  columnsAcross = a4.columnsAcross;
  rowsDown = a4.rowsDown;
  v6 = sub_1B93EDDB4();
  v8 = v7;
  swift_getObjCClassMetadata();
  v9 = (void *)static HUControlCenterModulePreview.preview(systemIcon:size:)(v6, v8, rowsDown, columnsAcross);
  swift_bridgeObjectRelease();
  return v9;
}

+ (id)previewWithTemplate:(id)a3 tintColor:(id)a4 title:(id)a5 subtitle:(id)a6 forGridSize:(HUGridSize)a7
{
  int64_t columnsAcross;
  int64_t rowsDown;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;

  columnsAcross = a7.columnsAcross;
  rowsDown = a7.rowsDown;
  v12 = sub_1B93EDDB4();
  v14 = v13;
  if (a6)
  {
    v15 = sub_1B93EDDB4();
    a6 = v16;
  }
  else
  {
    v15 = 0;
  }
  swift_getObjCClassMetadata();
  v17 = a3;
  v18 = a4;
  v19 = (void *)static HUControlCenterModulePreview.preview(templateIcon:tint:title:subtitle:size:)(v17, v18, v12, v14, v15, (uint64_t)a6, rowsDown, columnsAcross);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

+ (id)emptyPreviewForGridSize:(HUGridSize)a3
{
  int64_t columnsAcross;
  int64_t rowsDown;

  columnsAcross = a3.columnsAcross;
  rowsDown = a3.rowsDown;
  swift_getObjCClassMetadata();
  return (id)static HUControlCenterModulePreview.empty(size:)(rowsDown, columnsAcross);
}

- (HUControlCenterModulePreview)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR___HUControlCenterModulePreview_configuration;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_QWORD *)v2 + 6) = 255;
  *((_QWORD *)v2 + 7) = 0;
  *((_QWORD *)v2 + 8) = 0;
  v4.receiver = self;
  v4.super_class = (Class)HUControlCenterModulePreview;
  return -[HUControlCenterModulePreview init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUControlCenterModulePreview_configuration;
  sub_1B8FE1844(*(void **)((char *)&self->super.isa + OBJC_IVAR___HUControlCenterModulePreview_configuration), *((void **)v2 + 1), *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 3), *((_QWORD *)v2 + 4), *((_QWORD *)v2 + 5), *((_QWORD *)v2 + 6));
}

@end
