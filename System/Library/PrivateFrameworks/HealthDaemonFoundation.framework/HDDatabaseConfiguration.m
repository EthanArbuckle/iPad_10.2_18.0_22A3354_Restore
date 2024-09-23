@implementation HDDatabaseConfiguration

- (HDDatabaseConfiguration)initWithBehavior:(id)a3 concurrentReaderLimit:(unint64_t)a4 contentProtectionManager:(id)a5
{
  id v9;
  id v10;
  HDDatabaseConfiguration *v11;
  HDDatabaseConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDDatabaseConfiguration;
  v11 = -[HDDatabaseConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_behavior, a3);
    v12->_concurrentReaderLimit = a4;
    objc_storeStrong((id *)&v12->_contentProtectionManager, a5);
  }

  return v12;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (unint64_t)concurrentReaderLimit
{
  return self->_concurrentReaderLimit;
}

- (HDContentProtectionManager)contentProtectionManager
{
  return self->_contentProtectionManager;
}

- (void)setContentProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_contentProtectionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
