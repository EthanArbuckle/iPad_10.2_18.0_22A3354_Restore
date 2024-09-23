@implementation AccountPageViewControllerDelegate

- (_TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate)init
{
  _TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate *v2;
  void *v3;
  _TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountPageViewControllerDelegate();
  v2 = -[AccountPageViewControllerDelegate init](&v6, "init");
  v3 = *(Class *)((char *)&v2->super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&v2->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference) = (Class)v2;
  v4 = v2;

  return v4;
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  uint64_t v5;
  void *v6;
  _TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate *v7;
  id v8;
  _QWORD v9[6];

  v5 = swift_allocObject(&unk_1007513B0, 24, 7);
  *(_QWORD *)(v5 + 16) = self;
  v9[4] = sub_1003CAA74;
  v9[5] = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000924A0;
  v9[3] = &unk_1007513C8;
  v6 = _Block_copy(v9);
  v7 = self;
  v8 = a3;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v6, swift_release().n128_f64[0]);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  v2 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference) = 0;
  v3 = v2;
  if (v2)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced())
        break;
      v4 = *(char **)&v6[OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference];
      v5 = v4;

      v3 = v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:

}

@end
