@implementation DMFFetchSafariBookmarksResultObject

- (DMFFetchSafariBookmarksResultObject)initWithBookmarks:(id)a3
{
  id v4;
  DMFFetchSafariBookmarksResultObject *v5;
  uint64_t v6;
  NSArray *bookmarks;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchSafariBookmarksResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bookmarks = v5->_bookmarks;
    v5->_bookmarks = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchSafariBookmarksResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchSafariBookmarksResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *bookmarks;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchSafariBookmarksResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bookmarks"));
    v9 = objc_claimAutoreleasedReturnValue();
    bookmarks = v5->_bookmarks;
    v5->_bookmarks = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchSafariBookmarksResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchSafariBookmarksResultObject bookmarks](self, "bookmarks", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bookmarks"));

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DMFFetchSafariBookmarksResultObject bookmarks](self, "bookmarks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[DMFFetchSafariBookmarksResultObject _appendDescriptionOfBookmark:toString:level:](self, "_appendDescriptionOfBookmark:toString:level:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), v3, 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p {\n%@}>"), objc_opt_class(), self, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_appendDescriptionOfBookmark:(id)a3 toString:(id)a4 level:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(&stru_1E6ED9BA0, "stringByPaddingToLength:withString:startingAtIndex:", a5, CFSTR("\t"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isFolder") & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  }
  else
  {
    objc_msgSend(v8, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("%@%@ (%@)\n"), v10, v14, v13);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    v19 = a5 + 1;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[DMFFetchSafariBookmarksResultObject _appendDescriptionOfBookmark:toString:level:](self, "_appendDescriptionOfBookmark:toString:level:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), v9, v19);
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarks, 0);
}

@end
