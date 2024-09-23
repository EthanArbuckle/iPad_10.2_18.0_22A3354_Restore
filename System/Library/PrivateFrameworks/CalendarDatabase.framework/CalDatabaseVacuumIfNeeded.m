@implementation CalDatabaseVacuumIfNeeded

CFAbsoluteTime ___CalDatabaseVacuumIfNeeded_block_invoke()
{
  CFAbsoluteTime result;

  result = CFAbsoluteTimeGetCurrent() + -3.0;
  _CalDatabaseVacuumIfNeeded___LastVacuumTimestamp = *(_QWORD *)&result;
  return result;
}

@end
