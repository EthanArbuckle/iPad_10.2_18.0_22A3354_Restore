@implementation _MKTokenAttributedString

- (void)setAttributedString:(id)a3
{
  NSAttributedString *v4;
  NSString *string;
  NSAttributedString *attributedString;

  v4 = (NSAttributedString *)a3;
  string = self->_string;
  self->_string = 0;

  attributedString = self->_attributedString;
  self->_attributedString = v4;

}

- (void)setString:(id)a3
{
  NSAttributedString *attributedString;
  id v6;

  objc_storeStrong((id *)&self->_string, a3);
  v6 = a3;
  attributedString = self->_attributedString;
  self->_attributedString = 0;

}

- (BOOL)isEmpty
{
  return !-[NSString length](self->_string, "length")
      && -[NSAttributedString length](self->_attributedString, "length") == 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), self->_string, self->_attributedString);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
