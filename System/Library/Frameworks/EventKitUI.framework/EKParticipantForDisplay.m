@implementation EKParticipantForDisplay

- (NSMutableAttributedString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (BOOL)isOptionalParticipant
{
  return self->_optionalParticipant;
}

- (void)setOptionalParticipant:(BOOL)a3
{
  self->_optionalParticipant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
}

@end
