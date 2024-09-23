@implementation MTRDescriptorClusterSemanticTagStruct

- (MTRDescriptorClusterSemanticTagStruct)init
{
  MTRDescriptorClusterSemanticTagStruct *v2;
  MTRDescriptorClusterSemanticTagStruct *v3;
  NSNumber *mfgCode;
  NSNumber *namespaceID;
  NSNumber *tag;
  NSString *label;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRDescriptorClusterSemanticTagStruct;
  v2 = -[MTRDescriptorClusterSemanticTagStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    mfgCode = v2->_mfgCode;
    v2->_mfgCode = 0;

    namespaceID = v3->_namespaceID;
    v3->_namespaceID = (NSNumber *)&unk_250591B18;

    tag = v3->_tag;
    v3->_tag = (NSNumber *)&unk_250591B18;

    label = v3->_label;
    v3->_label = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDescriptorClusterSemanticTagStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTRDescriptorClusterSemanticTagStruct);
  objc_msgSend_mfgCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMfgCode_(v4, v8, (uint64_t)v7);

  objc_msgSend_namespaceID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNamespaceID_(v4, v12, (uint64_t)v11);

  objc_msgSend_tag(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTag_(v4, v16, (uint64_t)v15);

  objc_msgSend_label(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: mfgCode:%@; namespaceID:%@; tag:%@; label:%@; >"),
    v5,
    self->_mfgCode,
    self->_namespaceID,
    self->_tag,
    self->_label);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)mfgCode
{
  return self->_mfgCode;
}

- (void)setMfgCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)namespaceID
{
  return self->_namespaceID;
}

- (void)setNamespaceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_namespaceID, 0);
  objc_storeStrong((id *)&self->_mfgCode, 0);
}

@end
