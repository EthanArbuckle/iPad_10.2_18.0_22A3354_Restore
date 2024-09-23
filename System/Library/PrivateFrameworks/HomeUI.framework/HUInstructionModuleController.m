@implementation HUInstructionModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  uint64_t ObjCClassFromMetadata;
  id v6;
  HUInstructionModuleController *v7;
  objc_super v9;

  sub_1B8E23A60(0, (unint64_t *)&unk_1EF20D260);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = a3;
  v7 = self;
  if (objc_msgSend(v6, sel_isKindOfClass_, ObjCClassFromMetadata))
  {

    sub_1B8E23A60(0, &qword_1EF20C780);
  }
  else
  {
    v9.receiver = v7;
    v9.super_class = (Class)type metadata accessor for InstructionModuleController();
    -[HUItemModuleController collectionCellClassForItem:](&v9, sel_collectionCellClassForItem_, v6);

    swift_getObjCClassMetadata();
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUInstructionModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8F4C444(v6, v7);

}

- (HUInstructionModuleController)initWithModule:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InstructionModuleController();
  return -[HUItemModuleController initWithModule:](&v5, sel_initWithModule_, a3);
}

@end
