@implementation HRMedicalRecordTimelineViewController

- (NSString)sidebarSelectionIdentifier
{
  HRMedicalRecordTimelineViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1BC34E7D8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (HRMedicalRecordTimelineViewController)initWithProfile:(id)a3 accountId:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t ObjectType;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  HRMedicalRecordTimelineViewController *v17;
  char v19;
  uint64_t v20;

  sub_1BC357158(0, (unint64_t *)&qword_1EF42B210, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v20 - v9;
  v11 = sub_1BC62A7B4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A79C();
  ObjectType = swift_getObjectType();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v10, v14, v11);
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v16(v10, 0, 1, v11);
  v16(v8, 1, 1, v11);
  v19 = 1;
  v17 = (HRMedicalRecordTimelineViewController *)(*(uint64_t (**)(id, _QWORD, char *, _QWORD, _QWORD, char *, _QWORD, _QWORD, _QWORD, char))(ObjectType + 960))(a3, 0, v10, 0, 0, v8, 0, 0, 0, v19);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_deallocPartialClassInstance();
  return v17;
}

- (HRMedicalRecordTimelineViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC356ECC();
}

- (void)dealloc
{
  HRMedicalRecordTimelineViewController *v2;
  objc_super v3;

  v2 = self;
  sub_1BC352140();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for MedicalRecordTimelineViewController();
  -[HRMedicalRecordTimelineViewController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayItemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_profile));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_category));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_account));
  sub_1BC358494((uint64_t)self + OBJC_IVAR___HRMedicalRecordTimelineViewController_accountId, (uint64_t)&qword_1EF42B210, (uint64_t)MEMORY[0x1E0CB0998], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC357158);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_conceptIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_ontologyConcept));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_userDomainConcept));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayState);
  v4 = *(UIViewControllerTransitioningDelegate **)((char *)&self->super.super._overrideTransitioningDelegate
                                                 + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayState);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayState));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController____lazy_storage___contentStatusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController____lazy_storage___clinicalAccountStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController____lazy_storage___dataProvider));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_cloudSyncObserver));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___HRMedicalRecordTimelineViewController_gradientColorProvider);
}

- (void)viewDidLoad
{
  HRMedicalRecordTimelineViewController *v2;

  v2 = self;
  sub_1BC34FA90();

}

- (void)viewIsAppearing:(BOOL)a3
{
  HRMedicalRecordTimelineViewController *v4;

  v4 = self;
  sub_1BC350524(a3);

}

- (void)viewWillLayoutSubviews
{
  _BYTE *v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicalRecordTimelineViewController();
  v2 = v5.receiver;
  -[HRMedicalRecordTimelineViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  if (v2[OBJC_IVAR___HRMedicalRecordTimelineViewController_showGradientBackgroundForAllRecordsRoom] != 1)
    goto LABEL_4;
  v3 = objc_msgSend(v2, sel_collectionView, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_contentOffset);

    sub_1BC347F0C(&qword_1EF429270, (uint64_t (*)(uint64_t))type metadata accessor for MedicalRecordTimelineViewController, (uint64_t)&protocol conformance descriptor for MedicalRecordTimelineViewController);
    sub_1BC62B534();
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)updateSystemStatusView
{
  HRMedicalRecordTimelineViewController *v2;

  v2 = self;
  sub_1BC352550(0);

}

- (void)fetchMoreData
{
  HRMedicalRecordTimelineViewController *v2;

  v2 = self;
  sub_1BC35230C();

}

- (void)didTapExportPDFButton
{
  HRMedicalRecordTimelineViewController *v2;

  v2 = self;
  sub_1BC352C14();

}

- (void)tapToRadarWithSender:(id)a3
{
  HRMedicalRecordTimelineViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC62D088();
  swift_unknownObjectRelease();
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(v4);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (void)reloadDataWithDelay:(double)a3
{
  void *v5;
  HRMedicalRecordTimelineViewController *v6;

  v5 = (void *)objc_opt_self();
  v6 = self;
  objc_msgSend(v5, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v6, sel_reloadData, 0);
  -[HRMedicalRecordTimelineViewController performSelector:withObject:afterDelay:](v6, sel_performSelector_withObject_afterDelay_, sel_reloadData, 0, a3);

}

- (void)reloadDataWithNotification:(id)a3
{
  id v4;
  HRMedicalRecordTimelineViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC3531E0(v4);

}

- (void)reloadData
{
  HRMedicalRecordTimelineViewController *v2;
  id v3;

  v2 = self;
  sub_1BC34DFEC();
  swift_retain();
  swift_release();
  sub_1BC62BF0C();
  swift_release();
  objc_msgSend(v3, sel_reload);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v13;
  CGFloat v14;
  HRMedicalRecordTimelineViewController *v15;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  v15 = self;
  objc_msgSend(v4, sel_contentOffset);
  v6 = v5;
  objc_msgSend(v4, sel_contentSize);
  v8 = v7;
  objc_msgSend(v4, sel_frame);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v13 = v8 - (v6 + CGRectGetHeight(v16));
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v14 = CGRectGetHeight(v17);
  if (v13 < v14 + v14)
    sub_1BC35230C();

}

- (HRMedicalRecordTimelineViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  HRMedicalRecordTimelineViewController *result;

  v3 = a3;
  result = (HRMedicalRecordTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HRMedicalRecordTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  HRMedicalRecordTimelineViewController *result;

  v4 = a4;
  result = (HRMedicalRecordTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  id v5;
  HRMedicalRecordTimelineViewController *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = self;
    sub_1BC3557A0(3, 18);

  }
}

- (void)didUpdateSeriesWithNewValueRange:(id)a3
{
  HRMedicalRecordTimelineViewController *v3;

  if (!a3)
  {
    if ((*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___HRMedicalRecordTimelineViewController_chartLoaded) & 1) != 0)
    {
      v3 = self;
      sub_1BC3557A0(3, 18);

    }
    else
    {
      *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___HRMedicalRecordTimelineViewController_chartLoaded) = 1;
    }
  }
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  HRMedicalRecordTimelineViewController *v5;

  v5 = self;
  sub_1BC3557A0(3, 18);

}

- (void)clinicalIngestionStore:(id)a3 ingestionStateDidUpdateTo:(int64_t)a4
{
  id v6;
  HRMedicalRecordTimelineViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1BC357288(a4);

}

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v6;
  id v7;
  HRMedicalRecordTimelineViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1BC357490(v7);

}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6;
  HRMedicalRecordTimelineViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1BC3576A4((uint64_t)&unk_1E74D46C0, (uint64_t)sub_1BC358B40, (uint64_t)&block_descriptor_43);

}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4;
  HRMedicalRecordTimelineViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC3576A4((uint64_t)&unk_1E74D4670, (uint64_t)sub_1BC3585C0, (uint64_t)&block_descriptor_37);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  HRMedicalRecordTimelineViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  sub_1BC34E254();
  sub_1BC62B4EC();
  v6 = sub_1BC62B03C();

  swift_release();
  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  HRMedicalRecordTimelineViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  sub_1BC34E254();
  sub_1BC62B4EC();
  v7 = sub_1BC62B024();

  swift_release();
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HRMedicalRecordTimelineViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = MedicalRecordTimelineViewController.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1BC42BBD8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))MedicalRecordTimelineViewController.collectionView(_:shouldSelectItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_1BC42BBD8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))MedicalRecordTimelineViewController.collectionView(_:shouldHighlightItemAt:));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HRMedicalRecordTimelineViewController *v11;
  uint64_t v12;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  MedicalRecordTimelineViewController.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  HRMedicalRecordTimelineViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = sub_1BC62A970();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v11 = a3;
  v12 = self;
  v13 = (void *)_s15HealthRecordsUI35MedicalRecordTimelineViewControllerC010collectionG0_33contextMenuConfigurationForItemAt5pointSo09UIContextkL0CSgSo012UICollectionG0C_10Foundation9IndexPathVSo7CGPointVtF_0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return sub_1BC42BBD8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))MedicalRecordTimelineViewController.collectionView(_:selectionFollowsFocusForItemAt:));
}

@end
