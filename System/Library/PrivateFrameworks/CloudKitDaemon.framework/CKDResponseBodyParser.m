@implementation CKDResponseBodyParser

- (void)setParserData:(id)a3
{
  NSMutableData *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableData *parserData;

  v4 = (NSMutableData *)a3;
  objc_msgSend_parseQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  parserData = self->_parserData;
  self->_parserData = v4;

}

- (NSError)parserError
{
  return self->_parserError;
}

- (NSMutableData)parserData
{
  uint64_t v2;
  NSObject *v4;

  objc_msgSend_parseQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_parserData;
}

- (OS_dispatch_queue)parseQueue
{
  CKDResponseBodyParser *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  dispatch_qos_class_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *parseQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_parseQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_qualityOfService(v2, v4, v5);
    v6 = CKQoSClassFromNSQualityOfService();
    dispatch_queue_attr_make_with_qos_class(v3, v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(CFSTR("com.apple.cloudkit.parser."), v10, (uint64_t)v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend_UTF8String(v11, v12, v13);
    v15 = dispatch_queue_create(v14, v7);
    parseQueue = v2->_parseQueue;
    v2->_parseQueue = (OS_dispatch_queue *)v15;

  }
  objc_sync_exit(v2);

  return v2->_parseQueue;
}

- (id)objectParsedBlock
{
  return self->_objectParsedBlock;
}

- (void)setObjectParsedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (CKDResponseBodyParser)initWithQoS:(int64_t)a3
{
  CKDResponseBodyParser *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDResponseBodyParser;
  result = -[CKDResponseBodyParser init](&v5, sel_init);
  if (result)
    result->_qualityOfService = a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectParsedBlock, 0);
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong((id *)&self->_parserData, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
}

- (void)processData:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C94D90]);
  v8 = objc_opt_class();
  v10 = (id)objc_msgSend_initWithCode_format_(v7, v9, 12, CFSTR("This method must be subclassed in class %@"), v8);
  objc_exception_throw(v10);
}

- (void)finishWithCompletion:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C94D90]);
  v5 = objc_opt_class();
  v7 = (id)objc_msgSend_initWithCode_format_(v4, v6, 12, CFSTR("This method must be subclassed in class %@"), v5);
  objc_exception_throw(v7);
}

- (void)setParserError:(id)a3
{
  objc_storeStrong((id *)&self->_parserError, a3);
}

- (BOOL)testRepeatedParseResults
{
  return self->_testRepeatedParseResults;
}

- (void)setTestRepeatedParseResults:(BOOL)a3
{
  self->_testRepeatedParseResults = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

@end
