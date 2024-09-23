@implementation MKFCKTimerTrigger

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKFCKTimerTrigger;
  return -[MKFCKTrigger importIntoLocalModel:updatedProperties:context:](&v6, sel_importIntoLocalModel_updatedProperties_context_, a3, a4, a5);
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKFCKTimerTrigger;
  return -[MKFCKTrigger exportFromLocalModel:updatedProperties:context:](&v6, sel_exportFromLocalModel_updatedProperties_context_, a3, a4, a5);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKTimerTrigger"));
}

@end
