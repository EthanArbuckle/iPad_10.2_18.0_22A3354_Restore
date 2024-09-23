@implementation AVTStickerRecentsExclusionRule

- (NSString)avatarRecordIdentifier
{
  return self->_avatarRecordIdentifier;
}

- (void)setAvatarRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecordIdentifier, a3);
}

- (NSString)stickerConfigurationIdentifier
{
  return self->_stickerConfigurationIdentifier;
}

- (void)setStickerConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfigurationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarRecordIdentifier, 0);
}

@end
