@implementation ASVPreviewViewControllerInternal

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC11AssetViewer28ARQuickLookOverlayController)overlayController
{
  ASVPreviewViewControllerInternal *v2;
  char *v3;

  v2 = self;
  v3 = sub_1D9410AF4();

  return (_TtC11AssetViewer28ARQuickLookOverlayController *)v3;
}

- (void)setOverlayController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___overlayController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___overlayController) = (Class)a3;
  v3 = a3;

}

- (void)viewDidLoad
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  PreviewViewController.viewDidLoad()();

}

- (void)didBecomeActive
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D9414E60(0xD000000000000011, 0x80000001D94DD760);

}

- (void)updateIsWindowFullscreenWithFuncString:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  ASVPreviewViewControllerInternal *v7;

  v4 = sub_1D94D2F98();
  v6 = v5;
  v7 = self;
  sub_1D9414E60(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  PreviewViewController.viewDidLayoutSubviews()();

}

- (void)dealloc
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  PreviewViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR___ASVPreviewViewControllerInternal_configuration);
  v4 = *(uint64_t *)((char *)&self->super.super._view + OBJC_IVAR___ASVPreviewViewControllerInternal_configuration);
  swift_bridgeObjectRelease();

  sub_1D93D6F38(v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_videoWriter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_videoInput));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_playbackViewController));
  swift_bridgeObjectRelease();
  sub_1D9435558((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_previewType, type metadata accessor for PreviewType);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___overlayController));
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal_shareSheetReplyBlock));
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal_coachingOverlayViewDidDeactivateCompletionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___coachingOverlayView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_lozengeLabel));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_fallbackTapGestureEntityController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_viewportDebugView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_defaultARConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_faceTrackingConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_placeModelTimer));
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal_previewCompletionHandler));
  sub_1D93D2000((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_analyticsViewDidAppearDate, &qword_1F01C47B8);
  sub_1D93D2000((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_analyticsLastDisplayModeToggledDate, &qword_1F01C47B8);
  swift_bridgeObjectRelease();
  sub_1D94394C8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___arAnchorTrackedStateUpdater));
  sub_1D93D2000((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_lastPlacedAnchoringComponentTarget, &qword_1F01C8AF0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D9435558((uint64_t)self + OBJC_IVAR___ASVPreviewViewControllerInternal_customizationOptions, type metadata accessor for ModelCustomizationOptions);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_debugActionsState));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal____lazy_storage___replayObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ASVPreviewViewControllerInternal_hideLozengeTimer));
}

- (void)hideLozengeAnimated
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D9417C84();

}

- (void)updateInterfaceState
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D9417D1C();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1D941DF90(self, (uint64_t)a2, (uint64_t)a3, a4, _s11AssetViewer21PreviewViewControllerC12touchesBegan_4withyShySo7UITouchCG_So7UIEventCSgtF_0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1D941DF90(self, (uint64_t)a2, (uint64_t)a3, a4, _s11AssetViewer21PreviewViewControllerC12touchesMoved_4withyShySo7UITouchCG_So7UIEventCSgtF_0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1D941DF90(self, (uint64_t)a2, (uint64_t)a3, a4, _s11AssetViewer21PreviewViewControllerC12touchesEnded_4withyShySo7UITouchCG_So7UIEventCSgtF_0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  ASVPreviewViewControllerInternal *v8;

  sub_1D93D1DB8(0, (unint64_t *)&qword_1F01C4468);
  sub_1D94392AC((unint64_t *)&qword_1F01C76A0, (unint64_t *)&qword_1F01C4468);
  v6 = sub_1D94D3244();
  v7 = a4;
  v8 = self;
  _s11AssetViewer21PreviewViewControllerC12touchesEnded_4withyShySo7UITouchCG_So7UIEventCSgtF_0(v6);

  swift_bridgeObjectRelease();
}

- (void)presentationModeDidChange:(unint64_t)a3 animated:(BOOL)a4
{
  ASVPreviewViewControllerInternal *v5;

  v5 = self;
  _s11AssetViewer21PreviewViewControllerC25presentationModeDidChange_8animatedySo014QLPresentationG0V_SbtF_0(a3);

}

- (void)didDismissActivityViewController
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  PreviewViewController.didDismissActivityViewController()();

}

- (ASVPreviewViewControllerInternal)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1D94D2F98();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (ASVPreviewViewControllerInternal *)PreviewViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (ASVPreviewViewControllerInternal)initWithCoder:(id)a3
{
  return (ASVPreviewViewControllerInternal *)PreviewViewController.init(coder:)(a3);
}

- (BOOL)shouldDisableGestures
{
  ASVPreviewViewControllerInternal *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1D941F474();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)currentlyDisallowsUnifiedGestureRecognizerAction
{
  ASVPreviewViewControllerInternal *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1D941F474();
  v4 = v3;

  return v4 & 1;
}

- (void)entityController:(id)a3 doubleTappedAt:(CGPoint)a4
{
  id v5;
  ASVPreviewViewControllerInternal *v6;

  v5 = a3;
  v6 = self;
  sub_1D9435674(v5);

}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  ASVPreviewViewControllerInternal *v12;
  uint64_t v13;

  v6 = sub_1D94D1204();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1D94D11BC();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  PreviewViewController.preparePreviewOfFile(at:completionHandler:)(v9, (uint64_t)sub_1D94394B8, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)triggerOnInteractionsAndReEnablePhysicsWithDelay
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D9421C4C();

}

- (void)previewWillAppear:(BOOL)a3
{
  ASVPreviewViewControllerInternal *v3;

  v3 = self;
  _s11AssetViewer21PreviewViewControllerC17previewWillAppearyySbF_0();

}

- (void)previewDidAppear:(BOOL)a3
{
  ASVPreviewViewControllerInternal *v3;

  v3 = self;
  _s11AssetViewer21PreviewViewControllerC16previewDidAppearyySbF_0();

}

- (void)previewWillDisappear:(BOOL)a3
{
  ASVPreviewViewControllerInternal *v3;

  v3 = self;
  _s11AssetViewer21PreviewViewControllerC20previewWillDisappearyySbF_0();

}

- (void)previewDidDisappear:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  ASVPreviewViewControllerInternal *v8;

  v3 = qword_1F01C3058;
  v8 = self;
  if (v3 != -1)
    swift_once();
  v4 = sub_1D94D2674();
  __swift_project_value_buffer(v4, (uint64_t)qword_1F01C7908);
  v5 = sub_1D94D265C();
  v6 = sub_1D94D32EC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D93A7000, v5, v6, "ARQL previewDidDisappear", v7, 2u);
    MEMORY[0x1DF08DC98](v7, -1, -1);
  }

  sub_1D9424280();
}

- (void)dismissButtonPressed
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D9426774();

}

- (void)shareButtonPressed
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D942777C();

}

- (void)handleTapAtPointWithPoint:(CGPoint)a3
{
  ASVPreviewViewControllerInternal *v3;

  v3 = self;
  sub_1D9439408();

}

- (UIView)accessibilityARView
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController);
  if (v2 && (v3 = *(void **)(v2 + OBJC_IVAR____TtC11AssetViewer15ModelController_arView)) != 0)
    return (UIView *)v3;
  else
    return (UIView *)0;
}

- (void)accessibilityShowControls
{
  if (*((_BYTE *)&self->super.super.super._responderFlags + OBJC_IVAR___ASVPreviewViewControllerInternal_interfaceState) == 4)
  {
    *((_BYTE *)&self->super.super.super._responderFlags + OBJC_IVAR___ASVPreviewViewControllerInternal_interfaceState) = 3;
    -[ASVPreviewViewControllerInternal updateInterfaceState](self, sel_updateInterfaceState);
  }
}

- (float)accessibilityDistanceInMetersFromEntityController:(id)a3
{
  uint64_t v3;
  void *v4;
  id v6;
  ASVPreviewViewControllerInternal *v7;
  id v8;
  float v9;
  float v10;
  float result;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController);
  if (v3)
  {
    v4 = *(void **)(v3 + OBJC_IVAR____TtC11AssetViewer15ModelController_arView);
    if (v4)
    {
      v6 = a3;
      v7 = self;
      v8 = v4;
      sub_1D94D20EC();
      v10 = v9;

      return v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (NSArray)accessibilityEntityControllers
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController))
    swift_bridgeObjectRetain();
  type metadata accessor for EntityController();
  v2 = (void *)sub_1D94D3118();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC11AssetViewer16EntityController)accessibilityRootEntityController
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ASVPreviewViewControllerInternal_modelController);
  if (v2 && (v3 = *(void **)(v2 + OBJC_IVAR____TtC11AssetViewer15ModelController_rootEntityController)) != 0)
    return (_TtC11AssetViewer16EntityController *)v3;
  else
    return (_TtC11AssetViewer16EntityController *)0;
}

- (void)tryPlaceModelOrRescheduleTimer
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D944C4AC();

}

- (void)createInlinePreviewWithUUID:(id)a3 initialBounds:(CGRect)a4 contextIdReply:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  CGFloat *v22;
  void *v23;
  ASVPreviewViewControllerInternal *v24;
  _QWORD aBlock[6];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = sub_1D94D12D0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)aBlock - v16;
  v18 = _Block_copy(a5);
  sub_1D94D12B8();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v17, v11);
  v20 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = sub_1D94704D0;
  *(_QWORD *)(v21 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v21 + v20, v14, v11);
  v22 = (CGFloat *)(v21 + ((v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v22 = x;
  v22[1] = y;
  v22[2] = width;
  v22[3] = height;
  aBlock[4] = sub_1D946FA30;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_217;
  v23 = _Block_copy(aBlock);
  v24 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v23);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void)prepareInlinePreviewWithScopedURLWrapperAttributes:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (**v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  id v21;
  ASVPreviewViewControllerInternal *v22;
  uint64_t v23;
  ASVPreviewViewControllerInternal *v24;
  _QWORD aBlock[6];

  v24 = self;
  v7 = sub_1D94D12D0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v23 - v12;
  v14 = _Block_copy(a5);
  sub_1D94D12B8();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v16, v10, v7);
  v19 = (void (**)(uint64_t, uint64_t, uint64_t))(v18 + v17);
  *v19 = sub_1D9470848;
  v19[1] = (void (*)(uint64_t, uint64_t, uint64_t))v15;
  *(_QWORD *)(v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_1D946FA50;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_207;
  v20 = _Block_copy(aBlock);
  v21 = a3;
  v22 = v24;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v20);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)prepareInlinePreviewWithData:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  ASVPreviewViewControllerInternal *v13;

  v9 = sub_1D94D12D0();
  MEMORY[0x1E0C80A78](v9);
  v10 = _Block_copy(a5);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_1D94D121C();

  sub_1D94D12B8();
  _Block_release(v10);
  sub_1D94D382C();
  __break(1u);
}

- (void)prepareFullscreenPreview:(id)a3 initialFrame:(CGRect)a4 previewOptions:(id)a5 fenceHandleCompletion:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  CGFloat *v28;
  void (**v29)(uint64_t, uint64_t, uint64_t);
  ASVPreviewViewControllerInternal *v30;
  void *v31;
  ASVPreviewViewControllerInternal *v32;
  uint64_t v33;
  uint64_t v34;
  ASVPreviewViewControllerInternal *v35;
  char *v36;
  _QWORD aBlock[6];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v35 = self;
  v11 = sub_1D94D12D0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v33 - v16;
  v18 = _Block_copy(a6);
  v36 = v17;
  sub_1D94D12B8();
  v34 = sub_1D94D2F14();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  v20 = v17;
  v21 = v11;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v20, v11);
  v22 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v23 = (v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v27 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v27 + v22, v14, v21);
  v28 = (CGFloat *)(v27 + v23);
  *v28 = x;
  v28[1] = y;
  v28[2] = width;
  v28[3] = height;
  *(_QWORD *)(v27 + v24) = v34;
  v29 = (void (**)(uint64_t, uint64_t, uint64_t))(v27 + v25);
  *v29 = sub_1D9471008;
  v29[1] = (void (*)(uint64_t, uint64_t, uint64_t))v19;
  v30 = v35;
  *(_QWORD *)(v27 + v26) = v35;
  aBlock[4] = sub_1D946FA58;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_197;
  v31 = _Block_copy(aBlock);
  v32 = v30;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v31);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v36, v21);
}

- (void)observeReturnedToInlineForUUID:(id)a3 fenceHandleCompletion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void (**v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  ASVPreviewViewControllerInternal *v19;
  _QWORD aBlock[6];

  v6 = sub_1D94D12D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)aBlock - v11;
  v13 = _Block_copy(a4);
  sub_1D94D12B8();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, v9, v6);
  v17 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + ((v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v17 = sub_1D9470664;
  v17[1] = (void (*)(uint64_t, uint64_t, uint64_t))v14;
  aBlock[4] = sub_1D946FA60;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_186;
  v18 = _Block_copy(aBlock);
  v19 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)dismissPreviewController
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  PreviewViewController.dismissPreviewController()();

}

- (void)touchesBegan:(id)a3 forUUID:(id)a4
{
  sub_1D946D078(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)&unk_1E9F13798, (uint64_t)sub_1D9470AFC, (uint64_t)&block_descriptor_239, "+inlinePreview: touchesBegan: touches set was empty");
}

- (void)touchesMoved:(id)a3 forUUID:(id)a4
{
  sub_1D946D078(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)&unk_1E9F13748, (uint64_t)sub_1D9470A68, (uint64_t)&block_descriptor_232, "+inlinePreview: touchesMoved: touches set was empty");
}

- (void)touchesEnded:(id)a3 forUUID:(id)a4
{
  sub_1D946D078(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)&unk_1E9F136F8, (uint64_t)sub_1D9470A4C, (uint64_t)&block_descriptor_225, "+inlinePreview: touchesEnded: touches set was empty");
}

- (void)touchesCancelled:(id)a3 forUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  ASVPreviewViewControllerInternal *v16;
  _QWORD aBlock[6];

  v5 = sub_1D94D12D0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)aBlock - v10;
  sub_1D93D1DB8(0, (unint64_t *)&unk_1F01C7660);
  sub_1D94705A0();
  v12 = sub_1D94D3244();
  sub_1D94D12B8();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, v8, v5);
  *(_QWORD *)(v14 + ((v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = v12;
  aBlock[4] = sub_1D946FC94;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_176;
  v15 = _Block_copy(aBlock);
  v16 = self;
  swift_bridgeObjectRetain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

- (void)updateBounds:(CGRect)a3 forUUID:(id)a4 fenceHandleCompletion:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  CGFloat *v21;
  void (**v22)(uint64_t, uint64_t, uint64_t);
  void *v23;
  ASVPreviewViewControllerInternal *v24;
  _QWORD aBlock[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = sub_1D94D12D0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)aBlock - v16;
  v18 = _Block_copy(a5);
  sub_1D94D12B8();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v17, v11);
  v20 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = (CGFloat *)swift_allocObject();
  v21[2] = x;
  v21[3] = y;
  v21[4] = width;
  v21[5] = height;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v21 + v20, v14, v11);
  v22 = (void (**)(uint64_t, uint64_t, uint64_t))((char *)v21 + ((v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v22 = sub_1D94704D0;
  v22[1] = (void (*)(uint64_t, uint64_t, uint64_t))v19;
  aBlock[4] = sub_1D946FCB0;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_169;
  v23 = _Block_copy(aBlock);
  v24 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v23);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void)inlinePreview:(id)a3 setRuntimeStateObserver:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  ASVPreviewViewControllerInternal *v20;
  _QWORD aBlock[6];

  v6 = sub_1D94D12D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)aBlock - v11;
  v13 = _Block_copy(a4);
  sub_1D94D12B8();
  if (v13)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_1D94704C8;
  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v9, v6);
  v18 = (_QWORD *)(v17 + v16);
  *v18 = v13;
  v18[1] = v14;
  aBlock[4] = sub_1D946FCB8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_156;
  v19 = _Block_copy(aBlock);
  v20 = self;
  sub_1D93D6BE8((uint64_t)v13);
  swift_release();
  QLRunInMainThread();
  _Block_release(v19);
  sub_1D93D6F38((uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)inlinePreview:(id)a3 setEnableShadows:(BOOL)a4
{
  sub_1D946E5E4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1E9F13388, (uint64_t)sub_1D946FCC0, (uint64_t)&block_descriptor_149);
}

- (void)inlinePreview:(id)a3 setEnableGradientBackground:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_1D94D12D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D94D12B8();
  _s11AssetViewer21PreviewViewControllerC06inlineC0_27setEnableGradientBackgroundy10Foundation4UUIDV_SbtF_0((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)inlinePreview:(id)a3 setIsPlaying:(BOOL)a4
{
  sub_1D946E5E4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1E9F13338, (uint64_t)sub_1D946FEE0, (uint64_t)&block_descriptor_142);
}

- (void)inlinePreview:(id)a3 setIsLooping:(BOOL)a4
{
  sub_1D946E5E4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1E9F132E8, (uint64_t)sub_1D946FEE8, (uint64_t)&block_descriptor_135);
}

- (void)inlinePreview:(id)a3 setCurrentTime:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  ASVPreviewViewControllerInternal *v16;
  _QWORD aBlock[6];

  v6 = sub_1D94D12D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)aBlock - v11;
  sub_1D94D12B8();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v9, v6);
  *(double *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = a4;
  aBlock[4] = sub_1D946FEF8;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_128;
  v15 = _Block_copy(aBlock);
  v16 = self;
  swift_release();
  QLRunInMainThread();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)inlinePreview:(id)a3 setIsMuted:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  ASVPreviewViewControllerInternal *v16;
  _QWORD aBlock[6];

  v6 = sub_1D94D12D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)aBlock - v11;
  sub_1D94D12B8();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v9, v6);
  aBlock[4] = sub_1D946FF00;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_121;
  v15 = _Block_copy(aBlock);
  v16 = self;
  swift_release();
  QLRunInMainThread();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)inlinePreview:(id)a3 setCameraYaw:(float)a4 pitch:(float)a5 scale:(float)a6 options:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  ASVPreviewViewControllerInternal *v23;
  uint64_t v24;
  ASVPreviewViewControllerInternal *v25;
  _QWORD aBlock[6];

  v25 = self;
  v10 = sub_1D94D12D0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v24 - v15;
  sub_1D94D12B8();
  v24 = sub_1D94D2F14();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v16, v10);
  v17 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v18 = (v12 + v17 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v19 = (v18 + 7) & 0xFFFFFFFFFFFFFFFCLL;
  v20 = (v19 + 7) & 0xFFFFFFFFFFFFFFFCLL;
  v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v21 + v17, v13, v10);
  *(float *)(v21 + v18) = a4;
  *(float *)(v21 + v19) = a5;
  *(float *)(v21 + v20) = a6;
  *(_QWORD *)(v21 + ((v20 + 11) & 0xFFFFFFFFFFFFFFF8)) = v24;
  aBlock[4] = sub_1D946FF08;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_114;
  v22 = _Block_copy(aBlock);
  v23 = v25;
  swift_bridgeObjectRetain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v22);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)teardownInlinePreviewWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void (**v17)();
  void *v18;
  ASVPreviewViewControllerInternal *v19;
  _QWORD aBlock[6];

  v6 = sub_1D94D12D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)aBlock - v11;
  v13 = _Block_copy(a4);
  sub_1D94D12B8();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, v9, v6);
  v17 = (void (**)())(v16 + ((v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v17 = sub_1D9470054;
  v17[1] = (void (*)())v14;
  aBlock[4] = sub_1D946FF10;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_107;
  v18 = _Block_copy(aBlock);
  v19 = self;
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)sendARQLEvent:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (**v19)(uint64_t, uint64_t);
  void *v20;
  ASVPreviewViewControllerInternal *v21;
  uint64_t v22;
  ASVPreviewViewControllerInternal *v23;
  _QWORD aBlock[6];

  v23 = self;
  v6 = sub_1D94D12D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v22 - v11;
  v13 = _Block_copy(a5);
  v14 = sub_1D94D2F14();
  sub_1D94D12B8();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v16, v9, v6);
  *(_QWORD *)(v18 + v17) = v14;
  v19 = (void (**)(uint64_t, uint64_t))(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v19 = sub_1D946FF68;
  v19[1] = (void (*)(uint64_t, uint64_t))v15;
  aBlock[4] = sub_1D946FF18;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D945B4B8;
  aBlock[3] = &block_descriptor_97;
  v20 = _Block_copy(aBlock);
  v21 = v23;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  QLRunInMainThread();
  _Block_release(v20);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)triggerTapToRadar
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D94765DC();

}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6;
  id v7;
  ASVPreviewViewControllerInternal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D9478CD4(v7);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  ASVPreviewViewControllerInternal *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1D94791A0(v8);

}

- (void)sessionWasInterrupted:(id)a3
{
  id v4;
  ASVPreviewViewControllerInternal *v5;

  v4 = a3;
  v5 = self;
  sub_1D9478F0C((uint64_t)&unk_1E9F13E90, (uint64_t)sub_1D9479404, (uint64_t)&block_descriptor_36);

}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4;
  ASVPreviewViewControllerInternal *v5;

  v4 = a3;
  v5 = self;
  sub_1D9478F0C((uint64_t)&unk_1E9F13E40, (uint64_t)sub_1D94793FC, (uint64_t)&block_descriptor_30);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  ASVPreviewViewControllerInternal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PreviewViewController.session(_:didUpdate:)((ARSession)v6, (ARFrame)v7);

}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  sub_1D9478C4C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))PreviewViewController.session(_:didUpdate:));
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  sub_1D9478C4C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))PreviewViewController.session(_:didAdd:));
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  sub_1D9478C4C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))PreviewViewController.session(_:didRemove:));
}

- (void)activateCoachingView
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D94D0954();

}

- (void)activateCoachingViewWithDelay
{
  ASVPreviewViewControllerInternal *v2;

  v2 = self;
  sub_1D94D05F4();

}

- (void)coachingOverlayViewDidDeactivate:(id)a3
{
  uint64_t *v4;
  void (*v5)(uint64_t);
  id v6;
  ASVPreviewViewControllerInternal *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (uint64_t *)((char *)self
                 + OBJC_IVAR___ASVPreviewViewControllerInternal_coachingOverlayViewDidDeactivateCompletionBlock);
  v5 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___ASVPreviewViewControllerInternal_coachingOverlayViewDidDeactivateCompletionBlock);
  v6 = a3;
  v7 = self;
  if (v5)
  {
    v8 = sub_1D93D6BE8((uint64_t)v5);
    v5(v8);
    sub_1D93D6F38((uint64_t)v5);
    v9 = *v4;
  }
  else
  {
    v9 = 0;
  }
  *v4 = 0;
  v4[1] = 0;
  sub_1D93D6F38(v9);

}

@end
