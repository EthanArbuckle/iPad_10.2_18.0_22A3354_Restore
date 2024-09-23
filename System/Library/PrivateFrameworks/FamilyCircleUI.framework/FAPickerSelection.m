@implementation FAPickerSelection

- (BOOL)isAddSelection
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___FAPickerSelection_isAddSelection);
}

- (FAFamilyMember)selectedMember
{
  return (FAFamilyMember *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___FAPickerSelection_selectedMember));
}

+ (id)addSelection
{
  objc_class *ObjCClassMetadata;
  _BYTE *v3;
  objc_super v5;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v3 = objc_allocWithZone(ObjCClassMetadata);
  v3[OBJC_IVAR___FAPickerSelection_isAddSelection] = 1;
  *(_QWORD *)&v3[OBJC_IVAR___FAPickerSelection_selectedMember] = 0;
  v5.receiver = v3;
  v5.super_class = ObjCClassMetadata;
  return objc_msgSendSuper2(&v5, sel_init);
}

- (FAPickerSelection)initWithSelectedMember:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___FAPickerSelection_isAddSelection) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelection_selectedMember) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[FAPickerSelection init](&v8, sel_init);
}

- (FAPickerSelection)init
{
  FAPickerSelection *result;

  result = (FAPickerSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
