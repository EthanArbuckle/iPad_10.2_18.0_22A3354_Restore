@implementation BRLTBrailleBuffer

- (BRLTBrailleBuffer)init
{
  return -[BRLTBrailleBuffer initWithBrailleString:](self, "initWithBrailleString:", 0);
}

- (BRLTBrailleBuffer)initWithBrailleString:(id)a3
{
  id v4;
  BRLTBrailleBuffer *v5;
  BRLTBrailleString *v6;
  BRLTBrailleString *brailleString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTBrailleBuffer;
  v5 = -[BRLTBrailleBuffer init](&v9, sel_init);
  if (v4)
    v6 = (BRLTBrailleString *)objc_msgSend(v4, "copy");
  else
    v6 = objc_alloc_init(BRLTBrailleString);
  brailleString = v5->_brailleString;
  v5->_brailleString = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBrailleString:", self->_brailleString);
  *((_QWORD *)result + 2) = self->_cursor;
  return result;
}

- (void)insertBrailleChar:(id)a3
{
  -[BRLTBrailleBuffer insertBrailleChar:modifiers:inputMode:](self, "insertBrailleChar:modifiers:inputMode:", a3, 0, 1);
}

- (void)insertBrailleChar:(id)a3 modifiers:(id)a4 inputMode:(unint64_t)a5
{
  BRLTBrailleString *brailleString;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BRLTBrailleChar *v14;
  BRLTBrailleString *v15;
  BRLTBrailleString *v16;
  id v17;

  v17 = a3;
  brailleString = self->_brailleString;
  v9 = a4;
  -[BRLTBrailleString brailleChars](brailleString, "brailleChars");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "containsObject:", v12);

  if (v13)
  {
    if (a5 != 2)
    {
      v14 = -[BRLTBrailleChar initWithUnicode:]([BRLTBrailleChar alloc], "initWithUnicode:", CFSTR("⠠"));
      objc_msgSend(v11, "insertObject:atIndex:", v17, self->_cursor);
      objc_msgSend(v11, "insertObject:atIndex:", v14, self->_cursor++);

      goto LABEL_6;
    }
    objc_msgSend(v17, "setDot7:", 1);
  }
  objc_msgSend(v11, "insertObject:atIndex:", v17, self->_cursor);
LABEL_6:
  v15 = -[BRLTBrailleString initWithBrailleChars:]([BRLTBrailleString alloc], "initWithBrailleChars:", v11);
  v16 = self->_brailleString;
  self->_brailleString = v15;

  ++self->_cursor;
}

- (void)deleteBrailleChar
{
  void *v3;
  unint64_t cursor;
  BRLTBrailleString *v5;
  BRLTBrailleString *brailleString;
  id v7;

  -[BRLTBrailleString brailleChars](self->_brailleString, "brailleChars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    cursor = self->_cursor;
    if (cursor)
    {
      objc_msgSend(v7, "removeObjectAtIndex:", cursor - 1);
      v5 = -[BRLTBrailleString initWithBrailleChars:]([BRLTBrailleString alloc], "initWithBrailleChars:", v7);
      brailleString = self->_brailleString;
      self->_brailleString = v5;

      --self->_cursor;
    }
  }

}

- (BRLTBrailleString)brailleString
{
  return (BRLTBrailleString *)(id)-[BRLTBrailleString copy](self->_brailleString, "copy");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BRLTBrailleBuffer;
  -[BRLTBrailleBuffer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTBrailleString description](self->_brailleString, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: string<%@>, cursor<%ld>"), v4, v5, self->_cursor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)cursor
{
  return self->_cursor;
}

- (void)setCursor:(unint64_t)a3
{
  self->_cursor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleString, 0);
}

@end
