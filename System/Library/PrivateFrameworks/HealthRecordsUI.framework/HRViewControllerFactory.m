@implementation HRViewControllerFactory

+ (HRViewControllerFactory)shared
{
  if (qword_1ED6A31B0 != -1)
    swift_once();
  return (HRViewControllerFactory *)(id)qword_1ED6A4670;
}

- (id)makeAccountDetailViewControllerForAccount:(id)a3 profile:(id)a4 sourceIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  if (a5)
  {
    v7 = sub_1BC62C680();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v11 = 0;
  objc_allocWithZone((Class)type metadata accessor for ClinicalAccountDetailsViewController());
  return sub_1BC537354(a3, a4, &v11, v7, v9);
}

- (id)makeOnboadingTileViewControllerUsing:(id)a3
{
  id v4;
  HRViewControllerFactory *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BC5568A0(v4);

  return v6;
}

- (id)makeFailedToOnboardAccountAlertControllerToGateway:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  HRViewControllerFactory *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1BC5556FC(a3, v8);

  return v10;
}

- (id)makeViewControllerForRecord:(id)a3 usingProfile:(id)a4
{
  id v6;
  id v7;
  HRViewControllerFactory *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1BC554F84(v6, v7);

  return v9;
}

- (id)makeDetailViewControllerForRecord:(id)a3 usingProfile:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  HRViewControllerFactory *v16;
  id v17;
  id v18;
  uint64_t v20;

  v7 = type metadata accessor for PresentationContext(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - v11;
  v13 = sub_1BC62A7B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_1BC35EBE0((uint64_t)v12, (uint64_t)v9, type metadata accessor for PresentationContext);
  objc_allocWithZone((Class)type metadata accessor for MedicalRecordDetailViewController(0));
  v14 = a3;
  v15 = a4;
  v16 = self;
  v17 = sub_1BC5BFBB8(v14, v15, (uint64_t)v9);
  v18 = objc_msgSend(v17, sel_navigationItem);
  objc_msgSend(v18, sel_setLargeTitleDisplayMode_, 2);

  sub_1BC348D78((uint64_t)v12, type metadata accessor for PresentationContext);
  return v17;
}

- (HRViewControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ViewControllerFactory();
  return -[HRViewControllerFactory init](&v3, sel_init);
}

- (id)makeViewControllerForCategory:(id)a3 usingProfile:(id)a4
{
  WDMedicalRecordCategory *v6;
  HRProfile *v7;
  HRViewControllerFactory *v8;
  UIViewController *v9;
  void *v10;
  void *v11;

  v6 = (WDMedicalRecordCategory *)a3;
  v7 = (HRProfile *)a4;
  v8 = self;
  ViewControllerFactory.makeViewController(for:using:)(v9, v6, v7);
  v11 = v10;

  return v11;
}

- (id)makeTimelineViewControllerForCategory:(id)a3 showsInitialSearchBar:(BOOL)a4 usingProfile:(id)a5 filterPredicatesByType:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  id v17;
  id v18;
  char *v19;
  uint64_t v21;

  sub_1BC357158(0, (unint64_t *)&qword_1EF42B210, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v21 - v13;
  if (a6)
  {
    sub_1BC34B6A0(0, &qword_1ED6A58D8);
    sub_1BC34B6A0(0, (unint64_t *)&qword_1ED6A58C0);
    sub_1BC3754E8();
    a6 = (id)sub_1BC62C548();
  }
  v15 = sub_1BC62A7B4();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  v16(v11, 1, 1, v15);
  objc_allocWithZone((Class)type metadata accessor for MedicalRecordTimelineViewController());
  v17 = a3;
  v18 = a5;
  v19 = sub_1BC356878(v18, a3, (uint64_t)v14, 0, 0, (uint64_t)v11, 0, a6, 0);

  return v19;
}

- (id)makeAlphabeticalViewControllerForCategory:(id)a3 usingProfile:(id)a4
{
  id v6;
  id v7;
  HRViewControllerFactory *v8;
  id v9;
  id v10;
  uint64_t v12[2];
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[8];
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1BC4FC8D8(v6, (uint64_t)v17);
  v12[0] = v17[0];
  v12[1] = v18;
  v13 = v19;
  v14 = v20;
  v15 = v21;
  v16 = v22;
  objc_allocWithZone((Class)type metadata accessor for ConceptListViewController());
  v9 = v7;
  v10 = sub_1BC5E480C(v12, v9);

  return v10;
}

- (id)makeOutOfRangeLabsViewControllerUsingProfile:(id)a3
{
  id v4;
  HRViewControllerFactory *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  _s15HealthRecordsUI21ViewControllerFactoryC018makeOutOfRangeLabsdE05usingSo06UIViewE0CSo9HRProfileC_tF_0(v4);
  v7 = v6;

  return v7;
}

- (id)makeImproveHealthRecordsPrivacyPresenter
{
  HRViewControllerFactory *v2;
  void *v3;
  id v4;
  id result;

  v2 = self;
  v3 = (void *)sub_1BC62C650();
  v4 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4)
  {

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
