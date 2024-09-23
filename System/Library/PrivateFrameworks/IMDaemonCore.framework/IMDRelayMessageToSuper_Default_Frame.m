@implementation IMDRelayMessageToSuper_Default_Frame

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = (void *)MEMORY[0x1E0CB3500];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "newlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByRemovingCharactersFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)IMDRelayMessageToSuper_Default_Frame;
  -[IMToSuperParserFrame parser:context:foundCharacters:](&v14, sel_parser_context_foundCharacters_, v11, v10, v13);

}

@end
