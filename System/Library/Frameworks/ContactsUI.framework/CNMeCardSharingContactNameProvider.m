@implementation CNMeCardSharingContactNameProvider

- (CNMeCardSharingContactNameProvider)initWithContact:(id)a3
{
  id v5;
  CNMeCardSharingContactNameProvider *v6;
  CNMeCardSharingContactNameProvider *v7;
  CNMeCardSharingContactNameProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingContactNameProvider;
  v6 = -[CNMeCardSharingContactNameProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = v7;
  }

  return v7;
}

- (id)familyName
{
  return -[CNContact familyName](self->_contact, "familyName");
}

- (id)givenName
{
  return -[CNContact givenName](self->_contact, "givenName");
}

- (id)middleName
{
  return -[CNContact middleName](self->_contact, "middleName");
}

- (id)nickname
{
  return -[CNContact nickname](self->_contact, "nickname");
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_45963 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_45963, &__block_literal_global_45964);
  return (id)descriptorForRequiredKeys_cn_once_object_1_45965;
}

void __63__CNMeCardSharingContactNameProvider_descriptorForRequiredKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96780];
  v7[0] = *MEMORY[0x1E0C966D0];
  v7[1] = v0;
  v1 = *MEMORY[0x1E0C967A0];
  v7[2] = *MEMORY[0x1E0C966C0];
  v7[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNMeCardSharingContactNameProvider descriptorForRequiredKeys]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorWithKeyDescriptors:description:", v2, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)descriptorForRequiredKeys_cn_once_object_1_45965;
  descriptorForRequiredKeys_cn_once_object_1_45965 = v5;

}

@end
