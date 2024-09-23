@implementation CameraTrayViewController

- (void)didTapActivitiesButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport24CameraTrayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22738D428();

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport24CameraTrayViewController *v2;

  v2 = self;
  sub_227482CA4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport24CameraTrayViewController *v4;

  v4 = self;
  sub_2274857E4(a3);

}

- (void)didTapSettingsButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport24CameraTrayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22749302C();

}

- (void)didTapShareButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport24CameraTrayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22748C6BC(v4, (void (*)(_QWORD *))sub_227316ECC);

}

- (void)didTapReaderButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport24CameraTrayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22748C6BC(v4, (void (*)(_QWORD *))sub_2273181F4);

}

- (void)didTapViewSnapshotsButton:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_22748C7D4);
}

- (void)didTapDoneButton:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_22748C9B4);
}

- (void)didTapSnapshotButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport24CameraTrayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22748CB7C(v4);

}

- (void)didTapDetectionModeButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport24CameraTrayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22749312C();

}

- (void)keyboardWillShowWithNotification:(id)a3
{
  id v4;
  _TtC16MagnifierSupport24CameraTrayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227493994();

}

- (void)switchToDetectionModeControls
{
  _TtC16MagnifierSupport24CameraTrayViewController *v2;

  v2 = self;
  sub_2274845A4();

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport24CameraTrayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22758E1E4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MagnifierSupport24CameraTrayViewController *)sub_22748D810(v5, v7, a4);
}

- (_TtC16MagnifierSupport24CameraTrayViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport24CameraTrayViewController *)sub_22748DBA8(a3);
}

- (void).cxx_destruct
{
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureDelegate);
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_detectionModeDelegate);
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_settingsDelegate);
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_switchActivityDelegate);
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_freezeFrameDelegate);
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_quickReaderModeDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___snapshotButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___activitiesButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___microphoneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___snapshotModeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___viewSnapshotsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___detectionModeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___controlsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___shareLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___readerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___readerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___activityLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___snapshotLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___detectionModeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___microphoneLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___controlsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_microphoneInputField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___microphoneInputFieldMicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_scrollView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_snapshotConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_snapshotButtonContextMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureButtonContextMenuTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_quickReaderModeActionIdentifier));
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC16MagnifierSupport24CameraTrayViewController *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_227493C94();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _TtC16MagnifierSupport24CameraTrayViewController *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_227493E84();

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _TtC16MagnifierSupport24CameraTrayViewController *v12;
  id v13;

  v8 = OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureButtonContextMenuTimer;
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureButtonContextMenuTimer);
  v10 = a3;
  v11 = a4;
  swift_unknownObjectRetain();
  v12 = self;
  if (v9)
  {
    objc_msgSend(v9, sel_invalidate);
    v13 = *(Class *)((char *)&self->super.super.super.isa + v8);
  }
  else
  {
    v13 = 0;
  }
  *(Class *)((char *)&self->super.super.super.isa + v8) = 0;

  swift_unknownObjectRelease();
}

- (uint64_t)didTapSnapshotModeButton:
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t result;
  char v5;

  if (qword_2558D4A20 != -1)
    swift_once();
  v0 = sub_22758CF9C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2558D6188);
  v1 = sub_22758CF84();
  v2 = sub_22758E6B8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2272F4000, v1, v2, "didTapSnapshotModeButton", v3, 2u);
    MEMORY[0x2276B3D50](v3, -1, -1);
  }

  if (qword_2540B87B8 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  result = swift_release();
  if ((v5 & 1) == 0)
    return sub_227492C68(1);
  return result;
}

- (uint64_t)detectionMenuActionTriggered:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[23];
  _BYTE v16[25];

  v0 = sub_22758DF20();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3, v4, v5);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2540B87B8 != -1)
    swift_once();
  v8 = qword_2540BCDD0 + OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__longPressHintShouldDisplay;
  swift_beginAccess();
  v16[0] = 0;
  if (qword_2540B9100 != -1)
    swift_once();
  v9 = sub_22758DF14();
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12, v13);
  *(_QWORD *)&v15[-16] = v16;
  *(_QWORD *)&v15[-8] = v8;
  sub_22758E7A8();
  (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v7, v0);
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  v16[1] = 1;
  swift_retain();
  return sub_22758D1A0();
}

@end
