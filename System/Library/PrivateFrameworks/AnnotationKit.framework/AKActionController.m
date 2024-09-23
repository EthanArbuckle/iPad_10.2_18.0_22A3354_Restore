@implementation AKActionController

- (AKActionController)initWithController:(id)a3
{
  id v4;
  AKActionController *v5;
  AKActionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKActionController;
  v5 = -[AKActionController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKActionController setController:](v5, "setController:", v4);

  return v6;
}

- (void)performActionForSender:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_performActionForSender_segment_);
}

- (void)performActionForSender:(id)a3 segment:(int64_t)a4
{
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = -[AKActionController _isSenderEnabled:segment:](self, "_isSenderEnabled:segment:", v14, a4);
  v7 = v14;
  if (v6)
  {
    v8 = objc_msgSend(v14, "tag");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v14, "tagForSegment:", a4);
    -[AKActionController controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toolController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(v8 - 764000) > 0x42)
    {
      if ((unint64_t)(v8 - 765000) <= 0x12C)
      {
        v13 = objc_msgSend(v14, "tag");
        AKLog(CFSTR("performing ATTRIBUTE action for sender %@ with tag %ld "));
        objc_msgSend(v11, "performAttributeActionForSender:segment:", v14, a4, v14, v13);
      }
    }
    else
    {
      v12 = objc_msgSend(v14, "tag");
      AKLog(CFSTR("performing TOOL action for sender %@ with tag %ld "));
      objc_msgSend(v10, "performToolActionForSender:", v14, v14, v12);
    }

    v7 = v14;
  }

}

- (BOOL)isSenderEnabled:(id)a3
{
  return -[AKActionController _isSenderEnabled:segment:](self, "_isSenderEnabled:segment:", a3, 0);
}

- (BOOL)_isSenderEnabled:(id)a3 segment:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  BOOL v11;

  v6 = a3;
  -[AKActionController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "currentPageIndex") == 0x7FFFFFFFFFFFFFFFLL || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  v8 = objc_msgSend(v6, "tag");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v6, "tagForSegment:", a4);
  if ((unint64_t)(v8 - 764000) > 0x42)
  {
    if ((unint64_t)(v8 - 765000) <= 0x12C)
    {
      objc_msgSend(v7, "attributeController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isAttributeSenderEnabled:segment:", v6, a4);
      goto LABEL_9;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v7, "toolController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isToolSenderEnabled:", v6);
LABEL_9:
  v11 = v10;

LABEL_11:
  return v11;
}

- (BOOL)validateSender:(id)a3
{
  return MEMORY[0x24BEDD108](self, sel_validateSender_segment_);
}

- (BOOL)validateSender:(id)a3 segment:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = -[AKActionController _isSenderEnabled:segment:](self, "_isSenderEnabled:segment:", v6, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "tag");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v6, "tagForSegment:", a4);
    -[AKActionController controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)(v8 - 764000) > 0x42)
    {
      if ((unint64_t)(v8 - 765000) > 0x12C)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v9, "attributeController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateAttributeSenderState:segment:enabled:", v6, a4, v7);
    }
    else
    {
      objc_msgSend(v9, "toolController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateToolSenderState:enabled:", v6, v7);
    }

    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
