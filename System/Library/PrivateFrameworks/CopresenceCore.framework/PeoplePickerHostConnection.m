@implementation PeoplePickerHostConnection

- (void)checkIn:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  _TtC14CopresenceCore26PeoplePickerHostConnection *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  specialized PeoplePickerHostConnection.checkIn(_:reply:)((uint64_t)v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)updateActivity:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(id, uint64_t, uint64_t);
  id v9;
  _TtC14CopresenceCore26PeoplePickerHostConnection *v10;

  v5 = (char *)self + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF449918](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 24);
    v9 = a3;
    v10 = self;
    v8(a3, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
