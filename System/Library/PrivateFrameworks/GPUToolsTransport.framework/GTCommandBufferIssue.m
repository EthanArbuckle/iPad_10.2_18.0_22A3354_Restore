@implementation GTCommandBufferIssue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCommandBufferIssue)initWithCoder:(id)a3
{
  id v4;
  GTCommandBufferIssue *v5;
  uint64_t v6;
  NSString *metalLogMessage;
  uint64_t v8;
  NSData *commandBufferCommitCallstackData;
  uint64_t v10;
  NSArray *faultingEncoders;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTCommandBufferIssue;
  v5 = -[GTCommandBufferIssue init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalLogMessage"));
    v6 = objc_claimAutoreleasedReturnValue();
    metalLogMessage = v5->_metalLogMessage;
    v5->_metalLogMessage = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandBufferCommitCallstackData"));
    v8 = objc_claimAutoreleasedReturnValue();
    commandBufferCommitCallstackData = v5->_commandBufferCommitCallstackData;
    v5->_commandBufferCommitCallstackData = (NSData *)v8;

    v5->_commandBufferCommitCallstackFramesNum = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("commandBufferCommitCallstackFramesNum"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("faultingEncoders"));
    v10 = objc_claimAutoreleasedReturnValue();
    faultingEncoders = v5->_faultingEncoders;
    v5->_faultingEncoders = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *metalLogMessage;
  id v5;

  metalLogMessage = self->_metalLogMessage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", metalLogMessage, CFSTR("metalLogMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commandBufferCommitCallstackData, CFSTR("commandBufferCommitCallstackData"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_commandBufferCommitCallstackFramesNum, CFSTR("commandBufferCommitCallstackFramesNum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_faultingEncoders, CFSTR("faultingEncoders"));

}

- (NSString)metalLogMessage
{
  return self->_metalLogMessage;
}

- (void)setMetalLogMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)commandBufferCommitCallstackData
{
  return self->_commandBufferCommitCallstackData;
}

- (void)setCommandBufferCommitCallstackData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)commandBufferCommitCallstackFramesNum
{
  return self->_commandBufferCommitCallstackFramesNum;
}

- (void)setCommandBufferCommitCallstackFramesNum:(unsigned int)a3
{
  self->_commandBufferCommitCallstackFramesNum = a3;
}

- (NSArray)faultingEncoders
{
  return self->_faultingEncoders;
}

- (void)setFaultingEncoders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faultingEncoders, 0);
  objc_storeStrong((id *)&self->_commandBufferCommitCallstackData, 0);
  objc_storeStrong((id *)&self->_metalLogMessage, 0);
}

@end
