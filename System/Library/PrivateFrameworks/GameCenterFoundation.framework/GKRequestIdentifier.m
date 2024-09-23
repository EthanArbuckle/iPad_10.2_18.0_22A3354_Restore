@implementation GKRequestIdentifier

- (id)_argumentsForInvocation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t i;
  int v9;
  uint64_t v10;
  double v11;
  void *v12;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "methodSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfArguments");
  v6 = v5 - objc_msgSend(v3, "_gkHasReplyBlock");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  if (v6 >= 3)
  {
    for (i = 2; i != v6; ++i)
    {
      v9 = *(char *)objc_msgSend(objc_retainAutorelease(v4), "getArgumentTypeAtIndex:", i);
      if (v9 > 80)
      {
        switch(v9)
        {
          case 'c':
LABEL_9:
            LOBYTE(v14) = 0;
            objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v14);
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          case 'd':
            v14 = 0;
            objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v14);
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_18;
          case 'f':
            LODWORD(v14) = 0;
            objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
            LODWORD(v11) = (_DWORD)v14;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          case 'i':
          case 'l':
LABEL_12:
            LODWORD(v14) = 0;
            objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          case 'q':
            goto LABEL_16;
          case 's':
            goto LABEL_15;
          default:
            if (v9 == 81)
            {
LABEL_16:
              v14 = 0;
              objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
              v10 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v9 != 83)
              {
LABEL_18:

                v7 = 0;
                continue;
              }
LABEL_15:
              LOWORD(v14) = 0;
              objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v14);
              v10 = objc_claimAutoreleasedReturnValue();
            }
LABEL_21:
            v12 = (void *)v10;
            objc_msgSend(v7, "addObject:", v10);

            break;
        }
      }
      else
      {
        switch(v9)
        {
          case '@':
            v14 = 0;
            objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
            if (!v14)
              v14 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
            objc_msgSend(v7, "addObject:");
            break;
          case 'A':
          case 'D':
          case 'E':
          case 'F':
          case 'G':
          case 'H':
            goto LABEL_18;
          case 'B':
            LOBYTE(v14) = 0;
            objc_msgSend(v3, "getArgument:atIndex:", &v14, i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          case 'C':
            goto LABEL_9;
          case 'I':
            goto LABEL_12;
          default:
            if (v9 == 33 || v9 == 76)
              goto LABEL_12;
            goto LABEL_18;
        }
      }
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
}

+ (id)requestIdentifierForInvocation:(id)a3
{
  id v3;
  GKRequestIdentifier *v4;

  v3 = a3;
  v4 = -[GKRequestIdentifier initWithInvocation:]([GKRequestIdentifier alloc], "initWithInvocation:", v3);

  return v4;
}

- (GKRequestIdentifier)initWithInvocation:(id)a3
{
  id v4;
  GKRequestIdentifier *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  NSArray *arguments;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKRequestIdentifier;
  v5 = -[GKRequestIdentifier init](&v11, sel_init);
  if (v5)
  {
    v6 = (const char *)objc_msgSend(v4, "selector");
    v5->_selector = v6;
    NSStringFromSelector(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_savedHash = objc_msgSend(v7, "hash");

    -[GKRequestIdentifier _argumentsForInvocation:](v5, "_argumentsForInvocation:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[GKRequestIdentifier hash](self, "hash");
    if (v6 == objc_msgSend(v5, "hash") && sel_isEqual(self->_selector, *((SEL *)v5 + 2)))
      v7 = -[NSArray isEqual:](self->_arguments, "isEqual:", *((_QWORD *)v5 + 3));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_savedHash;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GKRequestIdentifier *v4;
  SEL selector;

  v4 = -[GKRequestIdentifier init](+[GKRequestIdentifier allocWithZone:](GKRequestIdentifier, "allocWithZone:", a3), "init");
  selector = self->_selector;
  v4->_savedHash = self->_savedHash;
  v4->_selector = selector;
  objc_storeStrong((id *)&v4->_arguments, self->_arguments);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GKRequestIdentifier;
  -[GKRequestIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(self->_selector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ %@"), v4, v5, self->_arguments);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)savedHash
{
  return self->_savedHash;
}

- (void)setSavedHash:(unint64_t)a3
{
  self->_savedHash = a3;
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->_arguments, a3);
}

@end
