@implementation CNAutocompleteSearchView.Coordinator

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  id v6;
  id v7;
  _TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator *v8;
  void *v9;
  id v10;

  sub_20D635190();
  v6 = objc_allocWithZone(MEMORY[0x24BE19158]);
  v7 = a3;
  v8 = self;
  v9 = (void *)sub_20D635160();
  v10 = objc_msgSend(v6, sel_initWithContact_address_kind_, 0, v9, 0);

  swift_bridgeObjectRelease();
  return v10;
}

- (uint64_t)searchController:(void *)a3 didAddRecipient:(void *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = objc_msgSend(v6, sel_recipients);
  sub_20D61A578(0, (unint64_t *)&unk_2549BEA60);
  v10 = sub_20D6351CC();

  sub_20D628098(v10);
  return swift_bridgeObjectRelease();
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  void (*v4)();
  id v8;
  id v9;
  _TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator *v10;

  v4 = *(void (**)())(*(char **)((char *)&self->super.isa
                                          + OBJC_IVAR____TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator_viewModel)
                               + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_showContactPickerDidClick);
  if (v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v8 = a3;
    v9 = a4;
    v10 = self;
    sub_20D6187C4((uint64_t)v4);
    sub_20D634C2C();
    swift_release();
    swift_release();
    v4();
    sub_20D618880((uint64_t)v4);

    swift_bridgeObjectRelease();
  }
}

- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_20D627C48(v6, v7);

}

- (_TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator)init
{
  _TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator *result;

  result = (_TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
