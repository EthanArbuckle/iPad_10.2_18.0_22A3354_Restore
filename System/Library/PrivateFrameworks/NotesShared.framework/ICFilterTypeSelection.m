@implementation ICFilterTypeSelection

- (NSString)filterName
{
  return (NSString *)&stru_1E76DB108;
}

- (BOOL)isEmpty
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

+ (id)keyPathsForValuesAffectingIsValid
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSString)rawFilterValue
{
  return (NSString *)&stru_1E76DB108;
}

- (NSString)emptySummaryTitle
{
  return 0;
}

- (NSString)emptySummary
{
  return 0;
}

- (NSString)shortEmptySummary
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICFilterTypeSelection *v4;
  void *v5;

  v4 = +[ICFilterTypeSelection allocWithZone:](ICFilterTypeSelection, "allocWithZone:", a3);
  -[ICFilterTypeSelection accountObjectID](self, "accountObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFilterTypeSelection setAccountObjectID:](v4, "setAccountObjectID:", v5);

  return v4;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (void)setAccountObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_accountObjectID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObjectID, 0);
}

@end
