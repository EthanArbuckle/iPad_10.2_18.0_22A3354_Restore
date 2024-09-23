@implementation KSXMLElementContentsProxy

- (void)ks_prepareWithTarget:(id)a3 XMLWriter:(id)a4
{
  id v7;
  KSXMLWriter *v8;
  id target;
  id v10;
  KSXMLWriter *XMLWriter;
  KSXMLWriter *v12;
  unint64_t v13;
  void *v14;

  v7 = a3;
  v8 = (KSXMLWriter *)a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLWriter.m"), 663, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("writer"));

  }
  target = self->_target;
  self->_target = v7;
  v10 = v7;

  XMLWriter = self->_XMLWriter;
  self->_XMLWriter = v8;
  v12 = v8;

  v13 = -[KSXMLWriter openElementsCount](v12, "openElementsCount");
  self->_elementsCount = v13;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_target, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  unint64_t elementsCount;
  id target;
  KSXMLWriter *XMLWriter;
  void *v9;
  KSXMLWriter *v10;

  v10 = self->_XMLWriter;
  elementsCount = self->_elementsCount;
  objc_msgSend(a3, "invokeWithTarget:", self->_target);
  target = self->_target;
  self->_target = 0;

  if (-[KSXMLWriter openElementsCount](v10, "openElementsCount") != elementsCount)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLWriter.m"), 685, CFSTR("Writing element contents did not end the same number of sub-elements as it started"));

  }
  -[KSXMLWriter endElement](v10, "endElement");
  XMLWriter = self->_XMLWriter;
  self->_XMLWriter = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XMLWriter, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
