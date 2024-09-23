uint64_t variable initialization expression of PeoplePickerShellViewController.activity()
{
  return 0;
}

uint64_t variable initialization expression of PeoplePickerShellViewController.$__lazy_storage_$_peoplePickerViewController()
{
  return 0;
}

uint64_t variable initialization expression of PeoplePickerShellViewController.$__lazy_storage_$_sharePlayWelcomeViewController()
{
  return 1;
}

void type metadata accessor for MessageComposeResult()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100010CD0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10000C540);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010CD0);
  }
}

BOOL sub_1000054B8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1000054CC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1000054DC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000054E8()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for Defaults();
  result = swift_initStaticObject(v0, &unk_100010CC0);
  qword_100011230 = result;
  return result;
}

uint64_t sub_100005510()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Defaults()
{
  return objc_opt_self(_TtC18RemotePeoplePicker8Defaults);
}

void sub_100005540(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSString v9;
  _QWORD v10[3];
  uint64_t v11;

  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  sub_100005678(a1, (uint64_t)v10);
  v3 = v11;
  if (v11)
  {
    v4 = sub_100005700(v10, v11);
    v5 = *(_QWORD *)(v3 - 8);
    __chkstk_darwin(v4, v4);
    v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v3);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    sub_100005724(v10);
  }
  else
  {
    v8 = 0;
  }
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setValue:forKey:", v8, v9);

  swift_unknownObjectRelease(v8);
}

uint64_t sub_100005678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000056C0(&qword_100010DA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000056C0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_100005700(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100005724(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005744(void *a1, unsigned __int8 a2)
{
  NSString v4;
  id v5;
  NSString v6;
  _OWORD v8[2];

  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(a1, "objectForKey:", v4);

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)(v8, v5);
    swift_unknownObjectRelease(v5);
    sub_10000582C((uint64_t)v8);
    v6 = String._bridgeToObjectiveC()();
    a2 = objc_msgSend(a1, "BOOLForKey:", v6);

  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_10000582C((uint64_t)v8);
  }
  return a2 & 1;
}

uint64_t sub_10000582C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000056C0(&qword_100010DA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10000586C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton);
  }
  else
  {
    v4 = sub_1000058CC(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1000058CC(uint64_t a1)
{
  id v2;
  id v3;
  Swift::String v4;
  Swift::String_optional v5;
  Swift::String v6;
  void *object;
  NSString v8;
  Swift::String v10;

  v2 = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "boldButton");
  v3 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v10._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0x45554E49544E4F43;
  v4._object = (void *)0xE800000000000000;
  v5.value._countAndFlagsBits = 0x6C6172656E6547;
  v5.value._object = (void *)0xE700000000000000;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v10._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, v5, (NSBundle)v3, v6, v10)._object;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v2, "setTitle:forState:", v8, 0);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", a1, "didTapContinueButton", 64);
  return v2;
}

id sub_1000059F0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView);
  }
  else
  {
    sub_100005ACC();
    v5 = v4;
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
    v7 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v6);

    v8 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v7);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

unint64_t sub_100005ACC()
{
  uint64_t v0;
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName);
  v2 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName
                 + 8);
  if (v2)
  {
    v3 = *v1;
  }
  else
  {
    v3 = sub_100005B40();
    v4 = v1[1];
    *v1 = v3;
    v1[1] = v5;
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRelease(v4);
    v2 = 0;
  }
  swift_bridgeObjectRetain(v2);
  return v3;
}

unint64_t sub_100005B40()
{
  id v0;
  id v1;
  int HasHomeButton;
  unint64_t v3;
  unint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  HasHomeButton = TUDeviceHasHomeButton();
  v3 = 0xD000000000000019;
  if (HasHomeButton)
  {
    v4 = 0xD000000000000018;
  }
  else
  {
    v3 = 0xD000000000000018;
    v4 = 0xD000000000000017;
  }
  if (v1)
    v4 = 0xD000000000000017;
  if (v1 == (id)1)
    return v3;
  else
    return v4;
}

id sub_100005C18()
{
  objc_class *v0;
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  Swift::String v10;
  Swift::String_optional v11;
  Swift::String v12;
  void *object;
  NSString v14;
  id v15;
  Swift::String v16;
  Swift::String_optional v17;
  Swift::String v18;
  void *v19;
  NSString v20;
  id v21;
  Swift::String v23;
  Swift::String v24;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
  v3 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithHierarchicalColor:", v2);

  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:withConfiguration:", v5, v4);

  v7 = objc_allocWithZone(v1);
  v8 = (void *)objc_opt_self(NSBundle);
  v9 = objc_msgSend(v8, "mainBundle");
  v23._object = (void *)0xE000000000000000;
  v10._object = (void *)0x800000010000AE90;
  v10._countAndFlagsBits = 0xD000000000000017;
  v11.value._countAndFlagsBits = 0x6C6172656E6547;
  v11.value._object = (void *)0xE700000000000000;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v23._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, v11, (NSBundle)v9, v12, v23)._object;

  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v15 = objc_msgSend(v8, "mainBundle");
  v16._countAndFlagsBits = 0xD000000000000020;
  v24._object = (void *)0xE000000000000000;
  v16._object = (void *)0x800000010000AEB0;
  v17.value._countAndFlagsBits = 0x6C6172656E6547;
  v17.value._object = (void *)0xE700000000000000;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v24._countAndFlagsBits = 0;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, v17, (NSBundle)v15, v18, v24)._object;

  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  v21 = objc_msgSend(v7, "initWithTitle:detailText:icon:", v14, v20, v6);

  return v21;
}

void sub_100005F60()
{
  char *v0;
  double v1;
  double v2;
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  id v13;
  objc_super v14;

  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  objc_msgSendSuper2(&v14, "viewWillLayoutSubviews");
  objc_msgSend(v0, "availableContentViewHeight");
  v2 = v1;
  v3 = sub_1000059F0();
  objc_msgSend(v3, "frame");
  v5 = v4;

  if (v5 <= v2)
  {
    v6 = OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint;
    v7 = *(_QWORD *)&v0[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint];
    if (v7)
    {
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint], "constant");
      v9 = v8;
    }
    else
    {
      v9 = 0.0;
    }
    objc_msgSend(v0, "availableContentViewHeight");
    if (v7)
      v11 = v9 == v10;
    else
      v11 = 0;
    if (!v11)
    {
      v12 = *(void **)&v0[v6];
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v0, "availableContentViewHeight");
        objc_msgSend(v13, "setConstant:");

      }
    }
  }
}

void sub_100006088()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  Class isa;
  void *v28;

  v1 = v0;
  v2 = objc_msgSend(v0, "buttonTray");
  v3 = sub_10000586C();
  objc_msgSend(v2, "addButton:", v3);

  v4 = objc_msgSend(v1, "contentView");
  v5 = sub_1000059F0();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = objc_msgSend(v1, "contentView");
  v7 = objc_msgSend(v6, "heightAnchor");

  v8 = sub_1000059F0();
  objc_msgSend(v8, "frame");
  v10 = v9;

  v11 = objc_msgSend(v7, "constraintEqualToConstant:", v10);
  v12 = (void *)objc_opt_self(NSLayoutConstraint);
  v13 = sub_1000056C0(&qword_100010DF8);
  v14 = swift_allocObject(v13, 56, 7);
  *(_OWORD *)(v14 + 16) = xmmword_10000A320;
  v15 = sub_1000059F0();
  v16 = objc_msgSend(v15, "centerXAnchor");

  v17 = objc_msgSend(v1, "contentView");
  v18 = objc_msgSend(v17, "centerXAnchor");

  v19 = objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  *(_QWORD *)(v14 + 32) = v19;
  v20 = sub_1000059F0();
  v21 = objc_msgSend(v20, "centerYAnchor");

  v22 = objc_msgSend(v1, "contentView");
  v23 = objc_msgSend(v22, "centerYAnchor");

  v24 = objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  *(_QWORD *)(v14 + 40) = v24;
  *(_QWORD *)(v14 + 48) = v11;
  specialized Array._endMutation()();
  v25 = v14;
  sub_100006900();
  v26 = v11;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  objc_msgSend(v12, "activateConstraints:", isa);

  v28 = *(void **)&v1[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint] = v26;

}

uint64_t sub_100006370()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[5];
  _BYTE v4[24];
  _BYTE v5[24];
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate, v4, 0, 0);
  sub_100006874(v1, (uint64_t)v5);
  if (!v6)
    return sub_10000693C((uint64_t)v5, (uint64_t *)&unk_100010F00);
  sub_1000068BC((uint64_t)v5, (uint64_t)v3);
  sub_10000693C((uint64_t)v5, (uint64_t *)&unk_100010F00);
  sub_100005700(v3, v3[3]);
  sub_100008CAC();
  return sub_100005724(v3);
}

id sub_100006444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  char *v12;
  char *v13;
  NSString v14;
  NSString v15;
  NSString v16;
  id v17;
  objc_super v19;

  v12 = &v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate];
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_QWORD *)v12 + 4) = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView] = 0;
  v13 = &v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint] = 0;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (!a4)
  {
    v15 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a6);
LABEL_6:
  v19.receiver = v7;
  v19.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  v17 = objc_msgSendSuper2(&v19, "initWithTitle:detailText:symbolName:contentLayout:", v14, v15, v16, a7);

  return v17;
}

id sub_100006618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  char *v6;
  char *v11;
  char *v12;
  NSString v13;
  NSString v14;
  id v15;
  objc_super v17;

  v11 = &v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate];
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_QWORD *)v11 + 4) = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___continueButton] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___sharePlayOnboardingImageView] = 0;
  v12 = &v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint] = 0;
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (a4)
  {
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    v14 = 0;
  }
  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  v15 = objc_msgSendSuper2(&v17, "initWithTitle:detailText:icon:contentLayout:", v13, v14, a5, a6);

  return v15;
}

id sub_1000067B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SharePlayWelcomeViewController()
{
  return objc_opt_self(_TtC18RemotePeoplePicker30SharePlayWelcomeViewController);
}

uint64_t sub_100006874(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000056C0((uint64_t *)&unk_100010F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000068BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006900()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010E00;
  if (!qword_100010E00)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100010E00);
  }
  return result;
}

uint64_t sub_10000693C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000056C0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *PeoplePickerShellViewController.connection.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection);
  swift_beginAccess(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void PeoplePickerShellViewController.connection.setter(void *a1)
{
  sub_100008DFC(a1);

}

void (*PeoplePickerShellViewController.connection.modify(_QWORD *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  return sub_100006A40;
}

void sub_100006A40(_QWORD *a1, char a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t ObjectType;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = (_QWORD *)*a1;
  swift_endAccess(*a1);
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      v5 = v4;
      v6 = XPCHostConnection.bundleIdentifier.getter();
      v8 = v7;

      v9 = objc_allocWithZone((Class)LSApplicationRecord);
      v10 = sub_100008BD4(v6, v8, 1);
      v19 = v10;
      if (v10)
      {
        v18 = sub_1000074A0();
        v21 = v20;
        ObjectType = swift_getObjectType(v18);
        v23 = objc_msgSend(v19, "localizedName");
        v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);
        v27 = v26;

        dispatch thunk of PeoplePickerViewControllerProtocol.appName.setter(v25, v27, ObjectType, v21);
      }
      else
      {
        v11 = static os_log_type_t.error.getter(0);
        v12 = sub_1000056C0(&qword_100010E18);
        v13 = swift_allocObject(v12, 72, 7);
        *(_OWORD *)(v13 + 16) = xmmword_10000A390;
        v14 = v5;
        v15 = XPCHostConnection.bundleIdentifier.getter();
        v17 = v16;

        *(_QWORD *)(v13 + 56) = &type metadata for String;
        *(_QWORD *)(v13 + 64) = sub_100008FF4();
        *(_QWORD *)(v13 + 32) = v15;
        *(_QWORD *)(v13 + 40) = v17;
        sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
        v18 = (id)static OS_os_log.default.getter();
        os_log(_:dso:log:type:_:)("Couldn't get applicationRecord for bundleID: %@", 47, 2, &_mh_execute_header, v18, v11, v13);
        swift_bridgeObjectRelease(v13);
      }

    }
  }
  free(v3);
}

uint64_t PeoplePickerShellViewController.extensionViewController.getter()
{
  uint64_t v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v3, 0, 0);
  return swift_unknownObjectRetain(*v1);
}

uint64_t PeoplePickerShellViewController.extensionViewController.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_unknownObjectRelease(v4);
}

void *PeoplePickerShellViewController.extensionViewController.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, a1, 33, 0);
  return &j__swift_endAccess;
}

void *PeoplePickerShellViewController.activity.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void PeoplePickerShellViewController.activity.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  _BYTE v16[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v16, 1, 0);
  v4 = *v3;
  *v3 = a1;
  v5 = a1;
  v6 = v5;
  if (a1)
  {
    if (v4)
    {
      sub_100009A2C(0, &qword_100010E40, TUConversationActivity_ptr);
      v7 = v6;
      v8 = v4;
      v9 = v7;
      v10 = static NSObject.== infix(_:_:)();

      if ((v10 & 1) != 0)
      {
        v4 = v9;
        v6 = v9;
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      v11 = v5;
    }
    v12 = sub_1000074A0();
    v14 = v13;
    ObjectType = swift_getObjectType(v12);
    v8 = v6;
    dispatch thunk of PeoplePickerViewControllerProtocol.stagedActivity.setter(a1, ObjectType, v14);

    v4 = v8;
    v6 = v12;
    goto LABEL_7;
  }
LABEL_8:

}

void (*PeoplePickerShellViewController.activity.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = (void **)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v3, 0, 0);
  v5 = *v4;
  v3[3] = *v4;
  v6 = v5;
  return sub_100006EDC;
}

void sub_100006EDC(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  id *v4;
  id v5;

  v2 = *(void **)a1;
  v4 = (id *)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  if ((a2 & 1) != 0)
  {
    v5 = v3;
    PeoplePickerShellViewController.activity.setter(v3);

  }
  else
  {
    PeoplePickerShellViewController.activity.setter(*(void **)(*(_QWORD *)a1 + 24));
  }
  free(v2);
}

Swift::Void __swiftcall PeoplePickerShellViewController.updateShareSheetRecipients(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v5;
  id v6;

  v6 = sub_1000074A0();
  v3 = v2;
  ObjectType = swift_getObjectType(v6);
  v5 = swift_bridgeObjectRetain(a1._rawValue);
  dispatch thunk of PeoplePickerViewControllerProtocol.initialRecipientDestinations.setter(v5, ObjectType, v3);

}

void sub_100006F90(void (*a1)(void *), uint64_t a2)
{
  uint64_t v2;
  void **v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  void (*v33)(uint64_t);
  _QWORD *v34;
  char v35[24];
  char v36[24];

  v5 = (void **)(v2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess(v2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v36, 0, 0);
  v6 = *v5;
  if (v6)
  {
    v7 = v6;
    v8 = static os_log_type_t.default.getter();
    v9 = sub_1000056C0(&qword_100010E18);
    v10 = swift_allocObject(v9, 72, 7);
    *(_OWORD *)(v10 + 16) = xmmword_10000A390;
    *(_QWORD *)(v10 + 56) = sub_100009A2C(0, &qword_100010E40, TUConversationActivity_ptr);
    *(_QWORD *)(v10 + 64) = sub_100009C0C();
    *(_QWORD *)(v10 + 32) = v7;
    sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
    v11 = v7;
    v12 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Not requesting activity, activity already provided activity: %@", 63, 2, &_mh_execute_header, v12, v8, v10);
    swift_bridgeObjectRelease(v10);

    v13 = v11;
    a1(v6);

  }
  else
  {
    v14 = (void **)(v2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    v15 = swift_beginAccess(v2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v35, 0, 0);
    v16 = *v14;
    if (v16)
    {
      v17 = (void *)objc_opt_self(NSTimer);
      v18 = swift_allocObject(&unk_10000C638, 24, 7);
      swift_unknownObjectWeakInit(v18 + 16, v2);
      v33 = sub_100009BD4;
      v34 = (_QWORD *)v18;
      v29 = _NSConcreteStackBlock;
      v30 = 1107296256;
      v31 = sub_100007358;
      v32 = &unk_10000C768;
      v19 = _Block_copy(&v29);
      v20 = v34;
      swift_unknownObjectRetain(v16);
      swift_release(v20);
      v21 = objc_msgSend(v17, "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, 1.0);
      _Block_release(v19);
      v22 = swift_allocObject(&unk_10000C638, 24, 7);
      swift_unknownObjectWeakInit(v22 + 16, v2);
      v23 = (_QWORD *)swift_allocObject(&unk_10000C7A0, 48, 7);
      v23[2] = v22;
      v23[3] = v21;
      v23[4] = a1;
      v23[5] = a2;
      v33 = (void (*)(uint64_t))sub_100009D18;
      v34 = v23;
      v29 = _NSConcreteStackBlock;
      v30 = 1107296256;
      v31 = sub_10000744C;
      v32 = &unk_10000C7B8;
      v24 = _Block_copy(&v29);
      v25 = v34;
      v26 = v21;
      swift_retain(a2);
      swift_release(v25);
      objc_msgSend(v16, "requestActivity:", v24);
      _Block_release(v24);
      swift_unknownObjectRelease(v16);

    }
    else
    {
      v27 = static os_log_type_t.error.getter(v15);
      sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
      v28 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)("No valid extensionViewController, can't populate activity", 57, 2, &_mh_execute_header, v28, v27, &_swiftEmptyArrayStorage);

      a1(0);
    }
  }
}

void sub_1000072F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  id v5;
  _BYTE v6[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = sub_1000078E0();
    objc_msgSend(v5, "startAnimating");

  }
}

void sub_100007358(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

void sub_1000073A8(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t))
{
  uint64_t v7;
  uint64_t Strong;
  void *v9;
  id v10;
  _BYTE v11[24];

  v7 = a2 + 16;
  swift_beginAccess(a2 + 16, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    objc_msgSend(a3, "invalidate");
    v10 = sub_1000078E0();
    objc_msgSend(v10, "stopAnimating");

    a4(a1);
  }
}

void sub_10000744C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

id sub_1000074A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void **v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  id v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _BYTE v23[24];

  v1 = type metadata accessor for PeoplePickerStyle(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  v5 = &v23[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = v0
     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController;
  v7 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController);
  if (v7)
  {
    v8 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController);
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, enum case for PeoplePickerStyle.sharePlay(_:), v1);
    v9 = (void **)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
    swift_beginAccess(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v23, 0, 0);
    v10 = *v9;
    v11 = v10;
    v12 = (void *)static PeoplePickerViewControllerProvider.makePeoplePickerViewController(style:existingAddresses:currentConversation:stagedActivity:setPreventsApplicationTerminationWhenModal:)(v5, 0, 0, v10, PeoplePickerShellViewController.peoplePickerRequestedUnknownContactPopover(for:sourceView:sourceRect:), 0);
    v14 = v13;

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    ObjectType = swift_getObjectType(v12);
    v16 = objc_msgSend(v12, "navigationItem");
    objc_msgSend(v16, "setHidesBackButton:", 1);

    v17 = sub_100009CD4();
    v18 = swift_unknownObjectRetain(v0);
    dispatch thunk of PeoplePickerViewControllerProtocol.delegate.setter(v18, v17, ObjectType, v14);
    v19 = *(void **)v6;
    *(_QWORD *)v6 = v12;
    *(_QWORD *)(v6 + 8) = v14;
    v8 = v12;

    v7 = 0;
  }
  v20 = v7;
  return v8;
}

char *sub_100007638()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  char *v8;
  _BYTE v10[24];
  _QWORD v11[5];

  v1 = v0;
  v2 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController;
  v3 = *(char **)&v0[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController];
  v4 = v3;
  if (v3 == (char *)1)
  {
    type metadata accessor for SharePlayWelcomeViewController();
    v4 = (char *)sub_100005C18();
    v11[3] = type metadata accessor for PeoplePickerShellViewController();
    v11[4] = &off_10000C5C8;
    v11[0] = v1;
    v5 = (uint64_t)&v4[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate];
    swift_beginAccess(&v4[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate], v10, 33, 0);
    v6 = v1;
    sub_1000099C4((uint64_t)v11, v5);
    swift_endAccess(v10);
    v7 = *(void **)&v1[v2];
    *(_QWORD *)&v1[v2] = v4;
    v8 = v4;
    sub_100009A0C(v7);
  }
  sub_100009A1C(v3);
  return v4;
}

id sub_100007708()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController);
  }
  else
  {
    v4 = sub_100007768();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_100007768()
{
  id v0;
  char v1;
  void *v2;
  void *v3;
  id v4;
  id result;
  void *v6;
  id v7;
  id v8;
  id v9;

  if (qword_100010CB0 != -1)
    swift_once(&qword_100010CB0, sub_1000054E8);
  v0 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v1 = sub_100005744(v0, 1u);

  if ((v1 & 1) == 0 || (v2 = sub_100007638()) == 0)
    v2 = sub_1000074A0();
  v3 = v2;
  v4 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v2);
  result = objc_msgSend(v4, "view");
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend((id)objc_opt_self(UIColor), "systemGreenColor");
    objc_msgSend(v6, "setTintColor:", v7);

    if ((v1 & 1) == 0)
    {
      v8 = objc_msgSend(v4, "navigationBar");
      v9 = objc_msgSend(v8, "standardAppearance");
      objc_msgSend(v8, "setScrollEdgeAppearance:", v9);

    }
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000078E0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_100007954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator;
  v2 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator);
  if (v2)
  {
    v3 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator);
  }
  else
  {
    v4 = v0;
    type metadata accessor for PeoplePickerCallCreator();
    v3 = PeoplePickerCallCreator.__allocating_init()();
    v5 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v4 + v1) = v3;
    swift_retain(v3);
    swift_release(v5);
    v2 = 0;
  }
  swift_retain(v2);
  return v3;
}

Swift::Void __swiftcall PeoplePickerShellViewController.viewDidLoad()()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v37.receiver = v0;
  v37.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  objc_msgSendSuper2(&v37, "viewDidLoad");
  v1 = sub_100007708();
  v2 = objc_msgSend(v1, "view");

  if (!v2)
  {
    __break(1u);
    goto LABEL_11;
  }
  v3 = objc_msgSend(v0, "view");
  if (!v3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v4 = v3;
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v2, "setFrame:", v6, v8, v10, v12);
  v13 = sub_100007708();
  v14 = objc_msgSend(v13, "view");

  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  objc_msgSend(v14, "setAutoresizingMask:", 18);

  v15 = sub_100007708();
  objc_msgSend(v0, "addChildViewController:", v15);

  v16 = objc_msgSend(v0, "view");
  if (!v16)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v17 = v16;
  v18 = sub_100007708();
  v19 = objc_msgSend(v18, "view");

  if (!v19)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v17, "addSubview:", v19);

  v20 = sub_100007708();
  objc_msgSend(v20, "didMoveToParentViewController:", v0);

  v21 = sub_1000078E0();
  v22 = objc_msgSend(v0, "view");
  if (!v22)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v23 = v22;
  objc_msgSend(v22, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  objc_msgSend(v21, "setFrame:", v25, v27, v29, v31);
  v32 = sub_100007708();
  v33 = objc_msgSend(v32, "view");

  if (!v33)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  objc_msgSend(v33, "setAutoresizingMask:", 18);

  v34 = sub_100007708();
  v35 = objc_msgSend(v34, "view");

  if (v35)
  {
    v36 = sub_1000078E0();
    objc_msgSend(v35, "addSubview:", v36);

    return;
  }
LABEL_17:
  __break(1u);
}

id PeoplePickerShellViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithNibName:bundle:", v7, a3);

  return v8;
}

id PeoplePickerShellViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v5;
  NSString v7;
  id v8;
  objc_super v10;

  *(_QWORD *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity] = 0;
  v5 = &v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController] = 1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator] = 0;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id PeoplePickerShellViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id PeoplePickerShellViewController.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity] = 0;
  v3 = &v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

id PeoplePickerShellViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeoplePickerShellViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *sub_100008040(uint64_t a1, uint64_t a2)
{
  return sub_1000080FC(a1, a2, &OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection);
}

void sub_10000804C(void *a1)
{
  sub_100008DFC(a1);

}

void (*sub_10000807C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = PeoplePickerShellViewController.connection.modify(v2);
  return sub_1000080C4;
}

void sub_1000080C4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void *sub_1000080F0(uint64_t a1, uint64_t a2)
{
  return sub_1000080FC(a1, a2, &OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
}

void *sub_1000080FC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;
  _BYTE v8[24];

  v4 = (void **)(*v3 + *a3);
  swift_beginAccess(v4, v8, 0, 0);
  v5 = *v4;
  v6 = v5;
  return v5;
}

void sub_100008148(void *a1)
{
  PeoplePickerShellViewController.activity.setter(a1);
}

void (*sub_100008168(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = *v1;
  v3[4] = *v1;
  v5 = (void **)(v4 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess(v4 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v3, 0, 0);
  v6 = *v5;
  v3[3] = *v5;
  v7 = v6;
  return sub_100006EDC;
}

uint64_t sub_1000081E0()
{
  _QWORD *v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(*v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(v1, v3, 0, 0);
  return swift_unknownObjectRetain(*v1);
}

uint64_t sub_10000822C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(*v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_unknownObjectRelease(v4);
}

void *sub_100008280(uint64_t a1)
{
  _QWORD *v1;

  swift_beginAccess(*v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, a1, 33, 0);
  return &j_j__swift_endAccess;
}

void sub_1000082C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v5;
  id v6;

  v6 = sub_1000074A0();
  v3 = v2;
  ObjectType = swift_getObjectType(v6);
  v5 = swift_bridgeObjectRetain(a1);
  dispatch thunk of PeoplePickerViewControllerProtocol.initialRecipientDestinations.setter(v5, ObjectType, v3);

}

Swift::Void __swiftcall PeoplePickerShellViewController.peoplePickerCancelled()()
{
  uint64_t v0;
  id *v1;
  _BYTE v2[24];

  v1 = (id *)(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(v0 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v2, 0, 0);
  if (*v1)
    objc_msgSend(*v1, "dismissViewControllerWithSuccess:", 0);
}

uint64_t PeoplePickerShellViewController.peoplePickerInvited(_:withVideo:button:senderIdentity:messagesGroup:)(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v20;

  v10 = sub_1000056C0(&qword_100010E70);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v10, v13);
  sub_100009058(a5, (uint64_t)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(unsigned __int8 *)(v11 + 80);
  v15 = (v14 + 48) & ~v14;
  v16 = swift_allocObject(&unk_10000C5B0, v15 + v12, v14 | 7);
  *(_QWORD *)(v16 + 16) = v5;
  *(_QWORD *)(v16 + 24) = a1;
  *(_BYTE *)(v16 + 32) = a2;
  *(_QWORD *)(v16 + 40) = a4;
  sub_1000090A4((uint64_t)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  v17 = a4;
  v18 = v5;
  swift_bridgeObjectRetain(a1);
  sub_100006F90((void (*)(void *))sub_1000090EC, v16);
  return swift_release(v16);
}

id sub_100008470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  id *v13;
  id result;
  _BYTE v15[24];

  v12 = sub_100007954();
  dispatch thunk of PeoplePickerCallCreator.invitePeople(_:withVideo:senderIdentity:activity:messagesGroup:)(a3, a4, a5, a1, a6);
  swift_release(v12);
  v13 = (id *)(a2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(a2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v15, 0, 0);
  result = *v13;
  if (*v13)
    return objc_msgSend(result, "dismissViewControllerWithSuccess:", 1);
  return result;
}

Swift::Void __swiftcall PeoplePickerShellViewController.peoplePickerRequestedMessageController(with:chatGUID:)(Swift::OpaquePointer with, Swift::String_optional chatGUID)
{
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  id v6;

  object = chatGUID.value._object;
  countAndFlagsBits = chatGUID.value._countAndFlagsBits;
  swift_bridgeObjectRetain(chatGUID.value._object);
  swift_bridgeObjectRetain(with._rawValue);
  v6 = v2;
  sub_1000090F0((uint64_t)v6, (uint64_t)with._rawValue, v6, countAndFlagsBits, object);
  swift_bridgeObjectRelease(with._rawValue);

  swift_bridgeObjectRelease(object);
}

void sub_10000858C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, NSString a5)
{
  Class isa;
  id v9;

  v9 = objc_msgSend(objc_allocWithZone((Class)MFMessageComposeViewController), "init");
  if (a1)
    objc_msgSend(v9, "insertGroupActivity:", a1);
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v9, "setRecipients:", isa);

  objc_msgSend(v9, "_setCanEditRecipients:", 0);
  objc_msgSend(v9, "setMessageComposeDelegate:", a3);
  if (a5)
    a5 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "setChatGUID:", a5);

  objc_msgSend(v9, "setModalTransitionStyle:", 2);
  objc_msgSend(v9, "setPreferredPresentationStyle:", 3);
  objc_msgSend(a3, "presentViewController:animated:completion:", v9, 1, 0);

}

id PeoplePickerShellViewController.peoplePickerRequestedDialCall(using:video:contact:handle:senderIdentity:ttyType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v14;
  id *v15;
  id result;
  _BYTE v17[24];

  v7 = v6;
  v14 = sub_100007954();
  dispatch thunk of PeoplePickerCallCreator.dialCall(provider:video:contact:handle:senderIdentity:ttyType:)(a1, a2, a3, a4, a5, a6);
  swift_release(v14);
  v15 = (id *)(v7 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(v15, v17, 0, 0);
  result = *v15;
  if (*v15)
    return objc_msgSend(result, "dismissViewControllerWithSuccess:", 1);
  return result;
}

uint64_t PeoplePickerShellViewController.peoplePickerSentInvitation(with:facetimeUnavailablePeople:facetimeAvailablePeople:shouldAddOtherInvitedToRemoteMembers:)(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  void *v4;
  id v9;
  id v10;

  v9 = v4;
  v10 = a1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_100009504((uint64_t)v9, v9, v10, a2, a3, a4);

  swift_bridgeObjectRelease(a2);
  return swift_bridgeObjectRelease(a3);
}

id sub_10000880C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  id *v13;
  id result;
  _BYTE v15[24];

  v12 = sub_100007954();
  dispatch thunk of PeoplePickerCallCreator.createCallWithLink(_:facetimeUnavailablePeople:facetimeAvailablePeople:shouldAddOtherInvitedToRemoteMembers:activity:)(a3, a4, a5, a6, a1);
  swift_release(v12);
  v13 = (id *)(a2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
  swift_beginAccess(a2 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v15, 0, 0);
  result = *v13;
  if (*v13)
    return objc_msgSend(result, "dismissViewControllerWithSuccess:", 1);
  return result;
}

uint64_t sub_1000088C8(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v20;

  v10 = sub_1000056C0(&qword_100010E70);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v10, v13);
  sub_100009058(a5, (uint64_t)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(unsigned __int8 *)(v11 + 80);
  v15 = (v14 + 48) & ~v14;
  v16 = swift_allocObject(&unk_10000C5E8, v15 + v12, v14 | 7);
  *(_QWORD *)(v16 + 16) = v5;
  *(_QWORD *)(v16 + 24) = a1;
  *(_BYTE *)(v16 + 32) = a2;
  *(_QWORD *)(v16 + 40) = a4;
  sub_1000090A4((uint64_t)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  v17 = a4;
  v18 = v5;
  swift_bridgeObjectRetain(a1);
  sub_100006F90((void (*)(void *))sub_1000090EC, v16);
  return swift_release(v16);
}

id PeoplePickerShellViewController.messageComposeViewController(_:didFinishWith:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;
  id result;
  void *v16;
  _QWORD v17[3];

  v3 = v2;
  v6 = static os_log_type_t.default.getter();
  if (a2)
  {
    v7 = sub_1000056C0(&qword_100010E18);
    v8 = swift_allocObject(v7, 72, 7);
    *(_OWORD *)(v8 + 16) = xmmword_10000A390;
    v17[0] = a2;
    type metadata accessor for MessageComposeResult();
    v10 = String.init<A>(reflecting:)(v17, v9);
    v12 = v11;
    *(_QWORD *)(v8 + 56) = &type metadata for String;
    *(_QWORD *)(v8 + 64) = sub_100008FF4();
    *(_QWORD *)(v8 + 32) = v10;
    *(_QWORD *)(v8 + 40) = v12;
    sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
    v13 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Dismissing viewController because we received result: %@", 56, 2, &_mh_execute_header, v13, v6, v8);
    swift_bridgeObjectRelease(v8);

    v14 = (id *)(v3 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    swift_beginAccess(v3 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v17, 0, 0);
    result = *v14;
    if (*v14)
      return objc_msgSend(result, "dismissViewControllerWithSuccess:", a2 == 1);
  }
  else
  {
    sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
    v16 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Not dismissing ViewController because user cancelled Messages compose view", 74, 2, &_mh_execute_header, v16, v6, &_swiftEmptyArrayStorage);

    return objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  return result;
}

id sub_100008BD4(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, a3 & 1, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

void sub_100008CAC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;
  void *v8;
  id v9;
  id v10;
  id v11;

  v1 = v0;
  v2 = objc_autoreleasePoolPush();
  v3 = sub_100007708();
  v4 = sub_1000056C0(&qword_100010DF8);
  v5 = swift_allocObject(v4, 40, 7);
  *(_OWORD *)(v5 + 16) = xmmword_10000A3A0;
  *(_QWORD *)(v5 + 32) = sub_1000074A0();
  specialized Array._endMutation()();
  v6 = v5;
  sub_100009A2C(0, &qword_100010F10, UIViewController_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v3, "setViewControllers:animated:", isa, 1);

  v8 = *(void **)(v1
                + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController) = 0;
  sub_100009A0C(v8);
  objc_autoreleasePoolPop(v2);
  v9 = sub_100007708();
  v10 = objc_msgSend(v9, "navigationBar");

  v11 = objc_msgSend(v10, "standardAppearance");
  objc_msgSend(v10, "setScrollEdgeAppearance:", v11);

}

void sub_100008DFC(void *a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t ObjectType;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[24];

  v3 = (id *)(v1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection);
  swift_beginAccess(v3, v29, 1, 0);
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  if (*v3)
  {
    v6 = *v3;
    v7 = XPCHostConnection.bundleIdentifier.getter();
    v9 = v8;

    v10 = objc_allocWithZone((Class)LSApplicationRecord);
    v11 = sub_100008BD4(v7, v9, 1);
    v20 = v11;
    if (v11)
    {
      v19 = sub_1000074A0();
      v22 = v21;
      ObjectType = swift_getObjectType(v19);
      v24 = objc_msgSend(v20, "localizedName");
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);
      v28 = v27;

      dispatch thunk of PeoplePickerViewControllerProtocol.appName.setter(v26, v28, ObjectType, v22);
    }
    else
    {
      v12 = static os_log_type_t.error.getter(0);
      v13 = sub_1000056C0(&qword_100010E18);
      v14 = swift_allocObject(v13, 72, 7);
      *(_OWORD *)(v14 + 16) = xmmword_10000A390;
      v15 = v6;
      v16 = XPCHostConnection.bundleIdentifier.getter();
      v18 = v17;

      *(_QWORD *)(v14 + 56) = &type metadata for String;
      *(_QWORD *)(v14 + 64) = sub_100008FF4();
      *(_QWORD *)(v14 + 32) = v16;
      *(_QWORD *)(v14 + 40) = v18;
      sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
      v19 = (id)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)("Couldn't get applicationRecord for bundleID: %@", 47, 2, &_mh_execute_header, v19, v12, v14);

      swift_bridgeObjectRelease(v14);
    }

  }
}

unint64_t sub_100008FF4()
{
  unint64_t result;

  result = qword_100010E20;
  if (!qword_100010E20)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010E20);
  }
  return result;
}

uint64_t type metadata accessor for PeoplePickerShellViewController()
{
  return objc_opt_self(_TtC18RemotePeoplePicker31PeoplePickerShellViewController);
}

uint64_t sub_100009058(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000056C0(&qword_100010E70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000090A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000056C0(&qword_100010E70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1000090F0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  _QWORD *v10;
  void **v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void **v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  _QWORD *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void **aBlock;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  void (*v41)(uint64_t);
  _QWORD *v42;
  char v43[24];
  char v44[24];

  v10 = (_QWORD *)swift_allocObject(&unk_10000C6D8, 48, 7);
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = a4;
  v10[5] = a5;
  v11 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v44, 0, 0);
  v12 = *v11;
  if (*v11)
  {
    swift_bridgeObjectRetain(a5);
    v13 = v12;
    swift_bridgeObjectRetain(a2);
    v36 = a3;
    v14 = static os_log_type_t.default.getter();
    v15 = sub_1000056C0(&qword_100010E18);
    v16 = swift_allocObject(v15, 72, 7);
    *(_OWORD *)(v16 + 16) = xmmword_10000A390;
    *(_QWORD *)(v16 + 56) = sub_100009A2C(0, &qword_100010E40, TUConversationActivity_ptr);
    *(_QWORD *)(v16 + 64) = sub_100009C0C();
    *(_QWORD *)(v16 + 32) = v13;
    sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
    v17 = v13;
    v18 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Not requesting activity, activity already provided activity: %@", 63, 2, &_mh_execute_header, v18, v14, v16);
    swift_bridgeObjectRelease(v16);

    v19 = v17;
    sub_10000858C((uint64_t)v12, a2, v36, a4, a5);
    swift_release(v10);

  }
  else
  {
    v20 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    swift_beginAccess(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v43, 0, 0);
    v21 = *v20;
    if (v21)
    {
      v22 = (void *)objc_opt_self(NSTimer);
      v23 = swift_allocObject(&unk_10000C638, 24, 7);
      swift_unknownObjectWeakInit(v23 + 16, a1);
      v41 = sub_100009BD4;
      v42 = (_QWORD *)v23;
      aBlock = _NSConcreteStackBlock;
      v38 = 1107296256;
      v39 = sub_100007358;
      v40 = &unk_10000C6F0;
      v24 = _Block_copy(&aBlock);
      v25 = v42;
      swift_bridgeObjectRetain(a5);
      swift_unknownObjectRetain(v21);
      swift_bridgeObjectRetain(a2);
      v26 = a3;
      swift_release(v25);
      v27 = objc_msgSend(v22, "scheduledTimerWithTimeInterval:repeats:block:", 0, v24, 1.0);
      _Block_release(v24);
      v28 = swift_allocObject(&unk_10000C638, 24, 7);
      swift_unknownObjectWeakInit(v28 + 16, a1);
      v29 = (_QWORD *)swift_allocObject(&unk_10000C728, 48, 7);
      v29[2] = v28;
      v29[3] = v27;
      v29[4] = sub_100009C70;
      v29[5] = v10;
      v41 = (void (*)(uint64_t))sub_100009D18;
      v42 = v29;
      aBlock = _NSConcreteStackBlock;
      v38 = 1107296256;
      v39 = sub_10000744C;
      v40 = &unk_10000C740;
      v30 = _Block_copy(&aBlock);
      v31 = v42;
      v32 = v27;
      swift_retain(v10);
      swift_release(v31);
      objc_msgSend(v21, "requestActivity:", v30);
      _Block_release(v30);
      swift_release(v10);
      swift_unknownObjectRelease(v21);

    }
    else
    {
      swift_bridgeObjectRetain(a5);
      swift_bridgeObjectRetain(a2);
      v33 = a3;
      v34 = static os_log_type_t.error.getter(v33);
      sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
      v35 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)("No valid extensionViewController, can't populate activity", 57, 2, &_mh_execute_header, v35, v34, &_swiftEmptyArrayStorage);

      sub_10000858C(0, a2, v33, a4, a5);
      swift_release(v10);
    }
  }
}

void sub_100009504(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12;
  void **v13;
  void *v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id *v24;
  void **v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  _QWORD *v37;
  id v38;
  char *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id *v45;
  id v46;
  void **aBlock;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  void (*v51)(uint64_t);
  _QWORD *v52;
  char v53[24];
  char v54[24];

  v12 = swift_allocObject(&unk_10000C610, 49, 7);
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  *(_QWORD *)(v12 + 32) = a4;
  *(_QWORD *)(v12 + 40) = a5;
  *(_BYTE *)(v12 + 48) = a6;
  v13 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity);
  swift_beginAccess(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity, v54, 0, 0);
  v14 = *v13;
  if (*v13)
  {
    v15 = a2;
    v46 = a3;
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRetain(a5);
    v16 = v14;
    v17 = static os_log_type_t.default.getter();
    v18 = sub_1000056C0(&qword_100010E18);
    v19 = swift_allocObject(v18, 72, 7);
    *(_OWORD *)(v19 + 16) = xmmword_10000A390;
    *(_QWORD *)(v19 + 56) = sub_100009A2C(0, &qword_100010E40, TUConversationActivity_ptr);
    *(_QWORD *)(v19 + 64) = sub_100009C0C();
    *(_QWORD *)(v19 + 32) = v16;
    sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
    v20 = v16;
    v21 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Not requesting activity, activity already provided activity: %@", 63, 2, &_mh_execute_header, v21, v17, v19);
    swift_bridgeObjectRelease(v19);

    v22 = v20;
    v23 = sub_100007954();
    dispatch thunk of PeoplePickerCallCreator.createCallWithLink(_:facetimeUnavailablePeople:facetimeAvailablePeople:shouldAddOtherInvitedToRemoteMembers:activity:)(v46, a4, a5, a6 & 1, v14);
    swift_release(v23);
    v24 = (id *)&v15[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController];
    swift_beginAccess(&v15[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController], &aBlock, 0, 0);
    if (*v24)
      objc_msgSend(*v24, "dismissViewControllerWithSuccess:", 1);
    swift_release(v12);

  }
  else
  {
    v25 = (void **)(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController);
    swift_beginAccess(a1 + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController, v53, 0, 0);
    v26 = *v25;
    if (v26)
    {
      v27 = (void *)objc_opt_self(NSTimer);
      v28 = swift_allocObject(&unk_10000C638, 24, 7);
      swift_unknownObjectWeakInit(v28 + 16, a1);
      v51 = sub_100009BD4;
      v52 = (_QWORD *)v28;
      aBlock = _NSConcreteStackBlock;
      v48 = 1107296256;
      v49 = sub_100007358;
      v50 = &unk_10000C650;
      v29 = _Block_copy(&aBlock);
      v30 = v52;
      v31 = a2;
      v32 = a3;
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRetain(a5);
      swift_unknownObjectRetain(v26);
      swift_release(v30);
      v33 = objc_msgSend(v27, "scheduledTimerWithTimeInterval:repeats:block:", 0, v29, 1.0);
      _Block_release(v29);
      v34 = swift_allocObject(&unk_10000C638, 24, 7);
      swift_unknownObjectWeakInit(v34 + 16, a1);
      v35 = (_QWORD *)swift_allocObject(&unk_10000C688, 48, 7);
      v35[2] = v34;
      v35[3] = v33;
      v35[4] = sub_100009BA0;
      v35[5] = v12;
      v51 = sub_100009C00;
      v52 = v35;
      aBlock = _NSConcreteStackBlock;
      v48 = 1107296256;
      v49 = sub_10000744C;
      v50 = &unk_10000C6A0;
      v36 = _Block_copy(&aBlock);
      v37 = v52;
      v38 = v33;
      swift_retain(v12);
      swift_release(v37);
      objc_msgSend(v26, "requestActivity:", v36);
      _Block_release(v36);
      swift_release(v12);
      swift_unknownObjectRelease(v26);

    }
    else
    {
      v39 = a2;
      v40 = a3;
      swift_bridgeObjectRetain(a4);
      v41 = swift_bridgeObjectRetain(a5);
      v42 = static os_log_type_t.error.getter(v41);
      sub_100009A2C(0, &qword_100010E28, OS_os_log_ptr);
      v43 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)("No valid extensionViewController, can't populate activity", 57, 2, &_mh_execute_header, v43, v42, &_swiftEmptyArrayStorage);

      v44 = sub_100007954();
      dispatch thunk of PeoplePickerCallCreator.createCallWithLink(_:facetimeUnavailablePeople:facetimeAvailablePeople:shouldAddOtherInvitedToRemoteMembers:activity:)(v40, a4, a5, a6 & 1, 0);
      swift_release(v44);
      v45 = (id *)&v39[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController];
      swift_beginAccess(&v39[OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController], &aBlock, 0, 0);
      if (*v45)
        objc_msgSend(*v45, "dismissViewControllerWithSuccess:", 1);
      swift_release(v12);
    }
  }
}

uint64_t sub_1000099C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000056C0((uint64_t *)&unk_100010F00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100009A0C(id a1)
{
  if (a1 != (id)1)

}

id sub_100009A1C(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_100009A2C(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100009A68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(sub_1000056C0(&qword_100010E70) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 48) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  v5 = type metadata accessor for MessagesGroup(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

id sub_100009B18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000056C0(&qword_100010E70) - 8) + 80);
  return sub_100008470(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40), v1 + ((v3 + 48) & ~v3));
}

uint64_t sub_100009B64()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 49, 7);
}

id sub_100009BA0(uint64_t a1)
{
  uint64_t v1;

  return sub_10000880C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(unsigned __int8 *)(v1 + 48));
}

uint64_t sub_100009BB0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100009BD4(uint64_t a1)
{
  uint64_t v1;

  sub_1000072F4(a1, v1);
}

uint64_t sub_100009BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009BEC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100009BF4()
{
  return sub_100009C94((void (*)(_QWORD))&_swift_release);
}

void sub_100009C00(uint64_t a1)
{
  uint64_t v1;

  sub_1000073A8(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

unint64_t sub_100009C0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010F18;
  if (!qword_100010F18)
  {
    v1 = sub_100009A2C(255, &qword_100010E40, TUConversationActivity_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100010F18);
  }
  return result;
}

uint64_t sub_100009C64()
{
  return sub_100009C94((void (*)(_QWORD))&_swift_bridgeObjectRelease);
}

void sub_100009C70(uint64_t a1)
{
  uint64_t v1;

  sub_10000858C(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(NSString *)(v1 + 40));
}

uint64_t sub_100009C7C()
{
  return sub_100009C94((void (*)(_QWORD))&_swift_release);
}

uint64_t sub_100009C88()
{
  return sub_100009C94((void (*)(_QWORD))&_swift_release);
}

uint64_t sub_100009C94(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));

  a1(*(_QWORD *)(v1 + 40));
  return swift_deallocObject(v1, 48, 7);
}

unint64_t sub_100009CD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010F20;
  if (!qword_100010F20)
  {
    v1 = type metadata accessor for PeoplePickerShellViewController();
    result = swift_getWitnessTable(&protocol conformance descriptor for PeoplePickerShellViewController, v1);
    atomic_store(result, (unint64_t *)&qword_100010F20);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC18RemotePeoplePickerP33_30DBC6890B147DEDAC135D034E0A2B6A19ResourceBundleClass);
}
