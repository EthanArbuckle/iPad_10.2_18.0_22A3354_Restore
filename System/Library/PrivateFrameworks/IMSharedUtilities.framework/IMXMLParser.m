@implementation IMXMLParser

+ (id)sharedInstance
{
  if (qword_1ECFC7650 != -1)
    dispatch_once(&qword_1ECFC7650, &unk_1E3FB3A08);
  return (id)qword_1ECFC75B0;
}

- (void)_setupTidy
{
  _TidyDoc *v3;

  if (!self->_tidyDoc)
  {
    v3 = (_TidyDoc *)MEMORY[0x1A1AE8BA4]();
    self->_tidyDoc = v3;
    if (tidyOptSetBool(v3, TidyFixUri, no) == no
      || tidyOptSetInt(self->_tidyDoc, TidyWrapLen, 0) == no
      || tidyOptSetInt(self->_tidyDoc, TidyIndentSpaces, 0) == no
      || tidyOptSetInt(self->_tidyDoc, TidyTabSize, 4uLL) == no
      || tidyOptSetInt(self->_tidyDoc, TidyNewline, 0) == no
      || tidyOptSetInt(self->_tidyDoc, TidyIndentContent, 0) == no
      || tidyOptSetBool(self->_tidyDoc, TidyVertSpace, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyNumEntities, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyEscapeCdata, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyQuoteAmpersand, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyMark, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyDropPropAttrs, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyHideComments, yes) == no
      || tidyOptSetBool(self->_tidyDoc, TidyIndentAttributes, no) == no
      || tidyOptSetBool(self->_tidyDoc, TidyXhtmlOut, yes) == no)
    {
      -[IMXMLParser _teardownTidy](self, "_teardownTidy");
    }
  }
}

- (void)_teardownTidy
{
  _TidyDoc *tidyDoc;

  tidyDoc = self->_tidyDoc;
  if (tidyDoc)
  {
    MEMORY[0x1A1AE8BD4](tidyDoc, a2);
    self->_tidyDoc = 0;
  }
}

- (id)_newDataByTidyingData:(id)a3
{
  byte *v5;
  int v6;
  id v7;
  void *v8;
  TidyBuffer v10;
  TidyBuffer errbuf;
  TidyBuffer buf;

  -[IMXMLParser _setupTidy](self, "_setupTidy");
  memset(&buf, 0, sizeof(buf));
  memset(&errbuf, 0, sizeof(errbuf));
  v5 = (byte *)objc_msgSend(a3, "bytes");
  LODWORD(a3) = objc_msgSend(a3, "length");
  v6 = tidySetCharEncoding(self->_tidyDoc, "utf8");
  tidyBufAttach(&buf, v5, (uint)a3);
  if (v6 < 0
    || tidySetErrorBuffer(self->_tidyDoc, &errbuf) < 0
    || (MEMORY[0x1A1AE8BC8](self->_tidyDoc, &buf) & 0x80000000) != 0
    || tidyCleanAndRepair(self->_tidyDoc) < 0
    || tidyRunDiagnostics(self->_tidyDoc) > 1)
  {
    -[IMXMLParser _teardownTidy](self, "_teardownTidy");
    v8 = 0;
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    MEMORY[0x1A1AE8BEC](self->_tidyDoc, &v10);
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:freeWhenDone:", v10.bp, v10.size, 1);
    tidyBufDetach(&v10);
    tidyBufFree(&v10);
  }
  tidyBufDetach(&buf);
  tidyBufFree(&buf);
  tidyBufFree(&errbuf);
  return v8;
}

- (void)invokedTidyAndSucceeded:(BOOL)a3
{
  if (a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
    getpid();
    IMLogSimulateCrashForProcessAndPID();
  }
}

- (BOOL)parseContext:(id)a3
{
  uint64_t v5;
  const void *v6;
  int v7;
  const __CFDictionary *v8;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *Value;
  CFMutableDictionaryRef v11;
  __CFDictionary *v12;
  id v13;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  IMXMLParser *v18;
  _QWORD v19[5];

  v18 = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19E2D9704;
  v19[3] = &unk_1E3FB80D8;
  v19[4] = self;
  v16 = sub_19E2D977C;
  v17 = &unk_1E3FB58C8;
  v5 = objc_msgSend(a3, "inContentAsData", MEMORY[0x1E0C809B0], 3221225472);
  self->_context = (IMXMLParserContext *)a3;
  v6 = (const void *)objc_msgSend(a3, "name");
  v7 = _IMWillLog();
  if (v7)

  v8 = (const __CFDictionary *)qword_1EE504140;
  if (!qword_1EE504140)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
    v8 = (const __CFDictionary *)CFMakeCollectable(Mutable);
    qword_1EE504140 = (uint64_t)v8;
  }
  Value = (__CFDictionary *)CFDictionaryGetValue(v8, v6);
  self->_framespace = Value;
  if (!Value)
  {
    v11 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
    v12 = (__CFDictionary *)CFMakeCollectable(v11);
    self->_framespace = v12;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1EE504140, v6, v12);
  }
  if ((sub_19E2D9704((uint64_t)v19, v5) & 1) != 0)
  {
    LOBYTE(v5) = 1;
    sub_19E2D977C((uint64_t)&v15);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
    getpid();
    IMLogSimulateCrashForProcessAndPID();
    v13 = -[IMXMLParser _newDataByTidyingData:](self, "_newDataByTidyingData:", v5);
    if (v13)
    {
      v16((uint64_t)&v15);
      if (v7)

      v5 = sub_19E2D9704((uint64_t)v19, (uint64_t)v13);
      -[IMXMLParser invokedTidyAndSucceeded:](self, "invokedTidyAndSucceeded:", v5);
    }
    else
    {

      LOBYTE(v5) = 0;
    }

    v16((uint64_t)&v15);
  }
  if (v7)
    objc_msgSend(IMParserResultsForLogging(self->_context), "length");
  self->_context = 0;
  return v5;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  void *v12;
  IMXMLParserContext *context;
  __CFDictionary *framespace;
  __CFString *MutableCopy;
  void *Value;
  IMXMLParserFrame *v17;
  _QWORD v18[5];

  v12 = (void *)MEMORY[0x1A1AE8394](self, a2, a3);
  context = self->_context;
  framespace = self->_framespace;
  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a4);
  CFStringUppercase(MutableCopy, 0);
  Value = (void *)CFDictionaryGetValue(framespace, MutableCopy);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_19E2D9BA4;
  v18[3] = &unk_1E3FB8100;
  v18[4] = context;
  if (!Value)
  {
    Value = sub_19E2D9BA4((uint64_t)v18, (uint64_t)MutableCopy);
    if (!Value)
    {
      Value = sub_19E2D9BA4((uint64_t)v18, (uint64_t)CFSTR("Default"));
      if (!Value)
        Value = (void *)objc_opt_class();
    }
    CFDictionarySetValue(framespace, MutableCopy, Value);
  }
  if (MutableCopy)
    CFRelease(MutableCopy);
  v17 = (IMXMLParserFrame *)objc_alloc_init((Class)Value);
  if (self->_topFrame)
    -[NSMutableArray addObject:](self->_otherFrames, "addObject:");
  self->_topFrame = v17;
  -[IMXMLParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:](v17, "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:", self, self->_context, a4, a5, a6, a7);
  objc_autoreleasePoolPop(v12);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  void *v10;
  IMXMLParserFrame *v11;

  v10 = (void *)MEMORY[0x1A1AE8394](self, a2, a3);
  -[IMXMLParserFrame parser:context:didEndElement:namespaceURI:qualifiedName:](self->_topFrame, "parser:context:didEndElement:namespaceURI:qualifiedName:", self, self->_context, a4, a5, a6);

  v11 = (IMXMLParserFrame *)-[NSMutableArray lastObject](self->_otherFrames, "lastObject");
  self->_topFrame = v11;
  if (v11)
    -[NSMutableArray removeLastObject](self->_otherFrames, "removeLastObject");
  objc_autoreleasePoolPop(v10);
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  void *v6;

  v6 = (void *)MEMORY[0x1A1AE8394](self, a2, a3);
  -[IMXMLParserFrame parser:context:foundCharacters:](self->_topFrame, "parser:context:foundCharacters:", self, self->_context, a4);
  objc_autoreleasePoolPop(v6);
}

- (void)parser:(id)a3 foundIgnorableWhitespace:(id)a4
{
  void *v6;

  v6 = (void *)MEMORY[0x1A1AE8394](self, a2, a3);
  -[IMXMLParserFrame parser:context:foundIgnorableWhitespace:](self->_topFrame, "parser:context:foundIgnorableWhitespace:", self, self->_context, a4);
  objc_autoreleasePoolPop(v6);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_parser, sel_abortParsing);
}

@end
