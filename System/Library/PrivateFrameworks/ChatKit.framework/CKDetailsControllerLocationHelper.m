@implementation CKDetailsControllerLocationHelper

+ (int64_t)numberOfCellsInLocationSectionWithConversation:(id)a3 isFMFEnabled:(BOOL)a4 isSharingLocation:(BOOL)a5 shouldShowFMFView:(BOOL)a6
{
  _BOOL8 v7;
  id v9;
  id v10;

  v7 = a5;
  v9 = a3;
  v10 = _s7ChatKit33CKDetailsControllerLocationHelperC015numberOfCellsInE7Section12conversation12isFMFEnabled0m7SharingE017shouldShowFMFViewSiSo14CKConversationC_S3btFZ_0(v9, a4, v7, a6);

  return (int64_t)v10;
}

+ (int64_t)cellTypeForRow:(int64_t)a3 conversation:(id)a4 isFMFEnabled:(BOOL)a5 shouldShowFMFView:(BOOL)a6
{
  int v8;
  id v9;
  int64_t v10;

  v8 = a3;
  v9 = a4;
  v10 = _s7ChatKit33CKDetailsControllerLocationHelperC8cellType6forRow12conversation12isFMFEnabled17shouldShowFMFViewAA021CKLocationSectionCellH0OSi_So14CKConversationCS2btFZ_0(v8, v9, a5, a6);

  return v10;
}

+ (id)mapURLFor:(id)a3 in:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = a4;
  static CKDetailsControllerLocationHelper.mapURL(for:in:)(v9, v10, (uint64_t)v8);

  v11 = sub_18E7661A0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    v13 = (void *)sub_18E766164();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  }
  return v13;
}

- (_TtC7ChatKit33CKDetailsControllerLocationHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKDetailsControllerLocationHelper();
  return -[CKDetailsControllerLocationHelper init](&v3, sel_init);
}

@end
