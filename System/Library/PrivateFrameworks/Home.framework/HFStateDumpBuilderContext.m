@implementation HFStateDumpBuilderContext

+ (HFStateDumpBuilderContext)contextWithDetailLevel:(unint64_t)a3
{
  return (HFStateDumpBuilderContext *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDetailLevel:", a3);
}

- (HFStateDumpBuilderContext)init
{
  return -[HFStateDumpBuilderContext initWithDetailLevel:](self, "initWithDetailLevel:", 0);
}

- (HFStateDumpBuilderContext)initWithDetailLevel:(unint64_t)a3
{
  HFStateDumpBuilderContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFStateDumpBuilderContext;
  result = -[HFStateDumpBuilderContext init](&v5, sel_init);
  if (result)
    result->_detailLevel = a3;
  return result;
}

- (HFStateDumpBuilderContext)initWithContext:(id)a3
{
  id v4;
  HFStateDumpBuilderContext *v5;
  uint64_t v6;
  NSSet *objectsToExclude;
  uint64_t v8;
  NSDictionary *userInfo;
  uint64_t v10;
  NSString *multilinePrefix;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFStateDumpBuilderContext;
  v5 = -[HFStateDumpBuilderContext init](&v13, sel_init);
  if (v5)
  {
    v5->_detailLevel = objc_msgSend(v4, "detailLevel");
    v5->_outputStyle = objc_msgSend(v4, "outputStyle");
    objc_msgSend(v4, "objectsToExclude");
    v6 = objc_claimAutoreleasedReturnValue();
    objectsToExclude = v5->_objectsToExclude;
    v5->_objectsToExclude = (NSSet *)v6;

    objc_msgSend(v4, "userInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v8;

    objc_msgSend(v4, "multilinePrefix");
    v10 = objc_claimAutoreleasedReturnValue();
    multilinePrefix = v5->_multilinePrefix;
    v5->_multilinePrefix = (NSString *)v10;

    v5->_excludePrimaryID = objc_msgSend(v4, "excludePrimaryID");
    v5->_includeVolatileObjects = objc_msgSend(v4, "includeVolatileObjects");
  }

  return v5;
}

- (NSSet)objectsToExclude
{
  NSSet *objectsToExclude;

  objectsToExclude = self->_objectsToExclude;
  if (objectsToExclude)
    return objectsToExclude;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)userInfo
{
  if (self->_userInfo)
    return self->_userInfo;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HFStateDumpBuilderContext initWithContext:](+[HFStateDumpBuilderContext allocWithZone:](HFStateDumpBuilderContext, "allocWithZone:", a3), "initWithContext:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[HFStateDumpBuilderContext initWithContext:](+[HFMutableStateDumpBuilderContext allocWithZone:](HFMutableStateDumpBuilderContext, "allocWithZone:", a3), "initWithContext:", self);
}

- (id)copyWithDetailLevel:(unint64_t)a3
{
  void *v4;

  v4 = (void *)-[HFStateDumpBuilderContext mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setDetailLevel:", a3);
  return v4;
}

- (id)copyWithOutputStyle:(unint64_t)a3
{
  void *v4;

  v4 = (void *)-[HFStateDumpBuilderContext mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setOutputStyle:", a3);
  return v4;
}

- (unint64_t)derivedOutputStyle
{
  unint64_t v3;

  if (-[HFStateDumpBuilderContext outputStyle](self, "outputStyle"))
    return -[HFStateDumpBuilderContext outputStyle](self, "outputStyle");
  v3 = -[HFStateDumpBuilderContext detailLevel](self, "detailLevel");
  if (v3 >= 3)
    return -[HFStateDumpBuilderContext outputStyle](self, "outputStyle");
  else
    return v3 + 1;
}

- (unint64_t)detailLevel
{
  return self->_detailLevel;
}

- (void)setDetailLevel:(unint64_t)a3
{
  self->_detailLevel = a3;
}

- (unint64_t)outputStyle
{
  return self->_outputStyle;
}

- (void)setOutputStyle:(unint64_t)a3
{
  self->_outputStyle = a3;
}

- (void)setObjectsToExclude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)excludePrimaryID
{
  return self->_excludePrimaryID;
}

- (void)setExcludePrimaryID:(BOOL)a3
{
  self->_excludePrimaryID = a3;
}

- (BOOL)includeVolatileObjects
{
  return self->_includeVolatileObjects;
}

- (void)setIncludeVolatileObjects:(BOOL)a3
{
  self->_includeVolatileObjects = a3;
}

- (NSString)multilinePrefix
{
  return self->_multilinePrefix;
}

- (void)setMultilinePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilinePrefix, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_objectsToExclude, 0);
}

@end
