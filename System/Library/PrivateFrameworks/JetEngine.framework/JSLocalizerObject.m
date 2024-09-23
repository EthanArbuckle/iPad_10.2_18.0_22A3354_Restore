@implementation JSLocalizerObject

- (id)string:(id)a3 :(id)a4 :(id)a5
{
  void *v9;
  id v10;
  id v11;
  id v12;
  _TtC9JetEngine17JSLocalizerObject *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _TtC9JetEngine17JSLocalizerObject *v19;
  void *v20;
  id result;

  v9 = (void *)objc_opt_self();
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = objc_msgSend(v9, sel_currentContext);
  if (v14)
  {
    v15 = v14;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    v20 = (void *)sub_19CCEEF44((uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v19, (uint64_t)v18);

    return v20;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

- (id)decimal:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  return sub_19CF7B248(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t (*)(void *, id, id, id, id, id))sub_19CE038B0);
}

- (id)percentage:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  return sub_19CF7B248(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t (*)(void *, id, id, id, id, id))sub_19CE038BC);
}

- (id)integer:(id)a3 :(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC9JetEngine17JSLocalizerObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _TtC9JetEngine17JSLocalizerObject *v15;
  void *v16;
  id result;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    v16 = (void *)sub_19CE038C8((uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15);

    return v16;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

- (id)stringWithCount:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC9JetEngine17JSLocalizerObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _TtC9JetEngine17JSLocalizerObject *v23;
  void *v24;
  id result;

  v11 = (void *)objc_opt_self();
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self;
  v17 = objc_msgSend(v11, sel_currentContext);
  if (v17)
  {
    v18 = v17;
    v19 = v12;
    v20 = v13;
    v21 = v14;
    v22 = v15;
    v23 = v16;
    v24 = (void *)sub_19CE038D4((uint64_t)v18, (uint64_t)v19, (uint64_t)v20, (uint64_t)v21, (uint64_t)v23, (uint64_t)v22);

    return v24;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

- (id)formattedCount:(id)a3
{
  return sub_19CF7BE74(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CE039B8);
}

- (id)fileSize:(id)a3
{
  return sub_19CF7BE74(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CE03B8C);
}

- (id)formattedDateWithContext:(id)a3 :(id)a4 :(id)a5
{
  return sub_19CF7BA7C(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(void *, id, id, id, id))sub_19CE03D64);
}

- (id)formattedDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  return sub_19CF7BA7C(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(void *, id, id, id, id))sub_19CE03D70);
}

- (id)relativeDate:(id)a3
{
  return sub_19CF7BE74(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CE03D7C);
}

- (_TtC9JetEngine17JSLocalizerObject)init
{
  _TtC9JetEngine17JSLocalizerObject *result;

  result = (_TtC9JetEngine17JSLocalizerObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC9JetEngine17JSLocalizerObject_localizer);
}

@end
