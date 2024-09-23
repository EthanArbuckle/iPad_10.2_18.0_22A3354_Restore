@implementation MPUDataSource

- (MPUDataSource)initWithEntityType:(int64_t)a3
{
  MPUDataSource *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPUDataSource;
  result = -[MPUDataSource init](&v5, sel_init);
  if (result)
    result->_entityType = a3;
  return result;
}

- (MPUDataSource)initWithCoder:(id)a3
{
  return -[MPUDataSource initWithEntityType:](self, "initWithEntityType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("entityType")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_entityType, CFSTR("entityType"));
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (id)anyEntity
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[MPUDataSource entities](self, "entities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[MPUDataSource entities](self, "entities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)canSelectEntityAtIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)canEditEntityAtIndexPath:(id)a3
{
  return -[MPUDataSource canEditEntityAtIndex:](self, "canEditEntityAtIndex:", -[MPUDataSource _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", a3));
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[MPUDataSource entities](self, "entities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)deleteEntityAtIndexPath:(id)a3
{
  -[MPUDataSource deleteEntityAtIndex:](self, "deleteEntityAtIndex:", -[MPUDataSource _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", a3));
}

- (BOOL)canEditEntityAtIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)editingTypeForEntityAtIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)editingTypeForEntityAtIndexPath:(id)a3
{
  return -[MPUDataSource editingTypeForEntityAtIndex:](self, "editingTypeForEntityAtIndex:", -[MPUDataSource _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", a3));
}

- (id)entities
{
  return 0;
}

- (id)entityAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[MPUDataSource entities](self, "entities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)entityAtIndexPath:(id)a3
{
  return -[MPUDataSource entityAtIndex:](self, "entityAtIndex:", -[MPUDataSource _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", a3));
}

- (NSString)entityCountFormat
{
  return 0;
}

- (BOOL)entityIsNowPlayingAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)indexOfEntity:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[MPUDataSource entities](self, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (unint64_t)indexOfSectionForSectionTitleAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[MPUDataSource entities](self, "entities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isIgnoringInvalidation
{
  return self->_invalidationIgnoreCount > 0;
}

- (void)beginIgnoringInvalidation
{
  ++self->_invalidationIgnoreCount;
}

- (void)endIgnoringInvalidation
{
  int64_t invalidationIgnoreCount;
  int64_t v3;

  invalidationIgnoreCount = self->_invalidationIgnoreCount;
  if (!invalidationIgnoreCount || (v3 = invalidationIgnoreCount - 1, (self->_invalidationIgnoreCount = v3) == 0))
  {
    if (self->_numberOfIgnoredInvalidations)
    {
      self->_numberOfIgnoredInvalidations = 0;
      -[MPUDataSource invalidate](self, "invalidate");
    }
  }
}

- (void)invalidate
{
  -[MPUDataSource invalidateWithContext:](self, "invalidateWithContext:", 0);
}

- (void)invalidateWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (self->_invalidationIgnoreCount)
  {
    ++self->_numberOfIgnoredInvalidations;
  }
  else
  {
    if (!v4)
    {
      v6 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
      objc_msgSend(v6, "setInvalidateEverything:", 1);
      objc_msgSend(v6, "setInvalidateDataSourceCounts:", 1);
      v5 = v6;
    }
    v7 = v5;
    -[MPUDataSource _willInvalidateWithContext:](self, "_willInvalidateWithContext:", v5);
    if ((objc_msgSend(v7, "invalidateDataSourceCounts") & 1) != 0
      || objc_msgSend(v7, "invalidateEverything"))
    {
      -[MPUDataSource _invalidateCalculatedEntities](self, "_invalidateCalculatedEntities");
    }
    -[MPUDataSource _didInvalidateWithContext:](self, "_didInvalidateWithContext:", v7);
    v5 = v7;
  }

}

- (NSArray)localizedSectionIndexTitles
{
  return 0;
}

- (id)localizedSectionTitleAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)numberOfSections
{
  void *v3;
  unint64_t v4;

  if (!-[MPUDataSource usesSections](self, "usesSections"))
    return -[MPUDataSource count](self, "count") != 0;
  -[MPUDataSource sectionEntities](self, "sectionEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)playbackContextForIndex:(unint64_t)a3
{
  return 0;
}

- (void)preloadEntities
{
  id v2;

  v2 = -[MPUDataSource entities](self, "entities");
}

- (void)preloadSectionEntities
{
  id v2;

  v2 = -[MPUDataSource sectionEntities](self, "sectionEntities");
}

- (_NSRange)rangeOfSectionAtIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = 0;
  v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)sectionEntityAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[MPUDataSource sectionEntities](self, "sectionEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[MPUDataSource sectionEntities](self, "sectionEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (unint64_t)indexOfSectionEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[MPUDataSource sectionEntities](self, "sectionEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[MPUDataSource sectionEntities](self, "sectionEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v4);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)sectionEntities
{
  return 0;
}

- (BOOL)showsEntityCountFooter
{
  return 0;
}

- (BOOL)showsIndexBar
{
  return 0;
}

- (void)_didInvalidateWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("MPUDataSourceInvalidationContextUserInfoKey");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MPUDataSourceDidInvalidateNotification"), self, v7);
}

- (unint64_t)_globalIndexForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= -[MPUDataSource numberOfSections](self, "numberOfSections"))
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v5)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        -[MPUDataSource rangeOfSectionAtIndex:](self, "rangeOfSectionAtIndex:", v6);
        v7 += v8;
        ++v6;
      }
      while (v5 != v6);
    }
    else
    {
      v7 = 0;
    }
    v10 = -[MPUDataSource rangeOfSectionAtIndex:](self, "rangeOfSectionAtIndex:", v5);
    v12 = v11;
    v13 = objc_msgSend(v4, "row");
    if (v13 >= v12 || v10 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v9 = v13 + v7;
  }

  return v9;
}

- (id)_indexPathForGlobalIndex:(unint64_t)a3
{
  void *v3;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[MPUDataSource numberOfSections](self, "numberOfSections");
    if (v3)
    {
      v6 = v3;
      v7 = 0;
      while (1)
      {
        v8 = -[MPUDataSource rangeOfSectionAtIndex:](self, "rangeOfSectionAtIndex:", v7);
        if (a3 >= v8 && a3 - v8 < v9)
          break;
        if (v6 == (void *)++v7)
        {
          v3 = 0;
          return v3;
        }
      }
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)_willInvalidateWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("MPUDataSourceInvalidationContextUserInfoKey");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MPUDataSourceWillInvalidateNotification"), self, v7);
}

- (int64_t)entityType
{
  return self->_entityType;
}

@end
