@implementation EntityKey

- (EntityKey)initWithElementId:(int)a3 edgeElementId:(int)a4 parentElementId:(int)a5
{
  EntityKey *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EntityKey;
  result = -[EntityKey init](&v9, sel_init);
  if (result)
  {
    result->_elementId = a3;
    result->_edgeElementId = a4;
    result->_parentElementId = a5;
  }
  return result;
}

- (BOOL)isEqualToEntityKey:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = a3;
  v5 = -[EntityKey elementId](self, "elementId");
  if (v5 == objc_msgSend(v4, "elementId")
    && (v6 = -[EntityKey edgeElementId](self, "edgeElementId"), v6 == objc_msgSend(v4, "edgeElementId")))
  {
    v7 = -[EntityKey parentElementId](self, "parentElementId");
    v8 = v7 == objc_msgSend(v4, "parentElementId");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  EntityKey *v4;
  BOOL v5;

  v4 = (EntityKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[EntityKey isEqualToEntityKey:](self, "isEqualToEntityKey:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;

  v3 = -[EntityKey elementId](self, "elementId");
  v4 = 31 * (-[EntityKey edgeElementId](self, "edgeElementId") + 961 * v3);
  return v4 + -[EntityKey parentElementId](self, "parentElementId");
}

- (int)elementId
{
  return self->_elementId;
}

- (void)setElementId:(int)a3
{
  self->_elementId = a3;
}

- (int)edgeElementId
{
  return self->_edgeElementId;
}

- (void)setEdgeElementId:(int)a3
{
  self->_edgeElementId = a3;
}

- (int)parentElementId
{
  return self->_parentElementId;
}

- (void)setParentElementId:(int)a3
{
  self->_parentElementId = a3;
}

+ (id)userEntity
{
  if (userEntity_onceToken != -1)
    dispatch_once(&userEntity_onceToken, &__block_literal_global_5075);
  return (id)userEntity_value;
}

+ (id)calendarEventName
{
  if (calendarEventName_onceToken != -1)
    dispatch_once(&calendarEventName_onceToken, &__block_literal_global_382);
  return (id)calendarEventName_value;
}

+ (id)currencyName
{
  if (currencyName_onceToken != -1)
    dispatch_once(&currencyName_onceToken, &__block_literal_global_383);
  return (id)currencyName_value;
}

+ (id)personEntity
{
  if (personEntity_onceToken != -1)
    dispatch_once(&personEntity_onceToken, &__block_literal_global_384);
  return (id)personEntity_value;
}

void __25__EntityKey_personEntity__block_invoke()
{
  EntityKey *v0;
  void *v1;

  v0 = -[EntityKey initWithElementId:edgeElementId:parentElementId:]([EntityKey alloc], "initWithElementId:edgeElementId:parentElementId:", 1206, 541, 1332);
  v1 = (void *)personEntity_value;
  personEntity_value = (uint64_t)v0;

}

void __25__EntityKey_currencyName__block_invoke()
{
  EntityKey *v0;
  void *v1;

  v0 = -[EntityKey initWithElementId:edgeElementId:parentElementId:]([EntityKey alloc], "initWithElementId:edgeElementId:parentElementId:", 1206, 541, 1806);
  v1 = (void *)currencyName_value;
  currencyName_value = (uint64_t)v0;

}

void __30__EntityKey_calendarEventName__block_invoke()
{
  EntityKey *v0;
  void *v1;

  v0 = -[EntityKey initWithElementId:edgeElementId:parentElementId:]([EntityKey alloc], "initWithElementId:edgeElementId:parentElementId:", 1206, 541, 1629);
  v1 = (void *)calendarEventName_value;
  calendarEventName_value = (uint64_t)v0;

}

void __23__EntityKey_userEntity__block_invoke()
{
  EntityKey *v0;
  void *v1;

  v0 = -[EntityKey initWithElementId:edgeElementId:parentElementId:]([EntityKey alloc], "initWithElementId:edgeElementId:parentElementId:", 1206, 2611, 2532);
  v1 = (void *)userEntity_value;
  userEntity_value = (uint64_t)v0;

}

@end
