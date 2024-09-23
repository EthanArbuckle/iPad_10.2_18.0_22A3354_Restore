@implementation SearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__text + 8];
  v6 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__text + 16];
  v11 = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__text);
  v12 = v7;
  v13 = v6;
  v10[0] = v5;
  v10[1] = v8;
  v9 = sub_100007D50(&qword_10015CDE8);
  Binding.wrappedValue.setter(v10, v9);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  _TtCV15ShazamEventsApp9SearchBar11Coordinator *v8;
  _QWORD v9[6];

  v5 = (void *)objc_opt_self(UIView);
  v9[4] = sub_1000579A8;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000FADC4;
  v9[3] = &unk_10014D228;
  v6 = _Block_copy(v9);
  v7 = a3;
  v8 = self;
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 0, v6, 0, 0.3, 0.0);
  _Block_release(v6);

}

- (_TtCV15ShazamEventsApp9SearchBar11Coordinator)init
{
  _TtCV15ShazamEventsApp9SearchBar11Coordinator *result;

  result = (_TtCV15ShazamEventsApp9SearchBar11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("ShazamEventsApp.Coordinator", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__text);
  v4 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__text];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_text[OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__text + 16]);
  swift_release(v4);
  swift_release(v3);
  v5 = (char *)self + OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__isSearching;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV15ShazamEventsApp9SearchBar11Coordinator__isSearching);
  swift_release(*((_QWORD *)v5 + 1));
  swift_release(v6);
}

@end
