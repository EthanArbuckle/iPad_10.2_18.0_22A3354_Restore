@implementation CAMSystemOverlayTipManager

- (BOOL)isPortraitOrientation
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation);
}

- (void)setIsPortraitOrientation:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation) = a3;
}

+ (void)configure
{
  sub_1DB979C48();
}

+ (BOOL)anyTipPendingOrAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  int v7;
  int v8;
  _QWORD v11[2];

  v2 = sub_1DB979C24();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = 0xD000000000000014;
  v11[1] = 0x80000001DB9C21B0;
  sub_1DB96E68C();
  sub_1DB979B34();
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  v7 = v6;
  v8 = *MEMORY[0x1E0CE9838];
  if (v6 == *MEMORY[0x1E0CE9838])
    goto LABEL_7;
  if (v6 != *MEMORY[0x1E0CE9848] && v6 != *MEMORY[0x1E0CE9850])
  {
    sub_1DB97A1DC();
    __break(1u);
LABEL_7:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v7 != v8;
}

- (void)startTipObservationForViewController:(id)a3 sourceItem:(id)a4
{
  id v6;
  id v7;
  CAMSystemOverlayTipManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DB96CC24();

}

- (void)stopTipObservation
{
  CAMSystemOverlayTipManager *v2;

  v2 = self;
  sub_1DB96D70C();

}

- (void)recordSliderVisibleEvent
{
  uint64_t v2;
  uint64_t v3;
  CAMSystemOverlayTipManager *v4;

  v2 = qword_1F0303DF8;
  v4 = self;
  if (v2 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A38);
  __swift_project_value_buffer(v3, (uint64_t)qword_1F0306920);
  sub_1DB979C00();

}

- (void)recordMenuVisibleEvent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  CAMSystemOverlayTipManager *v8;
  _QWORD v9[2];

  v3 = sub_1DB979BD0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)&self->isPortraitOrientation[OBJC_IVAR___CAMSystemOverlayTipManager_menuTip];
  v9[0] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_menuTip);
  v9[1] = v7;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CE9610], v3);
  sub_1DB96E68C();
  v8 = self;
  sub_1DB9798D0();
  sub_1DB979B10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_bridgeObjectRelease();
}

- (void)setSliderVisibleParameter:(BOOL)a3
{
  sub_1DB96D978(self, (uint64_t)a2, a3, &qword_1F0303E00, (uint64_t)qword_1F0306938);
}

- (void)setRecordingParameter:(BOOL)a3
{
  sub_1DB96D978(self, (uint64_t)a2, a3, &qword_1F0303E08, (uint64_t)qword_1F0306950);
}

- (void)setControlsCountParameter:(unint64_t)a3
{
  uint64_t v3;
  CAMSystemOverlayTipManager *v4;
  uint64_t v5;

  v3 = qword_1F0303E10;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A28);
  __swift_project_value_buffer(v5, (uint64_t)qword_1F0306968);
  swift_beginAccess();
  sub_1DB979C30();
  swift_endAccess();

}

- (void)setSkipTipParameter:(BOOL)a3
{
  sub_1DB96D978(self, (uint64_t)a2, a3, &qword_1F0303E18, (uint64_t)qword_1F0306980);
}

+ (void)resetDataStore
{
  sub_1DB979BAC();
}

- (CAMSystemOverlayTipManager)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_menuTip);
  *v4 = 0xD000000000000014;
  v4[1] = 0x80000001DB9C21B0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[CAMSystemOverlayTipManager init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
