@implementation NSDictionary(GEOXPCUtil)

- (uint64_t)_geo_newXPCObject
{
  id v1;
  uint64_t v2;

  v1 = _NSDictionarySafeEncodingCopy(a1, 0);
  if (v1)
    v2 = _CFXPCCreateXPCObjectFromCFObject();
  else
    v2 = 0;

  return v2;
}

+ (id)_geo_dictionaryFromXPCObject:()GEOXPCUtil
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = _CFXPCCreateCFObjectFromXPCObject();
  if (v0)
  {
    v1 = (void *)v0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = _NSDictionarySafeDecodingCopy(v1);
    else
      v2 = 0;
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_geo_errorForKey:()GEOXPCUtil
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    _geo_NSErrorFromDictionaryRepresentationCopy(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)_geo_replyDictionaryForError:()GEOXPCUtil key:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5
    && objc_msgSend(v6, "length")
    && (_geo_NSErrorDictionaryRepresentationCopy(v5), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
