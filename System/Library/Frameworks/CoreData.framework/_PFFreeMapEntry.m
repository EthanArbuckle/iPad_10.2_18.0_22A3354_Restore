@implementation _PFFreeMapEntry

- (_PFFreeMapEntry)init
{
  _PFFreeMapEntry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PFFreeMapEntry;
  v2 = -[_PFFreeMapEntry init](&v4, sel_init);
  if (v2)
    v2->_owners = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  return v2;
}

- (void)dealloc
{
  NSMutableSet *owners;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  owners = self->_owners;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](owners, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(owners);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "invalidate");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](owners, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_PFFreeMapEntry;
  -[_PFFreeMapEntry dealloc](&v8, sel_dealloc);
}

@end
