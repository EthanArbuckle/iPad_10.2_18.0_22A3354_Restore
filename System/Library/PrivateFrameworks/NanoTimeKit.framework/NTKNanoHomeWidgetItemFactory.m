@implementation NTKNanoHomeWidgetItemFactory

+ (id)currentLocationEnergyWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t (*v9)(uint64_t);
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = sub_1B752FDB4();
  v7 = v6;
  v8 = (objc_class *)sub_1B752FC4C();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D514B0];
  v10 = objc_msgSend(objc_allocWithZone(v8), sel_init);
  sub_1B752FC10();
  v11 = sub_1B752FBEC();
  v13 = v12;
  sub_1B752FCB8();
  v14 = sub_1B752FC94();
  v16 = sub_1B751AB6C(v10, v11, v13, v14, v15, a3, v5, v7, v9, &qword_1EF171E00, MEMORY[0x1E0D514A0]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

+ (id)homeSpecificEnergyWidgetItemWithEnergyIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;

  v7 = sub_1B752FDB4();
  v9 = v8;
  v10 = a3;
  sub_1B752FC40();
  if (v11)
  {
    sub_1B752FCB8();
    v12 = sub_1B752FC88();
    v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B752FCB8();
    v12 = sub_1B752FC94();
    v14 = v15;
  }
  sub_1B752FC10();
  v16 = v10;
  v17 = sub_1B752FBEC();
  v19 = sub_1B751AB6C(v16, v17, v18, v12, v14, a4, v7, v9, (uint64_t (*)(uint64_t))MEMORY[0x1E0D514B0], &qword_1EF171E00, MEMORY[0x1E0D514A0]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

+ (id)electricityUsageWidgetItemWithUsageIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;

  v7 = sub_1B752FDB4();
  v9 = v8;
  v10 = a3;
  sub_1B752FCDC();
  if (v11)
  {
    sub_1B752FCB8();
    v12 = sub_1B752FCAC();
    v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B752FCB8();
    v12 = sub_1B752FC7C();
    v14 = v15;
  }
  sub_1B752FC10();
  v16 = v10;
  v17 = sub_1B752FBE0();
  v19 = sub_1B751AB6C(v16, v17, v18, v12, v14, a4, v7, v9, (uint64_t (*)(uint64_t))MEMORY[0x1E0D51528], &qword_1EF171DF8, MEMORY[0x1E0D51518]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

+ (id)electricityRatesWidgetItemWithRatesIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;

  v7 = sub_1B752FDB4();
  v9 = v8;
  v10 = a3;
  sub_1B752FCC4();
  if (v11)
  {
    sub_1B752FCB8();
    v12 = sub_1B752FCA0();
    v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B752FCB8();
    v12 = sub_1B752FC70();
    v14 = v15;
  }
  sub_1B752FC10();
  v16 = v10;
  v17 = sub_1B752FBD4();
  v19 = sub_1B751AB6C(v16, v17, v18, v12, v14, a4, v7, v9, (uint64_t (*)(uint64_t))MEMORY[0x1E0D51510], &qword_1EF171DF0, MEMORY[0x1E0D51500]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

+ (id)smartStackWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t (*v9)(uint64_t);
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = sub_1B752FDB4();
  v7 = v6;
  v8 = (objc_class *)sub_1B752FD18();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D51570];
  v10 = objc_msgSend(objc_allocWithZone(v8), sel_init);
  sub_1B752FC10();
  v11 = sub_1B752FBC8();
  v13 = v12;
  sub_1B752FCB8();
  v14 = sub_1B752FC64();
  v16 = sub_1B751AB6C(v10, v11, v13, v14, v15, a3, v5, v7, v9, &qword_1EF171DE8, MEMORY[0x1E0D51568]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

+ (id)accessoryWidgetItemWithAccessoryIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v7 = sub_1B752FDB4();
  v9 = v8;
  sub_1B752FC10();
  v10 = a3;
  v11 = sub_1B752FC04();
  v13 = v12;
  v14 = sub_1B752FB8C();
  v16 = sub_1B751AB6C(v10, v11, v13, v14, v15, a4, v7, v9, (uint64_t (*)(uint64_t))MEMORY[0x1E0D51428], &qword_1EF171DE0, MEMORY[0x1E0D51418]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

+ (id)sceneWidgetItemWithSceneIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v7 = sub_1B752FDB4();
  v9 = v8;
  sub_1B752FC10();
  v10 = a3;
  v11 = sub_1B752FBBC();
  v13 = v12;
  v14 = sub_1B752FBA4();
  v16 = sub_1B751AB6C(v10, v11, v13, v14, v15, a4, v7, v9, (uint64_t (*)(uint64_t))MEMORY[0x1E0D51440], &qword_1EF171DD8, MEMORY[0x1E0D51430]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

+ (id)launcherWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  id v5;

  sub_1B752FDB4();
  v5 = _s11NanoTimeKit28NTKNanoHomeWidgetItemFactoryC08launcherfG018complicationFamily17sectionIdentifierSo07NTKHomefG0CSgSo015CLKComplicationK0V_SStFZ_0(a3);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[NTKNanoHomeWidgetItemFactory init](&v3, sel_init);
}

@end
