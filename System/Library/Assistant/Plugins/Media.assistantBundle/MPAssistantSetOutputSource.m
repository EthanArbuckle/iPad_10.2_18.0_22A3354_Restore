@implementation MPAssistantSetOutputSource

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, void *))a3;
  -[MPAssistantSetOutputSource _validate](self, "_validate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MPAssistantSetOutputSource _perform](self, "_perform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  objc_msgSend(v5, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);

}

- (id)_perform
{
  return 0;
}

- (id)_validate
{
  return 0;
}

@end
