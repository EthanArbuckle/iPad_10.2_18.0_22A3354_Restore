@implementation IDSXPCReunionSyncInterface

+ (id)interface
{
  if (qword_1ECDD6448 != -1)
    dispatch_once(&qword_1ECDD6448, &unk_1E2C5F750);
  return (id)qword_1ECDD64D8;
}

@end
