@implementation XRXMLSimpleStringElementParser

- (NSString)stringValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSString *)(id)objc_msgSend_copy(self->accumulator, a2, v2, v3, v4);
}

- (id)collapsedStringValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  void *v31;

  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x24BDD14A8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_length(self->accumulator, v7, v8, v9, v10);
  v12 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
  v17 = objc_msgSend_length(self->accumulator, v13, v14, v15, v16);
  if (v17)
  {
    v21 = v17;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    do
    {
      v25 = objc_msgSend_characterAtIndex_(self->accumulator, v18, v22, v19, v20);
      if ((objc_msgSend_characterIsMember_(v6, v26, v25, v27, v28) & 1) != 0)
      {
        v23 |= v24 != 0;
      }
      else
      {
        if ((v23 & 1) != 0)
          v12[v24++] = 32;
        v23 = 0;
        v12[v24++] = v25;
      }
      ++v22;
    }
    while (v21 != v22);
  }
  else
  {
    v24 = 0;
  }
  v29 = objc_alloc(MEMORY[0x24BDD17C8]);
  v31 = (void *)objc_msgSend_initWithCharactersNoCopy_length_freeWhenDone_(v29, v30, (uint64_t)v12, v24, 1);

  return v31;
}

- (void)_handleCharacters:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSMutableString *accumulator;
  NSMutableString *v7;
  NSMutableString *v8;

  accumulator = self->accumulator;
  if (accumulator)
  {
    objc_msgSend_appendString_(accumulator, a2, (uint64_t)a3, v3, v4);
  }
  else
  {
    v7 = (NSMutableString *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3, v4);
    v8 = self->accumulator;
    self->accumulator = v7;

  }
}

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  XRXMLElementParser *parent;
  NSMutableString *accumulator;
  const char *v7;
  uint64_t v8;
  id v9;

  parent = self->super.parent;
  accumulator = self->accumulator;
  objc_msgSend_elementName(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forElementName_(parent, v7, (uint64_t)accumulator, (uint64_t)v9, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->accumulator, 0);
}

@end
