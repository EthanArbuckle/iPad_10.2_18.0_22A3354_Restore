@implementation WorkspaceObserver

- (void)startObserving
{
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)stopObserving
{
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (WorkspaceObserverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)applicationsWillInstall:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[LSApplicationWorkspaceObserverProtocol applicationsWillInstall:](self->_delegate, "applicationsWillInstall:", v4);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[LSApplicationWorkspaceObserverProtocol applicationsDidInstall:](self->_delegate, "applicationsDidInstall:", v4);

}

- (void)applicationsWillUninstall:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[LSApplicationWorkspaceObserverProtocol applicationsWillUninstall:](self->_delegate, "applicationsWillUninstall:", v4);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[LSApplicationWorkspaceObserverProtocol applicationsDidUninstall:](self->_delegate, "applicationsDidUninstall:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
