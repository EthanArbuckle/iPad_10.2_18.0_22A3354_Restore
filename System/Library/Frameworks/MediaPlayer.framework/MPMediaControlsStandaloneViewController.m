@implementation MPMediaControlsStandaloneViewController

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MPMediaControlsViewController _createMediaControlsIfNeeded](self, "_createMediaControlsIfNeeded");
  -[MPMediaControlsViewController _present](self, "_present");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)dismissAfter:(double)a3
{
  id v3;

  -[MPMediaControlsViewController mediaControls](self, "mediaControls", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismiss");

}

@end
