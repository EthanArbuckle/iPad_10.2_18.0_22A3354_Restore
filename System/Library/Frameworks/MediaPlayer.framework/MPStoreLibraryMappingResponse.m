@implementation MPStoreLibraryMappingResponse

- (id)libraryIdentifierSetForIdentifierSet:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_storeIdentifierSetToLibraryIdentifierSet, "objectForKey:", a3);
}

- (void)setLibraryIdentifierSet:(id)a3 forIdentifierSet:(id)a4
{
  id v6;
  NSMutableDictionary *storeIdentifierSetToLibraryIdentifierSet;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    storeIdentifierSetToLibraryIdentifierSet = self->_storeIdentifierSetToLibraryIdentifierSet;
    v8 = v11;
    if (v11)
    {
      if (!storeIdentifierSetToLibraryIdentifierSet)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10 = self->_storeIdentifierSetToLibraryIdentifierSet;
        self->_storeIdentifierSetToLibraryIdentifierSet = v9;

        v8 = v11;
        storeIdentifierSetToLibraryIdentifierSet = self->_storeIdentifierSetToLibraryIdentifierSet;
      }
      -[NSMutableDictionary setObject:forKey:](storeIdentifierSetToLibraryIdentifierSet, "setObject:forKey:", v8, v6);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](storeIdentifierSetToLibraryIdentifierSet, "removeObjectForKey:", v6);
    }
  }

}

- (int64_t)libraryAddedStatus
{
  return self->_libraryAddedStatus;
}

- (void)setLibraryAddedStatus:(int64_t)a3
{
  self->_libraryAddedStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifierSetToLibraryIdentifierSet, 0);
}

@end
