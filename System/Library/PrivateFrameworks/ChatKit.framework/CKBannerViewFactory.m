@implementation CKBannerViewFactory

+ (id)bannerWithTitle:(id)a3 subtitleString:(id)a4 avatarImages:(id)a5 contacts:(id)a6 customImage:(id)a7 actionButtonObjects:(id)a8 forceImageCentering:(BOOL)a9 xButtonHandler:(id)aBlock
{
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v23;

  v15 = _Block_copy(aBlock);
  if (a3)
  {
    v16 = sub_18E768984();
    a3 = v17;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    if (a4)
    {
LABEL_3:
      v18 = sub_18E768984();
      a4 = v19;
      if (!a5)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v18 = 0;
  if (a5)
  {
LABEL_4:
    sub_18E00F31C(0, &qword_1EE10EB10);
    a5 = (id)sub_18E768AE0();
  }
LABEL_5:
  if (a6)
  {
    sub_18E00F31C(0, (unint64_t *)&qword_1EE0F50C0);
    a6 = (id)sub_18E768AE0();
  }
  v20 = a7;
  sub_18E00F31C(0, (unint64_t *)&unk_1EE0F4740);
  v21 = sub_18E768AE0();
  if (v15)
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v15;
    v15 = sub_18E5228F4;
  }
  else
  {
    v22 = 0;
  }
  v23 = sub_18E5A5430(v16, (uint64_t)a3, v18, (uint64_t)a4, 1, (uint64_t)a5, (unint64_t)a6, v20, 0, v21, a9, (uint64_t)v15, v22);
  sub_18E011A40((uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v23;
}

+ (id)unexpectedlyLoggedOutBanner
{
  return sub_18E5A60F4();
}

+ (id)updateAppleIDSettingsBanner
{
  return sub_18E5A670C();
}

+ (id)waitingForCloudBanner
{
  return sub_18E5A6BE4();
}

- (_TtC7ChatKit19CKBannerViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKBannerViewFactory();
  return -[CKBannerViewFactory init](&v3, sel_init);
}

@end
