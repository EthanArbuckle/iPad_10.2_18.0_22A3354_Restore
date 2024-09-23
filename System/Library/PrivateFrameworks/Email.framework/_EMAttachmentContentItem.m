@implementation _EMAttachmentContentItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMAttachmentContentItem)init
{
  return -[EMObject initWithObjectID:](self, "initWithObjectID:", 0);
}

- (_EMAttachmentContentItem)initWithCoder:(id)a3
{
  id v4;
  _EMAttachmentContentItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *availableRepresentations;
  uint64_t v11;
  NSString *contentID;
  uint64_t v13;
  NSString *displayName;
  uint64_t v15;
  NSString *uniformTypeIdentifier;
  uint64_t v17;
  EMMailDropMetadata *mailDropMetadata;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_EMAttachmentContentItem;
  v5 = -[EMObject initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_availableRepresentations"));
    v9 = objc_claimAutoreleasedReturnValue();
    availableRepresentations = v5->_availableRepresentations;
    v5->_availableRepresentations = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_contentID"));
    v11 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayName"));
    v13 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_uniformTypeIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mailDropMetadata"));
    v17 = objc_claimAutoreleasedReturnValue();
    mailDropMetadata = v5->_mailDropMetadata;
    v5->_mailDropMetadata = (EMMailDropMetadata *)v17;

    v5->_isAvailableLocally = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isAvailableLocally"));
    v5->_dataTransferByteCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("EFPropertyKey_dataTransferByteCount"));
    v5->_storageByteCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("EFPropertyKey_storageByteCount"));
    v5->_exchangeEventUID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_exchangeEventUID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EMAttachmentContentItem;
  -[EMObject encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[_EMAttachmentContentItem availableRepresentations](self, "availableRepresentations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_availableRepresentations"));

  -[_EMAttachmentContentItem contentID](self, "contentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_contentID"));

  -[_EMAttachmentContentItem displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_displayName"));

  -[_EMAttachmentContentItem uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_uniformTypeIdentifier"));

  -[_EMAttachmentContentItem mailDropMetadata](self, "mailDropMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_mailDropMetadata"));

  objc_msgSend(v4, "encodeBool:forKey:", -[_EMAttachmentContentItem isAvailableLocally](self, "isAvailableLocally"), CFSTR("EFPropertyKey_isAvailableLocally"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[_EMAttachmentContentItem dataTransferByteCount](self, "dataTransferByteCount"), CFSTR("EFPropertyKey_dataTransferByteCount"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[_EMAttachmentContentItem storageByteCount](self, "storageByteCount"), CFSTR("EFPropertyKey_storageByteCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_EMAttachmentContentItem exchangeEventUID](self, "exchangeEventUID"), CFSTR("EFPropertyKey_exchangeEventUID"));

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem storageByteCount](self, "storageByteCount"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem dataTransferByteCount](self, "dataTransferByteCount"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_class();
  -[EMObject objectID](self, "objectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_EMAttachmentContentItem isAvailableLocally](self, "isAvailableLocally"))
    v5 = CFSTR("local");
  else
    v5 = CFSTR("remote");
  -[_EMAttachmentContentItem contentID](self, "contentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMAttachmentContentItem displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMAttachmentContentItem uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_EMAttachmentContentItem exchangeEventUID](self, "exchangeEventUID");
  -[_EMAttachmentContentItem availableRepresentations](self, "availableRepresentations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMAttachmentContentItem mailDropMetadata](self, "mailDropMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("YES");
  if (!v11)
    v12 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> %@, %@, size=%@/%@, contentID=%@, displayName=%@, uniformTypeIdentifier=%@, exchangeEventID=%d, representations=(%@) isMailDrop=%@"), v16, self, v17, v5, v18, v3, v6, v7, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __CFString *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem storageByteCount](self, "storageByteCount"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem dataTransferByteCount](self, "dataTransferByteCount"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInternal"))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("id<EMContentItem>");
  }

  v5 = (void *)MEMORY[0x1E0D1EF48];
  -[_EMAttachmentContentItem displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullyOrPartiallyRedactedStringForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_EMAttachmentContentItem exchangeEventUID](self, "exchangeEventUID") <= 0)
  {
    v9 = -[_EMAttachmentContentItem exchangeEventUID](self, "exchangeEventUID");
    v8 = CFSTR("NO");
    if (v9 < 0)
      v8 = CFSTR("INVALID");
  }
  else
  {
    v8 = CFSTR("YES");
  }
  v10 = v8;
  v11 = (void *)MEMORY[0x1E0CB3940];
  -[EMObject objectID](self, "objectID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_EMAttachmentContentItem isAvailableLocally](self, "isAvailableLocally"))
    v12 = CFSTR("local");
  else
    v12 = CFSTR("remote");
  -[_EMAttachmentContentItem contentID](self, "contentID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMAttachmentContentItem uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMAttachmentContentItem availableRepresentations](self, "availableRepresentations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p> %@, %@, size=%@/%@, contentID=%@, displayName=%@, uniformTypeIdentifier=%@, exchangeEvent=%@, representations=(%@)"), v20, self, v19, v12, v21, v3, v13, v7, v14, v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (UTType)type
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_EMAttachmentContentItem uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEC3F8];
    -[_EMAttachmentContentItem uniformTypeIdentifier](self, "uniformTypeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (UTType *)v6;
}

- (id)requestRepresentationWithOptions:(id)a3 completionHandler:(id)a4
{
  -[_EMAttachmentContentItem requestRepresentationWithOptions:delegate:completionHandler:](self, "requestRepresentationWithOptions:delegate:completionHandler:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requestRepresentationWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  _QWORD v18[5];
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1B99BB000, "attachment content representation request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  -[_EMAttachmentContentItem availableRepresentations](self, "availableRepresentations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestedRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if ((v14 & 1) != 0)
  {
    -[_EMAttachmentContentItem loaderBlock](self, "loaderBlock");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88___EMAttachmentContentItem_requestRepresentationWithOptions_delegate_completionHandler___block_invoke;
    v18[3] = &unk_1E70F1F18;
    v18[4] = self;
    v19 = v10;
    ((void (**)(_QWORD, id, id, _QWORD *))v15)[2](v15, v8, v9, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2048, 0);
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v16 = 0;
    (*((void (**)(id, _QWORD, void (**)(_QWORD, _QWORD, _QWORD, _QWORD)))v10 + 2))(v10, 0, v15);
  }

  os_activity_scope_leave(&state);
  return v16;
}

- (NSArray)availableRepresentations
{
  return self->_availableRepresentations;
}

- (void)setAvailableRepresentations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)dataTransferByteCount
{
  return self->_dataTransferByteCount;
}

- (void)setDataTransferByteCount:(int64_t)a3
{
  self->_dataTransferByteCount = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isAvailableLocally
{
  return self->_isAvailableLocally;
}

- (void)setIsAvailableLocally:(BOOL)a3
{
  self->_isAvailableLocally = a3;
}

- (id)loaderBlock
{
  return self->_loaderBlock;
}

- (void)setLoaderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)storageByteCount
{
  return self->_storageByteCount;
}

- (void)setStorageByteCount:(int64_t)a3
{
  self->_storageByteCount = a3;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (EMMailDropMetadata)mailDropMetadata
{
  return self->_mailDropMetadata;
}

- (void)setMailDropMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int)exchangeEventUID
{
  return self->_exchangeEventUID;
}

- (void)setExchangeEventUID:(int)a3
{
  self->_exchangeEventUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailDropMetadata, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong(&self->_loaderBlock, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_availableRepresentations, 0);
}

@end
