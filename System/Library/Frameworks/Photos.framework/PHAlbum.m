@implementation PHAlbum

+ (id)managedEntityName
{
  return CFSTR("Album");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHAlbum");
  return CFSTR("PHAlbum");
}

@end
