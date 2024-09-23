@implementation EKRemoteUIPersistentObjectPointer

- (EKObjectID)objectID
{
  return (EKObjectID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID));
}

- (BOOL)isPendingInsert
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC8EventKit33EKRemoteUIPersistentObjectPointer)initWithCoder:(id)a3
{
  id v3;
  _TtC8EventKit33EKRemoteUIPersistentObjectPointer *v4;
  _TtC8EventKit33EKRemoteUIPersistentObjectPointer *v5;

  v3 = a3;
  sub_1A2424590(v3);
  v5 = v4;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8EventKit33EKRemoteUIPersistentObjectPointer *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1A2435A4C();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

  v8 = *((unsigned __int8 *)&v6->super.isa + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
  v9 = (id)sub_1A2435A4C();
  objc_msgSend(v5, sel_encodeBool_forKey_, v8, v9);

}

- (_TtC8EventKit33EKRemoteUIPersistentObjectPointer)init
{
  _TtC8EventKit33EKRemoteUIPersistentObjectPointer *result;

  result = (_TtC8EventKit33EKRemoteUIPersistentObjectPointer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
