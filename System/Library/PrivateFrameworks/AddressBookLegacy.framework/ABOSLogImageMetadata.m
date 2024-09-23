@implementation ABOSLogImageMetadata

os_log_t __ABOSLogImageMetadata_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.contacts.AddressBookLegacy", "image-metadata");
  ABOSLogImageMetadata_imageMetadataLog = (uint64_t)result;
  return result;
}

@end
