@implementation _UIKeyboardArbiterDebugEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (_UIKeyboardArbiterDebugEntry)init
{
  _UIKeyboardArbiterDebugEntry *v2;
  uint64_t v3;
  NSDate *timestamp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardArbiterDebugEntry;
  v2 = -[_UIKeyboardArbiterDebugEntry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;

  }
  return v2;
}

- (void)enumerateContents:(id)a3
{
  NSDate *timestamp;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("Timestamp");
  timestamp = self->_timestamp;
  v5 = a3;
  -[NSDate description](timestamp, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v7);

}

- (int)importance
{
  return 0;
}

@end
