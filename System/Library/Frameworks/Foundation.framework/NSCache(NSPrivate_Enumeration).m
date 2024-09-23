@implementation NSCache(NSPrivate_Enumeration)

- (NSMapTable)mapTableRepresentation
{
  NSMapTable *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v2 = +[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NSCache_NSPrivate_Enumeration__mapTableRepresentation__block_invoke;
  v4[3] = &unk_1E0F4F198;
  v4[4] = v2;
  objc_msgSend(a1, "__apply:", v4);
  return v2;
}

@end
