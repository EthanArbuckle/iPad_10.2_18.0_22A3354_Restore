@implementation NSKeyedArchiver(VCKeyedArchiverExtensions)

+ (id)newSecureArchivedDataWithRootObject:()VCKeyedArchiverExtensions
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initForWritingWithMutableData:", v4);
  objc_msgSend(v5, "setRequiresSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", a3, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v5, "finishEncoding");

  return v4;
}

@end
