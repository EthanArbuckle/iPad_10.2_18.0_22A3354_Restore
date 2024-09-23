@implementation _UIKeyboardArbiterDebugEntryString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (int)importance
{
  return 1;
}

+ (id)entryWithMessage:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;

  v7 = a3;
  v8 = a4;
  v9 = (id *)objc_alloc_init((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong(v10 + 3, a4);
  }

  return v10;
}

- (void)enumerateContents:(id)a3
{
  NSString *message;
  void *v5;
  void (**v6)(id, id);
  void *v7;
  void *v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("Type");
  v13[1] = CFSTR("Message");
  message = self->_message;
  v14[0] = self->_type;
  v14[1] = message;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = (void (**)(id, id))a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v11[1] = 3221225472;
  v11[2] = __56___UIKeyboardArbiterDebugEntryString_enumerateContents___block_invoke;
  v11[3] = &unk_24DAA0958;
  v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardArbiterDebugEntryString;
  v11[0] = MEMORY[0x24BDAC760];
  v9 = v8;
  -[_UIKeyboardArbiterDebugEntry enumerateContents:](&v10, sel_enumerateContents_, v11);
  v6[2](v6, v9);

}

@end
