@implementation XRSchemaSimpleTypeElementParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C8A0 != -1)
    dispatch_once(&qword_25583C8A0, &unk_24EDC2B90);
  return (id)qword_25583C898;
}

- (void)checkForAnnotationAndPatternAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id WeakRetained;

  if (self->_patternParser)
  {
    if (self->_errorMessage)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_identifier(self, v3, v4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_elementWithName_parser_key_finishedWithErrorReplacement_(WeakRetained, v8, (uint64_t)v7, (uint64_t)self->_patternParser, (uint64_t)self->_parsedRegex, self->_errorMessage);

    }
  }
}

- (void)finishedParsingPatternWithParser:(id)a3 patternValue:(id)a4
{
  XRXMLElementParser *v6;
  NSString *v7;
  XRXMLElementParser *patternParser;
  XRXMLElementParser *v9;
  NSString *parsedRegex;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (XRXMLElementParser *)a3;
  v7 = (NSString *)a4;
  patternParser = self->_patternParser;
  self->_patternParser = v6;
  v9 = v6;

  parsedRegex = self->_parsedRegex;
  self->_parsedRegex = v7;

  objc_msgSend_checkForAnnotationAndPatternAvailable(self, v11, v12, v13, v14);
}

- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *errorMessage;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  if (objc_msgSend_isEqualToString_(a4, v6, (uint64_t)CFSTR("error-message"), v7, v8))
  {
    objc_msgSend_stringValue(v19, v9, v10, v11, v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorMessage = self->_errorMessage;
    self->_errorMessage = v13;

    objc_msgSend_checkForAnnotationAndPatternAvailable(self, v15, v16, v17, v18);
  }

}

- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)XRSchemaSimpleTypeElementParser;
  -[XRXMLElementParser startElementWithName:attributes:line:col:](&v12, sel_startElementWithName_attributes_line_col_, a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend_setDelegate_(v7, v8, (uint64_t)self, v9, v10);
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (XRSchemaAnnotationPropertyReportingDelegate)delegate
{
  return (XRSchemaAnnotationPropertyReportingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_parsedRegex, 0);
  objc_storeStrong((id *)&self->_patternParser, 0);
}

@end
