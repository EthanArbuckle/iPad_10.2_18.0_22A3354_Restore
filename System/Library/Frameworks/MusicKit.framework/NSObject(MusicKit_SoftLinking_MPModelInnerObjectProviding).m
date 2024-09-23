@implementation NSObject(MusicKit_SoftLinking_MPModelInnerObjectProviding)

- (id)_musicKit_innerModelObject
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;

  getMPModelObjectClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = a1;
    objc_msgSend(v2, "relativeModelObjectForStoreLibraryPersonalization");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    getMPModelGenericObjectClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v2;
      if (objc_msgSend(v4, "type") == 5)
      {
        objc_msgSend(v4, "playlistEntry");
        v5 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v5;
      }
      if (!v3)
      {
        objc_msgSend(v4, "anyObject");
        v3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    if (!v3)
      v3 = v2;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
