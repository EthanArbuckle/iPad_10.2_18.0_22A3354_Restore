@implementation NSString(MobileContainerManagerAdditions)

- (uint64_t)containsDotDotPathComponents
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pathComponents");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5), "isEqualToString:", CFSTR("..")) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

+ (id)stringWithFileSystemRepresentation:()MobileContainerManagerAdditions length:
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, _NSDefaultFileSystemEncoding());
}

+ (uint64_t)stringWithFileSystemRepresentation:()MobileContainerManagerAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
}

@end
