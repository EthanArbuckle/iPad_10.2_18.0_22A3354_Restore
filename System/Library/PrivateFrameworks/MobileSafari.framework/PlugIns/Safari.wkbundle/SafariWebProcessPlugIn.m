@implementation SafariWebProcessPlugIn

- (id)pageControllerWithBrowserContextController:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  Class *v17;
  int isEqualToString;
  id v19;
  const char *v20;
  void *v21;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend__groupIdentifier(v4, v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_pageGroup(v4, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend_isEqualToString_(v10, v8, *MEMORY[0x24BDE81F0], v9) & 1) != 0)
  {
    v17 = (Class *)0x24BDE81D0;
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x24BE833D8], v12);
    v17 = (Class *)&off_24F05F128;
    if (isEqualToString)
      v17 = (Class *)0x24BE833D0;
  }
  v19 = objc_alloc(*v17);
  v21 = (void *)objc_msgSend_initWithPlugIn_contextController_(v19, v20, (uint64_t)self, (uint64_t)v4);

  return v21;
}

- (id)additionalClassesForParameterCoder
{
  return &unk_24F060D38;
}

@end
