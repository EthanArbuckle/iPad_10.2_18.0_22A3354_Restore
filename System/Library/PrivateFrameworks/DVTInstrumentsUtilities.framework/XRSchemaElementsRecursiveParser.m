@implementation XRSchemaElementsRecursiveParser

- (void)_handleStart
{
  NSMutableDictionary *v3;
  NSMutableDictionary *errorReplacementsByKey;

  if (!self->super.parent)
  {
    v3 = (NSMutableDictionary *)objc_opt_new();
    errorReplacementsByKey = self->_errorReplacementsByKey;
    self->_errorReplacementsByKey = v3;

  }
}

- (void)elementWithName:(id)a3 parser:(id)a4 key:(id)a5 finishedWithErrorReplacement:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  XRSchemaErrorReplacementElement *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->super.parent && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_elementWithName_parser_key_finishedWithErrorReplacement_(self->super.parent, v13, (uint64_t)v26, (uint64_t)v10, (uint64_t)v11, v12);
  }
  else
  {
    v14 = self->super.context;
    objc_msgSend_objectForKeyedSubscript_(self->_errorReplacementsByKey, v15, (uint64_t)v11, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend_reportProblemWithElement_failure_(v14, v18, (uint64_t)v10, (uint64_t)CFSTR("Key: '%@' used for error replacement: '%@' is not unique"), v19, v11, v12);
    }
    else
    {
      v21 = [XRSchemaErrorReplacementElement alloc];
      v23 = (void *)objc_msgSend_initWithName_key_replacementString_(v21, v22, (uint64_t)v26, (uint64_t)v11, (uint64_t)v12);
      objc_msgSend_setObject_forKeyedSubscript_(self->_errorReplacementsByKey, v24, (uint64_t)v23, (uint64_t)v11, v25);

    }
  }

}

- (id)errorMessagesReplacements
{
  return (id)((uint64_t (*)(NSMutableDictionary *, char *))MEMORY[0x24BEDD108])(self->_errorReplacementsByKey, sel_allValues);
}

- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  XRSchemaAnnotationContainingElementParser *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  XRSchemaSimpleTypeElementParser *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  XRSchemaElementsRecursiveParser *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v10 = a3;
  v11 = a4;
  if ((objc_msgSend_isEqualToString_(v10, v12, (uint64_t)CFSTR("xs:unique"), v13, v14) & 1) != 0
    || objc_msgSend_isEqualToString_(v10, v15, (uint64_t)CFSTR("xs:keyref"), v16, v17))
  {
    v21 = [XRSchemaAnnotationContainingElementParser alloc];
    v24 = objc_msgSend_initWithElementName_context_(v21, v22, (uint64_t)v10, 0, v23);
    objc_msgSend_objectForKeyedSubscript_(v11, v25, (uint64_t)CFSTR("name"), v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDelegate_((void *)v24, v29, (uint64_t)self, v30, v31);
    objc_msgSend_setKey_((void *)v24, v32, (uint64_t)v28, v33, v34);

  }
  else if ((objc_msgSend_isEqualToString_(v10, v18, (uint64_t)CFSTR("xs:simpleType"), v19, v20) & 1) != 0
         || objc_msgSend_isEqualToString_(v10, v35, (uint64_t)CFSTR("xs:simpleContent"), v36, v37))
  {
    v38 = [XRSchemaSimpleTypeElementParser alloc];
    v24 = objc_msgSend_initWithElementName_context_(v38, v39, (uint64_t)v10, 0, v40);
    objc_msgSend_setDelegate_((void *)v24, v41, (uint64_t)self, v42, v43);
    objc_msgSend_setIdentifier_((void *)v24, v44, (uint64_t)CFSTR("xs:pattern"), v45, v46);
  }
  else
  {
    v47 = [XRSchemaElementsRecursiveParser alloc];
    v24 = objc_msgSend_initWithElementName_context_(v47, v48, (uint64_t)v10, 0, v49);
  }
  objc_storeStrong((id *)(v24 + 16), self);
  *(_QWORD *)(v24 + 24) = a5;
  *(_QWORD *)(v24 + 32) = a6;
  objc_msgSend__handleStart((void *)v24, v50, v51, v52, v53);

  return (id)v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorReplacementsByKey, 0);
}

@end
