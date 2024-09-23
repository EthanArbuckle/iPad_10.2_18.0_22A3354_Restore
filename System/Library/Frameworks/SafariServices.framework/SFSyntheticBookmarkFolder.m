@implementation SFSyntheticBookmarkFolder

- (SFSyntheticBookmarkFolder)initWithBookmarkList:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  SFSyntheticBookmarkFolder *v9;
  SFSyntheticBookmarkFolder *v10;
  SFSyntheticBookmarkFolder *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFSyntheticBookmarkFolder;
  v9 = -[SFSyntheticBookmarkFolder init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bookmarkList, a3);
    objc_storeStrong((id *)&v10->_title, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SFSyntheticBookmarkFolder *v4;
  SFSyntheticBookmarkFolder *v5;
  SFSyntheticBookmarkFolder *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;

  v4 = (SFSyntheticBookmarkFolder *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[SFSyntheticBookmarkFolder bookmarkList](self, "bookmarkList"),
          (v7 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v8 = (void *)v7,
          -[SFSyntheticBookmarkFolder bookmarkList](v6, "bookmarkList"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      -[SFSyntheticBookmarkFolder bookmarkList](self, "bookmarkList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "folderID");
      -[SFSyntheticBookmarkFolder bookmarkList](v6, "bookmarkList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11 == objc_msgSend(v12, "folderID");

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (WebBookmarkList)bookmarkList
{
  return self->_bookmarkList;
}

- (void)setBookmarkList:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkList, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bookmarkList, 0);
}

@end
