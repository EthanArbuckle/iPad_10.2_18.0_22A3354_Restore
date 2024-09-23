@implementation XRSchemaAnnotationContainingElementParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C690 != -1)
    dispatch_once(&qword_25583C690, &unk_24EDC2A50);
  return (id)qword_25583C688;
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;

  v30 = a3;
  if (objc_msgSend_isEqualToString_(a4, v6, (uint64_t)CFSTR("error-message"), v7, v8))
  {
    objc_msgSend_delegate(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_elementName(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_key(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValue(v30, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_elementWithName_parser_key_finishedWithErrorReplacement_(v13, v29, (uint64_t)v18, (uint64_t)self, (uint64_t)v23, v28);

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
  v12.super_class = (Class)XRSchemaAnnotationContainingElementParser;
  -[XRXMLElementParser startElementWithName:attributes:line:col:](&v12, sel_startElementWithName_attributes_line_col_, a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_setDelegate_(v7, v8, (uint64_t)self, v9, v10);
  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_storeStrong((id *)&self->_key, 0);
}

@end
