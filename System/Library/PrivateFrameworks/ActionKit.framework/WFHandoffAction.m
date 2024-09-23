@implementation WFHandoffAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;

  -[WFHandoffAction runningDelegate](self, "runningDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || (-[WFHandoffAction runningDelegate](self, "runningDelegate"),
        v8 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v8, "currentRunningContextForAction:", self),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v8,
        LOBYTE(v8) = objc_msgSend(v9, "isShortcutsApp"),
        v9,
        (v8 & 1) == 0))
  {
    -[WFHandoffAction userInterface](self, "userInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRunningWithSiriUI");

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
}

@end
