@implementation MOSuggestionSheetEntriesSettingsController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[MOSuggestionSheetEntriesSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("MOSuggestionSheetEntriesSettings"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOSuggestionSheetEntriesSettingsController setSpecifiers:](self, "setSpecifiers:", v5);

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

@end
