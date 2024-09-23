@implementation AARadarDraft

- (AARadarDraft)initWithTitle:(id)a3 problemDescription:(id)a4 displayReason:(id)a5 attachments:(id)a6 component:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AARadarDraft *v17;
  AARadarDraft *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)AARadarDraft;
  v17 = -[AARadarDraft init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[AARadarDraft setTitle:](v17, "setTitle:", v12);
    -[AARadarDraft setProblemDescription:](v18, "setProblemDescription:", v13);
    -[AARadarDraft setDisplayReason:](v18, "setDisplayReason:", v14);
    -[AARadarDraft setAttachments:](v18, "setAttachments:", v15);
    -[AARadarDraft setComponent:](v18, "setComponent:", v16);
  }

  return v18;
}

- (BOOL)sendForProcessNamed:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)getRadarDraftClass());
  if (v8)
  {
    -[AARadarDraft title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    -[AARadarDraft problemDescription](self, "problemDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProblemDescription:", v10);

    -[AARadarDraft component](self, "component");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asRadarDraft");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 != 0;
    if (v12)
    {
      objc_msgSend(v8, "setComponent:", v12);
      objc_msgSend(v8, "setReproducibility:", 5);
      objc_msgSend(v8, "setClassification:", 6);
      objc_msgSend(v8, "setDiagnosticExtensionIDs:", &unk_25082C690);
      -[AARadarDraft attachments](self, "attachments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAttachments:", v14);

      objc_msgSend(v8, "setAutoDiagnostics:", 0);
      objc_msgSend(v8, "setIsUserInitiated:", 1);
      objc_msgSend(v8, "setKeywords:", &unk_25082C6A8);
      objc_msgSend((id)getTapToRadarServiceClass(), "shared");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AARadarDraft displayReason](self, "displayReason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v8, v6, v16, v7);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)problemDescription
{
  return self->_problemDescription;
}

- (void)setProblemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_problemDescription, a3);
}

- (NSString)displayReason
{
  return self->_displayReason;
}

- (void)setDisplayReason:(id)a3
{
  objc_storeStrong((id *)&self->_displayReason, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (AARadarComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_storeStrong((id *)&self->_component, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_displayReason, 0);
  objc_storeStrong((id *)&self->_problemDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
