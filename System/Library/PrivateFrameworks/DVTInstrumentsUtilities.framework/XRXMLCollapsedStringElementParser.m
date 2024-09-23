@implementation XRXMLCollapsedStringElementParser

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  XRXMLElementParser *parent;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  parent = self->super.super.parent;
  objc_msgSend_collapsedStringValue(self, a2, v2, v3, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_elementName(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forElementName_(parent, v12, (uint64_t)v14, (uint64_t)v11, v13);

}

@end
