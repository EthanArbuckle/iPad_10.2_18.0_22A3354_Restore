@implementation MCMResultContainerFromPath

- (MCMResultContainerFromPath)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15 relativePath:(id)a16
{
  MCMResultContainerFromPath *v18;
  MCMResultContainerFromPath *v19;
  id v26;
  objc_super v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26 = a16;
  v29.receiver = self;
  v29.super_class = (Class)MCMResultContainerFromPath;
  v18 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:](&v29, sel_initWithUUID_containerPathIdentifier_identifier_containerClass_POSIXUser_personaUniqueString_sandboxToken_existed_url_info_transient_userManagedAssetsRelPath_creator_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_relativePath, a16);

  return v19;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultContainerFromPath;
  v5 = -[MCMResultWithContainerBase encodeResultOntoReply:](&v9, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:

      goto LABEL_6;
    }
    -[MCMResultContainerFromPath relativePath](self, "relativePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MCMResultContainerFromPath relativePath](self, "relativePath");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v4, "ReplyRelativePath", (const char *)objc_msgSend(v6, "UTF8String"));
      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_storeStrong((id *)&self->_relativePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePath, 0);
}

@end
