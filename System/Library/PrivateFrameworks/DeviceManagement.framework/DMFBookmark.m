@implementation DMFBookmark

+ (id)favoritesFolderWithChildren:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Favorites"), &stru_1E6ED9BA0, CFSTR("DMFUserInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "folderWithName:children:identifier:", v7, v5, CFSTR("com.apple.dmf.bookmark.favorites-folder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)readingListFolderWithChildren:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Reading List"), &stru_1E6ED9BA0, CFSTR("DMFUserInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "folderWithName:children:identifier:", v7, v5, CFSTR("com.apple.dmf.bookmark.reading-list-folder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)folderWithName:(id)a3 children:(id)a4
{
  return (id)objc_msgSend(a1, "folderWithName:children:identifier:", a3, a4, 0);
}

+ (id)folderWithName:(id)a3 children:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:URL:children:identifier:", v10, 0, v9, v8);

  return v11;
}

+ (id)leafBookmarkWithName:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:URL:children:identifier:", v7, v6, 0, 0);

  return v8;
}

- (DMFBookmark)initWithName:(id)a3 URL:(id)a4 children:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DMFBookmark *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSArray *children;
  uint64_t v19;
  NSString *identifier;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)DMFBookmark;
  v14 = -[DMFBookmark init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_URL, a4);
    v17 = objc_msgSend(v12, "copy");
    children = v14->_children;
    v14->_children = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v19;

  }
  return v14;
}

- (BOOL)isFolder
{
  void *v2;
  BOOL v3;

  -[DMFBookmark children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isFavoritesFolder
{
  return -[DMFBookmark _isFolderWithIdentifier:](self, "_isFolderWithIdentifier:", CFSTR("com.apple.dmf.bookmark.favorites-folder"));
}

- (BOOL)isReadingListFolder
{
  return -[DMFBookmark _isFolderWithIdentifier:](self, "_isFolderWithIdentifier:", CFSTR("com.apple.dmf.bookmark.reading-list-folder"));
}

- (BOOL)_isFolderWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[DMFBookmark isFolder](self, "isFolder"))
  {
    -[DMFBookmark identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFBookmark)initWithCoder:(id)a3
{
  id v4;
  DMFBookmark *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSURL *URL;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *children;
  void *v17;
  uint64_t v18;
  NSString *identifier;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DMFBookmark;
  v5 = -[DMFBookmark init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("URL"));
    v10 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("children"));
    v15 = objc_claimAutoreleasedReturnValue();
    children = v5->_children;
    v5->_children = (NSArray *)v15;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("identifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DMFBookmark name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[DMFBookmark URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("URL"));

  -[DMFBookmark children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("children"));

  -[DMFBookmark identifier](self, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("identifier"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[DMFBookmark name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DMFBookmark URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DMFBookmark children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DMFBookmark identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  DMFBookmark *v4;
  DMFBookmark *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v25;

  v4 = (DMFBookmark *)a3;
  if (self == v4 || !-[DMFBookmark isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v23 = 1;
  }
  else
  {
    v5 = v4;
    -[DMFBookmark name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMFBookmark name](v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
    {
      v23 = 0;
    }
    else
    {
      -[DMFBookmark URL](self, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFBookmark URL](v5, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      if (v13 | v14
        && (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, !v15))
      {
        v23 = 0;
      }
      else
      {
        -[DMFBookmark children](self, "children");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFBookmark children](v5, "children");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16;
        v19 = v17;
        if (v18 | v19
          && (v20 = objc_msgSend((id)v18, "isEqual:", v19), (id)v19, (id)v18, !v20))
        {
          v23 = 0;
        }
        else
        {
          v25 = v8;
          -[DMFBookmark identifier](self, "identifier");
          v21 = objc_claimAutoreleasedReturnValue();
          -[DMFBookmark identifier](v5, "identifier");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v21 | v22)
            v23 = objc_msgSend((id)v21, "isEqual:", v22);
          else
            v23 = 1;

          v8 = v25;
        }

      }
    }

  }
  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFBookmark name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tName        : %@\n"), v4);

  -[DMFBookmark URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tURL         : %@\n"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFBookmark isFolder](self, "isFolder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisFolder    : %@\n"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[DMFBookmark children](self, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tChild Count : %@\n"), v10);

  -[DMFBookmark identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIdentifier  : %@\n"), v11);

  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSArray)children
{
  return self->_children;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
