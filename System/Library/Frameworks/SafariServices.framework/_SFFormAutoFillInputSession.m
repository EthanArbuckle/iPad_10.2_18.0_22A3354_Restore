@implementation _SFFormAutoFillInputSession

- (_SFFormAutoFillInputSession)initWithFormInputSession:(id)a3
{
  return (_SFFormAutoFillInputSession *)-[_SFFormAutoFillInputSession _initWithFormInputSession:focusedElement:](self, "_initWithFormInputSession:focusedElement:", a3, 0);
}

- (_SFFormAutoFillInputSession)initWithFocusedElement:(id)a3
{
  return (_SFFormAutoFillInputSession *)-[_SFFormAutoFillInputSession _initWithFormInputSession:focusedElement:](self, "_initWithFormInputSession:focusedElement:", 0, a3);
}

- (id)_initWithFormInputSession:(id)a3 focusedElement:(id)a4
{
  id v7;
  id v8;
  _SFFormAutoFillInputSession *v9;
  id *p_isa;
  id v11;
  id v12;
  void *v13;
  id *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SFFormAutoFillInputSession;
  v9 = -[_SFFormAutoFillInputSession init](&v16, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_formInputSession, a3);
    if (v8)
    {
      v11 = v8;
    }
    else
    {
      objc_msgSend(p_isa[3], "focusedElementInfo");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = p_isa[1];
    p_isa[1] = v11;

    objc_msgSend(p_isa[3], "userObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(p_isa[1], "userObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(p_isa, "_updateAutoFillInputSessionUserObject:", v13);
    v14 = p_isa;

  }
  return p_isa;
}

- (void)_updateAutoFillInputSessionUserObject:(id)a3
{
  id v5;
  void *v6;
  SFFormAutoFillFrameHandle *v7;
  SFFormAutoFillFrameHandle *frameHandle;
  void *v9;
  WBSFormMetadata *v10;
  WBSFormMetadata *formMetadata;
  id v12;

  objc_storeStrong((id *)&self->_autoFillInputSessionUserObject, a3);
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_autoFillInputSessionUserObject, "objectForKeyedSubscript:", CFSTR("frame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrameHandle frameHandleFromSerializedData:](SFFormAutoFillFrameHandle, "frameHandleFromSerializedData:", v6);
  v7 = (SFFormAutoFillFrameHandle *)objc_claimAutoreleasedReturnValue();
  frameHandle = self->_frameHandle;
  self->_frameHandle = v7;

  v9 = (void *)MEMORY[0x1E0D8A958];
  -[NSDictionary objectForKeyedSubscript:](self->_autoFillInputSessionUserObject, "objectForKeyedSubscript:", CFSTR("form"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formMetadataFromSerializedData:", v12);
  v10 = (WBSFormMetadata *)objc_claimAutoreleasedReturnValue();
  formMetadata = self->_formMetadata;
  self->_formMetadata = v10;

}

- (id)autoFillInputSessionByReplacingInputSessionUserObject:(id)a3
{
  id v4;
  _SFFormAutoFillInputSession *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = [_SFFormAutoFillInputSession alloc];
  -[_SFFormAutoFillInputSession formInputSession](self, "formInputSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillInputSession focusedElementInfo](self, "focusedElementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_SFFormAutoFillInputSession _initWithFormInputSession:focusedElement:](v5, "_initWithFormInputSession:focusedElement:", v6, v7);

  objc_msgSend(v8, "_updateAutoFillInputSessionUserObject:", v4);
  return v8;
}

- (_WKFocusedElementInfo)focusedElementInfo
{
  return self->_focusedElementInfo;
}

- (NSDictionary)autoFillInputSessionUserObject
{
  return self->_autoFillInputSessionUserObject;
}

- (_WKFormInputSession)formInputSession
{
  return self->_formInputSession;
}

- (SFFormAutoFillFrameHandle)frameHandle
{
  return self->_frameHandle;
}

- (WBSFormMetadata)formMetadata
{
  return self->_formMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_frameHandle, 0);
  objc_storeStrong((id *)&self->_formInputSession, 0);
  objc_storeStrong((id *)&self->_autoFillInputSessionUserObject, 0);
  objc_storeStrong((id *)&self->_focusedElementInfo, 0);
}

@end
