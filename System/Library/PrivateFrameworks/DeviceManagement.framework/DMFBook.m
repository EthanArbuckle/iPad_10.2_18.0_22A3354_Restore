@implementation DMFBook

- (DMFBook)initWithPersistentID:(id)a3 iTunesStoreID:(id)a4 author:(id)a5 title:(id)a6 version:(id)a7 type:(unint64_t)a8 state:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  DMFBook *v20;
  uint64_t v21;
  NSString *persistentID;
  uint64_t v23;
  NSNumber *iTunesStoreID;
  uint64_t v25;
  NSString *author;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSString *version;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v32.receiver = self;
  v32.super_class = (Class)DMFBook;
  v20 = -[DMFBook init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    persistentID = v20->_persistentID;
    v20->_persistentID = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    iTunesStoreID = v20->_iTunesStoreID;
    v20->_iTunesStoreID = (NSNumber *)v23;

    v25 = objc_msgSend(v17, "copy");
    author = v20->_author;
    v20->_author = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    title = v20->_title;
    v20->_title = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    version = v20->_version;
    v20->_version = (NSString *)v29;

    v20->_type = a8;
    v20->_state = a9;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DMFBook persistentID](self, "persistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFBook iTunesStoreID](self, "iTunesStoreID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFBook author](self, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFBook title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFBook version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithPersistentID:iTunesStoreID:author:title:version:type:state:", v5, v6, v7, v8, v9, -[DMFBook type](self, "type"), -[DMFBook state](self, "state"));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFBook)initWithCoder:(id)a3
{
  id v4;
  DMFBook *v5;
  void *v6;
  uint64_t v7;
  NSString *persistentID;
  void *v9;
  uint64_t v10;
  NSNumber *iTunesStoreID;
  void *v12;
  uint64_t v13;
  NSString *author;
  void *v15;
  uint64_t v16;
  NSString *title;
  void *v18;
  uint64_t v19;
  NSString *version;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DMFBook;
  v5 = -[DMFBook init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("persistentID"));
    v7 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("iTunesStoreID"));
    v10 = objc_claimAutoreleasedReturnValue();
    iTunesStoreID = v5->_iTunesStoreID;
    v5->_iTunesStoreID = (NSNumber *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("author"));
    v13 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("title"));
    v16 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("version"));
    v19 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v22, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[DMFBook persistentID](self, "persistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("persistentID"));

  -[DMFBook iTunesStoreID](self, "iTunesStoreID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("iTunesStoreID"));

  -[DMFBook author](self, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("author"));

  -[DMFBook title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("title"));

  -[DMFBook version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFBook type](self, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFBook state](self, "state"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("state"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DMFBook iTunesStoreID](self, "iTunesStoreID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DMFBook *v4;
  DMFBook *v5;
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
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  BOOL v33;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;

  v4 = (DMFBook *)a3;
  if (self == v4)
  {
    v33 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFBook iTunesStoreID](self, "iTunesStoreID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFBook iTunesStoreID](v5, "iTunesStoreID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        v33 = 0;
      }
      else
      {
        -[DMFBook persistentID](self, "persistentID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFBook persistentID](v5, "persistentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v14 = v12;
        if (v13 | v14
          && (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, !v15))
        {
          v33 = 0;
        }
        else
        {
          -[DMFBook author](self, "author");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[DMFBook author](v5, "author");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v16;
          v19 = v17;
          if (v18 | v19
            && (v20 = objc_msgSend((id)v18, "isEqual:", v19), (id)v19, (id)v18, !v20))
          {
            v33 = 0;
          }
          else
          {
            v37 = v14;
            v38 = v19;
            -[DMFBook title](self, "title");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[DMFBook title](v5, "title");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v21;
            v24 = v22;
            v39 = (void *)v23;
            if (v23 | v24
              && (v25 = objc_msgSend((id)v23, "isEqual:", v24), (id)v24, (id)v23, !v25))
            {
              v33 = 0;
              v14 = v37;
              v19 = v38;
            }
            else
            {
              v35 = v13;
              v36 = v18;
              -[DMFBook version](self, "version");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[DMFBook version](v5, "version");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v26;
              v29 = v27;
              if (v28 | v29
                && (v30 = objc_msgSend((id)v28, "isEqual:", v29), (id)v29, (id)v28, !v30))
              {
                v33 = 0;
                v13 = v35;
                v14 = v37;
              }
              else
              {
                v31 = -[DMFBook type](self, "type");
                v14 = v37;
                if (v31 == -[DMFBook type](v5, "type"))
                {
                  v32 = -[DMFBook state](self, "state");
                  v33 = v32 == -[DMFBook state](v5, "state");
                }
                else
                {
                  v33 = 0;
                }
                v13 = v35;
              }

              v18 = v36;
              v19 = v38;
            }

          }
        }

      }
    }
    else
    {
      v33 = 0;
    }
  }

  return v33;
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
  void *v13;
  void *v14;
  void *v15;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFBook persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tPersistent ID   : %@\n"), v4);

  -[DMFBook iTunesStoreID](self, "iTunesStoreID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tiTunes Store ID : %@\n"), v5);

  -[DMFBook author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tAuthor          : %@\n"), v6);

  -[DMFBook title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tTitle           : %@\n"), v7);

  v8 = (void *)description_typeMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFBook type](self, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tType            : %@\n"), v10);

  v11 = (void *)description_stateMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFBook state](self, "state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tState           : %@\n"), v13);

  -[DMFBook version](self, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tVersion         : %@\n"), v14);

  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

void __22__DMFBook_description__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];
  _QWORD v5[10];
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E6EF2CA0;
  v6[1] = &unk_1E6EF2CB8;
  v7[0] = CFSTR("PDF");
  v7[1] = CFSTR("EPUB");
  v6[2] = &unk_1E6EF2CD0;
  v7[2] = CFSTR("iBooks");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)description_typeMap;
  description_typeMap = v0;

  v4[0] = &unk_1E6EF2CD0;
  v4[1] = &unk_1E6EF2CA0;
  v5[0] = CFSTR("Unknown");
  v5[1] = CFSTR("Queued");
  v4[2] = &unk_1E6EF2CB8;
  v4[3] = &unk_1E6EF2CE8;
  v5[2] = CFSTR("Prompting for login");
  v5[3] = CFSTR("Updating");
  v4[4] = &unk_1E6EF2D00;
  v4[5] = &unk_1E6EF2D18;
  v5[4] = CFSTR("Installing");
  v5[5] = CFSTR("Installed");
  v4[6] = &unk_1E6EF2D30;
  v4[7] = &unk_1E6EF2D48;
  v5[6] = CFSTR("Uninstalled");
  v5[7] = CFSTR("Managed");
  v4[8] = &unk_1E6EF2D60;
  v4[9] = &unk_1E6EF2D78;
  v5[8] = CFSTR("Managed but uninstalled");
  v5[9] = CFSTR("Failed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 10);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)description_stateMap;
  description_stateMap = v2;

}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (NSNumber)iTunesStoreID
{
  return self->_iTunesStoreID;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
