@implementation SAUIDialogPunchout(ClientFeedbackPresented)

- (id)_af_dialogIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "utteranceView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dialogIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
