@implementation CPAssistantCellConfiguration

- (CPAssistantCellConfiguration)initWithPosition:(CPAssistantCellPosition)position visibility:(CPAssistantCellVisibility)visibility assistantAction:(CPAssistantCellActionType)assistantAction
{
  CPAssistantCellConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPAssistantCellConfiguration;
  result = -[CPAssistantCellConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_position = position;
    result->_visibility = visibility;
    result->_assistantAction = assistantAction;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CPAssistantCellConfiguration *v4;
  BOOL v5;

  v4 = (CPAssistantCellConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CPAssistantCellConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4;
  int64_t position;
  int64_t visibility;
  int64_t assistantAction;
  BOOL v8;

  v4 = a3;
  position = self->_position;
  if (position == objc_msgSend(v4, "position")
    && (visibility = self->_visibility, visibility == objc_msgSend(v4, "visibility")))
  {
    assistantAction = self->_assistantAction;
    v8 = assistantAction == objc_msgSend(v4, "assistantAction");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPAssistantCellConfiguration)initWithCoder:(id)a3
{
  id v4;
  CPAssistantCellConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPAssistantCellConfiguration;
  v5 = -[CPAssistantCellConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_position = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPAssistantCellConfigurationPositionKey"));
    v5->_visibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPAssistantCellConfigurationVisibilityKey"));
    v5->_assistantAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPAssistantCellConfigurationIntentKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAssistantCellConfiguration position](self, "position"), CFSTR("kCPAssistantCellConfigurationPositionKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAssistantCellConfiguration visibility](self, "visibility"), CFSTR("kCPAssistantCellConfigurationVisibilityKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAssistantCellConfiguration assistantAction](self, "assistantAction"), CFSTR("kCPAssistantCellConfigurationIntentKey"));

}

- (CPAssistantCellPosition)position
{
  return self->_position;
}

- (CPAssistantCellVisibility)visibility
{
  return self->_visibility;
}

- (CPAssistantCellActionType)assistantAction
{
  return self->_assistantAction;
}

@end
