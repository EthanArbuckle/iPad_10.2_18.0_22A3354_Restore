@implementation FBSWorkspaceResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

- (FBSSceneMessage)message
{
  return self->_message;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (FBSWorkspaceResponse)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSWorkspaceResponse *v5;
  uint64_t v6;
  FBSSceneMessage *message;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSWorkspaceResponse;
  v5 = -[FBSWorkspaceResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    message = v5->_message;
    v5->_message = (FBSSceneMessage *)v6;

  }
  return v5;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
