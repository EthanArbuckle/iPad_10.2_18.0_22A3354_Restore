@implementation AppViewController

- (void)toggleAVTorchForApplicationDeactivation:(BOOL)a3
{
  _TtC16MagnifierSupport17AppViewController *v4;

  v4 = self;
  sub_2273114C0(a3);

}

- (void)stopSpeechForVoiceOverFocusChange
{
  _TtC16MagnifierSupport17AppViewController *v2;

  v2 = self;
  if (UIAccessibilityIsVoiceOverRunning())
    sub_2273CD4C0();

}

- (void)userDidExitDetectionMode:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16MagnifierSupport17AppViewController *v6;

  v4 = qword_2540B87B8;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  sub_227469C74(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();

}

- (void)openDetectionSettings:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227433F24();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  _TtC16MagnifierSupport17AppViewController *v6;
  objc_super v7;

  v3 = a3;
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = self;
  swift_retain();
  sub_2274A5D60((uint64_t)sub_22743DE14, v5);
  swift_release_n();
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for AppViewController();
  -[AppViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);

}

- (void)_dismissActivityCustomizationPaneWithText
{
  _TtC16MagnifierSupport17AppViewController *v2;

  v2 = self;
  sub_2274DA620();

}

- (void)_dismissActivityCustomizationPane
{
  _TtC16MagnifierSupport17AppViewController *v2;

  v2 = self;
  sub_2274DA9EC();

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC16MagnifierSupport17AppViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC16MagnifierSupport17AppViewController *)sub_2275069C8();
}

- (void)loadView
{
  _TtC16MagnifierSupport17AppViewController *v2;

  v2 = self;
  sub_2274E5F48();

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport17AppViewController *v2;

  v2 = self;
  sub_2274E60B8();

}

- (void)didTapPipWindowButton:(id)a3
{
  sub_2274FCF18(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_2274EAC64);
}

- (void)didTapCloseButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227507FC0();

}

- (void)viewWillLayoutSubviews
{
  _TtC16MagnifierSupport17AppViewController *v2;

  v2 = self;
  sub_2274EADEC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport17AppViewController *v4;

  v4 = self;
  sub_2274EB220(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MagnifierSupport17AppViewController *v4;

  v4 = self;
  sub_2274EBC54(a3);

}

- (void)updateAppearanceForReduceTransparency:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16MagnifierSupport17AppViewController *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B00);
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22758C5F4();
    v12 = sub_22758C618();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_22758C618();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = self;
  sub_2274F8604();

  sub_22731A1A4((uint64_t)v11, &qword_2540B7B00);
}

- (void)deviceOrientationDidChange:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227507CBC();

}

- (void)didPanPreviewView:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274FB124(v4);

}

- (void)didTapToChangeFocus:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274FB900(v4);

}

- (void)didLongPressToFocus:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274FC18C(v4);

}

- (void)didPinchToZoom:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274FC66C(v4);

}

- (void)didActivateCardVisibilityGesture:(id)a3
{
  sub_2274FCF18(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_2274FCB90);
}

- (void)didActivateCardHidingGesture:(id)a3
{
  sub_2274FCF18(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_2274FCF94);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport17AppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *result;

  v4 = a4;
  result = (_TtC16MagnifierSupport17AppViewController *)_swift_stdlib_reportUnimplementedInitializer();
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

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_freezeFrameViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___controlContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___mainCardViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___cameraTrayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_currentLiveView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___cameraVideoPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_liveLensInterruptionBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___doubleTapGesture));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController__capturedPhoto;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540B9BF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController__capturedImage;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540B9C30);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_actionButtonInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_eventInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_zoomPanGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_zoomPinchGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_zoomGestureFeedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_controlsQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_audioQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___focusIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_focusIndicatorFadeTime));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___coachingLabel));
  sub_2273D3754(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___landscapeCoachingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___detectionInformationLabel));
  sub_2273D3754(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___landscapeDetectionInformationLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_coachingHideAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_sceneEventAnimator));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_springBoardServer));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_activitiesNameController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_commitActivityButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_backTapEventProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_modelsManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_arOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_fingerTipScene));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_fingerTip));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_luminanceManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastARFrame));
  swift_bridgeObjectRelease();
  sub_22731A1A4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastSpeechDate, (uint64_t *)&unk_2540B7B30);
  v7 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_tooFastLastDate;
  v8 = sub_22758C930();
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController____lazy_storage___personDetectionManager));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_detectionModeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_detectedPersonView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_detectedObjectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_engine));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_languageTranslator));
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastImageDescriptionTextTime, v8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextDocument));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastTextDetectionTextDisplayTime, v8);
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastHandPoseTime, v8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_flashlightBarButtonItem));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_textBoxLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_fingerDebugLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pointSpeakInstructionsAlertController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedReaderTextDocument));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_readerModeLoadingProgressViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_readerModeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_settingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pipWindowButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_sessionTimer));
  v9((char *)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_sessionTimerStartTime, v8);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_captureService));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_arService));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_objectUnderstandingService));
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_stillImageStore);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pulseFeedbackProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_passthroughView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_freezeFrameScrubberTray));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_2274FEBBC(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport17AppViewController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_2274FEE58(v6, v7);

  return v9 & 1;
}

- (void)applicationWillAddDeactivationReasonWithNotification:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274FF59C(v4);

}

- (void)applicationDidRemoveDeactivationReasonWithNotification:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17AppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2275004BC(v4);

}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v7;
  id v8;
  _TtC16MagnifierSupport17AppViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_227508608(v8);

}

- (uint64_t)userDidEndMutliShotMode:
{
  if (qword_2540B87B8 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();
  return sub_22738A164();
}

@end
