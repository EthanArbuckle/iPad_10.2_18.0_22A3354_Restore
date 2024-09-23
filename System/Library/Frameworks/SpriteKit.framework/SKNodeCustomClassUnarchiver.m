@implementation SKNodeCustomClassUnarchiver

- (SKNodeCustomClassUnarchiver)init
{
  SKNodeCustomClassUnarchiver *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKNodeCustomClassUnarchiver;
  v2 = -[SKNodeCustomClassUnarchiver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)_currentAppModuleName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mangledSwiftClassName:(id)a3 moduleName:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_TtC%lu%@%lu%@"), objc_msgSend(v6, "length"), v6, objc_msgSend(v5, "length"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_findValidClassName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  Class v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[SKNodeCustomClassUnarchiver _currentAppModuleName](self, "_currentAppModuleName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!NSClassFromString((NSString *)v7))
      {
        -[SKNodeCustomClassUnarchiver _mangledSwiftClassName:moduleName:](self, "_mangledSwiftClassName:moduleName:", v4, v6);
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = NSClassFromString(v8);
LABEL_9:
        if (!v9)
        {

          v8 = 0;
        }

        v7 = v8;
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    if (objc_msgSend(v5, "count") != 2)
    {
      v6 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!NSClassFromString((NSString *)v6))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v12, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!NSClassFromString((NSString *)v7))
      {
        objc_msgSend(v5, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKNodeCustomClassUnarchiver _mangledSwiftClassName:moduleName:](self, "_mangledSwiftClassName:moduleName:", v14, v15);
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();

        v9 = NSClassFromString(v8);
        goto LABEL_9;
      }
LABEL_12:

      v6 = v7;
    }
  }
LABEL_14:

  return v6;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    NSClassFromString(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKNodeCustomClassUnarchiver _findValidClassName:](self, "_findValidClassName:", v6);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v10, v6);
      NSClassFromString(v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return (Class)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
