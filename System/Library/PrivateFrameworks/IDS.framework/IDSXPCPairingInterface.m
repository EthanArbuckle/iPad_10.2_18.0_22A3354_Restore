@implementation IDSXPCPairingInterface

+ (id)interface
{
  if (qword_1ECDD6460 != -1)
    dispatch_once(&qword_1ECDD6460, &unk_1E2C5F930);
  return (id)qword_1ECDD64F0;
}

@end
