@implementation _CPCommandEngagementFeedback

- (_CPCommandEngagementFeedback)init
{
  _CPCommandEngagementFeedback *v2;
  _CPCommandEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCommandEngagementFeedback;
  v2 = -[_CPCommandEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCommandEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCommandEngagementFeedbackReadFrom(self, (uint64_t)a3);
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
  void *v11;
  id v12;

  v12 = a3;
  if (-[_CPCommandEngagementFeedback commandType](self, "commandType"))
    PBDataWriterWriteInt32Field();
  -[_CPCommandEngagementFeedback commandDetail](self, "commandDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_CPCommandEngagementFeedback uniqueButtonId](self, "uniqueButtonId"))
    PBDataWriterWriteUint64Field();
  -[_CPCommandEngagementFeedback cardSectionId](self, "cardSectionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPCommandEngagementFeedback result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPCommandEngagementFeedback result](self, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPCommandEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPCommandEngagementFeedback resultSectionId](self, "resultSectionId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  if (-[_CPCommandEngagementFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPCommandEngagementFeedback contactActionType](self, "contactActionType"))
    PBDataWriterWriteInt32Field();
  if (-[_CPCommandEngagementFeedback didDisplayHandleOptions](self, "didDisplayHandleOptions"))
    PBDataWriterWriteBOOLField();
  if (-[_CPCommandEngagementFeedback didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu"))
    PBDataWriterWriteBOOLField();
  -[_CPCommandEngagementFeedback photosAttributes](self, "photosAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9)
  {
    -[_CPCommandEngagementFeedback photosAttributes](self, "photosAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int commandType;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t uniqueButtonId;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  unint64_t timestamp;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int triggerEvent;
  int contactActionType;
  int didDisplayHandleOptions;
  int didSelectFromOptionsMenu;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  commandType = self->_commandType;
  if (commandType != objc_msgSend(v4, "commandType"))
    goto LABEL_34;
  -[_CPCommandEngagementFeedback commandDetail](self, "commandDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandDetail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_33;
  -[_CPCommandEngagementFeedback commandDetail](self, "commandDetail");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPCommandEngagementFeedback commandDetail](self, "commandDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_34;
  }
  else
  {

  }
  uniqueButtonId = self->_uniqueButtonId;
  if (uniqueButtonId != objc_msgSend(v4, "uniqueButtonId"))
    goto LABEL_34;
  -[_CPCommandEngagementFeedback cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_33;
  -[_CPCommandEngagementFeedback cardSectionId](self, "cardSectionId");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_CPCommandEngagementFeedback cardSectionId](self, "cardSectionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_34;
  }
  else
  {

  }
  -[_CPCommandEngagementFeedback result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_33;
  -[_CPCommandEngagementFeedback result](self, "result");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_CPCommandEngagementFeedback result](self, "result");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_34;
  }
  else
  {

  }
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_34;
  -[_CPCommandEngagementFeedback resultSectionId](self, "resultSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_33;
  -[_CPCommandEngagementFeedback resultSectionId](self, "resultSectionId");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_CPCommandEngagementFeedback resultSectionId](self, "resultSectionId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultSectionId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_34;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_34;
  contactActionType = self->_contactActionType;
  if (contactActionType != objc_msgSend(v4, "contactActionType"))
    goto LABEL_34;
  didDisplayHandleOptions = self->_didDisplayHandleOptions;
  if (didDisplayHandleOptions != objc_msgSend(v4, "didDisplayHandleOptions"))
    goto LABEL_34;
  didSelectFromOptionsMenu = self->_didSelectFromOptionsMenu;
  if (didSelectFromOptionsMenu != objc_msgSend(v4, "didSelectFromOptionsMenu"))
    goto LABEL_34;
  -[_CPCommandEngagementFeedback photosAttributes](self, "photosAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[_CPCommandEngagementFeedback photosAttributes](self, "photosAttributes");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {

LABEL_37:
    v39 = 1;
    goto LABEL_35;
  }
  v35 = (void *)v34;
  -[_CPCommandEngagementFeedback photosAttributes](self, "photosAttributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosAttributes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqual:", v37);

  if ((v38 & 1) != 0)
    goto LABEL_37;
LABEL_34:
  v39 = 0;
LABEL_35:

  return v39;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;

  v3 = 2654435761 * self->_commandType;
  v4 = -[NSString hash](self->_commandDetail, "hash") ^ v3;
  v5 = 2654435761u * self->_uniqueButtonId;
  v6 = v4 ^ v5 ^ -[NSString hash](self->_cardSectionId, "hash");
  v7 = -[_CPSearchResultForFeedback hash](self->_result, "hash") ^ (2654435761u * self->_timestamp);
  v8 = v6 ^ v7 ^ -[NSString hash](self->_resultSectionId, "hash") ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_contactActionType) ^ (2654435761 * self->_didDisplayHandleOptions) ^ (2654435761 * self->_didSelectFromOptionsMenu);
  return v8 ^ -[_CPPhotosAttributes hash](self->_photosAttributes, "hash");
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)uniqueButtonId
{
  return self->_uniqueButtonId;
}

- (void)setUniqueButtonId:(unint64_t)a3
{
  self->_uniqueButtonId = a3;
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)resultSectionId
{
  return self->_resultSectionId;
}

- (void)setResultSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)contactActionType
{
  return self->_contactActionType;
}

- (void)setContactActionType:(int)a3
{
  self->_contactActionType = a3;
}

- (BOOL)didDisplayHandleOptions
{
  return self->_didDisplayHandleOptions;
}

- (void)setDidDisplayHandleOptions:(BOOL)a3
{
  self->_didDisplayHandleOptions = a3;
}

- (BOOL)didSelectFromOptionsMenu
{
  return self->_didSelectFromOptionsMenu;
}

- (void)setDidSelectFromOptionsMenu:(BOOL)a3
{
  self->_didSelectFromOptionsMenu = a3;
}

- (_CPPhotosAttributes)photosAttributes
{
  return self->_photosAttributes;
}

- (void)setPhotosAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_photosAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAttributes, 0);
  objc_storeStrong((id *)&self->_resultSectionId, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
}

- (_CPCommandEngagementFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCommandEngagementFeedback *v5;
  void *v6;
  void *v7;
  _CPSearchResultForFeedback *v8;
  void *v9;
  _CPSearchResultForFeedback *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _CPCommandEngagementFeedback *v23;

  v4 = a3;
  v5 = -[_CPCommandEngagementFeedback init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPCommandEngagementFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [_CPSearchResultForFeedback alloc];
      objc_msgSend(v4, "result");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_CPSearchResultForFeedback initWithFacade:](v8, "initWithFacade:", v9);
      -[_CPCommandEngagementFeedback setResult:](v5, "setResult:", v10);

    }
    objc_msgSend(v4, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "button");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCommandEngagementFeedback setUniqueButtonId:](v5, "setUniqueButtonId:", objc_msgSend(v12, "uniqueId"));

    }
    objc_msgSend(v4, "command");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[_CPCommandEngagementFeedback setCommandType:](v5, "setCommandType:", objc_msgSend(v6, "_cpCommandType"));
      objc_msgSend(v6, "commandDetail");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCommandEngagementFeedback setCommandDetail:](v5, "setCommandDetail:", v14);

    }
    objc_msgSend(v4, "cardSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "cardSection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cardSectionId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCommandEngagementFeedback setCardSectionId:](v5, "setCardSectionId:", v17);

    }
    objc_msgSend(v4, "resultSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "resultSection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCommandEngagementFeedback setResultSectionId:](v5, "setResultSectionId:", v20);

    }
    -[_CPCommandEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v6;
      -[_CPCommandEngagementFeedback setContactActionType:](v5, "setContactActionType:", objc_msgSend(v21, "contactActionType"));
      -[_CPCommandEngagementFeedback setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", objc_msgSend(v21, "didDisplayHandleOptions"));
      v22 = objc_msgSend(v21, "didSelectFromOptionsMenu");

      -[_CPCommandEngagementFeedback setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", v22);
    }
    v23 = v5;

  }
  return v5;
}

@end
