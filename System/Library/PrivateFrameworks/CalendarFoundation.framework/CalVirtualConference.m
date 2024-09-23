@implementation CalVirtualConference

- (CalVirtualConference)initWithTitle:(id)a3 joinMethods:(id)a4 conferenceDetails:(id)a5 source:(unint64_t)a6 isWritable:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  CalVirtualConference *v16;
  CalVirtualConference *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CalVirtualConference;
  v16 = -[CalVirtualConference init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v17->_joinMethods, a4);
    objc_storeStrong((id *)&v17->_conferenceDetails, a5);
    v17->_source = a6;
    v17->_isWritable = a7;
  }

  return v17;
}

- (id)description
{
  CalDescriptionBuilder *v3;
  void *v4;
  CalDescriptionBuilder *v5;
  void *v6;
  objc_super v8;

  v3 = [CalDescriptionBuilder alloc];
  v8.receiver = self;
  v8.super_class = (Class)CalVirtualConference;
  -[CalVirtualConference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CalDescriptionBuilder initWithSuperclassDescription:](v3, "initWithSuperclassDescription:", v4);

  -[CalDescriptionBuilder setKey:withString:](v5, "setKey:withString:", CFSTR("title"), self->_title);
  -[CalDescriptionBuilder setKey:withArray:](v5, "setKey:withArray:", CFSTR("joinMethods"), self->_joinMethods);
  -[CalDescriptionBuilder setKey:withString:](v5, "setKey:withString:", CFSTR("conferenceDetails"), self->_conferenceDetails);
  -[CalDescriptionBuilder setKey:withEnumNumericalValue:andStringValue:](v5, "setKey:withEnumNumericalValue:andStringValue:", CFSTR("source"));
  -[CalDescriptionBuilder setKey:withBoolean:](v5, "setKey:withBoolean:", CFSTR("isWritable"), self->_isWritable);
  -[CalDescriptionBuilder build](v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CalVirtualConference *v4;
  CalVirtualConference *v5;
  NSString *title;
  void *v7;
  NSArray *joinMethods;
  void *v9;
  NSString *conferenceDetails;
  void *v11;
  unint64_t source;
  _BOOL4 isWritable;
  BOOL v14;

  v4 = (CalVirtualConference *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      -[CalVirtualConference title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (CalEqualStrings(title, v7))
      {
        joinMethods = self->_joinMethods;
        -[CalVirtualConference joinMethods](v5, "joinMethods");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (CalEqualObjects(joinMethods, v9))
        {
          conferenceDetails = self->_conferenceDetails;
          -[CalVirtualConference conferenceDetails](v5, "conferenceDetails");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (CalEqualStrings(conferenceDetails, v11)
            && (source = self->_source, source == -[CalVirtualConference source](v5, "source")))
          {
            isWritable = self->_isWritable;
            v14 = isWritable == -[CalVirtualConference isWritable](v5, "isWritable");
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)source
{
  return self->_source;
}

- (BOOL)isWritable
{
  return self->_isWritable;
}

- (NSArray)joinMethods
{
  return self->_joinMethods;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)conferenceDetails
{
  return self->_conferenceDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_joinMethods, 0);
}

@end
