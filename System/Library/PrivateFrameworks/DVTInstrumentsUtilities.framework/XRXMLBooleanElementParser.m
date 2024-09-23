@implementation XRXMLBooleanElementParser

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v5;
  XRXMLElementParser *parent;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v5 = objc_msgSend_rangeOfString_(self->super.accumulator, a2, (uint64_t)CFSTR("false"), v2, v3) == 0x7FFFFFFFFFFFFFFFLL;
  parent = self->super.super.parent;
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v7, v5, v8, v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_elementName(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forElementName_(parent, v15, (uint64_t)v17, (uint64_t)v14, v16);

}

@end
