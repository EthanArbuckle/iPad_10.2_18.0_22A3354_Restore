@implementation _WKWebExtensionKeyCommand

+ (id)commandWithTitle:(id)a3 image:(id)a4 input:(id)a5 modifierFlags:(int64_t)a6 identifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!v11)
  {
    __break(0xC471u);
    JUMPOUT(0x19770BA04);
  }
  if (!v13)
  {
    __break(0xC471u);
    JUMPOUT(0x19770BA24);
  }
  v15 = v14;
  if (!v14)
  {
    __break(0xC471u);
    JUMPOUT(0x19770BA44);
  }
  v19[0] = CFSTR("title");
  v19[1] = CFSTR("activation");
  v20[0] = v11;
  v20[1] = v13;
  v19[2] = CFSTR("identifier");
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA6B8], "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, v12, sel_performWebExtensionCommandForKeyCommand_, v13, a6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
