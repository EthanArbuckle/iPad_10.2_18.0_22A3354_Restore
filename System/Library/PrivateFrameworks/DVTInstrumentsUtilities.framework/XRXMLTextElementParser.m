@implementation XRXMLTextElementParser

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  XRXMLElementParser *parent;
  const char *v7;
  uint64_t v8;
  id v9;

  parent = self->super.super.parent;
  objc_msgSend_elementName(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forElementName_(parent, v7, (uint64_t)self, (uint64_t)v9, v8);

}

@end
