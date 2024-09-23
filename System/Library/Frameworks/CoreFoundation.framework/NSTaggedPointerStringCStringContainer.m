@implementation NSTaggedPointerStringCStringContainer

- (void)release
{
  uint64_t v3;

  os_unfair_lock_lock_with_options();
  v3 = nextAvailableCacheSlot;
  if (nextAvailableCacheSlot > 63)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
    -[NSTaggedPointerStringCStringContainer dealloc](self, "dealloc");
  }
  else
  {
    ++nextAvailableCacheSlot;
    cache[v3] = self;
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  }
}

+ (id)taggedPointerStringCStringContainer
{
  int v2;
  NSTaggedPointerStringCStringContainer *v3;

  os_unfair_lock_lock_with_options();
  v2 = nextAvailableCacheSlot;
  if (nextAvailableCacheSlot <= 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
LABEL_5:
    v3 = objc_alloc_init(NSTaggedPointerStringCStringContainer);
    return v3;
  }
  --nextAvailableCacheSlot;
  v3 = (NSTaggedPointerStringCStringContainer *)cache[v2 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  if (!v3)
    goto LABEL_5;
  return v3;
}

- (NSTaggedPointerStringCStringContainer)retain
{
  puts("*** -[NSTaggedPointerStringCStringContainer retain] called, not supposed to happen");
  return self;
}

@end
