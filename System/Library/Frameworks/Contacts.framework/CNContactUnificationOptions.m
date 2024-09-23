@implementation CNContactUnificationOptions

- (CNContactUnificationOptions)initWithContactFetchRequest:(id)a3
{
  id v4;
  CNContactUnificationOptions *v5;
  int v6;
  uint64_t v7;
  CNContactUnificationOptions *v8;

  v4 = a3;
  v5 = -[CNContactUnificationOptions init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "alwaysUnifyLabeledValues");
    v7 = 20;
    if (v6)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_labeledValueUnificationThreshold = v7;
    v8 = v5;
  }

  return v5;
}

- (CNContactUnificationOptions)init
{
  CNContactUnificationOptions *v2;
  CNContactUnificationOptions *v3;
  CNContactUnificationOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactUnificationOptions;
  v2 = -[CNContactUnificationOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_shouldIncludeMainStoreContacts = 257;
    v2->_labeledValueUnificationThreshold = 0x7FFFFFFFFFFFFFFFLL;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_BYTE *)result + 8) = self->_shouldIncludeMainStoreContacts;
    *((_BYTE *)result + 9) = self->_shouldFreezeMutableContacts;
    *((_QWORD *)result + 2) = self->_labeledValueUnificationThreshold;
  }
  return result;
}

- (BOOL)shouldIncludeMainStoreContacts
{
  return self->_shouldIncludeMainStoreContacts;
}

- (int64_t)labeledValueUnificationThreshold
{
  return self->_labeledValueUnificationThreshold;
}

+ (CNContactUnificationOptions)sharedInstance
{
  if (sharedInstance_cn_once_token_0_0 != -1)
    dispatch_once(&sharedInstance_cn_once_token_0_0, &__block_literal_global_60);
  return (CNContactUnificationOptions *)(id)sharedInstance_cn_once_object_0_0;
}

void __45__CNContactUnificationOptions_sharedInstance__block_invoke()
{
  CNContactUnificationOptions *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactUnificationOptions);
  v1 = (void *)sharedInstance_cn_once_object_0_0;
  sharedInstance_cn_once_object_0_0 = (uint64_t)v0;

}

- (void)setShouldIncludeMainStoreContacts:(BOOL)a3
{
  self->_shouldIncludeMainStoreContacts = a3;
}

- (BOOL)shouldFreezeMutableContacts
{
  return self->_shouldFreezeMutableContacts;
}

- (void)setShouldFreezeMutableContacts:(BOOL)a3
{
  self->_shouldFreezeMutableContacts = a3;
}

- (void)setLabeledValueUnificationThreshold:(int64_t)a3
{
  self->_labeledValueUnificationThreshold = a3;
}

@end
