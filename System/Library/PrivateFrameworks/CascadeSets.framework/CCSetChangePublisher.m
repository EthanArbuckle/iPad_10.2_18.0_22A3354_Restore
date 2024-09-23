@implementation CCSetChangePublisher

+ (id)publisherForSet:(id)a3
{
  return (id)objc_msgSend(a1, "publisherForSet:useCase:", a3, *MEMORY[0x24BE0C050]);
}

+ (id)publisherForSet:(id)a3 useCase:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  +[CCDataResourceReadAccess defaultInstanceWithUseCase:](CCDataResourceReadAccess, "defaultInstanceWithUseCase:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithSet:readAccess:", v6, v8);
  return v9;
}

- (CCSetChangePublisher)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSetChangePublisher)initWithSet:(id)a3 readAccess:(id)a4
{
  id v6;
  id v7;
  CCDatabaseSetChangeEnumerator *v8;
  CCSetChangePublisher *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[CCDatabaseSetChangeEnumerator initWithSet:readAccess:]([CCDatabaseSetChangeEnumerator alloc], "initWithSet:readAccess:", v7, v6);

  v9 = -[CCSetChangePublisher initWithEnumerator:](self, "initWithEnumerator:", v8);
  return v9;
}

- (CCSetChangePublisher)initWithEnumerator:(id)a3
{
  id v5;
  CCSetChangePublisher *v6;
  CCSetChangePublisher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCSetChangePublisher;
  v6 = -[CCSetChangePublisher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_enumerator, a3);

  return v7;
}

- (unint64_t)sharedItemCount
{
  CCSetChangeEnumerator *enumerator;
  void *v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  id v8;

  enumerator = self->_enumerator;
  v8 = 0;
  -[CCSetChangeEnumerator sharedItemCount:](enumerator, "sharedItemCount:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CCSetChangePublisher sharedItemCount].cold.1();

    v5 = 0;
  }

  return v5;
}

- (unint64_t)localItemInstanceCount
{
  CCSetChangeEnumerator *enumerator;
  void *v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  id v8;

  enumerator = self->_enumerator;
  v8 = 0;
  -[CCSetChangeEnumerator itemInstanceCount:](enumerator, "itemInstanceCount:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CCSetChangePublisher localItemInstanceCount].cold.1();

    v5 = 0;
  }

  return v5;
}

- (BOOL)isBookmarkUpToDate:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6 = -[CCSetChangeEnumerator isBookmarkUpToDate:](self->_enumerator, "isBookmarkUpToDate:", v4);

  return v6;
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)startWithSubscriber:(id)a3
{
  CCSetChangeEnumerator *enumerator;
  BMBookmark *enumeratorBookmark;
  char v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  enumerator = self->_enumerator;
  enumeratorBookmark = self->_enumeratorBookmark;
  v10 = 0;
  v5 = -[CCSetChangeEnumerator beginWithBookmark:error:](enumerator, "beginWithBookmark:error:", enumeratorBookmark, &v10);
  v6 = v10;
  v7 = 0;
  if ((v5 & 1) == 0)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CCSetChangePublisher startWithSubscriber:].cold.1();

    v7 = v6;
  }

  return v7;
}

- (id)nextEvent
{
  id result;

  result = (id)-[CCSetChangeEnumerator next](self->_enumerator, "next");
  if (!result)
    self->_finished = 1;
  return result;
}

- (BOOL)completed
{
  return self->_finished;
}

- (void)reset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to reset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)validateBookmark:(id)a3
{
  return 0;
}

- (void)applyBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_enumeratorBookmark, a3);
}

- (id)bookmark
{
  return (id)-[CCSetChangeEnumerator nextBookmark](self->_enumerator, "nextBookmark");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratorBookmark, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (void)sharedItemCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to get sharedItemCount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)localItemInstanceCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to get localItemInstanceCount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startWithSubscriber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to begin enumeration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
