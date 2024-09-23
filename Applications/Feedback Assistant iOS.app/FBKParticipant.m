@implementation FBKParticipant

- (UIImage)contactImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBKParticipant emailAddress](self, "emailAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBAAvatarHelper contactImageForEmailAddress:](_TtC18Feedback_Assistant15FBAAvatarHelper, "contactImageForEmailAddress:", v3));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBKParticipant givenName](self, "givenName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBKParticipant familyName](self, "familyName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBAAvatarHelper monogramAvatarImageForPreferredName:familyName:](_TtC18Feedback_Assistant15FBAAvatarHelper, "monogramAvatarImageForPreferredName:familyName:", v5, v6));

  }
  return (UIImage *)v4;
}

@end
