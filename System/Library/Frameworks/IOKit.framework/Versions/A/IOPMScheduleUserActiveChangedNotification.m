@implementation IOPMScheduleUserActiveChangedNotification

uint64_t __IOPMScheduleUserActiveChangedNotification_block_invoke(uint64_t result, char a2)
{
  int v2;

  v2 = a2 & 1;
  if (gIOPMUserIsActive != v2)
  {
    gIOPMUserIsActive = v2;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

@end
