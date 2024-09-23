@implementation _XREngineeringTypeDefImplClass

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSMutableString *accumulator;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  XRXMLElementParser *parent;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  accumulator = self->super.accumulator;
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x24BDD14A8], a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByTrimmingCharactersInSet_(accumulator, v8, (uint64_t)v7, v9, v10);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (qword_25583C7A8 != -1)
    dispatch_once(&qword_25583C7A8, &unk_24EDC4130);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_25583C7A0, v11, (uint64_t)v25, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    sub_22636FDE4();
  v19 = v14;
  parent = self->super.super.parent;
  v21 = objc_msgSend_unsignedCharValue(v14, v15, v16, v17, v18);
  objc_msgSend_setImpl_(parent, v22, v21, v23, v24);

}

@end
