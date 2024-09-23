@implementation SFWebpageStatusBarInfoMessage

- (id)initWithString:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SFWebpageStatusBarInfoMessage;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (NSAttributedString)attributedMessageString
{
  return (NSAttributedString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_message);
}

- (BOOL)isEmpty
{
  return -[NSString length](self->_message, "length") == 0;
}

- (BOOL)isEqual:(id)a3
{
  SFWebpageStatusBarInfoMessage *v4;
  char v5;

  v4 = (SFWebpageStatusBarInfoMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = WBSIsEqual();
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_message, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
