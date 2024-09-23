@implementation BRLTBrailleModel

- (BRLTBrailleModel)initWithUnderlyingObject:(id)a3
{
  id v5;
  BRLTBrailleModel *v6;
  BRLTBrailleModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTBrailleModel;
  v6 = -[BRLTBrailleModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingObject, a3);

  return v7;
}

+ (id)sharedModel
{
  BRLTBrailleModel *v2;
  void *v3;
  BRLTBrailleModel *v4;

  v2 = [BRLTBrailleModel alloc];
  +[BRLTBrailleModelInternal shared](BRLTBrailleModelInternal, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTBrailleModel initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

- (void)setInputTableIdentifier:(id)a3 manager:(id)a4
{
  -[BRLTBrailleModelInternal setInputTableIdentifier:manager:](self->_underlyingObject, "setInputTableIdentifier:manager:", a3, a4);
}

- (void)setOutputTableIdentifier:(id)a3 manager:(id)a4
{
  -[BRLTBrailleModelInternal setOutputTableIdentifier:manager:](self->_underlyingObject, "setOutputTableIdentifier:manager:", a3, a4);
}

- (void)setDelegate:(id)a3
{
  -[BRLTBrailleModelInternal setDelegate:](self->_underlyingObject, "setDelegate:", a3);
}

- (void)setBackTranslateByCell:(BOOL)a3
{
  -[BRLTBrailleModelInternal setBackTranslateByCell:](self->_underlyingObject, "setBackTranslateByCell:", a3);
}

- (BOOL)technicalMode
{
  return -[BRLTBrailleModelInternal technicalMode](self->_underlyingObject, "technicalMode");
}

- (void)setTechnicalMode:(BOOL)a3
{
  -[BRLTBrailleModelInternal setTechnicalMode:](self->_underlyingObject, "setTechnicalMode:", a3);
}

- (BOOL)brailleStringDirty
{
  return -[BRLTBrailleModelInternal brailleStringDirty](self->_underlyingObject, "brailleStringDirty");
}

- (BOOL)isCandidateSelectionActive
{
  return -[BRLTBrailleModelInternal isCandidateSelectionActive](self->_underlyingObject, "isCandidateSelectionActive");
}

- (id)displayedScript
{
  BRLTEditString *v3;
  void *v4;
  BRLTEditString *v5;

  v3 = [BRLTEditString alloc];
  -[BRLTBrailleModelInternal displayedScript](self->_underlyingObject, "displayedScript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRLTEditString initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (id)displayedBraille
{
  BRLTEditString *v3;
  void *v4;
  BRLTEditString *v5;

  v3 = [BRLTEditString alloc];
  -[BRLTBrailleModelInternal displayedBraille](self->_underlyingObject, "displayedBraille");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRLTEditString initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (id)bufferBrailleString
{
  return -[BRLTBrailleModelInternal bufferBrailleString](self->_underlyingObject, "bufferBrailleString");
}

- (int64_t)scriptLocationForBrailleLocation:(int64_t)a3
{
  return -[BRLTBrailleModelInternal scriptLocationForBrailleLocation:](self->_underlyingObject, "scriptLocationForBrailleLocation:", a3);
}

- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[BRLTBrailleModelInternal scriptRangeOfBrailleCellRepresentingCharacterAt:](self->_underlyingObject, "scriptRangeOfBrailleCellRepresentingCharacterAt:", a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setScript:(id)a3
{
  BRLTBrailleModelInternal *underlyingObject;
  id v4;

  underlyingObject = self->_underlyingObject;
  objc_msgSend(a3, "underlyingObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRLTBrailleModelInternal setScript:](underlyingObject, "setScript:", v4);

}

- (void)setAlert:(id)a3
{
  BRLTBrailleModelInternal *underlyingObject;
  id v4;

  underlyingObject = self->_underlyingObject;
  objc_msgSend(a3, "underlyingObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRLTBrailleModelInternal setAlert:](underlyingObject, "setAlert:", v4);

}

- (void)setTerminalOutput:(id)a3
{
  BRLTBrailleModelInternal *underlyingObject;
  id v4;

  underlyingObject = self->_underlyingObject;
  objc_msgSend(a3, "underlyingObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRLTBrailleModelInternal setTerminalOutput:](underlyingObject, "setTerminalOutput:", v4);

}

- (BOOL)editable
{
  return -[BRLTBrailleModelInternal editable](self->_underlyingObject, "editable");
}

- (void)setEditable:(BOOL)a3
{
  -[BRLTBrailleModelInternal setEditable:](self->_underlyingObject, "setEditable:", a3);
}

- (void)forceTranslate
{
  -[BRLTBrailleModelInternal forceTranslate](self->_underlyingObject, "forceTranslate");
}

- (void)handleBrailleDotPress:(id)a3
{
  -[BRLTBrailleModelInternal handleBrailleDotPress:](self->_underlyingObject, "handleBrailleDotPress:", a3);
}

- (BOOL)handleDelete
{
  return -[BRLTBrailleModelInternal handleDeleteWithSilently:](self->_underlyingObject, "handleDeleteWithSilently:", 0);
}

- (BOOL)handleDeleteSilently
{
  return -[BRLTBrailleModelInternal handleDeleteWithSilently:](self->_underlyingObject, "handleDeleteWithSilently:", 1);
}

- (BOOL)handleBrailleSelection:(_NSRange)a3
{
  return -[BRLTBrailleModelInternal handleBrailleSelectionWithNSSelection:](self->_underlyingObject, "handleBrailleSelectionWithNSSelection:", a3.location, a3.length);
}

- (BOOL)handleEscape
{
  return -[BRLTBrailleModelInternal handleEscape](self->_underlyingObject, "handleEscape");
}

- (BOOL)handleReturn
{
  return -[BRLTBrailleModelInternal handleReturn](self->_underlyingObject, "handleReturn");
}

- (void)showNextCandidate
{
  -[BRLTBrailleModelInternal showNextCandidate](self->_underlyingObject, "showNextCandidate");
}

- (void)showPreviousCandidate
{
  -[BRLTBrailleModelInternal showPreviousCandidate](self->_underlyingObject, "showPreviousCandidate");
}

- (BOOL)isWordDescriptionActive
{
  return -[BRLTBrailleModelInternal isWordDescriptionActive](self->_underlyingObject, "isWordDescriptionActive");
}

- (void)showNextWordDescription
{
  -[BRLTBrailleModelInternal showNextWordDescription](self->_underlyingObject, "showNextWordDescription");
}

- (void)showPreviousWordDescription
{
  -[BRLTBrailleModelInternal showPreviousWordDescription](self->_underlyingObject, "showPreviousWordDescription");
}

- (void)handleWordDescriptionCommand
{
  -[BRLTBrailleModelInternal handleWordDescriptionCommand](self->_underlyingObject, "handleWordDescriptionCommand");
}

- (BRLTBrailleModelInternal)underlyingObject
{
  return (BRLTBrailleModelInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
