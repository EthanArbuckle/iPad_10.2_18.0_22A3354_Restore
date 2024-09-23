@implementation _SWStartCollaborationAction

- (void)fulfillWithURL:(id)a3 updatedMetadata:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SWStartCollaborationAction;
  -[SWStartCollaborationAction fulfillUsingURL:updatedMetadata:](&v4, sel_fulfillUsingURL_updatedMetadata_, a3, a4);
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWStartCollaborationAction;
  -[SWStartCollaborationAction collaborationMetadata](&v3, sel_collaborationMetadata);
  return (_SWCollaborationMetadata *)(id)objc_claimAutoreleasedReturnValue();
}

@end
