@implementation EKRemoteUIObjectSerializerWrapper

- (_TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper)init
{
  id v3;
  _TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper *v4;
  objc_class *v5;
  objc_super v7;

  v3 = objc_allocWithZone((Class)sub_1AF9F7B78());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for EKRemoteUIObjectSerializerWrapper();
  return -[EKRemoteUIObjectSerializerWrapper init](&v7, sel_init);
}

- (id)serializedRepresentationWithEkObject:(id)a3 obfuscateKeyProperties:(BOOL)a4
{
  void *v5;
  id v6;
  _TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper *v7;
  id v8;
  void *v9;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  v6 = a3;
  v7 = self;
  v8 = v5;
  v9 = (void *)sub_1AF9F7B60();

  return v9;
}

- (id)serializedRepresentationWithEkObject:(id)a3
{
  void *v4;
  id v5;
  _TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper *v6;
  id v7;
  void *v8;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  v5 = a3;
  v6 = self;
  v7 = v4;
  v8 = (void *)sub_1AF9F7B6C();

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer));
}

@end
