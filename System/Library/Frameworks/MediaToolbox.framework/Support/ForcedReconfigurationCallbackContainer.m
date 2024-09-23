@implementation ForcedReconfigurationCallbackContainer

- (ForcedReconfigurationCallbackContainer)initWithLabel:(const void *)a3
{
  id v4;
  ForcedReconfigurationCallbackContainer *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *callbacks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ForcedReconfigurationCallbackContainer;
  v4 = -[ForcedReconfigurationCallbackContainer init](&v9, sel_init);
  v5 = (ForcedReconfigurationCallbackContainer *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 1, (const std::string *)a3);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    callbacks = v5->_callbacks;
    v5->_callbacks = v6;

  }
  return v5;
}

- (unint64_t)addCallback:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSMutableDictionary *callbacks;
  void *v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_label;
  int v16;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self->_callbackCounter + 1;
    do
    {
      v6 = v5;
      v5 = 1;
    }
    while (!v6);
    self->_callbackCounter = v6;
    callbacks = self->_callbacks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](callbacks, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      STS_N_Log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        p_label = &self->_label;
        if (*((char *)&self->_label.__r_.__value_.var0.__l + 23) < 0)
          p_label = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_label->__r_.__value_.var0.__l.__data_;
        v16 = 136315138;
        v17 = p_label;
        _os_log_error_impl(&dword_2290E3000, v10, OS_LOG_TYPE_ERROR, "overwriting ForcedReconfigurationCallback for label %s", (uint8_t *)&v16, 0xCu);
      }

    }
    v11 = self->_callbacks;
    v12 = (void *)MEMORY[0x22E2C193C](v4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v13);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeCallback:(unint64_t)a3
{
  NSMutableDictionary *callbacks;
  id v4;

  callbacks = self->_callbacks;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](callbacks, "removeObjectForKey:");

}

- (void)fireAll
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void);
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_callbacks;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_callbacks, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)isEmpty
{
  return -[NSMutableDictionary count](self->_callbacks, "count") == 0;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_label.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_label.__r_.__value_.var0.__l.__data_);
  objc_storeStrong((id *)&self->_callbacks, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
