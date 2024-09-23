@implementation _SWCollaborationServiceSourceEntitled

- (id)serviceName
{
  return CFSTR("com.apple.SocialServices.MessagesCollaborationService.Entitled");
}

- (id)requiredEntitlement
{
  return CFSTR("com.apple.fileprovider.share");
}

- (void)performAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  -[_SWBaseCollaborationSource extension](self, "extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EDFD5588);

  if (!v9)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SWBaseCollaborationSource extension](self, "extension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __73___SWCollaborationServiceSourceEntitled_performAction_completionHandler___block_invoke_2;
      v17 = &unk_1E217B1A0;
      v18 = v7;
      objc_msgSend(v6, "setResponseHandlerBlock:", &v14);
      +[SWCollaborationCoordinator sharedCoordinator](SWCollaborationCoordinator, "sharedCoordinator", v14, v15, v16, v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "collaborationCoordinator:handleUpdateCollaborationParticipantsAction:", v13, v6);

      v12 = v18;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
    goto LABEL_8;
  }
  -[_SWBaseCollaborationSource extension](self, "extension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73___SWCollaborationServiceSourceEntitled_performAction_completionHandler___block_invoke;
  v19[3] = &unk_1E217B1A0;
  v20 = v7;
  objc_msgSend(v6, "setResponseHandlerBlock:", v19);
  +[SWCollaborationCoordinator sharedCoordinator](SWCollaborationCoordinator, "sharedCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collaborationCoordinator:handleStartCollaborationAction:", v11, v6);

  v12 = v20;
LABEL_6:

LABEL_8:
}

@end
