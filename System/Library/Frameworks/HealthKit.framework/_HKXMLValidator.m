@implementation _HKXMLValidator

+ (id)validatorWithXSD:(id)a3
{
  id v4;
  const char *v5;
  int v6;
  xmlSchemaParserCtxt *v7;
  xmlSchemaParserCtxt *v8;
  xmlSchemaPtr v9;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  v7 = xmlSchemaNewMemParserCtxt(v5, v6);
  if (v7)
  {
    v8 = v7;
    v9 = xmlSchemaParse(v7);
    xmlSchemaFreeParserCtxt(v8);
    if (v9)
      v7 = (xmlSchemaParserCtxt *)objc_msgSend(objc_alloc((Class)a1), "_initWithSchema:", v9);
    else
      v7 = 0;
  }
  return v7;
}

+ (id)validatorWithPathToXSD:(id)a3
{
  xmlSchemaParserCtxt *v4;
  xmlSchemaParserCtxt *v5;
  xmlSchemaPtr v6;

  v4 = xmlSchemaNewParserCtxt((const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4));
  if (v4)
  {
    v5 = v4;
    v6 = xmlSchemaParse(v4);
    xmlSchemaFreeParserCtxt(v5);
    if (v6)
      v4 = (xmlSchemaParserCtxt *)objc_msgSend(objc_alloc((Class)a1), "_initWithSchema:", v6);
    else
      v4 = 0;
  }
  return v4;
}

- (id)_initWithSchema:(_xmlSchema *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKXMLValidator;
  result = -[_HKXMLValidator init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (void)dealloc
{
  _xmlSchema *xsdSchema;
  objc_super v4;

  xsdSchema = self->_xsdSchema;
  if (xsdSchema)
  {
    xmlSchemaFree(xsdSchema);
    self->_xsdSchema = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_HKXMLValidator;
  -[_HKXMLValidator dealloc](&v4, sel_dealloc);
}

- (BOOL)validateXML:(id)a3 simpleError:(id *)a4 detailedErrors:(id *)a5
{
  id v8;
  _HKValidationErrorTracker *v9;
  id v10;
  const char *v11;
  int v12;
  xmlDoc *Memory;
  xmlSchemaValidCtxt *v14;
  xmlSchemaValidCtxt *v15;
  uint64_t v16;
  __CFString *v17;
  BOOL v18;

  v8 = a3;
  v9 = objc_alloc_init(_HKValidationErrorTracker);
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  xmlSetGenericErrorFunc(v9, (xmlGenericErrorFunc)_ValidatorErrorFunc);
  Memory = xmlReadMemory(v11, v12, "content.xml", 0, 0);
  xmlSetGenericErrorFunc(0, 0);
  if (!Memory)
  {
    v17 = CFSTR("Failed to validate XML: unable to read XML content");
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = xmlSchemaNewValidCtxt(self->_xsdSchema);
  if (!v14)
  {
    v17 = CFSTR("Failed to validate XML: internal error creating validation context");
    if (!a4)
      goto LABEL_8;
LABEL_7:
    *a4 = objc_retainAutorelease(v17);
    goto LABEL_8;
  }
  v15 = v14;
  xmlSchemaSetValidErrors(v14, (xmlSchemaValidityErrorFunc)_ValidatorErrorFunc, (xmlSchemaValidityWarningFunc)_ValidatorWarnFunc, v9);
  v16 = xmlSchemaValidateDoc(v15, Memory);
  if (!(_DWORD)v16)
  {
    xmlSchemaFreeValidCtxt(v15);
    v17 = 0;
    v18 = 1;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to validate XML, error code %d"), v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  xmlSchemaFreeValidCtxt(v15);
  if (a4)
    goto LABEL_7;
LABEL_8:
  if (a5)
  {
    -[_HKValidationErrorTracker errorMessage](v9, "errorMessage");
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_14:

  return v18;
}

@end
