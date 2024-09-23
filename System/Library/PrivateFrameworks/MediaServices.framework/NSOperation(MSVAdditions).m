@implementation NSOperation(MSVAdditions)

- (uint64_t)increasePriority
{
  uint64_t result;
  unint64_t v3;
  __int128 v4;

  result = objc_msgSend(a1, "queuePriority");
  *((_QWORD *)&v4 + 1) = result;
  *(_QWORD *)&v4 = result + 8;
  v3 = v4 >> 2;
  if (v3 <= 3)
    return objc_msgSend(a1, "setQueuePriority:", 4 * v3 - 4);
  return result;
}

- (uint64_t)decreasePriority
{
  uint64_t result;
  unint64_t v3;
  __int128 v4;

  result = objc_msgSend(a1, "queuePriority");
  *((_QWORD *)&v4 + 1) = result;
  *(_QWORD *)&v4 = result + 4;
  v3 = v4 >> 2;
  if (v3 <= 3)
    return objc_msgSend(a1, "setQueuePriority:", 4 * v3 - 8);
  return result;
}

@end
