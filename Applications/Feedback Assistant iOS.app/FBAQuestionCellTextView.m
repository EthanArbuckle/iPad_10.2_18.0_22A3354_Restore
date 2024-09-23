@implementation FBAQuestionCellTextView

- (BOOL)canBecomeFirstResponder
{
  return -[FBAQuestionCellTextView isUserInteractionEnabled](self, "isUserInteractionEnabled");
}

- (unint64_t)characterLimit
{
  return self->_characterLimit;
}

- (void)setCharacterLimit:(unint64_t)a3
{
  self->_characterLimit = a3;
}

@end
