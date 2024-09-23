@implementation XRXMLElementParser

+ (id)_elementNameToClassMap
{
  return 0;
}

+ (id)_elementNameToKVCMap
{
  if (qword_25583C788 != -1)
    dispatch_once(&qword_25583C788, &unk_24EDC2B10);
  return (id)qword_25583C780;
}

- (XRXMLElementParser)initWithElementName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  XRXMLElementParser *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *elementToClass;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *elementToKVC;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *elementName;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)XRXMLElementParser;
  v8 = -[XRXMLElementParser init](&v30, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend__elementNameToClassMap(v9, v10, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    elementToClass = v8->_elementToClass;
    v8->_elementToClass = (NSDictionary *)v14;

    v16 = (void *)objc_opt_class();
    objc_msgSend__elementNameToKVCMap(v16, v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    elementToKVC = v8->_elementToKVC;
    v8->_elementToKVC = (NSDictionary *)v21;

    v27 = objc_msgSend_copy(v6, v23, v24, v25, v26);
    elementName = v8->_elementName;
    v8->_elementName = (NSString *)v27;

    objc_storeStrong(&v8->context, a4);
  }

  return v8;
}

- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6
{
  id v10;
  NSDictionary *elementToClass;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  XRXMLIgnoreElementParser *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v10 = a4;
  elementToClass = self->_elementToClass;
  v12 = a3;
  v16 = (objc_class *)objc_msgSend_objectForKeyedSubscript_(elementToClass, v13, (uint64_t)v12, v14, v15);
  if (!v16)
  {
    v26 = [XRXMLIgnoreElementParser alloc];
    v20 = objc_msgSend_initWithElementName_context_(v26, v27, (uint64_t)v12, (uint64_t)self->context, v28);
    goto LABEL_6;
  }
  v17 = [v16 alloc];
  v20 = objc_msgSend_initWithElementName_context_(v17, v18, (uint64_t)v12, (uint64_t)self->context, v19);

  if (v10 && objc_msgSend_count(v10, v21, v22, v23, v24))
  {
    v25 = v10;
    v12 = *(id *)(v20 + 80);
    *(_QWORD *)(v20 + 80) = v25;
LABEL_6:

  }
  objc_storeStrong((id *)(v20 + 16), self);
  *(_QWORD *)(v20 + 24) = a5;
  *(_QWORD *)(v20 + 32) = a6;
  objc_msgSend__handleStart((void *)v20, v29, v30, v31, v32);

  return (id)v20;
}

- (id)lineAndColumnForElementStart
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%lld:%lld"), v2, v3, self->_lineOfStart, self->_colOfStart);
}

- (id)lineAndColumnForElementEnd
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%lld:%lld"), v2, v3, self->_lineOfEnd, self->_colOfEnd);
}

- (id)endElementAtLine:(int64_t)a3 col:(int64_t)a4
{
  uint64_t v4;
  XRXMLElementParser *v6;
  XRXMLElementParser *parent;

  self->_lineOfEnd = a3;
  self->_colOfEnd = a4;
  objc_msgSend__handleCompletion(self, a2, a3, a4, v4);
  v6 = self->parent;
  parent = self->parent;
  self->parent = 0;

  return v6;
}

- (void)processCharacters:(id)a3
{
  ((void (*)(XRXMLElementParser *, char *, id))MEMORY[0x24BEDD108])(self, sel__handleCharacters_, a3);
}

- (void)setValue:(id)a3 forElementName:(id)a4
{
  NSDictionary *elementToKVC;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  elementToKVC = self->_elementToKVC;
  v7 = a3;
  objc_msgSend_objectForKeyedSubscript_(elementToKVC, v8, (uint64_t)v14, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend_setValue_forKey_(self, v11, (uint64_t)v7, (uint64_t)v13, v12);
  else
    objc_msgSend_setValue_forKey_(self, v11, (uint64_t)v7, (uint64_t)v14, v12);

}

- (id)valueForElementName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_elementToKVC, v5, (uint64_t)v4, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend_valueForKey_(self, v8, (uint64_t)v11, v9, v10);
  else
    objc_msgSend_valueForKey_(self, v8, (uint64_t)v4, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)simulateEmptyElement:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend_startElementWithName_attributes_line_col_(self, a2, (uint64_t)a3, 0, self->_lineOfStart, self->_colOfStart);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_endElementAtLine_col_(v7, v4, self->_lineOfStart, self->_colOfStart, v5);

}

- (NSString)elementName
{
  return self->_elementName;
}

- (NSDictionary)elementAttributes
{
  return self->_elementAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementAttributes, 0);
  objc_storeStrong((id *)&self->_elementName, 0);
  objc_storeStrong((id *)&self->_elementToKVC, 0);
  objc_storeStrong((id *)&self->_elementToClass, 0);
  objc_storeStrong((id *)&self->parent, 0);
  objc_storeStrong(&self->context, 0);
}

@end
