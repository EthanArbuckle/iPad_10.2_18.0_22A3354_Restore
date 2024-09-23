@implementation BMNotesContentStream

- (id)identifier
{
  return (id)objc_msgSend(MEMORY[0x1E0D01D40], "libraryPathForStreamIdentifier:", CFSTR("NotesContent"));
}

- (BMNotesContentStream)init
{
  void *v3;
  BMNotesContentStream *v4;

  -[BMNotesContentStream identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BMContentStream initWithStreamIdentifier:eventClass:](self, "initWithStreamIdentifier:eventClass:", v3, objc_opt_class());

  return v4;
}

@end
