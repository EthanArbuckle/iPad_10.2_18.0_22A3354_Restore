@implementation XRXMLValidator

- (XRXMLValidator)initWithSourceURL:(id)a3 schemaURL:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  XRXMLValidator *v12;
  uint64_t v13;
  NSURL *url;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSURL *schemaURL;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSFileHandle *errorFile;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSFileHandle *diagnosticFile;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)XRXMLValidator;
  v12 = -[XRXMLValidator init](&v34, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v6, v8, v9, v10, v11);
    url = v12->_url;
    v12->_url = (NSURL *)v13;

    v19 = objc_msgSend_copy(v7, v15, v16, v17, v18);
    schemaURL = v12->_schemaURL;
    v12->_schemaURL = (NSURL *)v19;

    objc_msgSend_fileHandleWithStandardError(MEMORY[0x24BDD1578], v21, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    errorFile = v12->_errorFile;
    v12->_errorFile = (NSFileHandle *)v25;

    objc_msgSend_fileHandleWithStandardOutput(MEMORY[0x24BDD1578], v27, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    diagnosticFile = v12->_diagnosticFile;
    v12->_diagnosticFile = (NSFileHandle *)v31;

    objc_storeStrong((id *)&v12->_log, MEMORY[0x24BDACB78]);
  }

  return v12;
}

- (id)findErrorMessageForErrorPtr:(_xmlError *)a3
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int code;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char isEqualToString;
  uint64_t v21;
  char **p_str2;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  id v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v4 = self->_errorReplacements;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v49;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v12)
        objc_enumerationMutation(v4);
      v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
      code = a3->code;
      if (code == 1839)
        break;
      if (code == 1877)
      {
        objc_msgSend_name(*(void **)(*((_QWORD *)&v48 + 1) + 8 * v13), v7, v8, v9, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)CFSTR("xs:unique"), v18, v19);

        p_str2 = &a3->str2;
        if ((isEqualToString & 1) != 0
          || (objc_msgSend_name(v14, v7, v21, v9, v10),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("xs:keyref"), v25, v26),
              v23,
              p_str2 = &a3->str3,
              v27))
        {
          v8 = (uint64_t)*p_str2;
          if (*p_str2)
          {
            objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, v8, v9, v10);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_key(v14, v29, v30, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend_containsString_(v28, v34, (uint64_t)v33, v35, v36);
LABEL_13:
            v45 = v37;

            if ((v45 & 1) != 0)
            {
              v46 = v14;

              goto LABEL_19;
            }

          }
        }
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v48, (uint64_t)v52, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, (uint64_t)a3->str2, v9, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_key(v14, v38, v39, v40, v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_isEqualToString_(v28, v42, (uint64_t)v33, v43, v44);
    goto LABEL_13;
  }
LABEL_17:
  v46 = 0;
LABEL_19:

  return v46;
}

- (BOOL)validate
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  XRSchemaElementsRecursiveParser *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *v30;
  NSArray *errorReplacements;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  xmlSchemaParserCtxt *v37;
  xmlSchema *v38;
  xmlSchemaValidCtxt *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void (__cdecl *v45)(void *, xmlErrorPtr);
  void *v46;
  xmlParserCtxtPtr v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  xmlParserCtxt *v52;
  const char *v53;
  xmlDoc *File;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  BOOL v60;
  void (__cdecl *v62)(void *, xmlErrorPtr);

  self->_errorsEmittedCount = 0;
  self->_limitMessageEmitted = 0;
  v3 = (void *)objc_opt_new();
  objc_msgSend_setErrorFile_(v3, v4, (uint64_t)self->_errorFile, v5, v6);
  objc_msgSend_setLog_(v3, v7, (uint64_t)self->_log, v8, v9);
  objc_msgSend_setUrlBeingParsed_(v3, v10, (uint64_t)self->_schemaURL, v11, v12);
  v13 = [XRSchemaElementsRecursiveParser alloc];
  v16 = (void *)objc_msgSend_initWithElementName_context_(v13, v14, (uint64_t)CFSTR("xs:schema"), (uint64_t)v3, v15);
  objc_msgSend_inputStreamWithURL_(MEMORY[0x24BDBCE90], v17, (uint64_t)self->_schemaURL, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseStream_topLevelParser_delegate_(XRXMLParser, v21, (uint64_t)v20, (uint64_t)v16, 0);
  if ((objc_msgSend_passed(v3, v22, v23, v24, v25) & 1) != 0)
  {
    objc_msgSend_errorMessagesReplacements(v16, v26, v27, v28, v29);
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    errorReplacements = self->_errorReplacements;
    self->_errorReplacements = v30;

    xmlLockLibrary();
    v36 = (const char *)objc_msgSend_fileSystemRepresentation(self->_schemaURL, v32, v33, v34, v35);
    v37 = xmlSchemaNewParserCtxt(v36);
    v38 = xmlSchemaParse(v37);
    v39 = xmlSchemaNewValidCtxt(v38);
    xmlSchemaSetValidStructuredErrors(v39, (xmlStructuredErrorFunc)sub_226362D80, self);
    v44 = (const char *)objc_msgSend_fileSystemRepresentation(self->_url, v40, v41, v42, v43);
    xmlSchemaValidateSetFilename(v39, v44);
    v45 = *__xmlStructuredError();
    v46 = *__xmlStructuredErrorContext();
    xmlSetStructuredErrorFunc(self, (xmlStructuredErrorFunc)sub_2263630A8);
    v47 = xmlNewParserCtxt();
    if (v47)
    {
      v52 = v47;
      v62 = v45;
      v53 = (const char *)objc_msgSend_fileSystemRepresentation(self->_url, v48, v49, v50, v51);
      File = xmlCtxtReadFile(v52, v53, 0, 0);
      xmlFreeParserCtxt(v52);
      if (File)
      {
        xmlFreeDoc(File);
        v59 = (const char *)objc_msgSend_fileSystemRepresentation(self->_url, v55, v56, v57, v58);
        v60 = xmlSchemaValidateFile(v39, v59, 0) == 0;
      }
      else
      {
        v60 = 0;
      }
      v45 = v62;
    }
    else
    {
      objc_msgSend_xr_writeStringWithFormat_(self->_errorFile, v48, (uint64_t)CFSTR("Failed to create the XML parsing context"), v50, v51);
      v60 = 0;
    }
    xmlSetStructuredErrorFunc(v46, v45);
    xmlSchemaFreeValidCtxt(v39);
    xmlSchemaFree(v38);
    xmlSchemaFreeParserCtxt(v37);
    xmlUnlockLibrary();
  }
  else
  {
    objc_msgSend_xr_writeStringWithFormat_(self->_errorFile, v26, (uint64_t)CFSTR("Failed to parse the XSD schema for validation"), v28, v29);
    v60 = 0;
  }

  return v60;
}

- (NSFileHandle)errorFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setErrorFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSFileHandle)diagnosticFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDiagnosticFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)errorLimit
{
  return self->_errorLimit;
}

- (void)setErrorLimit:(unint64_t)a3
{
  self->_errorLimit = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_diagnosticFile, 0);
  objc_storeStrong((id *)&self->_errorFile, 0);
  objc_storeStrong((id *)&self->_errorReplacements, 0);
  objc_storeStrong((id *)&self->_schemaURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
