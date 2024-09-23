@implementation MKFCKPerson

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  return -[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", a3, a5);
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  return -[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", a3, a5);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKPerson"));
}

@end
