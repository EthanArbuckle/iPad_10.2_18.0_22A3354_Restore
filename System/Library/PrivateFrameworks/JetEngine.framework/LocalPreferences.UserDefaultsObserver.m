@implementation LocalPreferences.UserDefaultsObserver

- (_TtCC9JetEngine16LocalPreferences20UserDefaultsObserver)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LocalPreferences.UserDefaultsObserver init](&v5, sel_init);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtCC9JetEngine16LocalPreferences20UserDefaultsObserver *v13;
  uint64_t v14;
  id v15;
  _TtCC9JetEngine16LocalPreferences20UserDefaultsObserver *v16;
  _OWORD v17[2];

  if (a3)
  {
    v9 = sub_19CFDF578();
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v17, 0, sizeof(v17));
    v15 = a5;
    v16 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_19CFE004C();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_19CDB9AF8();
  v14 = sub_19CFDF3C8();

LABEL_8:
  sub_19CDB99C4(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19CD3F190((uint64_t)v17);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
