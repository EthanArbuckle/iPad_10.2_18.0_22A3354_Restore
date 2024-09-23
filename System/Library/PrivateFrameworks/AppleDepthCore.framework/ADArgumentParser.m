@implementation ADArgumentParser

- (void)addProgramDescription:(id)a3
{
  objc_storeStrong((id *)&self->_programDescription, a3);
}

- (BOOL)parse
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ADArgumentParser parseArguments:](self, "parseArguments:", v4);

  return (char)self;
}

- (BOOL)parseStringCommand:(id)a3
{
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ADArgumentParser parseArguments:](self, "parseArguments:", v4);

  return (char)self;
}

- (BOOL)parseArguments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[ADArgumentParserCommand setDescriptionString:](self, "setDescriptionString:", self->_programDescription);
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADArgumentParserCommand setName:](self, "setName:", v6);

  if (!-[ADArgumentParserCommand verifyCommandStructure](self, "verifyCommandStructure"))
  {
    puts("found error in command tree structure. stopping");
    __assert_rtn("-[ADArgumentParser parseArguments:]", "ADArgumentParser.mm", 51, "false");
  }
  v7 = -[ADArgumentParserCommand commandParse:commandIndex:](self, "commandParse:commandIndex:", v4, 0);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programDescription, 0);
}

@end
