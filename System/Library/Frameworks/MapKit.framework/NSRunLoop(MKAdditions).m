@implementation NSRunLoop(MKAdditions)

+ (id)_mapkit_networkIORunLoop
{
  pthread_once(&_initNetworkIOThread, (void (*)(void))initNetworkIOThread);
  return (id)_mapkit_networkIORunLoop;
}

+ (void)set_mapkit_networkIORunLoop:()MKAdditions
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)_mapkit_networkIORunLoop != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&_mapkit_networkIORunLoop, a3);
    v4 = v5;
  }

}

@end
