@implementation CTCarrierSpacePlanGroupInfo

- (CTCarrierSpacePlanGroupInfo)init
{
  CTCarrierSpacePlanGroupInfo *v2;
  CTCarrierSpacePlanGroupInfo *v3;
  NSString *groupId;
  NSArray *groupOptionsList;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTCarrierSpacePlanGroupInfo;
  v2 = -[CTCarrierSpacePlanGroupInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    groupId = v2->_groupId;
    v2->_planCategory = 0;
    v2->_groupId = 0;

    groupOptionsList = v3->_groupOptionsList;
    v3->_groupOptionsList = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planCategory=%s"), CTCarrierSpacePlanCategoryAsString(-[CTCarrierSpacePlanGroupInfo planCategory](self, "planCategory")));
  -[CTCarrierSpacePlanGroupInfo groupId](self, "groupId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", groupId=%@"), v4);

  -[CTCarrierSpacePlanGroupInfo groupOptionsList](self, "groupOptionsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", groupOptionsList=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCarrierSpacePlanGroupInfo *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CTCarrierSpacePlanGroupInfo *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[CTCarrierSpacePlanGroupInfo planCategory](self, "planCategory"),
          v5 == -[CTCarrierSpacePlanGroupInfo planCategory](v4, "planCategory")))
    {
      -[CTCarrierSpacePlanGroupInfo groupOptionsList](self, "groupOptionsList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpacePlanGroupInfo groupOptionsList](v4, "groupOptionsList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[CTCarrierSpacePlanGroupInfo groupOptionsList](self, "groupOptionsList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpacePlanGroupInfo groupOptionsList](v4, "groupOptionsList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToArray:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)groupId
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[CTCarrierSpacePlanGroupInfo planCategory](self, "planCategory");
  v3 = CFSTR("unknown");
  if (v2 == 3)
    v3 = CFSTR("roaming-plans");
  if (v2 == 1)
    return (NSString *)CFSTR("domestic-plans");
  else
    return &v3->isa;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t planCategory;
  id v5;

  planCategory = self->_planCategory;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", planCategory, CFSTR("planCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupOptionsList, CFSTR("groupOptionsList"));

}

- (CTCarrierSpacePlanGroupInfo)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpacePlanGroupInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *groupOptionsList;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTCarrierSpacePlanGroupInfo;
  v5 = -[CTCarrierSpacePlanGroupInfo init](&v12, sel_init);
  if (v5)
  {
    v5->_planCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("planCategory"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("groupOptionsList"));
    v9 = objc_claimAutoreleasedReturnValue();
    groupOptionsList = v5->_groupOptionsList;
    v5->_groupOptionsList = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)planCategory
{
  return self->_planCategory;
}

- (void)setPlanCategory:(int64_t)a3
{
  self->_planCategory = a3;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (NSArray)groupOptionsList
{
  return self->_groupOptionsList;
}

- (void)setGroupOptionsList:(id)a3
{
  objc_storeStrong((id *)&self->_groupOptionsList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupOptionsList, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

@end
