@implementation CalConferenceDeserializationResult

- (CalConferenceDeserializationResult)initWithConference:(id)a3 range:(_NSRange)a4 blockTitle:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  CalConferenceDeserializationResult *v12;
  CalConferenceDeserializationResult *v13;
  objc_super v15;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalConferenceDeserializationResult;
  v12 = -[CalConferenceDeserializationResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conference, a3);
    v13->_range.location = location;
    v13->_range.length = length;
    objc_storeStrong((id *)&v13->_blockTitle, a5);
  }

  return v13;
}

- (id)description
{
  CalDescriptionBuilder *v3;
  void *v4;
  CalDescriptionBuilder *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalConferenceDeserializationResult;
  -[CalConferenceDeserializationResult description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CalDescriptionBuilder initWithSuperclassDescription:](v3, "initWithSuperclassDescription:", v4);

  -[CalDescriptionBuilder setKey:withObject:](v5, "setKey:withObject:", CFSTR("conference"), self->_conference);
  NSStringFromRange(self->_range);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDescriptionBuilder setKey:withString:](v5, "setKey:withString:", CFSTR("range"), v6);

  -[CalDescriptionBuilder setKey:withString:](v5, "setKey:withString:", CFSTR("blockTitle"), self->_blockTitle);
  -[CalDescriptionBuilder build](v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CalConferenceDeserializationResult *v4;
  CalConferenceDeserializationResult *v5;
  CalVirtualConference *conference;
  void *v7;
  NSString *blockTitle;
  void *v9;
  uint64_t v10;
  BOOL v12;

  v4 = (CalConferenceDeserializationResult *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      conference = self->_conference;
      -[CalConferenceDeserializationResult conference](v5, "conference");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (CalEqualObjects(conference, v7))
      {
        blockTitle = self->_blockTitle;
        -[CalConferenceDeserializationResult blockTitle](v5, "blockTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (CalEqualStrings(blockTitle, v9))
          v12 = self->_range.location == -[CalConferenceDeserializationResult range](v5, "range")
             && self->_range.length == v10;
        else
          v12 = 0;

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CalVirtualConference)conference
{
  return self->_conference;
}

- (NSString)blockTitle
{
  return self->_blockTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockTitle, 0);
  objc_storeStrong((id *)&self->_conference, 0);
}

@end
