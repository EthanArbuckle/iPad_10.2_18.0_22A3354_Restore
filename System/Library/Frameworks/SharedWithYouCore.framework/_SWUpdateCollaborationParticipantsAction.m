@implementation _SWUpdateCollaborationParticipantsAction

- (_SWCollaborationMetadata)collaborationMetadata
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWUpdateCollaborationParticipantsAction;
  -[SWUpdateCollaborationParticipantsAction collaborationMetadata](&v3, sel_collaborationMetadata);
  return (_SWCollaborationMetadata *)(id)objc_claimAutoreleasedReturnValue();
}

@end
