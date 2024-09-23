@implementation FAMemberCardModel

- (FAFamilyMember)member
{
  return self->_member;
}

- (void)setMember:(id)a3
{
  objc_storeStrong((id *)&self->_member, a3);
}

- (UIImage)profileImage
{
  return self->_profileImage;
}

- (void)setProfileImage:(id)a3
{
  objc_storeStrong((id *)&self->_profileImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileImage, 0);
  objc_storeStrong((id *)&self->_member, 0);
}

@end
