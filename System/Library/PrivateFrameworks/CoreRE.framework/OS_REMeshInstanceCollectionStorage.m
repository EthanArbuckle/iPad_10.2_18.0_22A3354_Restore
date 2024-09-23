@implementation OS_REMeshInstanceCollectionStorage

- (void)dealloc
{
  Class isa;
  OS_REMeshInstanceCollectionStorage *v4;
  double v5;
  objc_super v6;

  v4 = self + 17;
  isa = self[17].super.isa;
  if (isa)
  {
    if (self[21].super.isa)
      (*(void (**)(Class))(*(_QWORD *)isa + 40))(isa);
    self[21].super.isa = 0;
    v4[1].super.isa = 0;
    v4[2].super.isa = 0;
    v4->super.isa = 0;
    ++LODWORD(self[20].super.isa);
  }
  re::DynamicArray<re::StringID>::deinit((uint64_t)&self[12]);
  re::DynamicArray<re::StringID>::deinit((uint64_t)&self[7]);
  v5 = re::HashTable<re::StringID,re::DataArrayHandle<re::RigGraphOperatorDefinition>,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::deinit((uint64_t *)&self[1]);
  v6.receiver = self;
  v6.super_class = (Class)OS_REMeshInstanceCollectionStorage;
  -[OS_REMeshInstanceCollectionStorage dealloc](&v6, sel_dealloc, v5);
}

@end
