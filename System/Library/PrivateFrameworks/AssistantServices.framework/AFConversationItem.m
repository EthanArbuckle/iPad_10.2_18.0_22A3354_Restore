@implementation AFConversationItem

- (AFConversationItem)initWithDelegateItem:(id)a3
{
  id v5;
  AFConversationItem *v6;
  AFConversationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFConversationItem;
  v6 = -[AFConversationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegateItem, a3);

  return v7;
}

- (AFConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 persistentAcrossInvocations:(BOOL)a14 associatedDataStore:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AFMutableConversationItem *v25;
  AFConversationItem *v26;
  uint64_t v28;

  v19 = a15;
  v20 = a9;
  v21 = a7;
  v22 = a6;
  v23 = a4;
  v24 = a3;
  BYTE4(v28) = a14;
  BYTE3(v28) = a13;
  *(_WORD *)((char *)&v28 + 1) = __PAIR16__(a12, a11);
  LOBYTE(v28) = a10;
  v25 = -[AFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:]([AFMutableConversationItem alloc], "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v24, v23, a5, v22, v21, a8, v20, v28, v19);

  v26 = -[AFConversationItem initWithDelegateItem:](self, "initWithDelegateItem:", v25);
  return v26;
}

- (AFConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 persistentAcrossInvocations:(BOOL)a12 associatedDataStore:(id)a13
{
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  AFConversationItem *v23;
  uint64_t v25;

  v16 = (objc_class *)MEMORY[0x1E0CB3A28];
  v17 = a13;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = objc_alloc_init(v16);
  v22 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  BYTE4(v25) = a12;
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  v23 = -[AFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v21, v22, a3, v20, v19, a6, v18, v25, v17);

  return v23;
}

- (NSString)description
{
  return -[AFMutableConversationItem description](self->_delegateItem, "description");
}

- (id)identifier
{
  return -[AFMutableConversationItem identifier](self->_delegateItem, "identifier");
}

- (id)revisionIdentifier
{
  return -[AFMutableConversationItem revisionIdentifier](self->_delegateItem, "revisionIdentifier");
}

- (int64_t)type
{
  return -[AFMutableConversationItem type](self->_delegateItem, "type");
}

- (id)aceObject
{
  return -[AFMutableConversationItem aceObject](self->_delegateItem, "aceObject");
}

- (id)dialogPhase
{
  return -[AFMutableConversationItem dialogPhase](self->_delegateItem, "dialogPhase");
}

- (id)aceCommandIdentifier
{
  return -[AFMutableConversationItem aceCommandIdentifier](self->_delegateItem, "aceCommandIdentifier");
}

- (int64_t)presentationState
{
  return -[AFMutableConversationItem presentationState](self->_delegateItem, "presentationState");
}

- (BOOL)isVirgin
{
  return -[AFMutableConversationItem isVirgin](self->_delegateItem, "isVirgin");
}

- (BOOL)isTransient
{
  return -[AFMutableConversationItem isTransient](self->_delegateItem, "isTransient");
}

- (BOOL)isSupplemental
{
  return -[AFMutableConversationItem isSupplemental](self->_delegateItem, "isSupplemental");
}

- (BOOL)isImmersiveExperience
{
  return -[AFMutableConversationItem isImmersiveExperience](self->_delegateItem, "isImmersiveExperience");
}

- (BOOL)isPersistentAcrossInvocations
{
  return -[AFMutableConversationItem isPersistentAcrossInvocations](self->_delegateItem, "isPersistentAcrossInvocations");
}

- (id)associatedDataStore
{
  return -[AFMutableConversationItem associatedDataStore](self->_delegateItem, "associatedDataStore");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateItem, 0);
}

@end
