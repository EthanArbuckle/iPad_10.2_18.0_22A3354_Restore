@implementation CNFInternalProcessListController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[CNFInternalProcessListController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("ConferenceInternalProcessSettings"), self);
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)bundle
{
  return +[CNFInternalSettingsUtilities currentInternalSettingsBundle](CNFInternalSettingsUtilities, "currentInternalSettingsBundle");
}

- (void)killJustIChatAgent:(id)a3
{
  +[CNFInternalSettingsUtilities killImagent](CNFInternalSettingsUtilities, "killImagent", a3);
}

- (void)killJustIMAVAgent:(id)a3
{
  +[CNFInternalSettingsUtilities killImavagent](CNFInternalSettingsUtilities, "killImavagent", a3);
}

- (void)killJustMediaServerD:(id)a3
{
  +[CNFInternalSettingsUtilities killMediaServerd](CNFInternalSettingsUtilities, "killMediaServerd", a3);
}

- (void)conferenceKillProcessesAndNukeKeychain:(id)a3
{
  +[CNFInternalSettingsUtilities nukeKeychain](CNFInternalSettingsUtilities, "nukeKeychain", a3);
  +[CNFInternalSettingsUtilities killEverything](CNFInternalSettingsUtilities, "killEverything");
}

- (void)conferenceKillProcesses:(id)a3
{
  +[CNFInternalSettingsUtilities killEverything](CNFInternalSettingsUtilities, "killEverything", a3);
}

@end
