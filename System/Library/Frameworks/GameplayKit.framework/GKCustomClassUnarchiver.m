@implementation GKCustomClassUnarchiver

- (GKCustomClassUnarchiver)init
{
  GKCustomClassUnarchiver *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKCustomClassUnarchiver;
  v2 = -[GKCustomClassUnarchiver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v2->_linkedOnOrAfterSecureUnarchive = dyld_program_sdk_at_least();
  }
  return v2;
}

- (id)_currentAppModuleName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mangledSwiftClassName:(id)a3 moduleName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("_TtC%lu%@%lu%@"), objc_msgSend(v6, "length"), v6, objc_msgSend(v7, "length"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_findValidClassName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[GKCustomClassUnarchiver _currentAppModuleName](self, "_currentAppModuleName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v6, v4);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (NSClassFromString(v7))
      {
LABEL_10:

        v6 = v7;
        goto LABEL_12;
      }
      -[GKCustomClassUnarchiver _mangledSwiftClassName:moduleName:](self, "_mangledSwiftClassName:moduleName:", v4, v6);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (NSClassFromString(v8))
      {
LABEL_6:

        v7 = v8;
        goto LABEL_10;
      }
LABEL_5:

      v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    if (objc_msgSend(v5, "count") != 2)
    {
      v6 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!NSClassFromString((NSString *)v6))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), v11, v12);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (NSClassFromString(v7))
        goto LABEL_10;
      objc_msgSend(v5, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCustomClassUnarchiver _mangledSwiftClassName:moduleName:](self, "_mangledSwiftClassName:moduleName:", v14, v15);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (NSClassFromString(v8))
        goto LABEL_6;
      goto LABEL_5;
    }
  }
LABEL_12:

  return v6;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_linkedOnOrAfterSecureUnarchive && _MergedGlobals_1 != -1)
  {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_3);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v9);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_4;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v9);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
LABEL_4:
      v12 = NSClassFromString(v11);
      goto LABEL_10;
    }
  }
  -[GKCustomClassUnarchiver _findValidClassName:](self, "_findValidClassName:", v9);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v13, v9);
    v12 = NSClassFromString(v13);
  }
  else
  {
    v12 = 0;
  }

LABEL_10:
  objc_msgSend(v8, "allowedClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "containsObject:", v12) & 1) != 0
    || objc_msgSend((id)qword_25591E738, "containsObject:", v12))
  {
    v15 = v12;

    if (!v12)
      goto LABEL_18;
  }
  else
  {
    v15 = 0;

    if (!v12)
      goto LABEL_18;
  }
  if (!v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    -[GKCustomClassUnarchiver unarchiver:cannotDecodeObjectOfClassName:originalClasses:].cold.1(v12);
LABEL_18:
  v16 = v15;

  return v16;
}

void __84__GKCustomClassUnarchiver_unarchiver_cannotDecodeObjectOfClassName_originalClasses___block_invoke()
{
  _dyld_get_prog_image_header();
  dyld_image_path_containing_address();
  objc_copyClassesForImage();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)unarchiver:(objc_class *)a1 cannotDecodeObjectOfClassName:originalClasses:.cold.1(objc_class *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_227B56000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Class not decoded '%@'", (uint8_t *)&v2, 0xCu);

}

@end
