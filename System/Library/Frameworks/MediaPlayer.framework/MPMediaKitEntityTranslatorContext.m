@implementation MPMediaKitEntityTranslatorContext

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MPMediaKitEntityRelationshipPayloadProvider)relationshipPayloadProvider
{
  return self->_relationshipPayloadProvider;
}

- (void)setRelationshipPayloadProvider:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipPayloadProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipPayloadProvider, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

@end
