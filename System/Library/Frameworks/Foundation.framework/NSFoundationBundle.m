@implementation NSFoundationBundle

NSBundle *___NSFoundationBundle_block_invoke()
{
  NSBundle *v0;
  NSBundle *result;
  NSBundle *v2;
  NSBundle *v3;
  NSArray *v4;
  NSBundle *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_self());
  qword_1ECD0A008 = (uint64_t)v0;
  result = +[NSBundle mainBundle](NSBundle, "mainBundle");
  if (v0 == result)
  {
    v2 = +[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Frameworks/Foundation.framework"));
    qword_1ECD0A008 = (uint64_t)v2;
    if (!v2 || (v3 = v2, result = +[NSBundle mainBundle](NSBundle, "mainBundle"), v3 == result))
    {
      v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
      v9 = 0u;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      result = (NSBundle *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      if (result)
      {
        v5 = result;
        v6 = *(_QWORD *)v10;
LABEL_7:
        v7 = 0;
        while (1)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          result = +[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "stringByAppendingPathComponent:", CFSTR("Frameworks/Foundation.framework")));
          qword_1ECD0A008 = (uint64_t)result;
          if (result)
            break;
          if (v5 == (NSBundle *)++v7)
          {
            result = (NSBundle *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
            v5 = result;
            if (result)
              goto LABEL_7;
            return result;
          }
        }
      }
    }
  }
  return result;
}

@end
