@implementation ContactListMergeUnifyActionHelper

+ (id)descriptorForRequiredKeys
{
  void *v2;

  sub_18AF4FA88();
  sub_18AF4FA1C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98888);
  v2 = (void *)sub_18AF4FD28();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)initWithContactStore:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_contactItems) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = (char *)self + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_mergeResult;
  v6 = sub_18AF4FA64();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_contactStore) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ContactListMergeUnifyActionHelper();
  v7 = a3;
  return -[ContactListMergeUnifyActionHelper init](&v9, sel_init);
}

- (void)mergeContacts:(id)a3 withContainerIdentifiers:(id)a4 withContactIDToParentGroupsDict:(id)a5
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC10ContactsUI33ContactListMergeUnifyActionHelper *v9;

  sub_18ACBE1B0(0, (unint64_t *)&qword_1EDF95520);
  v6 = sub_18AF4FD34();
  v7 = sub_18AF4FD34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98880);
  v8 = sub_18AF4FBA8();
  v9 = self;
  sub_18ACBCA8C(v6, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)applyMergeResultToSaveRequest:(id)a3
{
  id v4;
  _TtC10ContactsUI33ContactListMergeUnifyActionHelper *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_18ACBCF4C();

  return self & 1;
}

- (BOOL)applyUndoTo:(id)a3 and:(id)a4
{
  id v6;
  id v7;
  _TtC10ContactsUI33ContactListMergeUnifyActionHelper *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_18ACBD0E0(v6, v7);

  return v9 & 1;
}

- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)init
{
  _TtC10ContactsUI33ContactListMergeUnifyActionHelper *result;

  result = (_TtC10ContactsUI33ContactListMergeUnifyActionHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_contactStore));
  swift_bridgeObjectRelease();
  sub_18ACBDE3C((uint64_t)self + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_mergeResult);
}

@end
