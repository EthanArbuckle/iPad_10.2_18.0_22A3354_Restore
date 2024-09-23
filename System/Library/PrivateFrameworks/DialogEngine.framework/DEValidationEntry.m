@implementation DEValidationEntry

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)textWithLineNumber
{
  return self->_textWithLineNumber;
}

- (void)setTextWithLineNumber:(id)a3
{
  objc_storeStrong((id *)&self->_textWithLineNumber, a3);
}

- (NSNumber)lineNumber
{
  return self->_lineNumber;
}

- (void)setLineNumber:(id)a3
{
  objc_storeStrong((id *)&self->_lineNumber, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_lineNumber, 0);
  objc_storeStrong((id *)&self->_textWithLineNumber, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
