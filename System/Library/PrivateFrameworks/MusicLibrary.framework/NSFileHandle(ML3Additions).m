@implementation NSFileHandle(ML3Additions)

- (uint64_t)ml_lock
{
  _QWORD v3[2];
  pid_t v4;
  int v5;

  v3[1] = 0;
  v5 = 3;
  v3[0] = 0;
  v4 = getpid();
  return fcntl(objc_msgSend(a1, "fileDescriptor"), 9, v3);
}

- (uint64_t)ml_unlock
{
  _QWORD v3[2];
  pid_t v4;
  int v5;

  v3[1] = 0;
  v5 = 2;
  v3[0] = 0;
  v4 = getpid();
  return fcntl(objc_msgSend(a1, "fileDescriptor"), 8, v3);
}

@end
