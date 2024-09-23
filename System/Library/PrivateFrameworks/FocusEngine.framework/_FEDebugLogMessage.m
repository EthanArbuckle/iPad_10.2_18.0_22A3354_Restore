@implementation _FEDebugLogMessage

- (_FEDebugLogMessage)initWithString:(id)a3
{
  id v6;
  _FEDebugLogMessage *v7;
  _FEDebugLogMessage *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugLogTree.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_FEDebugLogMessage;
  v7 = -[_FEDebugLogMessage init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_string, a3);

  return v8;
}

+ (id)messageWithNewline
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", &stru_250D3AA90);
}

+ (id)messageWithString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEDebugLogTree.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v6);
  return v7;
}

+ (id)messageWithFormat:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEDebugLogTree.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v5, &v10);
  objc_msgSend(a1, "messageWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)messageWithPrefix:(id)a3 string:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEDebugLogTree.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEDebugLogTree.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

LABEL_3:
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc((Class)a1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) %@"), v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:", v13);

    v9 = (void *)v11;
  }
  else
  {
    objc_msgSend(a1, "messageWithString:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)messageWithStyle:(unint64_t)a3 string:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(a3)
  {
    case 0uLL:
      v8 = v6;
      goto LABEL_9;
    case 1uLL:
      objc_msgSend(v6, "uppercaseString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(info) %@"), v6);
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(warning) %@"), v6);
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(error) %@"), v6);
LABEL_8:
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v8;
      break;
    default:
      v9 = 0;
      break;
  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v9);

  return v10;
}

- (BOOL)_isNode
{
  return 0;
}

- (BOOL)_isTransparent
{
  return 0;
}

- (id)_stringRepresentation
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
