@implementation ASTSessionInfo

- (ASTSessionInfo)initWithQueuedSuiteType:(int64_t)a3 isGuided:(BOOL)a4
{
  ASTSessionInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASTSessionInfo;
  result = -[ASTSessionInfo init](&v7, sel_init);
  if (result)
  {
    result->_queuedSuiteType = a3;
    result->_isGuided = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;

  -[ASTSessionInfo _descriptionForQueuedSuiteType:](self, "_descriptionForQueuedSuiteType:", -[ASTSessionInfo queuedSuiteType](self, "queuedSuiteType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[ASTSessionInfo queuedSuiteType: %@, isGuided: %d]"), v3, -[ASTSessionInfo isGuided](self, "isGuided"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionForQueuedSuiteType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("unknown");
  else
    return off_24F96A2F0[a3];
}

- (int64_t)queuedSuiteType
{
  return self->_queuedSuiteType;
}

- (BOOL)isGuided
{
  return self->_isGuided;
}

@end
