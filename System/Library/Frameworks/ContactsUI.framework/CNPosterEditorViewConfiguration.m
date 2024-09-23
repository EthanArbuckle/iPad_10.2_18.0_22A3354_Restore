@implementation CNPosterEditorViewConfiguration

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithImageData:(id)a3 displayName:(id)a4 contactIdentifier:(id)a5 isMe:(BOOL)a6
{
  return (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)sub_18AD26CC4(self, (uint64_t)a2, a3, a4, a5, a6, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData);
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 displayName:(id)a4 contactIdentifier:(id)a5 isMe:(BOOL)a6
{
  return (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)sub_18AD26CC4(self, (uint64_t)a2, a3, a4, a5, a6, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData, &OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData);
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithImageData:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = sub_18AF4E48C();
  v10 = v9;

  v11 = sub_18AF4FC5C();
  v13 = v12;

  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData);
  *v14 = v8;
  v14[1] = v10;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_displayName);
  *v15 = v11;
  v15[1] = v13;
  v16 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_contactIdentifier);
  *v16 = 0;
  v16[1] = 0xE000000000000000;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_isMe) = 1;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData) = xmmword_18AF889D0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration) = 0;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for CNPosterEditorViewConfiguration();
  return -[CNPosterEditorViewConfiguration init](&v18, sel_init);
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = sub_18AF4E48C();
  v10 = v9;

  v11 = sub_18AF4FC5C();
  v13 = v12;

  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData);
  *v14 = v8;
  v14[1] = v10;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData) = xmmword_18AF889D0;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_displayName);
  *v15 = v11;
  v15[1] = v13;
  v16 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_contactIdentifier);
  *v16 = 0;
  v16[1] = 0xE000000000000000;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_isMe) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration) = 0;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for CNPosterEditorViewConfiguration();
  return -[CNPosterEditorViewConfiguration init](&v18, sel_init);
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterArchiveData:(id)a3 imageData:(id)a4 displayName:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_18AF4E48C();
  v13 = v12;

  v14 = sub_18AF4E48C();
  v16 = v15;

  v17 = sub_18AF4FC5C();
  v19 = v18;

  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData);
  *v20 = v11;
  v20[1] = v13;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData);
  *v21 = v14;
  v21[1] = v16;
  v22 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_displayName);
  *v22 = v17;
  v22[1] = v19;
  v23 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_contactIdentifier);
  *v23 = 0;
  v23[1] = 0xE000000000000000;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_isMe) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration) = 0;
  v25.receiver = self;
  v25.super_class = (Class)type metadata accessor for CNPosterEditorViewConfiguration();
  return -[CNPosterEditorViewConfiguration init](&v25, sel_init);
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)initWithPosterConfiguration:(id)a3 displayName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10ContactsUI31CNPosterEditorViewConfiguration *v8;

  v4 = sub_18AF4FC5C();
  v6 = v5;
  v7 = swift_unknownObjectRetain();
  v8 = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)sub_18AD29D98(v7, v4, v6);
  swift_unknownObjectRelease();
  return v8;
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)init
{
  _TtC10ContactsUI31CNPosterEditorViewConfiguration *result;

  result = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18ACB9CDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData), *(_QWORD *)&self->imageData[OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_imageData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18ACB9CC8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData), *(_QWORD *)&self->imageData[OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterArchiveData]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI31CNPosterEditorViewConfiguration_posterConfiguration));
}

@end
