@implementation XRSchemaAnnotationAppInfoElementParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C650 != -1)
    dispatch_once(&qword_25583C650, &unk_24EDC29F0);
  return (id)qword_25583C648;
}

- (void)setValue:(id)a3 forElementName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_textParserCompletedParsing_elementName_(self->super.parent, v7, (uint64_t)v9, (uint64_t)v6, v8);

}

@end
