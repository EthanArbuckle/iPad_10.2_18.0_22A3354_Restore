@implementation AFConversationInsertion

- (AFConversationInsertion)initWithConversationItemType:(int64_t)a3 aceObject:(id)a4 aceCommandIdentifier:(id)a5 transient:(BOOL)a6 supplemental:(BOOL)a7 immersiveExperience:(BOOL)a8 persistentAcrossInvocations:(BOOL)a9 indexPath:(id)a10
{
  id v17;
  id v18;
  id v19;
  AFConversationInsertion *v20;
  AFConversationInsertion *v21;
  uint64_t v22;
  NSString *aceCommandIdentifier;
  uint64_t v24;
  NSIndexPath *indexPath;
  objc_super v27;

  v17 = a4;
  v18 = a5;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)AFConversationInsertion;
  v20 = -[AFConversationInsertion init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_conversationItemType = a3;
    objc_storeStrong((id *)&v20->_aceObject, a4);
    v22 = objc_msgSend(v18, "copy");
    aceCommandIdentifier = v21->_aceCommandIdentifier;
    v21->_aceCommandIdentifier = (NSString *)v22;

    v21->_transient = a6;
    v21->_supplemental = a7;
    v21->_immersiveExperience = a8;
    v21->_persistentAcrossInvocations = a9;
    v24 = objc_msgSend(v19, "copy");
    indexPath = v21->_indexPath;
    v21->_indexPath = (NSIndexPath *)v24;

  }
  return v21;
}

- (int64_t)conversationItemType
{
  return self->_conversationItemType;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (BOOL)isPersistentAcrossInvocations
{
  return self->_persistentAcrossInvocations;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
}

@end
