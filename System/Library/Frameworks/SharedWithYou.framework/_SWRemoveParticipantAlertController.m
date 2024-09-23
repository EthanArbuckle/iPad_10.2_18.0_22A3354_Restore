@implementation _SWRemoveParticipantAlertController

- (id)_initWithParticipant:(id)a3 highlight:(id)a4 preferredStyle:(int64_t)a5
{
  id v9;
  id v10;
  _SWRemoveParticipantAlertController *v11;
  _SWRemoveParticipantAlertController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SWRemoveParticipantAlertController;
  v11 = -[_SWRemoveParticipantAlertController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_participant, a3);
    objc_storeStrong((id *)&v12->_highlight, a4);
    v12->_preferredStyle = a5;
  }

  return v12;
}

+ (id)alertControllerWithParticipant:(id)a3 highlight:(id)a4 preferredStyle:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = -[_SWRemoveParticipantAlertController _initWithParticipant:highlight:preferredStyle:]([_SWRemoveParticipantAlertController alloc], "_initWithParticipant:highlight:preferredStyle:", v8, v7, a5);

  objc_msgSend(v9, "setModalPresentationStyle:", 6);
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SWRemoveParticipantAlertController;
  -[_SWRemoveParticipantAlertController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWRemoveParticipantAlertController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SWRemoveParticipantAlertController;
  -[_SWRemoveParticipantAlertController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (!self->_remoteAlertController)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54___SWRemoveParticipantAlertController_viewWillAppear___block_invoke;
    v5[3] = &unk_1E2873F30;
    objc_copyWeak(&v6, &location);
    v4 = +[_SWRemoveParticipantAlertRemoteController requestViewControllerWithConnectionHandler:](_SWRemoveParticipantAlertRemoteController, "requestViewControllerWithConnectionHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (id)_containedRemoteViewController
{
  return self->_remoteAlertController;
}

- (void)dismissAlert
{
  -[_SWRemoveParticipantAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (_SWPerson)participant
{
  return self->_participant;
}

- (void)setParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_participant, a3);
}

- (SWCollaborationHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_remoteAlertController, 0);
}

@end
