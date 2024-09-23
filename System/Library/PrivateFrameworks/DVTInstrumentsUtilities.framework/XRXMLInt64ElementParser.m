@implementation XRXMLInt64ElementParser

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int LongLong;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  XRXMLElementParser *parent;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = 0;
  objc_msgSend_stringValue(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LongLong = objc_msgSend_xr_getLongLong_(v6, v7, (uint64_t)&v23, v8, v9);

  if (LongLong)
  {
    parent = self->super.super.parent;
    objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v11, v23, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_elementName(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forElementName_(parent, v21, (uint64_t)v15, (uint64_t)v20, v22);

  }
}

@end
