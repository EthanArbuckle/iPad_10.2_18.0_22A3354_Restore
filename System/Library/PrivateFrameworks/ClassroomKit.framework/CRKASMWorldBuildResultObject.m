@implementation CRKASMWorldBuildResultObject

- (CRKASMWorldBuildResultObject)init
{
  return -[CRKASMWorldBuildResultObject initWithRoster:manageableLocations:](self, "initWithRoster:manageableLocations:", 0, MEMORY[0x24BDBD1A8]);
}

- (CRKASMWorldBuildResultObject)initWithRoster:(id)a3 manageableLocations:(id)a4
{
  id v7;
  id v8;
  CRKASMWorldBuildResultObject *v9;
  CRKASMWorldBuildResultObject *v10;
  uint64_t v11;
  NSArray *manageableLocations;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMWorldBuildResultObject;
  v9 = -[CRKASMWorldBuildResultObject init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_roster, a3);
    v11 = objc_msgSend(v8, "copy");
    manageableLocations = v10->_manageableLocations;
    v10->_manageableLocations = (NSArray *)v11;

  }
  return v10;
}

- (CRKASMRoster)roster
{
  return self->_roster;
}

- (NSArray)manageableLocations
{
  return self->_manageableLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manageableLocations, 0);
  objc_storeStrong((id *)&self->_roster, 0);
}

@end
