@implementation HMBLocalZoneProcessTuple

- (HMBLocalZoneProcessTuple)initWithPreviousContext:(id)a3 mergedContext:(id)a4 updateModel:(id)a5 outputModel:(id)a6 outputBlockRow:(id)a7 recordRow:(unint64_t)a8 itemRow:(unint64_t)a9 modelSchema:(id)a10 modelType:(id)a11 externalID:(id)a12 queryTable:(id)a13
{
  id v19;
  HMBLocalZoneProcessTuple *v20;
  HMBLocalZoneProcessTuple *v21;
  id *p_mergedContext;
  HMBLocalSQLQueryTable *queryTable;
  void *v24;
  uint64_t v25;
  NSArray *encodedQueryableColumns;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v29 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a10;
  v31 = a11;
  v30 = a12;
  v19 = a13;
  v37.receiver = self;
  v37.super_class = (Class)HMBLocalZoneProcessTuple;
  v20 = -[HMBLocalZoneProcessTuple init](&v37, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_previousContext, a3);
    p_mergedContext = (id *)&v21->_mergedContext;
    objc_storeStrong((id *)&v21->_mergedContext, a4);
    objc_storeStrong((id *)&v21->_outputBlockRow, a7);
    objc_storeStrong((id *)&v21->_outputModel, a6);
    objc_storeStrong((id *)&v21->_updateModel, a5);
    v21->_recordRow = a8;
    v21->_itemRow = a9;
    objc_storeStrong((id *)&v21->_modelSchema, a10);
    objc_storeStrong((id *)&v21->_modelType, a11);
    objc_storeStrong((id *)&v21->_externalID, a12);
    objc_storeStrong((id *)&v21->_queryTable, a13);
    queryTable = v21->_queryTable;
    if (queryTable)
    {
      if (*p_mergedContext)
      {
        objc_msgSend(*p_mergedContext, "model");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLQueryTable buildQueriableFieldsForModel:](queryTable, "buildQueriableFieldsForModel:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        encodedQueryableColumns = v21->_encodedQueryableColumns;
        v21->_encodedQueryableColumns = (NSArray *)v25;

      }
    }
  }

  return v21;
}

- (HMBLocalZoneProcessModelContext)previousContext
{
  return self->_previousContext;
}

- (HMBLocalZoneProcessModelContext)mergedContext
{
  return self->_mergedContext;
}

- (HMBModel)updateModel
{
  return self->_updateModel;
}

- (HMBModel)outputModel
{
  return self->_outputModel;
}

- (NSNumber)outputBlockRow
{
  return self->_outputBlockRow;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (unint64_t)itemRow
{
  return self->_itemRow;
}

- (NSData)externalID
{
  return self->_externalID;
}

- (NSUUID)modelSchema
{
  return self->_modelSchema;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (HMBLocalSQLQueryTable)queryTable
{
  return self->_queryTable;
}

- (NSArray)encodedQueryableColumns
{
  return self->_encodedQueryableColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedQueryableColumns, 0);
  objc_storeStrong((id *)&self->_queryTable, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelSchema, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_outputBlockRow, 0);
  objc_storeStrong((id *)&self->_outputModel, 0);
  objc_storeStrong((id *)&self->_updateModel, 0);
  objc_storeStrong((id *)&self->_mergedContext, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
}

@end
