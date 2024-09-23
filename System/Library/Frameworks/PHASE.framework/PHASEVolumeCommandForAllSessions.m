@implementation PHASEVolumeCommandForAllSessions

- (PHASEVolumeCommandForAllSessions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEVolumeCommandForAllSessions;
  return (PHASEVolumeCommandForAllSessions *)-[PHASEVolumeCommand initInternal](&v3, sel_initInternal);
}

+ (id)new
{
  return objc_alloc_init(PHASEVolumeCommandForAllSessions);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VolumeCommandForAllSessions"));
}

@end
