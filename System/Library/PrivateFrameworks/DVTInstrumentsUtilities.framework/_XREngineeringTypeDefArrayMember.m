@implementation _XREngineeringTypeDefArrayMember

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  XRXMLElementParser *parent;
  NSMutableString *accumulator;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;

  parent = self->super.super.parent;
  accumulator = self->super.accumulator;
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x24BDD14A8], a2, v2, v3, v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByTrimmingCharactersInSet_(accumulator, v8, (uint64_t)v19, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_elementName(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addString_elementType_(parent, v17, (uint64_t)v11, (uint64_t)v16, v18);

}

@end
