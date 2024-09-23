@implementation SCNSceneDatabase

+ (id)sceneDatabase
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (SCNSceneDatabase)init
{
  SCNSceneDatabase *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNSceneDatabase;
  v2 = -[SCNSceneDatabase init](&v4, sel_init);
  if (v2)
    v2->_db = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNSceneDatabase;
  -[SCNSceneDatabase dealloc](&v3, sel_dealloc);
}

+ (id)lookUpKeyForObjectNamed:(id)a3 class:(Class)a4
{
  return -[NSString stringByAppendingString:](-[NSString stringByAppendingString:](NSStringFromClass(a4), "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", a3);
}

- (void)addInstance:(id)a3 withName:(id)a4 class:(Class)a5
{
  -[NSMutableDictionary setValue:forKey:](self->_db, "setValue:forKey:", a3, objc_msgSend((id)objc_opt_class(), "lookUpKeyForObjectNamed:class:", a4, a5));
}

- (SCNSceneDatabase)initWithCoder:(id)a3
{
  SCNSceneDatabase *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNSceneDatabase;
  v4 = -[SCNSceneDatabase init](&v7, sel_init);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "lookUpKey"))
    {
      objc_msgSend(a3, "setLookUpFoundInstance:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), objc_msgSend(a3, "lookUpKey")));
    }
    else
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SCNSceneDatabase initWithCoder:].cold.1(v5);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *db;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  db = self->_db;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](db, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(db);
        objc_msgSend(a3, "encodeObject:forKey:", -[NSMutableDictionary valueForKey:](self->_db, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](db, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: SCNSceneDatabase is supposed to be unarchived with a SCNKeyedUnarchiver and a lookUpName set", v1, 2u);
}

@end
