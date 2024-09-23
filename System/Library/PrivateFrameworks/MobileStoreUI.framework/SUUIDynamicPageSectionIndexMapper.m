@implementation SUUIDynamicPageSectionIndexMapper

- (void)dealloc
{
  _NSRange *sectionIndexToEntityRange;
  objc_super v4;

  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (sectionIndexToEntityRange)
  {
    free(sectionIndexToEntityRange);
    self->_sectionIndexToEntityRange = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicPageSectionIndexMapper;
  -[SUUIDynamicPageSectionIndexMapper dealloc](&v4, sel_dealloc);
}

- (int64_t)numberOfSections
{
  -[SUUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  return self->_numberOfSections;
}

- (void)setEntityProvider:(id)a3
{
  SUUIEntityProviding *v5;
  char v6;
  SUUIEntityProviding *v7;

  v5 = (SUUIEntityProviding *)a3;
  if (self->_entityProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_entityProvider, a3);
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    *(_BYTE *)&self->_entityProviderFlags = *(_BYTE *)&self->_entityProviderFlags & 0xFE | v6 & 1;
    self->_numberOfSections = -1;
  }

}

- (int64_t)totalNumberOfEntities
{
  int64_t numberOfSections;
  _NSRange *sectionIndexToEntityRange;

  -[SUUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  numberOfSections = self->_numberOfSections;
  if (numberOfSections >= 1 && (sectionIndexToEntityRange = self->_sectionIndexToEntityRange) != 0)
    return sectionIndexToEntityRange[numberOfSections - 1].length
         + sectionIndexToEntityRange[numberOfSections - 1].location;
  else
    return 0;
}

- (id)entityIndexPathForGlobalIndex:(int64_t)a3
{
  void *v5;
  uint64_t v7;
  uint64_t v8;

  -[SUUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[SUUIDynamicPageSectionIndexMapper getItem:section:forGlobalIndex:](self, "getItem:section:forGlobalIndex:", &v8, &v7, a3))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v8, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)getItem:(unint64_t *)a3 section:(unint64_t *)a4 forGlobalIndex:(int64_t)a5
{
  int64_t numberOfSections;
  BOOL v10;
  int64_t v11;
  _NSRange *sectionIndexToEntityRange;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  _NSRange *v16;
  unint64_t location;
  unint64_t length;
  unint64_t v19;
  BOOL v20;

  -[SUUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  numberOfSections = self->_numberOfSections;
  v10 = numberOfSections < 1;
  v11 = numberOfSections - 1;
  if (v10)
    return 0;
  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (!sectionIndexToEntityRange)
    return 0;
  v13 = 0;
  while (1)
  {
    v14 = v11 + v13;
    if (v11 + v13 < 0 != __OFADD__(v11, v13))
      ++v14;
    v15 = v14 >> 1;
    v16 = &sectionIndexToEntityRange[v15];
    location = v16->location;
    length = v16->length;
    v20 = a5 >= v16->location;
    v19 = a5 - v16->location;
    v20 = !v20 || v19 >= length;
    if (!v20)
      break;
    if (a5 < location)
      v11 = v15 - 1;
    else
      v13 = v15 + 1;
    if (v11 < v13)
      return 0;
  }
  if (a3)
    *a3 = v19;
  if (a4)
    *a4 = v15;
  return 1;
}

- (int64_t)globalIndexForEntityIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  _NSRange *v7;
  NSUInteger location;
  NSUInteger length;
  unint64_t v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 < self->_numberOfSections)
  {
    v7 = &self->_sectionIndexToEntityRange[v5];
    location = v7->location;
    length = v7->length;
    v10 = objc_msgSend(v4, "item");
    if (v10 < length)
      v6 = v10 + location;
  }

  return v6;
}

- (_NSRange)rangeForSectionAtIndex:(int64_t)a3
{
  NSUInteger length;
  int64_t numberOfSections;
  NSUInteger location;
  _NSRange *v8;
  _NSRange result;

  -[SUUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  length = 0;
  numberOfSections = self->_numberOfSections;
  location = 0x7FFFFFFFFFFFFFFFLL;
  if (numberOfSections > a3 && (a3 & 0x8000000000000000) == 0 && numberOfSections >= 1)
  {
    v8 = &self->_sectionIndexToEntityRange[a3];
    location = v8->location;
    length = v8->length;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (void)reloadData
{
  self->_numberOfSections = -1;
}

- (void)_loadDataIfNeeded
{
  _NSRange *sectionIndexToEntityRange;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  _NSRange *v9;

  if (self->_numberOfSections < 0)
  {
    sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
    if (sectionIndexToEntityRange)
      free(sectionIndexToEntityRange);
    if ((*(_BYTE *)&self->_entityProviderFlags & 1) != 0)
    {
      v4 = -[SUUIEntityProviding numberOfSections](self->_entityProvider, "numberOfSections");
      self->_sectionIndexToEntityRange = (_NSRange *)malloc_type_calloc(v4, 0x10uLL, 0x1000040451B5BE8uLL);
      if (v4 < 1)
      {
LABEL_9:
        self->_numberOfSections = v4;
        return;
      }
    }
    else
    {
      v4 = 1;
      self->_sectionIndexToEntityRange = (_NSRange *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    }
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = -[SUUIEntityProviding numberOfEntitiesInSection:](self->_entityProvider, "numberOfEntitiesInSection:", v6);
      v9 = &self->_sectionIndexToEntityRange[v5];
      v9->location = v7;
      v9->length = v8;
      v7 += v8;
      ++v6;
      ++v5;
    }
    while (v4 != v6);
    goto LABEL_9;
  }
}

- (SUUIEntityProviding)entityProvider
{
  return self->_entityProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityProvider, 0);
}

@end
