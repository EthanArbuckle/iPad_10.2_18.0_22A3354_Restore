@implementation ActivityHostViewController

- (_TtP18ActivityUIServices34ActivityHostViewControllerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  return (_TtP18ActivityUIServices34ActivityHostViewControllerDelegate_ *)(id)MEMORY[0x22E31826C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC18ActivityUIServices23ActivitySceneDescriptor)activitySceneDescriptor
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  return (_TtC18ActivityUIServices23ActivitySceneDescriptor *)*v2;
}

- (void)setActivitySceneDescriptor:(id)a3
{
  sub_22D81A620((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
}

- (ACActivityDescriptor)acActivityDescriptor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v9;

  v3 = sub_22D84B340();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D819F60(0, (unint64_t *)&qword_2540C5F90);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, *v7 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor, v3);
  return (ACActivityDescriptor *)(id)sub_22D84B730();
}

- (unsigned)presentationMode
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
}

- (void)setPresentationMode:(unsigned int)a3
{
  _TtC18ActivityUIServices26ActivityHostViewController *v4;

  v4 = self;
  BSDispatchQueueAssertMain();
  sub_22D8248E4(a3, 0);

}

- (BOOL)wantsBaseContentTouchEvents
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsBaseContentTouchEvents:(BOOL)a3
{
  _TtC18ActivityUIServices26ActivityHostViewController *v4;

  v4 = self;
  sub_22D8215B4(a3);

}

- (UIColor)backgroundTintColor
{
  return (UIColor *)sub_22D81A584((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor);
}

- (void)setBackgroundTintColor:(id)a3
{
  _TtC18ActivityUIServices26ActivityHostViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_22D8336F4(a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, (SEL *)&selRef_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_);

}

- (UIColor)textColor
{
  return (UIColor *)sub_22D81A584((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor);
}

- (void)setTextColor:(id)a3
{
  _TtC18ActivityUIServices26ActivityHostViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_22D8336F4(a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, (SEL *)&selRef_activityHostViewControllerTextColorDidChangeWithViewController_);

}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)resolvedMetrics
{
  return (_TtC18ActivityUIServices20ActivitySceneMetrics *)sub_22D81A584((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
}

- (void)setResolvedMetrics:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC18ActivityUIServices26ActivityHostViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  BSDispatchQueueAssertMain();
  sub_22D82655C();

}

- (BOOL)idleTimerDisabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  _TtC18ActivityUIServices26ActivityHostViewController *v4;

  v4 = self;
  sub_22D821928(a3);

}

- (NSArray)audioCategoriesDisablingVolumeHUD
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_22D84B634();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  _TtC18ActivityUIServices26ActivityHostViewController *v6;
  char *v7;
  void *v8;

  if (a3)
    v4 = sub_22D84B640();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  *v5 = v4;
  v6 = self;
  swift_bridgeObjectRelease();
  BSDispatchQueueAssertMain();
  v7 = (char *)v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  v8 = (void *)MEMORY[0x22E31826C](v7);
  if (v8)
  {
    objc_msgSend(v8, sel_activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController_, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (NSArray)activityTouchRestrictedRects
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for CGRect(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22D84B634();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivityTouchRestrictedRects:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for CGRect(0);
  v4 = sub_22D84B640();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)systemProvidedMetrics
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
  swift_beginAccess();
  return (_TtC18ActivityUIServices22ActivityMetricsRequest *)*v2;
}

- (void)setSystemProvidedMetrics:(id)a3
{
  sub_22D81A620((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)fallbackMetrics
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_22D821C04();

  return (_TtC18ActivityUIServices20ActivitySceneMetrics *)v3;
}

- (_TtC18ActivityUIServices26ActivityHostViewController)initWithActivitySceneDescriptor:(id)a3
{
  return (_TtC18ActivityUIServices26ActivityHostViewController *)ActivityHostViewController.init(activitySceneDescriptor:)(a3);
}

- (_TtC18ActivityUIServices26ActivityHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22D833CAC();
}

- (void)dealloc
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;

  v2 = self;
  ActivityHostViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_22D817714((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer));
}

- (void)viewDidLoad
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;
  objc_super v3;

  v2 = self;
  BSDispatchQueueAssertMain();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivityHostViewController();
  -[ActivityHostViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_22D827094();
  sub_22D8272B0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18ActivityUIServices26ActivityHostViewController *v4;

  v4 = self;
  sub_22D82901C(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18ActivityUIServices26ActivityHostViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22D8292D0(a3);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC18ActivityUIServices26ActivityHostViewController *v7;
  _BYTE *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v7 = self;
  BSDispatchQueueAssertMain();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for ActivityHostViewController();
  -[ActivityHostViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  v8 = (char *)v7 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  swift_beginAccess();
  if (*v8 == 1)
  {
    if (!v6)
    {
      sub_22D826F10();
      goto LABEL_6;
    }
    sub_22D8267C4();
  }

LABEL_6:
}

- (void)viewWillLayoutSubviews
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;

  v2 = self;
  sub_22D82967C();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)ensureContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  id v10;
  _TtC18ActivityUIServices26ActivityHostViewController *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v10 = a4;
  v11 = self;
  sub_22D8221C8(v10, (uint64_t)sub_22D835088, v9, a3);

  swift_release();
}

- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;
  void *v3;
  id v4;

  v2 = self;
  BSDispatchQueueAssertMain();
  v3 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (v3)
    v4 = objc_msgSend(v3, sel_backlightSceneHostEnvironment);
  else
    v4 = 0;

  return (BLSHBacklightSceneHostEnvironment *)v4;
}

- (void)invalidate
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;

  v2 = self;
  sub_22D8234B0();

}

- (NSString)description
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;
  void *v3;

  v2 = self;
  sub_22D82A528();

  v3 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)shouldShareTouchesWithHost
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  BOOL *v5;
  _TtC18ActivityUIServices26ActivityHostViewController *v6;

  v5 = (BOOL *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  BSDispatchQueueAssertMain();
  if (*v5)
    sub_22D8267C4();
  else
    sub_22D826F10();

}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  _TtC18ActivityUIServices26ActivityHostViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_22D8238AC();
  v4 = v3;

  return v4;
}

- (_TtC18ActivityUIServices26ActivityHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18ActivityUIServices26ActivityHostViewController *result;

  v4 = a4;
  result = (_TtC18ActivityUIServices26ActivityHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  _TtC18ActivityUIServices26ActivityHostViewController *v5;

  v4 = a3;
  v5 = self;
  _s18ActivityUIServices0A18HostViewControllerC16sceneDidActivateyySo7FBSceneCF_0();

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  _TtC18ActivityUIServices26ActivityHostViewController *v5;

  v4 = a3;
  v5 = self;
  _s18ActivityUIServices0A18HostViewControllerC18sceneDidInvalidateyySo7FBSceneCF_0();

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  _TtC18ActivityUIServices26ActivityHostViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  ActivityHostViewController.sceneDidDeactivate(_:withError:)(v6, a4);

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  _TtC18ActivityUIServices26ActivityHostViewController *v5;

  v4 = a3;
  v5 = self;
  ActivityHostViewController.sceneContentStateDidChange(_:)(v4);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  int64_t v6;
  id v7;
  _TtC18ActivityUIServices26ActivityHostViewController *v8;

  sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
  sub_22D833C04();
  v6 = sub_22D84B694();
  v7 = a3;
  v8 = self;
  ActivityHostViewController.scene(_:didReceive:)((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC18ActivityUIServices26ActivityHostViewController *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_22D834430((uint64_t)v11, a6);

}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  id v4;
  _TtC18ActivityUIServices26ActivityHostViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22D83463C(sub_22D8267C4, "[%{public}s] sceneLayerManagerDidUpdateLayers");

}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  id v4;
  _TtC18ActivityUIServices26ActivityHostViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22D83463C((void (*)(void))sub_22D826F10, "[%{public}s] sceneLayerManagerDidStopTrackingLayers");

}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
  id v4;
  _TtC18ActivityUIServices26ActivityHostViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22D83463C(sub_22D8267C4, "[%{public}s] sceneLayerManagerDidStartTrackingLayers");

}

@end
