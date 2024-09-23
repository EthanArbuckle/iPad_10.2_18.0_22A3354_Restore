@implementation ContinuousReadingItem

+ (ContinuousReadingItem)itemWithReadingListItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithReadingListItem:", v4);

  return (ContinuousReadingItem *)v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ContinuousReadingItem;
  -[ContinuousReadingItem dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  ContinuousReadingItem *v4;
  ContinuousReadingItem *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;

  v4 = (ContinuousReadingItem *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ContinuousReadingItem readingListBookmark](self, "readingListBookmark");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "identifier");
      -[ContinuousReadingItem readingListBookmark](v5, "readingListBookmark");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v7 == objc_msgSend(v8, "identifier");
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ContinuousReadingItem readingListBookmark](self, "readingListBookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "identifier");

  return v3;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ContinuousReadingItem;
  objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)keyPathsForValuesAffectingValueForKey__derivedKeys;
  if (!keyPathsForValuesAffectingValueForKey__derivedKeys)
  {
    keyPathsForValuesAffectingValueForKey__derivedKeys = (uint64_t)&unk_1E9D629A0;

    v6 = &unk_1E9D629A0;
  }
  if (objc_msgSend(v6, "containsObject:", v4))
  {
    objc_msgSend(v5, "setByAddingObject:", CFSTR("readingListBookmark"));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[ContinuousReadingItem readingListBookmark](self, "readingListBookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)previewText
{
  void *v2;
  void *v3;

  -[ContinuousReadingItem readingListBookmark](self, "readingListBookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[ContinuousReadingItem readingListBookmark](self, "readingListBookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark safari_bestCurrentURL](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)_siteNameForReadingListItem
{
  void *v2;
  void *v3;
  void *v4;

  -[ContinuousReadingItem readingListBookmark](self, "readingListBookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_initWithReadingListItem:(id)a3
{
  id v5;
  ContinuousReadingItem *v6;
  ContinuousReadingItem *v7;
  void *v8;
  ContinuousReadingItem *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ContinuousReadingItem;
  v6 = -[ContinuousReadingItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readingListBookmark, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__readingListItemDidUpdate_, CFSTR("ReadingListBookmarkDidUpdateNotification"), 0);

    v9 = v7;
  }

  return v7;
}

- (void)_readingListItemDidUpdate:(id)a3
{
  int v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "identifier");
  -[ContinuousReadingItem readingListBookmark](self, "readingListBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");

  if (v4 == v6)
    -[ContinuousReadingItem _setReadingListBookmark:](self, "_setReadingListBookmark:", v7);

}

- (WebBookmark)readingListBookmark
{
  return self->_readingListBookmark;
}

- (void)_setReadingListBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_readingListBookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingListBookmark, 0);
}

@end
