@implementation BGFastPassSystemTaskRequest

- (BGFastPassSystemTaskRequest)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BGFastPassSystemTaskRequest;
  return -[BGNonRepeatingSystemTaskRequest initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BGFastPassSystemTaskRequest;
  v5 = -[BGNonRepeatingSystemTaskRequest copyWithZone:](&v9, sel_copyWithZone_);
  -[BGFastPassSystemTaskRequest processingTaskIdentifiers](self, "processingTaskIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setProcessingTaskIdentifiers:", v7);

  objc_msgSend(v5, "setSemanticVersion:", -[BGFastPassSystemTaskRequest semanticVersion](self, "semanticVersion"));
  objc_msgSend(v5, "setReRun:", -[BGFastPassSystemTaskRequest reRun](self, "reRun"));
  return v5;
}

- (NSString)processingTaskIdentifier
{
  return self->_processingTaskIdentifier;
}

- (void)setProcessingTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)processingTaskIdentifiers
{
  return self->_processingTaskIdentifiers;
}

- (void)setProcessingTaskIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (int64_t)semanticVersion
{
  return self->_semanticVersion;
}

- (void)setSemanticVersion:(int64_t)a3
{
  self->_semanticVersion = a3;
}

- (BOOL)reRun
{
  return self->_reRun;
}

- (void)setReRun:(BOOL)a3
{
  self->_reRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingTaskIdentifiers, 0);
  objc_storeStrong((id *)&self->_processingTaskIdentifier, 0);
}

@end
