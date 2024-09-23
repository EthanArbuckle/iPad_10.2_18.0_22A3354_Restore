@implementation IMDWhitetailToCoralDowngradeHelper

+ (id)arrayOfCreateTablesSQL
{
  return &unk_1E5ADC300;
}

+ (id)arrayOfTableNames
{
  return &unk_1E5ADC318;
}

+ (id)arrayOfCreateIndexesSQL
{
  return &unk_1E5ADC330;
}

+ (id)arrayOfCreateTriggersSQL
{
  return &unk_1E5ADC348;
}

- (IMDWhitetailToCoralDowngradeHelper)initWithPath:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMDWhitetailToCoralDowngradeHelper;
  return -[IMDDatabaseDowngradeHelper initWithPath:tableNames:createTablesSQL:createIndexesSQL:createTriggersSQL:downgradesToVersion:](&v4, sel_initWithPath_tableNames_createTablesSQL_createIndexesSQL_createTriggersSQL_downgradesToVersion_, a3, +[IMDWhitetailToCoralDowngradeHelper arrayOfTableNames](IMDWhitetailToCoralDowngradeHelper, "arrayOfTableNames"), +[IMDWhitetailToCoralDowngradeHelper arrayOfCreateTablesSQL](IMDWhitetailToCoralDowngradeHelper, "arrayOfCreateTablesSQL"), +[IMDWhitetailToCoralDowngradeHelper arrayOfCreateIndexesSQL](IMDWhitetailToCoralDowngradeHelper, "arrayOfCreateIndexesSQL"), +[IMDWhitetailToCoralDowngradeHelper arrayOfCreateTriggersSQL](IMDWhitetailToCoralDowngradeHelper, "arrayOfCreateTriggersSQL"), 9006);
}

@end
