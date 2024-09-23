@implementation MRKeyboardMessage

+ (id)encryptedMessageWithState:(unint64_t)a3 text:(id)a4 attributes:(id)a5 usingCryptoSession:(id)a6
{
  id v8;
  void *v9;
  MRKeyboardMessage *v10;

  v8 = a5;
  objc_msgSend(a4, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MRKeyboardMessage initWithState:encryptedTextCyphertext:attributes:]([MRKeyboardMessage alloc], "initWithState:encryptedTextCyphertext:attributes:", a3, v9, v8);

  return v10;
}

- (MRKeyboardMessage)initWithState:(unint64_t)a3 encryptedTextCyphertext:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  MRKeyboardMessage *v10;
  uint64_t v11;
  MRTextEditingAttributes *attributes;
  _MRKeyboardMessageProtobuf *v13;
  id v14;
  _MRTextEditingAttributesProtobuf *v15;
  void *v16;
  void *v17;
  _MRTextInputTraitsProtobuf *v18;
  _MRTextInputTraitsProtobuf *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[5];
  unint64_t v32;

  v8 = a4;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MRKeyboardMessage;
  v10 = -[MRProtocolMessage init](&v27, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    attributes = v10->_attributes;
    v10->_attributes = (MRTextEditingAttributes *)v11;

    v13 = objc_alloc_init(_MRKeyboardMessageProtobuf);
    -[_MRKeyboardMessageProtobuf setState:](v13, "setState:", a3);
    -[_MRKeyboardMessageProtobuf setEncryptedTextCyphertext:](v13, "setEncryptedTextCyphertext:", v8);
    v14 = v9;
    v15 = objc_alloc_init(_MRTextEditingAttributesProtobuf);
    objc_msgSend(v14, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRTextEditingAttributesProtobuf setTitle:](v15, "setTitle:", v16);

    objc_msgSend(v14, "prompt");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRTextEditingAttributesProtobuf setPrompt:](v15, "setPrompt:", v17);

    if (v14)
    {
      objc_msgSend(v14, "inputTraits");
    }
    else
    {
      v32 = 0;
      v30 = 0u;
      memset(v31, 0, sizeof(v31));
      v28 = 0u;
      v29 = 0u;
    }
    v18 = objc_alloc_init(_MRTextInputTraitsProtobuf);
    v19 = v18;
    if ((v28 - 1) >= 3)
      v20 = 0;
    else
      v20 = v28;
    -[_MRTextInputTraitsProtobuf setAutocapitalizationType:](v18, "setAutocapitalizationType:", v20);
    v21 = 0;
    if ((HIDWORD(v28) - 1) <= 0xA)
      v21 = dword_193ADA838[HIDWORD(v28) - 1];
    -[_MRTextInputTraitsProtobuf setKeyboardType:](v19, "setKeyboardType:", v21);
    if ((v29 - 1) >= 0xB)
      v22 = 0;
    else
      v22 = v29;
    -[_MRTextInputTraitsProtobuf setReturnKeyType:](v19, "setReturnKeyType:", v22);
    -[_MRTextInputTraitsProtobuf setEnablesReturnKeyAutomatically:](v19, "setEnablesReturnKeyAutomatically:", BYTE8(v30));
    -[_MRTextInputTraitsProtobuf setSecureTextEntry:](v19, "setSecureTextEntry:", BYTE9(v30));
    if (DWORD1(v28))
      -[_MRTextInputTraitsProtobuf setAutocorrection:](v19, "setAutocorrection:", DWORD1(v28) == 2);
    if (DWORD2(v28))
      -[_MRTextInputTraitsProtobuf setSpellchecking:](v19, "setSpellchecking:", DWORD2(v28) == 2);
    -[_MRTextInputTraitsProtobuf setValidTextRangeLocation:](v19, "setValidTextRangeLocation:", *((_QWORD *)&v29 + 1));
    -[_MRTextInputTraitsProtobuf setValidTextRangeLength:](v19, "setValidTextRangeLength:", (_QWORD)v30);
    if (v32)
    {
      v23 = 0;
      v24 = 1;
      do
      {
        -[_MRTextInputTraitsProtobuf addPINEntrySeparatorIndexes:](v19, "addPINEntrySeparatorIndexes:", *((_QWORD *)v31 + v23));
        v23 = v24;
      }
      while (v32 > v24++);
    }
    -[_MRTextEditingAttributesProtobuf setInputTraits:](v15, "setInputTraits:", v19);

    -[_MRKeyboardMessageProtobuf setAttributes:](v13, "setAttributes:", v15);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v13);

  }
  return v10;
}

- (unint64_t)state
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "state");

  return v3;
}

- (NSData)encryptedTextCyphertext
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encryptedTextCyphertext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (MRTextEditingAttributes)attributes
{
  MRTextEditingAttributes *attributes;
  void *v4;
  MRMutableTextEditingAttributes *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unsigned int v23;
  MRTextEditingAttributes *v25;
  void *v27;
  _OWORD v28[8];
  uint64_t v29;
  _OWORD v30[9];

  attributes = self->_attributes;
  if (!attributes)
  {
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MRMutableTextEditingAttributes);
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMutableTextEditingAttributes setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "prompt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMutableTextEditingAttributes setPrompt:](v5, "setPrompt:", v7);

    objc_msgSend(v4, "inputTraits");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    memset((char *)v30 + 8, 0, 128);
    v9 = objc_msgSend(v8, "autocapitalizationType");
    if ((v9 - 1) >= 3)
      v10 = 0;
    else
      v10 = v9;
    LODWORD(v30[0]) = v10;
    v11 = objc_msgSend(v8, "keyboardType");
    v12 = 0;
    if ((v11 - 1) <= 0xB)
      v12 = dword_193ADA864[v11 - 1];
    HIDWORD(v30[0]) = v12;
    v13 = objc_msgSend(v8, "returnKeyType");
    if ((v13 - 1) >= 0xB)
      v14 = 0;
    else
      v14 = v13;
    LODWORD(v30[1]) = v14;
    BYTE8(v30[2]) = objc_msgSend(v8, "enablesReturnKeyAutomatically");
    BYTE9(v30[2]) = objc_msgSend(v8, "secureTextEntry");
    v15 = objc_msgSend(v8, "hasAutocorrection");
    v16 = 0;
    if (v15)
    {
      if (objc_msgSend(v8, "autocorrection"))
        v16 = 2;
      else
        v16 = 1;
    }
    DWORD1(v30[0]) = v16;
    if (objc_msgSend(v8, "hasSpellchecking"))
    {
      if (objc_msgSend(v8, "spellchecking"))
        v17 = 2;
      else
        v17 = 1;
    }
    else
    {
      v17 = 0;
    }
    DWORD2(v30[0]) = v17;
    if (objc_msgSend(v8, "hasValidTextRangeLocation")
      && objc_msgSend(v8, "hasValidTextRangeLength"))
    {
      v18 = objc_msgSend(v8, "validTextRangeLocation");
      v19 = objc_msgSend(v8, "validTextRangeLength");
      *((_QWORD *)&v30[1] + 1) = v18;
    }
    else
    {
      *((_QWORD *)&v30[1] + 1) = 0;
      v19 = -1;
    }
    *(_QWORD *)&v30[2] = v19;
    v20 = objc_msgSend(v8, "pINEntrySeparatorIndexesCount");
    *(_QWORD *)&v30[8] = v20;
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = 1;
      do
      {
        *((_QWORD *)&v30[3] + v22) = objc_msgSend(v8, "pINEntrySeparatorIndexesAtIndex:", v22);
        v22 = v23;
      }
      while (v21 > v23++);
    }

    v28[6] = v30[6];
    v28[7] = v30[7];
    v29 = *(_QWORD *)&v30[8];
    v28[2] = v30[2];
    v28[3] = v30[3];
    v28[4] = v30[4];
    v28[5] = v30[5];
    v28[0] = v30[0];
    v28[1] = v30[1];
    -[MRMutableTextEditingAttributes setInputTraits:](v5, "setInputTraits:", v28);

    v25 = self->_attributes;
    self->_attributes = &v5->super;

    attributes = self->_attributes;
  }
  return attributes;
}

- (unint64_t)type
{
  return 23;
}

- (id)decryptedTextUsingCryptoSession:(id)a3
{
  void *v3;
  void *v4;

  -[MRKeyboardMessage encryptedTextCyphertext](self, "encryptedTextCyphertext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
