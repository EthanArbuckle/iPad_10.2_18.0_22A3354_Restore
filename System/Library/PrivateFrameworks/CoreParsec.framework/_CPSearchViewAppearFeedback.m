@implementation _CPSearchViewAppearFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingApp, 0);
  objc_storeStrong((id *)&self->_preexistingInput, 0);
}

- (_CPSearchViewAppearFeedback)init
{
  _CPSearchViewAppearFeedback *v2;
  _CPSearchViewAppearFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSearchViewAppearFeedback;
  v2 = -[_CPSearchViewAppearFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSearchViewAppearFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPSearchViewAppearFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPSearchViewAppearFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _CPSearchViewAppearFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPSearchViewAppearFeedback;
  v5 = -[_CPSearchViewAppearFeedback init](&v12, sel_init);
  if (v5)
  {
    -[_CPSearchViewAppearFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    -[_CPSearchViewAppearFeedback setViewAppearEvent:](v5, "setViewAppearEvent:", objc_msgSend(v4, "viewAppearEvent"));
    -[_CPSearchViewAppearFeedback setIsOnLockScreen:](v5, "setIsOnLockScreen:", objc_msgSend(v4, "isOnLockScreen"));
    -[_CPSearchViewAppearFeedback setIsOverApp:](v5, "setIsOverApp:", objc_msgSend(v4, "isOverApp"));
    -[_CPSearchViewAppearFeedback setReaderTextAvailable:](v5, "setReaderTextAvailable:", objc_msgSend(v4, "readerTextAvailable"));
    objc_msgSend(v4, "preexistingInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "preexistingInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPSearchViewAppearFeedback setPreexistingInput:](v5, "setPreexistingInput:", v7);

    }
    objc_msgSend(v4, "originatingApp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "originatingApp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPSearchViewAppearFeedback setOriginatingApp:](v5, "setOriginatingApp:", v9);

    }
    -[_CPSearchViewAppearFeedback setIsUsingLoweredSearchBar:](v5, "setIsUsingLoweredSearchBar:", objc_msgSend(v4, "isUsingLoweredSearchBar"));
    v10 = v5;
  }

  return v5;
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPSearchViewAppearFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPSearchViewAppearFeedback viewAppearEvent](self, "viewAppearEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPSearchViewAppearFeedback isOnLockScreen](self, "isOnLockScreen"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchViewAppearFeedback isOverApp](self, "isOverApp"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchViewAppearFeedback readerTextAvailable](self, "readerTextAvailable"))
    PBDataWriterWriteBOOLField();
  -[_CPSearchViewAppearFeedback preexistingInput](self, "preexistingInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPSearchViewAppearFeedback originatingApp](self, "originatingApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_CPSearchViewAppearFeedback isUsingLoweredSearchBar](self, "isUsingLoweredSearchBar"))
    PBDataWriterWriteBOOLField();

}

- (int)viewAppearEvent
{
  return self->_viewAppearEvent;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isOnLockScreen
{
  return self->_isOnLockScreen;
}

- (BOOL)readerTextAvailable
{
  return self->_readerTextAvailable;
}

- (NSString)preexistingInput
{
  return self->_preexistingInput;
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (BOOL)isUsingLoweredSearchBar
{
  return self->_isUsingLoweredSearchBar;
}

- (BOOL)isOverApp
{
  return self->_isOverApp;
}

- (void)setViewAppearEvent:(int)a3
{
  self->_viewAppearEvent = a3;
}

- (void)setIsUsingLoweredSearchBar:(BOOL)a3
{
  self->_isUsingLoweredSearchBar = a3;
}

- (void)setReaderTextAvailable:(BOOL)a3
{
  self->_readerTextAvailable = a3;
}

- (void)setIsOverApp:(BOOL)a3
{
  self->_isOverApp = a3;
}

- (void)setIsOnLockScreen:(BOOL)a3
{
  self->_isOnLockScreen = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _CPSearchViewAppearFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int viewAppearEvent;
  int isOnLockScreen;
  int isOverApp;
  int readerTextAvailable;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int isUsingLoweredSearchBar;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_17;
  viewAppearEvent = self->_viewAppearEvent;
  if (viewAppearEvent != objc_msgSend(v4, "viewAppearEvent"))
    goto LABEL_17;
  isOnLockScreen = self->_isOnLockScreen;
  if (isOnLockScreen != objc_msgSend(v4, "isOnLockScreen"))
    goto LABEL_17;
  isOverApp = self->_isOverApp;
  if (isOverApp != objc_msgSend(v4, "isOverApp"))
    goto LABEL_17;
  readerTextAvailable = self->_readerTextAvailable;
  if (readerTextAvailable != objc_msgSend(v4, "readerTextAvailable"))
    goto LABEL_17;
  -[_CPSearchViewAppearFeedback preexistingInput](self, "preexistingInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preexistingInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_16;
  -[_CPSearchViewAppearFeedback preexistingInput](self, "preexistingInput");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPSearchViewAppearFeedback preexistingInput](self, "preexistingInput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preexistingInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_CPSearchViewAppearFeedback originatingApp](self, "originatingApp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingApp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[_CPSearchViewAppearFeedback originatingApp](self, "originatingApp");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      isUsingLoweredSearchBar = self->_isUsingLoweredSearchBar;
      v22 = isUsingLoweredSearchBar == objc_msgSend(v4, "isUsingLoweredSearchBar");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_CPSearchViewAppearFeedback originatingApp](self, "originatingApp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingApp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = (2654435761 * self->_viewAppearEvent) ^ (2654435761u * self->_timestamp) ^ (2654435761 * self->_isOnLockScreen) ^ (2654435761 * self->_isOverApp) ^ (2654435761 * self->_readerTextAvailable);
  v4 = -[NSString hash](self->_preexistingInput, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_originatingApp, "hash") ^ (2654435761 * self->_isUsingLoweredSearchBar);
}

- (void)setPreexistingInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setOriginatingApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
