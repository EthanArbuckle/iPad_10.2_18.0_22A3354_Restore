@implementation _CNVirtualFile

- (_CNVirtualFile)init
{
  _CNVirtualFile *v2;
  uint64_t v3;
  NSData *contents;
  uint64_t v5;
  NSMutableDictionary *extendedAttributes;
  _CNVirtualFile *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CNVirtualFile;
  v2 = -[_CNVirtualFile init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v3 = objc_claimAutoreleasedReturnValue();
    contents = v2->_contents;
    v2->_contents = (NSData *)v3;

    v5 = objc_opt_new();
    extendedAttributes = v2->_extendedAttributes;
    v2->_extendedAttributes = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSData)contents
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContents:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)extendedAttributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
