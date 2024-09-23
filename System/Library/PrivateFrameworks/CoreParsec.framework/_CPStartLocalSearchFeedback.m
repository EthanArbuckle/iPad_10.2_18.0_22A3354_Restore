@implementation _CPStartLocalSearchFeedback

- (_CPStartLocalSearchFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPStartLocalSearchFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _CPPerformEntityQueryCommandForFeedback *v13;
  void *v14;
  _CPPerformEntityQueryCommandForFeedback *v15;
  void *v16;
  _CPIndexStateForFeedback *v17;
  void *v18;
  _CPIndexStateForFeedback *v19;
  _CPStartLocalSearchFeedback *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_CPStartLocalSearchFeedback;
  v5 = -[_CPStartLocalSearchFeedback init](&v22, sel_init);
  if (v5)
  {
    -[_CPStartLocalSearchFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartLocalSearchFeedback setInput:](v5, "setInput:", v7);

    }
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartLocalSearchFeedback setUuid:](v5, "setUuid:", v9);

    }
    -[_CPStartLocalSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    -[_CPStartLocalSearchFeedback setQueryId:](v5, "setQueryId:", objc_msgSend(v4, "queryId"));
    -[_CPStartLocalSearchFeedback setIndexType:](v5, "setIndexType:", objc_msgSend(v4, "indexType"));
    -[_CPStartLocalSearchFeedback setSearchType:](v5, "setSearchType:", objc_msgSend(v4, "searchType"));
    objc_msgSend(v4, "originatingApp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "originatingApp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartLocalSearchFeedback setOriginatingApp:](v5, "setOriginatingApp:", v11);

    }
    objc_msgSend(v4, "entityQueryCommand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_CPPerformEntityQueryCommandForFeedback alloc];
      objc_msgSend(v4, "entityQueryCommand");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_CPPerformEntityQueryCommandForFeedback initWithFacade:](v13, "initWithFacade:", v14);
      -[_CPStartLocalSearchFeedback setEntityQueryCommand:](v5, "setEntityQueryCommand:", v15);

    }
    objc_msgSend(v4, "indexState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_CPIndexStateForFeedback alloc];
      objc_msgSend(v4, "indexState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_CPIndexStateForFeedback initWithFacade:](v17, "initWithFacade:", v18);
      -[_CPStartLocalSearchFeedback setIndexState:](v5, "setIndexState:", v19);

    }
    -[_CPStartLocalSearchFeedback setCoreSpotlightIndexTypeUsed:](v5, "setCoreSpotlightIndexTypeUsed:", objc_msgSend(v4, "coreSpotlightIndexTypeUsed"));
    -[_CPStartLocalSearchFeedback setIsPhotosScopedSearch:](v5, "setIsPhotosScopedSearch:", objc_msgSend(v4, "isPhotosScopedSearch"));
    v20 = v5;
  }

  return v5;
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[_CPStartLocalSearchFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPStartLocalSearchFeedback input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPStartLocalSearchFeedback uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_CPStartLocalSearchFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStartLocalSearchFeedback queryId](self, "queryId"))
    PBDataWriterWriteUint64Field();
  if (-[_CPStartLocalSearchFeedback indexType](self, "indexType"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStartLocalSearchFeedback searchType](self, "searchType"))
    PBDataWriterWriteInt32Field();
  -[_CPStartLocalSearchFeedback originatingApp](self, "originatingApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_CPStartLocalSearchFeedback entityQueryCommand](self, "entityQueryCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_CPStartLocalSearchFeedback entityQueryCommand](self, "entityQueryCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPStartLocalSearchFeedback indexState](self, "indexState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_CPStartLocalSearchFeedback indexState](self, "indexState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPStartLocalSearchFeedback coreSpotlightIndexTypeUsed](self, "coreSpotlightIndexTypeUsed"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStartLocalSearchFeedback isPhotosScopedSearch](self, "isPhotosScopedSearch"))
    PBDataWriterWriteBOOLField();

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int)searchType
{
  return self->_searchType;
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (NSString)input
{
  return self->_input;
}

- (int)indexType
{
  return self->_indexType;
}

- (_CPIndexStateForFeedback)indexState
{
  return self->_indexState;
}

- (_CPPerformEntityQueryCommandForFeedback)entityQueryCommand
{
  return self->_entityQueryCommand;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (void)setSearchType:(int)a3
{
  self->_searchType = a3;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setIndexType:(int)a3
{
  self->_indexType = a3;
}

- (_CPStartLocalSearchFeedback)init
{
  _CPStartLocalSearchFeedback *v2;
  _CPStartLocalSearchFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPStartLocalSearchFeedback;
  v2 = -[_CPStartLocalSearchFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPStartLocalSearchFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_storeStrong((id *)&self->_entityQueryCommand, 0);
  objc_storeStrong((id *)&self->_originatingApp, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (BOOL)readFrom:(id)a3
{
  return _CPStartLocalSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int triggerEvent;
  unint64_t queryId;
  int indexType;
  int searchType;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int coreSpotlightIndexTypeUsed;
  int isPhotosScopedSearch;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_32;
  -[_CPStartLocalSearchFeedback input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_31;
  -[_CPStartLocalSearchFeedback input](self, "input");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPStartLocalSearchFeedback input](self, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_32;
  }
  else
  {

  }
  -[_CPStartLocalSearchFeedback uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_31;
  -[_CPStartLocalSearchFeedback uuid](self, "uuid");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPStartLocalSearchFeedback uuid](self, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_32;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_32;
  queryId = self->_queryId;
  if (queryId != objc_msgSend(v4, "queryId"))
    goto LABEL_32;
  indexType = self->_indexType;
  if (indexType != objc_msgSend(v4, "indexType"))
    goto LABEL_32;
  searchType = self->_searchType;
  if (searchType != objc_msgSend(v4, "searchType"))
    goto LABEL_32;
  -[_CPStartLocalSearchFeedback originatingApp](self, "originatingApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingApp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_31;
  -[_CPStartLocalSearchFeedback originatingApp](self, "originatingApp");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_CPStartLocalSearchFeedback originatingApp](self, "originatingApp");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingApp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_CPStartLocalSearchFeedback entityQueryCommand](self, "entityQueryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityQueryCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_31;
  -[_CPStartLocalSearchFeedback entityQueryCommand](self, "entityQueryCommand");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_CPStartLocalSearchFeedback entityQueryCommand](self, "entityQueryCommand");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityQueryCommand");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_CPStartLocalSearchFeedback indexState](self, "indexState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[_CPStartLocalSearchFeedback indexState](self, "indexState");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_CPStartLocalSearchFeedback indexState](self, "indexState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_32;
  }
  else
  {

  }
  coreSpotlightIndexTypeUsed = self->_coreSpotlightIndexTypeUsed;
  if (coreSpotlightIndexTypeUsed == objc_msgSend(v4, "coreSpotlightIndexTypeUsed"))
  {
    isPhotosScopedSearch = self->_isPhotosScopedSearch;
    v37 = isPhotosScopedSearch == objc_msgSend(v4, "isPhotosScopedSearch");
    goto LABEL_33;
  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSString hash](self->_input, "hash");
  v5 = v4 ^ -[NSString hash](self->_uuid, "hash") ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761u
                                                                                               * self->_queryId);
  v6 = (2654435761 * self->_indexType) ^ (2654435761 * self->_searchType);
  v7 = v5 ^ v6 ^ -[NSString hash](self->_originatingApp, "hash");
  v8 = -[_CPPerformEntityQueryCommandForFeedback hash](self->_entityQueryCommand, "hash");
  return v7 ^ v8 ^ -[_CPIndexStateForFeedback hash](self->_indexState, "hash") ^ (2654435761
                                                                                * self->_coreSpotlightIndexTypeUsed) ^ (2654435761 * self->_isPhotosScopedSearch);
}

- (void)setOriginatingApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEntityQueryCommand:(id)a3
{
  objc_storeStrong((id *)&self->_entityQueryCommand, a3);
}

- (void)setIndexState:(id)a3
{
  objc_storeStrong((id *)&self->_indexState, a3);
}

- (int)coreSpotlightIndexTypeUsed
{
  return self->_coreSpotlightIndexTypeUsed;
}

- (void)setCoreSpotlightIndexTypeUsed:(int)a3
{
  self->_coreSpotlightIndexTypeUsed = a3;
}

- (BOOL)isPhotosScopedSearch
{
  return self->_isPhotosScopedSearch;
}

- (void)setIsPhotosScopedSearch:(BOOL)a3
{
  self->_isPhotosScopedSearch = a3;
}

@end
