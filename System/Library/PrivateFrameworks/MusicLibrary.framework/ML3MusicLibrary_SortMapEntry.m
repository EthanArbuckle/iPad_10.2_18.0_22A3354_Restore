@implementation ML3MusicLibrary_SortMapEntry

- (ML3MusicLibrary_SortMapEntry)initWithName:(id)a3 nameSection:(int)a4 sortKey:(id)a5 nameOrder:(int64_t)a6 dirtyFlag:(BOOL)a7
{
  id v13;
  id v14;
  ML3MusicLibrary_SortMapEntry *v15;
  ML3MusicLibrary_SortMapEntry *v16;
  objc_super v18;

  v13 = a3;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ML3MusicLibrary_SortMapEntry;
  v15 = -[ML3MusicLibrary_SortMapEntry init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_nameSection = a4;
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_sortKey, a5);
    v16->_nameOrder = a6;
    v16->_dirty = a7;
  }

  return v16;
}

- (ML3MusicLibrary_SortMapEntry)initWithName:(id)a3 nameSection:(int)a4 sortKey:(id)a5
{
  return -[ML3MusicLibrary_SortMapEntry initWithName:nameSection:sortKey:nameOrder:dirtyFlag:](self, "initWithName:nameSection:sortKey:nameOrder:dirtyFlag:", a3, *(_QWORD *)&a4, a5, -1, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(.nameSection=%d, .nameOrder = %15lld, .name = %@)"), self->_nameSection, self->_nameOrder, self->_name);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
