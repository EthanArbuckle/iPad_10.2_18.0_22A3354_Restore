@implementation HMDFragmentationStreamTuple

- (HMDFragmentationStreamTuple)initWithFragmentationStreamForObject:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HMDFragmentationStreamTuple *v9;
  HMDFragmentationStreamTuple *v10;
  HAPFragmentationStream *v11;
  HAPFragmentationStream *fragmentationStream;
  uint64_t v13;
  NSDate *expirationDate;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDFragmentationStreamTuple;
  v9 = -[HMDFragmentationStreamTuple init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectUUID, a3);
    v11 = (HAPFragmentationStream *)objc_alloc_init(MEMORY[0x1E0D16500]);
    fragmentationStream = v10->_fragmentationStream;
    v10->_fragmentationStream = v11;

    -[HAPFragmentationStream setDelegate:](v10->_fragmentationStream, "setDelegate:", v8);
    -[HAPFragmentationStream open](v10->_fragmentationStream, "open");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v13 = objc_claimAutoreleasedReturnValue();
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v13;

  }
  return v10;
}

- (void)setLastMessage:(id)a3
{
  NSDate *v5;
  NSDate *expirationDate;
  id v7;

  objc_storeStrong((id *)&self->_lastMessage, a3);
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v5;

}

- (BOOL)isExpired
{
  void *v2;
  double v3;
  BOOL v4;

  -[HMDFragmentationStreamTuple expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3 < 0.0;

  return v4;
}

- (void)close
{
  id v2;

  -[HMDFragmentationStreamTuple fragmentationStream](self, "fragmentationStream");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "close");

}

- (HAPFragmentationStream)fragmentationStream
{
  return self->_fragmentationStream;
}

- (NSString)objectUUID
{
  return self->_objectUUID;
}

- (HMFMessage)lastMessage
{
  return self->_lastMessage;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_objectUUID, 0);
  objc_storeStrong((id *)&self->_fragmentationStream, 0);
}

+ (id)tupleWithFragmentationStreamForObject:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  HMDFragmentationStreamTuple *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDFragmentationStreamTuple initWithFragmentationStreamForObject:delegate:]([HMDFragmentationStreamTuple alloc], "initWithFragmentationStreamForObject:delegate:", v6, v5);

  return v7;
}

@end
