@implementation SAUIAddViews(AFDialogPhase)

- (id)af_dialogPhase
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "propertyForKeyWithoutDeserializing:", *MEMORY[0x1E0D891D8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFDialogPhase dialogPhaseForAceDialogPhase:](AFDialogPhase, "dialogPhaseForAceDialogPhase:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
