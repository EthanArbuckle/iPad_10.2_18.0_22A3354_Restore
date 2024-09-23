@implementation SCNKeyedUnarchiver

- (id)initForReadingWithData:(id)a3 secure:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  objc_super v9;
  id v10;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SCNKeyedUnarchiver;
  v10 = 0;
  v5 = -[SCNKeyedUnarchiver initForReadingFromData:error:](&v9, sel_initForReadingFromData_error_, a3, &v10);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setDecodingFailurePolicy:", 0);
    objc_msgSend(v6, "setRequiresSecureCoding:", v4);
  }
  if (v10)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNKeyedUnarchiver initForReadingWithData:secure:].cold.1(&v10, v7);
  }
  if (C3DSceneSourceGetSceneCount())
    objc_msgSend(v6, "_allowDecodingCyclesInSecureMode");
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNKeyedUnarchiver;
  -[SCNKeyedUnarchiver dealloc](&v3, sel_dealloc);
}

- (NSURL)documentEnclosingURL
{
  NSURL *v3;

  v3 = -[SCNKeyedUnarchiver documentURL](self, "documentURL");
  if (v3)
    return -[NSURL URLByDeletingLastPathComponent](v3, "URLByDeletingLastPathComponent");
  else
    return (NSURL *)-[NSDictionary valueForKey:](-[SCNKeyedUnarchiver context](self, "context"), "valueForKey:", CFSTR("kEnclosingFolderURL"));
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (SCNAssetCatalog)assetCatalog
{
  return self->_assetCatalog;
}

- (void)setAssetCatalog:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSString)lookUpKey
{
  return self->_lookUpKey;
}

- (void)setLookUpKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (id)lookUpFoundInstance
{
  return self->_lookUpFoundInstance;
}

- (void)setLookUpFoundInstance:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSArray)allTargetsFromAnimCodec
{
  return self->_allTargetsFromAnimCodec;
}

- (void)setAllTargetsFromAnimCodec:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (void)initForReadingWithData:(id *)a1 secure:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "localizedDescription");
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to instantiate unarchiver with error %@", (uint8_t *)&v4, 0xCu);
}

@end
