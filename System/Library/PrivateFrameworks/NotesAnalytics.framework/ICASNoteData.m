@implementation ICASNoteData

- (ICASNoteData)initWithNoteID:(id)a3 noteType:(id)a4 isScrapPaper:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICASNoteData *v12;
  ICASNoteData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASNoteData;
  v12 = -[ICASNoteData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_noteID, a3);
    objc_storeStrong((id *)&v13->_noteType, a4);
    objc_storeStrong((id *)&v13->_isScrapPaper, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("NoteData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("noteID");
  -[ICASNoteData noteID](self, "noteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASNoteData noteID](self, "noteID");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = CFSTR("noteType");
  -[ICASNoteData noteType](self, "noteType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASNoteData noteType](self, "noteType");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = CFSTR("isScrapPaper");
  -[ICASNoteData isScrapPaper](self, "isScrapPaper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASNoteData isScrapPaper](self, "isScrapPaper");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)noteID
{
  return self->_noteID;
}

- (ICASNoteType)noteType
{
  return self->_noteType;
}

- (NSNumber)isScrapPaper
{
  return self->_isScrapPaper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isScrapPaper, 0);
  objc_storeStrong((id *)&self->_noteType, 0);
  objc_storeStrong((id *)&self->_noteID, 0);
}

@end
