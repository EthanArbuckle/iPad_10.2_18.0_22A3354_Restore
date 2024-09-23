@implementation _SWCollaborationServiceSource

- (id)serviceName
{
  return CFSTR("com.apple.SocialServices.MessagesCollaborationService");
}

- (id)requiredEntitlement
{
  return 0;
}

- (void)collaborationMetadataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[_SWBaseCollaborationSource extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWBaseCollaborationSource itemIdentifier](self, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76___SWCollaborationServiceSource_collaborationMetadataWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E217B178;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "collaborationMetadataForItemWithIdentifier:completionHandler:", v6, v8);

}

@end
