@implementation XRSchemaAnnotationElementParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C728 != -1)
    dispatch_once(&qword_25583C728, &unk_24EDC2AD0);
  return (id)qword_25583C720;
}

- (void)textParserCompletedParsing:(id)a3 elementName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textParserCompletedParsing_elementName_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (XRSchemaAnnotationTextValuesDelegate)delegate
{
  return (XRSchemaAnnotationTextValuesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
