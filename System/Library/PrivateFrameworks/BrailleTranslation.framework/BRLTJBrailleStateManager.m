@implementation BRLTJBrailleStateManager

- (BRLTJBrailleStateManager)initWithUnderlyingObject:(id)a3
{
  id v5;
  BRLTJBrailleStateManager *v6;
  BRLTJBrailleStateManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTJBrailleStateManager;
  v6 = -[BRLTJBrailleStateManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingObject, a3);

  return v7;
}

- (void)setDelegate:(id)a3
{
  -[BRLTJBrailleStateManagerInternal setDelegate:](self->_underlyingObject, "setDelegate:", a3);
}

- (void)setTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5 candidateSelectionLanguage:(id)a6
{
  -[BRLTJBrailleStateManagerInternal setTranslationDelegate:outputMode:inputMode:candidateSelectionLanguage:](self->_underlyingObject, "setTranslationDelegate:outputMode:inputMode:candidateSelectionLanguage:", a3, a4, a5, a6);
}

+ (id)manager
{
  BRLTJBrailleStateManager *v2;
  void *v3;
  BRLTJBrailleStateManager *v4;

  v2 = [BRLTJBrailleStateManager alloc];
  +[BRLTJBrailleStateManagerInternal manager](BRLTJBrailleStateManagerInternal, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTJBrailleStateManager initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

- (BOOL)isEditing
{
  return -[BRLTJBrailleStateManagerInternal isEditing](self->_underlyingObject, "isEditing");
}

- (void)setScript:(id)a3
{
  BRLTJBrailleStateManagerInternal *underlyingObject;
  id v4;

  underlyingObject = self->_underlyingObject;
  objc_msgSend(a3, "underlyingObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRLTJBrailleStateManagerInternal setScript:](underlyingObject, "setScript:", v4);

}

- (void)insertBrailleChar:(id)a3
{
  -[BRLTJBrailleStateManagerInternal insertBrailleChar:](self->_underlyingObject, "insertBrailleChar:", objc_msgSend(a3, "bits"));
}

- (BOOL)delete
{
  return -[BRLTJBrailleStateManagerInternal delete](self->_underlyingObject, "delete");
}

- (BOOL)forwardDelete
{
  return -[BRLTJBrailleStateManagerInternal forwardDelete](self->_underlyingObject, "forwardDelete");
}

- (void)escapeCommand
{
  -[BRLTJBrailleStateManagerInternal escapeCommand](self->_underlyingObject, "escapeCommand");
}

- (BOOL)returnCommand
{
  return -[BRLTJBrailleStateManagerInternal returnCommand](self->_underlyingObject, "returnCommand");
}

- (void)wordDescriptionCommand
{
  -[BRLTJBrailleStateManagerInternal wordDescriptionCommand](self->_underlyingObject, "wordDescriptionCommand");
}

- (void)setBrailleSelection:(_NSRange)a3
{
  -[BRLTJBrailleStateManagerInternal setBrailleSelection:](self->_underlyingObject, "setBrailleSelection:", a3.location, a3.length);
}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  return -[BRLTJBrailleStateManagerInternal scriptLocationForBrailleLocation:](self->_underlyingObject, "scriptLocationForBrailleLocation:", a3);
}

- (BOOL)isCandidateSelectionActive
{
  return -[BRLTJBrailleStateManagerInternal isCandidateSelectionActive](self->_underlyingObject, "isCandidateSelectionActive");
}

- (void)startCandidateSelection
{
  -[BRLTJBrailleStateManagerInternal startCandidateSelection](self->_underlyingObject, "startCandidateSelection");
}

- (void)showNextCandidate
{
  -[BRLTJBrailleStateManagerInternal showNextCandidate](self->_underlyingObject, "showNextCandidate");
}

- (void)showPreviousCandidate
{
  -[BRLTJBrailleStateManagerInternal showPreviousCandidate](self->_underlyingObject, "showPreviousCandidate");
}

- (void)selectCandidate
{
  -[BRLTJBrailleStateManagerInternal selectCandidate](self->_underlyingObject, "selectCandidate");
}

- (BOOL)isWordDescriptionActive
{
  return -[BRLTJBrailleStateManagerInternal isWordDescriptionActive](self->_underlyingObject, "isWordDescriptionActive");
}

- (void)showNextWordDescription
{
  -[BRLTJBrailleStateManagerInternal showNextWordDescription](self->_underlyingObject, "showNextWordDescription");
}

- (void)showPreviousWordDescription
{
  -[BRLTJBrailleStateManagerInternal showPreviousWordDescription](self->_underlyingObject, "showPreviousWordDescription");
}

- (BOOL)isShowingAlert
{
  return -[BRLTJBrailleStateManagerInternal isShowingAlert](self->_underlyingObject, "isShowingAlert");
}

- (void)setIsShowingAlert:(BOOL)a3
{
  -[BRLTJBrailleStateManagerInternal setIsShowingAlert:](self->_underlyingObject, "setIsShowingAlert:", a3);
}

- (BOOL)isShowingTerminalOutput
{
  return -[BRLTJBrailleStateManagerInternal isShowingTerminalOutput](self->_underlyingObject, "isShowingTerminalOutput");
}

- (void)setIsShowingTerminalOutput:(BOOL)a3
{
  -[BRLTJBrailleStateManagerInternal setIsShowingTerminalOutput:](self->_underlyingObject, "setIsShowingTerminalOutput:", a3);
}

- (BRLTJEditableString)displayedScript
{
  BRLTJEditableString *v3;
  void *v4;
  BRLTJEditableString *v5;

  v3 = [BRLTJEditableString alloc];
  -[BRLTJBrailleStateManagerInternal displayedScript](self->_underlyingObject, "displayedScript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRLTJEditableString initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (BRLTJBrailleString)displayedBraille
{
  BRLTJBrailleString *v3;
  void *v4;
  BRLTJBrailleString *v5;

  v3 = [BRLTJBrailleString alloc];
  -[BRLTJBrailleStateManagerInternal displayedBraille](self->_underlyingObject, "displayedBraille");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRLTJBrailleString initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (BRLTJBrailleStateManagerInternal)underlyingObject
{
  return (BRLTJBrailleStateManagerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
