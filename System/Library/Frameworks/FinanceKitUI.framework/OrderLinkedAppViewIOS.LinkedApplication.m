@implementation OrderLinkedAppViewIOS.LinkedApplication

- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4 launchURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication *v15;
  uint64_t v16;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D3180);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_2339D213C();
    v12 = sub_2339D21A8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_2339D21A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  v15 = self;
  sub_2338B4EDC((uint64_t)a3, a4, (uint64_t)v11);

  sub_23371BA60((uint64_t)v11, &qword_2560D3180);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithPass:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OrderLinkedAppViewIOS.LinkedApplication();
  return -[PKLinkedApplication initWithPass:](&v5, sel_initWithPass_, a3);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithStoreIDs:(id)a3 defaultLaunchURL:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D3180);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23374776C(0, &qword_2560D2D80);
    a3 = (id)sub_2339D4434();
  }
  if (a4)
  {
    sub_2339D213C();
    v9 = sub_2339D21A8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_2339D21A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication *)sub_2338B5168((uint64_t)a3, (uint64_t)v8);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D3180);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23374776C(0, &qword_2560D2D80);
    a3 = (id)sub_2339D4434();
  }
  if (a4)
    a4 = (id)sub_2339D4434();
  if (a5)
  {
    sub_2339D213C();
    v11 = sub_2339D21A8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_2339D21A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  return (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication *)sub_2338B53C4((uint64_t)a3, (uint64_t)a4, (uint64_t)v10);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)initWithApplicationIdentifiers:(id)a3 storeIDs:(id)a4 defaultLaunchURL:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D3180);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_2339D4434();
  if (a4)
  {
    sub_23374776C(0, &qword_2560D2D80);
    a4 = (id)sub_2339D4434();
  }
  if (a5)
  {
    sub_2339D213C();
    v11 = sub_2339D21A8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_2339D21A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  return (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication *)sub_2338B567C((uint64_t)a3, (uint64_t)a4, (uint64_t)v10);
}

- (_TtCV12FinanceKitUIP33_D9156154FF55601103FCE36B8FFE03E821OrderLinkedAppViewIOS17LinkedApplication)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrderLinkedAppViewIOS.LinkedApplication();
  return -[PKLinkedApplication init](&v3, sel_init);
}

@end
