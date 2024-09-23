@implementation CRKBookmark

+ (id)favoritesFolderWithChildren:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Favorites"), &stru_24D9CB490, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "folderWithName:children:identifier:", v7, v5, CFSTR("com.apple.classroomkit.bookmark.favorites-folder"));
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

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Reading List"), &stru_24D9CB490, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "folderWithName:children:identifier:", v7, v5, CFSTR("com.apple.classroomkit.bookmark.reading-list-folder"));
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

- (CRKBookmark)initWithName:(id)a3 URL:(id)a4 children:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CRKBookmark *v14;
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
  v22.super_class = (Class)CRKBookmark;
  v14 = -[CRKBookmark init](&v22, sel_init);
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

  -[CRKBookmark children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isFavoritesFolder
{
  return -[CRKBookmark isFolderWithIdentifier:](self, "isFolderWithIdentifier:", CFSTR("com.apple.classroomkit.bookmark.favorites-folder"));
}

- (BOOL)isReadingListFolder
{
  return -[CRKBookmark isFolderWithIdentifier:](self, "isFolderWithIdentifier:", CFSTR("com.apple.classroomkit.bookmark.reading-list-folder"));
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (id)urlString
{
  void *v2;
  void *v3;

  -[CRKBookmark URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUrlString:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKBookmark setURL:](self, "setURL:", v4);

  }
  else
  {
    -[CRKBookmark setURL:](self, "setURL:");
  }
}

- (BOOL)isFolderWithIdentifier:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;

  v4 = (unint64_t)a3;
  if (-[CRKBookmark isFolder](self, "isFolder"))
  {
    -[CRKBookmark identifier](self, "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v4 | v5)
    {
      -[CRKBookmark identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqual:", v4);

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
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

  -[CRKBookmark name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKBookmark URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKBookmark children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CRKBookmark identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKBookmark *v8;
  CRKBookmark *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKBookmark *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(CFSTR("name, URL, children, identifier"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_16;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKBookmark *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKBookmark isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = v9;
          -[CRKBookmark valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKBookmark valueForKey:](v17, "valueForKey:", v16);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKBookmark name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBookmark URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CRKBookmark isFolder](self, "isFolder");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v10 = v9;
  -[CRKBookmark identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[CRKBookmark children](self, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = %@, URL = %@, isFolder = %@, identifier = %@, childCount = %@ }>"), v4, self, v5, v7, v10, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKBookmark)initWithCoder:(id)a3
{
  id v4;
  CRKBookmark *v5;
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
  v21.super_class = (Class)CRKBookmark;
  v5 = -[CRKBookmark init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("URL"));
    v10 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("children"));
    v15 = objc_claimAutoreleasedReturnValue();
    children = v5->_children;
    v5->_children = (NSArray *)v15;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
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
  -[CRKBookmark name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[CRKBookmark URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("URL"));

  -[CRKBookmark children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("children"));

  -[CRKBookmark identifier](self, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("identifier"));

}

- (NSString)name
{
  return self->_name;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
